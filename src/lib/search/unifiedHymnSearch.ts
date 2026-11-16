/**
 * Mezmur / hymn search for the Practice library.
 *
 * Source of truth: GET /api/hymns/search?q=&limit=20 (backend ranking).
 * Typed and voice both pass the same raw query — no /api/chat, no frontend
 * re-rank, no exact-match prefilter before the backend.
 *
 * The API is preferred when configured. If it is unavailable, the local public
 * mezmur_public projection remains a safe read-only fallback so a backend outage
 * cannot make published hymns disappear from search.
 */
import { AiClientError } from '../ai/aiTypes.ts'
import { searchImportMezmurs } from '../publicContent/hymnBrowse.ts'
import { resolveMezmurDetailPath } from '../searchBuddy/mezmurRoute.ts'
import type { HymnRow } from '../searchBuddy/apiTypes.ts'
import { canAttemptStructuredSearchApi } from './structuredSearchApi.ts'
import { searchHymns } from './searchHymns.ts'
import { attachLyricExcerpts, searchPublicMezmurLyrics, type LyricExcerpt, type LyricSearchItem } from './mezmurLyricSearch.ts'
import { normalizeMezmurLanguage, type MezmurLanguageCode } from '../mezmur/mezmurLanguage.ts'
import { entitySearchVariants } from '../language/index.ts'
import { groupConfirmedSearchResults } from '../mezmur/confirmedVersions.ts'
import { supabase } from '../supabase/client.ts'

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
  /** Public lyric passage that matched the query, with highlight ranges into `excerpt.text`. Never invented. */
  excerpt?: LyricExcerpt | null
  confirmedVersionCount?: number
  /** True when this hymn matched only by similar spelling (consonants/vowel forms), not exactly. */
  similar?: boolean
  /** Human-readable field responsible for the match (title, alternate title, Zemari, category, occasion, lyrics). */
  match_field?: string | null
}

export type UnifiedHymnSearchResult = {
  items: UnifiedMezmurSearchItem[]
  total: number
  page: number
  source: 'api' | 'local' | 'local-fallback'
  query: string
}

const DEFAULT_LIMIT = 20
const SEARCH_CACHE_TTL_MS = 30_000
const SEARCH_CACHE_MAX = 40
const rankedSearchCache = new Map<string, { at: number; result: UnifiedHymnSearchResult }>()
let rankedRpcUnavailableUntil = 0

type RankedRpcQuery = PromiseLike<{ data: unknown; error: { message: string; code?: string } | null }> & {
  abortSignal?: (signal: AbortSignal) => RankedRpcQuery
}
type RankedRpcClient = {
  rpc: (name: string, args: Record<string, unknown>) => RankedRpcQuery
}

type RankedRpcRow = {
  mezmur_id?: string | null
  slug?: string | null
  title?: string | null
  transliteration_title?: string | null
  title_amharic?: string | null
  title_english?: string | null
  primary_language?: string | null
  form?: string | null
  singer_name?: string | null
  youtube_url?: string | null
  audio_url?: string | null
  image_path?: string | null
  legacy_thumbnail_url?: string | null
  match_field?: string | null
  match_preview?: string | null
  total_count?: number | string | null
}

function normalizedQuery(value: string): string {
  return value
    .normalize('NFC')
    .toLocaleLowerCase()
    .replace(/[\p{P}\p{S}\s]+/gu, ' ')
    .trim()
}

function cached(key: string): UnifiedHymnSearchResult | null {
  const hit = rankedSearchCache.get(key)
  if (!hit || Date.now() - hit.at >= SEARCH_CACHE_TTL_MS) {
    if (hit) rankedSearchCache.delete(key)
    return null
  }
  return hit.result
}

function remember(key: string, result: UnifiedHymnSearchResult) {
  rankedSearchCache.set(key, { at: Date.now(), result })
  while (rankedSearchCache.size > SEARCH_CACHE_MAX) {
    const first = rankedSearchCache.keys().next().value
    if (typeof first !== 'string') break
    rankedSearchCache.delete(first)
  }
}

