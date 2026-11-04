# Faith Challenges database content — local implementation and cutover blockers

Date: 2026-11-04. **Production cutover BLOCKED.** No hosted database was queried or modified, SQL executed, content imported, environment file changed, dependency installed, or Git index/commit/deployment operation performed.

Follow-up authorization: the user subsequently chose **Use database-only mode locally now**. The ignored `.env.development.local` now enables `VITE_PLAY_DATABASE_ONLY=true` for development only. Actual Vite environment resolution confirms production remains unchanged. No endpoint, credential, publication gate or database content changed. The initial implementation's opt-in/default-runtime notes below remain historical; local development now takes the database-only path and may show empty or error states until published sources are available.

## Important scope distinction

The new `VITE_PLAY_DATABASE_ONLY=true` path loads all twelve Studio formats from validated published Supabase rows, without substituting a static question, story, timeline, image deck, clue or pair. It is opt-in: the flag is unset by this task. The existing runtime remains unchanged by default because the user explicitly required equivalent published database paths to be verified before static fallbacks are removed. Local browser/PostgREST fixtures are not live schema/RLS or published-content verification.

Original content files and default runtime branches remain. Some static data is still imported by existing validator/artwork/editor modules; this task does not claim static banks were removed from public build artifacts. After approved staging content and authorization verification, production cutover and removal of the legacy branch/bank dependencies are separate pending steps. Simply enabling a Vite flag against production is not an authorization or isolation boundary.

## Route/content inventory and CMS-to-public coverage

All routes were inventoried from `src/App.tsx` (`/play`, twelve games, and Game Night). No router rewrite or new game route was added.

| Route/game | Existing runtime source | Payload in new database-only path | Studio support / remaining backend work |
|---|---|---|---|
| `/play/trivia` | `approvedContent.ts` + `loadPublishedPlayQuestions` merged bank | Existing per-row `PlayQuestion`; published `play_content_items` only | Existing quiz editor, bilingual answers/hints/explanation, sources, difficulty/category and six-state RPC. Daily selection/level URL preserved. Live permissions still unverified. |
| `/play/emoji` | Same static/DB merge, emoji fields | Existing emoji `PlayQuestion` | Same existing server question workflow; no fallback in new path. |
| `/play/finish-the-verse` | Same static/DB merge, exact excerpt | Existing verse `PlayQuestion` | Existing exact-passage selector/validation and before-publication quote check retained. No Bible source modifications. |
| `/play/history` | Same quiz merge plus hardcoded `HISTORY_TIMELINE` inside the engine | Existing quiz rows plus separately discriminated History event/year activity | Existing two editors retained; injected chronology drives ordering, labels, completion summary and sources. Database mode uses stored hints, with no invented fallback clues. `people` category supports new identity questions without relying solely on old IDs. AD chronology only; schema extension required. |
| `/play/who-am-i` | `WHO_AM_I_CARDS` merged with published per-card reader | Existing per-card rows or versioned identity activities | Existing identity editor, saved-game preview and bilingual review retained. Public reader supported; publication gate remains until staging. No invented portraits/progressive clues. |
| `/play/match` | `MATCH_PAIRS` merged with published per-pair reader | Per-pair rows or validated pair-collection activities | Existing pair editor retained. Collection saves use the versioned schema, not an array inside an old single-pair payload. Duplicate identities/sides rejected by existing validation; fewer than four public pairs shows preparation state. 4/6/8 boards retained. |
| `/play/bible-timeline` | `bibleTimeline.ts` / `TIMELINE_CHAINS` | Versioned `TlChain` activity | Existing chain/event editor + injected round builder. Chronology order/source/grader and difficulty mechanics retained. No fabricated eras/dates. Backend validator required. |
| `/play/feasts` | `imageCatalog.ts` / `feastImages()` | Versioned `PlayImage[]`, feast subset | Existing image editor, approved media references, bilingual labels/explanations and source picker. Drafts with removed images cannot enter public content. Backend validator required. |
| `/play/saints` | `imageCatalog.ts` / `holyPersonImages()` | Versioned `PlayImage[]`, saint/angel subset | Same; correct subject/image/source constraints retained. No arbitrary uploads or clue fields. |
| `/play/icon-memory` | `PLAY_IMAGES` inside the engine | Versioned `PlayImage[]` deck | Existing image/memory editor; injected deck supplies setup artwork and deals. Unsupported pair sizes disabled when the published pool is smaller. No hidden static deck. Backend validator required. |
| `/play/adventures?story=…` | `bibleAdventureStories.ts`, artwork/hotspot bindings | Versioned `BibleAdventureStory` activity | Existing three-scene editor and actual artwork/interaction engine reused. Published story bank supplies gallery and route lookup; refresh/Back/Forward tested. Only supported six artwork/object bindings and linear discover/question interactions remain. Arbitrary story branches/new bindings are not supported and remain rejected. |
| `/play/finish-the-mezmur` | Already database-driven: `mezmur_public` → `mezmurLyricsSource.ts` → lyric-derived round builder | Published source-only Play activities select slugs; `selectedMezmurSource.ts` re-reads those slugs from `mezmur_public` | Existing Studio source selector and gameplay engine reused. Copied lyrics/media are stripped from the shared activity and rejected by its validator. At least four eligible lyric sources/five usable lines required by the existing engine. Source/rights publication must be verified. No changes to hymn records. |
| `/play/game-night` and its existing guide/host/join views | Supabase room RPCs; existing security proposal uses `play_private.game_night_questions` with redacted room state | **Unchanged private RPC path**, deliberately excluded from the public activity reader | Answer-secrecy/reward/join logic untouched. A secure staff authoring RPC for the private bank still needs approved backend support. Never put Game Night private answers in public Play payloads. Mixed guide is navigation, not mixed-mechanic multiplayer. |
| `/play` hub and grouping/instructions | Existing catalog/mode/presentation configuration | Unchanged presentation, not a question fallback | Existing local settings proposals retained; public hub settings publication still lacks verified backing. Item visibility uses editorial status; versioned activity ordering is editable metadata. |

