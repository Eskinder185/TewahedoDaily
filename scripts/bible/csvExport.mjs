import fs from 'node:fs/promises'
import path from 'node:path'
import { TextDecoder } from 'node:util'
import { COLUMNS, verifySql } from './sqlExport.mjs'

const VERSES_PER_FILE = 5000
const EXPECTED = {
  bible_editions: 2,
  bible_canonical_books: 81,
  bible_source_books: 149,
  bible_chapters: 2711,
  bible_sections: 2796,
  bible_verses: 73242,
}

function cellValue(column, value) {
  if (value === null || value === undefined) return null
  if (column === 'source_metadata') return JSON.stringify(value)
  if (typeof value === 'boolean') return value ? 'true' : 'false'
  if (typeof value === 'number' && Number.isFinite(value)) return String(value)
  if (typeof value === 'string') return value
  throw new Error(`Unsupported CSV value for ${column}.`)
}

function csvCell(value) {
  if (value === null) return ''
  if (value.includes('\0')) throw new Error('CSV text cannot contain a NUL character.')
  const quoted = value === '' || /[",\r\n]/.test(value) || /^\s|\s$/.test(value)
  return quoted ? `"${value.replaceAll('"', '""')}"` : value
}

function csvFile(table, rows) {
  const columns = COLUMNS[table]
  if (!columns) throw new Error(`Unexpected Bible table ${table}.`)
  const lines = [columns.join(',')]
  for (const row of rows) {
    const missing = columns.filter((column) => !Object.hasOwn(row, column))
    if (missing.length) throw new Error(`${table} row ${row.id} lacks ${missing.join(', ')}.`)
    lines.push(columns.map((column) => csvCell(cellValue(column, row[column]))).join(','))
  }
  return `${lines.join('\r\n')}\r\n`
}

// Preserve whether an empty field was quoted: unquoted empty means SQL NULL,
// while quoted "" is a real empty string (including the 22 blank source verses).
function parseCsv(input) {
  const records = []
  let row = []
  let value = ''
  let quoted = false
  let inQuotes = false
  let afterQuote = false
  const finishField = () => {
    row.push({ value, quoted })
    value = ''
    quoted = false
    afterQuote = false
  }
  const finishRow = () => {
    finishField()
    records.push(row)
    row = []
  }
  for (let i = 0; i < input.length; i++) {
    const char = input[i]
    if (inQuotes) {
      if (char === '"' && input[i + 1] === '"') { value += '"'; i++ }
      else if (char === '"') { inQuotes = false; afterQuote = true }
      else value += char
    } else if (afterQuote) {
      if (char === ',') finishField()
      else if (char === '\r' && input[i + 1] === '\n') { finishRow(); i++ }
      else throw new Error(`Unexpected character after quoted CSV field at position ${i}.`)
    } else if (char === ',') {
      finishField()
    } else if (char === '\r' && input[i + 1] === '\n') {
      finishRow(); i++
    } else if (char === '"' && value === '') {
      inQuotes = true
      quoted = true
    } else if (char === '"' || char === '\r' || char === '\n') {
      throw new Error(`Malformed CSV at position ${i}.`)
    } else {
      value += char
    }
  }
  if (inQuotes) throw new Error('Unterminated quoted CSV field.')
  if (row.length || value !== '' || quoted || afterQuote) finishRow()
  return records
}

async function readAndCheckCsv(directory, name, table, expectedRows) {
  const bytes = await fs.readFile(path.join(directory, name))
  if (bytes[0] === 0xef && bytes[1] === 0xbb && bytes[2] === 0xbf) throw new Error(`${name} has a BOM.`)
  const input = new TextDecoder('utf-8', { fatal: true }).decode(bytes)
  const records = parseCsv(input)
  const columns = COLUMNS[table]
  const header = records.shift()
  if (!header || header.length !== columns.length || header.some((cell, i) => cell.value !== columns[i])) {
    throw new Error(`${name} header differs from ${table} columns.`)
  }
  if (records.length !== expectedRows.length) throw new Error(`${name}: expected ${expectedRows.length} rows; parsed ${records.length}.`)
  const parsed = []
  for (let i = 0; i < records.length; i++) {
    const cells = records[i]
    if (cells.length !== columns.length) throw new Error(`${name}: row ${i + 2} has ${cells.length} columns.`)
    const result = {}
    for (let j = 0; j < columns.length; j++) {
      const column = columns[j]
      const original = cellValue(column, expectedRows[i][column])
      const actual = cells[j]
      if (original === null) {
        if (actual.value !== '' || actual.quoted) throw new Error(`${name}: row ${i + 2} ${column} lost NULL.`)
        result[column] = null
      } else {
        if (actual.value !== original || (original === '' && !actual.quoted)) {
          throw new Error(`${name}: row ${i + 2} ${column} changed during CSV serialization.`)
        }
        result[column] = actual.value
      }
    }
    parsed.push(result)
  }
  return parsed
}

function checkParsedRows(tables) {
  const ids = {}
  for (const [table, expected] of Object.entries(EXPECTED)) {
    const rows = tables[table]
    if (rows.length !== expected) throw new Error(`${table}: expected ${expected} rows; found ${rows.length}.`)
    ids[table] = new Set(rows.map((row) => row.id))
    if (ids[table].size !== rows.length) throw new Error(`${table} has duplicate primary IDs.`)
  }
  const editions = new Map(tables.bible_editions.map((row) => [row.id, row]))
  const canonical = ids.bible_canonical_books
  const sources = new Map(tables.bible_source_books.map((row) => [row.id, row]))
  const chapters = new Map(tables.bible_chapters.map((row) => [row.id, row]))
  const sections = new Map(tables.bible_sections.map((row) => [row.id, row]))
  if (editions.size !== 2 || [...editions.values()].some((row) => row.is_public !== 'false' || row.review_status !== 'draft')) {
    throw new Error('CSV editions are not unpublished drafts.')
  }
  if (tables.bible_canonical_books.filter((row) => row.source_status === 'available').length !== 74 ||
      tables.bible_canonical_books.filter((row) => row.source_status === 'missing').length !== 7) {
    throw new Error('Canonical coverage changed.')
  }
  const sourceCounts = { am: 0, web: 0 }
  const chapterCounts = { am: 0, web: 0 }
  const sectionCounts = { am: 0, web: 0 }
  const verseCounts = { am: 0, web: 0 }
  const blankVerses = { am: 0, web: 0 }
  let needsReviewWeb = 0
  for (const row of sources.values()) {
    const edition = editions.get(row.edition_id)
    if (!edition || !canonical.has(row.canonical_book_id)) throw new Error(`Orphan Bible source ${row.id}.`)
    if (row.is_public !== 'false') throw new Error(`Published Bible source ${row.id}.`)
    if (!Object.hasOwn(sourceCounts, edition.code)) throw new Error(`Unexpected edition ${edition.code}.`)
    sourceCounts[edition.code]++
    if (row.review_status === 'needs_review' && edition.code === 'web') needsReviewWeb++
    else if (row.review_status !== 'draft') throw new Error(`Unexpected review status on source ${row.id}.`)
  }
  for (const row of chapters.values()) {
    const source = sources.get(row.source_book_id)
    if (!source) throw new Error(`Orphan chapter ${row.id}.`)
    chapterCounts[editions.get(source.edition_id).code]++
  }
  for (const row of sections.values()) {
    const chapter = chapters.get(row.chapter_id)
    if (!chapter) throw new Error(`Orphan section ${row.id}.`)
    sectionCounts[editions.get(sources.get(chapter.source_book_id).edition_id).code]++
  }
  for (const row of tables.bible_verses) {
    const chapter = chapters.get(row.chapter_id)
    if (!chapter) throw new Error(`Orphan verse ${row.id}.`)
    const code = editions.get(sources.get(chapter.source_book_id).edition_id).code
    const section = row.section_id === null ? null : sections.get(row.section_id)
    if (row.section_id !== null && (!section || section.chapter_id !== row.chapter_id)) {
      throw new Error(`Verse ${row.id} has an invalid section link.`)
    }
    if (code === 'web' && row.section_id !== null) throw new Error(`WEB verse ${row.id} has a section.`)
    if (code === 'am' && row.section_id === null) throw new Error(`Amharic verse ${row.id} lacks a real section.`)
    verseCounts[code]++
    if (!row.text.trim()) blankVerses[code]++
  }
  for (const [label, actual, expected] of [
    ['Amharic sources', sourceCounts.am, 83], ['WEB sources', sourceCounts.web, 66],
    ['Amharic chapters', chapterCounts.am, 1522], ['WEB chapters', chapterCounts.web, 1189],
    ['Amharic sections', sectionCounts.am, 2796], ['WEB sections', sectionCounts.web, 0],
    ['Amharic verses', verseCounts.am, 42139], ['WEB verses', verseCounts.web, 31103],
    ['Blank Amharic verses', blankVerses.am, 17], ['Blank WEB verses', blankVerses.web, 5],
    ['WEB sources needing review', needsReviewWeb, 1],
  ]) {
    if (actual !== expected) throw new Error(`${label}: expected ${expected}; found ${actual}.`)
  }
  return { sourceCounts, chapterCounts, sectionCounts, verseCounts, blankVerses }
}

function integritySql() {
  return `-- Additional relationship checks for the CSV import.
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
`
}

function readme(files) {
  const emptyTableCheck = `select 'editions' as item, count(*) as row_count from public.bible_editions
union all select 'canonical_books', count(*) from public.bible_canonical_books
union all select 'source_books', count(*) from public.bible_source_books
union all select 'chapters', count(*) from public.bible_chapters
union all select 'sections', count(*) from public.bible_sections
union all select 'verses', count(*) from public.bible_verses;`
  return [
    '# Bible CSV import',
    '',
    'Generated locally by `node scripts/bible/import.mjs --export-csv`. No Supabase key, CLI, password, or database connection is used.',
    '',
    'This CSV export is intended for a fresh, empty Bible schema. Table Editor CSV import is insert-oriented and is not equivalent to the existing SQL upsert export. Reimporting the same CSV files can conflict with existing primary IDs. If Bible rows already exist, use `artifacts/bible-import/` SQL upserts instead.',
    '',
    'Ensure `20261004140000_bible_canonical_sources.sql` is applied, then `20261004141000_bible_direct_chapter_verses.sql`. Apply each migration only if it has not already been applied.',
    '',
    '## Confirm empty tables first',
    '',
    'Run this in the Supabase SQL Editor. **Stop if any count is nonzero**; the CSV sequence is for empty Bible tables.',
    '',
    '```sql', emptyTableCheck, '```',
    '',
    '## Table Editor settings',
    '',
    '- Open the named table, choose **Insert → Import Data from CSV**, and enable **First row contains headers**.',
    '- Keep the supplied `id` column mapped and imported. Do not allow the table default to generate replacement IDs. Check the preview and import every listed CSV column; `created_at` and `updated_at` are intentionally omitted because the database supplies defaults.',
    '- Check that `source_metadata` previews as a JSON object on editions and source volumes. If the dashboard omits or alters JSONB fields, stop and use the SQL upsert export.',
    '- Use empty CSV fields as SQL NULL only for nullable columns. If Studio offers a **Set empty cells as NULL** selector, choose: `bible_canonical_books`: `name_en`, `name_am`; `bible_source_books`: `source_name_en`, `source_name_am`, `source_short_name_en`, `source_short_name_am`, `source_part`; `bible_sections`: `title`; `bible_verses`: `section_id`. No columns need that option for editions or chapters.',
    '- **Do not select `bible_verses.text` for empty-cell-to-NULL conversion.** The source contains 17 genuinely empty Amharic texts and 5 genuinely empty WEB texts; these are quoted as `""` in CSV and must remain empty strings because `text` is NOT NULL. Confirm the preview preserves an empty text cell as an empty string. If your Table Editor cannot distinguish the needed NULL columns from blank text, stop and use the SQL upsert export.',
    '- The files are UTF-8 without BOM. Nullable fields are unquoted empty cells; an actual empty string is a quoted `""`. Boolean values are lowercase `true` and `false`.',
    '',
    '## Exact import order',
    '',
    'Run each file only after the previous one succeeds. For the CSV files, the target table is shown after the arrow.',
    '',
    ...files.map(({ name, table }, index) => `${index + 1}. \`${name}\` → \`public.${table}\``),
    `${files.length + 1}. \`99-verify.sql\` → run in the SQL Editor`,
    '',
    'The verification checks 2 editions, 81 canonical books, 149 source volumes, 2,711 chapters, 2,796 real sections, and 73,242 verses, as well as publication state and foreign keys.',
    'WEB verses have a real `chapter_id` and NULL `section_id`; WEB has no synthetic sections. Amharic verses retain their real section IDs. The database field `source_order` preserves source position, and explicit `verse_number` labels are unchanged.',
    '',
    '## Source warnings retained',
    '',
    '- 18 repeated Amharic verse labels remain in source order.',
    '- 17 Amharic and 5 WEB verse texts are blank and require editorial review.',
    '- WEB Proverbs/Tegsats chapter alignment requires review before publication.',
    '- Seven of the 81 canonical books have no current Amharic source; they have metadata rows only, with no invented source, chapter, or verse rows.',
    '',
  ].join('\n')
}

export async function exportBibleCsv(plan, projectRoot) {
  const grouped = {
    bible_editions: plan.editions,
    bible_canonical_books: plan.canonicalBooks,
    bible_source_books: plan.volumes.map((volume) => volume.sourceRow),
    bible_chapters: plan.volumes.flatMap((volume) => volume.chapterRows),
    bible_sections: plan.volumes.flatMap((volume) => volume.sectionRows),
    bible_verses: plan.volumes.flatMap((volume) => volume.verseRows),
  }
  for (const [table, count] of Object.entries(EXPECTED)) {
    if (grouped[table].length !== count) throw new Error(`Expected ${count} ${table} rows; found ${grouped[table].length}.`)
  }
  const directory = path.join(projectRoot, 'artifacts', 'bible-csv')
  const files = [
    { name: '00-bible_editions.csv', table: 'bible_editions', rows: grouped.bible_editions },
    { name: '01-bible_canonical_books.csv', table: 'bible_canonical_books', rows: grouped.bible_canonical_books },
    { name: '02-bible_source_books.csv', table: 'bible_source_books', rows: grouped.bible_source_books },
    { name: '03-bible_chapters.csv', table: 'bible_chapters', rows: grouped.bible_chapters },
    { name: '04-bible_sections.csv', table: 'bible_sections', rows: grouped.bible_sections },
  ]
  for (let start = 0; start < grouped.bible_verses.length; start += VERSES_PER_FILE) {
    files.push({ name: `05-bible_verses-part-${String(files.length - 4).padStart(3, '0')}.csv`,
      table: 'bible_verses', rows: grouped.bible_verses.slice(start, start + VERSES_PER_FILE) })
  }
  await fs.mkdir(directory, { recursive: true })
  const allowed = new Set([...files.map((file) => file.name), 'README.md', '99-verify.sql'])
  const unexpected = (await fs.readdir(directory)).filter((name) => !allowed.has(name))
  if (unexpected.length) throw new Error(`Move unexpected Bible CSV export files before regenerating: ${unexpected.join(', ')}`)
  for (const file of files) await fs.writeFile(path.join(directory, file.name), csvFile(file.table, file.rows), 'utf8')

  const parsed = Object.fromEntries(Object.keys(EXPECTED).map((table) => [table, []]))
  for (const file of files) {
    parsed[file.table].push(...await readAndCheckCsv(directory, file.name, file.table, file.rows))
  }
  const validation = checkParsedRows(parsed)
  await fs.writeFile(path.join(directory, '99-verify.sql'), `${integritySql()}\n${verifySql()}`, 'utf8')
  await fs.writeFile(path.join(directory, 'README.md'), readme(files), 'utf8')
  return {
    directory,
    files: files.map(({ name, table, rows }) => ({ name, table, rows: rows.length })),
    csvFiles: files.length,
    verseChunks: files.filter((file) => file.table === 'bible_verses').length,
    rowCounts: Object.fromEntries(Object.entries(grouped).map(([table, rows]) => [table, rows.length])),
    totalRows: Object.values(EXPECTED).reduce((sum, count) => sum + count, 0),
    utf8Validated: true,
    foreignKeysValidated: true,
    publicationValidated: true,
    webNullSectionsValidated: true,
    blankVerses: validation.blankVerses,
  }
}
