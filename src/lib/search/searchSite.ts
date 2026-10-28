/**
 * Unified site search — shared by Search Buddy and future global search.
 * Aggregates routes, mezmurs, prayers, zemaris, hymn browse, and EOTC calendar.
 * Never invents routes.
 */
import { findNextCivilDayForEntry } from '../eotcCalendar/eotcFindEntryOccurrence'
import { toIsoLocalDate } from '../churchCalendar/pascha'
import { matchCalendarEntities } from './entityAliases'
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
import {
  editorialSearchResults,
  reportSiteSources,
  siteSearchFlags,
  type EditorialSearchKind,
  type SiteSourceAttempt,
} from './siteSearchStatus'
import type { SiteSearchResponse, SiteSearchResult } from './types'
import { runCatalog, type CatalogRun } from './catalogRunner'

export type { SearchSessionContext }

type SearchOptions = {
  limit?: number
  includePersonal?: boolean
  userId?: string | null
  session?: SearchSessionContext | null
  /** UI locale preference for Bible edition ordering */
  language?: 'am' | 'en'
  /** Ignored after completion when the caller has already moved on. */
  signal?: AbortSignal
}

type SettledSource = CatalogRun

type CalendarIndexRow = SiteSearchResult & { blob: string; entryId: string }

let calendarCache: CalendarIndexRow[] | null = null
let calendarCacheAt = 0
const CALENDAR_TTL_MS = 10 * 60 * 1000

function throwIfAborted(signal?: AbortSignal) {
  if (signal?.aborted) {
    throw new DOMException('The operation was aborted.', 'AbortError')
  }
}

function finishResponse(
  response: Omit<SiteSearchResponse, 'sources' | 'failed' | 'partial' | 'zeroResults' | 'totalCount'> & {
    results: SiteSearchResult[]
    attempted: SiteSourceAttempt[]
  },
): SiteSearchResponse {
  const { attempted, ...rest } = response
  const sources = reportSiteSources(attempted)
  const flags = siteSearchFlags(sources, rest.results.length)
  return {
    ...rest,
    ...flags,
    sources,
    totalCount: rest.results.length,
  }
}

async function publishedEditorial(kind: EditorialSearchKind, query: string) {
  const { listContent } = await import('../cms/contentService')
  const page = await listContent(kind, query, 'published', 1)
  return editorialSearchResults(kind, page.items)
}

async function searchStaticCalendar(query: string, limit = 6): Promise<SiteSearchResult[]> {
  const now = Date.now()
  if (!calendarCache || now - calendarCacheAt > CALENDAR_TTL_MS) {
    const { getAllCalendarEntries } = await import('../eotcCalendar/eotcCalendarDataset')
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
        entryId: entry.id,
        blob: normalizeSearchText(
          `${title} ${titleAmharic} ${entry.id} ${summary} ${keywords} ${(entry.category?.secondary || []).join(' ')}`,
        ),
      }
    })
    calendarCacheAt = now
  }

  const tokens = searchTokens(expandSearchAliases(query)).filter((t) => t.length >= 4)
  if (!tokens.length) return []
  const entityHits = matchCalendarEntities(normalizeSearchText(query)).filter((m) => m.kind !== 'fuzzy')
  const entityIds = new Set(entityHits.flatMap((m) => [m.entity.monthlyIds, m.entity.annualIds, m.entity.feastIds, m.entity.fastIds, m.entity.seasonIds].flat()))

  const hits: SiteSearchResult[] = []
  for (const row of calendarCache) {
    const words = new Set(row.blob.split(' ').filter(Boolean))
    const matched = tokens.filter((t) => words.has(t) || row.blob.includes(` ${t} `) || row.blob.startsWith(`${t} `))
    const entityExact = entityIds.has(row.entryId)
    if (!matched.length && !entityExact) continue
    const titleNorm = normalizeSearchText(row.title)
    const titleWords = new Set(titleNorm.split(' ').filter(Boolean))
    const exact = entityExact || matched.some((t) => titleWords.has(t) || titleNorm === t)
    // Require a strong title hit or two solid keyword hits (blocks garbage queries)
    if (!exact && matched.length < 2) continue
    if (!exact && !matched.some((t) => t.length >= 5)) continue
    const nextDay = exact ? findNextCivilDayForEntry(row.entryId, new Date(), { maxDays: 400 }) : null
    const route = nextDay ? `/calendar?date=${toIsoLocalDate(nextDay)}` : row.route
    hits.push({
      sourceType: row.sourceType,
      sourceId: row.sourceId,
      title: row.title,
      titleAmharic: row.titleAmharic,
      description: row.description,
      route,
      imagePath: row.imagePath,
      score: exact ? 0.04 : 0.11,
      matchKind: entityExact ? 'exact' : exact ? 'alias' : 'keyword',
      typeLabel: row.typeLabel,
    })
    if (hits.length >= limit) break
  }
  return hits
}

