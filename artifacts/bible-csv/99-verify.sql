-- Additional relationship checks for the CSV import.
DO $integrity$
BEGIN
  IF EXISTS (SELECT 1 FROM public.bible_source_books b
      LEFT JOIN public.bible_editions e ON e.id = b.edition_id
      LEFT JOIN public.bible_canonical_books k ON k.id = b.canonical_book_id
      WHERE e.id IS NULL OR k.id IS NULL)
    THEN RAISE EXCEPTION 'Orphan source volume'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_source_books
      WHERE nullif(source_metadata->>'sha256', '') IS NULL)
    THEN RAISE EXCEPTION 'A source volume lost its SHA-256 metadata'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_chapters c
      LEFT JOIN public.bible_source_books b ON b.id = c.source_book_id WHERE b.id IS NULL)
    THEN RAISE EXCEPTION 'Orphan chapter'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_sections s
      LEFT JOIN public.bible_chapters c ON c.id = s.chapter_id WHERE c.id IS NULL)
    THEN RAISE EXCEPTION 'Orphan section'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_verses v
      LEFT JOIN public.bible_chapters c ON c.id = v.chapter_id
      LEFT JOIN public.bible_sections s ON s.id = v.section_id
      WHERE v.chapter_id IS NULL OR c.id IS NULL
        OR (v.section_id IS NOT NULL AND (s.id IS NULL OR s.chapter_id <> v.chapter_id)))
    THEN RAISE EXCEPTION 'Orphan verse or mismatched section'; END IF;
  IF (SELECT count(*) FROM public.bible_verses v
      JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am' AND v.text = '') <> 17
    THEN RAISE EXCEPTION 'Expected 17 preserved blank Amharic verse texts'; END IF;
  IF (SELECT count(*) FROM public.bible_verses v
      JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web' AND v.text = '') <> 5
    THEN RAISE EXCEPTION 'Expected 5 preserved blank WEB verse texts'; END IF;
END $integrity$;

-- Read-only verification. Run after every import part succeeds.
DO $verify$
BEGIN
  IF (SELECT count(*) FROM public.bible_editions) <> 2 THEN RAISE EXCEPTION 'Expected 2 editions'; END IF;
  IF (SELECT count(*) FROM public.bible_canonical_books) <> 81 THEN RAISE EXCEPTION 'Expected 81 canonical books'; END IF;
  IF (SELECT count(*) FROM public.bible_source_books) <> 149 THEN RAISE EXCEPTION 'Expected 149 source volumes'; END IF;
  IF (SELECT count(*) FROM public.bible_chapters) <> 2711 THEN RAISE EXCEPTION 'Expected 2711 chapters'; END IF;
  IF (SELECT count(*) FROM public.bible_sections) <> 2796 THEN RAISE EXCEPTION 'Expected 2796 real sections'; END IF;
  IF (SELECT count(*) FROM public.bible_verses) <> 73242 THEN RAISE EXCEPTION 'Expected 73242 verses'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_editions WHERE is_public OR review_status <> 'draft')
    THEN RAISE EXCEPTION 'An imported edition is public or no longer draft'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_source_books WHERE is_public)
    THEN RAISE EXCEPTION 'An imported source volume is public'; END IF;
  IF (SELECT count(*) FROM public.bible_source_books b JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am') <> 83 THEN RAISE EXCEPTION 'Expected 83 Amharic source volumes'; END IF;
  IF (SELECT count(*) FROM public.bible_source_books b JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web') <> 66 THEN RAISE EXCEPTION 'Expected 66 WEB source volumes'; END IF;
  IF (SELECT count(*) FROM public.bible_chapters c JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'am') <> 1522
    THEN RAISE EXCEPTION 'Expected 1522 Amharic chapters'; END IF;
  IF (SELECT count(*) FROM public.bible_chapters c JOIN public.bible_source_books b ON b.id = c.source_book_id
      JOIN public.bible_editions e ON e.id = b.edition_id WHERE e.code = 'web') <> 1189
    THEN RAISE EXCEPTION 'Expected 1189 WEB chapters'; END IF;
  IF (SELECT count(*) FROM public.bible_sections s JOIN public.bible_chapters c ON c.id = s.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am') <> 2796 THEN RAISE EXCEPTION 'Expected 2796 Amharic sections'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_sections s JOIN public.bible_chapters c ON c.id = s.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web') THEN RAISE EXCEPTION 'WEB has a synthetic section'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web' AND v.section_id IS NOT NULL)
    THEN RAISE EXCEPTION 'A WEB verse has a section ID'; END IF;
  IF EXISTS (SELECT 1 FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am' AND v.section_id IS NULL)
    THEN RAISE EXCEPTION 'An Amharic verse lacks its real section ID'; END IF;
  IF (SELECT count(*) FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'am') <> 42139 THEN RAISE EXCEPTION 'Expected 42139 Amharic verses'; END IF;
  IF (SELECT count(*) FROM public.bible_verses v JOIN public.bible_chapters c ON c.id = v.chapter_id
      JOIN public.bible_source_books b ON b.id = c.source_book_id JOIN public.bible_editions e ON e.id = b.edition_id
      WHERE e.code = 'web') <> 31103 THEN RAISE EXCEPTION 'Expected 31103 WEB verses'; END IF;
  IF (SELECT count(*) FROM public.bible_source_books WHERE review_status = 'draft') <> 148
    OR (SELECT count(*) FROM public.bible_source_books b JOIN public.bible_editions e ON e.id = b.edition_id
        WHERE e.code = 'web' AND b.review_status = 'needs_review') <> 1
    THEN RAISE EXCEPTION 'Expected 148 draft sources and WEB Proverbs needing review'; END IF;
END $verify$;

SELECT 'editions' AS item, count(*) AS rows FROM public.bible_editions
UNION ALL SELECT 'canonical_books', count(*) FROM public.bible_canonical_books
UNION ALL SELECT 'source_volumes', count(*) FROM public.bible_source_books
UNION ALL SELECT 'chapters', count(*) FROM public.bible_chapters
UNION ALL SELECT 'sections', count(*) FROM public.bible_sections
UNION ALL SELECT 'verses', count(*) FROM public.bible_verses;

SELECT e.code, e.review_status, e.is_public,
  count(b.id) AS source_volumes,
  count(b.id) FILTER (WHERE b.is_public) AS public_source_volumes,
  count(b.id) FILTER (WHERE b.review_status = 'needs_review') AS needs_review_source_volumes
FROM public.bible_editions e
LEFT JOIN public.bible_source_books b ON b.edition_id = e.id
GROUP BY e.id, e.code, e.review_status, e.is_public
ORDER BY e.code;
