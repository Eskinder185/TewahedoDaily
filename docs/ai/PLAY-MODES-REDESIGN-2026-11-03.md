# Play modes, Game Night and CMS organization — 2026-11-03

## Implemented locally

The highest-value coherent increment is complete: five shared gameplay-mode groups, a reorganized public Play page, an honest Game Night landing/guide, matching CMS navigation and counters, and a deterministic anti-repetition foundation. All twelve routes and existing engines remain. No database, gameplay scoring, XP, publication services, dependencies or migration definitions were changed.

The existing twelve-game studio was reused rather than rebuilt. Its dedicated editors, unsaved-change guard, local exports/import previews, source validation, previews and editorial gates remain. See `GAME-CONTENT-STUDIO-2026-11-03.md` and its existing unapplied readiness proposal. This increment is **not** completion or activation of mixed-mechanic multiplayer or twelve server-backed publishing pipelines.

### Public navigation

| Mode URL | Existing games |
| --- | --- |
| `/play?mode=knowledge` | Trivia, History Quest, Church Feast Challenge |
| `/play?mode=timeline` | Bible Timeline, History Quest chronology |
| `/play?mode=visual` | Icon Memory, Guess the Saint, Who Am I, Emoji, Match, Feasts |
| `/play?mode=word` | Finish the Verse, Finish the Mezmur |
| `/play?mode=story` | Bible Adventure |

History and Feasts deliberately occur in multiple groups; this is navigation metadata, not another classification database. History retains its existing timeline/people/mystery/match selector. The Feast engine retains its picture/reveal mechanics. Games are not converted into quizzes.

`/play` presents Mixed Challenge Night, five mode cards, All 12 Games and existing progress/recent replay links. Selecting a mode pushes a URL with `#games`, preserving level and clearing the older topic filter. Existing `?section=music|scripture|pictures|history|group&level=…` links still work. Back/Forward and refresh restore the selection. Conflicting filters display an empty-state explanation. No existing deep link was removed and no new router entries were needed.

Recent-game links are derived from existing completion history and a game whitelist. They restart games; they do not claim to restore unsaved rounds. No new progress writes or rewards are introduced. Removed the inaccurate hub promise of universal cross-device solo progress: existing trusted reward restrictions still apply.

### Game Night boundaries

- `/play/game-night` offers Mixed Challenge Night (recommended shared-screen guide), Custom Game Night and Join with a code.
- `?view=mixed|host|join` makes these landing subviews shareable and restores them through history. Existing room credentials remain in their existing session storage location.
- The mixed guide links five independent games plus the existing Mezmur alternative. Return through browser Back. There is no combined session score, automatic progression, shared room or cross-game deduplication in this guide.
- Custom rooms retain only the existing category, difficulty and 5/10/20-question options. The interface explicitly identifies unsupported mixed mechanics, configurable timers, teams and player-limit settings. There are no pretend controls.
- Existing host/member/token checks, RPC calls, revealed-only explanation rendering, server scoring, rejected-join handling and verified reward receipts are untouched. UI tests are mocked, **not live authorization proof**.
- Server mixed-round handlers, private reviewed questions, effective grants/RLS, durable failed-join counting and concurrency/reward verification remain staging blockers from `SECURITY-SPRINT-3-2026-11-03.md` and `GAME-NIGHT-HOSTING-2026-11-03.md`.

### CMS and editor capability matrix

Both `/admin/play` and `/admin/play/studio` use the five-mode navigation. Studio mode URLs filter the same existing game libraries and saved records. Search, status, sort and game editors remain in that studio. Six status counters cover **loaded studio records**; errors explicitly mark partial counts rather than claiming database totals. Attention counts identify rejected/invalid loaded records. The legacy question library remains available for unsupported or incompatible server payloads.

