/**
 * Fuzzy Pray search (Fuse.js) — prayers, sections, collections, liturgy only.
 * Mirrors Hymn Practice / mezmurSearch ranking patterns. Does not search Mezmur.
 */
import Fuse from 'fuse.js'
import { supabase } from '../supabase/client'
import {
  normalizeAmharicSearchText,
  normalizeLatinSearchText,
} from '../publicContent/mezmurSearch'
import { getPsalmNumber } from './psalmNumber'
import { prayerCollectionPath, prayerDetailPath } from './prayerSlug'
import type { PrayerLibrarySourceType, PrayerSearchResult } from './prayerLibraryTypes'

export type PraySearchDoc = {
  type:
    | 'prayer'
    | 'psalm'
    | 'collection'
    | 'section'
    | 'liturgy'
    | 'liturgy_section'
    | 'liturgy_entry'
    | 'guide'
    | 'guide_section'
  id: string
  slug: string
  collectionSlug: string
  sectionSlug: string
  title: string
  titleAmharic: string
  titleGeez: string
  titleEnglish: string
  collectionTitle: string
  sectionTitle: string
  bodySnippet: string
  psalmNumber: number | null
  route: string
  titleNorm: string
  searchBlob: string
}

export type PraySearchHit = PrayerSearchResult & {
  resultType: PraySearchDoc['type']
  score: number
  matchKind: 'exact' | 'psalm' | 'prefix' | 'fuzzy' | 'section' | 'collection' | 'body'
  closest?: boolean
}

const CATALOG_TTL_MS = 5 * 60 * 1000
const PAGE = 500

let catalogCache: { at: number; docs: PraySearchDoc[] } | null = null
let catalogPromise: Promise<PraySearchDoc[]> | null = null

function snippet(value?: string | null, max = 160): string {
  const text = (value || '').replace(/\s+/g, ' ').trim()
  if (!text) return ''
  return text.length > max ? `${text.slice(0, max)}…` : text
}

function typeLabel(type: PraySearchDoc['type']): string {
  switch (type) {
    case 'psalm':
      return 'Psalm'
    case 'prayer':
      return 'Prayer'
    case 'collection':
      return 'Prayer Collection'
    case 'section':
      return 'Prayer Section'
    case 'liturgy':
      return 'Liturgy'
    case 'liturgy_section':
      return 'Liturgy Section'
    case 'liturgy_entry':
      return 'Liturgy'
    case 'guide':
      return 'LEARN'
    case 'guide_section':
      return 'LEARN'
    default:
      return 'Pray'
  }
}

async function fetchPublished<T>(table: string, columns: string): Promise<T[]> {
  if (!supabase) return []
  const rows: T[] = []
  const client = supabase as unknown as {
    from: (name: string) => {
      select: (cols: string) => {
        eq: (col: string, val: string) => {
          range: (
            from: number,
            to: number,
          ) => Promise<{ data: T[] | null; error: { message: string } | null }>
        }
      }
    }
  }
  for (let from = 0; ; from += PAGE) {
    const { data, error } = await client
      .from(table)
      .select(columns)
      .eq('status', 'published')
      .range(from, from + PAGE - 1)
    if (error) throw error
    const page = data || []
    rows.push(...page)
    if (page.length < PAGE) break
  }
  return rows
}

function buildDoc(partial: Omit<PraySearchDoc, 'titleNorm' | 'searchBlob'>): PraySearchDoc {
  const titleNorm = normalizeLatinSearchText(
    [partial.title, partial.titleEnglish, partial.slug].filter(Boolean).join(' '),
  )
  const searchBlob = normalizeLatinSearchText(
    [
      partial.title,
      partial.titleEnglish,
      partial.titleAmharic,
      partial.titleGeez,
      partial.collectionTitle,
      partial.sectionTitle,
      partial.slug,
      partial.psalmNumber != null ? `psalm ${partial.psalmNumber} mezmur dawit ${partial.psalmNumber}` : '',
      partial.bodySnippet,
    ]
      .filter(Boolean)
      .join(' '),
  )
  return { ...partial, titleNorm, searchBlob }
}

