-- Read-only verification after publish-all-bible.sql.
-- Run in the Supabase SQL Editor as its normal privileged SQL role.
-- The last result sets use the real anon role and existing RLS policies.

BEGIN;

DO $verify$
BEGIN
  IF (SELECT count(*) FROM public.bible_editions) <> 2
    OR (SELECT count(*) FROM public.bible_canonical_books) <> 81
    OR (SELECT count(*) FROM public.bible_source_books) <> 149
    OR (SELECT count(*) FROM public.bible_chapters) <> 2711
    OR (SELECT count(*) FROM public.bible_sections) <> 2796
    OR (SELECT count(*) FROM public.bible_verses) <> 73242
  THEN
    RAISE EXCEPTION 'Physical Bible totals differ from 2 editions / 81 books / 149 sources / 2711 chapters / 2796 sections / 73242 verses';
  END IF;

  IF (SELECT count(*) FROM public.bible_canonical_books WHERE collection = 'old') <> 46
    OR (SELECT count(*) FROM public.bible_canonical_books WHERE collection = 'new') <> 35
    OR (SELECT count(*) FROM public.bible_canonical_books WHERE source_status = 'missing') <> 7
  THEN
    RAISE EXCEPTION 'Canonical structure differs from 46 Old / 35 New / 7 without imported Amharic sources';
  END IF;

  IF (SELECT count(*) FROM public.bible_editions
      WHERE review_status = 'reviewed' AND is_public = true) <> 2
    OR (SELECT count(*) FROM public.bible_source_books
      WHERE review_status = 'reviewed' AND is_public = true) <> 149
  THEN
    RAISE EXCEPTION 'Not all imported editions and source volumes are reviewed and public';
  END IF;

  IF (SELECT count(*) FROM public.bible_source_books b JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am') <> 83
    OR (SELECT count(*) FROM public.bible_source_books b JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web') <> 66
    OR (SELECT count(*) FROM public.bible_chapters c JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'am') <> 1522
    OR (SELECT count(*) FROM public.bible_chapters c JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'web') <> 1189
    OR (SELECT count(*) FROM public.bible_sections s JOIN public.bible_chapters c ON c.id = s.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'am') <> 2796
    OR (SELECT count(*) FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'am') <> 42139
    OR (SELECT count(*) FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'web') <> 31103
  THEN
    RAISE EXCEPTION 'Per-edition Bible source/chapter/section/verse counts differ from the imported baseline';
  END IF;

  IF EXISTS (
      SELECT 1 FROM public.bible_verses v
      LEFT JOIN public.bible_chapters c ON c.id = v.chapter_id
      WHERE c.id IS NULL
    )
    OR EXISTS (
      SELECT 1 FROM public.bible_verses v
      JOIN public.bible_sections s ON s.id = v.section_id
      WHERE s.chapter_id <> v.chapter_id
    )
    OR EXISTS (
      SELECT 1 FROM public.bible_sections s JOIN public.bible_chapters c ON c.id = s.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'web'
    )
    OR EXISTS (
      SELECT 1 FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web' AND v.section_id IS NOT NULL
    )
    OR EXISTS (
      SELECT 1 FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am' AND v.section_id IS NULL
    )
  THEN
    RAISE EXCEPTION 'Verse chapter links, WEB direct-chapter structure, or Amharic real sections are not intact';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM public.bible_source_books b
    JOIN public.bible_editions e ON e.id = b.edition_id
    JOIN public.bible_canonical_books c ON c.id = b.canonical_book_id
    WHERE e.code = 'web' AND b.source_book_number = 20 AND c.slug = 'proverbs'
      AND b.source_metadata->>'mappingNote' IS NOT NULL
  ) THEN
    RAISE EXCEPTION 'The WEB Proverbs/Tegsats editorial alignment warning is missing';
  END IF;

  -- The validator counted repeated labels per Amharic chapter, across real sections.
  IF (SELECT count(*) FROM (
      SELECT row_number() OVER (
        PARTITION BY v.chapter_id, v.verse_number
        ORDER BY s.source_order, v.source_order, v.id
      ) AS occurrence
      FROM public.bible_verses v
      JOIN public.bible_sections s ON s.id = v.section_id
      JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am'
    ) labels WHERE occurrence > 1) <> 18
  THEN
    RAISE EXCEPTION 'The 18 repeated Amharic verse labels were not preserved';
  END IF;

  IF (SELECT count(*) FROM public.bible_verses v
      JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am' AND btrim(v.text) = '') <> 17
    OR (SELECT count(*) FROM public.bible_verses v
      JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web' AND btrim(v.text) = '') <> 5
  THEN
    RAISE EXCEPTION 'Expected 17 blank Amharic and 5 blank WEB verse texts remain unchanged';
  END IF;

  RAISE NOTICE 'Physical totals, edition splits, structure, repeated labels, blank texts, and Proverbs warning passed';
END $verify$;

-- SET LOCAL ROLE subjects the following reads to the same anon RLS policies as the frontend.
SET LOCAL ROLE anon;

SELECT 'bible_editions' AS table_name, 2 AS expected, count(*) AS visible,
  count(*) = 2 AS passes FROM public.bible_editions
UNION ALL SELECT 'bible_canonical_books', 81, count(*), count(*) = 81 FROM public.bible_canonical_books
UNION ALL SELECT 'bible_source_books', 149, count(*), count(*) = 149 FROM public.bible_source_books
UNION ALL SELECT 'bible_chapters', 2711, count(*), count(*) = 2711 FROM public.bible_chapters
UNION ALL SELECT 'bible_sections', 2796, count(*), count(*) = 2796 FROM public.bible_sections
UNION ALL SELECT 'bible_verses', 73242, count(*), count(*) = 73242 FROM public.bible_verses;

SELECT e.code,
  (SELECT count(*) FROM public.bible_source_books b WHERE b.edition_id = e.id) AS source_volumes,
  (SELECT count(*) FROM public.bible_chapters c
    JOIN public.bible_source_books b ON b.id = c.source_book_id WHERE b.edition_id = e.id) AS chapters,
  (SELECT count(*) FROM public.bible_sections s
    JOIN public.bible_chapters c ON c.id = s.chapter_id
    JOIN public.bible_source_books b ON b.id = c.source_book_id WHERE b.edition_id = e.id) AS sections,
  (SELECT count(*) FROM public.bible_verses v
    JOIN public.bible_chapters c ON c.id = v.chapter_id
    JOIN public.bible_source_books b ON b.id = c.source_book_id WHERE b.edition_id = e.id) AS verses
FROM public.bible_editions e
ORDER BY e.code;

-- The transaction is read-only in effect; ROLLBACK removes the temporary anon role setting.
ROLLBACK;
