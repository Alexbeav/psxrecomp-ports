# Diablo Recompiled v0.3.4 owned-input kit

This PSXRecomp build recipe ships no game executable, game code, disc data, retail BIOS, or generated retail-BIOS code. You must own the supported disc and the matching SCPH-1001 BIOS dump.

Supported original: **USA, SLUS-00619 (English, French, German, Swedish)**  
Local players: **2**  
Required BIOS SHA-256: **71AF94D1E47A68C11E8FDB9F8368040601514A42A5A399CDA48C7D3BFF1E99D3**

1. Extract the ZIP to a normal writable folder such as `Documents\PSXRecomp`.
2. Double-click `SETUP.bat`.
3. Select Disc 1's CUE and your matching retail BIOS.
4. Setup makes sure that both inputs match the supported revision.
5. Setup downloads hash-pinned open-source build dependencies.
6. Setup generates proprietary code only on your computer and builds the playable executable locally.
7. Run `PLAY.bat` after setup finishes.

The first build can take several minutes. Performance has not been profiled. Windows can show an Unknown publisher SmartScreen warning because the local executable is unsigned. Use **More info > Run anyway** only after this kit's checksums match.

OpenBIOS is not included or accepted. Delete or redact `setup.log`, `settings.toml`, and runtime report files before you post an issue. These files can contain paths from your computer.

The package supports only the named USA disc revision. The Europe `SLES-01156` package remains available in release `v0.2.3`.

## About this project

These ports are developed by a hobbyist (a DevSecOps engineer, not a game programmer) with substantial AI assistance. Each change gets a named test before release. AI writes most of the code. The evidence process decides which changes remain.
