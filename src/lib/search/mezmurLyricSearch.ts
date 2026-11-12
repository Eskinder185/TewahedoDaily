/**
 * Public Mezmur lyric search helpers.
 *
 * Everything here reads ONLY the `mezmur_public` view: published, non-deleted records, with lyrics already
 * nulled by the database for rights-restricted records. Excerpts therefore can never expose private or
 * restricted lyrics, and nothing is translated or transliterated: an excerpt is a slice of one stored field.
 *
 * - `attachLyricExcerpts` decorates results ranked by GET /api/hymns/search (the API order stays authoritative).
 * - `searchPublicMezmurLyrics` is the bounded, server-filtered fallback used when the API is unavailable.
 *   It never downloads the catalog: at most three filtered requests of MAX_CANDIDATES rows each.
 */
import { supabase } from '../supabase/client.ts'
import { normalizeMezmurLanguage, type MezmurLanguageCode } from '../mezmur/mezmurLanguage.ts'
import { buildExcerpt, hasEthiopic, matchText, orIlike, queryWords, retrievalWords, type Excerpt } from './textMatch.ts'
import { entitySearchVariants } from '../language/index.ts'
import { extractSearchRequest } from './queryRequest.ts'
import { ethiopicLooseRegex, ethiopicSkeletonWord, fuzzyEligible, fuzzyTitleMatches } from './translitSkeleton.ts'

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
  /** Optional: only the real client pages; test doubles may omit it. */
  range?(from: number, to: number): PublicQuery
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

