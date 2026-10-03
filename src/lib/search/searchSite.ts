/**
 * Unified site search — shared by Search Buddy and future global search.
 * Aggregates routes, mezmurs, prayers, zemaris, hymn browse, and EOTC calendar.
 * Never invents routes.
 */
import {
  loadMezmurSearchCatalog,
  normalizeLatinSearchText,
  searchMezmurCatalog,
} from '../publicContent/mezmurSearch'
import { searchPrayCatalog } from '../prayers/prayerSearch'
import {
  getHymnCollections,
  getHymnSingers,
  searchHymns,
} from '../publicContent/hymnBrowse'
import { getAllCalendarEntries } from '../eotcCalendar/eotcCalendarDataset'
import { matchNavigationIntent, searchRouteCatalog } from './routeSearch'
import {
  displayTitle,
  expandSearchAliases,
  extractTopics,
  EXTENDED_RESULT_COUNT,
  normalizeSearchText,
  rankSearchResults,
  resolveFollowUpQuery,
  searchTokens,
  type SearchSessionContext,
} from './searchCore'
import { loadSynaxariumSearchCatalog, searchSynaxariumCatalog } from './synaxariumSearch'
import type { SiteSearchResponse, SiteSearchResult } from './types'

export type { SearchSessionContext }

type SearchOptions = {
  limit?: number
  includePersonal?: boolean
  userId?: string | null
  session?: SearchSessionContext | null
}

type SettledSource = {
  name: string
  results: SiteSearchResult[]
  failed: boolean
}

type CalendarIndexRow = SiteSearchResult & { blob: string }

let calendarCache: CalendarIndexRow[] | null = null
let calendarCacheAt = 0
const CALENDAR_TTL_MS = 10 * 60 * 1000

function searchStaticCalendar(query: string, limit = 6): SiteSearchResult[] {
  const now = Date.now()
  if (!calendarCache || now - calendarCacheAt > CALENDAR_TTL_MS) {
    calendarCache = getAllCalendarEntries().map((row) => {
      const entry = row.entry
      const title =
        entry.englishTitle?.trim() ||
        entry.transliterationTitle?.trim() ||
        entry.title?.trim() ||
        entry.id
      const titleAmharic = entry.title?.trim() || ''
      const summary = entry.summary?.short?.trim() || entry.category?.primary || 'Church calendar'
      const keywords = (entry.searchKeywords || []).join(' ')
      return {
        sourceType: 'calendar' as const,
        sourceId: `calendar:${entry.id}`,
        title: displayTitle(title, '/calendar'),
        titleAmharic,
        description: summary,
        route: '/calendar',
        imagePath: null,
        score: 0.08,
        matchKind: 'keyword' as const,
        typeLabel: 'Calendar',
        blob: normalizeSearchText(
          `${title} ${titleAmharic} ${entry.id} ${summary} ${keywords} ${(entry.category?.secondary || []).join(' ')}`,
        ),
      }
    })
    calendarCacheAt = now
  }

  const tokens = searchTokens(expandSearchAliases(query)).filter((t) => t.length >= 4)
  if (!tokens.length) return []

  const hits: SiteSearchResult[] = []
  for (const row of calendarCache) {
    const words = new Set(row.blob.split(' ').filter(Boolean))
    const matched = tokens.filter((t) => words.has(t) || row.blob.includes(` ${t} `) || row.blob.startsWith(`${t} `))
    if (!matched.length) continue
    const titleNorm = normalizeSearchText(row.title)
    const titleWords = new Set(titleNorm.split(' ').filter(Boolean))
    const exact = matched.some((t) => titleWords.has(t) || titleNorm === t)
    // Require a strong title hit or two solid keyword hits (blocks garbage queries)
    if (!exact && matched.length < 2) continue
    if (!exact && !matched.some((t) => t.length >= 5)) continue
    hits.push({
      sourceType: row.sourceType,
      sourceId: row.sourceId,
      title: row.title,
      titleAmharic: row.titleAmharic,
      description: row.description,
      route: row.route,
      imagePath: row.imagePath,
      score: exact ? 0.04 : 0.11,
      matchKind: exact ? 'alias' : 'keyword',
      typeLabel: row.typeLabel,
    })
    if (hits.length >= limit) break
  }
  return hits
}

async function settled<T>(
  name: string,
  work: () => Promise<T>,
  map: (value: T) => SiteSearchResult[],
): Promise<SettledSource> {
  try {
    const value = await work()
    return { name, results: map(value), failed: false }
  } catch {
    return { name, results: [], failed: true }
  }
}

