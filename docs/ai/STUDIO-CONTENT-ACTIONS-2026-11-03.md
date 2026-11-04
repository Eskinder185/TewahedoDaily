# Studio content actions — 2026-11-03

Local implementation and offline verification only. No SQL, hosted Supabase access, media deletion, paid agents, installation, Git index mutation or deployment.

## Implemented

- Explicit Change Image / Remove Image / Undo controls for Feasts, Guess the Saint and Icon Memory. Removal clears both `src` and `fallbackSrc`; no shared storage API is called. Approved catalog replacement cannot select a duplicate subject. Restoring the same subject preserves edited text; choosing another subject explicitly loads its matching answer/source. No arbitrary uploads or fabricated portrait/Adventure image fields were added.
- Incomplete image drafts save/reopen in the existing browser store. Default `validateStudioDraft` remains strict for gameplay/publication; only local persistence/import explicitly allows the two empty image strings. Unapproved URLs and half-removed references still fail. Incomplete previews show the actual remaining images and removed-image placeholders, with no game controls.
- Confirmed Delete in the local library/editor; atomic same-key recovery markers preserve saved drafts and unrelated records. Deleted records disappear from active loads and can be restored from Deleted local drafts after reload. Unsaved new drafts are discarded with confirmation. Staff/owner checks and corruption preservation remain. No permanent purge: recovery copies count toward the existing 100-record / 2 MB limit and disappear if browser data is cleared.
- Individual collection-card removal now confirms; Undo unsaved changes restores the editor baseline. Existing archive/restore remains available for saved local records.
- Server-backed records show Archive/Unpublish access and an explicit unavailable permanent Delete action. The existing authorized review RPC is reused; no direct DELETE endpoint, new grants, client publication flag or status bypass was added. Buttons use readable bilingual actions, respect role/status/dirty/validation state, confirm transitions, reopen the record and only report success after status verification. Database denial stays visible.
- Public navigation-card proposals remain distinct from gameplay questions. Existing title/description/order/visibility settings gain thumbnail removal and undo with an accurate no-image preview. These are browser-only proposals; the public hub and underlying questions remain unchanged. Categories remain sourced from the existing catalog rather than inventing a settings field.
- All twelve editors, `/admin/play/studio`, `/admin/play/import`, static fallback banks, bilingual/source validation, no-XP previews and existing public readers remain.

## Exact files changed in this increment

Application:

- `src/lib/play/contentStudio.ts`
- `src/lib/play/gameSettings.ts`
- `src/pages/admin/studio/GameContentStudio.tsx`
- `src/pages/admin/studio/GameEditors.tsx`
- `src/pages/admin/studio/StudioFields.tsx`
- `src/pages/admin/studio/StudioImageField.tsx` (new)
- `src/pages/admin/studio/StudioPreview.tsx`
- `src/pages/admin/studio/StudioPanels.tsx`

Tests:

- `scripts/test-content-studio.ts`
- `scripts/test-studio-catalog.ts`
- `scripts/test-content-studio-browser.mjs`
- `scripts/test-studio-coverage-browser.mjs`
- `scripts/test-faith-challenges-editor.mjs`

Documentation: this report, `GAME-CONTENT-STUDIO-2026-11-03.md` capability update and a prepended `HANDOFF.md` entry. Existing dirty files were preserved. Pre-edit scoped source copy: `%TEMP%\td-studio-actions-before-3jWATR\files.json`.

## Verification

All final commands below exited 0. Browser requests used synthetic authentication/PostgREST; external live requests were blocked.

