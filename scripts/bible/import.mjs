/**
 * Future Bible import entry point. Default invocation is a local dry run.
 * Applying requires an explicit --apply and server-only Supabase credentials.
 * Imported editions and source volumes stay unpublished for editorial review.
 *
 *   node scripts/bible/validate.mjs
 *   node scripts/bible/import.mjs --dry-run
 *   node --env-file-if-exists=.env.local scripts/bible/import.mjs --apply
 */
import { createHash } from 'node:crypto'
import path from 'node:path'
import process from 'node:process'
import { validateBibleSources } from './validate.mjs'

const args = new Set(process.argv.slice(2))
if (args.has('--apply') && args.has('--dry-run')) throw new Error('Choose --apply or --dry-run.')
const apply = args.has('--apply')

function stableId(...parts) {
  const hex = createHash('sha256').update(parts.join('|')).digest('hex')
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-5${hex.slice(13, 16)}-a${hex.slice(17, 20)}-${hex.slice(20, 32)}`
}

function sha256(raw) { return createHash('sha256').update(raw).digest('hex') }

async function upsert(client, table, rows, batchSize = 400) {
  for (let start = 0; start < rows.length; start += batchSize) {
    const batch = rows.slice(start, start + batchSize)
    const { error } = await client.from(table).upsert(batch, { onConflict: 'id' })
    if (error) throw new Error(`${table} rows ${start + 1}-${start + batch.length}: ${error.message}`)
  }
}

function editionRow(code, name, languageCode, metadata) {
  return {
    id: stableId('bible-edition', code), code, name, language_code: languageCode,
    source_metadata: metadata, review_status: 'draft', is_public: false,
  }
}

function canonicalRows(report) {
  const represented = new Set(report.amSources.map((source) => source.mapping.canonicalBookKey))
  return report.canonicalBooks.map((book) => {
    const sources = report.amSources.filter((source) => source.mapping.canonicalBookKey === book.key)
    return {
      id: stableId('bible-canonical', book.key),
      canonical_number: book.canonicalNumber,
      collection: book.collection,
      slug: book.key,
      name_en: book.nameEn,
      // A grouped book needs an editorial Amharic heading; source-volume titles are preserved separately.
      name_am: sources.length === 1 ? sources[0].data.book_name_am ?? null : null,
      sort_order: book.sortOrder,
      source_status: represented.has(book.key) ? 'available' : 'missing',
    }
  })
}

function amChapters(source) {
  return source.data.chapters.map((chapter, chapterIndex) => ({
    number: chapter.chapter,
    order: chapterIndex + 1,
    sections: chapter.sections.map((section, sectionIndex) => ({
      title: section.title ?? null,
      order: sectionIndex + 1,
      verses: section.verses.map((verse, verseIndex) => ({
        number: verse.verse, order: verseIndex + 1, text: verse.text,
      })),
    })),
  }))
}

function webChapters(volume) {
  const chapters = new Map()
  for (const verse of volume.verses) {
    if (!chapters.has(verse.chapter)) chapters.set(verse.chapter, [])
    chapters.get(verse.chapter).push(verse)
  }
  return [...chapters].map(([number, verses], index) => ({
    number, order: index + 1,
    sections: [{
      title: null, order: 1,
      verses: verses.map((verse, verseIndex) => ({
        number: verse.verse, order: verseIndex + 1, text: verse.text,
      })),
    }],
  }))
}

async function importVolume(client, edition, source, chapters) {
  const mapping = source.mapping
  const sourceId = stableId('bible-source', edition.code, mapping.sourceBookNumber)
  const { data: existing, error: lookupError } = await client.from('bible_source_books')
    .select('is_public,source_metadata').eq('id', sourceId).maybeSingle()
  if (lookupError) throw new Error(`Could not inspect source ${edition.code}:${mapping.sourceBookNumber}: ${lookupError.message}`)
  if (existing?.is_public) throw new Error(`Refusing to overwrite published source ${edition.code}:${mapping.sourceBookNumber}.`)
  const digest = sha256(source.raw)
  if (existing?.source_metadata?.sha256 && existing.source_metadata.sha256 !== digest) {
    throw new Error(`Source ${edition.code}:${mapping.sourceBookNumber} changed; review and version it before reimport.`)
  }

  const sourceRow = {
    id: sourceId,
    edition_id: edition.id,
    canonical_book_id: stableId('bible-canonical', mapping.canonicalBookKey),
    source_book_number: mapping.sourceBookNumber,
    source_file: source.sourceFile,
    source_name_en: source.data.book_name_en ?? source.name ?? null,
    source_name_am: source.data.book_name_am ?? null,
    source_short_name_en: source.data.book_short_name_en ?? null,
    source_short_name_am: source.data.book_short_name_am ?? null,
    source_order: mapping.sourceOrder,
    source_part: mapping.sourcePart,
    source_metadata: {
      sha256: digest,
      sourceTestament: source.data.testament ?? null,
      sourceCanonFlag: source.data.Book_of_canon ?? null,
      mappingNote: mapping.mappingNote ?? null,
    },
    review_status: mapping.reviewStatus ?? 'draft',
    is_public: false,
  }
  await upsert(client, 'bible_source_books', [sourceRow])

  const chapterRows = []
  const sectionRows = []
  const verseRows = []
  for (const chapter of chapters) {
    const chapterId = stableId('bible-chapter', edition.code, mapping.sourceBookNumber, chapter.order)
    chapterRows.push({ id: chapterId, source_book_id: sourceId, chapter_number: chapter.number, source_order: chapter.order })
    for (const section of chapter.sections) {
      const sectionId = stableId('bible-section', edition.code, mapping.sourceBookNumber, chapter.order, section.order)
      sectionRows.push({ id: sectionId, chapter_id: chapterId, source_order: section.order, title: section.title })
      for (const verse of section.verses) {
        verseRows.push({
          id: stableId('bible-verse', edition.code, mapping.sourceBookNumber, chapter.order, section.order, verse.order),
          section_id: sectionId, source_order: verse.order,
          verse_number: verse.number, text: verse.text,
        })
      }
    }
  }
  await upsert(client, 'bible_chapters', chapterRows)
  await upsert(client, 'bible_sections', sectionRows)
  await upsert(client, 'bible_verses', verseRows)
  console.log(`Staged ${edition.code} source ${mapping.sourceBookNumber}: ${chapterRows.length} chapters, ${verseRows.length} verses.`)
}

const report = await validateBibleSources()
console.log(JSON.stringify({ ...report.summary, warnings: report.warnings, errors: report.errors }, null, 2))
if (report.errors.length) throw new Error('Bible validation failed; import stopped.')
if (!apply) {
  console.log('Dry run complete. No database calls were made.')
} else {
  const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY
  if (!url || !key) throw new Error('Apply requires SUPABASE_URL and a server-only service role key.')
  const { createClient } = await import('@supabase/supabase-js')
  const client = createClient(url, key, { auth: { autoRefreshToken: false, persistSession: false } })
  const amEdition = editionRow('am', 'Amharic Ethiopian Orthodox source', 'am', { sourceDirectory: 'data/bible/am' })
  const webEdition = editionRow('web', 'World English Bible', 'en', report.webData.metadata ?? {})
  for (const edition of [amEdition, webEdition]) {
    const { data: existing, error } = await client.from('bible_editions').select('is_public').eq('id', edition.id).maybeSingle()
    if (error) throw new Error(`Edition lookup failed: ${error.message}`)
    if (existing?.is_public) throw new Error(`Refusing to overwrite published edition ${edition.code}.`)
  }
  await upsert(client, 'bible_editions', [amEdition, webEdition])
  await upsert(client, 'bible_canonical_books', canonicalRows(report))
  for (const source of report.amSources) await importVolume(client, amEdition, source, amChapters(source))
  for (const [sourceBookNumber, volume] of report.webVolumes) {
    await importVolume(client, webEdition, {
      ...volume,
      sourceFile: path.posix.join('data/bible/EN', 'web.json'),
      raw: report.webRaw,
      data: { book_name_en: volume.name },
      mapping: { ...volume.mapping, sourceBookNumber },
    }, webChapters(volume))
  }
  console.log('Bible data staged as nonpublic draft. Publication requires separate review.')
}
