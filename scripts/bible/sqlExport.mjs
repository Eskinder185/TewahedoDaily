import fs from 'node:fs/promises'
import path from 'node:path'

const VERSES_PER_FILE = 1000
const ROWS_PER_STATEMENT = 250

export const COLUMNS = {
  bible_editions: ['id', 'code', 'name', 'language_code', 'source_metadata', 'review_status', 'is_public'],
  bible_canonical_books: ['id', 'canonical_number', 'collection', 'slug', 'name_en', 'name_am', 'sort_order', 'source_status'],
  bible_source_books: ['id', 'edition_id', 'canonical_book_id', 'source_book_number', 'source_file',
    'source_name_en', 'source_name_am', 'source_short_name_en', 'source_short_name_am',
    'source_order', 'source_part', 'source_metadata', 'review_status', 'is_public'],
  bible_chapters: ['id', 'source_book_id', 'chapter_number', 'source_order'],
  bible_sections: ['id', 'chapter_id', 'source_order', 'title'],
  bible_verses: ['id', 'chapter_id', 'section_id', 'source_order', 'verse_number', 'text'],
}

function quotedText(value) {
  if (value.includes('\0')) throw new Error('PostgreSQL text cannot contain a NUL character.')
  return `'${value.replaceAll("'", "''")}'`
}

function sqlValue(column, value) {
  if (value === null || value === undefined) return 'NULL'
  if (column === 'source_metadata') return `${quotedText(JSON.stringify(value))}::jsonb`
  if (typeof value === 'string') return quotedText(value)
  if (typeof value === 'boolean') return value ? 'TRUE' : 'FALSE'
  if (typeof value === 'number' && Number.isFinite(value)) return String(value)
  throw new Error(`Unsupported SQL value for ${column}.`)
}

function upsertStatements(table, rows) {
  const columns = COLUMNS[table]
  if (!columns) throw new Error(`Unexpected Bible table ${table}.`)
  const updates = columns.filter((column) => column !== 'id')
    .map((column) => `  ${column} = EXCLUDED.${column}`).join(',\n')
  const statements = []
  for (let start = 0; start < rows.length; start += ROWS_PER_STATEMENT) {
    const values = rows.slice(start, start + ROWS_PER_STATEMENT).map((row) => {
      const missing = columns.filter((column) => !Object.hasOwn(row, column))
      if (missing.length) throw new Error(`${table} row ${row.id} lacks ${missing.join(', ')}.`)
      return `  (${columns.map((column) => sqlValue(column, row[column])).join(', ')})`
    })
    statements.push(`INSERT INTO public.${table} (${columns.join(', ')})\nVALUES\n${values.join(',\n')}\nON CONFLICT (id) DO UPDATE SET\n${updates};`)
  }
  return statements.join('\n\n')
}

const publicationGuard = `DO $guard$
BEGIN
  IF EXISTS (
    SELECT 1 FROM public.bible_editions WHERE code IN ('am', 'web') AND is_public
  ) OR EXISTS (
    SELECT 1 FROM public.bible_source_books b
    JOIN public.bible_editions e ON e.id = b.edition_id
    WHERE e.code IN ('am', 'web') AND b.is_public
  ) THEN
    RAISE EXCEPTION 'Refusing to overwrite a published Bible edition or source volume';
  END IF;
END $guard$;`

const schemaGuard = `DO $schema$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'bible_verses'
      AND column_name = 'chapter_id' AND is_nullable = 'NO'
  ) OR NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'bible_verses'
      AND column_name = 'section_id' AND is_nullable = 'YES'
  ) THEN
    RAISE EXCEPTION 'Apply both Bible migrations, including direct chapter verses, before importing';
  END IF;
END $schema$;`

function sourceDigestGuard(sourceBooks) {
  const values = sourceBooks.map((row) =>
    `    (${quotedText(row.id)}::uuid, ${quotedText(row.source_metadata.sha256)})`).join(',\n')
  return `DO $source_guard$
BEGIN
  IF EXISTS (
    SELECT 1 FROM public.bible_source_books existing
    JOIN (VALUES\n${values}\n    ) AS incoming(id, sha256) ON incoming.id = existing.id
    WHERE nullif(existing.source_metadata->>'sha256', '') IS NOT NULL
      AND existing.source_metadata->>'sha256' <> incoming.sha256
  ) THEN
    RAISE EXCEPTION 'A Bible source changed; review and version it before reimport';
  END IF;
END $source_guard$;`
}

function sqlFile(table, rows, extraGuard = '') {
  return [
    '-- Generated Bible staging SQL. Run in the order listed in README.md.',
    'SET standard_conforming_strings = on;',
    'BEGIN;',
    schemaGuard,
    publicationGuard,
    extraGuard,
    upsertStatements(table, rows),
    'COMMIT;',
    '',
  ].filter(Boolean).join('\n\n')
}

export function verifySql() {
  return `-- Read-only verification. Run after every import part succeeds.
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
`
}

