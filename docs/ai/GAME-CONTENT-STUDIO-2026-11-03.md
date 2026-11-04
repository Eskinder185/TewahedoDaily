# Faith Challenges: twelve-game visual studio

Phase 2 revision: `/admin/play` and `/admin/play/studio` now both show the same Visual Studio. The old competing question-management page is no longer routed. Necessary server import/export/inventory tools are at `/admin/play/import`; existing services and legacy source files are preserved. See `GAME-CONTENT-STUDIO-PHASE-2-2026-11-03.md` for current evidence and exact files. No SQL, production data or Git index changes were made.

## Capability matrix

2026-11-04 update: the table below describes the preserved default runtime. `DATABASE-DRIVEN-PLAY-2026-11-04.md` documents the new opt-in database-only adapter for all twelve formats and shared activity drafts. Publication and production cutover remain blocked on approved database validation/RLS/content verification; no environment flag was enabled. The Studio Coverage tab now distinguishes this local readiness from deployed support.

“Connected” below means the checked-in public route consumes the existing payload through its current reader. Server round trips were tested with synthetic Auth/PostgREST, **not a live Supabase project**. Production permissions, six-state constraints and applied migrations are not certified by these results.

| Game | Actual source/schema | New dedicated editor and preview | Save/load | Public connection / limitations |
|---|---|---|---|---|
| History Quest | `PlayQuestion` + separate `HISTORY_TIMELINE` event bank | Bilingual question/options, correct answer, hints, explanations and source picker; separate local event/year cards with reorder and chronology preview | Questions use existing Supabase API; chronology saves locally in its own format | Quiz/mystery/match questions connected. Local chronology is not published; AD years are supported, extended date/era schemes are blocked. “Who Was This?” still filters `ezana`/`frumentius` IDs; arbitrary new IDs do not enter that submode. |
| Who Am I? | `WhoAmICard` / `WHO_AM_I_CARDS` + validated published card rows | Identity/category/explanation/source; editorial preview and actual saved-game engine test with rewards disabled | New copies remain local; existing server card drafts can be edited in the Studio | Published-only loader checks IDs/status/timestamp/payload/source, preserves static fallback. Reader and saved gameplay verified with fixtures; publication stays blocked pending deployed DB support. Progressive clue decks/portraits remain unsupported. |
| Match & Discover | `MatchPair[]` / `MATCH_PAIRS`; each existing DB row is one `MatchPair` | Two-column bilingual pair builder, relationship/source, reorder; editorial preview and real saved-engine matching test | Local collections preserved; existing single-pair server drafts reopen/edit without storing an array in one row | Published rows form a validated bank, with stable-ID overrides and duplicate-side rejection; static fallback and 4/6/8 public boards remain. Publication remains blocked. Pair images/difficulty are unsupported fields. |
| Bible Timeline | `TlChain` / `TlEvent[]` | Bilingual event cards, ordered chronology, references/routes and note/hint fields; preview uses actual `isCorrectOrder` | Versioned local draft | Static public bank. Dates/eras are unsupported; no invented fields or timeline source changes. |
| Bible Adventure | `BibleAdventureStory`, exactly three linear `AdventureScene`s | Story/template, bilingual scenes, discoveries, choices/correct outcomes, exact citation fields, flow outline, existing artwork and gated progression preview | Versioned local draft | Static public registry/artwork. Arbitrary branches, new artwork IDs and scene reordering are blocked. Validator rejects broken correct IDs, unsupported object/outcome bindings, branch fields and non-three-scene graphs. |
| Finish the Mezmur | Published `mezmur_public` → `MezmurSong` → derived `FmQuestion` | Published lyric selector, multiline lyrics/transliteration/English, existing YouTube reference, visual missing-line selection, choose/arrange/type preview using the real seeded builder/grader | Versioned local editing copy; actual hymn changes use linked existing hymn CMS | No quiz-row reader. Legacy quiz publication now rejected in UI/service. Local copies never update hymn records/media. Current game requires usable Amharic lines; English-only lyrics are not made playable by this studio. |
| Bible Tewahedo Trivia | `PlayQuestion` | Bilingual question/options, correct answer, difficulty, category, hints and sources; existing question-preview component | Existing Supabase API, mocked browser round trip | Connected quiz reader. |
| Holy Emoji Challenge | `PlayQuestion` with `emoji` | Sequence display/editor, bilingual answers/clues/hints and quiz preview | Existing Supabase API, mocked browser round trip | Connected quiz reader. |
| Finish the Verse | `PlayQuestion` with `excerpt` | Reviewed/public/right-eligible Bible book/verse selection, exact word/phrase hiding, bilingual question/options and preview | Existing Supabase API, mocked browser round trip | Connected reader. New studio re-fetches exact source text before requesting publication; changed or unverifiable quotes do not reach the RPC. Typed answer variants are not part of the existing four-choice schema. |
| Church Feast Challenge | `PlayImage[]`, feast subset | Existing catalog image selector, bilingual answer/explanation, documented date text, description/source; Look & Guess preview | Versioned local draft | Static catalog. No new recurrence rules/calendar algorithm or uploads are invented. |
| Guess the Saint | `PlayImage[]`, saints/angels subset | Existing icon selector, bilingual identity/explanation/source and picture-answer preview | Versioned local draft | Static catalog. Progressive clue fields are not supported by the current public picture game. |
| Icon Memory | `PlayImage[]` | Image/name gallery, replace/reorder, 4/6/8 pair controls and playable image/name matching preview | Versioned local draft | Static public catalog; no arbitrary 5/10/12-pair gameplay is introduced. |

