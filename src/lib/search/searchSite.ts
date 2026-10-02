/**
 * Unified site search — shared by Search Buddy and future global search.
 * Aggregates: route catalog, mezmur catalog, pray catalog, zemaris, hymn collections.
 * Never invents routes; all destinations come from known catalogs / Supabase public rows.
 */
import {
  loadMezmurSearchCatalog,
  searchMezmurCatalog,
} from '../publicContent/mezmurSearch'
import { searchPrayCatalog } from '../prayers/prayerSearch'
import { getHymnCollections, getHymnSingers } from '../publicContent/hymnBrowse'
import { normalizeLatinSearchText } from '../publicContent/mezmurSearch'
import { matchNavigationIntent, searchRouteCatalog } from './routeSearch'
import { QUERY_ALIASES } from './routeCatalog'
import type { SiteSearchResponse, SiteSearchResult } from './types'

function expandQuery(query: string): string {
  const norm = normalizeLatinSearchText(query)
  const extras: string[] = []
  for (const [key, vals] of Object.entries(QUERY_ALIASES)) {
    if (norm.includes(normalizeLatinSearchText(key))) {
      extras.push(...vals)
    }
  }
  return extras.length ? `${query} ${extras.join(' ')}` : query
}

function dedupe(results: SiteSearchResult[]): SiteSearchResult[] {
  const seen = new Set<string>()
  const out: SiteSearchResult[] = []
  for (const r of results) {
    const key = `${r.sourceType}:${r.route}`
    if (seen.has(key)) continue
    seen.add(key)
    out.push(r)
  }
  return out
}

