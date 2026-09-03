import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";
import { fileURLToPath } from "node:url";

const scriptDirectory = path.dirname(fileURLToPath(import.meta.url));
const repositoryRoot = path.resolve(scriptDirectory, "..");
const dataPath = path.join(repositoryRoot, "docs", "catalog-data.js");
const readmePath = path.join(repositoryRoot, "README.md");
const context = { window: {} };

vm.createContext(context);
vm.runInContext(fs.readFileSync(dataPath, "utf8"), context, { filename: dataPath });

const games = context.window.CATALOG_GAMES;
const pagesUrl = "https://alexbeav.github.io/psxrecomp-ports/";
const beginMarker = "<!-- BEGIN GENERATED GAME CATALOG -->";
const endMarker = "<!-- END GENERATED GAME CATALOG -->";

function escapeCell(value) {
  return String(value).replaceAll("|", "\\|");
}

const rows = [...games]
  .sort((left, right) => left.title.localeCompare(right.title, "en", { numeric: true }))
  .map((game) => {
    const original = game.discs > 1 ? `${game.serial} · ${game.discs} discs` : game.serial;
    const releases = [`[Windows](${game.windows})`];
    if (game.linux) releases.push(`[Linux](${game.linux})`);
    if (game.macosArm64) releases.push(`[macOS Apple Silicon](${game.macosArm64})`);
    if (game.macosX64) releases.push(`[macOS Intel](${game.macosX64})`);
    if (game.repository) releases.push(`[Repository](${game.repository})`);
    return `| [${escapeCell(game.title)}](${pagesUrl}#${game.slug}) | ${escapeCell(game.region)} | \`${original}\` | \`${game.bios}\` | ${game.playersLabel} | ${releases.join(" · ")} |`;
  });

const catalog = [
  beginMarker,
  "Use the [sortable game catalog](https://alexbeav.github.io/psxrecomp-ports/) to sort by title, region, BIOS, or player count. Select a title there to see screenshots, known issues, and shipped enhancements.",
  "",
  "| Title | Region | Supported original | BIOS | Players | Releases |",
  "| --- | --- | --- | --- | ---: | --- |",
  ...rows,
  endMarker
].join("\n");

const readme = fs.readFileSync(readmePath, "utf8");
const generatedPattern = new RegExp(`${beginMarker}[\\s\\S]*?${endMarker}`);
const legacyPattern = /Open a title to see screenshots,[\s\S]*?(?=\r?\nColin McRae Rally 2\.0 was removed)/;
let updated;

if (generatedPattern.test(readme)) {
  updated = readme.replace(generatedPattern, catalog);
} else if (legacyPattern.test(readme)) {
  updated = readme.replace(legacyPattern, `${catalog}\n`);
} else {
  throw new Error("Could not find the README catalog section.");
}

fs.writeFileSync(readmePath, updated);
console.log(`Rendered ${games.length} catalog rows in README.md.`);