### Image, deletion and publication actions — 2026-11-03 update

See `STUDIO-CONTENT-ACTIONS-2026-11-03.md` for current verification and changed files.

| Content | Image reference | Delete / recovery | Publication |
|---|---|---|---|
| Feasts, Guess the Saint, Icon Memory | Change/Remove/Undo using approved game artwork. Removal clears primary and fallback; incomplete local drafts reopen, with a non-playable placeholder preview. | Confirmed local delete and owner-scoped browser recovery bin; individual card removal has confirmation and unsaved undo. | Still local only; missing images fail strict gameplay/publication validation. |
| Who Am I, Bible Adventure and remaining question formats | No invented image field. Identity portraits remain unsupported; Adventure retains its verified artwork binding. | Local copies use the same recovery bin; server rows use authorized archive/unpublish. | Existing format gates remain unchanged. |
| Four server quiz formats | Existing question schema preserved. | Permanent server deletion unavailable; no DELETE grant is proposed or added. | Role/state validation, confirmation, review RPC and reopened-state verification remain. Actual live authorization is unverified. |
| Public navigation cards | Local settings proposals support thumbnail change/removal/undo as well as existing title, description, order and visibility fields. Category remains the existing catalog category. | Hiding a proposal does not erase questions; reset restores public defaults. | Proposals do not change the public hub; no settings publication adapter exists. |

Deleted local drafts remain within the existing 100-record / 2 MB browser-store limits. Recovery is not a cross-device backup. Shared media/storage objects are never deleted.

## Shared experience and persistence

- Twelve game libraries, search, status filtering, sorting, badges and stable `game`/`item` query URLs. Both English/Amharic fields are present and tagged with language attributes; the dashboard follows the existing locale preference.
- Explicit new copies of existing templates; no original bank objects are mutated. Incompatible server payloads/identifiers produce a visible error instead of guessed repairs or mislabelled successful loading.
- Four quiz editors reuse `questionLibraryApi`, immutable saved IDs, matching new `question_id` and `stable_id`, existing payload/source fields and `review_play_content`. Save is confirmed by reopening. Approval/publication is role-gated and statuses are re-read. Non-drafts are locked; duplicating creates a fresh draft/ID without replacing published content. Explicit return to Draft unpublishes; it is confirmed.
- New copies from the eight non-quiz editors still persist **local browser drafts**, scoped by staff user ID with version, size/count bounds, UUID/metadata/schema validation, corruption preservation and archive/restore. Existing Who Am I/Match server drafts now reopen in the same Studio and retain authorized review controls; their publication remains blocked. Six other formats and History chronology still have no public adapter. Local storage is not a server authorization boundary, encrypted vault, cross-device sync or backup.
- Studio exports/imports use validated previews and explicit review confirmation for new local drafts. Existing server question-array imports are preserved in dedicated Advanced import & data tools, always as drafts. That page also retains authorized export and confirmed archive/unpublish recovery without duplicating the old editing UI.
- Unsaved navigation and reload warnings, keyboard reorder alternatives to drag/drop, visible focus, responsive fields and source/media selectors. No shared-media/server deletion or external inference/provider call.
- Editorial previews retain their schema-compatible simulations and existing helpers/artwork. Who Am I/Match additionally offer **Test saved gameplay**, which reloads the saved draft, validates it and runs the actual engine with reward recording disabled. Browser tests complete both engines and confirm unchanged progress and zero mutation requests. No public route reads local drafts or a preview query. This does not certify live publishing or multiplayer.

