# Faith Challenges: local preview (2026-11-17)

LOCAL ONLY. This is a way to play and inspect all 12 Faith Challenges on one computer before anything is published. It is **not** a publication step: nothing is written to Supabase, nothing is deployed, no content is promoted.

Branch `local/faith-challenges-preview` (worktree `TewahedoDaily-preview`), created from PR #15's head `5450759`. Never pushed.

## Start, stop, open

```
cd c:\Users\eskew\github\TewahedoDaily-preview
npm run preview:local          # this computer only
npm run preview:local:lan      # also reachable from a phone on the same home network
```

| What | URL |
|---|---|
| Faith Challenges hub | http://127.0.0.1:5273/play |
| Review of all 834 consolidated drafts | http://127.0.0.1:5273/play/local-review |

Stop with **Ctrl+C** in the terminal that is running it. Needs `.env.local` in the worktree (already copied; git-ignored). Optional: `LOCAL_PREVIEW_PORT=5280 npm run preview:local` for another port.

What the launcher does: rebuilds the git-ignored review inventory (offline, no credentials), then starts the normal Vite **dev** server with `VITE_LOCAL_PREVIEW=true` and `VITE_PLAY_DATABASE_ONLY=false`. It refuses to start if a `VITE_*SERVICE_ROLE*` variable exists.

## What it plays

Every game uses the real engines and the bundled + generated banks that PR #15 consolidates (the same 834 rows). No database content is needed, so no empty games. Finish the Mezmur reads published hymn lyrics from Supabase with the public key (read-only, same as the public site) and never copies lyrics anywhere.

| # | Game | Content available locally (actual) | Status |
|---|---|---|---|
| 1 | Bible & Tewahedo Trivia | 226 questions (70 beginner, 116 growing, 40 challenge) | Playable. 10 cite unpublished Church Library books (cannot be published yet) |
| 2 | Finish the Verse | 119 excerpts (13 / 77 / 29) | Playable |
| 3 | Holy Emoji Challenge | 166 clues (30 / 121 / 15) | Playable |
| 4 | History Quest | 6 questions + 1 chronology (3 dated events) | Playable but tiny; all 7 are **source blocked** (library books unpublished) |
| 5 | Who Am I? | 132 cards | Playable. 6 have no verified Amharic claim |
| 6 | Match & Discover | 135 pairs | Playable. 4 source blocked |
| 7 | Bible Timeline | 38 timelines, 240 events | Playable |
| 8 | Bible Adventure | 6 stories, 18 scenes (3 each) | Playable (built-in illustrated scenes) |
| 9 | Church Feast Challenge | 12 pictures catalogued, **9 can be shown** | Playable; 3 skipped (no working image) |
| 10 | Guess the Saint | 10 pictures (all showable: the broken ones fall back to local files) | Playable |
| 11 | Icon Memory | 22 pictures catalogued, 19 can be shown | Playable; the 3 with no image are skipped |
| 12 | Finish the Mezmur | Built at play time from published hymns (2,486 with lyrics) | Playable |

Review-only, blocked or missing:
- **Source blocked: 21** records (14 Seven Sacraments, 7 History). Playable here for evaluation; they cannot be published until the Church Library books exist.
- **Editorial review required: 787** (766 generated drafts, plus the 21 blocked). Generated Amharic is not verified.
- **Translation review required: 783** (Amharic text present, not verified).
- **No Amharic text: 36.**
- **Missing / not in the 834:** Finish the Mezmur (source-only by design), the 220 pending generated questions and other held batches (they live in git-ignored `artifacts/faith-challenges`, are not in the manifest and are not shown here), and any image for the 3 feasts below.

## Review screen (`/play/local-review`)

Dev-only and read-only. Per-game status table, filters (game, label, search), and for each of the 834 records: game, title, content type, difficulty, English and Amharic fields, correct answer and explanation, sources (blocked ones flagged), artwork status, provenance (which file it came from), editorial review state, rights status, validation problems and stable ID. Labels: Existing bundled content, Validated generated draft, Source blocked, Editorial review required, Translation review required, No Amharic text, Amharic claim downgraded, Invalid. Held items carry a red **REVIEW ONLY** chip. Rights are shown as "Not recorded in the draft" because the repository does not record them. Nothing here approves, edits or promotes anything.

A watermarked sandbox for playing review-only content separately was **not built** (the local preview already plays every valid row for evaluation, with no server writes).

