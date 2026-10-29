import { getAiApiBaseUrl } from '../ai/aiConfig'
import { supabase } from '../supabase/client'
import { sectionHref } from '../churchLibrary/libraryService'

export type ChurchLibraryHit = {
  passage_id: string
  book_id: string
  title: string
  author: string | null
  language: string
  excerpt: string
  page_start: number | null
  page_end: number | null
  chapter_reference: string | null
  locator_label: string | null
  source_url: string | null
  /** Stable in-app reader link (structured books): /library/read/<book>/<section>#<paragraph> */
  reader_href: string | null
  keyword_rank: number
  semantic_rank: number
}

export type ChurchLibrarySearchResponse = {
  type: 'church_library_search'
  query: string
  language: string | null
  count: number
  results: ChurchLibraryHit[]
  retrieval: 'keyword' | 'hybrid'
  semantic_status: string
  availability: 'ok' | 'no_relevant_passage' | 'no_indexed_content' | 'no_public_books'
  answer: string | null
  answer_status: 'source_excerpt' | 'insufficient_evidence'
}

const MAX_RESULTS = 8

function languageForQuery(query: string): string | null {
  return /[\u1200-\u137f]/u.test(query) ? 'am' : null
}

function toNullableNumber(value: unknown): number | null {
  return typeof value === 'number' && Number.isFinite(value) ? value : null
}

function normalizeHits(value: unknown): ChurchLibraryHit[] {
  if (!Array.isArray(value)) return []
  return value.flatMap((candidate): ChurchLibraryHit[] => {
    if (!candidate || typeof candidate !== 'object' || Array.isArray(candidate)) return []
    const row = candidate as Record<string, unknown>
    const passageId = typeof row.passage_id === 'string' ? row.passage_id : ''
    const bookId = typeof row.book_id === 'string' ? row.book_id : ''
    const excerpt = typeof row.excerpt === 'string' ? row.excerpt : ''
    if (!passageId || !bookId || !excerpt) return []
    return [{
      passage_id: passageId,
      book_id: bookId,
      title: typeof row.title === 'string' && row.title.trim() ? row.title : 'Church Library Book',
      author: typeof row.author === 'string' ? row.author : null,
      language: typeof row.language === 'string' ? row.language : 'other',
      excerpt,
      page_start: toNullableNumber(row.page_start),
      page_end: toNullableNumber(row.page_end),
      chapter_reference: typeof row.chapter_reference === 'string' ? row.chapter_reference : null,
      locator_label: typeof row.locator_label === 'string' ? row.locator_label : null,
      source_url: typeof row.source_url === 'string' ? row.source_url : null,
      reader_href: typeof row.reader_href === 'string' && row.reader_href.startsWith('/library/') ? row.reader_href : null,
      keyword_rank: Number(row.keyword_rank) || 0,
      semantic_rank: Number(row.semantic_rank) || 0,
    }]
  })
}

/**
 * Structured (chapter/section) books: Amharic-folded search with section-level
 * citations. Missing on databases without the structured-collections migration,
 * in which case it quietly returns nothing and the legacy search is used alone.
 */
/** Adds ?q= so the reader highlights the matched words (folded, letter-variant aware). */
function withQuery(href: string, query: string) {
  const [path, hash] = href.split('#')
  return `${path}?q=${encodeURIComponent(query)}${hash ? `#${hash}` : ''}`
}

async function searchStructuredSections(query: string, language: string | null): Promise<ChurchLibraryHit[]> {
  if (!supabase) return []
  const { data, error } = await supabase.rpc('search_church_library_sections' as never, {
    search_query: query,
    result_limit: MAX_RESULTS,
    search_language: language,
  } as never)
  if (error || !Array.isArray(data)) return []
  return (data as Record<string, unknown>[]).flatMap((row): ChurchLibraryHit[] => {
    const passageId = typeof row.passage_id === 'string' ? row.passage_id : ''
    const bookId = typeof row.book_id === 'string' ? row.book_id : ''
    const excerpt = typeof row.excerpt === 'string' ? row.excerpt : ''
    const slug = typeof row.book_slug === 'string' ? row.book_slug : ''
    if (!passageId || !bookId || !excerpt) return []
    const sectionTitle = typeof row.section_title === 'string' ? row.section_title : null
    const chapterTitle = typeof row.chapter_title === 'string' ? row.chapter_title : null
    return [{
      passage_id: passageId,
      book_id: bookId,
      title: typeof row.book_title === 'string' && row.book_title.trim() ? row.book_title : 'Church Library Book',
      author: null,
      language: typeof row.book_language === 'string' ? row.book_language : 'other',
      excerpt,
      page_start: toNullableNumber(row.page_start),
      page_end: toNullableNumber(row.page_end),
      chapter_reference: chapterTitle,
      locator_label: sectionTitle && sectionTitle !== chapterTitle ? sectionTitle : null,
      source_url: null,
      reader_href: slug
        ? withQuery(sectionHref(slug, typeof row.section_key === 'string' ? row.section_key : null, typeof row.passage_key === 'string' ? row.passage_key : null), query)
        : null,
      keyword_rank: Number(row.keyword_rank) || 0,
      semantic_rank: 0,
    }]
  })
}

function emptyResult(query: string, semanticStatus: string): ChurchLibrarySearchResponse {
  return {
    type: 'church_library_search',
    query,
    language: languageForQuery(query),
    count: 0,
    results: [],
    retrieval: 'keyword',
    semantic_status: semanticStatus,
    availability: 'no_relevant_passage',
    answer: null,
    answer_status: 'insufficient_evidence',
  }
}