async function searchRankedPublicRpc(
  query: string,
  options: { page: number; pageSize: number; language?: MezmurLanguageCode; form?: string; signal?: AbortSignal },
): Promise<UnifiedHymnSearchResult | null> {
  if (!supabase || Date.now() < rankedRpcUnavailableUntil) return null
  const key = `${normalizedQuery(query)}|${options.language || ''}|${options.form || ''}|${options.page}|${options.pageSize}`
  const hit = cached(key)
  if (hit) return hit
  const client = supabase as unknown as RankedRpcClient
  let request = client.rpc('search_public_mezmur_ranked', {
    p_query: query,
    p_page: options.page,
    p_page_size: options.pageSize,
    p_language: options.language || null,
    p_form: options.form || null,
  })
  if (options.signal && request.abortSignal) request = request.abortSignal(options.signal)
  const { data, error } = await request
  if (error) {
    if (error.code === 'PGRST202' || /search_public_mezmur_ranked|schema cache|does not exist/i.test(error.message)) {
      rankedRpcUnavailableUntil = Date.now() + 5 * 60_000
      return null
    }
    throw new Error(error.message)
  }
  const rows = Array.isArray(data) ? data as RankedRpcRow[] : []
  const items = rows.flatMap((row): UnifiedMezmurSearchItem[] => {
    const slug = asText(row.slug)
    if (!slug) return []
    const zemari = asText(row.singer_name)
    return [{
      id: asText(row.mezmur_id) || slug,
      slug,
      title: asText(row.transliteration_title) || asText(row.title) || asText(row.title_english) || asText(row.title_amharic) || slug,
      title_amharic: asText(row.title_amharic),
      title_english: asText(row.title_english),
      primary_language: asText(row.primary_language),
      form: asText(row.form),
      preview: asText(row.match_preview),
      youtube_url: asText(row.youtube_url),
      audio_url: asText(row.audio_url),
      zemari,
      singer_name: zemari,
      thumbnail_url: asText(row.image_path) || asText(row.legacy_thumbnail_url),
      excerpt: null,
      match_field: asText(row.match_field),
    }]
  })
  const total = Number(rows[0]?.total_count || 0)
  const result: UnifiedHymnSearchResult = { items, total, page: options.page, source: 'local', query }
  remember(key, result)
  return result
}

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
    /** Restrict to one Mezmur language; applied to API and fallback results alike. */
    language?: MezmurLanguageCode
    form?: 'mezmur' | 'werb'
  } = {},
): Promise<UnifiedHymnSearchResult> {
  const q = (query || '').normalize('NFC').replace(/[\p{P}\p{S}\s]+/gu, ' ').trim()
  const page = Math.max(1, options.page || 1)
  const pageSize = Math.min(50, Math.max(1, options.pageSize ?? options.limit ?? DEFAULT_LIMIT))
  const limit = Math.min(50, Math.max(pageSize, page * pageSize))

  if (!q) {
    return { items: [], total: 0, page, source: 'local', query: q }
  }

  let rankedFailure: unknown
  try {
    const ranked = await searchRankedPublicRpc(q, { page, pageSize, language: options.language, form: options.form, signal: options.signal })
    if (ranked) return ranked
  } catch (error) {
    if (options.signal?.aborted) throw error
    rankedFailure = error
    if (import.meta.env?.DEV) console.warn('[mezmur search] ranked RPC unavailable, trying existing search paths', error)
  }

  // Production path: shared searchHymns → GET /api/hymns/search (backend ranking).
  if (canAttemptStructuredSearchApi()) {
    try {
      const api = await searchHymns(q, {
        limit,
        signal: options.signal,
      })
      const mapped = api.results
        .map((row) => hymnRowToItem(row))
        .filter((row): row is UnifiedMezmurSearchItem => Boolean(row))
        .filter((row) => !options.language || normalizeMezmurLanguage(row.primary_language) === options.language)
        .filter((row) => !options.form || row.form === options.form)
      if (mapped.length > 0) {
        // Backend order stays authoritative; excerpts come only from the public projection.
        const from = (page - 1) * pageSize
        const pageMapped = mapped.slice(from, from + pageSize)
        const items: UnifiedMezmurSearchItem[] = await attachLyricExcerpts(pageMapped, q)
        // Add bounded public-projection alias hits after the API's ranked results.
        if (entitySearchVariants(q).length > 1) {
          try {
            const aliases = await searchPublicMezmurLyrics(q, { limit, language: options.language })
            const seen = new Set(items.map((item) => item.slug))
            for (const alias of aliases.items) {
              if (seen.has(alias.slug) || items.length >= limit) continue
              seen.add(alias.slug)
              items.push(lyricItemToUnified(alias))
            }
          } catch {
            // The API's successful result still renders when the optional alias lookup fails.
          }
        }
        const grouped = groupConfirmedSearchResults(items)
        return {
          items: grouped,
          total: options.language ? grouped.length : Math.max(grouped.length, (typeof api.count === 'number' ? api.count : items.length) - (items.length - grouped.length)),
          page,
          source: 'api',
          query: api.query || q,
        }
      }
      // An empty answer from the search service (e.g. its index is not
      // loaded) must not hide published Mezmurs that match by title.
      throw new Error('search service returned no results')
    } catch (error) {
      if (error instanceof AiClientError && error.code === 'aborted') throw error
      // Bounded public-projection search (titles, keywords AND lyrics): same ranking classes as the API.
      const local = await localSearch(q, page, pageSize, options.language, options.form)
      if (rankedFailure && local.items.length === 0) throw rankedFailure
      return { ...local, page, source: 'local-fallback', query: q }
    }
  }

  // Dev / offline only — AI URL not configured.
  const local = await localSearch(q, page, pageSize, options.language, options.form)
  if (rankedFailure && local.items.length === 0) throw rankedFailure
  return { ...local, page, source: 'local', query: q }
}

