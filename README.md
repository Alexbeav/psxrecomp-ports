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
original disc and retail BIOS from material you own; the kit verifies both and
generates the title on your PC. OpenBIOS is neither included nor accepted.

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

Select a game row to show its screenshots, known issues, and shipped enhancements.
Select 🪟 to download a Windows kit. A 🐧 icon will mark each Linux kit when available.

<table width="100%">
<thead>
<tr>
<th width="24%">Title</th>
<th width="28%">Supported original</th>
<th width="14%">BIOS</th>
<th width="10%">Players</th>
<th width="12%">Details</th>
<th width="12%">Releases</th>
</tr>
</thead>
</table>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Alien Resurrection</strong></td>
<td width="28%">Europe, <code>SLES-02913</code></td>
<td width="14%"><code>SCPH-5552</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-alien-resurrection-europe-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/alien-resurrection/alien_resurrection_menu.jpg" alt="Alien Resurrection menu" width="49%">
<img src="screenshots/v0.2.0/alien-resurrection/alien_resurrection_game.jpg" alt="Alien Resurrection gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Bloody Roar II</strong></td>
<td width="28%">USA, <code>SCUS-94424</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-bloody-roar-ii-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/bloody-roar-ii/bloody-roar-ii_menu.jpg" alt="Bloody Roar II menu" width="49%">
<img src="screenshots/v0.2.0/bloody-roar-ii/bloody-roar-ii_game.jpg" alt="Bloody Roar II gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Brave Fencer Musashi</strong></td>
<td width="28%">USA, <code>SLUS-00726</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-brave-fencer-musashi-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/brave-fencer-musashi/brave-fencer-musashi_menu.jpg" alt="Brave Fencer Musashi menu" width="49%">
<img src="screenshots/v0.2.0/brave-fencer-musashi/brave-fencer-musashi_game.jpg" alt="Brave Fencer Musashi gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Diablo</strong></td>
<td width="28%">Europe (Spanish/Portuguese), <code>SLES-01156</code></td>
<td width="14%"><code>SCPH-5552</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-diablo-europe-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/diablo/diablo_menu.jpg" alt="Diablo menu" width="49%">
<img src="screenshots/v0.2.0/diablo/diablo_game.jpg" alt="Diablo gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Fighting Force</strong></td>
<td width="28%">USA, <code>SLUS-00433</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-fighting-force-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/fighting-force/fighting-force_menu.jpg" alt="Fighting Force menu" width="49%">
<img src="screenshots/v0.2.0/fighting-force/fighting-force_game.jpg" alt="Fighting Force gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Jackie Chan Stuntmaster</strong></td>
<td width="28%">USA, <code>SLUS-00684</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-jackie-chan-stuntmaster-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/jackie-chan-stuntmaster/jackie-chan-stuntmaster_menu.jpg" alt="Jackie Chan Stuntmaster menu" width="49%">
<img src="screenshots/v0.2.0/jackie-chan-stuntmaster/jackie-chan-stuntmaster_game.jpg" alt="Jackie Chan Stuntmaster gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Legacy of Kain: Soul Reaver</strong></td>
<td width="28%">Europe, <code>SLES-01301</code></td>
<td width="14%"><code>SCPH-5552</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-legacy-of-kain-soul-reaver-europe-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/legacy-of-kain-soul-reaver/legacy-of-kain-soul-reaver_menu.jpg" alt="Legacy of Kain: Soul Reaver menu" width="49%">
<img src="screenshots/v0.2.0/legacy-of-kain-soul-reaver/legacy-of-kain-soul-reaver_game.jpg" alt="Legacy of Kain: Soul Reaver gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>MDK</strong></td>
<td width="28%">Europe, <code>SLES-00599</code></td>
<td width="14%"><code>SCPH-5552</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-mdk-europe-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/mdk/mdk_menu.jpg" alt="MDK menu" width="49%">
<img src="screenshots/v0.2.0/mdk/mdk_game.jpg" alt="MDK gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>MediEvil</strong></td>
<td width="28%">USA, <code>SCUS-94227</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-medievil-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/medievil/medievil_menu.jpg" alt="MediEvil menu" width="49%">
<img src="screenshots/v0.2.0/medievil/medievil_game.jpg" alt="MediEvil gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>MediEvil II</strong></td>
<td width="28%">USA, <code>SCUS-94564</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-medievil-ii-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/medievil-ii/medievil-ii_menu.jpg" alt="MediEvil II menu" width="49%">
<img src="screenshots/v0.2.0/medievil-ii/medievil-ii_game.jpg" alt="MediEvil II gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Metal Slug X</strong></td>
<td width="28%">USA, <code>SLUS-01212</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-metal-slug-x-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/metal-slug-x/metal-slug-x_menu.jpg" alt="Metal Slug X menu" width="49%">
<img src="screenshots/v0.2.0/metal-slug-x/metal-slug-x_game.jpg" alt="Metal Slug X gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Monster Rancher 2</strong></td>
<td width="28%">USA, <code>SLUS-00917</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-monster-rancher-2-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/monster-rancher-2/monster-rancher-2_menu.jpg" alt="Monster Rancher 2 menu" width="49%">
<img src="screenshots/v0.2.0/monster-rancher-2/monster-rancher-2_game.jpg" alt="Monster Rancher 2 gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> The optional other-CD monster-generation flow is not fully qualified.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Mortal Kombat 4</strong></td>
<td width="28%">USA, <code>SLUS-00605</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-mortal-kombat-4-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/mortal-kombat-4/mortal-kombat-4_menu.jpg" alt="Mortal Kombat 4 menu" width="49%">
<img src="screenshots/v0.2.0/mortal-kombat-4/mortal-kombat-4_game.jpg" alt="Mortal Kombat 4 gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Nightmare Creatures</strong></td>
<td width="28%">USA, <code>SLUS-00582</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-nightmare-creatures-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/nightmare-creatures/nightmare-creatures_menu.jpg" alt="Nightmare Creatures menu" width="49%">
<img src="screenshots/v0.2.0/nightmare-creatures/nightmare-creatures_game.jpg" alt="Nightmare Creatures gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Oddworld: Abe's Oddysee</strong></td>
<td width="28%">USA, <code>SLUS-00190</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-oddworld-abe-s-oddysee-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/oddworld-abe-s-oddysee/oddworld-abe-s-oddysee_menu.jpg" alt="Oddworld: Abe's Oddysee menu" width="49%">
<img src="screenshots/v0.2.0/oddworld-abe-s-oddysee/oddworld-abe-s-oddysee_game.jpg" alt="Oddworld: Abe's Oddysee gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Quake II</strong></td>
<td width="28%">USA, <code>SLUS-00757</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">Up to 4*</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-quake-ii-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/quake-ii/quake-ii_menu.jpg" alt="Quake II menu" width="49%">
<img src="screenshots/v0.2.0/quake-ii/quake-ii_game.jpg" alt="Quake II gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> The four-seat multitap path remains experimental. Representative Player 2 testing also remains unqualified.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Spyro the Dragon</strong></td>
<td width="28%">Europe, <code>SCES-01438</code></td>
<td width="14%"><code>SCPH-5552</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-spyro-the-dragon-europe-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/spyro-the-dragon/spyro_menu.jpg" alt="Spyro the Dragon menu" width="49%">
<img src="screenshots/v0.2.0/spyro-the-dragon/spyro_game.jpg" alt="Spyro the Dragon gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Syphon Filter 3</strong></td>
<td width="28%">USA, <code>SCUS-94640</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-syphon-filter-3-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/syphon-filter-3/syphon-filter-3_menu.jpg" alt="Syphon Filter 3 menu" width="49%">
<img src="screenshots/v0.2.0/syphon-filter-3/syphon-filter-3_game.jpg" alt="Syphon Filter 3 gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Tenchu: Stealth Assassins</strong></td>
<td width="28%">USA, <code>SLUS-00706</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tenchu-stealth-assassins-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/tenchu-stealth-assassins/tenchu-stealth-assassins_menu.jpg" alt="Tenchu: Stealth Assassins menu" width="49%">
<img src="screenshots/v0.2.0/tenchu-stealth-assassins/tenchu-stealth-assassins_game.jpg" alt="Tenchu: Stealth Assassins gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Tony Hawk's Pro Skater</strong></td>
<td width="28%">USA, <code>SLUS-00860</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/tony-hawks-pro-skater/tony-hawks-pro-skater_menu.jpg" alt="Tony Hawk's Pro Skater menu" width="49%">
<img src="screenshots/v0.2.0/tony-hawks-pro-skater/tony-hawks-pro-skater_game.jpg" alt="Tony Hawk's Pro Skater gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> Music sometimes failed to start in one Tony Hawk title during operator testing. The exact title is not known. Skipping one track starts the next.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Tony Hawk's Pro Skater 2</strong></td>
<td width="28%">USA, <code>SLUS-01066</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-2-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/tony-hawk-s-pro-skater-2/tony-hawk-s-pro-skater-2_menu.jpg" alt="Tony Hawk's Pro Skater 2 menu" width="49%">
<img src="screenshots/v0.2.0/tony-hawk-s-pro-skater-2/tony-hawk-s-pro-skater-2_game.jpg" alt="Tony Hawk's Pro Skater 2 gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> Music sometimes failed to start in one Tony Hawk title during operator testing. The exact title is not known. Skipping one track starts the next.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Tony Hawk's Pro Skater 3</strong></td>
<td width="28%">USA, <code>SLUS-01419</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-3-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/tony-hawk-s-pro-skater-3/tony-hawk-s-pro-skater-3_menu.jpg" alt="Tony Hawk's Pro Skater 3 menu" width="49%">
<img src="screenshots/v0.2.0/tony-hawk-s-pro-skater-3/tony-hawk-s-pro-skater-3_game.jpg" alt="Tony Hawk's Pro Skater 3 gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> Music sometimes failed to start in one Tony Hawk title during operator testing. The exact title is not known. Skipping one track starts the next.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Tony Hawk's Pro Skater 4</strong></td>
<td width="28%">USA, <code>SLUS-01485</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">2</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-tony-hawk-s-pro-skater-4-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/tony-hawk-s-pro-skater-4/tony-hawk-s-pro-skater-4_menu.jpg" alt="Tony Hawk's Pro Skater 4 menu" width="49%">
<img src="screenshots/v0.2.0/tony-hawk-s-pro-skater-4/tony-hawk-s-pro-skater-4_game.jpg" alt="Tony Hawk's Pro Skater 4 gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> Music sometimes failed to start in one Tony Hawk title during operator testing. The exact title is not known. Skipping one track starts the next.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Valkyrie Profile</strong></td>
<td width="28%">USA, <code>SLUS-01156</code>, two discs</td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-valkyrie-profile-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/valkyrie-profile/valkyrie-profile_menu.jpg" alt="Valkyrie Profile menu" width="49%">
<img src="screenshots/v0.2.0/valkyrie-profile/valkyrie-profile_game.jpg" alt="Valkyrie Profile gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> The later campaign disc transition is not fully qualified.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>WipEout</strong></td>
<td width="28%">Europe, <code>SCES-00010</code></td>
<td width="14%"><code>SCPH-5552</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-wipeout-europe-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/wipeout/wipeout_menu.jpg" alt="WipEout menu" width="49%">
<img src="screenshots/v0.2.0/wipeout/wipeout_game.jpg" alt="WipEout gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> Minor visible geometry gaps remain.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>