| Game | Existing player source / editor format | Verified local editing/preview scope | Server publishing status |
| --- | --- | --- | --- |
| Trivia | Published `PlayQuestion` plus existing approved fallback | Bilingual four-choice cards, explanation/source | Existing question API; hosted permissions unverified |
| History | Published `PlayQuestion` + local `HISTORY_TIMELINE` | Quiz editor and separate event/year chronology preview | Questions use existing API; chronology remains local |
| Emoji | Published `PlayQuestion` | Emoji/clue/answer preview | Existing question API; hosted permissions unverified |
| Finish Verse | Published `PlayQuestion` and exact Bible sources | Verse selection, exact quote validation, answer preview | Existing API; requires eligible sources and review |
| Who Am I | Local `WhoAmICard` bank | Identity/answer/source cards and guessing preview | Local drafts only; no invented portrait/reveal-order fields |
| Match | Local `MatchPair[]` bank | Bilingual pair editing/reorder and interactive matching | Local drafts only |
| Bible Timeline | Local `TlChain` | Ordered events/source/hints and keyboard preview | Local drafts only; no unsupported date schema |
| Adventure | Local six `BibleAdventureStory` records | Existing scene/choice/discovery paths, validation and playthrough | Local drafts only; arbitrary branching/new scene IDs blocked |
| Finish Mezmur | Published hymn lyrics via existing hymn service | Existing lyrics formats and real deterministic lyric challenge preview | Studio local drafts only; use hymn editorial workflow for public data |
| Feasts | Local approved `PlayImage[]` | Approved existing image cards and recognition preview | Local drafts only; no invented calendar metadata |
| Saints | Local approved `PlayImage[]` | Existing person images, bilingual explanation/source preview | Local drafts only; unsupported progressive portrait schema blocked |
| Icon Memory | Local approved `PlayImage[]` | Existing approved pairs/card counts and flip-match preview | Local drafts only |

Every claimed server workflow is backed only by existing services and offline browser fixtures. No live Create→Publish→Public verification was performed. Editors cannot publish local formats or overwrite published questions; existing duplication/versioning gates remain. No competing migration was created.

### Anti-repetition foundation

`challengeSession.ts` accepts adapter-supplied stable question/content/subject/source/equivalence IDs, topic, mechanic, difficulty and reviewed/published eligibility. It reuses `questionHistory.selectUnseen`. It never repeats an exact/equivalent identity within the supplied session history; it prefers different adjacent subjects/sources and mechanics, balances topics, then prefers unseen questions. It returns a bounded partial selection and explicit warnings if eligible content or variety is insufficient.

This is a pure tested selection helper, **not connected to current engines, Game Night RPCs or the shared-screen guide**. Existing per-game seen histories remain unchanged. Cross-game stable-ID adapters and server-side enforcement must be approved/tested before claiming cross-game runtime prevention. Frontend metadata is not an authorization boundary. No runtime AI calls or fabricated content are used.

## Exact files for this increment

New:

- `src/lib/play/gameModes.ts`
- `src/lib/play/challengeSession.ts`
- `src/components/play/GameModeNavigation.tsx`
- `src/components/play/GameModeNavigation.module.css`
- `src/components/play/GameNightLanding.tsx`
- `scripts/test-play-modes.ts`
- `scripts/test-play-modes-browser.mjs`
- this report

Modified (preserving pre-existing dirty changes):

- `src/pages/play/PlayHubPage.tsx` and `.module.css`
- `src/pages/play/GameNightPage.tsx` and `.module.css`
- `src/pages/admin/PlayContentReview.tsx` (shared navigation only)
- `src/pages/admin/studio/GameContentStudio.tsx` (mode filter and loaded-record dashboard)
- `docs/ai/PROJECT_STATUS.md`, `TASK_BOARD.md`, `HANDOFF.md` (dated progress notes)

## Verification

All commands below were run locally; exit 0 unless explicitly noted. Existing installed packages were used. Browser services were synthetic/intercepted; no SQL, hosted Supabase writes or paid AI calls occurred.

