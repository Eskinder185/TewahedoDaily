/**
 * Pure Search Buddy helpers — ranking, aliases, follow-ups, titles.
 * Kept free of network I/O so Node tests can cover retrieval behavior.
 */
import type { SiteSearchResult, SiteSearchSourceType } from './types'

export type SearchSessionContext = {
  lastQuery: string
  lastTopics: string[]
  lastRoutes: string[]
}

const SEARCH_STOP = new Set([
  'a',
  'an',
  'the',
  'of',
  'and',
  'or',
  'to',
  'for',
  'in',
  'on',
  'st',
  'saint',
  'find',
  'show',
  'open',
  'me',
  'my',
  'ones',
  'one',
  'please',
  'where',
  'can',
  'i',
  'learn',
  'how',
  'such',
  'content',
])

/** Known feast / spelling aliases → keyword expansions. */
export const QUERY_ALIASES: Record<string, string[]> = {
  timket: ['timkat', 'timket', 'epiphany', 'holidays-timket'],
  timkat: ['timkat', 'timket', 'epiphany', 'holidays-timket'],
  epiphany: ['timkat', 'timket', 'epiphany', 'holidays-timket'],
  meskel: ['meskel', 'meskal', 'meskle', 'መስቀል', 'holidays-meskel', 'true cross'],
  meskal: ['meskel', 'meskal', 'meskle', 'መስቀል', 'holidays-meskel'],
  meskle: ['meskel', 'meskal', 'meskle', 'መስቀል', 'holidays-meskel'],
  michael: ['michael', 'mikael', 'st michael', 'saint michael', 'ሚካኤል'],
  mikael: ['michael', 'mikael', 'st michael', 'saint michael', 'ሚካኤል'],
  'st michael': ['michael', 'mikael', 'st michael', 'saint michael', 'ሚካኤል'],
  'saint michael': ['michael', 'mikael', 'st michael', 'saint michael', 'ሚካኤል'],
  uriel: ['uriel', 'st uriel', 'saint uriel'],
  'st uriel': ['uriel', 'st uriel', 'saint uriel'],
  'saint uriel': ['uriel', 'st uriel', 'saint uriel'],
  gabriel: ['gabriel', 'st gabriel', 'saint gabriel', 'ገብርኤል'],
  zemary: ['zemari', 'singer'],
  zemari: ['zemari', 'singer', 'ዘማሪ'],
  synaxarium: ['synaxarium', 'senkesar', 'senkessar', 'ስንክሳር', 'synaxaria'],
  senkesar: ['synaxarium', 'senkesar', 'senkessar', 'ስንክሳር'],
  senkessar: ['synaxarium', 'senkesar', 'senkessar', 'ስንክሳር'],
  fasting: ['fast', 'fasting', 'ጾም', 'tsom', 'repentance-fasting'],
  repentance: ['repentance', 'ንስሐ', 'nesha', 'repentance-fasting'],
  english: ['english', 'english-mezmur'],
  gena: ['gena', 'christmas', 'holidays-gena'],
  christmas: ['gena', 'christmas', 'holidays-gena'],
  tinsae: ['tinsae', 'fasika', 'easter', 'resurrection'],
  fasika: ['tinsae', 'fasika', 'easter'],
}