export class ChurchLibrarySearchError extends Error {
  readonly code: 'timeout' | 'permission' | 'embedding' | 'not_installed' | 'database' | 'network'

  constructor(
    message: string,
    code: 'timeout' | 'permission' | 'embedding' | 'not_installed' | 'database' | 'network',
  ) {
    super(message)
    this.name = 'ChurchLibrarySearchError'
    this.code = code
  }
}

function statusFromPayload(value: unknown): ChurchLibrarySearchResponse['availability'] {
  return value === 'no_indexed_content' || value === 'no_public_books' || value === 'no_relevant_passage'
    ? value
    : 'ok'
}

/**
 * Searches only excerpts explicitly approved for public retrieval. The optional
 * server gateway performs multilingual semantic ranking without giving the
 * browser document originals, private storage paths, or embedding credentials.
 * The retrieval-gated PostgreSQL RPC is the safe keyword-only fallback.
 */
export async function searchChurchLibrary(
  query: string,
  signal?: AbortSignal,
): Promise<ChurchLibrarySearchResponse> {
  const trimmed = (query || '').trim()
  if (!trimmed) return emptyResult('', 'empty_query')
  if (signal?.aborted) throw new DOMException('The operation was aborted.', 'AbortError')

  const language = languageForQuery(trimmed)
  const base = getAiApiBaseUrl()
  if (base) {
    try {
      const response = await fetch(`${base}/api/church-library/search`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: trimmed, language, limit: MAX_RESULTS }),
        signal,
        cache: 'no-store',
      })
      if (response.ok) {
        const payload = await response.json() as Record<string, unknown>
        const results = normalizeHits(payload.results)
        return {
          type: 'church_library_search',
          query: trimmed,
          language: typeof payload.language === 'string' ? payload.language : language,
          count: results.length,
          results,
          retrieval: payload.retrieval === 'hybrid' ? 'hybrid' : 'keyword',
          semantic_status: typeof payload.semantic_status === 'string' ? payload.semantic_status : 'server_keyword',
          availability: statusFromPayload(payload.availability),
          answer: typeof payload.answer === 'string' && payload.answer.trim() ? payload.answer : null,
          answer_status: payload.answer_status === 'source_excerpt' ? 'source_excerpt' : 'insufficient_evidence',
        }
      }
      if (response.status === 401 || response.status === 403) {
        throw new ChurchLibrarySearchError('Church Library search permission was denied.', 'permission')
      }
      // A deployed site can intentionally omit the optional FastAPI route. In
      // that case (and for transient API failures), continue to the database
      // RPC below instead of hiding a working Supabase search behind a 404.
    } catch (error) {
      if (signal?.aborted) throw error
      if (error instanceof ChurchLibrarySearchError && error.code === 'permission') throw error
    }
  }

  if (!supabase) return emptyResult(trimmed, 'supabase_unavailable')
  try {
    const [structuredHits, { data, error }] = await Promise.all([
      searchStructuredSections(trimmed, language).catch(() => [] as ChurchLibraryHit[]),
      supabase.rpc('search_church_library', {
        search_query: trimmed,
        result_limit: MAX_RESULTS,
        search_language: language,
      }),
    ])
    if (error && structuredHits.length) {
      return {
        type: 'church_library_search',
        query: trimmed,
        language,
        count: structuredHits.length,
        results: structuredHits,
        retrieval: 'keyword',
        semantic_status: 'supabase_fts',
        availability: 'ok',
        answer: structuredHits[0].excerpt,
        answer_status: 'source_excerpt',
      }
    }
    if (error) {
      if (error.code === '42501') throw new ChurchLibrarySearchError('Church Library search permission was denied.', 'permission')
      if (error.code === 'PGRST202' || error.code === '42883') {
        throw new ChurchLibrarySearchError('Church Library search function is missing from the database schema cache.', 'not_installed')
      }
      throw new ChurchLibrarySearchError(error.message || 'Church Library database search failed.', 'database')
    }
    if (Array.isArray(data)) {
      // Structured hits carry a stable section link; legacy rows for the same
      // passage are dropped so each excerpt is cited once.
      const seen = new Set(structuredHits.map((h) => h.passage_id))
      const results = [...structuredHits, ...normalizeHits(data).filter((h) => !seen.has(h.passage_id))].slice(0, MAX_RESULTS)
      let availability: ChurchLibrarySearchResponse['availability'] = results.length ? 'ok' : 'no_relevant_passage'
      if (!results.length) {
        const statusResult = await supabase.rpc('church_library_public_search_status')
        const row = Array.isArray(statusResult.data) ? statusResult.data[0] as Record<string, unknown> | undefined : undefined
        if (!statusResult.error && row) {
          if (Number(row.eligible_books) === 0) availability = 'no_public_books'
          else if (Number(row.indexed_passages) === 0) availability = 'no_indexed_content'
        }
      }
      return {
        type: 'church_library_search',
        query: trimmed,
        language,
        count: results.length,
        results,
        retrieval: 'keyword',
        semantic_status: 'supabase_fts',
        availability,
        answer: results[0]?.excerpt || null,
        answer_status: results.length ? 'source_excerpt' : 'insufficient_evidence',
      }
    }
  } catch (error) {
    if (signal?.aborted) throw error
    if (error instanceof ChurchLibrarySearchError) throw error
    throw new ChurchLibrarySearchError(
      error instanceof Error && error.message ? error.message : 'Church Library database search failed.',
      'network',
    )
  }
  return emptyResult(trimmed, 'no_matches')
}
