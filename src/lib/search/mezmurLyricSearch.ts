/**
 * Public Mezmur lyric search helpers.
 *
 * Everything here reads ONLY the `mezmur_public` view: published, non-deleted records, with lyrics already
 * nulled by the database for rights-restricted records. Excerpts therefore can never expose private or
 * restricted lyrics, and nothing is translated or transliterated: an excerpt is a slice of one stored field.
 *
 * - `attachLyricExcerpts` decorates results ranked by GET /api/hymns/search (the API order stays authoritative).
 * - `searchPublicMezmurLyrics` is the bounded, server-filtered fallback used when the API is unavailable.
 *   It never downloads the catalog: at most two filtered requests of MAX_CANDIDATES rows each.
 */
import { supabase } from '../supabase/client.ts'
import { normalizeMezmurLanguage, type MezmurLanguageCode } from '../mezmur/mezmurLanguage.ts'
import { buildExcerpt, hasEthiopic, matchText, orIlike, queryWords, retrievalWords, type Excerpt } from './textMatch.ts'

export type LyricField = 'lyrics_amharic' | 'lyrics_geez' | 'lyrics_transliteration' | 'lyrics_english' | 'lyrics_oromo'
export type LyricExcerpt = Excerpt & { field: LyricField }

export const LYRIC_FIELDS: readonly LyricField[] = ['lyrics_amharic', 'lyrics_geez', 'lyrics_transliteration', 'lyrics_english', 'lyrics_oromo']
const TITLE_FIELDS = ['title', 'title_amharic', 'title_english'] as const
const SEARCH_COLUMNS = [...TITLE_FIELDS, 'search_keywords', ...LYRIC_FIELDS]
const ROW_COLUMNS = ['mezmur_id', 'slug', 'status', 'primary_language', 'form', 'singer_name', 'youtube_url', 'audio_url', 'image_path', 'legacy_thumbnail_url', ...SEARCH_COLUMNS].join(',')
export const MAX_CANDIDATES = 60

export type PublicMezmurRow = {
  mezmur_id?: string | null
  slug?: string | null
  status?: string | null
  title?: string | null
  title_amharic?: string | null
  title_english?: string | null
  primary_language?: string | null
  form?: string | null
  singer_name?: string | null
  youtube_url?: string | null
  audio_url?: string | null
  image_path?: string | null
  legacy_thumbnail_url?: string | null
  search_keywords?: string | null
} & Partial<Record<LyricField, string | null>>

type QueryResult = { data: unknown; error: { message: string; code?: string } | null }
export type PublicQuery = PromiseLike<QueryResult> & {
  select(columns: string): PublicQuery
  or(filter: string): PublicQuery
  in(column: string, values: string[]): PublicQuery
  limit(count: number): PublicQuery
}
export type PublicClient = { from(table: string): PublicQuery }

const text = (value: unknown) => (typeof value === 'string' ? value.trim() : '')

/** The script of the query decides which lyric fields are tried first. */
function fieldOrder(query: string): readonly LyricField[] {
  return hasEthiopic(query)
    ? ['lyrics_amharic', 'lyrics_geez', 'lyrics_oromo', 'lyrics_transliteration', 'lyrics_english']
    : ['lyrics_transliteration', 'lyrics_english', 'lyrics_oromo', 'lyrics_amharic', 'lyrics_geez']
}

/** Best lyric excerpt for a row: a phrase match beats a words match; ties follow the query's script. */
export function excerptForRow(row: PublicMezmurRow, query: string): LyricExcerpt | null {
  let best: LyricExcerpt | null = null
  for (const field of fieldOrder(query)) {
    const stored = text(row[field])
    if (!stored) continue
    const found = buildExcerpt(stored, query)
    if (!found) continue
    if (!best || (found.kind === 'phrase' && best.kind !== 'phrase')) best = { ...found, field }
  }
  return best
}

export type MezmurMatchTier = 'title-exact' | 'title-phrase' | 'lyric-phrase' | 'partial' | null

/** Ranking class: exact title, then a phrase in a title, then a lyric phrase, then partial/keyword matches. */
export function tierForRow(row: PublicMezmurRow, query: string): { tier: MezmurMatchTier; rank: number } {
  const wanted = queryWords(query).join(' ')
  if (!wanted) return { tier: null, rank: 99 }
  const titles = TITLE_FIELDS.map((field) => text(row[field])).filter(Boolean)
  if (titles.some((title) => queryWords(title).join(' ') === wanted)) return { tier: 'title-exact', rank: 0 }
  if (titles.some((title) => matchText(title, query)?.kind === 'phrase')) return { tier: 'title-phrase', rank: 1 }
  if (LYRIC_FIELDS.some((field) => matchText(text(row[field]), query)?.kind === 'phrase')) return { tier: 'lyric-phrase', rank: 2 }
  const partial =
    titles.some((title) => matchText(title, query)) ||
    Boolean(matchText(text(row.search_keywords), query)) ||
    LYRIC_FIELDS.some((field) => matchText(text(row[field]), query))
  return partial ? { tier: 'partial', rank: 3 } : { tier: null, rank: 99 }
}

export type MezmurLyricHit = {
  row: PublicMezmurRow
  tier: Exclude<MezmurMatchTier, null>
  excerpt: LyricExcerpt | null
}