export function normalizeSearchText(value: string): string {
  return value
    .normalize('NFKC')
    .toLowerCase()
    .replace(/['’ʼ]/g, '')
    .replace(/[^\p{L}\p{N}\s/-]+/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

export function expandSearchAliases(query: string): string {
  const norm = normalizeSearchText(query)
  if (!norm) return query
  const extras: string[] = []
  for (const [key, vals] of Object.entries(QUERY_ALIASES)) {
    if (norm.includes(normalizeSearchText(key))) extras.push(...vals)
  }
  return extras.length ? `${query} ${[...new Set(extras)].join(' ')}` : query
}

export function searchTokens(query: string): string[] {
  const parts = normalizeSearchText(query)
    .split(/[\s,/|·-]+/)
    .map((t) => t.trim())
    .filter((t) => t.length >= 3 && !SEARCH_STOP.has(t))
  if (!parts.length) {
    const fallback = normalizeSearchText(query)
      .split(/[\s,/|·-]+/)
      .map((t) => t.trim())
      .filter((t) => t.length >= 2 && !SEARCH_STOP.has(t))
    return [...new Set(fallback)]
  }
  return [...new Set(parts)]
}

export function extractTopics(query: string): string[] {
  const norm = normalizeSearchText(query)
  const topics: string[] = []
  for (const key of Object.keys(QUERY_ALIASES)) {
    if (norm.includes(normalizeSearchText(key))) topics.push(key)
  }
  const tokens = searchTokens(query).filter(
    (t) => !['hymn', 'hymns', 'mezmur', 'mezmurs', 'prayer', 'prayers', 'page'].includes(t),
  )
  for (const t of tokens) {
    if (!topics.includes(t)) topics.push(t)
  }
  return topics.slice(0, 6)
}

const FOLLOW_UP_ONLY = /^(show\s+)?(me\s+)?(the\s+)?(english|amharic)(\s+ones?|\s+mezmurs?)?$/i
const FOLLOW_UP_MORE = /^(more|see more|show more|(show\s+)?(me\s+)?(the\s+)?(related|similar)(\s+ones?)?)$/i

/** Resolve short in-session refinements into a full search query. */
export function resolveFollowUpQuery(
  queryRaw: string,
  session: SearchSessionContext | null | undefined,
): { query: string; isFollowUp: boolean } {
  const raw = queryRaw.trim()
  if (!raw) return { query: raw, isFollowUp: false }
  if (!session?.lastQuery) return { query: raw, isFollowUp: false }

  const q = normalizeSearchText(raw)

  if (FOLLOW_UP_ONLY.test(q)) {
    const lang = q.includes('amharic') ? 'amharic' : 'english'
    return { query: `${session.lastQuery} ${lang}`, isFollowUp: true }
  }
  if (FOLLOW_UP_MORE.test(q)) {
    return { query: session.lastQuery, isFollowUp: true }
  }

  // Explicit filter phrasing only — do not treat new topic words as refinements.
  // ("repentance" after "Timkat" must stay an independent search.)
  if (/^(only|just)\s+/.test(q) && session.lastTopics.length) {
    return { query: `${session.lastTopics[0]} ${raw}`, isFollowUp: true }
  }

  return { query: raw, isFollowUp: false }
}

export function looksLikeSlug(title: string): boolean {
  const t = title.trim()
  if (!t) return true
  if (/^[a-z0-9]+(?:-[a-z0-9]+)+(?:-\d+)?$/i.test(t)) return true
  if (/^\d+$/.test(t)) return true
  return false
}

export function humanizeSlug(slug: string): string {
  return slug
    .split(/[-_]+/)
    .filter(Boolean)
    .filter((part) => !/^\d+$/.test(part))
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ')
}

export function displayTitle(title: string, fallbackRoute?: string): string {
  const cleaned = title.trim()
  if (cleaned && !looksLikeSlug(cleaned)) return cleaned
  if (fallbackRoute) {
    const leaf = fallbackRoute.split('/').filter(Boolean).pop() || ''
    const human = humanizeSlug(leaf)
    if (human) return human
  }
  if (cleaned) return humanizeSlug(cleaned)
  return 'Untitled'
}

export function isPublicContentRoute(route: string): boolean {
  if (!route.startsWith('/')) return false
  if (route.startsWith('/admin')) return false
  // Reject unresolved template leftovers
  if (route.includes(':') || route.includes('*')) return false
  return true
}

export function specificityRank(
  type: SiteSearchSourceType,
  opts?: { wantsPrayer?: boolean; route?: string },
): number {
  if (opts?.wantsPrayer) {
    if (
      type === 'prayer' ||
      type === 'prayer_section' ||
      type === 'guide' ||
      type === 'liturgy' ||
      (opts.route || '').startsWith('/pray')
    ) {
      return 0
    }
    if (type === 'prayer_collection' || type === 'page') return 1
    if (type === 'mezmur' || type === 'hymn_section' || type === 'hymn_collection') return 3
  }

  switch (type) {
    case 'bible-verse':
    case 'bible-range':
    case 'bible-chapter':
    case 'bible-book':
    case 'hymn_section':
    case 'mezmur':
    case 'prayer':
    case 'prayer_section':
    case 'zemari':
    case 'guide':
    case 'synaxarium':
    case 'synaxarium_commemoration':
      return 0
    case 'bible-text':
    case 'hymn_collection':
    case 'prayer_collection':
    case 'liturgy':
    case 'calendar':
      return 1
    case 'page':
    case 'account':
    case 'other':
    default:
      return 2
  }
}

function kindRank(kind: SiteSearchResult['matchKind']): number {
  return (
    {
      intent: 0,
      exact: 1,
      alias: 2,
      personal: 2,
      prefix: 3,
      keyword: 4,
      fuzzy: 5,
    } as const
  )[kind]
}

/** Lower adjusted score is better. */
export function relevanceAdjustedScore(
  result: SiteSearchResult,
  queryTokens: string[],
): number {
  let score = result.score
  const title = normalizeSearchText(result.title)
  const am = normalizeSearchText(result.titleAmharic || '')
  const route = result.route.toLowerCase()
  const desc = normalizeSearchText(result.description || '')

  const entityTokens = queryTokens.filter(
    (t) => !['hymn', 'hymns', 'mezmur', 'mezmurs', 'chant', 'page', 'info', 'information'].includes(t),
  )
  let titleHits = 0
  let entityTitleHits = 0
  for (const token of queryTokens) {
    if (!token) continue
    const inTitle = title === token || am === token || title.includes(token) || am.includes(token)
    if (title === token || am === token) {
      score -= 0.1
      titleHits += 1
    } else if (title.includes(token) || am.includes(token)) {
      score -= 0.055
      titleHits += 1
    }
    if (inTitle && entityTokens.includes(token)) entityTitleHits += 1
    if (route.includes(token.replace(/\s+/g, '-'))) score -= 0.05
    else if (route.includes(token)) score -= 0.03
    if (desc.includes(token)) score -= 0.008
  }

  // Prefer results whose title/route carry the entity over broad "hymns" sections
  if (entityTokens.length && entityTitleHits === 0) score += 0.16
  else if (titleHits === 0 && queryTokens.length >= 1) score += 0.08

  const prayerTokens = new Set(['prayer', 'prayers', 'tselot', '\u1338\u120e\u1275', '\u1338\u120e\u1276\u127d'])
  const wantsPrayer = queryTokens.some((t) => prayerTokens.has(t))
  const wantsHymn = queryTokens.some((t) =>
    ['hymn', 'hymns', 'mezmur', 'mezmurs', 'chant'].includes(t),
  )
  if (wantsPrayer && !wantsHymn) {
    if (
      result.sourceType === 'prayer' ||
      result.sourceType === 'prayer_section' ||
      result.sourceType === 'prayer_collection' ||
      result.sourceType === 'guide' ||
      result.sourceType === 'liturgy'
    ) {
      score -= 0.14
    } else if (result.route === '/pray') {
      score -= 0.08
    } else if (
      result.sourceType === 'synaxarium' ||
      result.sourceType === 'synaxarium_commemoration'
    ) {
      score += 0.28
    } else if (
      result.sourceType === 'mezmur' ||
      result.sourceType === 'hymn_section' ||
      result.sourceType === 'hymn_collection'
    ) {
      score += 0.22
    }
  }

  if (wantsHymn) {
    if (result.sourceType === 'hymn_section' || result.sourceType === 'mezmur') {
      score -= 0.06
    }
    if (
      result.sourceType === 'synaxarium' ||
      result.sourceType === 'synaxarium_commemoration'
    ) {
      score += 0.2
    }
  }

  // Synaxarium hub is secondary when a specific entity was requested
  if (
    result.route === '/pray/synaxarium' &&
    entityTokens.length > 0 &&
    !entityTokens.every((t) => ['synaxarium', 'senkesar', 'senkessar', 'ስንክሳር'].includes(t))
  ) {
    score += 0.18
  }

  // Prefer Synaxarium titles that carry the entity (not bare "Michael.")
  if (
    (result.sourceType === 'synaxarium' || result.sourceType === 'synaxarium_commemoration') &&
    entityTokens.length
  ) {
    const strong = entityTokens.some(
      (t) => t.length >= 4 && (title.includes(t) || am.includes(t)),
    )
    if (!strong) score += 0.14
  }

  // Generic hubs should not outrank specific content for feast/entity queries
  if (
    (result.route === '/practice' || result.route === '/pray' || result.route === '/') &&
    queryTokens.length >= 1
  ) {
    score += 0.35
  }

  return score
}

export function dedupeResults(results: SiteSearchResult[]): SiteSearchResult[] {
  const seen = new Set<string>()
  const out: SiteSearchResult[] = []
  for (const r of results) {
    if (!isPublicContentRoute(r.route)) continue
    // Bible hits can share a chapter route; keep distinct verse/text rows.
    const key = r.sourceType.startsWith('bible')
      ? `${r.sourceType}:${r.sourceId}`
      : `${r.sourceType}:${r.route}`
    if (seen.has(key)) continue
    seen.add(key)
    out.push({
      ...r,
      title: displayTitle(r.title, r.route),
    })
  }
  return out
}

export function rankSearchResults(
  results: SiteSearchResult[],
  queryRaw: string,
  limit: number,
): SiteSearchResult[] {
  const tokens = searchTokens(expandSearchAliases(queryRaw))
  const prayerTokens = new Set(['prayer', 'prayers', 'tselot', '\u1338\u120e\u1275', '\u1338\u120e\u1276\u127d'])
  const wantsPrayer = tokens.some((t) => prayerTokens.has(t))
  const wantsHymn = tokens.some((t) =>
    ['hymn', 'hymns', 'mezmur', 'mezmurs', 'chant'].includes(t),
  )
  const prayerMode = wantsPrayer && !wantsHymn
  const entityTokens = tokens.filter(
    (t) =>
      !['hymn', 'hymns', 'mezmur', 'mezmurs', 'chant', 'page', 'info', 'information', 'prayer', 'prayers'].includes(
        t,
      ),
  )

  const prepared = dedupeResults(results).map((r) => ({
    ...r,
    _adj: relevanceAdjustedScore(r, tokens),
    _spec: specificityRank(r.sourceType, { wantsPrayer: prayerMode, route: r.route }),
  }))

  prepared.sort((a, b) => {
    const sr = a._spec - b._spec
    if (sr !== 0) return sr
    const kr = kindRank(a.matchKind) - kindRank(b.matchKind)
    if (kr !== 0) return kr
    if (a._adj !== b._adj) return a._adj - b._adj
    return a.title.localeCompare(b.title)
  })

  const hasSpecific = prepared.some((r) => r._spec === 0)
  const filtered = hasSpecific
    ? prepared.filter((r) => {
        if (prayerMode && r.route === '/pray') return true
        if (r.sourceType !== 'page') return true
        // Keep Learn How to Pray / Calendar-ish pages; drop bare hubs
        if (r.route === '/practice' || r.route === '/pray' || r.route === '/') return false
        return true
      })
    : prepared

  // Cap broad collections when sections/mezmurs already answer the query
  const out: SiteSearchResult[] = []
  let collectionCount = 0
  let weakSectionCount = 0
  let synaxCount = 0
  const hasHymnAnswer = filtered.some(
    (r) => r.sourceType === 'hymn_section' || r.sourceType === 'mezmur',
  )
  const hasPrayerAnswer = filtered.some(
    (r) =>
      r.sourceType === 'prayer' ||
      r.sourceType === 'prayer_section' ||
      r.sourceType === 'guide' ||
      r.sourceType === 'liturgy',
  )
  for (const row of filtered) {
    if (row.sourceType === 'hymn_collection' || row.sourceType === 'prayer_collection') {
      collectionCount += 1
      if (hasSpecific && collectionCount > 2) continue
    }
    // Drop unrelated "… Hymns" sections once entity-matched content is present
    if (
      entityTokens.length &&
      row.sourceType === 'hymn_section' &&
      !entityTokens.some(
        (t) =>
          normalizeSearchText(row.title).includes(t) ||
          normalizeSearchText(row.titleAmharic || '').includes(t) ||
          row.route.includes(t),
      )
    ) {
      weakSectionCount += 1
      if (weakSectionCount > 0 && out.some((r) => r.sourceType === 'hymn_section' || r.sourceType === 'mezmur')) {
        continue
      }
    }
    if (
      row.sourceType === 'synaxarium' ||
      row.sourceType === 'synaxarium_commemoration'
    ) {
      synaxCount += 1
      // Keep Synaxarium useful, but don't bury hymn/prayer answers under many day rows
      if ((hasHymnAnswer || hasPrayerAnswer || prayerMode) && synaxCount > 3) continue
      if (hasHymnAnswer && wantsHymn && synaxCount > 2) continue
    }
    const { _adj, _spec, ...rest } = row
    void _adj
    void _spec
    out.push(rest)
    if (out.length >= limit) break
  }
  return out
}

export const INITIAL_RESULT_COUNT = 5
export const EXTENDED_RESULT_COUNT = 12
