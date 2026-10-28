# Mezmur classification integration report

Generated from the existing completed classification results; the classifier was not rerun.

## Outcome

- Classification rows verified: **2,092**
- Exact immutable-identity matches in the latest authorized source export: **1,684**
- Rows eligible for add-only relationship reconciliation: **127**
- Rows held for manual review: **1,965**
- Low-confidence rows excluded from automatic integration: **754**
- Unclassified rows left unchanged: **428**
- Proposed category relationships: **178**
- Proposed occasion relationships: **129**
- Proposed removals: **0**

## Reconciliation blockers

- UUIDs absent from the available authorized identity export: **408**
- Slugs changed after that export/classification snapshot diverged: **1,476**
- Timestamps changed after that export/classification snapshot diverged: **391**
- Non-low-confidence rows explicitly requiring expert review: **130**
- Safely stageable rows lacking legacy 'mezmur_id': **117**

These blocker counts overlap. They explain why only the fully current, uniquely matched subset is staged; they are not theological rejections and do not modify any records.

## Identity and schema

Every eligible proposal is keyed by 'public.mezmur_data_import.import_id' and has exact slug and 'updated_at' preconditions from 'reports/mezmur-classification/SOURCE_IDENTITY_EXPORT.csv'. Slugs are descriptive preconditions only and are never mutation keys.

The integration targets the existing private relationship tables:

- 'public.mezmur_category_links_import(mezmur_import_id, mezmur_slug, category_slug, source_category, confidence)'
- 'public.mezmur_occasion_links_import(mezmur_import_id, mezmur_slug, occasion_slug, source_occasion)'

The generated rollback-only SQL also preserves the existing four-column public relationship-view contracts while making their identity resolution UUID-safe. Existing views join through legacy 'mezmur_id', but 117 safely stageable records lack that value. The corrected view definitions use 'import_id' for the relationship join and allow a public slug fallback only when that normalized public slug is unique. This lets committed additions flow to Hymns browsing for published, nondeleted Mezmurs without changing Mezmur records.

## Current-assignment limitation

No authorized export of the current private category/occasion relationship rows is present in the workspace. The CSV reports therefore mark current relationships as 'DATABASE_CHECK_REQUIRED' instead of guessing. The generated SQL performs the authoritative current-state comparison before any insert and uses 'ON CONFLICT DO NOTHING'; existing assignments are preserved. No removals are proposed.

## Primary ordering

The primary proposal is emitted first and tagged using existing relationship metadata as 'lyrics-classifier-primary'; later proposals use 'lyrics-classifier-secondary'. No classification fields are added to 'mezmur_data_import'.

## Safety

- The SQL begins a transaction and ends with **ROLLBACK**.
- Missing, deleted, stale, or slug-changed records abort the entire transaction.
- Invalid or archived taxonomy values abort the entire transaction.
- Read-after-write verification must succeed before the rollback point.
- Lyrics, titles, URLs, publication state, RLS policies, and Mezmur rows are never updated.
- Low-confidence, unclassified, and other review-required proposals are excluded.

Production activation requires a fresh authorized dry run, review of its current-state output, and explicit approval before producing a COMMIT copy.