export async function searchSite(
  queryRaw: string,
  options: { limit?: number; includePersonal?: boolean; userId?: string | null } = {},
): Promise<SiteSearchResponse> {
  const query = queryRaw.trim()
  const limit = options.limit ?? 12
  if (!query) {
    return { query, results: [], intentMessage: null, zeroResults: true }
  }

  const intent = matchNavigationIntent(query)
  if (intent && /^(go to|open|take me to|navigate to)\b/i.test(query)) {
    return {
      query,
      results: [intent],
      intentMessage: `Opening ${intent.title}.`,
      zeroResults: false,
    }
  }

  // Personal shortcuts (local/DB — not sent to any model)
  const personalQ = normalizeLatinSearchText(query)
  if (
    options.includePersonal &&
    (personalQ.includes('my favorite') ||
      personalQ.includes('my favourites') ||
      personalQ === 'favorites' ||
      personalQ === 'saved' ||
      personalQ.includes('show my favorites'))
  ) {
    return {
      query,
      results: [
        {
          sourceType: 'account',
          sourceId: 'personal:favorites',
          title: 'Your favorites',
          titleAmharic: '',
          description: options.userId
            ? 'Open your synced saved hymns and prayers.'
            : 'Open favorites saved on this device.',
          route: '/saved',
          imagePath: null,
          score: 0.001,
          matchKind: 'personal',
          typeLabel: 'Account',
        },
      ],
      intentMessage: 'Here is your favorites page.',
      zeroResults: false,
    }
  }

  const expanded = expandQuery(query)
  const results: SiteSearchResult[] = []

  // Routes / pages
  results.push(...searchRouteCatalog(expanded, 6))
  if (intent) results.push(intent)

  // Mezmurs
  try {
    const docs = await loadMezmurSearchCatalog()
    const mezmur = searchMezmurCatalog(docs, expanded, { pageSize: 8, page: 1 })
    for (const item of mezmur.items) {
      results.push({
        sourceType: 'mezmur',
        sourceId: item.id || item.slug,
        title: item.title,
        titleAmharic: item.title_amharic || '',
        description: [item.singer_name, item.occasion, item.category].filter(Boolean).join(' · '),
        route: `/practice/mezmur/${item.slug}`,
        imagePath: item.thumbnail_url || null,
        score: 0.08,
        matchKind: 'fuzzy',
        typeLabel: 'Mezmur',
      })
    }
  } catch {
    /* catalog optional offline */
  }

  // Prayers / guides / liturgy
  try {
    const pray = await searchPrayCatalog(expanded, { limit: 8 })
    for (const hit of pray.results) {
      const typeLabel =
        hit.resultType === 'guide' || hit.resultType === 'guide_section'
          ? 'Guide'
          : hit.resultType === 'collection'
            ? 'Prayer Collection'
            : hit.resultType === 'section'
              ? 'Prayer Section'
              : hit.resultType === 'liturgy' ||
                  hit.resultType === 'liturgy_entry' ||
                  hit.resultType === 'liturgy_section'
                ? 'Liturgy'
                : hit.resultType === 'psalm'
                  ? 'Psalm'
                  : 'Prayer'
      const sourceType =
        hit.resultType === 'collection'
          ? 'prayer_collection'
          : hit.resultType === 'section'
            ? 'prayer_section'
            : hit.resultType === 'guide' || hit.resultType === 'guide_section'
              ? 'guide'
              : hit.resultType.startsWith('liturgy')
                ? 'liturgy'
                : 'prayer'
      results.push({
        sourceType,
        sourceId: hit.id,
        title: hit.title,
        titleAmharic: hit.titleAmharic || '',
        description: hit.excerpt || hit.metadata || '',
        route: hit.route,
        imagePath: null,
        score: hit.score,
        matchKind:
          hit.matchKind === 'exact' || hit.matchKind === 'prefix'
            ? hit.matchKind === 'exact'
              ? 'exact'
              : 'prefix'
            : 'fuzzy',
        typeLabel,
      })
    }
  } catch {
    /* optional */
  }

  // Zemaris
  try {
    const zemaris = await getHymnSingers()
    const q = normalizeLatinSearchText(expanded)
    for (const z of zemaris) {
      const blob = normalizeLatinSearchText(
        `${z.name} ${z.nameAmharic} ${z.slug} ${z.description}`,
      )
      const tokens = q.split(/\s+/).filter((t) => t.length >= 2)
      const matched =
        (q.length >= 2 && blob.includes(q)) || tokens.some((t) => blob.includes(t))
      if (!matched) continue
      results.push({
        sourceType: 'zemari',
        sourceId: z.id,
        title: z.name,
        titleAmharic: z.nameAmharic || '',
        description: z.mezmurCount
          ? `${z.mezmurCount} published Mezmur${z.mezmurCount === 1 ? '' : 's'}`
          : z.description || 'Zemari',
        route: z.href || `/practice/zemari/${z.slug}`,
        imagePath: z.imagePath,
        score: 0.06,
        matchKind: 'fuzzy',
        typeLabel: 'Zemari',
      })
    }
  } catch {
    /* optional */
  }

  // Hymn collections
  try {
    const collections = await getHymnCollections()
    const q = normalizeLatinSearchText(expanded)
    for (const c of collections) {
      const blob = normalizeLatinSearchText(
        `${c.title} ${c.titleAmharic} ${c.slug} ${c.description}`,
      )
      const tokens = q.split(' ').filter((t) => t.length >= 3)
      if (tokens.length && !tokens.some((t) => blob.includes(t)) && !blob.includes(q)) continue
      if (!tokens.length && !blob.includes(q)) continue
      results.push({
        sourceType: 'hymn_collection',
        sourceId: c.id,
        title: c.title,
        titleAmharic: c.titleAmharic || '',
        description: c.description || 'Hymn collection',
        route: c.href || `/practice/browse/${c.slug}`,
        imagePath: c.imagePath,
        score: 0.07,
        matchKind: 'keyword',
        typeLabel: 'Collection',
      })
    }
  } catch {
    /* optional */
  }

  const ranked = dedupe(results)
    .sort((a, b) => {
      const kindRank = (k: SiteSearchResult['matchKind']) =>
        ({ intent: 0, exact: 1, alias: 2, personal: 2, prefix: 3, keyword: 4, fuzzy: 5 })[k]
      const kr = kindRank(a.matchKind) - kindRank(b.matchKind)
      if (kr !== 0) return kr
      return a.score - b.score
    })
    .slice(0, limit)

  let intentMessage: string | null = null
  if (ranked.length) {
    intentMessage =
      ranked.length === 1
        ? `I found ${ranked[0].title}.`
        : `I found ${ranked.length} places related to your search.`
  }

  return {
    query,
    results: ranked,
    intentMessage,
    zeroResults: ranked.length === 0,
  }
}

export function buildAssistantReply(response: SiteSearchResponse): string {
  if (response.intentMessage) return response.intentMessage
  if (response.zeroResults) {
    return "I couldn't find that in Tewahedo Daily. Try a feast name, Zemari, prayer, or page like Calendar."
  }
  return 'Here is what I found.'
}