export type MezmurMatchTier = 'title-exact' | 'title-phrase' | 'lyric-phrase' | 'partial' | 'similar-spelling' | null

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
    LYRIC_FIELDS.some((field) => matchText(text(row[field]), query)) ||
    // A mixed-script query can have its words in different stored language fields.
    (hasEthiopic(query) && /[a-z]/i.test(query) && Boolean(matchText(
      [...titles, text(row.search_keywords), ...LYRIC_FIELDS.map((field) => text(row[field]))].join(' '), query,
    )))
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
  const variants = entitySearchVariants(query)
  for (const row of rows) {
    if (text(row.status).toLowerCase() !== 'published' || !text(row.slug)) continue
    let best: { tier: Exclude<MezmurMatchTier, null>; rank: number; query: string } | null = null
    for (const variant of variants) {
      const { tier, rank } = tierForRow(row, variant)
      if (tier && (!best || rank < best.rank)) best = { tier, rank, query: variant }
    }
    if (!best) continue
    hits.push({ row, tier: best.tier, rank: best.rank, excerpt: excerptForRow(row, best.query) })
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
 * An optional third alias request is used for a unique entity query. Candidates are then verified locally.
 */
export async function searchPublicMezmurLyrics(
  query: string,
  options: { limit?: number; language?: MezmurLanguageCode; client?: PublicClient | null } = {},
): Promise<{ items: LyricSearchItem[]; total: number }> {
  // A request wrapper ("find the hymn with the words …") is not part of the search.
  const q = extractSearchRequest(query).text
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
  // A single extra filtered request covers verified saint/feast spellings in either script.
  // Never expand a partial or ambiguous query, and never download the whole catalog.
  const alternativeFilters = entitySearchVariants(q).slice(1)
    .map((variant) => orIlike(SEARCH_COLUMNS, variant))
    .filter(Boolean)
  if (alternativeFilters.length) {
    queries.push(run(client.from('mezmur_public').select(ROW_COLUMNS).or(alternativeFilters.join(',')).limit(MAX_CANDIDATES)))
  }
  const results = await Promise.all(queries)
  const bySlug = new Map<string, PublicMezmurRow>()
  for (const row of results.flat()) if (row.slug && !bySlug.has(row.slug)) bySlug.set(row.slug, row)

  let rows = [...bySlug.values()]
  if (options.language) rows = rows.filter((row) => normalizeMezmurLanguage(row.primary_language) === options.language)
  const ranked = rankPublicRows(rows, q).map(rowToItem)
  // Controlled fuzzy tier: only when nothing matched as a title or phrase, and never ahead of a real match.
  if (!ranked.some((item) => item.tier === 'title-exact' || item.tier === 'title-phrase' || item.tier === 'lyric-phrase') && fuzzyEligible(q)) {
    try {
      const similar = await similarSpellingItems(client, q, options.language, new Set(ranked.map((item) => item.slug)))
      ranked.push(...similar)
    } catch {
      // The fuzzy tier is an enhancement; a failure keeps the strict results.
    }
  }
  return { items: ranked.slice(0, limit), total: ranked.length }
}

type TitleIndexEntry = { slug: string; title: string; title_amharic: string; title_english: string }
let titleIndexCache: { client: PublicClient; at: number; entries: TitleIndexEntry[] } | null = null
const TITLE_INDEX_TTL_MS = 5 * 60 * 1000

/** One lightweight, cached read of published titles, used only for similar-spelling matching. */
async function loadTitleIndex(client: PublicClient): Promise<TitleIndexEntry[]> {
  if (titleIndexCache && titleIndexCache.client === client && Date.now() - titleIndexCache.at < TITLE_INDEX_TTL_MS) return titleIndexCache.entries
  // PostgREST caps a response (commonly 1,000 rows), so page explicitly instead of trusting one large limit.
  const rows: PublicMezmurRow[] = []
  for (let from = 0; from < 20_000; from += 1000) {
    const base = client.from('mezmur_public').select('slug,title,title_amharic,title_english,status')
    const page = await run(base.range ? base.range(from, from + 999) : base.limit(1000))
    rows.push(...page)
    if (page.length < 1000 || !base.range) break
  }
  const entries = rows
    .filter((row) => text(row.status).toLowerCase() === 'published' && text(row.slug))
    .map((row) => ({ slug: text(row.slug), title: text(row.title), title_amharic: text(row.title_amharic), title_english: text(row.title_english) }))
  titleIndexCache = { client, at: Date.now(), entries }
  return entries
}

/** Forget the cached title index (after publish/unpublish) so updated or removed hymns leave the fuzzy tier too. */
export function invalidateTitleIndex(): void {
  titleIndexCache = null
}

const AMHARIC_FIELDS: readonly LyricField[] = ['lyrics_amharic', 'lyrics_geez']
const edit = (a: string, b: string) => {
  const row = Array.from({ length: b.length + 1 }, (_, i) => i)
  for (let i = 1; i <= a.length; i += 1) {
    let diagonal = row[0]
    row[0] = i
    for (let j = 1; j <= b.length; j += 1) {
      const above = row[j]
      row[j] = Math.min(row[j] + 1, row[j - 1] + 1, diagonal + (a[i - 1] === b[j - 1] ? 0 : 1))
      diagonal = above
    }
  }
  return row[b.length]
}

/**
 * Approximate Amharic/Geʽez match inside stored text: words whose consonants equal a query word's consonants
 * (vowel forms and doubled letters ignored). Returns a slice of the STORED text (whitespace flattened one-for-one,
 * so offsets stay aligned), the highlight ranges, and how far the stored words are from what was typed.
 */
export function approximateAmharicMatch(stored: string, query: string): { excerpt: Excerpt; distance: number } | null {
  const typed = [...query.matchAll(/[ሀ-፿]+/gu)].map((m) => m[0])
  const wanted = [...new Map(typed.map((word) => [ethiopicSkeletonWord(word), word])).entries()].filter(([skeleton]) => skeleton.length >= 2)
  if (!wanted.length) return null
  const words = [...stored.matchAll(/[ሀ-፿]+/gu)].map((m) => ({ start: m.index ?? 0, end: (m.index ?? 0) + m[0].length, word: m[0], skeleton: ethiopicSkeletonWord(m[0]) }))
  const found: Array<{ start: number; end: number; distance: number }> = []
  for (const [skeleton, word] of wanted) {
    const hit = words.filter((w) => w.skeleton === skeleton).sort((a, b) => edit(a.word, word) - edit(b.word, word) || a.start - b.start)[0]
    if (!hit) return null // every typed word must be accounted for; no partial guesses
    found.push({ start: hit.start, end: hit.end, distance: edit(hit.word, word) })
  }
  const first = Math.min(...found.map((f) => f.start))
  const last = Math.max(...found.map((f) => f.end))
  const from = Math.max(0, first - 60)
  const to = Math.min(stored.length, Math.max(last + 60, from + 120))
  const slice = stored.slice(from, to).replace(/\s/g, ' ')
  return {
    excerpt: { text: slice, ranges: found.map((f) => [f.start - from, f.end - from] as [number, number]).sort((a, b) => a[0] - b[0]), kind: 'words' },
    distance: found.reduce((sum, f) => sum + f.distance, 0),
  }
}

/** Candidate rows for an approximate Amharic query: one bounded regex request per distinctive word (consonant classes). */
async function approximateAmharicItems(client: PublicClient, query: string, language: MezmurLanguageCode | undefined, seen: Set<string>): Promise<LyricSearchItem[]> {
  const words = [...query.matchAll(/[ሀ-፿]+/gu)].map((m) => m[0]).filter((w) => ethiopicSkeletonWord(w).length >= 2)
  const distinct = [...new Set(words)].sort((a, b) => b.length - a.length).slice(0, 3)
  if (!distinct.length) return []
  let builder = client.from('mezmur_public').select(ROW_COLUMNS)
  for (const word of distinct) {
    const regex = ethiopicLooseRegex(word)
    builder = builder.or(['title_amharic', ...AMHARIC_FIELDS].map((column) => `${column}.imatch."${regex}"`).join(','))
  }
  const rows = await run(builder.limit(150))
  const scored: Array<{ row: PublicMezmurRow; field: LyricField | 'title_amharic'; match: NonNullable<ReturnType<typeof approximateAmharicMatch>> }> = []
  for (const row of rows) {
    if (text(row.status).toLowerCase() !== 'published' || !text(row.slug) || seen.has(text(row.slug))) continue
    if (language && normalizeMezmurLanguage(row.primary_language) !== language) continue
    let best: (typeof scored)[number] | null = null
    for (const field of ['title_amharic', ...AMHARIC_FIELDS] as const) {
      const match = approximateAmharicMatch(text(row[field]), query)
      if (match && (!best || match.distance < best.match.distance)) best = { row, field, match }
    }
    if (best) scored.push(best)
  }
  return scored
    .sort((a, b) => a.match.distance - b.match.distance || text(a.row.title).localeCompare(text(b.row.title)))
    .slice(0, 8)
    .map(({ row, field, match }) => rowToItem({ row, tier: 'similar-spelling', excerpt: field === 'title_amharic' ? null : { ...match.excerpt, field } }))
}

async function similarSpellingItems(client: PublicClient, query: string, language: MezmurLanguageCode | undefined, seen: Set<string>): Promise<LyricSearchItem[]> {
  const index = await loadTitleIndex(client)
  const matches = fuzzyTitleMatches(index, query, (entry) => `${entry.title} ${entry.title_english} ${entry.title_amharic}`, 8).filter((hit) => !seen.has(hit.item.slug))
  if (!matches.length) return hasEthiopic(query) ? approximateAmharicItems(client, query, language, seen) : []
  const rows = await run(client.from('mezmur_public').select(ROW_COLUMNS).in('slug', matches.map((hit) => hit.item.slug)).limit(matches.length))
  const bySlug = new Map(rows.map((row) => [text(row.slug), row]))
  const out: LyricSearchItem[] = []
  for (const hit of matches) {
    const row = bySlug.get(hit.item.slug)
    if (!row || text(row.status).toLowerCase() !== 'published') continue
    if (language && normalizeMezmurLanguage(row.primary_language) !== language) continue
    out.push(rowToItem({ row, tier: 'similar-spelling', excerpt: null }))
  }
  // Amharic/Geʽez queries also look inside lyrics, after the title matches.
  if (hasEthiopic(query) && out.length < 8) {
    const taken = new Set([...seen, ...out.map((item) => item.slug)])
    out.push(...(await approximateAmharicItems(client, query, language, taken)).slice(0, 8 - out.length))
  }
  return out
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
      .map((item) => {
        const row = bySlug.get(item.slug) as PublicMezmurRow
        const excerpt = entitySearchVariants(query).map((variant) => excerptForRow(row, variant)).find(Boolean) ?? null
        return { ...item, excerpt }
      })
  } catch {
    return none // excerpts are an enhancement; the ranked list must still render
  }
}