`MezmurGame.tsx` is a retained legacy engine checked by existing completion tests; the public route uses `FinishMezmurGame`. It was not made a second content source.

## Implementation

- Shared typed loader requests only one `game_type`, `status='published'` and non-null publication timestamp; validates returned identifiers, metadata, game-specific format, sources and locales independently. Pages of 100, maximum 1,000, deterministic published-time/ID scan and activity sort order. Oversized/conflicting/invalid banks fail closed.
- In-flight requests deduplicate. Completed banks are not TTL-cached: a new mount/session rechecks publication. Retry clears old content, timeouts abort requests, and effect cleanup prevents an old game/route result from populating another view. Existing source-publication helper remains the source gate; effective deployed source policies must be checked in staging.
- A versioned `studio-activity-v1` envelope stores the existing actual Studio draft type, matching stable ID, name, category, difficulty, order, reviewed locales and every source reference. Legacy quiz/card rows remain compatible. Public projections omit unreviewed Amharic while preserving it for editors.
- Existing CMS gains **Save shared activity draft**, available only in opt-in configuration after saving a valid local draft. It uses existing staff authorization, `play_content_items`, both identifiers, draft-only creation, reopen equality checks and explicit database errors. The original local copy is preserved. Category, difficulty, display order and Amharic-review metadata are editable. Failed backend requests never claim saved success.
- Versioned activity publication is hard-blocked in the service and unavailable in the UI pending the approved server validators/RLS/staging. Existing legacy quiz review flow remains. Legacy forms reject activity envelopes rather than reinterpret them as trivia.
- Empty and failed database banks display preparation/error/Retry states with navigation, never static or unpublished substitutes. No source content, scoring, progression, Game Night RPC or reward authorization logic was changed.

## Offline conversion, content gaps and rights

`scripts/prepare-play-content-migration.ts` prepares a review manifest only. It has no database client calls, apply option, approval or publication path. Stable IDs and SHA-256 hashes are deterministic; it refuses output-file overwrite. Quiz IDs remain intact; activities use stable `legacy-<game>-<identity>` IDs. Images are grouped into valid distinct decks, not duplicated to fill boards. Finish Mezmur and Game Night require their separate source/private-bank workflows.

