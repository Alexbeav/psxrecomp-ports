(() => {
  "use strict";

  const games = Array.isArray(window.CATALOG_GAMES) ? window.CATALOG_GAMES : [];
  const body = document.querySelector("#catalog-body");
  const search = document.querySelector("#search");
  const regionFilter = document.querySelector("#region-filter");
  const resetButton = document.querySelector("#reset-filters");
  const resultCount = document.querySelector("#result-count");
  const totalCount = document.querySelector("#total-count");
  const emptyState = document.querySelector("#empty-state");
  const sortButtons = [...document.querySelectorAll("[data-sort]")];
  const collator = new Intl.Collator("en", { numeric: true, sensitivity: "base" });
  const screenshotBase = "https://raw.githubusercontent.com/Alexbeav/psxrecomp-ports/main/screenshots/v0.2.0/";

  const state = {
    query: "",
    region: "all",
    sortKey: "title",
    direction: "asc",
    openGames: new Set()
  };

  const escapeHtml = (value) => String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");

  function splitRegion(region) {
    const match = String(region).match(/^([^()]+?)(?:\s*\((.*)\))?$/);
    return {
      group: match ? match[1].trim() : String(region),
      detail: match?.[2] || ""
    };
  }

  const regionGroup = (game) => splitRegion(game.region).group;

  function renderRegion(region) {
    const { group, detail } = splitRegion(region);
    const detailLine = detail
      ? `<span class="region-detail">${escapeHtml(detail).replaceAll("/", "/&#8203;")}</span>`
      : "";
    return `${escapeHtml(group)}${detailLine}`;
  }

  function renderSerials(serial) {
    return String(serial)
      .split(" · ")
      .map((value) => `<code>${escapeHtml(value)}</code>`)
      .join(' <span class="muted">·</span> ');
  }

  function compareGames(left, right) {
    const key = state.sortKey;
    const leftValue = key === "region" ? regionGroup(left) : left[key];
    const rightValue = key === "region" ? regionGroup(right) : right[key];
    let result;

    if (typeof leftValue === "number" && typeof rightValue === "number") {
      result = leftValue - rightValue;
    } else {
      result = collator.compare(leftValue, rightValue);
    }

    if (result === 0 && key !== "title") {
      result = collator.compare(left.title, right.title);
    }

    return state.direction === "asc" ? result : -result;
  }

  function getVisibleGames() {
    const query = state.query.trim().toLocaleLowerCase();

    return games
      .filter((game) => state.region === "all" || regionGroup(game) === state.region)
      .filter((game) => {
        if (!query) return true;
        return [game.title, game.region, game.serial, game.bios]
          .some((value) => value.toLocaleLowerCase().includes(query));
      })
      .sort(compareGames);
  }

  function renderWindowsLink(game) {
    if (!game.windows) return '<span class="muted">—</span>';

    return `<a class="release-link" href="${escapeHtml(game.windows)}" aria-label="Download ${escapeHtml(game.title)} for Windows">
      <span class="windows-mark" aria-hidden="true"><i></i><i></i><i></i><i></i></span>
      <span class="release-label">Windows</span>
    </a>`;
  }

  function renderLinuxLink(game) {
    if (!game.linux) return "";

    return `<a class="release-link" href="${escapeHtml(game.linux)}" aria-label="Download ${escapeHtml(game.title)} for Linux">
      <span aria-hidden="true">◆</span><span class="release-label">Linux</span>
    </a>`;
  }

  function renderMacOSLink(game, architecture, label) {
    const url = architecture === "arm64" ? game.macosArm64 : game.macosX64;
    if (!url) return "";

    return `<a class="release-link" href="${escapeHtml(url)}" aria-label="Download ${escapeHtml(game.title)} for macOS ${escapeHtml(label)}">
      <span aria-hidden="true">●</span><span class="release-label">macOS ${escapeHtml(label)}</span>
    </a>`;
  }

  function renderDetails(game) {
    const issues = game.knownIssues || "No title-specific issue is listed. Release-wide limits still apply.";
    const enhancements = game.enhancements || "None. This release is a bare recompilation.";
    const repository = game.repository ? `<section class="note-block">
              <h3>Project repository</h3>
              <p><a href="${escapeHtml(game.repository)}">View the public repository and all releases.</a></p>
            </section>` : "";
    const screenshots = game.images.length ? game.images.map(([path, alt], index) => `<figure>
      <img src="${screenshotBase}${escapeHtml(path)}" alt="${escapeHtml(alt)}" loading="lazy">
      <figcaption>${index === 0 ? "Menu" : "Gameplay"}</figcaption>
    </figure>`).join("") : '<p class="muted">Screenshots are not published for this title yet.</p>';

    return `<tr class="details-row" id="${escapeHtml(game.slug)}-details">
      <td colspan="6">
        <div class="game-details">
          <div class="screenshots">${screenshots}</div>
          <div class="notes">
            <section class="note-block">
              <h3>Known issues</h3>
              <p>${escapeHtml(issues)}</p>
            </section>
            <section class="note-block">
              <h3>Shipped enhancements</h3>
              <p>${escapeHtml(enhancements)}</p>
            </section>
            ${repository}
          </div>
        </div>
      </td>
    </tr>`;
  }

  function renderGame(game) {
    const open = state.openGames.has(game.slug);
    const discLabel = game.discs > 1 ? `<span class="disc-count"> · ${game.discs} discs</span>` : "";

    return `<tr class="game-row" id="${escapeHtml(game.slug)}">
      <td>
        <button class="title-button" type="button" data-game="${escapeHtml(game.slug)}" aria-expanded="${open}" aria-controls="${escapeHtml(game.slug)}-details">
          <span class="disclosure" aria-hidden="true">▶</span>
          <span>${escapeHtml(game.title)}</span>
        </button>
      </td>
      <td>${renderRegion(game.region)}</td>
      <td>${renderSerials(game.serial)}${discLabel}</td>
      <td><code>${escapeHtml(game.bios)}</code></td>
      <td>${escapeHtml(game.playersLabel)}</td>
      <td><div class="release-links">${renderWindowsLink(game)}${renderLinuxLink(game)}${renderMacOSLink(game, "arm64", "Apple Silicon")}${renderMacOSLink(game, "x64", "Intel")}</div></td>
    </tr>${open ? renderDetails(game) : ""}`;
  }

  function updateSortHeaders() {
    sortButtons.forEach((button) => {
      const active = button.dataset.sort === state.sortKey;
      const header = button.closest("th");
      const icon = button.querySelector("span");

      header.setAttribute("aria-sort", active ? (state.direction === "asc" ? "ascending" : "descending") : "none");
      icon.textContent = active ? (state.direction === "asc" ? "▲" : "▼") : "↕";
    });
  }

  function render() {
    const visibleGames = getVisibleGames();
    body.innerHTML = visibleGames.map(renderGame).join("");
    resultCount.textContent = `${visibleGames.length} of ${games.length} titles`;
    totalCount.textContent = games.length;
    emptyState.hidden = visibleGames.length !== 0;
    updateSortHeaders();
  }

  function setHash(slug) {
    const url = new URL(window.location.href);
    url.hash = slug ? `#${slug}` : "";
    history.replaceState(null, "", url);
  }

  sortButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const nextKey = button.dataset.sort;
      if (state.sortKey === nextKey) {
        state.direction = state.direction === "asc" ? "desc" : "asc";
      } else {
        state.sortKey = nextKey;
        state.direction = "asc";
      }
      render();
    });
  });

  search.addEventListener("input", () => {
    state.query = search.value;
    render();
  });

  regionFilter.addEventListener("change", () => {
    state.region = regionFilter.value;
    render();
  });

  resetButton.addEventListener("click", () => {
    state.query = "";
    state.region = "all";
    state.sortKey = "title";
    state.direction = "asc";
    search.value = "";
    regionFilter.value = "all";
    render();
    search.focus();
  });

  body.addEventListener("click", (event) => {
    const button = event.target.closest("[data-game]");
    if (!button) return;

    const slug = button.dataset.game;
    if (state.openGames.has(slug)) {
      state.openGames.delete(slug);
      if (window.location.hash === `#${slug}`) setHash("");
    } else {
      state.openGames.add(slug);
      setHash(slug);
    }
    render();
    document.querySelector(`[data-game="${CSS.escape(slug)}"]`)?.focus();
  });

  const initialSlug = window.location.hash.slice(1);
  if (games.some((game) => game.slug === initialSlug)) {
    state.openGames.add(initialSlug);
  }

  window.CatalogTest = { compareGames, getVisibleGames, state };
  render();

  if (initialSlug) {
    requestAnimationFrame(() => document.getElementById(initialSlug)?.scrollIntoView({ block: "center" }));
  }
})();
