import { supabase } from '../supabase/client'
import type {
  BibleBookDetail,
  BibleChapter,
  BibleEdition,
  BibleEditionCode,
  BibleSection,
  BibleVerse,
  CanonicalBook,
  ChapterText,
  ReaderChapter,
  SourceBook,
} from './bibleTypes'

function db() {
  if (!supabase) throw new Error('The Bible library is unavailable right now.')
  return supabase
}

function checked<T>(result: { data: T | null; error: { message: string } | null }): T {
  if (result.error) throw new Error(result.error.message)
  if (result.data === null) throw new Error('The Bible library could not be loaded.')
  return result.data
}

export type BibleCatalog = {
  books: CanonicalBook[]
  sources: SourceBook[]
  editions: BibleEdition[]
}

/** Public client only: all returned rows have already passed Bible RLS. */
export async function loadBibleCatalog(): Promise<BibleCatalog> {
  const client = db()
  const [books, sources, editions] = await Promise.all([
    client.from('bible_canonical_books').select('*').order('sort_order'),
    client.from('bible_source_books').select('*').order('source_order'),
    client.from('bible_editions').select('*'),
  ])
  return {
    books: checked(books),
    sources: checked(sources),
    editions: checked(editions),
  }
}

export async function loadBibleBook(slug: string): Promise<BibleBookDetail | null> {
  const client = db()
  const bookResult = await client.from('bible_canonical_books').select('*').eq('slug', slug).maybeSingle()
  if (bookResult.error) throw new Error(bookResult.error.message)
  const book = bookResult.data
  if (!book) return null
  const [sourcesResult, editionsResult] = await Promise.all([
    client.from('bible_source_books').select('*').eq('canonical_book_id', book.id).order('source_order'),
    client.from('bible_editions').select('*'),
  ])
  const sources = checked(sourcesResult)
  const editions = checked(editionsResult)
  const editionById = new Map(editions.map((edition) => [edition.id, edition.code]))
  const sourceById = new Map(sources.map((source) => [source.id, source]))
  const chapters: BibleBookDetail['chapters'] = { am: [], web: [] }
  if (sources.length) {
    const rows = checked(await client.from('bible_chapters').select('*').in('source_book_id', sources.map((source) => source.id)).order('source_order'))
    const byEdition: Record<BibleEditionCode, Array<{ chapter: BibleChapter; source: SourceBook }>> = { am: [], web: [] }
    for (const chapter of rows) {
      const source = sourceById.get(chapter.source_book_id)
      const code = source && editionById.get(source.edition_id)
      if (source && (code === 'am' || code === 'web')) byEdition[code].push({ chapter, source })
    }
    for (const code of ['am', 'web'] as const) {
      byEdition[code].sort((a, b) => a.source.source_order - b.source.source_order || a.chapter.source_order - b.chapter.source_order)
      chapters[code] = byEdition[code].map(({ chapter, source }, index): ReaderChapter => ({
        ...chapter, source, edition: code, ordinal: index + 1,
      }))
    }
  }
  return { book, sources, chapters }
}

/** A chapter-sized read; repeated verse labels stay distinct and source_order controls display. */
export async function loadChapterText(chapter: ReaderChapter): Promise<ChapterText> {
  const client = db()
  const sectionsPromise = chapter.edition === 'am'
    ? client.from('bible_sections').select('*').eq('chapter_id', chapter.id).order('source_order')
    : Promise.resolve({ data: [] as BibleSection[], error: null })
  const [sectionsResult, versesResult] = await Promise.all([
    sectionsPromise,
    client.from('bible_verses').select('*').eq('chapter_id', chapter.id).order('section_id').order('source_order').order('id').range(0, 999),
  ])
  const sections = checked(sectionsResult)
  const verses: BibleVerse[] = checked(versesResult)
  if (verses.length === 1000) {
    for (let start = 1000; ; start += 1000) {
      const page = checked(await client.from('bible_verses').select('*').eq('chapter_id', chapter.id).order('section_id').order('source_order').order('id').range(start, start + 999))
      verses.push(...page)
      if (page.length < 1000) break
    }
  }
  return { chapter, sections, verses }
}