export async function searchSite(
  queryRaw: string,
  options: SearchOptions = {},
): Promise<SiteSearchResponse> {
  const limit = options.limit ?? EXTENDED_RESULT_COUNT
  const follow = resolveFollowUpQuery(queryRaw, options.session)
  const query = follow.query.trim()

  if (!query) {
    return {
      query: queryRaw,
      resolvedQuery: '',
      results: [],
      intentMessage: null,
      zeroResults: true,
      partial: false,
      totalCount: 0,
      isFollowUp: false,
    }
  }

  const intent = matchNavigationIntent(query)
  if (intent && /^(go to|open|take me to|navigate to)\b/i.test(query)) {
    return {
      query: queryRaw,
      resolvedQuery: query,
      results: [{ ...intent, title: displayTitle(intent.title, intent.route) }],
      intentMessage: `Opening ${displayTitle(intent.title, intent.route)}.`,
      zeroResults: false,
      partial: false,
      totalCount: 1,
      isFollowUp: follow.isFollowUp,
    }
  }

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
      query: queryRaw,
      resolvedQuery: query,
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
      partial: false,
      totalCount: 1,
      isFollowUp: follow.isFollowUp,
    }
  }

  const expanded = expandSearchAliases(query)
  const sources: SettledSource[] = [
    { name: 'routes', results: searchRouteCatalog(expanded, 8), failed: false },
    { name: 'calendar', results: searchStaticCalendar(expanded, 6), failed: false },
  ]
  if (intent) sources.push({ name: 'intent', results: [intent], failed: false })

  const remote = await Promise.all([
    settled('hymns', () => searchHymns(expanded, 14), (discovery) => {
      const out: SiteSearchResult[] = []
      for (const hit of discovery) {
        if (hit.type === 'section') {
          out.push({
            sourceType: 'hymn_section',
            sourceId: hit.id,
            title: displayTitle(hit.title, hit.href),
            titleAmharic: hit.titleAmharic || '',
            description: hit.meta || 'Hymn section',
            route: hit.href,
            imagePath: null,
            score: 0.02,
            matchKind: 'alias',
            typeLabel: 'Section',
          })
        } else if (hit.type === 'mezmur') {
          out.push({
            sourceType: 'mezmur',
            sourceId: hit.id,
            title: displayTitle(hit.title, hit.href),
            titleAmharic: hit.titleAmharic || '',
            description: hit.meta || 'Mezmur',
            route: hit.href,
            imagePath: null,
            score: 0.03,
            matchKind: 'fuzzy',
            typeLabel: 'Mezmur',
          })
        } else if (hit.type === 'singer') {
          out.push({
            sourceType: 'zemari',
            sourceId: hit.id,
            title: displayTitle(hit.title, hit.href),
            titleAmharic: hit.titleAmharic || '',
            description: hit.meta || 'Zemari',
            route: hit.href,
            imagePath: null,
            score: 0.035,
            matchKind: 'fuzzy',
            typeLabel: 'Zemari',
          })
        } else if (hit.type === 'collection' || hit.type === 'browse_group') {
          out.push({
            sourceType: 'hymn_collection',
            sourceId: hit.id,
            title: displayTitle(hit.title, hit.href),
            titleAmharic: hit.titleAmharic || '',
            description: hit.meta || 'Hymn collection',
            route: hit.href,
            imagePath: null,
            score: 0.09,
            matchKind: 'keyword',
            typeLabel: 'Collection',
          })
        }
      }
      return out
    }),
    settled(
      'mezmurCatalog',
      async () => {
        const docs = await loadMezmurSearchCatalog()
        return searchMezmurCatalog(docs, expanded, { pageSize: 10, page: 1 })
      },
      (mezmur) =>
        mezmur.items.map((item) => ({
          sourceType: 'mezmur' as const,
          sourceId: item.id || item.slug,
          title: displayTitle(item.title, `/practice/mezmur/${item.slug}`),
          titleAmharic: item.title_amharic || '',
          description: [item.singer_name, item.occasion, item.category]
            .filter(Boolean)
            .join(' · '),
          route: `/practice/mezmur/${item.slug}`,
          imagePath: item.thumbnail_url || null,
          score: 0.05,
          matchKind: 'fuzzy' as const,
          typeLabel: 'Mezmur',
        })),
    ),
    settled('prayers', () => searchPrayCatalog(expanded, { limit: 10 }), (pray) =>
      pray.results.map((hit) => {
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
            ? ('prayer_collection' as const)
            : hit.resultType === 'section'
              ? ('prayer_section' as const)
              : hit.resultType === 'guide' || hit.resultType === 'guide_section'
                ? ('guide' as const)
                : hit.resultType.startsWith('liturgy')
                  ? ('liturgy' as const)
                  : ('prayer' as const)
        return {
          sourceType,
          sourceId: hit.id,
          title: displayTitle(hit.title, hit.route),
          titleAmharic: hit.titleAmharic || '',
          description: hit.excerpt || hit.metadata || '',
          route: hit.route,
          imagePath: null,
          score: hit.score,
          matchKind:
            hit.matchKind === 'exact' || hit.matchKind === 'prefix'
              ? hit.matchKind === 'exact'
                ? ('exact' as const)
                : ('prefix' as const)
              : ('fuzzy' as const),
          typeLabel,
        }
      }),
    ),
    settled('zemaris', () => getHymnSingers(), (zemaris) => {
      const q = normalizeLatinSearchText(expanded)
      const tokens = q.split(/\s+/).filter((t) => t.length >= 2)
      const out: SiteSearchResult[] = []
      for (const z of zemaris) {
        const blob = normalizeLatinSearchText(
          `${z.name} ${z.nameAmharic} ${z.slug} ${z.description}`,
        )
        const matched =
          (q.length >= 2 && blob.includes(q)) || tokens.some((t) => blob.includes(t))
        if (!matched) continue
        out.push({
          sourceType: 'zemari',
          sourceId: z.id,
          title: displayTitle(z.name, z.href || `/practice/zemari/${z.slug}`),
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
      return out
    }),
    settled('collections', () => getHymnCollections(), (collections) => {
      const q = normalizeLatinSearchText(expanded)
      const tokens = q.split(' ').filter((t) => t.length >= 3)
      const out: SiteSearchResult[] = []
      for (const c of collections) {
        const blob = normalizeLatinSearchText(
          `${c.title} ${c.titleAmharic} ${c.slug} ${c.description}`,
        )
        if (tokens.length && !tokens.some((t) => blob.includes(t)) && !blob.includes(q)) continue
        if (!tokens.length && !blob.includes(q)) continue
        out.push({
          sourceType: 'hymn_collection',
          sourceId: c.id,
          title: displayTitle(c.title, c.href || `/practice/browse/${c.slug}`),
          titleAmharic: c.titleAmharic || '',
          description: c.description || 'Hymn collection',
          route: c.href || `/practice/browse/${c.slug}`,
          imagePath: c.imagePath,
          score: 0.1,
          matchKind: 'keyword',
          typeLabel: 'Collection',
        })
      }
      return out
    }),
    settled(
      'synaxarium',
      () => loadSynaxariumSearchCatalog(),
      (docs) => searchSynaxariumCatalog(docs, expanded, 10),
    ),
  ])

  sources.push(...remote)

  const merged = sources.flatMap((s) => s.results)
  const ranked = rankSearchResults(merged, query, limit)
  const anyFailed = sources.some((s) => s.failed)
  const partial = anyFailed && ranked.length > 0

  let intentMessage: string | null = null
  if (ranked.length) {
    intentMessage =
      ranked.length === 1
        ? `I found ${ranked[0].title}.`
        : `I found ${ranked.length} places related to your search.`
    if (partial) intentMessage += ' Some catalogs were slow; showing what is ready.'
  }

  return {
    query: queryRaw,
    resolvedQuery: query,
    results: ranked,
    intentMessage,
    zeroResults: ranked.length === 0,
    partial,
    totalCount: ranked.length,
    isFollowUp: follow.isFollowUp,
  }
}

export function buildSessionContext(
  query: string,
  results: SiteSearchResult[],
): SearchSessionContext {
  return {
    lastQuery: query,
    lastTopics: extractTopics(query),
    lastRoutes: results.map((r) => r.route).slice(0, 12),
  }
}

export function buildAssistantReply(response: SiteSearchResponse): string {
  if (response.intentMessage) return response.intentMessage
  if (response.zeroResults) {
    return "I couldn't find that in Tewahedo Daily. Try a feast name, Zemari, prayer, or page like Calendar."
  }
  return 'Here is what I found.'
}

/** Nearby suggestions when zero results — only real catalog routes. */
export function zeroResultSuggestions(): SiteSearchResult[] {
  return [
    ...searchRouteCatalog('calendar', 1),
    ...searchRouteCatalog('hymns practice', 1),
    ...searchRouteCatalog('pray hub', 1),
  ].map((r) => ({ ...r, matchKind: 'keyword' as const }))
}

export { expandSearchAliases, extractTopics, normalizeSearchText, resolveFollowUpQuery }
