param(
    [string]$CuePath,
    [string]$BiosPath,
    [string]$Mingw,
    [switch]$InstallDependencies,
    [switch]$NoInstallDependencies,
    [ValidateRange(1, 64)]
    [int]$BuildJobs = [Math]::Min(4, [Math]::Max(1, [Environment]::ProcessorCount))
)

$ErrorActionPreference = "Stop"
$env:PYTHONUTF8 = "1"
$Kit = [IO.Path]::GetFullPath($PSScriptRoot)
$ManifestPath = Join-Path $Kit "setup-manifest.json"
$SdkManifestPath = Join-Path $Kit "sdk-manifest.json"
$Manifest = Get-Content -Raw -LiteralPath $ManifestPath | ConvertFrom-Json
$Sdk = Get-Content -Raw -LiteralPath $SdkManifestPath | ConvertFrom-Json
$Framework = Join-Path $Kit "psxrecomp-src"
$RecompUi = Join-Path $Kit "recomp-ui"
$InputDir = Join-Path $Kit "input"
$GeneratedDir = Join-Path $Kit "generated"
$Codegen = Join-Path $Kit "psxrecomp-cli"
$BuildDir = Join-Path $Kit "out\release"
$ToolchainDir = Join-Path $Kit "toolchain"
$SetupLog = Join-Path $Kit "setup.log"
$TranscriptStarted = $false
$SharedToolchainBase = Join-Path $env:PUBLIC "Documents\PSXRecomp\owned-input-toolchains"
$WinLibsDestination = if ((Join-Path $ToolchainDir "winlibs") -match '\s') {
    Join-Path $SharedToolchainBase "winlibs-$($Sdk.winlibs.sha256.Substring(0, 12).ToLowerInvariant())"
} else {
    Join-Path $ToolchainDir "winlibs"
}

function Get-Sha256([string]$Path) {
    $stream = [IO.File]::OpenRead($Path)
    try {
        $hasher = [Security.Cryptography.SHA256]::Create()
        try { return ([BitConverter]::ToString($hasher.ComputeHash($stream)) -replace "-", "").ToUpperInvariant() }
        finally { $hasher.Dispose() }
    } finally { $stream.Dispose() }
}

function Assert-KitPath([string]$Path) {
    $full = [IO.Path]::GetFullPath($Path)
    $prefix = $Kit.TrimEnd('\') + '\'
    if (-not $full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "refusing to modify a path outside this extracted kit: $full"
    }
    return $full
}

function Assert-ManagedPath([string]$Path, [string]$Root) {
    $full = [IO.Path]::GetFullPath($Path)
    $rootFull = [IO.Path]::GetFullPath($Root).TrimEnd('\')
    $prefix = $rootFull + '\'
    if (-not $full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "refusing to modify a path outside the managed root ${rootFull}: $full"
    }
    return $full
}

function Find-App([string]$Name, [string[]]$Candidates = @()) {
    $command = Get-Command $Name -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($command) { return $command.Source }
    foreach ($candidate in $Candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate -PathType Leaf)) { return $candidate }
    }
    return $null
}

function Select-InputFile([string]$Title, [string]$Filter) {
    Add-Type -AssemblyName System.Windows.Forms
    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Title = $Title
    $dialog.Filter = $Filter
    $dialog.CheckFileExists = $true
    if ($dialog.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) {
        throw "setup cancelled while selecting $Title"
    }
    return $dialog.FileName
}

function Resolve-Cue {
    if ($CuePath) { return (Resolve-Path -LiteralPath $CuePath).Path }
    $cues = @(Get-ChildItem -LiteralPath $Kit -File -Filter "*.cue")
    if ($cues.Count -eq 1) { return $cues[0].FullName }
    return Select-InputFile "Select $($Manifest.title) Disc 1 CUE" "CUE sheets (*.cue)|*.cue"
}