export async function loadPraySearchCatalog(force = false): Promise<PraySearchDoc[]> {
  if (!force && catalogCache && Date.now() - catalogCache.at < CATALOG_TTL_MS) {
    return catalogCache.docs
  }
  if (!force && catalogPromise) return catalogPromise

  catalogPromise = (async () => {
    if (!supabase) {
      catalogCache = { at: Date.now(), docs: [] }
      return []
    }

    type CollectionRow = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      description: string | null
      status: string
    }
    type SectionRow = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      collection_id: string
      status: string
    }
    type PrayerRow = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      title_geez: string | null
      title_english: string | null
      text_amharic: string | null
      text_geez: string | null
      text_english: string | null
      transliteration: string | null
      collection_id: string | null
      section_id: string | null
      collection_slug: string | null
      section_slug: string | null
      status: string
    }
    type LitCollection = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      description: string | null
      status: string
    }
    type LitSection = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      collection_id: string
      collection_slug: string | null
      status: string
    }
    type LitEntry = {
      id: string
      slug: string
      title: string | null
      title_amharic: string | null
      text_amharic: string | null
      text_english: string | null
      transliteration: string | null
      collection_id: string
      section_id: string
      collection_slug: string | null
      section_slug: string | null
      status: string
    }
    type GuideRow = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      summary: string | null
      status: string
    }
    type GuideSectionRow = {
      id: string
      slug: string
      title: string
      title_amharic: string | null
      body_english: string | null
      body_amharic: string | null
      guide_id: string
    }

    const [
      collections,
      sections,
      prayers,
      litCollections,
      litSections,
      litEntries,
      guides,
      guideSections,
    ] = await Promise.all([
      fetchPublished<CollectionRow>(
        'prayer_collections',
        'id,slug,title,title_amharic,description,status',
      ),
      fetchPublished<SectionRow>(
        'prayer_sections',
        'id,slug,title,title_amharic,collection_id,status',
      ),
      fetchPublished<PrayerRow>(
        'prayers',
        'id,slug,title,title_amharic,title_geez,title_english,text_amharic,text_geez,text_english,transliteration,collection_id,section_id,collection_slug,section_slug,status',
      ),
      fetchPublished<LitCollection>(
        'liturgy_collections',
        'id,slug,title,title_amharic,description,status',
      ).catch(() => [] as LitCollection[]),
      fetchPublished<LitSection>(
        'liturgy_sections',
        'id,slug,title,title_amharic,collection_id,collection_slug,status',
      ).catch(() => [] as LitSection[]),
      fetchPublished<LitEntry>(
        'liturgy_entries',
        'id,slug,title,title_amharic,text_amharic,text_english,transliteration,collection_id,section_id,collection_slug,section_slug,status',
      ).catch(() => [] as LitEntry[]),
      fetchPublished<GuideRow>(
        'prayer_guides',
        'id,slug,title,title_amharic,summary,status',
      ).catch(() => [] as GuideRow[]),
      (async () => {
        if (!supabase) return [] as GuideSectionRow[]
        const rows: GuideSectionRow[] = []
        for (let from = 0; ; from += PAGE) {
          const { data, error } = await supabase
            .from('prayer_guide_sections' as never)
            .select('id,slug,title,title_amharic,body_english,body_amharic,guide_id')
            .range(from, from + PAGE - 1)
          if (error) {
            if (import.meta.env.DEV) console.warn('[praySearch] guide sections', error.message)
            return [] as GuideSectionRow[]
          }
          const page = (data || []) as unknown as GuideSectionRow[]
          rows.push(...page)
          if (page.length < PAGE) break
        }
        return rows
      })(),
    ])

    const collectionById = new Map(collections.map((c) => [c.id, c]))
    const sectionById = new Map(sections.map((s) => [s.id, s]))
    const litCollectionById = new Map(litCollections.map((c) => [c.id, c]))
    const litSectionById = new Map(litSections.map((s) => [s.id, s]))
    const guideById = new Map(guides.map((g) => [g.id, g]))

    const docs: PraySearchDoc[] = []

    for (const col of collections) {
      if (col.slug === 'divine-liturgy') continue
      docs.push(
        buildDoc({
          type: 'collection',
          id: col.id,
          slug: col.slug,
          collectionSlug: col.slug,
          sectionSlug: '',
          title: col.title || col.slug,
          titleAmharic: col.title_amharic || '',
          titleGeez: '',
          titleEnglish: col.title || '',
          collectionTitle: col.title || '',
          sectionTitle: '',
          bodySnippet: snippet(col.description),
          psalmNumber: null,
          route: prayerCollectionPath(col.slug),
        }),
      )
    }

    for (const section of sections) {
      const col = collectionById.get(section.collection_id)
      if (!col || col.slug === 'divine-liturgy') continue
      docs.push(
        buildDoc({
          type: 'section',
          id: section.id,
          slug: section.slug,
          collectionSlug: col.slug,
          sectionSlug: section.slug,
          title: section.title || section.slug,
          titleAmharic: section.title_amharic || '',
          titleGeez: '',
          titleEnglish: section.title || '',
          collectionTitle: col.title || '',
          sectionTitle: section.title || '',
          bodySnippet: '',
          psalmNumber: null,
          route: `${prayerCollectionPath(col.slug)}/${section.slug}`,
        }),
      )
    }

    for (const prayer of prayers) {
      const col =
        (prayer.collection_id && collectionById.get(prayer.collection_id)) ||
        collections.find((c) => c.slug === prayer.collection_slug)
      if (!col || col.slug === 'divine-liturgy') continue
      const section = prayer.section_id ? sectionById.get(prayer.section_id) : undefined
      const psalmNumber =
        col.slug === 'mezmure-dawit'
          ? getPsalmNumber({
              slug: prayer.slug,
              title: prayer.title_english || prayer.title,
              transliterationTitle: prayer.transliteration,
            })
          : null
      const displayTitle =
        psalmNumber != null
          ? `Psalm ${psalmNumber}`
          : prayer.transliteration ||
            prayer.title_english ||
            prayer.title ||
            prayer.slug
      docs.push(
        buildDoc({
          type: psalmNumber != null ? 'psalm' : 'prayer',
          id: prayer.id,
          slug: prayer.slug,
          collectionSlug: col.slug,
          sectionSlug: section?.slug || prayer.section_slug || '',
          title: displayTitle,
          titleAmharic: prayer.title_amharic || prayer.title || '',
          titleGeez: prayer.title_geez || '',
          titleEnglish: prayer.title_english || '',
          collectionTitle: col.title || '',
          sectionTitle: section?.title || '',
          bodySnippet: snippet(
            prayer.text_english || prayer.text_amharic || prayer.text_geez || prayer.transliteration,
          ),
          psalmNumber,
          route: prayerDetailPath(prayer.slug, col.slug),
        }),
      )
    }

    for (const col of litCollections) {
      docs.push(
        buildDoc({
          type: 'liturgy',
          id: col.id,
          slug: col.slug,
          collectionSlug: col.slug,
          sectionSlug: '',
          title: col.title || col.slug,
          titleAmharic: col.title_amharic || '',
          titleGeez: '',
          titleEnglish: col.title || '',
          collectionTitle: col.title || '',
          sectionTitle: '',
          bodySnippet: snippet(col.description),
          psalmNumber: null,
          route: `/pray/${col.slug}`,
        }),
      )
    }

    for (const section of litSections) {
      const col = litCollectionById.get(section.collection_id)
      const collectionSlug = section.collection_slug || col?.slug || ''
      if (!collectionSlug) continue
      docs.push(
        buildDoc({
          type: 'liturgy_section',
          id: section.id,
          slug: section.slug,
          collectionSlug,
          sectionSlug: section.slug,
          title: section.title || section.slug,
          titleAmharic: section.title_amharic || '',
          titleGeez: '',
          titleEnglish: section.title || '',
          collectionTitle: col?.title || '',
          sectionTitle: section.title || '',
          bodySnippet: '',
          psalmNumber: null,
          route: `/pray/${collectionSlug}/${section.slug}`,
        }),
      )
    }

    for (const entry of litEntries) {
      const col = litCollectionById.get(entry.collection_id)
      const section = litSectionById.get(entry.section_id)
      const collectionSlug = entry.collection_slug || col?.slug || ''
      const sectionSlug = entry.section_slug || section?.slug || ''
      if (!collectionSlug) continue
      const hash = entry.slug ? `#entry-${entry.slug}` : ''
      docs.push(
        buildDoc({
          type: 'liturgy_entry',
          id: entry.id,
          slug: entry.slug,
          collectionSlug,
          sectionSlug,
          title: entry.title || entry.transliteration || entry.slug,
          titleAmharic: entry.title_amharic || '',
          titleGeez: '',
          titleEnglish: entry.title || '',
          collectionTitle: col?.title || 'Divine Liturgy',
          sectionTitle: section?.title || '',
          bodySnippet: snippet(entry.text_english || entry.text_amharic || entry.transliteration),
          psalmNumber: null,
          route: sectionSlug
            ? `/pray/${collectionSlug}/${sectionSlug}${hash}`
            : `/pray/${collectionSlug}${hash}`,
        }),
      )
    }

    for (const guide of guides) {
      docs.push(
        buildDoc({
          type: 'guide',
          id: guide.id,
          slug: guide.slug,
          collectionSlug: guide.slug,
          sectionSlug: '',
          title: guide.title || guide.slug,
          titleAmharic: guide.title_amharic || '',
          titleGeez: '',
          titleEnglish: guide.title || '',
          collectionTitle: guide.title || '',
          sectionTitle: '',
          bodySnippet: snippet(guide.summary),
          psalmNumber: null,
          route: `/pray/${guide.slug}`,
        }),
      )
    }

    for (const section of guideSections) {
      const guide = guideById.get(section.guide_id)
      if (!guide) continue
      docs.push(
        buildDoc({
          type: 'guide_section',
          id: section.id,
          slug: section.slug,
          collectionSlug: guide.slug,
          sectionSlug: section.slug,
          title: section.title || section.slug,
          titleAmharic: section.title_amharic || '',
          titleGeez: '',
          titleEnglish: section.title || '',
          collectionTitle: guide.title || '',
          sectionTitle: section.title || '',
          bodySnippet: snippet(section.body_english || section.body_amharic),
          psalmNumber: null,
          route: `/pray/${guide.slug}#${section.slug}`,
        }),
      )
    }

    catalogCache = { at: Date.now(), docs }
    return docs
  })()

  try {
    return await catalogPromise
  } finally {
    catalogPromise = null
  }
}

