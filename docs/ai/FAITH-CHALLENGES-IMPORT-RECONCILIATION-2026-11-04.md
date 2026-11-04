# Faith Challenges generated-question import reconciliation

Date: 2026-11-04. This is a file-only preparation and synthetic validation report. No hosted staff session, production/staging request, SQL, migration, question import, publication or deployment was performed.

## Exact current manifest

| Outcome | Count | Meaning |
| --- | ---: | --- |
| Generated | 220 | 197 Trivia, 23 Finish the Verse from the canonical source files. |
| Structurally eligible | 220 | CMS validator accepts every draft; 0 duplicate generated stable IDs, 0 missing structural source references. |
| Amharic text present | 100 | 77 Trivia and all 23 Finish the Verse have Amharic prompts, explanations and answer options. The other 120 Trivia are English-only drafts. |
| Rejected locally | 0 | Structural validation only; source, translation, rights and editorial review remain. |
| Pending database reconciliation | 220 | No complete authorized staff export was available. |
| Insert as draft | UNKNOWN | An absent local row is not evidence of an absent database row. |
| Skip identical existing | UNKNOWN | Includes published rows only after exact identifier/content comparison. |
| Conflict | UNKNOWN | Existing identifier or payload differences require manual review. |

The machine-readable [pending manifest](../../artifacts/faith-challenges/generated-import-manifest-pending-2026-11-04.json) records every stable ID, generator file, source hash, draft hash and `pending-reconciliation` decision. The earlier 220-draft payload file remains `artifacts/faith-challenges/generated-cms-drafts-2026-11-04.json` and is not a database record inventory. Exact post-reconciliation insert eligibility cannot be stated yet. **Zero questions are approved for a database write now.**

## Authorized read-only inventory

`/admin/play/import` now reads `play_content_items` in ordered 250-row pages as an editorial staff session, checking the exact RLS-visible count on every page. A short page, count drift, malformed row or duplicate row UUID aborts export. The downloaded `faith-challenges-staff-records.json` is a versioned envelope with the visible count, page size, page count and all selected rows, including unpublished statuses. The same complete reader powers the Studio's server library and is used immediately before a draft import to prevent a default API page cap from hiding an existing ID. The browser uses the publishable key and the signed-in staff session, never a service-role key.

This count verifies complete pagination **within the staff role's RLS-visible set**. It cannot prove that policies expose every intended row or that a downloaded file is authentic. An authorized staging operator must compare an independent read-only catalog/count preflight and effective editor/admin visibility. No suitable staff session or export was available in this workspace; `.env.development.local` contains only the database-only feature flag, not a Supabase endpoint or session.

After receiving a complete staff envelope, run the offline reconciler with fresh output filenames:

```powershell
node node_modules/tsx/dist/cli.mjs scripts/bible/inventory-generated-questions.ts --existing-export path/to/faith-challenges-staff-records.json --report-out artifacts/faith-challenges/reconciled-manifest-new.json --drafts-out artifacts/faith-challenges/reconciled-inserts-new.json
```

The reconciler rejects raw/partial exports. It reports `insert-draft`, `skip-existing`, `conflict` or `reject` per ID. `skip-existing` requires matching `question_id`, `stable_id`, `payload.id`, game/category/difficulty, payload and source references. Any mismatched existing row, including an edited published question, is a **conflict** and is excluded from the draft array. It never updates an existing row. Output files are created exclusively.

After the isolated staging gate and approval, `scripts/bible/prepare-reconciled-import-batches.ts` can create 1–100-draft JSON arrays in a separately created empty directory from the same complete export. A synthetic empty-export case yields 100/100/20; the real batch sizes depend on the reconciled insert count. It refuses unresolved conflicts/rejections and existing output files. Each batch still requires the CMS import screen's preview and confirmation; file preparation alone authorizes no database write.

## Schema and authorization gate

