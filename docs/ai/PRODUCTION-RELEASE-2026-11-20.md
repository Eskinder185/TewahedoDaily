# Production release — 2026-11-20

Release PR: #18 (`release/2026-11-20` → `main`). It integrates #14 → #15 → #17 in dependency order (each was a fast-forward of the
previous one, so their commits are unchanged) plus the release fixes below. #16 (Mezmur search, with an unapplied SQL migration) is
not part of this release.

Deployment, live verification and the final `main` SHA are recorded in the "Deployment" section at the end of this file.

## State before the release (verified, not taken from PR descriptions)

| Question | Evidence |
|---|---|
| What was deployed? | `main` at `2e47248` on Cloudflare Pages, https://tewahedodaily.pages.dev (no custom domain). |
| How did production play Faith Challenges? | Bundled mode (`VITE_PLAY_DATABASE_ONLY` not set). A guest probe of the live site showed all 12 cards with counts and every game's setup screen, no page errors, no failed requests. |
| What was committed but not merged? | #14 (7 commits), #15 (2 + 3 remediation commits), #17 (3 commits), #16 (separate). |
| Which database migrations exist / are applied? | #14, #15 and #17 contain no files under `supabase/migrations`. The six-state Faith Challenges migration is a review-only proposal in `docs/ai/proposed-migrations/`; it is not applied to any hosted database. |
| Published database content | An anonymous read of `play_content_items` returns 0 rows (nothing published). |
| CI | The daily maintenance workflow had failed every day since at least 2026-11-14: `npm ci` died in `onnxruntime-node`'s install script (CUDA download 404). PR #17's Cloudflare build failed the same way (a new branch has no dependency cache). |

## Release decision for Faith Challenges content

Option A from the brief: keep serving the approved bundled banks (what production already does) and do **not** switch to the
database path. Reasons: no hosted database credentials exist in this environment, so the migration, the 834-row draft import and any
publication cannot be run or verified on staging; publishing anything would also require editorial and rights approval that is not
recorded. Switching `VITE_PLAY_DATABASE_ONLY` on would empty every game (0 published rows). Nothing in this release changes that flag
or exposes drafts.

## Changes in this release

