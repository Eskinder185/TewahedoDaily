// Read-only export from Supabase REST API using publishable key in .env.local.
// Zero database writes, zero DDL, zero service-role keys.
import { mkdir, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'
import { createClient } from '@supabase/supabase-js'
import type { BibleChapter, BibleSection, BibleVerse, CanonicalBook, SourceBook } from '../../src/lib/bible/bibleTypes'

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY

if (!url || !key) {
  throw new Error('VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY are required in .env.local.')
}
if (process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Service-role key must not be used for client exports.')
}

const client = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })

type RangeQuery<T> = { range: (from: number, to: number) => Promise<{ data: T[] | null; error: { message: string } | null }> }
type TableQuery<T> = { select: (cols: string) => RangeQuery<T> & Record<string, unknown> } & Record<string, unknown>

async function paged<T>(table: string, queryBuilder: (q: TableQuery<T>) => RangeQuery<T>, pageSize = 1000): Promise<T[]> {
  const all: T[] = []
  for (let start = 0; ; start += pageSize) {
    const q = queryBuilder(client.from(table)).range(start, start + pageSize - 1)
    const { data, error } = await q
    if (error) throw new Error(`${table} query failed: ${error.message}`)
    const rows = (data || []) as T[]
    all.push(...rows)
    if (rows.length < pageSize) break
  }
  return all
}