The committed baseline migration `20261031120000_tewahedo_play_milestones_2_4.sql` has `stable_id` but no `question_id` and a four-state status check. The proposed six-state `20261102_faith_challenges_live_reconciliation.sql` requires `question_id`; deployment is unverified. The existing read-only preflight is `docs/ai/proposed-migrations/20261102_faith_challenges_live_verification.sql` (blocks 1–9 before any proposed migration, block 10 only afterward). It has **not** been run here. The six-state staging report also identifies unresolved primary-key immutability and SQL NULL mode-validation concerns. Actual table grants, unique index, triggers, RLS, reviewer transitions and nonstaff denial must be checked in isolated staging before any insert. Do not infer live schema from repository migrations.

The browser importer inserts only `status='draft'`, sets `question_id=stable_id=payload.id`, validates each payload and uses a separate confirmation. It does not upsert; edit rejects records outside Draft. Published overwrite protection is supported by local service tests and the proposed guard, but effective database protection remains **UNKNOWN** until staging negative tests. The old `scripts/import-play-content-drafts.ts --apply` targets a different built-in bank and uses a service role; it is not the operation for these 220 drafts.

## Five-question isolated staging plan

Once the complete export is reconciled with zero unresolved conflicts/rejections and the staging schema/role gate passes, generate a five-row file:

```powershell
node node_modules/tsx/dist/cli.mjs scripts/bible/prepare-five-question-staging.ts --existing-export path/to/complete-staging-staff-records.json --out artifacts/faith-challenges/staging-five-new.json --manifest-out artifacts/faith-challenges/staging-five-manifest-new.json
```

The file-only selector chooses **three new Trivia and two new Finish the Verse** questions, preferring different generator files. It refuses an incomplete export, conflicting/rejected plan, or insufficient new candidates. This command prepares files; it makes no API request. Review the five exact IDs, source evidence, English/Amharic fields, answers and explanations in `/admin/play/import` before separately authorizing a write to an independently identified disposable staging project. Then check five draft rows, exact identifiers and payload persistence after reload, a repeated import's duplicate denial, published-row overwrite denial, editor visual save/reopen, ordinary-user denial and absence from public published-only readers. Neither five-question staging write nor production import has been approved or executed here.

## Local evidence and remaining blockers

- All 220 generated drafts pass the structural validator and the Studio row adapter (`220/220`). The 100 drafts with Amharic text retain it in editable fields, but **none** mark Amharic as independently verified (`verifiedLocales=['en']`). The 120 English-only Trivia need translation before bilingual publication claims.
- Counted-inventory tests cover 537 synthetic rows across three pages, short-page failure, count drift and staff denial. Reconciliation tests cover identical published skip, changed-content conflict, identifier conflict, duplicate existing rows, incomplete-export rejection and five-row selection.
- The Studio browser fixture passed **39/39** checks covering the existing twelve editors, bilingual fields, save/reopen, source/answer editing, public filtering and role gates. Its 220-row search/page assertion is synthetic and does not represent imported Supabase rows. The focused Faith Challenges editor browser fixture also passed.
- `scripts/test-faith-challenges-live-reconciliation.mjs` and `scripts/test-faith-challenges-authorization.mjs` passed structural proposal checks and 180 role/transition cases each; effective runtime RLS remains unverified. The focused library, inventory and counted-page tests passed. TypeScript, scoped ESLint and production build passed. Full repository ESLint reported **367 errors and 28 warnings** in the shared worktree; none were in the files touched for this reconciliation. `git diff --check` passed.
- Live export, effective schema/RLS checks, a named isolated staging target and an authorized five-row staging operation remain blockers. Human source/rights/translation review and separate approval remain necessary before publication or any production import.

Files changed for this reconciliation: `src/lib/play/staffQuestionInventory.ts`, `questionLibraryService.ts`; `src/pages/admin/studio/StudioImportTools.tsx`, `GameContentStudio.tsx`; `scripts/bible/inventory-generated-questions.ts`, `test-inventory-generated-questions.ts`, `prepare-five-question-staging.ts`, `prepare-reconciled-import-batches.ts`, `audit-generated-studio-compatibility.ts`; `scripts/test-staff-question-inventory.ts`, `test-faith-challenges-library.ts`, `test-faith-challenges-editor.mjs`, `test-content-studio-browser.mjs`, `test-studio-coverage-browser.mjs`; this report and the pending manifest. Existing unrelated working-tree changes were preserved.
