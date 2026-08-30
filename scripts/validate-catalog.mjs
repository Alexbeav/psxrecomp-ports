import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";
import { fileURLToPath } from "node:url";

const scriptDirectory = path.dirname(fileURLToPath(import.meta.url));
const repositoryRoot = path.resolve(scriptDirectory, "..");
const context = { window: {} };
const failures = [];

function fail(message) {
  failures.push(message);
}

function read(relativePath) {
  return fs.readFileSync(path.join(repositoryRoot, relativePath), "utf8");
}

vm.createContext(context);
vm.runInContext(read("docs/catalog-data.js"), context, { filename: "catalog-data.js" });

const games = context.window.CATALOG_GAMES;
const readme = read("README.md");
const index = read("docs/index.html");
const slugs = new Set();
const titles = new Set();

if (!Array.isArray(games) || games.length === 0) fail("Catalog data is empty.");

for (const game of games) {
  for (const key of ["slug", "title", "region", "serial", "bios", "players", "playersLabel", "windows", "images"]) {
    if (!game[key]) fail(`${game.title || game.slug || "Unknown game"}: missing ${key}.`);
  }

  if (slugs.has(game.slug)) fail(`Duplicate slug: ${game.slug}.`);
  if (titles.has(game.title)) fail(`Duplicate title: ${game.title}.`);
  slugs.add(game.slug);
  titles.add(game.title);

  if (!Number.isInteger(game.players) || game.players < 1) fail(`${game.title}: invalid player count.`);
  if (!Array.isArray(game.images) || game.images.length !== 2) fail(`${game.title}: expected two screenshots.`);
  if (!game.windows.startsWith("https://github.com/Alexbeav/psxrecomp-ports/releases/download/")) fail(`${game.title}: unexpected Windows release URL.`);

  for (const [image] of game.images) {
    const imagePath = path.join(repositoryRoot, "screenshots", "v0.2.0", image);
    if (!fs.existsSync(imagePath)) fail(`${game.title}: missing screenshot ${image}.`);
  }

  if (!readme.includes(`/#${game.slug})`)) fail(`${game.title}: missing README details link.`);
  if (!readme.includes(`](${game.windows})`)) fail(`${game.title}: missing README release link.`);
}

const readmeRows = (readme.match(/^\| \[[^\n]+\|$/gm) || []).length;
if (readmeRows !== games.length) fail(`README has ${readmeRows} game rows; expected ${games.length}.`);
if (!index.includes("catalog-data.js") || !index.includes("catalog.js")) fail("Catalog scripts are not linked from index.html.");
if (!index.includes('id="catalog-body"')) fail("Catalog table body is missing.");

if (failures.length) {
  console.error(failures.map((message) => `- ${message}`).join("\n"));
  process.exit(1);
}

console.log(`Catalog validation passed for ${games.length} games and ${games.length * 2} screenshots.`);