/** Rank candidate rows. Rows that do not actually contain the query are dropped, never shown as matches. */
export function rankPublicRows(rows: PublicMezmurRow[], query: string): MezmurLyricHit[] {
  const hits: Array<MezmurLyricHit & { rank: number }> = []
  for (const row of rows) {
    if (text(row.status).toLowerCase() !== 'published' || !text(row.slug)) continue
    const { tier, rank } = tierForRow(row, query)
    if (!tier) continue
    hits.push({ row, tier, rank, excerpt: excerptForRow(row, query) })
  }
  return hits.sort((a, b) => a.rank - b.rank || text(a.row.title).localeCompare(text(b.row.title)))
}

export type LyricSearchItem = {
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
  singer_name: string | null
  thumbnail_url: string | null
  excerpt: LyricExcerpt | null
  tier: MezmurMatchTier
}

export function rowToItem(hit: MezmurLyricHit): LyricSearchItem {
  const { row } = hit
  const slug = text(row.slug)
  const title = text(row.title) || text(row.title_english) || text(row.title_amharic) || slug
  const singer = text(row.singer_name) || null
  return {
    id: text(row.mezmur_id) || slug,
    slug,
    title,
    title_amharic: text(row.title_amharic) || null,
    title_english: text(row.title_english) || null,
    primary_language: text(row.primary_language) || null,
    form: text(row.form) || null,
    preview: null,
    youtube_url: text(row.youtube_url) || null,
    audio_url: text(row.audio_url) || null,
    zemari: singer,
    singer_name: singer,
    thumbnail_url: text(row.image_path) || text(row.legacy_thumbnail_url) || null,
    excerpt: hit.excerpt,
    tier: hit.tier,
  }
}

async function run(query: PublicQuery): Promise<PublicMezmurRow[]> {
  const { data, error } = await query
  if (error) throw new Error(error.message)
  return Array.isArray(data) ? (data as PublicMezmurRow[]) : []
}

/**
 * Bounded server-side search of the public projection. Two filtered requests at most:
 *  A) the whole phrase in any title/keyword/lyric column,
 *  B) every distinctive word (up to three) in some column, for punctuation and word-order differences.
 * Candidates are then verified and ranked locally, so a database hit that does not truly match is dropped.
 */
export async function searchPublicMezmurLyrics(
  query: string,
  options: { limit?: number; language?: MezmurLanguageCode; client?: PublicClient | null } = {},
): Promise<{ items: LyricSearchItem[]; total: number }> {
  const q = query.replace(/\s+/g, ' ').trim()
  const client = options.client === undefined ? (supabase as unknown as PublicClient | null) : options.client
  const limit = Math.min(50, Math.max(1, options.limit ?? 20))
  const words = retrievalWords(q)
  if (!client || !words.length || queryWords(q).join('').length < 2) return { items: [], total: 0 }

  const phrase = orIlike(SEARCH_COLUMNS, q.match(/[\p{L}\p{N}'’ʼ]+/gu)?.join(' ') || '')
  const queries: Array<Promise<PublicMezmurRow[]>> = []
  if (phrase) queries.push(run(client.from('mezmur_public').select(ROW_COLUMNS).or(phrase).limit(MAX_CANDIDATES)))
  if (queryWords(q).length > 1 || !phrase) {
    let builder = client.from('mezmur_public').select(ROW_COLUMNS)
    for (const word of words) {
      const filter = orIlike(SEARCH_COLUMNS, word)
      if (filter) builder = builder.or(filter)
    }
    queries.push(run(builder.limit(MAX_CANDIDATES)))
  }
  const results = await Promise.all(queries)
  const bySlug = new Map<string, PublicMezmurRow>()
  for (const row of results.flat()) if (row.slug && !bySlug.has(row.slug)) bySlug.set(row.slug, row)

  let rows = [...bySlug.values()]
  if (options.language) rows = rows.filter((row) => normalizeMezmurLanguage(row.primary_language) === options.language)
  const ranked = rankPublicRows(rows, q).map(rowToItem)
  return { items: ranked.slice(0, limit), total: ranked.length }
}

/**
 * Add the matching public lyric passage to API-ranked results, and cross-check them against the public projection.
 * Order is untouched. A result the public projection does not list as published (the same view the hymn page reads,
 * so opening it would 404) is dropped as defence in depth; a result whose lyrics are unavailable or do not contain
 * the words simply keeps no excerpt. If the projection cannot be read, the API list is returned unchanged.
 */
export async function attachLyricExcerpts<T extends { slug: string }>(
  items: T[],
  query: string,
  client: PublicClient | null = supabase as unknown as PublicClient | null,
): Promise<Array<T & { excerpt: LyricExcerpt | null }>> {
  const none = items.map((item) => ({ ...item, excerpt: null }))
  if (!client || !items.length) return none
  try {
    const rows = await run(client.from('mezmur_public').select(['slug', 'status', ...LYRIC_FIELDS].join(',')).in('slug', items.slice(0, MAX_CANDIDATES).map((item) => item.slug)))
    const bySlug = new Map(rows.filter((row) => text(row.status).toLowerCase() === 'published').map((row) => [text(row.slug), row]))
    return items
      .filter((item) => bySlug.has(item.slug))
      .map((item) => ({ ...item, excerpt: excerptForRow(bySlug.get(item.slug) as PublicMezmurRow, query) }))
  } catch {
    return none // excerpts are an enhancement; the ranked list must still render
  }
}