function assertPlan(plan, sourceBooks, chapters, sections, verses) {
  const expected = { editions: 2, canonicalBooks: 81, sourceBooks: 149,
    chapters: 2711, sections: 2796, verses: 73242 }
  const actual = { editions: plan.editions.length, canonicalBooks: plan.canonicalBooks.length,
    sourceBooks: sourceBooks.length, chapters: chapters.length, sections: sections.length, verses: verses.length }
  for (const [name, count] of Object.entries(expected)) {
    if (actual[name] !== count) throw new Error(`Expected ${count} ${name}; found ${actual[name]}.`)
  }
  if (plan.editions.some((row) => row.is_public || row.review_status !== 'draft')) {
    throw new Error('SQL export must keep editions unpublished drafts.')
  }
  if (sourceBooks.some((row) => row.is_public)) throw new Error('SQL export must keep source volumes unpublished.')
  if (plan.volumes.some((volume) => volume.editionCode === 'web' && volume.sectionRows.length)) {
    throw new Error('WEB source created synthetic sections.')
  }
  if (plan.volumes.some((volume) => volume.editionCode === 'web' && volume.verseRows.some((row) => row.section_id !== null))) {
    throw new Error('WEB verses must have null section IDs.')
  }
  if (plan.volumes.some((volume) => volume.editionCode === 'am' && volume.verseRows.some((row) => !row.section_id))) {
    throw new Error('Amharic verses must retain real section IDs.')
  }
}

export async function exportBibleSql(plan, projectRoot) {
  const sourceBooks = plan.volumes.map((volume) => volume.sourceRow)
  const chapters = plan.volumes.flatMap((volume) => volume.chapterRows)
  const sections = plan.volumes.flatMap((volume) => volume.sectionRows)
  const verses = plan.volumes.flatMap((volume) => volume.verseRows)
  assertPlan(plan, sourceBooks, chapters, sections, verses)

  const directory = path.join(projectRoot, 'artifacts', 'bible-import')
  const parts = []
  for (let start = 0; start < verses.length; start += VERSES_PER_FILE) {
    parts.push({ name: `05-verses-part-${String(parts.length + 1).padStart(3, '0')}.sql`,
      rows: verses.slice(start, start + VERSES_PER_FILE) })
  }
  const sqlFiles = ['00-editions.sql', '01-canonical-books.sql', '02-source-books.sql',
    '03-chapters.sql', '04-sections.sql', ...parts.map((part) => part.name), '99-verify.sql']
  await fs.mkdir(directory, { recursive: true })
  const staleFiles = (await fs.readdir(directory)).filter((name) => name.endsWith('.sql') && !sqlFiles.includes(name))
  if (staleFiles.length) throw new Error(`Remove or move stale SQL exports before regenerating: ${staleFiles.join(', ')}`)

  const files = [
    ['00-editions.sql', sqlFile('bible_editions', plan.editions)],
    ['01-canonical-books.sql', sqlFile('bible_canonical_books', plan.canonicalBooks)],
    ['02-source-books.sql', sqlFile('bible_source_books', sourceBooks, sourceDigestGuard(sourceBooks))],
    ['03-chapters.sql', sqlFile('bible_chapters', chapters)],
    ['04-sections.sql', sqlFile('bible_sections', sections)],
    ...parts.map((part) => [part.name, sqlFile('bible_verses', part.rows)]),
    ['99-verify.sql', verifySql()],
  ]
  for (const [name, content] of files) await fs.writeFile(path.join(directory, name), content, 'utf8')

  const readme = [
    '# Bible SQL import',
    '',
    'Generated by `node scripts/bible/import.mjs --export-sql`. No Supabase connection or key is used.',
    '',
    'Ensure `20261004140000_bible_canonical_sources.sql` has been applied. If it has not, run it once. Then apply `20261004141000_bible_direct_chapter_verses.sql` once. Do not rerun migrations that are already applied.',
    'In the Supabase SQL Editor for the intended project, open and run each entire file in the exact order below. Stop on any error; do not skip ahead.',
    'Each import file is one transaction and can be rerun while its editions and source volumes remain unpublished. Rerunning resets staged, unpublished rows to source values.',
    'The files contain only Bible-table upserts, read-only guards, and verification. They do not publish scripture. Unicode text is written as UTF-8 with quoted SQL literals.',
    '`source_order` is the database field that preserves each source position. Explicit `verse_number` values are not renumbered.',
    `Verse data is split into ${parts.length} files of at most ${VERSES_PER_FILE} rows, with at most ${ROWS_PER_STATEMENT} rows per INSERT statement.`,
    '',
    '## Execution order',
    '',
    ...sqlFiles.map((name, index) => `${index + 1}. \`${name}\``),
    '',
    'The final verification must report 2 editions, 81 canonical books, 149 source volumes, 2,711 chapters, 2,796 real sections, and 73,242 verses.',
    'WEB has no section rows; its verses have `section_id = NULL`. Amharic verses retain their real section IDs.',
    '',
  ].join('\n')
  await fs.writeFile(path.join(directory, 'README.md'), readme, 'utf8')
  return { directory, sqlFiles }
}
