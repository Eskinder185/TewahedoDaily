/**
 * Shared hymn search for Mezmur page + Search Buddy.
 *
 * Source of truth: GET /api/hymns/search?q=&limit=
 * Backend ranking is authoritative — no React re-rank.
 */
import type { HymnRow } from '../searchBuddy/apiTypes.ts'
import { fetchHymnsSearchApi, type HymnsApiSearchResult } from './structuredSearchApi.ts'

export type SearchHymnsOptions = {
  limit?: number
  signal?: AbortSignal
}

export type SearchHymnsResult = HymnsApiSearchResult

const DEFAULT_LIMIT = 20

/**
 * Search hymns via the production FastAPI gateway.
 * Typed and voice (after transcribe) must pass the same raw text.
 */
export async function searchHymns(
  text: string,
  options: SearchHymnsOptions = {},
): Promise<SearchHymnsResult> {
  const q = (text || '').replace(/\s+/g, ' ').trim()
  const limit = Math.min(50, Math.max(1, options.limit ?? DEFAULT_LIMIT))
  if (!q) {
    return { query: '', count: 0, results: [] as HymnRow[] }
  }
  return fetchHymnsSearchApi(q, { limit, signal: options.signal })
}
