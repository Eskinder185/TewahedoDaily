# Phase 4 draft-reversion results

- Source export rows examined: **1,728**.
- Candidate rows processed: **294**.
- Unique Published identities recovered: **210**.
- Ambiguous identities: **84**.
- Missing identities: **0** after preserving row-level slug/video evidence.
- Current uniquely identified Published records eligible for the reviewed plan: **210**.
- Records moved to Draft: **0**.

The 210 matches are not applied automatically. The 84 ambiguous records require the fingerprint-enabled read-only export and manual confirmation. Review-only duplicate, encoding, formatting, Zemari, and theological findings remain excluded.

No lyrics, titles, slugs, recordings, classifications, Zemari relationships, statuses, or historical metadata changed.

## Required next step

Run `PHASE_4_EXPORT.ps1` again to produce `lyrics_fingerprint`, then run the enriched candidate, reconciliation, and plan-builder scripts. Only uniquely identified, currently Published records with matching `updated_at` may enter the rollback-only apply SQL.

Rollback remains an inverse status transition by immutable `import_id`, guarded by the recorded post-change timestamp. No rollback or production update was executed.