function Resolve-Bios {
    if ($BiosPath) { return (Resolve-Path -LiteralPath $BiosPath).Path }
    $expectedName = "$($Manifest.bios_stem).BIN"
    $beside = Join-Path $Kit $expectedName
    if (Test-Path -LiteralPath $beside -PathType Leaf) { return $beside }
    return Select-InputFile "Select your $($Manifest.bios_label) BIOS dump" "PlayStation BIOS (*.bin;*.rom)|*.bin;*.rom|All files (*.*)|*.*"
}

function Install-Artifact($Artifact, [string]$Destination, [string]$AllowedRoot = "") {
    if ($AllowedRoot) { $Destination = Assert-ManagedPath $Destination $AllowedRoot }
    else { $Destination = Assert-KitPath $Destination }
    $receipt = Join-Path $Destination ".owned-input-artifact-sha256"
    if ((Test-Path -LiteralPath $receipt -PathType Leaf) -and
        ((Get-Content -Raw -LiteralPath $receipt).Trim().ToUpperInvariant() -eq $Artifact.sha256.ToUpperInvariant())) {
        foreach ($required in $Artifact.required) {
            if (-not (Test-Path -LiteralPath (Join-Path $Destination $required))) { $receipt = $null; break }
        }
        if ($receipt) { Write-Host "$($Artifact.label) already verified." -ForegroundColor Green; return }
    }

    $cacheRoot = Join-Path $env:LOCALAPPDATA "psxrecomp\owned-input-cache\v0.2.3"
    New-Item -ItemType Directory -Force $cacheRoot | Out-Null
    $archive = Join-Path $cacheRoot $Artifact.archive
    $localArtifact = $null
    if ($env:PSXRECOMP_ARTIFACT_DIR) {
        $candidate = Join-Path $env:PSXRECOMP_ARTIFACT_DIR $Artifact.archive
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { $localArtifact = $candidate }
    }
    if (-not (Test-Path -LiteralPath $archive -PathType Leaf) -or
        (Get-Sha256 $archive) -ne $Artifact.sha256.ToUpperInvariant()) {
        $partial = "$archive.part-$PID"
        if ($localArtifact) {
            Copy-Item -LiteralPath $localArtifact -Destination $partial
            Write-Host "Using local test artifact for $($Artifact.label)..." -ForegroundColor Cyan
        } else {
            $curl = Find-App "curl.exe" @("$env:SystemRoot\System32\curl.exe")
            if (-not $curl) { throw "Windows curl.exe is required" }
            Write-Host "Downloading pinned $($Artifact.label)..." -ForegroundColor Cyan
            & $curl --fail --location --retry 3 --connect-timeout 30 --max-time 1800 --output $partial $Artifact.url
            if ($LASTEXITCODE -ne 0) { throw "$($Artifact.label) download failed" }
        }
        $actual = Get-Sha256 $partial
        if ($actual -ne $Artifact.sha256.ToUpperInvariant()) {
            $cachePrefix = [IO.Path]::GetFullPath($cacheRoot).TrimEnd('\') + '\'
            $partialFull = [IO.Path]::GetFullPath($partial)
            if ($partialFull.StartsWith($cachePrefix, [StringComparison]::OrdinalIgnoreCase)) {
                Remove-Item -LiteralPath $partialFull -Force -ErrorAction SilentlyContinue
            }
            throw "$($Artifact.label) SHA-256 mismatch: expected $($Artifact.sha256), got $actual"
        }
        Move-Item -LiteralPath $partial -Destination $archive -Force
    }

    $extract = if ($AllowedRoot) {
        Assert-ManagedPath "$Destination.extracting-$PID" $AllowedRoot
    } else {
        Assert-KitPath "$Destination.extracting-$PID"
    }
    if (Test-Path -LiteralPath $extract) { Remove-Item -LiteralPath $extract -Recurse -Force }
    New-Item -ItemType Directory -Force $extract | Out-Null
    if ($Artifact.archive.EndsWith(".zip", [StringComparison]::OrdinalIgnoreCase)) {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [IO.Compression.ZipFile]::ExtractToDirectory($archive, $extract)
    } else {
        $tar = Find-App "tar.exe" @("$env:SystemRoot\System32\tar.exe")
        if (-not $tar) { throw "Windows tar.exe is required for $($Artifact.archive)" }
        & $tar -xf $archive -C $extract
        if ($LASTEXITCODE -ne 0) { throw "$($Artifact.label) extraction failed" }
    }
    $source = if ($Artifact.archive_root) { Join-Path $extract $Artifact.archive_root } else { $extract }
    foreach ($required in $Artifact.required) {
        if (-not (Test-Path -LiteralPath (Join-Path $source $required))) {
            throw "$($Artifact.label) archive is missing $required"
        }
    }
    if (Test-Path -LiteralPath $Destination) {
        $backup = "$Destination.previous-$([DateTime]::UtcNow.ToString('yyyyMMddHHmmss'))"
        Move-Item -LiteralPath $Destination -Destination $backup
    }
    Move-Item -LiteralPath $source -Destination $Destination
    if (Test-Path -LiteralPath $extract) { Remove-Item -LiteralPath $extract -Recurse -Force }
    [IO.File]::WriteAllText((Join-Path $Destination ".owned-input-artifact-sha256"), $Artifact.sha256, [Text.Encoding]::ASCII)
    Write-Host "Verified $($Artifact.label): $($Artifact.sha256)" -ForegroundColor Green
}

function Find-Toolchain {
    $roots = @()
    if ($Mingw) {
        $requested = [IO.Path]::GetFullPath($Mingw)
        if ($requested -match '\s') {
            Write-Host "Ignoring -Mingw path containing spaces; WinLibs cannot link reliably from that location." -ForegroundColor Yellow
        } else {
            $roots += $requested
        }
    }
    $roots += Join-Path $WinLibsDestination "mingw64"
    foreach ($root in $roots) {
        $gcc = Join-Path $root "bin\gcc.exe"
        $gxx = Join-Path $root "bin\g++.exe"
        $ninja = Join-Path $root "bin\ninja.exe"
        $cmake = Join-Path $root "bin\cmake.exe"
        if ((Test-Path $gcc) -and (Test-Path $gxx) -and (Test-Path $ninja) -and (Test-Path $cmake)) {
            return [pscustomobject]@{ Root=$root; Gcc=$gcc; Gxx=$gxx; Ninja=$ninja; CMake=$cmake }
        }
    }
    return $null
}

try {
    Start-Transcript -LiteralPath $SetupLog -Append | Out-Null
    $TranscriptStarted = $true
    Write-Host "$($Manifest.title) Recompiled $($Manifest.release) owned-input setup" -ForegroundColor Cyan
    Write-Host "No game code, retail BIOS code, retail BIOS ROM, or playable title EXE was shipped in this kit."

    $Cue = Resolve-Cue
    $Bios = Resolve-Bios
    if ((Get-Sha256 $Bios) -ne $Manifest.bios_sha256.ToUpperInvariant()) {
        throw "wrong BIOS dump: this build requires $($Manifest.bios_label), SHA-256 $($Manifest.bios_sha256)"
    }
    Write-Host "Verified retail BIOS SHA-256: $($Manifest.bios_sha256)" -ForegroundColor Green

    Write-Host "== 1/7 install pinned build inputs =="
    Install-Artifact $Sdk.codegen $Codegen
    Install-Artifact $Sdk.framework $Framework
    Install-Artifact $Sdk.ui $RecompUi
    Install-Artifact $Sdk.rbengine (Join-Path $Framework "lib\retcomm-rbengine")
    Install-Artifact $Sdk.sdl (Join-Path $ToolchainDir "sdl")
    Install-Artifact $Sdk.libchdr (Join-Path $ToolchainDir "libchdr")
    $tools = Find-Toolchain
    if (-not $tools) {
        if ($NoInstallDependencies) { throw "MinGW-w64 GCC/CMake/Ninja not found" }
        if ($WinLibsDestination -match '\s') {
            throw "cannot find a writable space-free compiler location; extract this kit under a path without spaces"
        }
        if ($WinLibsDestination.StartsWith(([IO.Path]::GetFullPath($SharedToolchainBase).TrimEnd('\') + '\'), [StringComparison]::OrdinalIgnoreCase)) {
            New-Item -ItemType Directory -Force $SharedToolchainBase | Out-Null
            Install-Artifact $Sdk.winlibs $WinLibsDestination $SharedToolchainBase
            Write-Host "Installed verified WinLibs outside the spaced kit path: $WinLibsDestination" -ForegroundColor Cyan
        } else {
            Install-Artifact $Sdk.winlibs $WinLibsDestination
        }
        $tools = Find-Toolchain
    }
    if (-not $tools) { throw "verified WinLibs toolchain is incomplete" }
    $python = Find-App "python.exe"
    if (-not $python -or $InstallDependencies) {
        Install-Artifact $Sdk.python (Join-Path $ToolchainDir "python")
        $python = Join-Path $ToolchainDir "python\python.exe"
    }
    if (-not (Test-Path -LiteralPath $python -PathType Leaf)) { throw "Python 3 is unavailable" }

    if ((Test-Path (Join-Path $Framework "bios\openbios.bin")) -or
        (Get-ChildItem -LiteralPath (Join-Path $Framework "generated") -Filter "OpenBIOS_*" -ErrorAction SilentlyContinue)) {
        throw "SDK safety gate failed: OpenBIOS content is present"
    }

    Write-Host "== 2/7 extract and verify the supported disc executable =="
    New-Item -ItemType Directory -Force $InputDir | Out-Null
    & $python (Join-Path $Kit "extract_boot_exe.py") $ManifestPath $Cue $InputDir
    if ($LASTEXITCODE -ne 0) { throw "disc executable verification failed" }

    Write-Host "== 3/7 derive title seed addresses locally =="
    $tomlTool = Join-Path $Codegen "libexec\psxrecomp-toml.exe"
    & $tomlTool (Join-Path $InputDir $Manifest.boot_path) --seeds (Join-Path $Kit "seeds.txt") --include-after-return --stdout | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "seed generation failed" }

    Write-Host "== 4/7 generate the verified retail-BIOS backend locally =="
    $localSeedDir = Join-Path $Kit "recompiler\seeds"
    New-Item -ItemType Directory -Force $localSeedDir | Out-Null
    $biosSeedName = if ($Manifest.bios_stem -eq "SCPH5552") { "phase2_ghidra_seeds_SCPH5552.json" } else { "phase2_ghidra_seeds.json" }
    Copy-Item -LiteralPath (Join-Path $Framework "recompiler\seeds\$biosSeedName") -Destination $localSeedDir -Force
    $biosTool = Join-Path $Codegen "libexec\psxrecomp-bios.exe"
    $biosGenerated = Join-Path $Framework "generated"
    New-Item -ItemType Directory -Force $biosGenerated | Out-Null
    & $biosTool --config (Join-Path $Framework "bios\$($Manifest.bios_stem).toml") --rom $Bios --out-dir $biosGenerated
    if ($LASTEXITCODE -ne 0) { throw "retail BIOS generation failed" }
    if (-not (Test-Path (Join-Path $Framework "generated\$($Manifest.bios_stem)_dispatch.c"))) {
        throw "retail BIOS backend was not generated"
    }

    Write-Host "== 5/7 generate title code locally =="
    $gameTool = Join-Path $Codegen "libexec\psxrecomp-game.exe"
    Push-Location $Kit
    try { & $gameTool --config game.toml }
    finally { Pop-Location }
    if ($LASTEXITCODE -ne 0) { throw "title code generation failed" }

    Write-Host "== 6/7 build the golden native runtime =="
    $cachePath = Join-Path $BuildDir "CMakeCache.txt"
    if (Test-Path -LiteralPath $cachePath -PathType Leaf) {
        $cachedCompiler = Select-String -LiteralPath $cachePath -Pattern '^CMAKE_C_COMPILER:FILEPATH=(.+)$' | Select-Object -First 1
        $compilerChanged = $false
        if ($cachedCompiler) {
            $cachedCompilerPath = [IO.Path]::GetFullPath($cachedCompiler.Matches[0].Groups[1].Value.Replace('/', '\'))
            $activeCompilerPath = [IO.Path]::GetFullPath($tools.Gcc)
            $compilerChanged = -not $cachedCompilerPath.Equals($activeCompilerPath, [StringComparison]::OrdinalIgnoreCase)
        }
        if ($compilerChanged) {
            $backup = "$BuildDir.previous-$([DateTime]::UtcNow.ToString('yyyyMMddHHmmss'))"
            Move-Item -LiteralPath $BuildDir -Destination $backup
            Write-Host "Preserved the previous CMake attempt at $backup" -ForegroundColor Yellow
        }
    }
    & $tools.CMake -S $Kit -B $BuildDir -G Ninja `
        -DCMAKE_BUILD_TYPE=Release `
        "-DCMAKE_C_COMPILER=$($tools.Gcc -replace '\\','/')" `
        "-DCMAKE_CXX_COMPILER=$($tools.Gxx -replace '\\','/')" `
        "-DCMAKE_MAKE_PROGRAM=$($tools.Ninja -replace '\\','/')" `
        "-DFETCHCONTENT_SOURCE_DIR_SDL3=$((Join-Path $ToolchainDir 'sdl') -replace '\\','/')" `
        "-DFETCHCONTENT_SOURCE_DIR_PSX_LIBCHDR=$((Join-Path $ToolchainDir 'libchdr') -replace '\\','/')" `
        -DCMAKE_DISABLE_FIND_PACKAGE_SDL3=TRUE `
        "-DPSX_PYTHON=$($python -replace '\\','/')" `
        -DPSX_DEBUG_TOOLS=OFF -DPSX_RECOMP_UI=ON -DPSX_REWIND=ON
    if ($LASTEXITCODE -ne 0) { throw "runtime configuration failed" }
    & $tools.CMake --build $BuildDir --target psx-runtime --parallel $BuildJobs
    if ($LASTEXITCODE -ne 0) { throw "runtime build failed" }

    Write-Host "== 7/7 stage configuration and launcher =="
    foreach ($name in @("settings.toml", "keybinds.ini", "input.ini")) {
        $source = Join-Path $Kit $name
        if (Test-Path -LiteralPath $source) { Copy-Item -LiteralPath $source -Destination $BuildDir -Force }
    }
    $saves = Join-Path $BuildDir "user-data\cards"
    New-Item -ItemType Directory -Force $saves | Out-Null
    $exe = Join-Path $BuildDir "$($Manifest.exe_basename).exe"
    if (-not (Test-Path -LiteralPath $exe -PathType Leaf)) { throw "built executable missing: $exe" }
    $launcher = @"
@echo off
cd /d "$BuildDir"
start "$($Manifest.title) Recompiled" "$exe" --game "$Kit\game.toml" --disc "$Cue" --memcard-dir "$saves" --launcher
"@ -replace "`r?`n", "`r`n"
    [IO.File]::WriteAllText((Join-Path $Kit "PLAY.bat"), $launcher, [Text.Encoding]::ASCII)
    Write-Host "Setup complete. Run PLAY.bat." -ForegroundColor Green
} catch {
    Write-Host "SETUP FAILED: $($_.Exception.Message)" -ForegroundColor Red
    if ($TranscriptStarted) { Stop-Transcript | Out-Null }
    exit 1
}

if ($TranscriptStarted) { Stop-Transcript | Out-Null }
exit 0