| Command | Result |
| --- | --- |
| `node node_modules/tsx/dist/cli.mjs scripts/test-play-modes.ts` | 17/17 deterministic grouping, history, eligibility, identity/equivalence, balancing and shortage checks |
| `node scripts/test-play-modes-browser.mjs` | 10/10: all twelve real routes, five modes, URL/history/refresh, legacy filters, recent replay, no card/progress overlap, Game Night boundaries, CMS modes, 360/390/1280px, English/Amharic, day/night, reduced motion, touch and keyboard focus |
| `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts` | Existing 36/36 |
| `node scripts/test-content-studio-browser.mjs` | Existing 26/26; every game edited/saved/reloaded/previewed, mocked publication/access checks |
| `node scripts/test-play-foundation.mjs` | PASS |
| `node scripts/test-play-complete.mjs` | PASS |
| `node node_modules/tsx/dist/cli.mjs scripts/test-bible-timeline.ts` | PASS |
| `BT_PORT=5298` plus synthetic public Supabase variables; `node scripts/test-bible-timeline-feedback.mjs` | 812/812 |
| `node --experimental-strip-types --no-warnings scripts/test-bible-adventures.mjs` | PASS: six stories/18 scenes, visible state, wrong answers, replay/local XP, mouse/keyboard/touch, responsive/reduced motion |
| `node scripts/test-game-night-hosting.mjs` | PASS mocked host flow and error diagnostics |
| `node scripts/test-game-night-security-browser.mjs` | PASS mocked rejected joins, selection reset, reveal UI and reward receipt retry |
| `node scripts/cms-auth-smoke.mjs` | PASS authentication denial/success/restoration/outage/retry/sign-out |
| `node scripts/test-faith-challenges-editor.mjs` | PASS mocked creation/persistence/preview/review/approval/publication/unpublish/access |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` | PASS; expected missing-environment warning in Node-only test, no connection |
| `node scripts/test-faith-challenges-authorization.mjs` | PASS 180 structural role/transition cases; runtime RLS UNKNOWN |
| `node scripts/test-faith-challenges-live-reconciliation.mjs` | PASS structural proposal checks/180 cases; no SQL executed |
| `node scripts/test-navigation-history.mjs` | First run: 20 pass/1 mobile scroll timeout. Rerun: 21/21. Intermittent cause unresolved; not classified as pre-existing or a proven regression. No assertions weakened or scroll code changed. |
| `node node_modules/typescript/bin/tsc -b --pretty false` | PASS |
| `npm.cmd run build` | PASS TypeScript + production build |
| Targeted ESLint for changed TS/TSX and the two new scripts | PASS |
| `node --check scripts/test-play-modes-browser.mjs` | PASS |
| Scoped `git diff --check` plus trailing-whitespace check for new files | PASS |

Browser artifacts: `%TEMP%\tewahedo-play-modes-*` and `%TEMP%\tewahedo-studio-qa-*`. Desktop mode cards, full mobile Play, mobile Amharic Game Night and desktop CMS screenshots were visually reviewed. Remote requests are blocked: missing remote images in fixture screenshots are not evidence of a production asset outage. Real screen-reader output and native Amharic terminology review remain unverified.

## Remaining work and approval boundaries

1. Apply **no** SQL as part of this increment. Follow existing reconciliation/security/staging proposals for hosted status/permissions and private questions. Production remains blocked until actual effective-permission and concurrent-request tests pass.
2. Mixed multiplayer needs trusted per-mechanic round schemas, private payload projection/reveal, server validation/scoring, host transitions, replay/reward guards and real staging tests. Do not bolt client-selected answers or local scores onto current RPCs.
3. The eight local studio formats and History chronology need the existing proposed compatible adapters/versioning, preserving public banks until proven. Arbitrary Adventure branches, new portrait clues, unverified source metadata and audio-rights changes remain unsupported.
4. Integrate anti-repetition only after stable cross-game subject/equivalence IDs are verified. Do not derive authoritative equivalence from title similarity or client publication flags.
5. Investigate the intermittent mobile history-scroll test separately; keep its assertions intact. Check actual media availability and native Amharic labels on the approved deployment target.

Rollback is a local code review operation: reverse only this increment's hunks/new modules after preserving later edits. Do not reset whole files or delete earlier studio/navigation/security work. No database rollback is necessary because no database changes were executed. No staging, commits, pushes, merges or deployment were performed.
