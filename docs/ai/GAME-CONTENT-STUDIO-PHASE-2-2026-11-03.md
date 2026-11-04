# Unified Faith Challenges Studio — Phase 2

Date: 2026-11-03. Local code and offline fixture verification only. No SQL, hosted Supabase changes, installation, Git index operations or deployment.

## Interface cleanup

The apparent duplicate experience came from two routed interfaces: `/admin/play` still mounted the large `PlayContentReview` question-management page, with a link to the separate Visual Studio. The Studio itself did not mount that component underneath it. The main route now mounts **GameContentStudio directly**, as does the preserved `/admin/play/studio` alias. The old question page is no longer imported/routed by App; its source, services, validators and preview dependencies were not deleted.

`/admin/play/import` is a separate, staff-guarded **Advanced import & data tools** action. It preserves validated server question-array imports with preview and explicit confirmation, draft-only insertion, duplicate ID rejection, authorized full-record export, and confirmed archive/unpublish recovery. It is not a second editor: no legacy game picker, question forms or management cards are embedded at the bottom of the Studio. Older `/admin/play?tab=import` bookmarks redirect to the tool. Existing main query filters and `/admin/play/studio` editor URLs remain usable.

The Studio retains five mode categories, all twelve dedicated editors, unified local/server library, search/status/sort plus category/difficulty/language filters, source validation, previews, duplication, editorial controls and unsaved-navigation protection. The twelve-game chooser, counters and long introductory notice hide while an editor is open, bringing the workspace into view. Incompatible legacy server records are counted visibly and remain available for inventory/export/recovery in data tools; nothing is silently repaired or deleted. Unsupported legacy lyric quiz rows do not become public hymn edits.

## Selected adapters: Who Am I and Match & Discover

These are the simplest two of the eight previously local-only formats because existing `play_content_items` draft schemas already represent **one WhoAmICard** or **one MatchPair**. They do not need invented image, clue, branch or timeline fields.

| Capability | Who Am I | Match & Discover |
| --- | --- | --- |
| Saved local data | Existing versioned identity draft | Existing versioned pair collection |
| Actual engine test | Timed hot-seat identity engine | Matching engine, including completed board and explanations |
| Existing server draft editing | Single card reopens/saves in Studio | Single pair reopens as a one-element editor collection; saving an array into one DB row is rejected |
| Public reader | Strict published-only WhoAmICard reader | Strict published-only per-row MatchPair bank reader |
| Static fallback | Original WHO_AM_I_CARDS preserved | Original MATCH_PAIRS preserved; public 4/6/8 board sizes retained |
| Publication | Still blocked in UI/service pending verified DB support | Still blocked in UI/service pending verified DB support |

### Reader and validation details

- Reuses the existing Play content service, `validateQuestionDraft`, existing card types and public-source availability helper. Shared source-path validation was extracted from the Studio into a small pure module so public engines do not import the full Studio/game banks.
- Requests only matching `game_type`, `status='published'`, non-null `published_at`, ordered publication timestamps, with a 1,000-row bound. Response validation independently checks status/timestamp, `question_id=stable_id=payload.id`, category/difficulty, locales, source references and actual card fields. Malformed responses/duplicate IDs reject the bank and retain static content with a retry/error indication.
- Stable IDs override matching static identities; conflicting answer/side labels are excluded to avoid ambiguous matching. Static source objects are not mutated. Church Library source availability is filtered through the existing helper; hosted source-policy effectiveness still requires staging verification.
- Public readers never read Studio localStorage drafts, staff APIs or a draft/preview URL. Draft, review, approved, rejected and archived records cannot enter these readers merely because a staff session can query them.
- Public content uses only verified locales. Unverified Amharic falls back to English with an existing fallback notice; staff gameplay tests can inspect draft translations without approving them. Original bilingual/source text remains stored unchanged.
- Switching game routes creates a fresh view. Reader failure clears fetched cards back to static content, rather than retaining a previously fetched bank after a failed retry.

