# Bible CSV import

Generated locally by `node scripts/bible/import.mjs --export-csv`. No Supabase key, CLI, password, or database connection is used.

This CSV export is intended for a fresh, empty Bible schema. Table Editor CSV import is insert-oriented and is not equivalent to the existing SQL upsert export. Reimporting the same CSV files can conflict with existing primary IDs. If Bible rows already exist, use `artifacts/bible-import/` SQL upserts instead.

Ensure `20261004140000_bible_canonical_sources.sql` is applied, then `20261004141000_bible_direct_chapter_verses.sql`. Apply each migration only if it has not already been applied.

## Confirm empty tables first

Run this in the Supabase SQL Editor. **Stop if any count is nonzero**; the CSV sequence is for empty Bible tables.

```sql
select 'editions' as item, count(*) as row_count from public.bible_editions
union all select 'canonical_books', count(*) from public.bible_canonical_books
union all select 'source_books', count(*) from public.bible_source_books
union all select 'chapters', count(*) from public.bible_chapters
union all select 'sections', count(*) from public.bible_sections
union all select 'verses', count(*) from public.bible_verses;
```

## Table Editor settings

- Open the named table, choose **Insert → Import Data from CSV**, and enable **First row contains headers**.
- Keep the supplied `id` column mapped and imported. Do not allow the table default to generate replacement IDs. Check the preview and import every listed CSV column; `created_at` and `updated_at` are intentionally omitted because the database supplies defaults.
- Check that `source_metadata` previews as a JSON object on editions and source volumes. If the dashboard omits or alters JSONB fields, stop and use the SQL upsert export.
- Use empty CSV fields as SQL NULL only for nullable columns. If Studio offers a **Set empty cells as NULL** selector, choose: `bible_canonical_books`: `name_en`, `name_am`; `bible_source_books`: `source_name_en`, `source_name_am`, `source_short_name_en`, `source_short_name_am`, `source_part`; `bible_sections`: `title`; `bible_verses`: `section_id`. No columns need that option for editions or chapters.
- **Do not select `bible_verses.text` for empty-cell-to-NULL conversion.** The source contains 17 genuinely empty Amharic texts and 5 genuinely empty WEB texts; these are quoted as `""` in CSV and must remain empty strings because `text` is NOT NULL. Confirm the preview preserves an empty text cell as an empty string. If your Table Editor cannot distinguish the needed NULL columns from blank text, stop and use the SQL upsert export.
- The files are UTF-8 without BOM. Nullable fields are unquoted empty cells; an actual empty string is a quoted `""`. Boolean values are lowercase `true` and `false`.

## Exact import order

Run each file only after the previous one succeeds. For the CSV files, the target table is shown after the arrow.

1. `00-bible_editions.csv` → `public.bible_editions`
2. `01-bible_canonical_books.csv` → `public.bible_canonical_books`
3. `02-bible_source_books.csv` → `public.bible_source_books`
4. `03-bible_chapters.csv` → `public.bible_chapters`
5. `04-bible_sections.csv` → `public.bible_sections`
6. `05-bible_verses-part-001.csv` → `public.bible_verses`
7. `05-bible_verses-part-002.csv` → `public.bible_verses`
8. `05-bible_verses-part-003.csv` → `public.bible_verses`
9. `05-bible_verses-part-004.csv` → `public.bible_verses`
10. `05-bible_verses-part-005.csv` → `public.bible_verses`
11. `05-bible_verses-part-006.csv` → `public.bible_verses`
12. `05-bible_verses-part-007.csv` → `public.bible_verses`
13. `05-bible_verses-part-008.csv` → `public.bible_verses`
14. `05-bible_verses-part-009.csv` → `public.bible_verses`
15. `05-bible_verses-part-010.csv` → `public.bible_verses`
16. `05-bible_verses-part-011.csv` → `public.bible_verses`
17. `05-bible_verses-part-012.csv` → `public.bible_verses`
18. `05-bible_verses-part-013.csv` → `public.bible_verses`
19. `05-bible_verses-part-014.csv` → `public.bible_verses`
20. `05-bible_verses-part-015.csv` → `public.bible_verses`
21. `99-verify.sql` → run in the SQL Editor

The verification checks 2 editions, 81 canonical books, 149 source volumes, 2,711 chapters, 2,796 real sections, and 73,242 verses, as well as publication state and foreign keys.
WEB verses have a real `chapter_id` and NULL `section_id`; WEB has no synthetic sections. Amharic verses retain their real section IDs. The database field `source_order` preserves source position, and explicit `verse_number` labels are unchanged.

## Source warnings retained

- 18 repeated Amharic verse labels remain in source order.
- 17 Amharic and 5 WEB verse texts are blank and require editorial review.
- WEB Proverbs/Tegsats chapter alignment requires review before publication.
- Seven of the 81 canonical books have no current Amharic source; they have metadata rows only, with no invented source, chapter, or verse rows.
