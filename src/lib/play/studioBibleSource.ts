import { loadBibleBook, loadBibleCatalog, loadChapterText } from '../bible/bibleQueries'
import type { BibleBookDetail, ChapterText, ReaderChapter } from '../bible/bibleTypes'
import type { BiblePassageResult } from '../bible/passageService'

type Request = { bookSlug: string; chapterNumber: number; verseStart: number; verseEnd?: number; preferredEdition?: 'am' | 'web' }
const eligible = (row: { review_status: string; publication_status: string; is_public: boolean }) =>
  row.review_status === 'reviewed' && row.publication_status === 'published' && row.is_public === true
/** Staff RLS can expose drafts. Check the actual edition/source relationships,
 * rather than treating a staff-visible response as public approval. */
export function createStudioBibleSource(io: {
  loadBook: (slug: string) => Promise<BibleBookDetail | null>
  loadText: (chapter: ReaderChapter) => Promise<ChapterText>
}) {
  async function fetchPassage(request: Request): Promise<BiblePassageResult | null> {
    if (!/^[a-z0-9-]+$/.test(request.bookSlug) || ![request.chapterNumber, request.verseStart].every(n => Number.isSafeInteger(n) && n > 0)
      || (request.verseEnd !== undefined && request.verseEnd !== request.verseStart)) throw new Error('Choose one exact chapter and verse; ranges and ambiguous numbering are blocked in this editor.')
    const detail = await io.loadBook(request.bookSlug)
    if (!detail || detail.book.slug !== request.bookSlug || detail.book.source_status !== 'available') return null
    const code = request.preferredEdition || 'web'
    const edition = detail.editions.find(item => item.code === code)
    if (!edition || !eligible(edition) || !['owned', 'licensed', 'public_domain', 'permission_granted'].includes(edition.rights_status)) return null
    const chapters = (detail.byEdition[code] || []).filter(chapter => chapter.chapter_number === request.chapterNumber
      && chapter.edition === code && chapter.source_book_id === chapter.source.id && chapter.source.canonical_book_id === detail.book.id
      && chapter.source.edition_id === edition.id && eligible(chapter.source))
    if (chapters.length !== 1) throw new Error('No unique reviewed, published source chapter. Choose a supported exact source; no cross-edition alignment was inferred.')
    const chapter = chapters[0]
    const result = await io.loadText(chapter)
    if (result.chapter.id !== chapter.id) throw new Error('Source chapter identity changed.')
    const verses = result.verses.filter(verse => verse.chapter_id === chapter.id && verse.verse_number === request.verseStart)
    if (verses.length !== 1 || !verses[0].id || !verses[0].text.trim()) throw new Error('Verse is absent or numbering is ambiguous. No source text was selected.')
    return { bookSlug: detail.book.slug, bookTitleEn: detail.book.name_en || detail.book.slug, bookTitleAm: detail.book.name_am || '',
      chapterNumber: chapter.chapter_number, chapterOrdinal: chapter.ordinal, editionCode: code, editionName: edition.name, languageCode: edition.language_code,
      requestedRange: { start: request.verseStart, end: request.verseStart }, verses: [{ id: verses[0].id, verseNumber: verses[0].verse_number, text: verses[0].text }],
      isComplete: true, missingVerses: [], readerHref: `/bible/${detail.book.slug}/${chapter.ordinal}?edition=${code}#verse-${request.verseStart}` }
  }
  async function fetchBilingual(request: Omit<Request, 'preferredEdition'>) {
    const [amharic, english] = await Promise.all([fetchPassage({ ...request, preferredEdition: 'am' }), fetchPassage({ ...request, preferredEdition: 'web' })])
    return { amharic, english }
  }
  return { fetchPassage, fetchBilingual }
}
const source = createStudioBibleSource({ loadBook: loadBibleBook, loadText: loadChapterText })
export const fetchStudioPassage = source.fetchPassage
export const fetchStudioPassageBilingual = source.fetchBilingual
export async function listStudioBooks() {
  const catalog = await loadBibleCatalog()
  const editions = new Set(catalog.editions.filter(edition => eligible(edition) && ['am', 'web'].includes(edition.code)
    && ['owned', 'licensed', 'public_domain', 'permission_granted'].includes(edition.rights_status)).map(edition => edition.id))
  return catalog.books.filter(book => book.source_status === 'available' && catalog.sources.some(source =>
    source.canonical_book_id === book.id && editions.has(source.edition_id) && eligible(source)))
    .map(book => ({ slug: book.slug, en: book.name_en || book.slug, am: book.name_am || book.name_en || book.slug }))
}