| Command | Result |
|---|---|
| `node scripts/test-content-studio-browser.mjs` | 38 passed, 0 failed: all twelve editors, remove/undo/save/reload/replace for all three image formats, delete/cancel/recover from editor and library, server deletion unavailable, denied archive, archive/restore/unpublish, anonymous readers, invalid publication, Game Night/XP isolation, 768/390px and desktop, Amharic/night theme |
| `node scripts/test-studio-coverage-browser.mjs` | 17 passed, 0 failed: built-in content, settings thumbnail removal/replacement/undo/persistence and unchanged public hub at 1280/390px, coverage and campaign drafts |
| `node node_modules/tsx/dist/cli.mjs scripts/test-content-studio.ts` | 40 passed, 0 failed; added strict-vs-draft image validation, exact recovery, owner/role/corruption/quota failure checks |
| `node node_modules/tsx/dist/cli.mjs scripts/test-studio-catalog.ts` | 9 passed, 0 failed, including removed navigation-thumbnail proposal persistence |
| `node node_modules/tsx/dist/cli.mjs scripts/test-studio-card-adapters.ts` | 14 passed, 0 failed; every unpublished state excluded |
| `node scripts/test-faith-challenges-editor.mjs` | Native CMS/editor/import/auth fixture workflow PASS; exact action selectors updated for bilingual wording |
| `node scripts/cms-auth-smoke.mjs` | PASS |
| `node node_modules/tsx/dist/cli.mjs scripts/test-faith-challenges-library.ts` | PASS; expected missing public-environment warning from Node fixture, no connection |
| `node scripts/test-faith-challenges-authorization.mjs` | 180 structural role/transition cases PASS; not live RLS proof |
| `node scripts/test-play-foundation.mjs` and `node scripts/test-play-complete.mjs` | Both PASS |
| `node scripts/test-game-night-security-browser.mjs` | Existing mocked authorization/reveal/reward regression PASS |
| `node node_modules/typescript/bin/tsc -b --pretty false` | PASS |
| `npm.cmd run build` | PASS, including TypeScript and PWA build; existing unrelated `::highlight(lyric-match)` CSS warning persists |
| Scoped ESLint on the 13 changed code/test files; `node --check` on the three changed `.mjs` tests | PASS |
| Scoped `git diff --check` and explicit trailing-whitespace check for untracked code/docs | PASS |

Tests caught and corrected the image picker's implicit label including option text. Coverage selectors were also brought up to date with the previously collapsed overview and Save draft wording; original category/content/permission assertions remain. Failed intermediate runs were 32/5 (picker plus dependent mobile cases) and 13/4 (coverage selectors/empty legacy thumbnail). Final reruns above passed; no security validation was weakened.

Screenshots reviewed: `%TEMP%\tewahedo-studio-qa-YyfYuw\image-controls-desktop.png` and `image-controls-mobile.png`. They show the desktop editing/actions layout and mobile image controls. Artwork is synthetic fixture pixels, not verification of deployed artwork. Additional public-card settings captures are in `%TEMP%\tewahedo-studio-qa-mCorIL\settings-1280.png` and `settings-390.png`.

## Publishing / backend blockers

The supplied historical live inventory reports table statuses `draft, review, published, archived` while the RPC expects `approved/rejected`, and an admin ALL policy may overlap other policies. This task did not query a hosted database and cannot establish whether that inventory has since changed.

The existing proposal `docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql` already defines six-state constraints, immutable identifiers, validation triggers, a `SECURITY INVOKER` review RPC, and replacement RLS/grants. Its grants are SELECT/INSERT/UPDATE, **not DELETE**. It was inspected and left unchanged; no competing migration or permanent-deletion proposal is necessary for archive-based server management.

Before enabling remaining live actions: obtain read-only catalog evidence with the existing `20261102_faith_challenges_live_verification.sql`; separately approve the guarded isolated-staging procedure; verify anon/user/editor/admin/super-admin effective grants/RLS and transitions through real PostgREST; then approve any production migration separately. Four quiz adapters exist but deployed publication authorization is UNKNOWN. Who/Match publication stays blocked despite tested readers; other local formats and History chronology still lack publication adapters. Finish Mezmur remains sourced from published hymn lyrics. No button or browser fixture certifies live publication readiness.

Native Amharic editorial review, actual screen-reader testing, and real media availability remain manual QA items. These browser drafts/settings are not confidential storage or cross-device backups.
