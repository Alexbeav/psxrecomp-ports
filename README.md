# PSXRecomp Ports

Unofficial, noncommercial PlayStation recompilation releases for Windows.

Downloads and checksums are published on the **Releases** page. Packages do not
include retail disc images or retail PlayStation BIOS files. Use legally
obtained game media and firmware where required.

## What to expect

These are deliberately **bare recompilations**. They do not contain per-game
enhancements; they provide the original game through the standard features
already supplied by PSXRecomp. Widescreen patches, custom renderers, texture
packs, mouselook, wheel/HOTAS support and other showcase work are not part of
this release wave.

Performance has **not** been formally profiled. No minimum specification,
locked-frame-rate or laptop-performance claim is being made yet. Each release
will state the exact game revision and the compatibility route that was
actually tested.

The intended player flow is hands-off: download the matching kit, place or
select the supported game image and requested BIOS, run `SETUP.bat`, then use
the generated launcher. The setup kit handles verified tools, recompilation
and launcher configuration; no Git, Visual Studio, WinGet or pip knowledge is
required.

## v0.2.0 games

Downloads and menu/gameplay screenshots will be linked directly beside each
title when the draft release is published. `Pending` means no public download
exists yet.

| Game | Supported original release | BIOS profile | Download / screenshots |
|---|---|---|---|
| Alien Resurrection | Europe, `SLES-02913` | `SCPH-5552` | Pending |
| Brave Fencer Musashi | USA, `SLUS-00726` | `SCPH-1001` | Pending |
| Bloody Roar II | USA, `SCUS-94424` | `SCPH-1001` | Pending |
| Colin McRae Rally 2.0 | USA, `SLUS-01222` | `SCPH-1001` | Pending |
| Diablo | Europe, `SLES-01156` | `SCPH-5552` | Pending |
| MediEvil | USA, `SCUS-94227` | `SCPH-1001` | Pending |
| MediEvil II | USA, `SCUS-94564` | `SCPH-1001` | Pending |
| Legacy of Kain: Soul Reaver | Europe, `SLES-01301` | `SCPH-5552` | Pending |
| Metal Slug X | USA, `SLUS-01212` | `SCPH-1001` | Pending |
| Jackie Chan Stuntmaster | USA, `SLUS-00684` | `SCPH-1001` | Pending |
| Fighting Force | USA Rev 2, `SLUS-00433` | `SCPH-1001` | Pending |
| MDK | Europe, `SLES-00599` | `SCPH-5552` | Pending |
| Monster Rancher 2 | USA, `SLUS-00917` | `SCPH-1001` | Pending |
| Quake II | USA, `SLUS-00757` | `SCPH-1001` | Pending |
| Oddworld: Abe's Oddysee | USA Rev 2, `SLUS-00190` | `SCPH-1001` | Pending |
| Spyro the Dragon | Original release selection pending | Pending | Pending |
| Syphon Filter 3 | USA, `SCUS-94640` | `SCPH-1001` | Pending |
| Tenchu: Stealth Assassins | USA, `SLUS-00706` | `SCPH-1001` | Pending |
| Tony Hawk's Pro Skater | USA, `SLUS-00860` | `SCPH-1001` | Pending |
| Tony Hawk's Pro Skater 2 | USA, `SLUS-01066` | `SCPH-1001` | Pending |
| Tony Hawk's Pro Skater 3 | USA, `SLUS-01419` | `SCPH-1001` | Pending |
| Tony Hawk's Pro Skater 4 | USA, `SLUS-01485` | `SCPH-1001` | Pending |
| Mortal Kombat 4 | USA, `SLUS-00605` | `SCPH-1001` | Pending |
| Valkyrie Profile | USA, `SLUS-01156`, two discs | `SCPH-1001` | Pending |
| Xena: Warrior Princess | USA, `SLUS-00977` | `SCPH-1001` | Pending |
| WipEout | Europe, `SCES-00010` | `SCPH-5552` | Pending |

These projects are powered by
[`psxrecomp`](https://github.com/mstan/psxrecomp), licensed under the PolyForm
Noncommercial License 1.0.0. Game names are used only to identify compatibility
targets. This project is not affiliated with or endorsed by Sony Interactive
Entertainment or any game publisher or developer.

Please use **Issues** for compatibility reports. Include the release version,
game region/serial, the point reached in gameplay and reproduction steps. Do
not upload game media, BIOS files, generated game code, memory cards or save
states.