### Saved gameplay tests

**Test saved gameplay** is available for saved Who/Match records. It is disabled for new/dirty/invalid drafts, reopens the current owner-scoped local record or authorized server record, validates it and checks equality with the editor before launching the actual engine. It runs inside the protected Studio, with reward recording disabled. Staff can test both languages. A one-pair saved server record can be tested as one pair in preview; public board sizes remain 4/6/8.

No local approval/publication flag or user-supplied preview query can activate these drafts for visitors. New copies and local Match collections still save locally. This increment does not add server bank versioning, atomic collection publication, automatic upload of local drafts or a paid generation path.

## Exact files changed by this increment

Created:

- `src/lib/play/cardContent.ts` — pure card adapters, locale/schema/publication checks and bank merge.
- `src/lib/play/contentSource.ts` — existing shared internal-source path validation extracted without changing its rules.
- `src/pages/admin/studio/StudioImportTools.tsx` — dedicated authorized import/export/recovery tools.
- `src/pages/admin/studio/StudioGameplayPreview.tsx` — protected actual-engine saved-draft tests.
- `scripts/test-studio-card-adapters.ts` — deterministic reader/storage/schema tests.
- this report.

Modified:

- `src/App.tsx` — Studio as primary route; preserved Studio alias and dedicated tools route under the same staff boundary.
- `src/pages/admin/studio/GameContentStudio.tsx` — unified layout, compact editing view, additional filters/refresh, legacy-record diagnostics, server card editing and saved-game action.
- `src/lib/play/contentStudio.ts` — shared card validation and reopening existing server card rows; local formats preserved.
- `src/lib/play/contentService.ts` — two published-only loaders, with injectable fake client support.
- `src/lib/play/questionLibraryService.ts` — accurate blocked-publication wording only; publication guard unchanged.
- `src/pages/play/PlayGamePage.tsx` — reader/static fallback composition for the two actual public routes.
- `src/components/play/WhoAmIGame.tsx`, `MatchGame.tsx` — typed data injection, verified-locale rendering and reward-disabled preview mode; default gameplay/rewards remain.
- `scripts/test-content-studio-browser.mjs` — 30 scenarios, including one primary Studio, no legacy bottom sections, real saved engines, public-only card reads and safe fallback.
- `scripts/test-faith-challenges-editor.mjs` — existing native-auth/in-memory API workflow updated to the actual Studio and dedicated import UI, preserving validation/permissions/publication checks. All external production requests blocked.
- `scripts/test-navigation-history.mjs`, `scripts/test-play-modes-browser.mjs` — selectors updated to the unified Studio; history and mode assertions preserved.
- `scripts/test-content-studio.ts` — registry test description now distinguishes four enabled quiz editorial workflows from the two additional readers; assertions preserved.
- `docs/ai/GAME-CONTENT-STUDIO-2026-11-03.md` — current capability matrix.
- `docs/ai/proposed-migrations/20261103_game_content_studio_readiness.md` — reader readiness update, not SQL activation or a competing migration.
- `docs/ai/HANDOFF.md` — continuation and safety evidence.

Previously dirty files were inspected and preserved. A scoped pre-edit source snapshot was saved outside the repository at `%TEMP%\td-studio-phase2-baseline-uxm481\files.json`. Legacy `PlayContentReview.tsx`, game content/static banks, Game Night, progress/XP security modules, V4/V5, package manifests and SQL definitions were not edited by this increment.

## Verification results

All final checks below passed with exit 0. No test connected to hosted Supabase; authentication and PostgREST responses were synthetic fixtures. These tests do not certify live RLS or publication.

