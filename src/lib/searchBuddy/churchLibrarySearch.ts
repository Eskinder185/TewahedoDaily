import { aiFetch } from '../ai/aiClient'

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

export function searchChurchLibrary(query: string, signal?: AbortSignal) {
  return aiFetch<ChurchLibrarySearchResponse>({
    path: '/api/church-library/search',
    method: 'POST',
    json: { query, limit: 6 },
    timeoutMs: 20_000,
    signal,
    withAuth: false,
  })
}