Dry run using synthetic media origin: **68 candidates, 62 structurally valid, 6 invalid**. The six invalid existing identity/pair records retain their untranslated reviewed-Amharic explanations; the script does not silently change editorial flags. All 68 candidates have `rightsStatus='unverified'`, `editorialReviewRequired=true`, `status='draft'`, `importAllowed=false`. Structural validity is not rights clearance or biblical/native-language approval. Actual published database counts are **UNKNOWN**; no production inventory or import occurred.

Read-only/offline command (replace the public origin for a real review export; it does not connect):

```powershell
node node_modules/tsx/dist/cli.mjs scripts/prepare-play-content-migration.ts --media-origin https://migration-fixture.invalid
# Optional new review file; use a real approved PUBLIC media origin for actual references:
node node_modules/tsx/dist/cli.mjs scripts/prepare-play-content-migration.ts --media-origin https://<public-project-ref>.supabase.co --out "$env:TEMP\play-content-review.json"
```

Neither command imports content. Resolve source/rights/translation issues and reconcile existing identifiers before separately authorizing any draft import through the existing validated workflow. The full manifest also contains format-specific activities not supported by the legacy question-array importer; do not feed it into that importer or bypass its validator.

## Exact changed files

New application modules:

- `src/lib/play/studioActivity.ts`
- `src/lib/play/publishedContent.ts`
- `src/lib/play/selectedMezmurSource.ts`
- `src/hooks/usePublishedPlayContent.ts`
- `src/components/play/DatabaseContentStatus.tsx`
- `src/pages/play/DatabasePlayGame.tsx`

Modified application modules:

- `src/lib/play/contentStudio.ts`
- `src/lib/play/questionLibrary.ts`
- `src/lib/play/questionLibraryService.ts`
- `src/lib/play/coverage.ts`
- `src/pages/admin/studio/GameContentStudio.tsx`
- `src/pages/admin/PlayContentReview.tsx` — only narrow legacy-format/type guards; most existing diff is prior work.
- `src/pages/play/PlayGamePage.tsx`
- `src/pages/play/AdventurePage.tsx`
- `src/components/play/BibleTimelineGame.tsx`
- `src/components/play/HistoryQuestGame.tsx`
- `src/components/play/IconMemoryGame.tsx`
- `src/components/play/FinishMezmurGame.tsx`

New scripts/tests: `scripts/prepare-play-content-migration.ts`, `scripts/test-database-play.ts`, `scripts/test-database-play-browser.mjs`. Modified test: `scripts/test-play-complete.mjs` checks selected injected story lookup and explicitly forbids static registry use in the database Adventure path, replacing its old static-variable-name assertion. Existing runtime browser coverage backs that updated contract.

Documentation: this report, the separate activity-readiness proposal and read-only preflight SQL, plus prepended coordination updates in HANDOFF/PROJECT_STATUS/TASK_BOARD and a capability note in the existing Studio report. Existing SQL migration definitions, package manifests, source records, V4/V5 and security proposal code remain unchanged.

Scoped pre-edit source copy and index identity: `%TEMP%\td-database-play-before-D8xIMV`. The repository was already dirty, including a staged/unstaged README; it was not reset, cleaned, stashed, restored or restaged.

## Verification and remaining approval boundary

Browser authentication and API responses are synthetic and external requests blocked in the database/Studio harnesses; these tests do not establish live Supabase schema, grants, RLS, storage rights or private-bank authorization. Every final command below exited **0**.

