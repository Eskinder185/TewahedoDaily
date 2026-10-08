/**
 * Mezmur / hymn search for the Practice library.
 *
 * Source of truth: GET /api/hymns/search?q=&limit=20 (backend ranking).
 * Typed and voice both pass the same raw query — no /api/chat, no frontend
 * re-rank, no exact-match prefilter before the backend.
 *
 * Local Supabase is used only when VITE_TEWAHEDO_AI_API_URL is not configured.
 * When the API is configured, empty/error yields empty results (not a local re-rank).
 */
import { AiClientError } from '../ai/aiTypes.ts'
import { searchImportMezmurs } from '../publicContent/hymnBrowse.ts'
import { resolveMezmurDetailPath } from '../searchBuddy/mezmurRoute.ts'
import type { HymnRow } from '../searchBuddy/apiTypes.ts'
import { canAttemptStructuredSearchApi } from './structuredSearchApi.ts'
import { searchHymns } from './searchHymns.ts'

export type UnifiedMezmurSearchItem = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  title_english: string | null
  primary_language: string | null
  form: string | null
  preview: string | null
  youtube_url: string | null
  audio_url: string | null
  zemari: string | null
  /** @deprecated prefer zemari — kept for card art helpers */
  singer_name: string | null
  thumbnail_url: string | null
}

export type UnifiedHymnSearchResult = {
  items: UnifiedMezmurSearchItem[]
  total: number
  page: number
  source: 'api' | 'local' | 'local-fallback'
  query: string
}

const DEFAULT_LIMIT = 20

function asText(value: unknown): string | null {
  if (typeof value !== 'string') return null
  const t = value.trim()
  return t || null
}

/** Map a backend HymnRow to UI item — preserve API field names / order. */
export function hymnRowToItem(hymn: HymnRow): UnifiedMezmurSearchItem | null {
  const path = resolveMezmurDetailPath(hymn)
  if (!path) return null
  const slug = path.split('/').pop() || asText(hymn.slug) || ''
  if (!slug) return null

  const titleAmharic = asText(hymn.title_amharic)
  const titleEnglish = asText(hymn.title_english)
  const title =
    asText(hymn.title) ||
    titleEnglish ||
    asText(hymn.title_transliteration) ||
    titleAmharic
  if (!title && !titleAmharic) return null

  const zemari = asText(hymn.zemari) || asText(hymn.singer_name)
  const primaryLanguage =
    asText((hymn as { primary_language?: unknown }).primary_language) || null

  return {
    id: asText(hymn.id) || slug,
    slug,
    title: title || titleAmharic || slug,
    title_amharic: titleAmharic,
    title_english: titleEnglish,
    primary_language: primaryLanguage,
    form: asText(hymn.form),
    preview: asText(hymn.preview),
    youtube_url: asText(hymn.youtube_url),
    audio_url: asText(hymn.audio_url),
    zemari,
    singer_name: zemari,
    thumbnail_url: null,
  }
}

/**
 * Search hymns. Prefer production GET /api/hymns/search?q=&limit=20.
 * Backend order is authoritative.
 */
export async function searchMezmursUnified(
  query: string,
  options: {
    page?: number
    pageSize?: number
    limit?: number
    signal?: AbortSignal
  } = {},
): Promise<UnifiedHymnSearchResult> {
  const q = (query || '').replace(/\s+/g, ' ').trim()
  const page = Math.max(1, options.page || 1)
  const limit = Math.min(50, Math.max(1, options.limit ?? options.pageSize ?? DEFAULT_LIMIT))

  if (!q) {
    return { items: [], total: 0, page, source: 'local', query: q }
  }

  // Production path: shared searchHymns → GET /api/hymns/search (backend ranking).
  if (canAttemptStructuredSearchApi()) {
    try {
      const api = await searchHymns(q, {
        limit,
        signal: options.signal,
      })
      const items = api.results
        .map((row) => hymnRowToItem(row))
        .filter((row): row is UnifiedMezmurSearchItem => Boolean(row))
      return {
        items,
        total: typeof api.count === 'number' ? api.count : items.length,
        page: 1,
        source: 'api',
        query: api.query || q,
      }
    } catch (error) {
      if (error instanceof AiClientError && error.code === 'aborted') throw error
      // Do not substitute local exact-match ranking when the API is the source of truth.
      return { items: [], total: 0, page: 1, source: 'api', query: q }
    }
  }

  // Dev / offline only — AI URL not configured.
  const local = await searchImportMezmurs(q, { page: 1, pageSize: limit })
  const items: UnifiedMezmurSearchItem[] = local.items.map((item) => ({
    id: item.id,
    slug: item.slug,
    title: item.title,
    title_amharic: item.title_amharic,
    title_english: item.title_english,
    primary_language: item.language,
    form: item.form,
    preview: null,
    youtube_url: item.youtube_url,
    audio_url: null,
    zemari: item.singer_name,
    singer_name: item.singer_name,
    thumbnail_url: item.thumbnail_url,
  }))

  return {
    items,
    total: local.total,
    page: 1,
    source: 'local',
    query: q,
  }
}