function extractPsalmQuery(query: string): number | null {
  const norm = normalizeLatinSearchText(query)
  const patterns = [
    /(?:^|\s)(?:psalm|mezmur(?:e)?\s*dawit)\s*0*(\d{1,3})(?:\s|$)/i,
    /(?:^|\s)psalm\s*0*(\d{1,3})(?:\s|$)/i,
    /^0*(\d{1,3})$/,
    /^psalm0*(\d{1,3})$/i,
  ]
  for (const pattern of patterns) {
    const match = norm.match(pattern) || query.trim().match(pattern)
    if (match) {
      const n = Number.parseInt(match[1], 10)
      if (n >= 1 && n <= 150) return n
    }
  }
  return null
}

function toResult(doc: PraySearchDoc, score: number, matchKind: PraySearchHit['matchKind'], closest = false): PraySearchHit {
  const sourceType: PrayerLibrarySourceType =
    doc.type.startsWith('liturgy') ? 'liturgy' : 'prayer'
  const context = [doc.collectionTitle, doc.sectionTitle].filter(Boolean).join(' · ')
  return {
    id: `${doc.type}:${doc.id}`,
    sourceType,
    title: doc.title,
    titleAmharic: doc.titleAmharic,
    excerpt: doc.bodySnippet,
    route: doc.route,
    metadata: [typeLabel(doc.type), context].filter(Boolean).join(' · '),
    resultType: doc.type,
    score,
    matchKind,
    closest,
  }
}

