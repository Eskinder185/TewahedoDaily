# Compact Faith Challenges Studio

Implemented and browser-verified locally on 2026-11-03. This supersedes the earlier card-based Studio dashboard layout.

## Actual cause and change

The remaining cards were reproduced at `/admin/play`, not only on a deployment. `StudioLibrary` in `src/pages/admin/studio/GameContentStudio.tsx` rendered the twelve-game navigation grid, a separate six-status overview, a large introduction and shared `GameModeNavigation` buttons. `AdminLayout` only supplied the sidebar/header/Outlet; a nested legacy page was not responsible.

Removed those rendered panels and the primary Studio's shared mode-card navigation. Replaced them with a compact toolbar containing Search content, Game (all twelve editors), Mode (five modes), and Status. Status counts are now option labels. Extra filters and storage/publication help remain collapsed. Library records are flat rows rather than bordered management cards. Import/export/recovery at `/admin/play/import` is preserved. Public game cards, engines, services, permissions and publication restrictions were not changed.

Application files changed:

- `src/pages/admin/studio/GameContentStudio.tsx`: compact heading, toolbar, removal of grids/summary panels, collapsed help, flat library placement.
- `src/pages/admin/studio/Studio.module.css`: removed obsolete dashboard/game-card styles; compact controls, rows and responsive two-column mobile selectors.

Tests updated:

- `scripts/test-content-studio-browser.mjs`: absence of cards/overview at top and bottom, library in initial viewport, all twelve editors selected through the native control, populated library/search/mode/history, saved engines and existing editorial checks.
- `scripts/test-faith-challenges-editor.mjs`: compact controls while preserving actual validation, persistence, publication, import and permission assertions.
- `scripts/test-play-modes-browser.mjs`: compact mode selector and selected DOM-value synchronization, public gameplay cards unchanged.
- `scripts/test-navigation-history.mjs`: compact Status selector; history checks preserved.

## Browser evidence

Started local Vite applications using the actual App, Router, Studio and parent layout with synthetic Auth/PostgREST fixtures. External production requests were blocked. No live authorization claim is made.

Before screenshots: `C:\Users\eskew\AppData\Local\Temp\tewahedo-studio-qa-lEILPU\before-admin-play-desktop.png` and `before-admin-play-mobile.png`.

After screenshots: `C:\Users\eskew\AppData\Local\Temp\tewahedo-studio-qa-FJdBlN\compact-admin-play-1280.png`, `compact-admin-play-390.png`, `compact-populated-1280.png`, `compact-populated-390.png`. Desktop and mobile images, including the bottom of the populated library, were visually reviewed.

Before: twelve navigation cards, one management overview, desktop library top approximately 1686px; mobile game grid approximately 2601px tall. After: zero navigation/management cards; populated library begins at 253px on desktop and 455px on mobile. Its remaining height reflects actual content rows, not redundant panels.

## Verification

Final commands passed, exit 0:

- `node scripts/test-content-studio-browser.mjs`: 31/31 scenarios; all twelve editors, previews, save/reload, permissions and import access retained.
- `node scripts/test-faith-challenges-editor.mjs`: native-auth fixture CMS/editor/import workflow passed.
- `node scripts/test-play-modes-browser.mjs`: 10/10.
- `node scripts/test-navigation-history.mjs`: 21/21.
- `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts`: 36/36.
- `node node_modules/tsx/dist/cli.mjs scripts/test-studio-card-adapters.ts`: 14/14.
- `node node_modules/typescript/bin/tsc -b --pretty false`: passed.
- Targeted ESLint and Node syntax checks for changed scripts: passed.
- `npm.cmd run build`: passed; emitted a CSS minifier warning about `::highlight(lyric-match)` outside this Studio change. No unrelated CSS was modified to suppress it.
- Scoped Git/new-file whitespace checks passed.

Deployed revision was not inspected or changed. The issue was present in local code and is fixed locally; no deployment is claimed. No SQL, data deletion, installations, commits, staging, pushes or deployment occurred. Existing unrelated changes were preserved.