| Command | Evidence |
| --- | --- |
| `node scripts/test-content-studio-browser.mjs` | 30/30: twelve editors, local/server save/reload, previews, real saved Who/Match engines, unchanged XP, draft exclusion, published fixtures, outage fallback, unverified-locale fallback, permissions, no duplicate legacy sections, mobile/desktop and unsaved navigation |
| `node node_modules/tsx/dist/cli.mjs scripts/test-studio-card-adapters.ts` | 14/14: schema/locales, every unpublished state, IDs/source rejection, query filters, invalid response handling, stable bank merge, exact local persistence and existing server-card adapter |
| `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts` | Existing 36/36 |
| `node scripts/test-faith-challenges-editor.mjs` | Invalid save blocked; creation/persistence/preview; editor submit-only; admin approve/publish/confirmed unpublish; search/counts; validated draft import; duplicate IDs and unauthorized access |
| `node scripts/cms-auth-smoke.mjs` | Invalid/valid sign-in, restoration, profile denial/outage/retry, sign-out, unassigned role |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` | Library/service/editorial/identifier regression checks; expected missing public-environment warning in Node-only fixture |
| `node scripts/test-faith-challenges-authorization.mjs` | 180 structural role/transition checks; actual RLS remains unverified |
| `node scripts/test-play-foundation.mjs` | PASS |
| `node scripts/test-play-complete.mjs` | PASS |
| `node node_modules/tsx/dist/cli.mjs scripts/test-play-milestones-2-4.ts` | PASS |
| `node scripts/test-play-modes-browser.mjs` | 10/10, all twelve routes plus mobile keyboard/touch/modes and unified CMS |
| `node scripts/test-navigation-history.mjs` | 21/21 |
| `node scripts/test-game-night-security-browser.mjs` | Existing mocked join/reveal/selection/reward regression passed; no Game Night changes |
| `node node_modules/typescript/bin/tsc -b --pretty false` and `npm.cmd run build` | TypeScript and production/PWA build passed |
| Targeted ESLint on all changed code/tests; `node --check` on changed `.mjs` scripts | PASS |
| Scoped `git diff --check` plus explicit new-file trailing-whitespace checks | PASS |

Tests caught and corrected a real import-field accessible-name bug: wrapping the controlled textarea in its label caused entered JSON to become part of that label. The new import tool now uses an explicit separate label/control. A new error-state assertion was corrected to match the full existing accessible fallback sentence; it still requires the exact error and verifies playable static content. No security assertion was reduced to alert existence.

Synthetic mobile/desktop screenshots were reviewed under `%TEMP%\tewahedo-studio-qa-*` (including `QFuZdE`). They show the primary dashboard and compact Who editor; external media fixtures do not establish live artwork availability or native screen-reader correctness.

## Remaining blockers and safe continuation

1. **Publishing Who/Match is not enabled.** The existing database/service publication blocks remain. Update only the existing readiness/reconciliation proposal after actual schema/RLS/grants/trigger inventory, then separately approve isolated staging verification. Do not remove a guard merely because a reader exists.
2. Prove real draft→review→approved→published→anonymous gameplay→archive/unpublish with independently authorized staff accounts and effective direct-request checks. Fixture-published rows only prove the reader can consume eligible data.
3. Local collections are not server-versioned banks. Do not write an array into a Match row, bulk auto-publish local exports, change stable IDs or bypass duplicate checks. New local copies require a deliberately approved server draft/collection transfer workflow before live publishing.
4. Six other local formats and History chronology retain their previously documented adapter/artwork/schema limitations. Unsupported legacy server rows are preserved for explicit compatibility review, not silently converted.
5. Hosted data/source eligibility, concurrency and native Amharic/screen-reader review remain unverified. Existing static fallbacks and all earlier security/staging restrictions remain.

Rollback: preserve the primary Studio cleanup where possible. If an adapter must be withdrawn, restore only its reader/prop/preview hunks to static fallback after review, keeping publication blocks intact. Reverse only this increment's specific hunks/new modules, never whole dirty files or existing data. No database rollback is required because no SQL ran.
