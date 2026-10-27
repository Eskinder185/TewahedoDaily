# Phase 4 identity reconciliation — post-export findings

The source export was generated successfully and contains 1,728 Published rows with these columns:

`import_id`, `mezmur_id`, `slug`, `title`, `title_amharic`, `title_english`, `youtube_url`, `status`, `updated_at`, `deleted_at`

The export does not contain a lyrics fingerprint, and its Ethiopic title fields are mojibake. The IDs, slugs, URLs, statuses, and timestamps remain usable.

## Reconciliation results

- Candidate rows processed: **294** (242 collision rows plus 52 exact-duplicate candidate sides).
- Unique `import_id` matches currently Published: **210**.
- Unresolved ambiguous rows: **84**.
- Missing rows: **0** after preserving row-level slug/video evidence.
- Current uniquely identified Published records eligible for the reviewed draft plan: **210**. They have not been changed.

## Root causes

The original 215 ambiguity result had two local algorithm defects:

1. The matcher did not prioritize an exact public `mezmur_id`; it combined duplicate slug/video candidates and incorrectly called them ambiguous.
2. `PHASE_4_CONFIRMED_CANDIDATES.csv` collapsed multiple public rows with a null `mezmur_id` into one `public_slug:<slug>` key, losing the row’s YouTube evidence.

The corrected workflow preserves row-level slug, title, and video evidence and resolves exact `mezmur_id` matches first. This recovers 210 unique Published identities.

The remaining 84 rows are genuinely ambiguous in the current source export: multiple source rows share the same slug/title/YouTube video, or the public row has no immutable ID and the export lacks a lyrics fingerprint. Mojibake in exported titles is not used as a match key. These 84 remain excluded from the plan.

The previous two “missing” records are no longer missing after the row-level candidate repair; they resolve through the enriched slug/video evidence. They must still remain in the confirmed review list until the fingerprint-enabled export confirms the exact record.

## Additional read-only export required

Run the updated `PHASE_4_EXPORT.ps1`. Its SQL exports all statuses plus a one-way `lyrics_fingerprint`. Then run:

```powershell
node --experimental-strip-types --no-warnings scripts/build-mezmur-phase4-candidates.ts
node --experimental-strip-types --no-warnings scripts/reconcile-mezmur-phase4-identities.ts
node --experimental-strip-types --no-warnings scripts/build-mezmur-phase4-draft-plan.ts
```

Only a row with exactly one source `import_id`, `status = published`, `deleted_at is null`, and matching `updated_at` enters the draft plan. No ambiguous or review-only finding is eligible. The current plan contains 210 rows.

No production records have been changed. The apply SQL remains rollback-only.