## Safety design

- `VITE_LOCAL_PREVIEW` only counts when `import.meta.env.DEV` is true. Production builds (including Cloudflare Pages previews) replace `DEV` with `false`, so the review screen, banner and guard are removed from the bundle. `scripts/test-local-preview-production-safe.mjs` builds with `VITE_LOCAL_PREVIEW=true` set (worst case) and fails if any preview-only code, text, route or inventory file ships. It caught a real leak while this was built: the dynamic import of the review screen still emitted a chunk until the `DEV` check was written at the import itself.
- **Write guard:** in the preview, the browser refuses every non-read request (anything but GET/HEAD) to the Supabase origin, even if you are signed in. Blocked attempts are counted on `window.__localPreviewBlocked`. The browser test confirms zero hosted write requests across all games.
- The preview forces bundled mode even if `VITE_PLAY_DATABASE_ONLY=true` is set locally (the cause of the "empty games" problem before). Production behaviour of that flag is unchanged.
- No SQL, no import script, no service-role key, no publish.

## Findings from real-browser testing

1. **Finish the Mezmur crashed on live data (fixed here, also affects production).** `buildFinishMezmurBank` threw `Cannot read properties of undefined (reading 'key')` whenever the sampled hymns included one of 15 lyric lines whose cleaning is not idempotent (e.g. `… /2/ ፣`, `ይ ቆረንጦስ 15:3`), taking the whole page down intermittently. Fix: track the correct answer by position instead of re-deriving it (`src/lib/play/finishMezmur.ts`). Regression test uses the two real lines; it fails without the fix.
2. **Broken artwork on the hosted media bucket.** 9 of the 22 catalogued picture URLs return HTTP 400 (`erget`, `debre-tabor`, `tsige`, `meskel`, `michael`, `gabriel`, `uriel`, `tekle-haymanot`, `petros-pawlos`). Six have a local fallback; three feasts (Ascension, Transfiguration, Zemene Tsige) have none, so their pictures simply vanished and the question had no picture. Fix here: picture games skip pictures that cannot load and say how many (`useLoadablePictures`, `LoadablePictures`). If every picture fails (offline) all are kept. **The real fix is content:** re-upload or re-link those images (needs rights confirmation).
3. **Hub counts overstated picture games (fixed).** The hub said 12 / 10 / 22 pictures; 9 / 10 / 19 can be shown. The three picture cards now count showable pictures and say how many more cannot be shown right now.
4. **First-load race in quiz setup (fixed).** The setup screen briefly showed only the tiny bundled pool ("Only 3 match"), and a fast tap on Start began a short round. Start is now disabled and the count line says "Loading the full question bank…" until the bank has loaded (a failed load still lets the built-in questions be played, as before).
5. **History Quest is thin, and now says so (fixed).** 6 questions, all citing unpublished Church Library books. History Quest shows a notice with the number of such questions; their citations stay plain text.
6. **Icon Memory exposes names in the DOM** for face-down name cards (screen readers use the "face down" label, so users are fine; automation can read it).
7. 6 Who Am I? cards have no verified Amharic explanation (already known).

## Artwork that is missing (needs a content owner, not code)

These hosted picture URLs return HTTP 400 and have **no local fallback**, so the game skips them. They need to be re-uploaded or re-linked, with the image rights confirmed. Nothing was invented or uploaded.

| Picture id | Used by | Hosted path (bucket `content-media`) |
|---|---|---|
| `erget` (Ascension) | Church Feast, Icon Memory | `calendar/christ/ascension-…` |
| `debre-tabor` (Transfiguration) | Church Feast, Icon Memory | `calendar/christ/debre-tabor-…` |
| `tsige` (Zemene Tsige) | Church Feast, Icon Memory | `calendar/general/zemene-tsige-…` |

Six more URLs also return 400 (`meskel`, `michael`, `gabriel`, `uriel`, `tekle-haymanot`, `petros-pawlos`); they still display through their local fallback files, but the hosted copies should be fixed too.

## Files

New: `scripts/local-preview.mjs`, `scripts/play/build-local-review-inventory.ts`, `scripts/test-local-preview-browser.mjs`, `scripts/test-local-preview-production-safe.mjs`, `scripts/test-local-review-inventory.ts`, `scripts/test-loadable-pictures.ts`, `src/lib/localPreview.ts`, `src/lib/localPreviewGuard.ts`, `src/lib/play/localReviewTypes.ts`, `src/lib/play/useLoadablePictures.ts`, `src/components/play/LoadablePictures.tsx`, `src/components/play/LocalPreviewBanner.tsx` (+css), `src/pages/play/LocalPreviewReview.tsx` (+css).

