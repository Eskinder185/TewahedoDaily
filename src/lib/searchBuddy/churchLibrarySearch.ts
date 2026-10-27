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

/**
 * Supabase PostgreSQL search for Church Library books & passages.
 * Replaces remote AI /api/church-library/search endpoint with deterministic
 * PostgreSQL full-text search (tsvector, websearch_to_tsquery, and phrase matching).
 */
export async function searchChurchLibrary(
  query: string,
  signal?: AbortSignal,
): Promise<ChurchLibrarySearchResponse> {
  const trimmed = (query || '').trim()
  if (!trimmed) {
    return {
      type: 'church_library_search',
      query: '',
      language: null,
      count: 0,
      results: [],
      retrieval: 'keyword',
      semantic_status: 'empty_query',
    }
  }

  if (signal?.aborted) {
    throw new DOMException('The operation was aborted.', 'AbortError')
  }

  if (!supabase) {
    return {
      type: 'church_library_search',
      query: trimmed,
      language: null,
      count: 0,
      results: [],
      retrieval: 'keyword',
      semantic_status: 'supabase_unavailable',
    }
  }

  const client = supabase

  // 1. Try Supabase RPC search_church_library
  try {
    const { data, error } = await client.rpc('search_church_library', {
      search_query: trimmed,
      result_limit: 8,
    })

    if (!error && Array.isArray(data)) {
      const hits: ChurchLibraryHit[] = (data as unknown as Record<string, unknown>[]).map((row) => ({
        passage_id: String(row.passage_id || ''),
        book_id: String(row.book_id || ''),
        title: String(row.title || 'Church Library Book'),
        author: row.author ? String(row.author) : null,
        language: String(row.language || 'en'),
        excerpt: String(row.excerpt || ''),
        page_start: typeof row.page_start === 'number' ? row.page_start : null,
        page_end: typeof row.page_end === 'number' ? row.page_end : null,
        chapter_reference: row.chapter_reference ? String(row.chapter_reference) : null,
        locator_label: row.locator_label ? String(row.locator_label) : null,
        source_url: row.source_url ? String(row.source_url) : null,
        keyword_rank: Number(row.keyword_rank) || 0,
        semantic_rank: Number(row.semantic_rank) || 0,
      }))

      return {
        type: 'church_library_search',
        query: trimmed,
        language: null,
        count: hits.length,
        results: hits,
        retrieval: 'keyword',
        semantic_status: 'supabase_fts',
      }
    }
  } catch (rpcErr) {
    if (signal?.aborted) throw rpcErr
  }

  // 2. Direct fallback query against church_library_passages and books
  try {
    const { data, error } = await client
      .from('church_library_passages')
      .select('id, book_id, content, page_start, page_end, chapter_reference, locator_label, language')
      .ilike('content', `%${trimmed}%`)
      .limit(8)

    if (!error && Array.isArray(data) && data.length > 0) {
      const bookIds = Array.from(new Set(data.map((p) => p.book_id)))
      const { data: books } = await client
        .from('church_library_books')
        .select('id, title, author, source_url')
        .in('id', bookIds)

      const bookMap = new Map((books || []).map((b) => [b.id, b]))
      const hits: ChurchLibraryHit[] = data.map((p) => {
        const b = bookMap.get(p.book_id)
        return {
          passage_id: p.id,
          book_id: p.book_id,
          title: b?.title || 'Church Library Book',
          author: b?.author || null,
          language: p.language || 'en',
          excerpt: p.content.slice(0, 900),
          page_start: p.page_start || null,
          page_end: p.page_end || null,
          chapter_reference: p.chapter_reference || null,
          locator_label: p.locator_label || null,
          source_url: b?.source_url || null,
          keyword_rank: 0.5,
          semantic_rank: 0,
        }
      })

      return {
        type: 'church_library_search',
        query: trimmed,
        language: null,
        count: hits.length,
        results: hits,
        retrieval: 'keyword',
        semantic_status: 'supabase_ilike',
      }
    }
  } catch (fallbackErr) {
    if (signal?.aborted) throw fallbackErr
  }

  return {
    type: 'church_library_search',
    query: trimmed,
    language: null,
    count: 0,
    results: [],
    retrieval: 'keyword',
    semantic_status: 'no_matches',
  }
}
