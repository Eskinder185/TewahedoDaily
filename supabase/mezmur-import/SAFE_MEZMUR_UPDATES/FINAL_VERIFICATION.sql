-- ============================================================================
-- READ-ONLY POST-DEPLOYMENT VERIFICATION SCRIPT
-- Run in Supabase SQL Editor as postgres / service_role.
-- Validates that:
-- 1. All records were updated safely by primary key (import_id).
-- 2. Zero cross-contamination occurred across the 28 duplicate slugs.
-- 3. Transliterations and section markers (CHORUS / VERSE) are intact.
-- 4. Drafts were NOT overwritten by published hymn content.
-- ============================================================================

-- 1. Overall Corpus Verification
SELECT
  'Total active Mezmurs' AS metric,
  COUNT(*)::text AS value
FROM public.mezmur_data_import
WHERE deleted_at IS NULL
UNION ALL
SELECT
  'Published Mezmurs',
  COUNT(*)::text
FROM public.mezmur_data_import
WHERE deleted_at IS NULL AND status = 'published'
UNION ALL
SELECT
  'Draft Mezmurs',
  COUNT(*)::text
FROM public.mezmur_data_import
WHERE deleted_at IS NULL AND status = 'draft'
UNION ALL
SELECT
  'Mezmurs with Formatted Chorus Markers',
  COUNT(*)::text
FROM public.mezmur_data_import
WHERE deleted_at IS NULL
  AND (lyrics_amharic LIKE '%CHORUS%' OR lyrics_english LIKE '%CHORUS%' OR lyrics_geez LIKE '%CHORUS%')
UNION ALL
SELECT
  'Mezmurs with Latin Transliteration',
  COUNT(*)::text
FROM public.mezmur_data_import
WHERE deleted_at IS NULL
  AND lyrics_transliteration IS NOT NULL AND trim(lyrics_transliteration) <> '';

-- 2. Zero-Corruption Verification on 28 Duplicate Slugs
-- Checks that each duplicate slug still retains two DISTINCT records
-- and that the draft record was NOT overwritten with published lyrics.
WITH dup_slugs AS (
  SELECT slug
  FROM public.mezmur_data_import
  WHERE deleted_at IS NULL
  GROUP BY slug
  HAVING COUNT(*) > 1
)
SELECT
  m.slug,
  COUNT(*) AS total_occurrences,
  COUNT(*) FILTER (WHERE m.status = 'published') AS published_count,
  COUNT(*) FILTER (WHERE m.status = 'draft') AS draft_count,
  COUNT(DISTINCT m.import_id) AS distinct_uuids,
  COUNT(DISTINCT COALESCE(m.lyrics_amharic, m.lyrics_english, '')) AS distinct_lyrics_count
FROM public.mezmur_data_import m
JOIN dup_slugs d ON m.slug = d.slug
WHERE m.deleted_at IS NULL
GROUP BY m.slug
ORDER BY m.slug;

-- 3. Integrity Check for 'aman-beaman' (Crucial Test Case)
SELECT
  import_id,
  slug,
  title,
  status,
  LEFT(COALESCE(lyrics_amharic, ''), 60) AS lyrics_sample,
  LEFT(COALESCE(lyrics_transliteration, ''), 60) AS transliteration_sample
FROM public.mezmur_data_import
WHERE slug = 'aman-beaman'
  AND deleted_at IS NULL;
