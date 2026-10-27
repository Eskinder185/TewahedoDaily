# ROLLBACK INSTRUCTIONS — SAFE MEZMUR UPDATE DEPLOYMENT

## 1. Overview and Safety Guarantees

Every update statement in the `SAFE_UPDATE_BATCHES/` directory targets a specific primary key `import_id` (UUID) and uses `IS NOT DISTINCT FROM` concurrency guards.
If any batch needs to be reverted, this document provides the exact reverse SQL procedures and restoration commands.

### Baseline Snapshot
- **Baseline Source**: `audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl` (1,152 records with SHA-256 row checksums)
- **Mapping Reference**: `supabase/mezmur-import/SAFE_MEZMUR_UPDATES/UUID_MAPPING.csv`

---

## 2. Emergency Rollback Options

### Option A: Reverse Single Batch via Generated Reverse SQL
Each batch has an inverse operation that restores the exact baseline values recorded in `ORIGINAL_BACKUP.jsonl`.

To reverse a specific batch (e.g. `batch_01.sql`):
```sql
BEGIN;

-- Run reverse update for each affected import_id:
UPDATE public.mezmur_data_import
SET <target_field> = '<original_lyrics_from_backup>',
    lyrics_transliteration = <original_transliteration_or_null>,
    updated_at = clock_timestamp()::text
WHERE import_id = '<UUID>'::uuid;

NOTIFY pgrst, 'reload schema';

COMMIT;
```

### Option B: Complete Corpus Restoration to Original Baseline
If a complete restore of all 1,119 records is required, run the automated rollback script:
```powershell
node scripts/generate-rollback-sql.mjs
```
This reads `ORIGINAL_BACKUP.jsonl` and emits `supabase/mezmur-import/SAFE_MEZMUR_UPDATES/FULL_REVERSE_ROLLBACK.sql`.
Execute `FULL_REVERSE_ROLLBACK.sql` in the Supabase SQL Editor.

---

## 3. Post-Rollback Verification Query

Run this query in Supabase SQL Editor to confirm that rollback succeeded:
```sql
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE lyrics_amharic IS NOT NULL) AS amharic_lyrics_count,
  COUNT(*) FILTER (WHERE lyrics_transliteration IS NOT NULL) AS transliteration_count,
  COUNT(*) FILTER (WHERE status = 'published') AS published_count,
  COUNT(*) FILTER (WHERE status = 'draft') AS draft_count
FROM public.mezmur_data_import
WHERE deleted_at IS NULL;
```
