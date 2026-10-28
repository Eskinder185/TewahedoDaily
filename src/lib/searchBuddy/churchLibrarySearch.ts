import { getAiApiBaseUrl } from '../ai/aiConfig'
import { supabase } from '../supabase/client'

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
      keyword_rank: Number(row.keyword_rank) || 0,
      semantic_rank: Number(row.semantic_rank) || 0,
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
  }
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
        }
      }
    } catch (error) {
      if (signal?.aborted) throw error
    }
  }

  if (!supabase) return emptyResult(trimmed, 'supabase_unavailable')
  try {
    const { data, error } = await supabase.rpc('search_church_library', {
      search_query: trimmed,
      result_limit: MAX_RESULTS,
      search_language: language,
    })
    if (!error && Array.isArray(data)) {
      const results = normalizeHits(data)
      return {
        type: 'church_library_search',
        query: trimmed,
        language,
        count: results.length,
        results,
        retrieval: 'keyword',
        semantic_status: 'supabase_fts',
      }
    }
  } catch (error) {
    if (signal?.aborted) throw error
  }
  return emptyResult(trimmed, 'no_matches')
}
