# Generated Faith Challenges: offline inventory and import plan

Date: 2026-11-04. No hosted Supabase query, SQL, import, migration, publication, credential use, or deployment was performed.

## Canonical inventory

`scripts/bible/inventory-generated-questions.ts` reads the campaign's `library/all-drafts.json` once and the five earlier standalone question banks. The five campaign batch files, `cms-import-all.json`, per-book/game exports, and revised batch-001 are alternate exports or revisions of those 100 campaign records, not additional unique questions. Prepared passages in batches 006–050 are generation inputs, not questions. No generated question CSV or SQL output was found under `artifacts/` or `scripts/bible/`; the two `scripts/bible/sql/` files are read-only inventory/source queries.

| Source | Questions |
| --- | ---: |
| Campaign batches 001–005, canonical library | 100 |
| Original Bible draft bank | 50 |
| V2 pilot | 10 |
| V2 batch 1 | 10 |
| V2 batch 2 | 10 |
| V3 batch 1 | 40 |
| **Total distinct generated questions** | **220** |

Game types: **197 trivia**, **23 finish-the-verse**. Structural CMS validation: **220 valid, 0 rejected**. Stable identifiers: **220 distinct, 0 duplicates**. Missing/ill-formed source references: **0**. Source citations have not been checked against a live Bible edition or rights catalog; structural validation is not editorial or translation approval. Generated Amharic is preserved in the payload but only English is marked verified. The existing campaign provenance is preserved in `payload.provenance`; earlier banks receive their generator file and available snapshot/edition metadata. Each draft retains the generator's stable ID in `stable_id` and `payload.id`; on database insert `question_id` must equal that ID too.

The count **already imported into Supabase is unknown**, as is the count **not yet imported**. No authorized full staff export or live schema evidence was provided in this task. The dry run therefore reports 220 *candidate* draft inserts pending database reconciliation, not 220 verified missing rows. It never treats an absent local record as evidence of an absent server record.

## Reviewable draft operation

The generated local draft payload file is `artifacts/faith-challenges/generated-cms-drafts-2026-11-04.json` (220 `QuestionDraft` objects, ignored artifact, no status/publish command). The exact per-ID decisions, hashes, source files and validation errors are in `artifacts/faith-challenges/generated-import-dry-run-2026-11-04.json`. Reproduce both with new filenames:

```powershell
node node_modules/tsx/dist/cli.mjs scripts/bible/inventory-generated-questions.ts --drafts-out artifacts/faith-challenges/another-new-name.json --report-out artifacts/faith-challenges/another-new-report.json
```

Before any import, use an authorized staff session to export all `play_content_items` through `/admin/play/import`, verify that export includes every row (including unpublished rows), and rerun:

```powershell
node node_modules/tsx/dist/cli.mjs scripts/bible/inventory-generated-questions.ts --existing-export path/to/complete-staff-records.json --drafts-out artifacts/faith-challenges/reconciled-drafts-new-name.json --report-out artifacts/faith-challenges/reconciled-report-new-name.json
```

The report lists every ID and its `insert-draft`, `skip-existing`, or `reject` decision. Existing IDs are skipped regardless of status, including published. It cannot update a published row. The output file is created exclusively and contains only valid, absent draft candidates. A partial or capped export must be rejected during review; the current staff list API has no proof of complete pagination. Resolve schema compatibility and source/editorial review before approving any write. The existing browser import tool accepts **1–100** validated question-array drafts per batch, requires a staff session and a separate confirmation, inserts `status='draft'` through the editorial service, and rejects duplicate IDs. Split a reconciled plan into reviewed batches at that later gate, or build an equivalent authorized server workflow. Do not use the old `scripts/import-play-content-drafts.ts --apply`: it imports the built-in bank, not these 220 generated records, and requires a service-role credential.

## Schema and publication blockers

- The repository's committed initial `play_content_items` migration has `stable_id` but **no `question_id`** and a four-state status check. The separately proposed six-state live reconciliation assumes a live `question_id` and preserves/restricts six states. Deployment of that proposal is unverified. Inspect the real catalog and run its read-only preflight first; neither shape can be inferred from local migration files alone.
- The proposed guarded workflow requires `question_id = stable_id = payload.id`, draft-only insert, unique stable ID, staff authorization, and transitions through draft → review → approved → published. Real grants, RLS, validation triggers, and service behavior remain unverified in staging.
- Public database-only readers and the existing Game Night private RPC are already implemented locally, but production cutover awaits approved activity validation, populated published banks, rights/editorial clearance, and multi-role staging verification. Draft edits do not enter the published-only path. No hardcoded fallback was added by this task.
- Rights and human review for all generated questions remain pending. The V3 report notes four revised records still await independent review. Structural acceptance does not authorize publication.

## Local verification

- New inventory test: canonical 100-record campaign deduplication, 220 unique IDs, bilingual payload preservation, missing-source/validator checks, published-ID skip, and empty authorized-export behavior passed.
- Studio browser suite: 38/38 passed, including twelve game editors, preview, save/reopen, mobile, nonstaff denial, publication flow, browser navigation and unsaved changes. Mocked API, not live RLS.
- Faith Challenges editor browser fixture passed; published-content adapter suite 28/28 and library suite passed.
- `tsc --noEmit -p tsconfig.app.json`, scoped ESLint, and `npm run build` passed. Build emitted an existing `::highlight` CSS warning. Full `npm run lint` failed with 362 errors and 28 warnings across unrelated existing files, especially the scratch tree; changed files pass scoped ESLint.

The Studio library now displays 25 records per page, supports source text filtering, individual/page selection, and bulk status changes. Bulk review uses the existing per-record authorization/service transition check and confirms the returned server status. It does not change six-state rules or publish unsupported activity formats.
