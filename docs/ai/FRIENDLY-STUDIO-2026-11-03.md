# Friendly visual Studio — Phase 1

Local implementation, 2026-11-03. Existing CMS, game schemas, services and permissions retained. No SQL, hosted writes, packages, paid agents, Git index changes or deployment.

## Implemented

- One clear **Create content** action. With a selected game it opens that game's existing editor; otherwise a labelled chooser offers all twelve games and a Start editing action. The duplicate template-creation button was removed. Existing chronology and duplicate/import actions remain.
- Live editorial preview opens automatically alongside the form on desktop. It updates from unsaved local state. Invalid drafts show a helpful placeholder rather than rendering malformed content.
- At widths up to 700px, Edit/Preview tabs show one panel at a time without unmounting its form state. Arrow keys, Home/End and normal button interaction are supported. Desktop still displays both columns.
- Shared Save draft wording, clear local/shared storage guidance, draft-not-published wording and a short edit/preview/save explanation. No automatic save, publication, XP or verification flags were introduced.
- Stable question/identity identifiers and raw source routes remain editable under Advanced details. Their actual values and validation rules remain intact.
- Required English authoring fields show adjacent help and accessible invalid/described-by states when empty. Amharic remains optional unless the existing game validator requires a reviewed translation. No translations are automatically marked human-verified.
- Larger Amharic text/line spacing, existing side-by-side bilingual fields, and clearer correct-answer card selection. Existing approved media and game-specific editors were reused.
- Existing static-content catalog/public parity, game settings, coverage and campaign views were inspected and preserved. The public-game overview is discoverable under a collapsed “Browse existing games and their sources” disclosure rather than occupying the main library by default. No duplicate content store or management-card grid was added.
- A related save verification bug was corrected: reopened Who/Match server card drafts are checked against the already validated card draft ID instead of calling the quiz-only converter. New browser coverage edits/saves/reloads both existing card formats with publication still unavailable.

This is Phase 1 plus the small choose-game entry flow, not a complete five-step content wizard or a replacement no-code framework.

## Exact changed files

Application:

1. `src/pages/admin/studio/GameContentStudio.tsx`
2. `src/pages/admin/studio/StudioFields.tsx`
3. `src/pages/admin/studio/GameEditors.tsx`
4. `src/pages/admin/studio/StudioPreview.tsx`
5. `src/pages/admin/studio/Studio.module.css`

Tests:

6. `scripts/test-content-studio-browser.mjs`
7. `scripts/test-faith-challenges-editor.mjs`

Documentation: this report and `docs/ai/HANDOFF.md`.

Existing static-content/catalog/campaign modules and their pending work were not rewritten. Calendar files were inspected for the intervening investigation but not edited. Game Night, XP security, public game engines, orchestration, package manifests and database definitions were not modified for this increment.

## Verification

Final checks use actual React/Router/editor components with synthetic Auth/PostgREST and blocked external requests. They are not live RLS, source-rights or deployment verification.

- `node scripts/test-content-studio-browser.mjs`: 33 scenarios, covering all twelve editors, creation, immediate desktop preview, mobile tabs/retained text, field help, advanced fields, old-card absence, existing draft recovery, static fallback/public readers, source validation, import/export, permissions and unchanged progress.
- `node scripts/test-faith-challenges-editor.mjs`: PASS native-auth fixture creation/reopen/preview, invalid-save prevention, review/approval/publication/unpublish checks, imports, duplicates and unauthorized access.
- `node scripts/cms-auth-smoke.mjs`: PASS invalid/valid login, restored sessions, profile denial/outage retry, sign-out and unassigned access.
- `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts`: 36/36.
- `node node_modules/tsx/dist/cli.mjs scripts/test-studio-card-adapters.ts`: 14/14.
- `node node_modules/typescript/bin/tsc -b --pretty false`: PASS; `npm.cmd run build`: PASS, including TypeScript and PWA output. Build retains an unrelated minifier warning for `::highlight(lyric-match)`; that CSS was not changed.
- Scoped ESLint for the changed TSX/test files and Node syntax checks for the two scripts: PASS.
- Scoped tracked/new-file whitespace checks: PASS.

Screenshots from `%TEMP%\tewahedo-studio-qa-59D9tZ`: `visual-desktop.png`, `visual-mobile-edit.png`, `visual-mobile-preview.png`. Desktop and mobile preview screenshots were visually reviewed. These are fixture content, not production questions or evidence of live media approval.

Initial new tests exposed a chooser whose implicit label included all option text; it now has an explicit label/control association. The native CMS test explicitly opens Advanced details before editing an identifier. Existing assertions for authorization, duplicate rejection, source integrity and publication were preserved.

## Remaining work

- A fuller game-specific wizard, searchable approved-media chooser improvements, per-field explanations for every schema error and plainer wording throughout secondary management panels remain Phase 2 work.
- Existing previews retain their documented fidelity limitations: no invented Adventure branches, progressive portraits, new image permissions or unsupported data fields. Who/Match saved-engine tests remain separate and reward-disabled.
- Backend publication support, six-state constraints and effective permissions remain subject to the existing staging process. No local format was made publishable by this visual redesign.
- Native Amharic terminology review and real screen-reader testing remain unverified. Browser tests verify keyboard behavior, rendering and state preservation, not linguistic authority.

Rollback only this increment's UI/test hunks after preserving later work. Keep unrelated static-content, campaign, navigation and security edits intact. No database rollback is needed.