<details>
<summary>
<table width="100%">
<tbody>
<tr>
<td width="24%"><strong>Xena: Warrior Princess</strong></td>
<td width="28%">USA, <code>SLUS-00977</code></td>
<td width="14%"><code>SCPH-1001</code></td>
<td width="10%">1</td>
<td width="12%"><strong>Screens</strong></td>
<td width="12%" align="center"><a href="https://github.com/Alexbeav/psxrecomp-ports/releases/download/v0.2.3/psxrecomp-xena-warrior-princess-usa-v0.2.3-owned-input-win64.zip" title="Download the Windows owned-input kit">🪟</a></td>
</tr>
</tbody>
</table>
</summary>

<p align="center">
<img src="screenshots/v0.2.0/xena-warrior-princess/xena-warrior-princess_menu.jpg" alt="Xena: Warrior Princess menu" width="49%">
<img src="screenshots/v0.2.0/xena-warrior-princess/xena-warrior-princess_game.jpg" alt="Xena: Warrior Princess gameplay" width="49%">
</p>

<p><strong>Known issues:</strong> No title-specific issue is listed. Release-wide limits still apply.</p>
<p><strong>Shipped enhancements:</strong> None. This release is a bare recompilation.</p>
</details>


Colin McRae Rally 2.0 was removed from this wave after operator testing found
major graphical issues. Nightmare Creatures takes its place. It was not silently
published as a passing title.

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