const KIND_RANK: Record<PraySearchHit['matchKind'], number> = {
  exact: 0,
  psalm: 1,
  prefix: 2,
  fuzzy: 3,
  section: 4,
  collection: 5,
  body: 6,
}

export async function searchPrayCatalog(
  queryInput: string,
  options: { limit?: number; suggestionLimit?: number } = {},
): Promise<{
  results: PraySearchHit[]
  suggestions: PraySearchHit[]
  hasStrongMatch: boolean
  closest: PraySearchHit[]
}> {
  const query = queryInput.trim()
  const limit = options.limit ?? 30
  const suggestionLimit = options.suggestionLimit ?? 8
  if (!query) {
    return { results: [], suggestions: [], hasStrongMatch: false, closest: [] }
  }

  const docs = await loadPraySearchCatalog()
  const queryNorm = normalizeLatinSearchText(query)
  const queryAm = normalizeAmharicSearchText(query)
  const psalmQuery = extractPsalmQuery(query)

  const ranked = new Map<string, PraySearchHit>()

  const put = (hit: PraySearchHit) => {
    const prev = ranked.get(hit.id)
    if (!prev || hit.score < prev.score || KIND_RANK[hit.matchKind] < KIND_RANK[prev.matchKind]) {
      ranked.set(hit.id, hit)
    }
  }

  // Exact / prefix / psalm boosts before Fuse
  for (const doc of docs) {
    if (psalmQuery != null && doc.psalmNumber === psalmQuery) {
      put(toResult(doc, 0.0005, 'psalm'))
      continue
    }
    if (doc.titleNorm === queryNorm && queryNorm) {
      put(toResult(doc, 0.001, 'exact'))
      continue
    }
    if (queryNorm && doc.titleNorm.startsWith(queryNorm)) {
      put(toResult(doc, 0.04, 'prefix'))
      continue
    }
    if (queryAm && normalizeAmharicSearchText(doc.titleAmharic).includes(queryAm)) {
      put(toResult(doc, 0.06, 'exact'))
      continue
    }
    if (queryAm && normalizeAmharicSearchText(doc.titleGeez).includes(queryAm)) {
      put(toResult(doc, 0.07, 'exact'))
    }
  }

  const fuse = new Fuse(docs, {
    keys: [
      { name: 'title', weight: 0.28 },
      { name: 'titleEnglish', weight: 0.18 },
      { name: 'titleAmharic', weight: 0.16 },
      { name: 'titleGeez', weight: 0.1 },
      { name: 'slug', weight: 0.1 },
      { name: 'sectionTitle', weight: 0.08 },
      { name: 'collectionTitle', weight: 0.06 },
      { name: 'searchBlob', weight: 0.04 },
    ],
    threshold: 0.38,
    distance: 120,
    ignoreLocation: true,
    minMatchCharLength: 1,
    shouldSort: true,
    includeScore: true,
  })

  for (const hit of fuse.search(query, { limit: 60 })) {
    const doc = hit.item
    const fuseScore = hit.score ?? 0.5
    let matchKind: PraySearchHit['matchKind'] = 'fuzzy'
    let score = fuseScore
    if (doc.type === 'section' || doc.type === 'liturgy_section') {
      matchKind = 'section'
      score = Math.max(fuseScore, 0.12)
    } else if (doc.type === 'collection' || doc.type === 'liturgy') {
      matchKind = 'collection'
      score = Math.max(fuseScore, 0.14)
    } else if (
      normalizeLatinSearchText(doc.bodySnippet).includes(queryNorm) &&
      !doc.titleNorm.includes(queryNorm)
    ) {
      matchKind = 'body'
      score = Math.max(fuseScore, 0.22)
    }
    put(toResult(doc, score, matchKind))
  }

  const sorted = [...ranked.values()].sort(
    (a, b) =>
      KIND_RANK[a.matchKind] - KIND_RANK[b.matchKind] ||
      a.score - b.score ||
      a.title.localeCompare(b.title),
  )

  const strong = sorted.filter((h) =>
    ['exact', 'psalm', 'prefix', 'fuzzy'].includes(h.matchKind) && h.score <= 0.35,
  )
  const results = (strong.length ? strong : sorted).slice(0, limit)
  const hasStrongMatch = strong.length > 0
  const closest = hasStrongMatch
    ? []
    : sorted.slice(0, Math.min(8, limit)).map((h) => ({ ...h, closest: true }))
  const suggestions = results.slice(0, suggestionLimit)

  return {
    results: hasStrongMatch ? results : closest,
    suggestions,
    hasStrongMatch,
    closest,
  }
}
