<p align="center">
  <img src="docs/assets/alexbeav-ps1-recomps-banner.png" alt="Alexbeav's PS1 Recomps — unofficial noncommercial recompilation build kits" width="100%">
</p>

# PSXRecomp Ports

Unofficial, noncommercial PlayStation recompilation releases for Windows.

These are deliberately **bare recompilations**. They do not include per-game
enhancements: no widescreen patches, replacement renderers, texture packs,
mouselook, wheel/HOTAS support, or similar showcase work. They provide the
original game through the standard facilities already supplied by PSXRecomp.

Performance has **not** been formally profiled. No minimum specification,
locked-frame-rate, or laptop-performance claim is being made yet.

## What you supply

Each download is an **owned-input build kit**, not a playable executable. The
kit contains no disc data, retail BIOS, generated game code, generated retail-
BIOS code, or prebuilt title executable. You provide dumps of the matching
original disc from material you own. Wave 1 `v0.2.3` kits require the requested
retail BIOS. Wave 2 `v0.3.0`, `v0.3.3`, and `v0.3.4` kits recommend
a supported retail SCPH BIOS that matches the game's region and include the
approved MIT-licensed OpenBIOS fallback. The kit generates the title on your PC.

1. Download and extract one kit to a normal writable folder such as
   `Documents\PSXRecomp` (not `Program Files`).
2. Double-click `SETUP.bat` and select Disc 1's CUE plus the requested BIOS.
3. Wait while the hash-pinned tools are downloaded and the executable is built
   locally. The first setup can take several minutes.
4. Run `PLAY.bat`. In the launcher, assign keyboard or a detected gamepad to
   each visible player card, then choose **Play**.

Windows may display an **Unknown publisher** SmartScreen warning for the locally
built executable. After verifying the download, choose **More info → Run
anyway** if you wish to continue. To verify a kit manually, run
`certutil -hashfile <download.zip> SHA256` and compare it with the adjacent
`.sha256` file or the release-wide `SHA256SUMS.txt`.

## Wave 2 Windows games

Wave 2 has 26 Windows x64 source-only setup packages. Each title has its own
public source repository and release. Twenty-three titles use `v0.3.3`.
Destruction Derby 2, Die Hard Trilogy, and King's Field use `v0.3.4`. The
first 24 packages correct the setup executable-name mapping and preserve the
older `v0.3.0` releases. The
[first Wave 2 manifest](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.3.0/RELEASE-MANIFEST.json)
still records the original `v0.3.0` source and package identities. Each
title release page records its exact corrected manifest identity.
Parasite Eve's ZIP SHA-256 is
`DE21AC35D86E6D1A22BD442A7ED866F9C7342AA2202262F20C6F8891077588DD`.
Alone in the Dark's ZIP SHA-256 is
`4760D2D9616A51ECE5421B3F952257ED0501803B27787705D3549D5AEA111AD4`.
Linux and macOS assets are not published for these two titles.

## v0.2.3 owned-input games

These links point to the owned-input kits in release `v0.2.3`.

`v0.2.3` stages the pinned `libchdr` source before CMake starts. This removes
the undeclared certificate-bundle dependency that blocked setup on clean
Windows 10 and Windows 11 systems.

`v0.2.1` was withdrawn after a clean-machine run exposed failures when a kit
was extracted below a Windows path containing spaces. `v0.2.2` relocates the
pinned compiler to a shared space-free cache, uses reliable ZIP extraction,
and omits the optional embedded Windows icon that triggered the remaining
resource-compiler failure.

