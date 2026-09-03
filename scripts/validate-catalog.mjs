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
const bannerPath = path.join(repositoryRoot, "docs", "assets", "alexbeav-ps1-recomps-banner.png");
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
  if (!Array.isArray(game.images) || ![0, 2].includes(game.images.length)) fail(`${game.title}: expected zero or two screenshots.`);
  const releaseRepository = game.repository || "https://github.com/Alexbeav/psxrecomp-ports";
  if (!releaseRepository.startsWith("https://github.com/Alexbeav/")) fail(`${game.title}: unexpected repository URL.`);
  if (!game.windows.startsWith(`${releaseRepository}/releases/download/`)) fail(`${game.title}: unexpected Windows release URL.`);
  if (game.linux && !game.linux.startsWith(`${releaseRepository}/releases/download/`)) fail(`${game.title}: unexpected Linux release URL.`);
  if (game.macosArm64 && !game.macosArm64.startsWith(`${releaseRepository}/releases/download/`)) fail(`${game.title}: unexpected macOS Apple Silicon release URL.`);
  if (game.macosX64 && !game.macosX64.startsWith(`${releaseRepository}/releases/download/`)) fail(`${game.title}: unexpected macOS Intel release URL.`);

  for (const [image] of game.images) {
    const imagePath = path.join(repositoryRoot, "screenshots", "v0.2.0", image);
    if (!fs.existsSync(imagePath)) fail(`${game.title}: missing screenshot ${image}.`);
  }

  if (!readme.includes(`/#${game.slug})`)) fail(`${game.title}: missing README details link.`);
  if (!readme.includes(`](${game.windows})`)) fail(`${game.title}: missing README release link.`);
  if (game.linux && !readme.includes(`](${game.linux})`)) fail(`${game.title}: missing README Linux release link.`);
  if (game.macosArm64 && !readme.includes(`](${game.macosArm64})`)) fail(`${game.title}: missing README macOS Apple Silicon release link.`);
  if (game.macosX64 && !readme.includes(`](${game.macosX64})`)) fail(`${game.title}: missing README macOS Intel release link.`);
  if (game.repository && !readme.includes(`](${game.repository})`)) fail(`${game.title}: missing README repository link.`);
}

const readmeRows = (readme.match(/^\| \[[^\n]+\|$/gm) || []).length;
if (readmeRows !== games.length) fail(`README has ${readmeRows} game rows; expected ${games.length}.`);
if (!index.includes("catalog-data.js") || !index.includes("catalog.js")) fail("Catalog scripts are not linked from index.html.");
if (!index.includes('id="catalog-body"')) fail("Catalog table body is missing.");
if (!fs.existsSync(bannerPath)) fail("The shared banner image is missing.");
if (!index.includes('src="assets/alexbeav-ps1-recomps-banner.png"')) fail("The site banner is not linked from index.html.");
if (!readme.includes('src="docs/assets/alexbeav-ps1-recomps-banner.png"')) fail("The README banner is missing.");
if (index.indexOf('<div class="site-banner">') > index.indexOf('<section class="intro"')) fail("The site banner must appear before the catalog heading.");

if (failures.length) {
  console.error(failures.map((message) => `- ${message}`).join("\n"));
  process.exit(1);
}

console.log(`Catalog validation passed for ${games.length} games and ${games.reduce((count, game) => count + game.images.length, 0)} screenshots.`);