| Command | Verified result |
|---|---|
| `node node_modules/tsx/dist/cli.mjs scripts/test-database-play.ts` | 28/28: twelve formats + chronology, unpublished metadata rejection, sources, paging/dedup/fresh-session unpublish, timeout/abort, wrong format/media/IDs, locale review, source-only/restricted lyrics, order, unauthorized saves, publication hard gate, deterministic review manifest |
| `node scripts/test-database-play-browser.mjs` | 17/17: all twelve engines (including Adventure), typed public fixtures, all twelve unpublished empty states with no fallback, outage/retry, story deep link/refresh/Back/Forward, shared draft save/reopen, mobile Amharic, no XP writes |
| `node scripts/test-content-studio-browser.mjs` | Existing 38/38: twelve editors/previews, image/delete/recovery, editorial flow, static-safe default mode and permissions |
| `node scripts/test-studio-coverage-browser.mjs` | Existing 17/17, desktop/mobile library/settings/coverage/campaign |
| `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts` | Existing 40/40 |
| `node node_modules/tsx/dist/cli.mjs scripts/test-studio-catalog.ts` | Existing 9/9 |
| `node node_modules/tsx/dist/cli.mjs scripts/test-studio-card-adapters.ts` | Existing 14/14 |
| `node node_modules/tsx/dist/cli.mjs scripts/test-bible-timeline.ts` | PASS, original chains/round generation/grader/seen-state checks |
| `node --experimental-strip-types --no-warnings scripts/test-bible-adventures.mjs` | PASS all six stories / eighteen scenes: desktop, touch/keyboard, 360/390px, night/reduced motion, visible animations, wrong answers, replay and existing XP dedupe. Run with process-only synthetic Supabase URL/key and database flag false; no environment file edits or production endpoint used. |
| `node scripts/test-play-foundation.mjs` and `node scripts/test-play-complete.mjs` | Both PASS; completion assertion now checks the intentionally injected story bank and forbids a static Adventure fallback in DB mode |
| `node scripts/test-faith-challenges-editor.mjs` | PASS native CMS auth/editor/approval/publication/confirmed unpublish/import fixture flow |
| `node scripts/cms-auth-smoke.mjs` | PASS invalid login and authorization/outage/restoration regressions |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` | PASS; expected Node missing-public-environment warning; no connection |
| `node scripts/test-faith-challenges-authorization.mjs` | 180 structural cases PASS; live RLS UNKNOWN |
| `node scripts/test-game-night-security-browser.mjs` | Existing mocked guest/room/reveal/reward regression PASS |
| `node node_modules/tsx/dist/cli.mjs scripts/prepare-play-content-migration.ts --media-origin https://migration-fixture.invalid` | Review-only summary: 68 candidates, 62 valid, 6 invalid, imports disabled |
| `node node_modules/typescript/bin/tsc -b --pretty false` | PASS |
| `npm.cmd run build` | PASS TypeScript + Vite/PWA; unrelated existing lyric `::highlight(lyric-match)` warning remains |
| Scoped ESLint on all 22 changed code/test files | PASS |
| `node --check scripts/test-database-play-browser.mjs`; `node --check scripts/test-play-complete.mjs` | PASS |
| Scoped Git/new-file whitespace and before/after index-identity checks | PASS; staged README preserved; original `contentService.ts` byte-for-byte unchanged |

Failures during development were fixed and rerun: a new eager activity-validator import broke an unconfigured legacy service fixture (fixed by lazy validation); the completion source assertion required the old static variable name (replaced with the new strict source contract); new browser fixtures initially omitted a published Library source and used an incorrect Memory button label/early Adventure title capture (fixture/timing corrected without relaxing assertions). The Finish Mezmur effect now leaves reset state changes in its retry event and performs only async response updates from the loading effect; scoped lint passes without suppressions. No final test failures remain.

Final database-only screenshot reviewed: `%TEMP%\tewahedo-studio-qa-ZgNAyg\database-empty-am-390.png`. Existing engine screenshots are produced by the Adventure suite; mocked pixels and browser assertions do not verify live media approval or actual screen-reader behavior.

See `proposed-migrations/20261104_play_activity_readiness.md` and its read-only preflight SQL. No executable production DDL is guessed without current catalog evidence. The existing six-state migration remains unapproved for production. A server-side activity validator/constraint amendment, secure Game Night staff authoring, rights/editorial clearance, draft imports, actual published banks and real multi-role staging tests remain prerequisites. Remove the legacy fallback branch only after those pass and production cutover is explicitly approved.