## Source and safety findings

1. `PlayGamePage.tsx` explicitly renders `FinishMezmurGame` and excludes it from quiz loading. Its source is `mezmurLyricsSource.ts`/`finishMezmur.ts`; publishing a `play_content_items` quiz row would not change that game. The existing service and library now block that misleading action. The corresponding database guard delta is **proposed only**.
2. Staff-visible Bible responses are not necessarily public. New `studioBibleSource.ts` composes existing Bible services while checking actual reviewed/published/public edition and source metadata, allowed rights status, source relationships, unique native chapter/verse identity and original numbering. Missing/ambiguous/unsupported references fail closed; it does not assume Amharic/WEB ordinal equivalence. Rights metadata is not independent licensing/legal verification.
3. Existing `WHO_AM_I_CARDS`/`MATCH_PAIRS` can declare Amharic verified while explanations are English-only. Original records are preserved. Copied drafts show validation errors until required translations are supplied or the author explicitly removes the Amharic verification flag. Test fixtures make that choice explicitly; validation was not weakened.
4. All production authorization depends on effective RLS/grants/triggers/RPCs. Current reports describe unapplied reconciliation and incomplete staging evidence. Client checks and mocked requests are not proof of live database enforcement.
5. No changes to Game Night private question data, answer-secrecy protocol, room-code accounting, trusted rewards or public XP behavior. Studio previews never grant XP or mark games complete.

## Changed files

New:

- `src/lib/play/contentStudio.ts` — twelve-schema registry, validation, adapters, local storage and source-quote verification.
- `src/lib/play/studioBibleSource.ts` — read-only reviewed/public source selection using existing Bible services.
- `src/pages/admin/studio/GameContentStudio.tsx` — dashboard, libraries, persistence, role-aware editorial actions, export/import and dirty navigation guard.
- `src/pages/admin/studio/GameEditors.tsx` — dedicated editor components for all twelve formats.
- `src/pages/admin/studio/StudioFields.tsx` — shared labelled bilingual/source/reordering controls.
- `src/pages/admin/studio/StudioPreview.tsx` — isolated interactive previews with no reward side effects.
- `src/pages/admin/studio/Studio.module.css` — existing theme tokens, responsive layout and focus styles.
- `scripts/test-content-studio.ts`, `scripts/test-content-studio-browser.mjs`.
- This report and `docs/ai/proposed-migrations/20261103_game_content_studio_readiness.md`.

Small additions to existing files (retain their earlier dirty edits):

- `src/App.tsx` — lazy staff-protected `/admin/play/studio` route.
- `src/pages/admin/PlayContentReview.tsx` — studio link; distinguish legacy card formats from unconnected publication; preserve existing quiz fields/imports.
- `src/lib/play/questionLibraryService.ts` — block Finish Mezmur quiz publication in addition to the existing local-card restrictions.
- `docs/ai/HANDOFF.md` — this task's handoff.

## Verification log

New deterministic model suite: `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts` — **36 passed, 0 failed; exit 0**. Covers every game's valid/edit/reload/duplicate shape and a game-specific invalid payload; real grading helpers; source integrity/metadata; unsafe references; staff/local-owner isolation; corruption; blocked publication; no preview reward imports. Synthetic configuration only.

Browser suite: `node scripts/test-content-studio-browser.mjs` — **26 passed, 0 failed; exit 0**. It owns loopback port 5195, never reads real env files, blocks external requests, uses fake Auth/PostgREST/source data and saves screenshots to a disposable temporary directory. Counts do not represent real Supabase RLS checks. Includes all twelve save/reload/previews, wrong Adventure answers, keyboard reorder, dirty navigation, role controls, exact-quote publication rejection, local chronology year editing, local archive/import, a studio-save-to-anonymous-public-Trivia round trip, 768/390px coverage, Amharic/night theme and unchanged progress/XP.

Existing regressions executed successfully (all **exit 0**):