export async function runExport(outDir = 'exports', chaptersPerBook = 25) {
  await mkdir(resolve(outDir), { recursive: true })

  // 1. Load Edition
  const { data: edition, error: editionError } = await client
    .from('bible_editions')
    .select('*')
    .eq('code', 'am')
    .eq('review_status', 'reviewed')
    .eq('publication_status', 'published')
    .eq('is_public', true)
    .single()
  if (editionError || !edition) {
    throw new Error(`Amharic edition not found or not published: ${editionError?.message}`)
  }

  // 2. Load Canonical Books with available source status and Amharic name
  const books = await paged<CanonicalBook>('bible_canonical_books', (q) =>
    q.select('*').eq('source_status', 'available').not('name_am', 'is', null).order('sort_order')
  )

  // 3. Load Source Books
  const sourceBooks = await paged<SourceBook>('bible_source_books', (q) =>
    q.select('*')
      .eq('edition_id', edition.id)
      .eq('review_status', 'reviewed')
      .eq('publication_status', 'published')
      .eq('is_public', true)
      .order('source_order')
  )

  const sourceBookMap = new Map<string, SourceBook[]>()
  for (const sb of sourceBooks) {
    sourceBookMap.set(sb.canonical_book_id, [...(sourceBookMap.get(sb.canonical_book_id) || []), sb])
  }

  // Filter books to those having reviewed source books
  const eligibleBooks = books.filter((b) => sourceBookMap.has(b.id))
  console.log(`Eligible Amharic books in live Supabase: ${eligibleBooks.length}`)

  // 4. Sample chapters across eligible books (up to chaptersPerBook per book)
  const candidateRows: Array<{ candidate: Record<string, unknown> }> = []

  for (const book of eligibleBooks) {
    const sbs = sourceBookMap.get(book.id) || []
    for (const sb of sbs) {
      const chapters = await paged<BibleChapter>('bible_chapters', (q) =>
        q.select('*').eq('source_book_id', sb.id).gte('chapter_number', 1).order('source_order')
      )
      if (!chapters.length) continue

      // Sample up to chaptersPerBook evenly distributed
      const step = Math.max(1, Math.floor(chapters.length / chaptersPerBook))
      const sampledChapters: BibleChapter[] = []
      for (let i = 0; i < chapters.length && sampledChapters.length < chaptersPerBook; i += step) {
        sampledChapters.push(chapters[i])
      }

      // Batch query sections and verses for sampled chapters (in chunks of 50)
      for (let cIdx = 0; cIdx < sampledChapters.length; cIdx += 50) {
        const chunk = sampledChapters.slice(cIdx, cIdx + 50)
        const chapterIds = chunk.map((c) => c.id)

        const { data: rawSections } = await client
          .from('bible_sections')
          .select('id, chapter_id, source_order')
          .in('chapter_id', chapterIds)
          .order('source_order')

        const sectionsByChapter = new Map<string, Array<{ id: string; source_order: number }>>()
        for (const sec of rawSections || []) {
          sectionsByChapter.set(sec.chapter_id, [...(sectionsByChapter.get(sec.chapter_id) || []), sec])
        }

        const { data: rawVerses } = await client
          .from('bible_verses')
          .select('id, chapter_id, section_id, verse_number, source_order, text, updated_at')
          .in('chapter_id', chapterIds)
          .lte('verse_number', 8)
          .order('source_order')

        const versesByChapter = new Map<string, BibleVerse[]>()
        for (const v of rawVerses || []) {
          versesByChapter.set(v.chapter_id, [...(versesByChapter.get(v.chapter_id) || []), v as BibleVerse])
        }

        for (const ch of chunk) {
          const chSections = sectionsByChapter.get(ch.id) || []
          const firstSection = chSections.length > 0
            ? chSections.reduce((min, cur) => cur.source_order < min.source_order ? cur : min)
            : null
          const sectionOrder = firstSection ? firstSection.source_order : 0
          const sectionId = firstSection ? firstSection.id : null

          let chVerses = versesByChapter.get(ch.id) || []
          if (sectionId) {
            const inSec = chVerses.filter((v) => v.section_id === sectionId)
            if (inSec.length > 0) chVerses = inSec
          }
          if (chVerses.length === 0) continue

          const verses = chVerses.slice(0, 8).map((v) => ({
            id: v.id,
            chapter_id: v.chapter_id,
            section_id: v.section_id,
            verse_number: v.verse_number,
            source_order: v.source_order,
            text: v.text,
            updated_at: v.updated_at,
          }))

          candidateRows.push({
            candidate: {
              edition,
              book,
              sourceBook: sb,
              chapter: {
                id: ch.id,
                source_book_id: ch.source_book_id,
                chapter_number: ch.chapter_number,
                source_order: ch.source_order,
                updated_at: ch.updated_at,
              },
              sectionOrder,
              verses,
            },
          })
        }
      }
    }
  }

  const candidatesPath = resolve(outDir, 'play-source-candidates.json')
  await writeFile(candidatesPath, `${JSON.stringify(candidateRows, null, 2)}\n`, 'utf8')
  console.log(`Saved ${candidateRows.length} candidates to ${candidatesPath}`)

  // 5. Load Question Inventory from play_content_items
  const existingItems = await paged<Record<string, unknown>>('play_content_items', (q) =>
    q.select('stable_id, question_id, status, game_type, category, payload, source_references').order('stable_id')
  )

  const inventoryRows = existingItems.map((item) => ({
    question: {
      stable_id: item.stable_id,
      question_id: item.question_id,
      status: item.status,
      game_type: item.game_type,
      category: item.category,
      source: (item.payload as Record<string, unknown>)?.source ?? null,
      prompt: (item.payload as Record<string, unknown>)?.prompt ?? null,
      source_references: item.source_references ?? [],
    },
  }))

  const inventoryPath = resolve(outDir, 'play-question-inventory.json')
  await writeFile(inventoryPath, `${JSON.stringify(inventoryRows, null, 2)}\n`, 'utf8')
  console.log(`Saved ${inventoryRows.length} questions to ${inventoryPath}`)

  return { candidatesCount: candidateRows.length, inventoryCount: inventoryRows.length }
}

if (process.argv[1]?.endsWith('export-from-supabase.ts')) {
  const cArgIdx = process.argv.indexOf('--chapters-per-book')
  const chaptersPerBook = cArgIdx !== -1 && process.argv[cArgIdx + 1] ? Number(process.argv[cArgIdx + 1]) : 25
  const outDirArgIdx = process.argv.indexOf('--out-dir')
  const outDir = outDirArgIdx !== -1 && process.argv[outDirArgIdx + 1] ? process.argv[outDirArgIdx + 1] : 'exports'
  runExport(outDir, chaptersPerBook).catch((err) => {
    console.error(err)
    process.exit(1)
  })
}

