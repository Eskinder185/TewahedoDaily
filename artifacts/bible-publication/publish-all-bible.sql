-- Manual publication only. Run once in the Supabase SQL Editor after reviewing this file.
-- No Bible content, numbering, mappings, or RLS policies are changed.
-- This transaction aborts if the imported corpus or draft statuses differ from the reviewed baseline.

BEGIN;

SELECT 'BEFORE' AS phase, 'editions' AS item, count(*) AS rows FROM public.bible_editions
UNION ALL SELECT 'BEFORE', 'canonical_books', count(*) FROM public.bible_canonical_books
UNION ALL SELECT 'BEFORE', 'source_volumes', count(*) FROM public.bible_source_books
UNION ALL SELECT 'BEFORE', 'chapters', count(*) FROM public.bible_chapters
UNION ALL SELECT 'BEFORE', 'sections', count(*) FROM public.bible_sections
UNION ALL SELECT 'BEFORE', 'verses', count(*) FROM public.bible_verses;

SELECT 'BEFORE' AS phase, 'editions' AS item, review_status, is_public, count(*) AS rows
FROM public.bible_editions GROUP BY review_status, is_public
UNION ALL
SELECT 'BEFORE', 'source_volumes', review_status, is_public, count(*)
FROM public.bible_source_books GROUP BY review_status, is_public
ORDER BY item, review_status, is_public;

DO $publish$
DECLARE
  editions_changed integer;
  sources_changed integer;
BEGIN
  IF (SELECT count(*) FROM public.bible_editions) <> 2
    OR (SELECT count(*) FROM public.bible_editions WHERE code IN ('am', 'web')) <> 2
    OR (SELECT count(*) FROM public.bible_canonical_books) <> 81
    OR (SELECT count(*) FROM public.bible_source_books) <> 149
    OR (SELECT count(*) FROM public.bible_chapters) <> 2711
    OR (SELECT count(*) FROM public.bible_sections) <> 2796
    OR (SELECT count(*) FROM public.bible_verses) <> 73242
  THEN
    RAISE EXCEPTION 'Bible corpus counts differ from the reviewed 2/81/149/2711/2796/73242 baseline; no publication performed';
  END IF;

  IF (SELECT count(*) FROM public.bible_editions
      WHERE review_status = 'draft' AND is_public = false) <> 2
    OR (SELECT count(*) FROM public.bible_source_books
      WHERE review_status = 'draft' AND is_public = false) <> 148
    OR (SELECT count(*) FROM public.bible_source_books
      WHERE review_status = 'needs_review' AND is_public = false) <> 1
  THEN
    RAISE EXCEPTION 'Bible publication statuses differ from the imported draft baseline; no publication performed';
  END IF;

  IF (SELECT count(*) FROM public.bible_source_books b
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'am') <> 83
    OR (SELECT count(*) FROM public.bible_source_books b
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'web') <> 66
  THEN
    RAISE EXCEPTION 'Bible source volumes are not the expected 83 Amharic and 66 WEB rows';
  END IF;

  -- WEB Proverbs is the sole needs_review source. Its mapping note survives publication.
  IF NOT EXISTS (
      SELECT 1 FROM public.bible_source_books b
      JOIN public.bible_editions e ON e.id = b.edition_id
      JOIN public.bible_canonical_books c ON c.id = b.canonical_book_id
      WHERE e.code = 'web' AND b.source_book_number = 20 AND c.slug = 'proverbs'
        AND b.review_status = 'needs_review' AND b.is_public = false
        AND b.source_metadata->>'mappingNote' IS NOT NULL
  ) THEN
    RAISE EXCEPTION 'WEB Proverbs review marker/mapping note is missing; no publication performed';
  END IF;

  UPDATE public.bible_editions
  SET review_status = 'reviewed', is_public = true;
  GET DIAGNOSTICS editions_changed = ROW_COUNT;

  UPDATE public.bible_source_books
  SET review_status = 'reviewed', is_public = true;
  GET DIAGNOSTICS sources_changed = ROW_COUNT;

  IF editions_changed <> 2 OR sources_changed <> 149 THEN
    RAISE EXCEPTION 'Unexpected publication update counts: % editions, % sources', editions_changed, sources_changed;
  END IF;

  RAISE NOTICE 'Published % Bible editions and % Bible source volumes; scripture rows were untouched',
    editions_changed, sources_changed;
END $publish$;

SELECT 'AFTER' AS phase, 'editions' AS item, count(*) AS rows FROM public.bible_editions
UNION ALL SELECT 'AFTER', 'canonical_books', count(*) FROM public.bible_canonical_books
UNION ALL SELECT 'AFTER', 'source_volumes', count(*) FROM public.bible_source_books
UNION ALL SELECT 'AFTER', 'chapters', count(*) FROM public.bible_chapters
UNION ALL SELECT 'AFTER', 'sections', count(*) FROM public.bible_sections
UNION ALL SELECT 'AFTER', 'verses', count(*) FROM public.bible_verses;

SELECT 'AFTER' AS phase, 'editions' AS item, review_status, is_public, count(*) AS rows
FROM public.bible_editions GROUP BY review_status, is_public
UNION ALL
SELECT 'AFTER', 'source_volumes', review_status, is_public, count(*)
FROM public.bible_source_books GROUP BY review_status, is_public
ORDER BY item, review_status, is_public;

COMMIT;