function lyricItemToUnified(item: LyricSearchItem): UnifiedMezmurSearchItem {
  const { tier, ...rest } = item
  return tier === 'similar-spelling' ? { ...rest, similar: true } : rest
}

/**
 * Public projection search. Lyric-aware first; if the lyric columns are not available in this
 * environment, degrade to the title/keyword catalog search so published hymns never disappear.
 */
async function localSearch(q: string, page: number, pageSize: number, language?: MezmurLanguageCode, form?: string): Promise<{ items: UnifiedMezmurSearchItem[]; total: number }> {
  const limit = Math.min(50, page * pageSize)
  try {
    const found = await searchPublicMezmurLyrics(q, { limit, language })
    const all = groupConfirmedSearchResults(found.items.map(lyricItemToUnified)).filter((item) => !form || item.form === form)
    const from = (page - 1) * pageSize
    const items = all.slice(from, from + pageSize)
    return { items, total: Math.max(all.length, found.total - (found.items.length - all.length)) }
  } catch (error) {
    if (import.meta.env?.DEV) console.warn('[mezmur search] lyric search unavailable, using title search', error)
    const local = await searchImportMezmurs(q, { page, pageSize, language, form: form === 'werb' || form === 'mezmur' ? form : undefined })
    return {
      items: local.items.map((item) => ({
        id: item.id, slug: item.slug, title: item.title, title_amharic: item.title_amharic, title_english: item.title_english,
        primary_language: item.language, form: item.form, preview: null, youtube_url: item.youtube_url, audio_url: null,
        zemari: item.singer_name, singer_name: item.singer_name, thumbnail_url: item.thumbnail_url, excerpt: null,
      })),
      total: local.total,
    }
  }
}
