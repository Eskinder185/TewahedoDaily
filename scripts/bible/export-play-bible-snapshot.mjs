import { access, mkdir, readFile, writeFile } from 'node:fs/promises'
import { dirname, resolve } from 'node:path'
import { createClient } from '@supabase/supabase-js'
import { pathToFileURL } from 'node:url'

const DEFAULT_BOOKS = ['genesis', 'exodus', 'matthew', 'john']
const PAGE_SIZE = 500

function publicClient() {
  const url = process.env.VITE_SUPABASE_URL
  const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
  if (!url || !key) throw new Error('VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY (or VITE_SUPABASE_ANON_KEY) are required')
  if (process.env.SUPABASE_SERVICE_ROLE_KEY) throw new Error('Service-role credentials are forbidden')
  return createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })
}

async function page(table, build, pageSize = PAGE_SIZE) {
  const rows = []
  for (let start = 0; ; start += pageSize) {
    const { data, error } = await build(table).range(start, start + pageSize - 1)
    if (error) throw new Error(`${table}: ${error.message}`)
    const batch = data || []
    rows.push(...batch)
    if (batch.length < pageSize) return rows
  }
}

export async function exportPlayBibleSnapshot({ client = publicClient(), outputPath, bookSlugs = DEFAULT_BOOKS, includeAmharic = false } = {}) {
  if (!outputPath) throw new Error('outputPath is required')
  const target = resolve(outputPath)
  try { await access(target); throw new Error(`Refusing to overwrite existing snapshot: ${target}`) } catch (error) { if (error.code !== 'ENOENT') throw error }
  const { data: editions, error: editionError } = await client.from('bible_editions').select('*').eq('is_public', true)
  if (editionError) throw editionError
  const web = (editions || []).find((edition) => edition.code === 'web')
  const am = includeAmharic ? (editions || []).find((edition) => edition.code === 'am') : null
  if (!web) throw new Error('No public web edition available')
  const { data: books, error: bookError } = await client.from('bible_canonical_books').select('*').in('slug', bookSlugs)
  if (bookError) throw bookError
  const verses = []
  for (const edition of [web, ...(am ? [am] : [])]) {
    const { data: sources, error: sourceError } = await client.from('bible_source_books').select('*').eq('edition_id', edition.id).in('canonical_book_id', (books || []).map((book) => book.id))
    if (sourceError) throw sourceError
    for (const source of sources || []) {
      const book = (books || []).find((item) => item.id === source.canonical_book_id)
      const { data: chapters, error: chapterError } = await client.from('bible_chapters').select('*').eq('source_book_id', source.id).order('source_order')
      if (chapterError) throw chapterError
      for (const chapter of chapters || []) {
        const rows = await page('bible_verses', (table) => client.from(table).select('verse_number,text').eq('chapter_id', chapter.id).order('source_order'))
        verses.push(...rows.filter((row) => String(row.text || '').trim()).map((row) => ({ edition: edition.code, bookSlug: book.slug, chapter: chapter.chapter_number, verse: row.verse_number, text: row.text })))
      }
    }
  }
  if (!verses.length) throw new Error('No verses exported; verify public RLS and edition mappings')
  await mkdir(dirname(target), { recursive: true })
  await writeFile(target, JSON.stringify({ verses, candidates: [] }, null, 2) + '\n', 'utf8')
  return { outputPath: target, verseCount: verses.length, editions: [...new Set(verses.map((row) => row.edition))] }
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  const outputPath = process.argv[2] || `artifacts/play-bible-snapshot-${Date.now()}.json`
  const result = await exportPlayBibleSnapshot({ outputPath, includeAmharic: process.argv.includes('--amharic') })
  console.log(JSON.stringify(result))
}
