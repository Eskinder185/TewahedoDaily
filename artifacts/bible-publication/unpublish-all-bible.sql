-- Manual rollback of publish-all-bible.sql. Run only if the whole expected corpus is public.
-- Restores the importer's original draft flags, including WEB Proverbs = needs_review.
-- The source_metadata mapping note and the reader's Proverbs/Tegsats alignment guard remain intact.

BEGIN;

SELECT 'BEFORE ROLLBACK' AS phase, 'editions' AS item, review_status, is_public, count(*) AS rows
FROM public.bible_editions GROUP BY review_status, is_public
UNION ALL
SELECT 'BEFORE ROLLBACK', 'source_volumes', review_status, is_public, count(*)
FROM public.bible_source_books GROUP BY review_status, is_public
ORDER BY item, review_status, is_public;

DO $unpublish$
DECLARE
  editions_changed integer;
  sources_changed integer;
BEGIN
  IF (SELECT count(*) FROM public.bible_editions) <> 2
    OR (SELECT count(*) FROM public.bible_source_books) <> 149
    OR (SELECT count(*) FROM public.bible_chapters) <> 2711
    OR (SELECT count(*) FROM public.bible_sections) <> 2796
    OR (SELECT count(*) FROM public.bible_verses) <> 73242
    OR (SELECT count(*) FROM public.bible_editions
        WHERE review_status = 'reviewed' AND is_public = true) <> 2
    OR (SELECT count(*) FROM public.bible_source_books
        WHERE review_status = 'reviewed' AND is_public = true) <> 149
  THEN
    RAISE EXCEPTION 'Bible corpus/publication state differs from the published baseline; rollback was not performed';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM public.bible_source_books b
    JOIN public.bible_editions e ON e.id = b.edition_id
    JOIN public.bible_canonical_books c ON c.id = b.canonical_book_id
    WHERE e.code = 'web' AND b.source_book_number = 20 AND c.slug = 'proverbs'
      AND b.source_metadata->>'mappingNote' IS NOT NULL
  ) THEN
    RAISE EXCEPTION 'WEB Proverbs mapping note is missing; rollback was not performed';
  END IF;

  UPDATE public.bible_source_books b
  SET is_public = false,
      review_status = CASE
        WHEN e.code = 'web' AND b.source_book_number = 20 AND c.slug = 'proverbs'
          THEN 'needs_review'
        ELSE 'draft'
      END
  FROM public.bible_editions e, public.bible_canonical_books c
  WHERE b.edition_id = e.id AND b.canonical_book_id = c.id;
  GET DIAGNOSTICS sources_changed = ROW_COUNT;

  UPDATE public.bible_editions
  SET is_public = false, review_status = 'draft';
  GET DIAGNOSTICS editions_changed = ROW_COUNT;

  IF editions_changed <> 2 OR sources_changed <> 149 THEN
    RAISE EXCEPTION 'Unexpected rollback update counts: % editions, % sources', editions_changed, sources_changed;
  END IF;

  RAISE NOTICE 'Returned % Bible editions and % source volumes to the imported unpublished state',
    editions_changed, sources_changed;
END $unpublish$;

SELECT 'AFTER ROLLBACK' AS phase, 'editions' AS item, review_status, is_public, count(*) AS rows
FROM public.bible_editions GROUP BY review_status, is_public
UNION ALL
SELECT 'AFTER ROLLBACK', 'source_volumes', review_status, is_public, count(*)
FROM public.bible_source_books GROUP BY review_status, is_public
ORDER BY item, review_status, is_public;

COMMIT;