/** Per-catalog time budgets (ms). Bible text search scans the most rows. */
const CATALOG_TIMEOUT_MS: Record<string, number> = {
  bible: 6000,
  churchLibrary: 6000,
}
const DEFAULT_CATALOG_TIMEOUT_MS = 5000

export async function searchSite(
  queryRaw: string,
  options: SearchOptions = {},
): Promise<SiteSearchResponse> {
  const limit = options.limit ?? EXTENDED_RESULT_COUNT
  throwIfAborted(options.signal)
  const follow = resolveFollowUpQuery(queryRaw, options.session)
  const query = follow.query.trim()

  if (!query) {
    return finishResponse({
      query: queryRaw,
      resolvedQuery: '',
      results: [],
      intentMessage: null,
      isFollowUp: false,
      attempted: [],
    })
  }

  const intent = matchNavigationIntent(query)
  if (intent && /^(go to|open|take me to|navigate to)\b/i.test(query)) {
    const results = [{ ...intent, title: displayTitle(intent.title, intent.route) }]
    return finishResponse({
      query: queryRaw,
      resolvedQuery: query,
      results,
      intentMessage: null,
      isFollowUp: follow.isFollowUp,
      attempted: [{ name: 'routes', failed: false, count: results.length }],
    })
  }

  const personalQ = normalizeSearchText(query)
  if (
    options.includePersonal &&
    (personalQ.includes('my favorite') ||
      personalQ.includes('my favourites') ||
      personalQ === 'favorites' ||
      personalQ === 'saved' ||
      personalQ.includes('show my favorites'))
  ) {
    return finishResponse({
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
      intentMessage: null,
      isFollowUp: follow.isFollowUp,
      attempted: [{ name: 'account', failed: false, count: 1 }],
    })
  }

  const expanded = expandSearchAliases(query)
  const bibleLanguage = options.language === 'am' ? 'am' : 'en'

  const [
    { searchBible },
    { searchHymns, getHymnSingers, getHymnCollections },
    { loadMezmurSearchCatalog, searchMezmurCatalog, normalizeLatinSearchText },
    { loadSynaxariumSearchCatalog, searchSynaxariumCatalog },
  ] = await Promise.all([
    import('../bible/bibleSearch'),
    import('../publicContent/hymnBrowse'),
    import('../publicContent/mezmurSearch'),
    import('./synaxariumSearch'),
  ])

  // Every catalog runs at the same time with its own time budget, so one slow
  // or failing catalog (often Bible full-text search) never blocks the rest.
  const internal = new AbortController()
  const abortInternal = () => internal.abort()
  options.signal?.addEventListener('abort', abortInternal, { once: true })
  const run = <T,>(name: string, work: () => Promise<T>, map: (value: T) => SiteSearchResult[]) =>
    runCatalog(name, () => work(), map, {
      timeoutMs: CATALOG_TIMEOUT_MS[name] ?? DEFAULT_CATALOG_TIMEOUT_MS,
      signal: internal.signal,
    })

  // Direct chapter and verse references resolve through the Bible catalog.
  let bibleDirect = false
  const bibleRun = run(
    'bible',
    () => searchBible(query, { language: bibleLanguage, textLimit: 12 }),
    (bible) => {
      bibleDirect = bible.directReference
      return bible.results
    },
  )
  const remoteRun = Promise.all([
    run('hymns', () => searchHymns(expanded, 14), (discovery) => {
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
    run(
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
    run(
      'prayers',
      async () => {
        const { searchPrayCatalog } = await import('../prayers/prayerSearch')
        return searchPrayCatalog(expanded, { limit: 10 })
      },
      (pray) =>
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
          title: displayTitle(hit.title, hit.route.split('#')[0]),
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
    run('zemaris', () => getHymnSingers(), (zemaris) => {
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
    run('collections', () => getHymnCollections(), (collections) => {
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
    run(
      'synaxarium',
      () => loadSynaxariumSearchCatalog(),
      (docs) => searchSynaxariumCatalog(docs, expanded, 10),
    ),
    run('saints', () => publishedEditorial('saints', query), (rows) => rows),
    run('feasts', () => publishedEditorial('feasts', query), (rows) => rows),
    run('learn', () => publishedEditorial('articles', query), (rows) => rows),
    run(
      'churchLibrary',
      async () => {
        const { searchChurchLibrary } = await import('../searchBuddy/churchLibrarySearch')
        return searchChurchLibrary(expanded, internal.signal)
      },
      (library) =>
        library.results.map((hit) => ({
          sourceType: 'church_library' as const,
          sourceId: hit.passage_id,
          title: hit.title,
          titleAmharic: '',
          description: hit.excerpt
            ? `${hit.chapter_reference ? hit.chapter_reference + ' · ' : ''}${hit.locator_label ? hit.locator_label + ' · ' : ''}${hit.excerpt.slice(0, 160)}…`
            : hit.author || 'Church Library book',
          route: `/library/${hit.book_id}?passage=${encodeURIComponent(hit.passage_id)}`,
          imagePath: null,
          score: 0.05,
          matchKind: 'keyword' as const,
          typeLabel: 'Church Library',
        })),
    ),
  ])
  // Never leave a rejected promise unobserved if we return early.
  remoteRun.catch(() => undefined)

  let bibleSource: SettledSource
  try {
    bibleSource = await bibleRun
  } catch (error) {
    options.signal?.removeEventListener('abort', abortInternal)
    internal.abort()
    throw error
  }
  const bibleResults = bibleSource.results
  throwIfAborted(options.signal)

  if (bibleDirect && bibleResults.some((r) => r.sourceType !== 'bible-book')) {
    const hasScripture = bibleResults.some(
      (r) =>
        r.sourceType === 'bible-verse' ||
        r.sourceType === 'bible-range' ||
        r.sourceType === 'bible-chapter' ||
        r.sourceType === 'bible-text',
    )
    if (hasScripture || bibleResults.length) {
      options.signal?.removeEventListener('abort', abortInternal)
      internal.abort()
      const ranked = rankSearchResults(bibleResults, query, limit)
      return finishResponse({
        query: queryRaw,
        resolvedQuery: query,
        results: ranked,
        intentMessage: null,
        isFollowUp: follow.isFollowUp,
        attempted: [{ name: 'bible', failed: false, count: ranked.length, outcome: 'success_with_results' }],
      })
    }
  }

  const sources: SettledSource[] = [
    bibleSource,
    { name: 'routes', results: searchRouteCatalog(expanded, 8), failed: false, outcome: 'success_empty' },
  ]
  try {
    sources.push({
      name: 'calendar',
      results: await searchStaticCalendar(expanded, 6),
      failed: false,
      outcome: 'success_empty',
    })
  } catch (error) {
    if (options.signal?.aborted || (error instanceof DOMException && error.name === 'AbortError')) {
      throw new DOMException('The operation was aborted.', 'AbortError')
    }
    sources.push({ name: 'calendar', results: [], failed: true, outcome: 'query_error' })
  }
  if (intent) sources.push({ name: 'intent', results: [intent], failed: false, outcome: 'success_with_results' })

  let remote: SettledSource[]
  try {
    remote = await remoteRun
  } finally {
    options.signal?.removeEventListener('abort', abortInternal)
  }

  throwIfAborted(options.signal)
  sources.push(...remote)

  const merged = sources.flatMap((s) => s.results)
  const ranked = rankSearchResults(merged, query, limit)
  return finishResponse({
    query: queryRaw,
    resolvedQuery: query,
    results: ranked,
    intentMessage: null,
    isFollowUp: follow.isFollowUp,
    attempted: sources.map((source) => ({
      name: source.name,
      failed: source.failed,
      count: source.results.length,
      outcome: source.failed ? source.outcome : source.results.length ? 'success_with_results' : 'success_empty',
    })),
  })
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
  if (response.failed) {
    return 'Search is temporarily unavailable. Please try again.'
  }
  if (response.partial && response.results.length === 0) {
    const failed = response.sources.filter((source) => source.status === 'failed').map((source) => source.name)
    if (failed.length === 1 && failed[0] === 'bible') {
      return 'Bible search is temporarily unavailable, and no other matching records were found. Please try again.'
    }
    return 'Some search catalogs are temporarily unavailable, and the others had no matches. Please try again.'
  }
  if (response.intentMessage) return response.intentMessage
  if (response.zeroResults) {
    return 'No matching website records.'
  }
  return 'Matching records are listed.'
}

/** Nearby suggestions when zero results — only real catalog routes. */
export function zeroResultSuggestions(): SiteSearchResult[] {
  const hubs = [
    ...searchRouteCatalog('calendar', 1),
    ...searchRouteCatalog('bible hub', 1),
    ...searchRouteCatalog('hymns practice', 1),
    ...searchRouteCatalog('pray hub', 1),
    ...searchRouteCatalog('saints', 1),
    ...searchRouteCatalog('feasts', 1),
  ]
  const seen = new Set<string>()
  const out: SiteSearchResult[] = []
  for (const row of hubs) {
    if (seen.has(row.route)) continue
    seen.add(row.route)
    out.push({ ...row, matchKind: 'keyword' as const })
  }
  return out
}

export { expandSearchAliases, extractTopics, normalizeSearchText, resolveFollowUpQuery }