Changed: `src/App.tsx` (dev-only route), `src/main.tsx` (install guard), `src/lib/play/publishedContent.ts` (preview forces bundled mode), `src/pages/play/PlayHubPage.tsx` (banner), `src/pages/play/PlayGamePage.tsx` (picture availability wrapper), `src/lib/play/finishMezmur.ts` (crash fix), `src/components/play/QuizGame.tsx` and `HistoryQuestGame.tsx` (Start waits for the bank; History source notice), `scripts/test-finish-mezmur.ts` (regression test), `vite.config.ts` (dev-only inventory endpoint), `package.json` (`preview:local`, `preview:local:lan`), `.gitignore` (`.local-preview/`).

## Test it yourself

1. `npm run preview:local`, open http://127.0.0.1:5273/play. A "LOCAL PREVIEW" banner is on the hub.
2. Open each of the 12 cards, finish a round, press Play again. Try Amharic (EN/አማ switch) and the day/night toggle.
3. Open `/play/local-review`, filter "Source blocked", open a few cards.
4. Phone: `npm run preview:local:lan`, then on a phone on the same home network open the first address it prints (your Wi-Fi/Ethernet one, not the WSL or VirtualBox ones). Allow *Private* networks if Windows Firewall asks. Anyone on the network can open it while it runs; Ctrl+C stops it. Not yet tested from a real phone.

## Before any public step (separate, needs approval)

1. Content owners: add and approve the History and Seven Sacraments Church Library books; replace or re-link the 9 broken artwork URLs; confirm image licences.
2. Editorial review of generated content and Amharic through the Studio workflow (including the 220 held questions).
3. Hosted staging project: apply the PR #15 migration without committing, verify the catalog, run the 834-row draft import, verify real JWT/PostgREST roles, run the CMS open/edit/save matrix and the 12-game rounds against database rows.
4. Publish only reviewed rows through the workflow; then decide `VITE_PLAY_DATABASE_ONLY` with every game verified non-empty.
5. PR #14's merge to `main` may deploy production; review that separately.

## Verification (all run on this computer, exit codes from one clean sequential run)

| Check | Exit | Result |
|---|---|---|
| `scripts/test-local-preview-browser.mjs` (12 games, real engines) | 0 | 66/66: full rounds + replay at 390 EN, 390 AM, 1440 EN; open/start/no-overflow smoke at 430 and 768; hub at all 4 widths and AM; review screen; write guard |
| Hosted write requests seen by the browser | – | 0 |
| Console errors during the matrix | – | 0 |
| Distinct hosted artwork URLs that did not return an image | – | 9 (known, see findings) |
| `test-local-preview-production-safe.mjs` (build with the preview flag set) | 0 | none of 8 preview-only markers in 364 files |
| `test-local-review-inventory.ts` | 0 | 9/9 |
| `test-loadable-pictures.ts` | 0 | 4/4 |
| `test-finish-mezmur.ts` (incl. new crash regression) | 0 | 15/15 |
| `test-faith-challenge-content.ts` / published bank / replay (2,567) / play-complete | 0 / 0 / 0 / 0 | pass |
| `test-faith-challenges-authorization.mjs` | 0 | pass |
| `test-consolidation.ts` / consolidation browser | 0 / 0 | 16 / 18 |
| Hub browser / database-play browser | 0 / 0 | all passed / 18 |
| Bible Timeline unit / feedback browser | 0 / 0 | pass / 812 |
| Finish the Mezmur mix browser / solo journeys | 0 / 0 | pass / 11 |
| `tsc -b`, targeted ESLint, `npm run build`, `git diff --check` | 0 | pass |

Day and night themes were checked separately (hub, Match, Church Feast, review screen at 390 and 1440): the theme switched and nothing overflowed. Not tested: a real phone, real Amharic reading by a native speaker, and scored rounds against database rows (needs staging).

Score checks: for quiz and picture games the test compares the score on the results screen with the number of correct answers it actually gave (read from each answer's correct/incorrect state), so scoring is verified, not just completion. Who Am I? and Match/Memory/Timeline/Adventure/Mezmur are verified by completing the real mechanic and seeing the completion screen.