From the integrated PRs: release consolidation (#14), the Faith Challenges consolidation tooling, proposed migration, rollback security
and tests (#15, all review-only on the database side), the dev-only local preview and draft review screen, and the Finish the Mezmur
crash fix, quiz setup race fix and unusable-picture handling (#17).

Release fixes (this PR):

| Commit | Fix |
|---|---|
| `e0f296d` | `.npmrc` skips `onnxruntime-node`'s optional CUDA download; fresh Linux installs work again (GitHub Actions and Cloudflare). |
| `1673fc5` | Studio publication guards restored (removed by #15's `1d5bb7b` before the database guard they rely on exists). |
| `073a69d` | 17 stale artwork paths repointed to the published calendar card image for the same subject; every game picture checked visually; Tsinset, Meskel and Kidus Estifanos use the bundled local picture; Zemene Tsige uses the untitled Flight into Egypt icon. |
| `d631bcc` | Real `robots.txt` (no indexing of /admin, /account, sign-in pages); year-long immutable caching for fingerprinted `/assets/*`. |
| `afd92ed` | A missing Supabase origin returns "no image" instead of crashing every Faith Challenges page. |
| `df6441b` | `npm audit fix` plus two scoped overrides: `npm audit --audit-level=high` passes (was 10 high). 4 moderate remain (need a breaking `vite-plugin-pwa` upgrade). |
| `583acef` | The 12-game browser test can run against a deployed build (`PLAY_TEST_BASE_URL`). |
| `27ab835` | A missing hero picture no longer crashes the hub. |

## Faith Challenges inventory (production content source: bundled banks)

| Game | Route | Playable in production | Consolidated drafts (not published) |
|---|---|---|---|
| Bible & Tewahedo Trivia | /play/trivia | 226 questions | 226 |
| Finish the Verse | /play/finish-the-verse | 119 excerpts | 119 |
| Holy Emoji Challenge | /play/emoji | 166 clues | 166 |
| Who Am I? | /play/who-am-i | 132 cards | 132 |
| Match & Discover | /play/match | 135 pairs | 135 |
| History Quest | /play/history | 6 questions + 1 chronology (all cite unpublished Church Library books; shown with a notice) | 7 |
| Bible Timeline | /play/bible-timeline | 38 timelines, 240 events | 38 |
| Church Feast Challenge | /play/feasts | 12 pictures | 1 deck |
| Guess the Saint | /play/saints | 10 pictures | 1 deck |
| Icon Memory | /play/icon-memory | 22 pictures | 3 decks |
| Finish the Mezmur | /play/finish-the-mezmur | built at play time from published hymns (2,486 with lyrics) | source-only, none |
| Bible Adventure | /play/adventures | 6 stories, 18 scenes | 6 |

Content publication (database): inventoried 834; valid 834 (0 invalid, duplicate IDs collapsed before validation); published 0.
Review blockers recorded in the local review inventory: 21 source-blocked (14 Seven Sacraments, 7 History: books not published),
787 need editorial review (766 generated + the 21), 783 need translation review, 6 Who Am I? cards have no verified Amharic,
36 have no Amharic text. The 220 held generated questions are outside the 834. Rights are not recorded for any record.

## Artwork

- Registry: 84 entries; 40 loaded before, 57 after this release; 27 still return HTTP 400 and have no matching published image
  (content owner): observance-tselote-hamus, observance-qadam-sihur, observance-new-tinsae, observance-flight-into-egypt,
  observance-circumcision-of-christ, observance-sibket, monthly-medhane-alem-monthly, monthly-baale-weld-monthly,
  monthly-ammanuel-monthly, observance-tekle-meskel, observance-baeta-maryam, observance-asteriyo-maryam, observance-tsion-maryam,
  observance-gishen-maryam, observance-gebre-menfes-kidus, observance-abune-aregawi, observance-samuel-waldba, observance-kiros,
  observance-kristos-semra, observance-abraham-isaac-jacob, fast-nineveh, fast-prophets, fast-wednesday-friday, fast-gehadi,
  hymn-section-repentance-general, hymn-section-sacraments-holy-communion, hymn-section-sacraments-matrimony.
- Game pictures: all 22 load from their primary image after the release.

## Security

- No database, RLS, role or storage change. No service-role key anywhere. Drafts are not readable anonymously (0 rows).
- Studio publication guards restored until the six-state migration is deployed and verified.
- Local preview code is dev-only: a production build made with `VITE_LOCAL_PREVIEW=true` contains none of it (tested twice), and the
  deployed build is checked for no banner, no write guard, native `fetch` and no review route.
- `npm audit --audit-level=high` passes.

## Tests (see the Deployment section for live results)

Local, real browser, mocked network only where stated:
- 12-game matrix: full round, scoring checked against the answers actually given, replay, at 390 EN/AM and 1440 EN; open/start/no
  overflow at 430 and 768; review screen; write guard; mocked-network quiz race and picture counts; day/night themes.
- Suites with exit 0: TypeScript, targeted ESLint, production build, production-safety build, review inventory, picture rule,
  Finish the Mezmur, content, published bank, replay, play-complete, play-foundation, image catalog, Faith Challenges library and
  authorization, consolidation (unit, browser), hub, database-play, Bible Timeline (unit, feedback), Finish the Mezmur mix, solo
  journeys, live room, CMS image matching, picture-quiz feedback, Bible adventures, `git diff --check`.
- Pre-existing failures, identical on unchanged `main`: `test-content-studio-browser` (15 failures on this branch, 16 on main),
  `test-game-night-security-browser` (cannot find the "Display name" field), `test-faith-challenges-editor` (intermittent timeout
  on the import step; passed and failed on both main and this branch in separate runs).
- Linux CI on the release branch: `npm ci`, production build, `npm audit --audit-level=high` all pass. Cloudflare preview builds pass.
- Cloudflare preview builds have no Supabase variables, so they cannot exercise database-backed features; they were used to find the
  two crash fixes above, not as gameplay evidence.

## Rollback

Production before this release is Cloudflare deployment of `2e47248`. To roll back: in Cloudflare Pages → tewahedodaily → Deployments,
"Rollback to this deployment" on the previous production deployment, or `git revert -m 1 <release merge commit>` on `main` and push
(Cloudflare redeploys). No database state changes, so no data rollback is needed.

## Known limitations

- No database migration, import or publication (no credentials; editorial and rights approval not recorded).
- 27 registry images and 4 moderate dependency advisories remain.
- Pre-existing failing test suites above.
- `.npmrc` key triggers an npm "unknown project config" warning; it still works on npm 10/11.

## Deployment

- PR #18 merged at 2026-11-20 13:41 UTC as merge commit `8a61b5e` (release head `0ee8fbb`). #14 is marked merged by GitHub; #15 and #17 were closed with a note because `main` already contains every one of their commits (GitHub refused to retarget them for that reason).
- Final release commit checks before merging: Cloudflare Pages build passed; Linux CI on `0ee8fbb` (`npm ci`, production build, `npm audit --audit-level=high`) passed (run 44746333073).
- Cloudflare production deployment of `8a61b5e`: "Deploy successful". The live site serves the new bundle, `/robots.txt` returns text/plain, `/assets/*` returns `Cache-Control: public, max-age=31536000, immutable`, `/` keeps `max-age=0, must-revalidate`.
- Live 12-game journeys against https://tewahedodaily.pages.dev (guest, real production build and data): **70/70**. Every game played a full round with scoring checked against the answers actually given, and replay, at 390 EN, 390 AM and 1440 EN; every game opened with content and a start control at 430 and 768; hub counts at every width; Start waits for the question bank; picture counts with mocked failing media; day/night themes; no LOCAL PREVIEW banner, no write guard, native `fetch`, no review screen. 0 table writes, 0 console errors, 0 artwork URLs that failed. The only RPC called was `list_church_library_faq_suggestions`, which is declared STABLE (read-only).
- Live site smoke (guest): /, /hymns, /bible, /calendar, /library, /prayers, /search, /play, /play/game-night, /about and an unknown URL at 320 EN, 390 EN, 390 AM and 1440 EN: no horizontal overflow, no broken images, no crash screen, 0 page errors, 0 HTTP errors; the unknown URL shows the 404 page.
- Not verified live: signed-in progress and XP sync (no test account was used), Game Night with real players, and anything database-backed beyond public reads.
- Rollback target: the previous production deployment of `2e47248` (Cloudflare Pages → Deployments → Rollback), or `git revert -m 1 8a61b5e` on `main`.