- `node scripts/test-faith-challenges-editor.mjs` — browser creation, persistence, preview, editor review, admin publication/unpublish, access gate.
- `node scripts/cms-auth-smoke.mjs` — invalid/valid login, restoration, profile denial/outage retry, sign-out and unassigned access.
- `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` — existing library/service/editorial/identifier/public-filter checks with a synthetic configuration.
- `node scripts/test-faith-challenges-authorization.mjs` — 180 role/transition cases and proposal structure; actual RLS unverified.
- `node scripts/test-faith-challenges-live-reconciliation.mjs` — proposal structure and 180 transition cases; SQL is read as text, not executed.
- `node scripts/test-game-night-security-browser.mjs` — mocked denied joins/reveal/reward behavior; no database authorization claim.
- `node scripts/test-play-foundation.mjs`, `node scripts/test-play-complete.mjs` — existing Play source contracts/routes.
- `node scripts/test-play-published-content.mjs` — synthetic published-content reader regression.
- `node node_modules/tsx/dist/cli.mjs scripts/test-bible-timeline.ts` — timeline logic.
- `$env:BT_PORT='5298'; node scripts/test-bible-timeline-feedback.mjs` (synthetic Supabase configuration) — **812/812 checks passed**, owned local server.
- `node node_modules/tsx/dist/cli.mjs scripts/test-finish-mezmur.ts` — **12 passed**, real lyric-building/grading/rotation checks.
- `node --experimental-strip-types --no-warnings scripts/test-bible-adventures.mjs` — all six stories/18 scenes, desktop/mobile, visible artwork state, touch/keyboard, wrong answers, replay/XP deduplication, themes/reduced motion and contrast. All existing output groups passed; the script reports assertion subtotals rather than one aggregate test count.
- `node node_modules/typescript/bin/tsc -b --pretty false` and `npm.cmd run build` — TypeScript and production/PWA build.
- Targeted ESLint for all new modules/test scripts and the three changed existing code files — exit 0.
- `node --check scripts/test-content-studio-browser.mjs` — exit 0.
- Scoped `git diff --check` for tracked changes plus explicit whitespace checks for new/untracked files — exit 0. Git index unchanged.

Early new-browser runs found and fixed textarea label contamination and an identity preview lacking an explicit reveal button. A later quote-protection assertion initially counted an in-flight approval RPC as if it were publication; it now waits for confirmed approval and specifically asserts that **no publication RPC** was issued for altered text. The application already rejected the altered quotation. Expectations remain concrete and security checks were not weakened.

Synthetic screenshots: twelve mobile editor images plus an Amharic/night dashboard image were captured per browser run under `%TEMP%/tewahedo-studio-qa-*`. Reviewed samples include `icon-memory-390.png`, `trivia-390.png` and `dashboard-amharic.png` (runs `Bv0wxD` and `0OOmTh`). These verify layout/readability of fixture UI, not actual uploaded image quality. Temporary test artifacts were preserved. The final 26-case run generated `%TEMP%/tewahedo-studio-qa-K67RiS`.

## Remaining blockers / handoff

- Eight local formats and the unsupported subfeatures in the matrix are **not end-to-end CMS-to-public publishing**. Follow the separate unapplied adapter/database change request; do not bulk-publish their local exports or expand game-type checks alone.
- Real source/media eligibility and deployed six-state constraints, grants, invoker behavior and effective RLS remain UNKNOWN pending separately authorized isolated staging. No hosted Supabase connection or migration application was made for this work.
- Native Amharic review is needed for newly added interface/help wording. Validation/backend error strings are still primarily English with bilingual headings; full native screen-reader testing was not performed. No authority is claimed for new translations.
- Local drafts are not collaboratively synchronized. Existing server draft editing lacks newly added optimistic concurrency/version merging; simultaneous editor writes need a separate reviewed solution. Save failure never falls back to an apparently successful local/server publication.
- Preview fidelity covers the implemented mechanics, not full gameplay timers/randomness or multiplayer. Existing picture catalog source bindings were tested with synthetic images; actual uploaded artwork quality/current CMS approval was not live-verified.

Rollback: remove only this task's new modules/route/link and narrowly reverse its publication-service guard after review. Preserve the pre-existing dirty CMS/navigation/security changes; do not restore entire files, reset the worktree or alter existing data. No database rollback is needed because no SQL was applied. Keeping the extra publication gate is safer until its database equivalent is approved.