<!-- BEGIN GENERATED GAME CATALOG -->
Use the [sortable game catalog](https://alexbeav.github.io/psxrecomp-ports/) to sort by title, region, BIOS, or player count. Select a title there to see screenshots, known issues, and shipped enhancements.

| Title | Region | Supported original | BIOS | Players | Releases |
| --- | --- | --- | --- | ---: | --- |
| [Ace Combat 3: Electrosphere (Japan)](https://alexbeav.github.io/psxrecomp-ports/#ace-combat-3-electrosphere) | Japan | `SLPS-02020 · SLPS-02021 · 2 discs` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/ace-combat-3-electrosphere-recomp/releases/download/v0.3.3/Ace-Combat-3-Electrosphere-Japan-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/ace-combat-3-electrosphere-recomp) |
| [Ace Combat 3: Electrosphere (USA)](https://alexbeav.github.io/psxrecomp-ports/#ace-combat-3-electrosphere-usa) | USA | `SLUS-00972` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/ace-combat-3-electrosphere-usa-recomp/releases/download/v0.3.3/Ace-Combat-3-Electrosphere-USA-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/ace-combat-3-electrosphere-usa-recomp) |
| [Alien Resurrection](https://alexbeav.github.io/psxrecomp-ports/#alien-resurrection) | Europe | `SLES-02913` | `SCPH-5552` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-alien-resurrection-europe-v0.2.3-owned-input-win64.zip) |
| [Alone in the Dark: The New Nightmare](https://alexbeav.github.io/psxrecomp-ports/#alone-in-the-dark-the-new-nightmare) | Europe | `SLES-02801 · SLES-12801 · 2 discs` | `SCPH-5552` | 1 player | [Windows](https://github.com/Alexbeav/alone-in-the-dark-the-new-nightmare-recomp/releases/download/v0.3.3/Alone-in-the-Dark-The-New-Nightmare-Recompiled-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/alone-in-the-dark-the-new-nightmare-recomp) |
| [Alundra](https://alexbeav.github.io/psxrecomp-ports/#alundra) | Europe | `SLES-01135` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/alundra-recomp/releases/download/v0.3.3/Alundra-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/alundra-recomp) |
| [Ape Escape](https://alexbeav.github.io/psxrecomp-ports/#ape-escape) | USA | `SCUS-94423` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/ape-escape-recomp/releases/download/v0.3.3/Ape-Escape-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/ape-escape-recomp) |
| [Armored Core](https://alexbeav.github.io/psxrecomp-ports/#armored-core) | Europe | `SCES-00842` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/armored-core-recomp/releases/download/v0.3.3/Armored-Core-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/armored-core-recomp) |
| [Blood Omen: Legacy of Kain](https://alexbeav.github.io/psxrecomp-ports/#blood-omen-legacy-of-kain) | USA | `SLUS-00027` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/blood-omen-legacy-of-kain-recomp/releases/download/v0.3.3/Blood-Omen-Legacy-of-Kain-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/blood-omen-legacy-of-kain-recomp) |
| [Bloody Roar II](https://alexbeav.github.io/psxrecomp-ports/#bloody-roar-ii) | USA | `SCUS-94424` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-bloody-roar-ii-usa-v0.2.3-owned-input-win64.zip) |
| [Brave Fencer Musashi](https://alexbeav.github.io/psxrecomp-ports/#brave-fencer-musashi) | USA | `SLUS-00726` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-brave-fencer-musashi-usa-v0.2.3-owned-input-win64.zip) |
| [Colin McRae Rally 2.0](https://alexbeav.github.io/psxrecomp-ports/#colin-mcrae-rally-2-0) | USA | `SLUS-01222` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/colin-mcrae-rally-2-0-recomp/releases/download/v0.3.3/Colin-McRae-Rally-2-0-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/colin-mcrae-rally-2-0-recomp) |
| [Destruction Derby 2](https://alexbeav.github.io/psxrecomp-ports/#destruction-derby-2) | USA | `SCUS-94350` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/destruction-derby-2-recomp/releases/download/v0.3.4/Destruction-Derby-2-Recomp-0.3.4-windows-x64.zip) · [Repository](https://github.com/Alexbeav/destruction-derby-2-recomp) |
| [Diablo](https://alexbeav.github.io/psxrecomp-ports/#diablo) | Europe (Spanish/Portuguese) | `SLES-01156` | `SCPH-5552` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-diablo-europe-v0.2.3-owned-input-win64.zip) |
| [Die Hard Trilogy](https://alexbeav.github.io/psxrecomp-ports/#die-hard-trilogy) | USA | `SLUS-00119` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/die-hard-trilogy-recomp/releases/download/v0.3.4/Die-Hard-Trilogy-Recomp-0.3.4-windows-x64.zip) · [Repository](https://github.com/Alexbeav/die-hard-trilogy-recomp) |
| [Digimon World 2003](https://alexbeav.github.io/psxrecomp-ports/#digimon-world-2003) | Europe | `SLES-03936` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/digimon-world-2003-recomp/releases/download/v0.3.3/Digimon-World-2003-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/digimon-world-2003-recomp) |
| [Driver](https://alexbeav.github.io/psxrecomp-ports/#driver) | USA | `SLUS-00842` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/driver-recomp/releases/download/v0.3.3/Driver-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/driver-recomp) |
| [Duke Nukem: Land of the Babes](https://alexbeav.github.io/psxrecomp-ports/#duke-nukem-land-of-the-babes) | USA | `SLUS-01002` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/duke-nukem-land-of-the-babes-recomp/releases/download/v0.3.3/Duke-Nukem-Land-of-the-Babes-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/duke-nukem-land-of-the-babes-recomp) |
| [Duke Nukem: Time to Kill](https://alexbeav.github.io/psxrecomp-ports/#duke-nukem-time-to-kill) | USA | `SLUS-00583` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/duke-nukem-time-to-kill-recomp/releases/download/v0.3.3/Duke-Nukem-Time-to-Kill-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/duke-nukem-time-to-kill-recomp) |
| [Fade to Black](https://alexbeav.github.io/psxrecomp-ports/#fade-to-black) | USA | `SLUS-00236` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/fade-to-black-recomp/releases/download/v0.3.3/Fade-to-Black-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/fade-to-black-recomp) |
| [Fighting Force](https://alexbeav.github.io/psxrecomp-ports/#fighting-force) | USA | `SLUS-00433` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-fighting-force-usa-v0.2.3-owned-input-win64.zip) |
| [In Cold Blood](https://alexbeav.github.io/psxrecomp-ports/#in-cold-blood) | USA | `SLUS-01294 · SLUS-01314 · 2 discs` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/in-cold-blood-recomp/releases/download/v0.3.3/In-Cold-Blood-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/in-cold-blood-recomp) |
| [Jackie Chan Stuntmaster](https://alexbeav.github.io/psxrecomp-ports/#jackie-chan-stuntmaster) | USA | `SLUS-00684` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-jackie-chan-stuntmaster-usa-v0.2.3-owned-input-win64.zip) |
| [King's Field](https://alexbeav.github.io/psxrecomp-ports/#kings-field) | Japan | `SLPS-00017` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/kings-field-recomp/releases/download/v0.3.4/King-s-Field-Recomp-0.3.4-windows-x64.zip) · [Repository](https://github.com/Alexbeav/kings-field-recomp) |
| [Koudelka](https://alexbeav.github.io/psxrecomp-ports/#koudelka) | Europe | `SLES-02897 · SLES-12897 · SLES-22897 · SLES-32897 · 4 discs` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/koudelka-recomp/releases/download/v0.3.3/Koudelka-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/koudelka-recomp) |
| [Kula World](https://alexbeav.github.io/psxrecomp-ports/#kula-world) | Europe | `SCES-01000` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/kula-world-recomp/releases/download/v0.3.3/Kula-World-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/kula-world-recomp) |
| [Legacy of Kain: Soul Reaver](https://alexbeav.github.io/psxrecomp-ports/#legacy-of-kain-soul-reaver) | Europe | `SLES-01301` | `SCPH-5552` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-legacy-of-kain-soul-reaver-europe-v0.2.3-owned-input-win64.zip) |
| [MDK](https://alexbeav.github.io/psxrecomp-ports/#mdk) | Europe | `SLES-00599` | `SCPH-5552` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-mdk-europe-v0.2.3-owned-input-win64.zip) |
| [MediEvil](https://alexbeav.github.io/psxrecomp-ports/#medievil) | USA | `SCUS-94227` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-medievil-usa-v0.2.3-owned-input-win64.zip) |
| [MediEvil II](https://alexbeav.github.io/psxrecomp-ports/#medievil-ii) | USA | `SCUS-94564` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-medievil-ii-usa-v0.2.3-owned-input-win64.zip) |
| [Mega Man Legends](https://alexbeav.github.io/psxrecomp-ports/#mega-man-legends) | Europe | `SLES-01485` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/mega-man-legends-recomp/releases/download/v0.3.3/Mega-Man-Legends-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/mega-man-legends-recomp) |
| [Men in Black: The Game](https://alexbeav.github.io/psxrecomp-ports/#men-in-black-the-game) | Europe | `SLES-01047` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/men-in-black-the-game-recomp/releases/download/v0.3.3/Men-in-Black-The-Game-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/men-in-black-the-game-recomp) |
| [Metal Slug X](https://alexbeav.github.io/psxrecomp-ports/#metal-slug-x) | USA | `SLUS-01212` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-metal-slug-x-usa-v0.2.3-owned-input-win64.zip) |
| [Monster Rancher 2](https://alexbeav.github.io/psxrecomp-ports/#monster-rancher-2) | USA | `SLUS-00917` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-monster-rancher-2-usa-v0.2.3-owned-input-win64.zip) |
| [Mortal Kombat 4](https://alexbeav.github.io/psxrecomp-ports/#mortal-kombat-4) | USA | `SLUS-00605` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/mortal-kombat-4-recomp/releases/download/v0.3.5/mortal-kombat-4-recomp-0.3.5-windows-x64.zip) · [Linux](https://github.com/Alexbeav/mortal-kombat-4-recomp/releases/download/v0.3.5/mortal-kombat-4-recomp-0.3.5-linux-x64.zip) · [Repository](https://github.com/Alexbeav/mortal-kombat-4-recomp) |
| [Nightmare Creatures](https://alexbeav.github.io/psxrecomp-ports/#nightmare-creatures) | USA | `SLUS-00582` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-nightmare-creatures-usa-v0.2.3-owned-input-win64.zip) |
| [Oddworld: Abe's Oddysee](https://alexbeav.github.io/psxrecomp-ports/#oddworld-abe-s-oddysee) | USA | `SLUS-00190` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-oddworld-abe-s-oddysee-usa-v0.2.3-owned-input-win64.zip) |
| [Parasite Eve](https://alexbeav.github.io/psxrecomp-ports/#parasite-eve) | USA | `SLUS-00662 · SLUS-00668 · 2 discs` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/parasite-eve-recomp/releases/download/v0.3.3/Parasite-Eve-Recompiled-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/parasite-eve-recomp) |
| [Quake II](https://alexbeav.github.io/psxrecomp-ports/#quake-ii) | USA | `SLUS-00757` | `SCPH-1001` | Up to 4 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-quake-ii-usa-v0.2.3-owned-input-win64.zip) |
| [Spyro the Dragon](https://alexbeav.github.io/psxrecomp-ports/#spyro-the-dragon) | Europe | `SCES-01438` | `SCPH-5552` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-spyro-the-dragon-europe-v0.2.3-owned-input-win64.zip) |
| [Syphon Filter 3](https://alexbeav.github.io/psxrecomp-ports/#syphon-filter-3) | USA | `SCUS-94640` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-syphon-filter-3-usa-v0.2.3-owned-input-win64.zip) |
| [Tenchu: Stealth Assassins](https://alexbeav.github.io/psxrecomp-ports/#tenchu-stealth-assassins) | USA | `SLUS-00706` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tenchu-stealth-assassins-usa-v0.2.3-owned-input-win64.zip) |
| [The Lost World: Jurassic Park Special Edition](https://alexbeav.github.io/psxrecomp-ports/#the-lost-world-jurassic-park-special-edition) | USA | `SLUS-00515` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/the-lost-world-jurassic-park-special-edition-recomp/releases/download/v0.3.3/The-Lost-World-Jurassic-Park-Special-Edition-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/the-lost-world-jurassic-park-special-edition-recomp) |
| [The Mummy](https://alexbeav.github.io/psxrecomp-ports/#the-mummy) | USA | `SLUS-01187` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/the-mummy-recomp/releases/download/v0.3.3/The-Mummy-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/the-mummy-recomp) |
| [Tony Hawk's Pro Skater](https://alexbeav.github.io/psxrecomp-ports/#tony-hawks-pro-skater) | USA | `SLUS-00860` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-usa-v0.2.3-owned-input-win64.zip) |
| [Tony Hawk's Pro Skater 2](https://alexbeav.github.io/psxrecomp-ports/#tony-hawk-s-pro-skater-2) | USA | `SLUS-01066` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-2-usa-v0.2.3-owned-input-win64.zip) |
| [Tony Hawk's Pro Skater 3](https://alexbeav.github.io/psxrecomp-ports/#tony-hawk-s-pro-skater-3) | USA | `SLUS-01419` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-3-usa-v0.2.3-owned-input-win64.zip) |
| [Tony Hawk's Pro Skater 4](https://alexbeav.github.io/psxrecomp-ports/#tony-hawk-s-pro-skater-4) | USA | `SLUS-01485` | `SCPH-1001` | 2 players | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-4-usa-v0.2.3-owned-input-win64.zip) |
| [Valkyrie Profile](https://alexbeav.github.io/psxrecomp-ports/#valkyrie-profile) | USA | `SLUS-01156 · 2 discs` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-valkyrie-profile-usa-v0.2.3-owned-input-win64.zip) |
| [Vampire Hunter D](https://alexbeav.github.io/psxrecomp-ports/#vampire-hunter-d) | USA | `SLUS-01138` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/vampire-hunter-d-recomp/releases/download/v0.3.3/Vampire-Hunter-D-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/vampire-hunter-d-recomp) |
| [Vigilante 8](https://alexbeav.github.io/psxrecomp-ports/#vigilante-8) | Europe | `SLES-01212` | `Regional SCPH` | 1 player | [Windows](https://github.com/Alexbeav/vigilante-8-recomp/releases/download/v0.3.3/Vigilante-8-Recomp-0.3.3-windows-x64.zip) · [Repository](https://github.com/Alexbeav/vigilante-8-recomp) |
| [WipEout](https://alexbeav.github.io/psxrecomp-ports/#wipeout) | Europe | `SCES-00010` | `SCPH-5552` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-wipeout-europe-v0.2.3-owned-input-win64.zip) |
| [Xena: Warrior Princess](https://alexbeav.github.io/psxrecomp-ports/#xena-warrior-princess) | USA | `SLUS-00977` | `SCPH-1001` | 1 player | [Windows](https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-xena-warrior-princess-usa-v0.2.3-owned-input-win64.zip) |
<!-- END GENERATED GAME CATALOG -->


## Standard PSXRecomp features

Press **F1** in game for fullscreen/window modes, presentation and texture
filtering, persistent volume, controller-port routing, session-only **Change
disc**, **Reinsert current disc**, and controller/keyboard navigation.

Multiplayer packages expose separate player cards in the launcher. Keyboard and
gamepads can be assigned independently, including keyboard + controller. The F1
controller-port option swaps existing host assignments between PlayStation ports;
it does not select physical devices.

## Release-wide limitations

- **F1 → Display → Window Scale does not work reliably.** Window Scale is
  separate from internal rendering resolution and does not control
  supersampling. Close the game and use the pre-launch GUI to change
  supersampling.
- Local multiplayer metadata is included, but representative Player 2 testing
  remains unqualified.
- Most titles have an automated startup-survival pass, not an end-to-end game
  completion claim. Read each package's `COMPATIBILITY.md`.
- Performance has not been profiled across representative desktop and laptop
  hardware.
- Locally built executables are not digitally signed and may trigger Windows
  SmartScreen.
- `setup.log`, `settings.toml`, and runtime report JSON files can contain local
  filesystem paths. Redact them before attaching them to a public issue.

## Contributing

Anyone may fork this repository and study or experiment with the build kits for
noncommercial purposes, subject to this repository's PolyForm Noncommercial
License 1.0.0, PSXRecomp's license, and the rights applicable to each original
game. Contributions and reproducible compatibility reports are welcome.

Report problems through **Issues** using this title format:

`[Game Name][Issue] Short description`

For example: `[Alien Resurrection][Issue] Intro FMV displays a corrupted band`.

Include the release version, game region/serial, point reached in gameplay,
reproduction steps, expected behavior, and observed behavior. Do not upload
game media, BIOS files, generated game or BIOS code, locally built executables,
memory cards, save states, or unredacted local paths.

## About this project

These ports are developed by a hobbyist (a DevSecOps engineer, not a game
programmer) with substantial AI assistance. What keeps that honest: every
change is validated before it ships - boot gates, hardware-oracle A/B
comparisons (Beetle/DuckStation), deterministic replay probes, and a shared
findings registry that documents failures as carefully as successes. AI
writes most of the code; the evidence discipline decides what survives.
Bug reports welcome - expect them to be investigated the same way.

tl;dr AI writes the code, but I always test it myself before pushing

These projects are powered by
[`psxrecomp`](https://github.com/mstan/psxrecomp), licensed under the PolyForm
Noncommercial License 1.0.0. Game names identify compatibility targets only.
This project is not affiliated with or endorsed by Sony Interactive
Entertainment or any game publisher or developer.
