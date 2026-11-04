# Faith Challenges — Verified Amharic Source Export Runbook

Read-only procedure for producing generator inputs from the reviewed, published Amharic Bible
in Supabase. No step writes to the database, calls an AI model, or publishes content.

## Files

| File | Role |
|---|---|
| `scripts/bible/sql/play-source-candidates.sql` | SELECT-only candidate passage export (SQL Editor) |
| `scripts/bible/sql/play-question-inventory.sql` | SELECT-only question inventory, all editorial statuses |
| `scripts/bible/prepare-play-source-batch.ts` | Offline converter: audit gates → existing `prepareAmharicPlaySourceExport()` → validated files |
| `scripts/bible/test-prepare-play-source-batch.ts` | Converter test (synthetic IDs, local audit data) |
| `scripts/bible/generate-amharic-play-drafts.ts` | Existing generator CLI (prompt build + response validation) |

## 1. Export (Supabase SQL Editor, read-only)

1. Open `play-source-candidates.sql`, run it, and use **Download CSV**. Save it as `exports/play-source-candidates.csv`. **Copy as JSON** also works if you save it as `.json`.
2. Open `play-question-inventory.sql`, run it, and save the result as `exports/play-question-inventory.csv`.
3. Keep `exports/` out of Git, because it contains scripture text and the editorial inventory.

## 2. Convert and validate offline

### Standard execution (relies on database transferable rights)
```powershell
npx tsx scripts/bible/prepare-play-source-batch.ts `
  --candidates exports/play-source-candidates.csv `
  --inventory exports/play-question-inventory.csv `
  --out-dir artifacts/faith-challenges/batch-001 --count 20 --verses 5
```

### Owner-authorized execution
When the website owner has authorized AI-assisted challenge generation for controlled Bible content, pass the explicit authorization flags. All three flags (`--owner-authorized true`, `--owner-basis`, `--owner-by`) are mandatory:

```powershell
npx tsx scripts/bible/prepare-play-source-batch.ts `
  --candidates exports/play-source-candidates.csv `
  --inventory exports/play-question-inventory.csv `
  --out-dir artifacts/faith-challenges/batch-001 --count 20 --verses 5 `
  --owner-authorized true `
  --owner-basis "Website owner authorized AI-assisted Faith Challenges generation using controlled Bible content." `
  --owner-by "site-owner"
```

Exit `0` → `source-batch.json`, `existing-prompts.json`, `source-manifest.json`, `eligibility-report.json`.
Exit `2` → blocked (rights without owner authorization, or too few eligible books); only `eligibility-report.json` is written.

Gates applied before the existing exporter runs (these CANNOT be bypassed by owner authorization):

- Edition and source book are `am`, reviewed, published and public; the canonical book is `available` and has `name_am`.
- The chapter appears in audit `05` with first label 1, no gaps, no repeated or descending labels, and no adjacent duplicates.
- The chapter has no unresolved Amharic signals in `02-all-anomalies.csv`.
- The book is not on the `09` cross-edition review list (Esther, Proverbs, Jeremiah collection, Daniel).
- Each verse's database text SHA-256 matches `13-verse-scan-index.csv`. Text edited after the audit is excluded rather than trusted.
- Verse numbers are contiguous and come from a single section.
- Duplicate checks use routes and verse IDs from the inventory plus `APPROVED_QUESTIONS`.
- `rights_status` must be `owned`, `licensed`, `public_domain`, `permission_granted`, or explicitly permitted by deliberate `--owner-authorized` CLI flags.
- Owner authorization scope is strictly restricted to `bible_edition` and excludes Church Library, Mezmur, Synaxarium, and third-party images.
- The database `rights_status` is never modified.
- Batch ≤ 20 passages and ≤ 64 KB (verses per passage are reduced automatically). Existing prompts ≤ 128 KB.

## 3. Build the Gemini prompt (no model call)

```powershell
npx tsx scripts/bible/generate-amharic-play-drafts.ts `
  --source artifacts/faith-challenges/batch-001/source-batch.json `
  --model EXACT_GEMINI_MODEL_ID `
  --prompt-out artifacts/faith-challenges/batch-001/gemini-prompt.json
```

Send `prompt` with `schema` as the structured-output schema. Save the raw JSON reply as `gemini-response.json`.

## 4. Validate the Gemini response

```powershell
npx tsx scripts/bible/generate-amharic-play-drafts.ts `
  --source artifacts/faith-challenges/batch-001/source-batch.json `
  --model EXACT_GEMINI_MODEL_ID `
  --prompt-out artifacts/faith-challenges/batch-001/gemini-prompt-check.json `
  --response-in artifacts/faith-challenges/batch-001/gemini-response.json `
  --existing-in artifacts/faith-challenges/batch-001/existing-prompts.json `
  --draft-out artifacts/faith-challenges/batch-001/drafts.json `
  --report-out artifacts/faith-challenges/batch-001/report.json
```

The model ID must match the step 3 value exactly. Outputs are never overwritten.

## Known limits

- The generator supports only `trivia` and `finish-the-verse`, with at most one question per passage.
- Response validation is all-or-nothing: one invalid question rejects the whole response, so `report.json` always shows `rejected: 0`.
- Grouped canonical books (for example Samuel and Kings) have `name_am = null` and are skipped.
- The Amharic source files lack upstream edition provenance (audit `01-summary.md`). This is a rights and provenance question for editors.

