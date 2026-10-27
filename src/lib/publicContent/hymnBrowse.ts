/**
 * Hymns Practice browse — ACTIVE SOURCE: staging import tables.
 *
 * public.mezmur_collections_import (optional — may be absent)
 * public.mezmur_sections_import
 * public.mezmur_section_links_import
 * public.mezmur_public (published projection; restricted lyrics are redacted)
 * public.mezmur_occasion_links_public
 * public.mezmur_category_links_public (published, nondeleted Mezmurs only)
 *
 * Does NOT query legacy views/tables:
 * hymn_major_browse_groups, hymn_browse_group_children,
 * hymn_browse_occasions, hymn_browse_categories, hymn_browse_singers,
 * hymn_collections_with_counts, hymn_sections_with_counts.
 */
import { supabase } from '../supabase/client'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import { resolveHymnSectionImageUrl } from './hymnSectionArtFallbacks'
import type { ZemariSocialLinks } from './zemariSocialLinks'
import { collectPagedRows, isEligiblePublicMezmurRow, isPublicMezmurStatus } from './mezmurVisibility'
import { mezmurLanguageAliases, normalizeMezmurLanguage, type MezmurLanguageCode, type MezmurLanguageFilter } from '../mezmur/mezmurLanguage'

let zemariCountsViewLacksTrashMetadata = false
let zemariCountsViewPermissionDenied = false

function isZemariCountsTrashColumnError(error: { code?: string; message?: string } | null): boolean {
  return Boolean(
    error &&
      (error.code === '42703' || error.code === 'PGRST204') &&
      /(?:zemaris_with_counts\.)?(deleted_at|deleted_by|deleted_from_status).*does not exist/i.test(
        error.message || '',
      ),
  )
}

export type HymnCollection = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  descriptionAmharic: string
  imagePath: string | null
  imageUrl: string
  imageAlt: string
  collectionType: string
  mezmurCount: number
  featured: boolean
  sortOrder: number
  href: string
}

/** @deprecated Prefer HymnCollection */
export type HymnMajorBrowseGroup = HymnCollection

export type HymnSection = {
  id: string
  collectionId: string
  collectionSlug: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  descriptionAmharic: string
  imagePath: string | null
  imageUrl: string
  imageAlt: string
  sectionType: string
  sourceEntityType?: string
  sourceEntitySlug?: string
  mezmurCount: number
  featured: boolean
  sortOrder: number
  href: string
}

export type HymnBrowseKind = 'section' | 'occasion' | 'category' | 'singer' | 'language' | 'manual'

export type HymnBrowseCard = {
  kind: HymnBrowseKind
  id: string
  slug: string
  name: string
  nameAmharic: string
  description: string
  descriptionAmharic?: string
  imagePath: string | null
  imageUrl: string
  imageAlt: string
  mezmurCount: number
  featured: boolean
  sortOrder: number
  href: string
  socialLinks?: ZemariSocialLinks
}

export type HymnSectionMezmur = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  titleEnglish: string
  thumbnailUrl: string | null
  youtubeUrl: string | null
  singerName: string | null
  sortOrder: number
  language: string | null
}

export type ImportMezmur = {
  mezmur_id: string
  slug: string
  title: string
  title_amharic: string | null
  title_english: string | null
  description: string | null
  description_amharic: string | null
  lyrics_amharic: string | null
  lyrics_transliteration: string | null
  lyrics_english: string | null
  lyrics_geez: string | null
  lyrics_oromo: string | null
  primary_language: string | null
  form: string | null
  singer_id: string | null
  singer_slug: string | null
  singer_name: string | null
  zemari_id: string | null
  youtube_url: string | null
  audio_url: string | null
  image_path: string | null
  image_alt: string | null
  legacy_thumbnail_url: string | null
  search_keywords: string[]
  status: string | null
  review_status: string | null
  review_notes: string | null
  source_url: string | null
  source_notes: string | null
  rights_status: string | null
  has_stored_lyrics?: boolean | null
}

export type HymnSinger = {
  id: string
  slug: string
  name: string
  mezmurCount: number
  href: string
}

/** @deprecated Prefer ImportMezmur for detail payloads */
export type ImportMezmurDetail = ImportMezmur & {
  id: string
  language: string | null
  thumbnail_url: string | null
  occasion_slugs: string[]
}

export type HymnDiscoveryHit =
  | { type: 'mezmur'; id: string; title: string; titleAmharic: string; href: string; meta: string }
  | { type: 'collection'; id: string; title: string; titleAmharic: string; href: string; meta: string }
  | { type: 'section'; id: string; title: string; titleAmharic: string; href: string; meta: string }
  | { type: 'singer'; id: string; title: string; titleAmharic: string; href: string; meta: string }
  | { type: 'occasion'; id: string; title: string; titleAmharic: string; href: string; meta: string }
  | { type: 'category'; id: string; title: string; titleAmharic: string; href: string; meta: string }
  | { type: 'browse_group'; id: string; title: string; titleAmharic: string; href: string; meta: string }

const T = {
  collections: 'mezmur_collections_import',
  sections: 'mezmur_sections_import',
  links: 'mezmur_section_links_import',
  data: 'mezmur_public',
  occasions: 'mezmur_occasion_links_public',
  categories: 'mezmur_category_links_public',
} as const

const missingTables = new Set<string>()
let schemaErrorLogged = false

const isDev = Boolean(typeof import.meta !== 'undefined' && import.meta.env?.DEV)

function logSchemaError(scope: string, error: { message?: string; code?: string } | null) {
  if (!error) return
  const permanent =
    error.code === '42501' ||
    error.code === '42P01' ||
    error.code === 'PGRST205' ||
    error.code === '42703' ||
    /permission denied|does not exist|Could not find the table|relation/i.test(error.message || '')
  if (permanent) {
    if (!schemaErrorLogged && isDev) {
      schemaErrorLogged = true
      console.error(`[hymnBrowse/import] ${scope} (schema/permission — not retrying)`, error)
    }
    return
  }
  if (isDev) console.error(`[hymnBrowse/import] ${scope}`, error)
}

function markMissing(table: string) {
  missingTables.add(table)
}

function isMissing(table: string) {
  return missingTables.has(table)
}

function mediaUrl(path: string | null | undefined): string {
  const trimmed = (path || '').trim()
  return trimmed ? resolveContentMediaUrl(trimmed) : ''
}

function txt(value: unknown): string {
  return String(value ?? '').trim()
}

function num(value: unknown): number {
  const n = Number(value)
  return Number.isFinite(n) ? n : 0
}

function truthy(value: unknown): boolean {
  const v = txt(value).toLowerCase()
  return v === 'true' || v === '1' || v === 'yes' || v === 't'
}

function humanizeSlug(slug: string): string {
  return slug
    .split(/[-_]+/)
    .filter(Boolean)
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ')
}

function grantHint(table: string): string {
  return `Hymn import data is not readable yet. Run supabase/mezmur-import/FIX_MEZMUR_IMPORT_ANON_READ.sql (GRANT SELECT + disable RLS on ${table}).`
}

function permissionError(table: string, error: { code?: string; message?: string }): Error {
  if (error.code === '42501' || /permission denied/i.test(error.message || '')) {
    return new Error(grantHint(table))
  }
  return new Error(error.message || `Unable to query ${table}.`)
}

type SectionImportRow = Record<string, unknown>
type LinkImportRow = Record<string, unknown>
type DataImportRow = Record<string, unknown>

function mapCollectionFromRow(row: Record<string, unknown>): HymnCollection {
  const slug = txt(row.collection_slug || row.slug)
  const path = txt(row.image_path) || null
  const title = txt(row.title) || humanizeSlug(slug)
  return {
    id: txt(row.collection_id || slug) || slug,
    slug,
    title,
    titleAmharic: txt(row.title_amharic),
    description: txt(row.description),
    descriptionAmharic: txt(row.description_amharic),
    imagePath: path,
    imageUrl: mediaUrl(path),
    imageAlt: txt(row.image_alt) || title,
    collectionType: txt(row.collection_type),
    mezmurCount: num(row.mezmur_count),
    featured: truthy(row.is_featured),
    sortOrder: num(row.sort_order),
    href: `/practice/browse/${slug}`,
  }
}

function mapSectionFromRow(row: SectionImportRow): HymnSection {
  const collectionSlug = txt(row.collection_slug)
  const slug = txt(row.section_slug || row.slug)
  const path = txt(row.image_path) || null
  const title = txt(row.title) || humanizeSlug(slug)
  return {
    id: txt(row.section_id || `${collectionSlug}:${slug}`),
    collectionId: collectionSlug,
    collectionSlug,
    slug,
    title,
    titleAmharic: txt(row.title_amharic),
    description: txt(row.description),
    descriptionAmharic: txt(row.description_amharic),
    imagePath: path,
    imageUrl: resolveHymnSectionImageUrl(slug, path, mediaUrl(path)),
    imageAlt: txt(row.image_alt) || title,
    sectionType: txt(row.section_type),
    sourceEntityType: txt(row.source_entity_type),
    sourceEntitySlug: txt(row.source_entity_slug),
    mezmurCount: 0,
    featured: truthy(row.is_featured),
    sortOrder: num(row.sort_order),
    href: `/practice/browse/${collectionSlug}/${slug}`,
  }
}

function sectionToCard(section: HymnSection): HymnBrowseCard {
  return {
    kind: 'section',
    id: section.id,
    slug: section.slug,
    name: section.title,
    nameAmharic: section.titleAmharic,
    description: section.description,
    descriptionAmharic: section.descriptionAmharic,
    imagePath: section.imagePath,
    imageUrl: section.imageUrl,
    imageAlt: section.imageAlt,
    mezmurCount: section.mezmurCount,
    featured: section.featured,
    sortOrder: section.sortOrder,
    href: section.href,
  }
}

function sortCollections(rows: HymnCollection[]): HymnCollection[] {
  return [...rows].sort((a, b) => {
    if (a.featured !== b.featured) return a.featured ? -1 : 1
    if (a.sortOrder !== b.sortOrder) return a.sortOrder - b.sortOrder
    return a.title.localeCompare(b.title, undefined, { sensitivity: 'base' })
  })
}

function sortSections(rows: HymnSection[]): HymnSection[] {
  return [...rows].sort((a, b) => {
    if (a.featured !== b.featured) return a.featured ? -1 : 1
    if (a.sortOrder !== b.sortOrder) return a.sortOrder - b.sortOrder
    return a.title.localeCompare(b.title, undefined, { sensitivity: 'base' })
  })
}

function sortCards(cards: HymnBrowseCard[]): HymnBrowseCard[] {
  return [...cards].sort((a, b) => {
    if (a.featured !== b.featured) return a.featured ? -1 : 1
    if (a.sortOrder !== b.sortOrder) return a.sortOrder - b.sortOrder
    return a.name.localeCompare(b.name, undefined, { sensitivity: 'base' })
  })
}

function mapDataCard(row: DataImportRow, sortOrder = 0): HymnSectionMezmur {
  const slug = txt(row.slug)
  const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null
  return {
    id: txt(row.mezmur_id || slug) || slug,
    slug,
    title: txt(row.title) || slug,
    titleAmharic: txt(row.title_amharic),
    titleEnglish: txt(row.title_english),
    thumbnailUrl: image,
    youtubeUrl: txt(row.youtube_url) || null,
    singerName: txt(row.singer_name) || null,
    sortOrder,
    language: txt(row.primary_language) || null,
  }
}

function parseKeywords(raw: unknown): string[] {
  if (Array.isArray(raw)) return raw.map((v) => String(v).trim()).filter(Boolean)
  const text = txt(raw)
  if (!text) return []
  return text
    .split(/[|,;]+/)
    .map((v) => v.trim())
    .filter(Boolean)
}

function isPublishedStatus(status: unknown): boolean {
  return isPublicMezmurStatus(status)
}

function isPublicMezmurRow(row: DataImportRow): boolean {
  return isEligiblePublicMezmurRow(row)
}

async function selectAllImportRows(
  columns: string,
  options: { maxRows?: number; pageSize?: number; language?: MezmurLanguageCode } = {},
): Promise<DataImportRow[]> {
  const client = supabase
  if (!client) return []
  return collectPagedRows<DataImportRow>(async (from, to) => {
    let query = client
      .from(T.data as never)
      .select(columns)
      .eq('status', 'published')
    if (options.language) query = query.in('primary_language', mezmurLanguageAliases(options.language))
    const { data, error } = await query.range(from, to)
    if (error) throw permissionError(T.data, error)
    return (data || []) as DataImportRow[]
  }, options)
}

const COLLECTION_SELECT =
  'collection_id, collection_slug, title, title_amharic, description, description_amharic, image_path, image_alt, collection_type, sort_order, is_featured, status'

export const CANONICAL_MAJOR_COLLECTIONS: HymnCollection[] = [
  {
    id: 'holidays-feasts',
    slug: 'holidays-feasts',
    title: 'Holidays & Feasts',
    titleAmharic: 'በዓላት እና አጽዋማት',
    description: 'Browse hymns for major feasts and holy days.',
    descriptionAmharic: 'የበዓላት እና የአጽዋማት መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Holidays and Feasts',
    collectionType: 'occasion_group',
    mezmurCount: 0,
    featured: true,
    sortOrder: 10,
    href: '/practice/browse/holidays-feasts',
  },
  {
    id: 'angels-saints',
    slug: 'angels-saints',
    title: 'Angels & Saints',
    titleAmharic: 'መላእክት እና ቅዱሳን',
    description: 'Hymns for holy angels, apostles, martyrs, and saints.',
    descriptionAmharic: 'የቅዱሳን መላእክት፣ ሐዋርያት፣ ሰማዕታት እና ጻድቃን መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Angels and Saints',
    collectionType: 'subject_group',
    mezmurCount: 0,
    featured: true,
    sortOrder: 20,
    href: '/practice/browse/angels-saints',
  },
  {
    id: 'virgin-mary',
    slug: 'virgin-mary',
    title: 'Virgin Mary',
    titleAmharic: 'እመቤታችን ቅድስት ድንግል ማርያም',
    description: 'Marian praise and feast hymns.',
    descriptionAmharic: 'የእመቤታችን ምስጋና እና የበዓላት መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Virgin Mary',
    collectionType: 'subject_group',
    mezmurCount: 0,
    featured: true,
    sortOrder: 30,
    href: '/practice/browse/virgin-mary',
  },
  {
    id: 'jesus-christ',
    slug: 'jesus-christ',
    title: 'Jesus Christ',
    titleAmharic: 'ኢየሱስ ክርስቶስ',
    description: 'Hymns of Christ — nativity, passion, and glory.',
    descriptionAmharic: 'የጌታችን የመድኃኒታችን የኢየሱስ ክርስቶስ መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Jesus Christ',
    collectionType: 'subject_group',
    mezmurCount: 0,
    featured: true,
    sortOrder: 40,
    href: '/practice/browse/jesus-christ',
  },
  {
    id: 'repentance-fasting',
    slug: 'repentance-fasting',
    title: 'Repentance & Fasting',
    titleAmharic: 'ንስሐ እና ጾም',
    description: 'Hymns for fasting seasons and repentance.',
    descriptionAmharic: 'የአጽዋማት እና የንስሐ መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Repentance and Fasting',
    collectionType: 'occasion_group',
    mezmurCount: 0,
    featured: true,
    sortOrder: 50,
    href: '/practice/browse/repentance-fasting',
  },
  {
    id: 'english-mezmur',
    slug: 'english-mezmur',
    title: 'English Mezmur',
    titleAmharic: 'የእንግሊዝኛ መዝሙር',
    description: 'English-language Mezmur for practice and learning.',
    descriptionAmharic: 'የእንግሊዝኛ ቋንቋ መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'English Mezmur',
    collectionType: 'language_group',
    mezmurCount: 0,
    featured: false,
    sortOrder: 60,
    href: '/practice/browse/english-mezmur',
  },
  {
    id: 'sacraments-church-life',
    slug: 'sacraments-church-life',
    title: 'Sacraments & Church Life',
    titleAmharic: 'ምሥጢራተ ቤተክርስቲያን',
    description: 'Wedding, communion, baptism, and parish life.',
    descriptionAmharic: 'የሰርግ፣ የጥምቀት፣ የቁርባን እና የበዓላት መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Sacraments and Church Life',
    collectionType: 'general_group',
    mezmurCount: 0,
    featured: false,
    sortOrder: 70,
    href: '/practice/browse/sacraments-church-life',
  },
  {
    id: 'praise-general',
    slug: 'praise-general',
    title: 'Praise & General',
    titleAmharic: 'ምስጋና እና አጠቃላይ',
    description: 'General praise, short hymns, and everyday worship.',
    descriptionAmharic: 'አጠቃላይ ምስጋና እና አጫጭር መዝሙራት።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Praise and General',
    collectionType: 'general_group',
    mezmurCount: 0,
    featured: false,
    sortOrder: 80,
    href: '/practice/browse/praise-general',
  },
  {
    id: 'zemari-singers',
    slug: 'zemari-singers',
    title: 'Zemari / Singers',
    titleAmharic: 'መዘምራን',
    description: 'Browse Mezmur by singer (zemari).',
    descriptionAmharic: 'መዝሙራትን በመዘምራን ስም ይፈልጉ።',
    imagePath: null,
    imageUrl: '',
    imageAlt: 'Zemari and Singers',
    collectionType: 'singer_group',
    mezmurCount: 0,
    featured: false,
    sortOrder: 90,
    href: '/practice/browse/zemari-singers',
  },
]

const collectionsCache = new Map<string, { at: number; data: HymnCollection[] }>()
const collectionsPromises = new Map<string, Promise<HymnCollection[]>>()
const COLLECTIONS_TTL_MS = 5 * 60 * 1000

/** Clear browse metadata after a publication or unpublish operation. */
export function invalidateHymnBrowseCaches(): void {
  collectionsCache.clear()
  collectionsPromises.clear()
}

/** Level 1 — collections from mezmur_collections_import, filtered by language if specified. */
export async function getHymnCollections(language?: MezmurLanguageFilter): Promise<HymnCollection[]> {
  const key = language || 'all'
  const cached = collectionsCache.get(key)
  if (cached && Date.now() - cached.at < COLLECTIONS_TTL_MS) {
    return cached.data
  }
  const pending = collectionsPromises.get(key)
  if (pending) return pending

  const promise = loadHymnCollectionsFresh(language)
    .then((data) => {
      collectionsCache.set(key, { at: Date.now(), data })
      return data
    })
    .finally(() => {
      collectionsPromises.delete(key)
    })
  collectionsPromises.set(key, promise)
  return promise
}

async function loadHymnCollectionsFresh(language?: MezmurLanguageFilter): Promise<HymnCollection[]> {
  let visibleRows: Record<string, unknown>[] = []

  if (supabase) {
    try {
      const { data, error } = await supabase
        .from(T.collections as never)
        .select(COLLECTION_SELECT)
        .is('deleted_at', null)

      if (error) {
        logSchemaError('getHymnCollections', error)
        if (error.code === 'PGRST205' || /Could not find the table/i.test(error.message || '')) {
          markMissing(T.collections)
        }
      } else if (data) {
        const rawRows = data as Record<string, unknown>[]
        visibleRows = rawRows.filter((row) => isPublishedStatus(row.status))
      }
    } catch {
      // ignore
    }
  }

  // Calculate live counts using language and published status
  const counts = await collectionCountsFromLinks(undefined, language).catch(() => new Map<string, number>())

  if (visibleRows.length > 0) {
    return sortCollections(
      visibleRows.map((row) => {
        const mapped = mapCollectionFromRow(row)
        const mezmurCount = counts.get(mapped.slug) ?? 0
        return { ...mapped, mezmurCount }
      }),
    )
  }

  // Fallback: derive from distinct collection_slug in sections when collections empty/missing
  const sections = await fetchAllSections().catch(() => [] as HymnSection[])
  if (sections.length > 0) {
    const bySlug = new Map<string, HymnCollection>()
    for (const section of sections) {
      const slug = section.collectionSlug
      if (!slug || bySlug.has(slug)) continue
      bySlug.set(slug, {
        id: slug,
        slug,
        title: humanizeSlug(slug),
        titleAmharic: '',
        description: '',
        descriptionAmharic: '',
        imagePath: null,
        imageUrl: '',
        imageAlt: humanizeSlug(slug),
        collectionType: slug.includes('singer') || slug.includes('zemari') ? 'singer_group' : '',
        mezmurCount: counts.get(slug) ?? 0,
        featured: false,
        sortOrder: 0,
        href: `/practice/browse/${slug}`,
      })
    }
    return sortCollections([...bySlug.values()])
  }

  // Final fallback: canonical project collections with accurate counts
  return CANONICAL_MAJOR_COLLECTIONS.map((c) => ({
    ...c,
    mezmurCount: counts.get(c.slug) ?? 0,
  }))
}

/** @deprecated Prefer getHymnCollections */
export async function getMajorHymnGroups(): Promise<HymnCollection[]> {
  return getHymnCollections()
}

/** @deprecated Prefer getHymnCollections */
export async function loadMajorBrowseGroups(): Promise<HymnCollection[]> {
  return getHymnCollections()
}

export async function getHymnCollectionBySlug(slug: string, language?: MezmurLanguageFilter): Promise<HymnCollection | null> {
  const needle = slug.trim()
  if (!needle || !supabase) return null

  if (!isMissing(T.collections)) {
    const { data, error } = await supabase
      .from(T.collections as never)
      .select('*')
      .eq('collection_slug', needle)
      .is('deleted_at', null)
      .limit(1)
    if (!error && data?.[0] && isPublishedStatus((data[0] as Record<string, unknown>).status)) {
      const mapped = mapCollectionFromRow(data[0] as Record<string, unknown>)
      const counts = await collectionCountsFromLinks(undefined, language)
      return { ...mapped, mezmurCount: counts.get(mapped.slug) ?? mapped.mezmurCount }
    }
    if (error && error.code !== 'PGRST116') {
      if (error.code === 'PGRST205') markMissing(T.collections)
      else logSchemaError('getHymnCollectionBySlug', error)
    }
  }

  const groups = await getHymnCollections(language)
  return groups.find((g) => g.slug === needle) || null
}

async function fetchAllSections(): Promise<HymnSection[]> {
  if (!supabase) return []
  if (isMissing(T.sections)) return []
  const { data, error } = await supabase
    .from(T.sections as never)
    .select('*')
    .is('deleted_at', null)
  if (error) {
    logSchemaError('fetchAllSections', error)
    if (error.code === 'PGRST205') markMissing(T.sections)
    throw permissionError(T.sections, error)
  }
  return ((data || []) as SectionImportRow[])
    .filter((row) => isPublishedStatus(row.status))
    .map(mapSectionFromRow)
}

export async function getSectionsForCollection(collectionSlug: string, language?: MezmurLanguageFilter): Promise<HymnSection[]> {
  if (!supabase || !collectionSlug.trim()) return []
  const { data, error } = await supabase
    .from(T.sections as never)
    .select(
      'section_id, section_slug, collection_slug, parent_section_slug, title, title_amharic, description, description_amharic, image_path, image_alt, section_type, source_entity_type, source_entity_slug, sort_order, is_featured, status',
    )
    .eq('collection_slug', collectionSlug.trim())
    .is('deleted_at', null)

  if (isDev) {
    console.log('[hymn sections raw]', collectionSlug, data?.length, error)
  }

  if (error) {
    logSchemaError('getSectionsForCollection', error)
    throw permissionError(T.sections, error)
  }

  const sections = sortSections(
    ((data || []) as SectionImportRow[])
      .filter((row) => isPublishedStatus(row.status))
      .map(mapSectionFromRow),
  )

  const counts = await sectionCountsForCollection(collectionSlug.trim(), sections, language)
  return sections.map((s) => ({ ...s, mezmurCount: counts.get(s.slug) || 0 }))
}

/** @deprecated Prefer getSectionsForCollection */
export async function getHymnSectionsForCollection(
  collectionId: string,
  collectionSlug: string,
): Promise<HymnSection[]> {
  return getSectionsForCollection(collectionSlug || collectionId)
}

export const COLLECTION_TAXONOMY_MAP: Record<
  string,
  {
    categories?: string[]
    occasions?: string[]
  }
> = {
  'holidays-feasts': {
    occasions: [
      'gena',
      'timket',
      'meskel',
      'hosanna',
      'siklet',
      'tinsae',
      'erget',
      'pentecost',
      'debre-tabor',
      'filseta',
      'kidane-mihret',
      'lideta-maryam',
      'new-year',
      'holy-week',
      'annunciation',
      'cross',
      'fasting',
      'abiy-tsom',
      'tsome-nineveh',
      'good-friday',
      'palm-sunday',
      'easter',
      'epiphany',
      'christmas',
    ],
    categories: ['cross', 'holidays-feasts'],
  },
  'angels-saints': {
    categories: [
      'angels-saints',
      'angels',
      'saints',
      'apostles',
      'martyrs',
      'prophets',
      'kidus-michael',
      'kidus-gabriel',
      'kidus-uriel',
      'kidus-raphael',
      'kidus-giorgis',
      'kidist-arsema',
      'abune-tekle-haymanot',
      'abune-gebre-menfes-kidus',
      'kidus-estifanos-saint-stephen',
      'kidus-yared',
      'saint-george',
      'saint-stephen',
      'saint-michael',
      'saint-gabriel',
      'saint-uriel',
      'saint-raphael',
      'saint-arsema',
      'holy-angels',
      'saints-general',
      'qedus-giorgis',
      'kirkos',
      'yared',
    ],
  },
  'virgin-mary': {
    categories: ['virgin-mary', 'mariam'],
    occasions: ['filseta', 'kidane-mihret', 'lideta-maryam', 'mariam', 'virgin-mary', 'annunciation'],
  },
  'jesus-christ': {
    categories: ['jesus-christ', 'christ'],
    occasions: ['hosanna', 'siklet', 'tinsae', 'gena', 'timket', 'debre-tabor', 'good-friday', 'holy-week'],
  },
  'repentance-fasting': {
    categories: ['repentance-fasting', 'repentance'],
    occasions: ['abiy-tsom', 'tsome-nineveh', 'fasting', 'holy-week'],
  },
  'sacraments-church-life': {
    categories: ['sacraments-church-life', 'sacraments', 'church-life'],
    occasions: ['wedding', 'communion', 'baptism', 'funeral'],
  },
  'praise-general': {
    categories: [
      'praise-general',
      'praise-worship',
      'general',
      'wereb',
      'holy-trinity',
      'holy-spirit',
      'prayer',
      'holy-cross',
    ],
    occasions: ['general'],
  },
  'english-mezmur': {
    categories: ['english-mezmur', 'english-language', 'bilingual-language'],
  },
}

export async function getHymnSection(
  collectionSlugOrId: string,
  sectionSlug: string,
  language?: MezmurLanguageFilter,
): Promise<HymnSection | null> {
  const collectionSlug = collectionSlugOrId.trim()
  const slug = sectionSlug.trim()
  if (!supabase || !collectionSlug || !slug) return null

  const { data, error } = await supabase
    .from(T.sections as never)
    .select('*')
    .eq('collection_slug', collectionSlug)
    .eq('section_slug', slug)
    .is('deleted_at', null)
    .limit(1)

  if (error) {
    logSchemaError('getHymnSection', error)
    throw permissionError(T.sections, error)
  }
  const row = (data || [])[0] as SectionImportRow | undefined
  if (!row || !isPublishedStatus(row.status)) return null
  const mapped = mapSectionFromRow(row)
  const counts = await sectionCountsForCollection(collectionSlug, [mapped], language)
  return { ...mapped, mezmurCount: counts.get(mapped.slug) || 0 }
}

export function getCandidateTaxonomySlugs(
  sectionSlug: string,
  section?: HymnSection | null,
): { cats: string[]; occs: string[] } {
  const cats = new Set<string>()
  const occs = new Set<string>()

  if (section?.sourceEntityType === 'occasion' && section.sourceEntitySlug) {
    occs.add(section.sourceEntitySlug)
  }
  if (section?.sourceEntityType === 'category' && section.sourceEntitySlug) {
    cats.add(section.sourceEntitySlug)
  }
  if (sectionSlug) {
    occs.add(sectionSlug)
    cats.add(sectionSlug)
    const stripped = sectionSlug.replace(/^(holidays|virgin-mary|christ|saint|abune)-/, '')
    if (stripped !== sectionSlug) {
      occs.add(stripped)
      cats.add(stripped)
    }

    const aliasMap: Record<string, { cats?: string[]; occs?: string[] }> = {
      'saint-michael': { cats: ['kidus-michael', 'saint-michael', 'st-michael', 'michael'] },
      'kidus-michael': { cats: ['kidus-michael', 'saint-michael', 'st-michael', 'michael'] },
      'saint-gabriel': { cats: ['kidus-gabriel', 'saint-gabriel', 'st-gabriel', 'gabriel'] },
      'kidus-gabriel': { cats: ['kidus-gabriel', 'saint-gabriel', 'st-gabriel', 'gabriel'] },
      'saint-uriel': { cats: ['kidus-uriel', 'qedus-urael', 'saint-uriel', 'uriel'] },
      'kidus-uriel': { cats: ['kidus-uriel', 'qedus-urael', 'saint-uriel', 'uriel'] },
      'saint-raphael': { cats: ['kidus-raphael', 'qedus-raphael', 'saint-raphael', 'raphael'] },
      'kidus-raphael': { cats: ['kidus-raphael', 'qedus-raphael', 'saint-raphael', 'raphael'] },
      'saint-george': { cats: ['kidus-giorgis', 'qedus-giorgis', 'saint-george', 'george'] },
      'kidus-giorgis': { cats: ['kidus-giorgis', 'qedus-giorgis', 'saint-george', 'george'] },
      'saint-arsema': { cats: ['kidist-arsema', 'qedist-arsema', 'saint-arsema', 'arsema'] },
      'kidist-arsema': { cats: ['kidist-arsema', 'qedist-arsema', 'saint-arsema', 'arsema'] },
      'saint-stephen': { cats: ['kidus-estifanos-saint-stephen', 'saint-stephen', 'stephen'] },
      'saint-yared': { cats: ['kidus-yared', 'saint-yared', 'yared'] },
      'holy-angels': { cats: ['angels', 'holy-angels'] },
      'christ-hymns': { cats: ['jesus-christ', 'christ'] },
      'christ-gena': { occs: ['gena'] },
      'christ-timket': { occs: ['timket'] },
      'christ-hosanna': { occs: ['hosanna'] },
      'christ-tinsae': { occs: ['tinsae'] },
      'christ-debre-tabor': { occs: ['debre-tabor'] },
      'christ-passion-crucifixion': { occs: ['siklet', 'good-friday'] },
      'holidays-gena': { occs: ['gena'] },
      'holidays-timket': { occs: ['timket'] },
      'holidays-meskel': { occs: ['meskel', 'cross'], cats: ['cross'] },
      'holidays-hosanna': { occs: ['hosanna'] },
      'holidays-tinsae': { occs: ['tinsae', 'easter'] },
      'holidays-siklet': { occs: ['siklet', 'good-friday'] },
      'holidays-good-friday': { occs: ['siklet', 'good-friday'] },
      'holidays-filseta': { occs: ['filseta'] },
      'holidays-kidane-mihret': { occs: ['kidane-mihret'] },
      'holidays-lideta-maryam': { occs: ['lideta-maryam'] },
      'holidays-annunciation': { occs: ['annunciation'] },
      'holidays-pentecost': { occs: ['pentecost'] },
      'virgin-mary-hymns': { cats: ['virgin-mary', 'mariam'] },
      'virgin-mary-filseta': { occs: ['filseta'] },
      'virgin-mary-kidane-mihret': { occs: ['kidane-mihret'] },
      'virgin-mary-lideta': { occs: ['lideta-maryam'] },
      'virgin-mary-annunciation': { occs: ['annunciation'] },
      'general-fasting': { occs: ['abiy-tsom', 'tsome-nineveh', 'fasting'] },
      'repentance': { cats: ['repentance-fasting', 'repentance'], occs: ['repentance'] },
      'english-language': { cats: ['english-mezmur', 'english-language'] },
      'bilingual-language': { cats: ['english-mezmur', 'bilingual-language'] },
    }

    const match = aliasMap[sectionSlug] || aliasMap[stripped]
    if (match) {
      if (match.cats) for (const c of match.cats) cats.add(c)
      if (match.occs) for (const o of match.occs) occs.add(o)
    }
  }

  return { cats: Array.from(cats), occs: Array.from(occs) }
}

async function fetchLinksForSection(
  _collectionSlug: string,
  sectionSlug: string,
  section?: HymnSection | null,
): Promise<LinkImportRow[]> {
  if (!supabase) return []

  const { cats, occs } = getCandidateTaxonomySlugs(sectionSlug, section)

  const promises: PromiseLike<unknown>[] = [
    supabase
      .from(T.links as never)
      .select('section_slug, mezmur_slug, sort_order')
      .eq('section_slug', sectionSlug)
      .limit(5000),
  ]

  if (occs.length > 0) {
    promises.push(
      supabase
        .from(T.occasions as never)
        .select('occasion_slug, mezmur_import_id, mezmur_slug')
        .in('occasion_slug', occs)
        .limit(5000),
    )
  }

  if (cats.length > 0) {
    promises.push(
      supabase
        .from(T.categories as never)
        .select('category_slug, mezmur_import_id, mezmur_slug')
        .in('category_slug', cats)
        .limit(5000),
    )
  }

  const results = await Promise.all(promises)
  const rows: LinkImportRow[] = []
  const seenMezmur = new Set<string>()

  for (const res of results) {
    const { data, error } = res as { data?: LinkImportRow[]; error?: unknown }
    if (error || !data) continue
    for (const r of data) {
      const mezmurKey = txt(r.mezmur_slug) || txt(r.mezmur_import_id) || txt(r.mezmur_id)
      if (mezmurKey && !seenMezmur.has(mezmurKey)) {
        seenMezmur.add(mezmurKey)
        rows.push(r)
      }
    }
  }

  return rows
}

export async function fetchAllCategoryLinks(): Promise<
  Array<{ mezmur_import_id: string; mezmur_id?: string | null; mezmur_slug: string; category_slug: string }>
> {
  if (!supabase || isMissing(T.categories)) return []
  try {
    return await collectPagedRows(async (from, to) => {
      const { data, error } = await supabase!
        .from(T.categories as never)
        .select('mezmur_import_id, mezmur_id, mezmur_slug, category_slug')
        .range(from, to)
      if (error) {
        if (error.code === 'PGRST205' || /Could not find the table/i.test(error.message || '')) {
          markMissing(T.categories)
        }
        logSchemaError('fetchAllCategoryLinks', error)
        return []
      }
      return (data || []) as Array<{ mezmur_import_id: string; mezmur_id?: string | null; mezmur_slug: string; category_slug: string }>
    }, { pageSize: 1000 })
  } catch (err) {
    logSchemaError('fetchAllCategoryLinks', err as { message?: string })
    return []
  }
}

export async function fetchAllOccasionLinks(): Promise<
  Array<{ mezmur_import_id: string; mezmur_id?: string | null; mezmur_slug: string; occasion_slug: string }>
> {
  if (!supabase || isMissing(T.occasions)) return []
  try {
    return await collectPagedRows(async (from, to) => {
      const { data, error } = await supabase!
        .from(T.occasions as never)
        .select('mezmur_import_id, mezmur_id, mezmur_slug, occasion_slug')
        .range(from, to)
      if (error) {
        if (error.code === 'PGRST205' || /Could not find the table/i.test(error.message || '')) {
          markMissing(T.occasions)
        }
        logSchemaError('fetchAllOccasionLinks', error)
        return []
      }
      return (data || []) as Array<{ mezmur_import_id: string; mezmur_id?: string | null; mezmur_slug: string; occasion_slug: string }>
    }, { pageSize: 1000 })
  } catch (err) {
    logSchemaError('fetchAllOccasionLinks', err as { message?: string })
    return []
  }
}

async function sectionCountsForCollection(
  _collectionSlug: string,
  sections: HymnSection[],
  language?: MezmurLanguageFilter,
): Promise<Map<string, number>> {
  const map = new Map<string, number>()
  if (!supabase || !sections.length) return map

  // Query published Mezmurs in active language (mezmur_public already filters deleted_at is null)
  let pubQuery = supabase
    .from(T.data as never)
    .select('mezmur_id, slug, primary_language, status')
    .eq('status', 'published')
    .limit(50000)

  const langFilter = language && language !== 'all' ? language : null
  if (langFilter) {
    pubQuery = pubQuery.in('primary_language', mezmurLanguageAliases(langFilter))
  }

  const { data: pubData, error: pubErr } = await pubQuery
  if (pubErr) {
    logSchemaError('sectionCountsForCollection published mezmurs', pubErr)
    return map
  }

  const publishedSlugs = new Set<string>()
  const publishedIds = new Set<string>()
  for (const row of (pubData || []) as DataImportRow[]) {
    const slug = txt(row.slug)
    const id = txt(row.mezmur_id)
    if (isPublicMezmurRow(row)) {
      if (slug) publishedSlugs.add(slug)
      if (id) publishedIds.add(id)
    }
  }

  const sectionSlugs = sections.map((s) => s.slug).filter(Boolean)
  const occSlugs = new Set<string>()
  const catSlugs = new Set<string>()

  for (const s of sections) {
    const { cats, occs } = getCandidateTaxonomySlugs(s.slug, s)
    for (const c of cats) catSlugs.add(c)
    for (const o of occs) occSlugs.add(o)
  }

  const [secLinks, occLinks, catLinks] = await Promise.all([
    collectPagedRows<LinkImportRow>(async (from, to) => {
      const { data, error } = await supabase!
        .from(T.links as never)
        .select('section_slug, mezmur_slug')
        .in('section_slug', sectionSlugs)
        .range(from, to)
      if (error) return []
      return (data || []) as LinkImportRow[]
    }, { pageSize: 1000 }),
    occSlugs.size > 0 ? fetchAllOccasionLinks() : Promise.resolve([]),
    catSlugs.size > 0 ? fetchAllCategoryLinks() : Promise.resolve([]),
  ])

  for (const s of sections) {
    const distinct = new Set<string>()
    const { cats: catCandidates, occs: occCandidates } = getCandidateTaxonomySlugs(s.slug, s)

    for (const l of secLinks) {
      const ms = txt(l.mezmur_slug)
      if (l.section_slug === s.slug && ms && publishedSlugs.has(ms)) {
        distinct.add(ms)
      }
    }
    for (const l of occLinks) {
      const ms = txt(l.mezmur_slug)
      const os = txt(l.occasion_slug)
      const mezmurKey = ms || txt(l.mezmur_import_id) || txt(l.mezmur_id)
      const isPub = (ms && publishedSlugs.has(ms)) || (txt(l.mezmur_id) && publishedIds.has(txt(l.mezmur_id)))
      if (os && occCandidates.includes(os) && mezmurKey && isPub) {
        distinct.add(mezmurKey)
      }
    }
    for (const l of catLinks) {
      const ms = txt(l.mezmur_slug)
      const cs = txt(l.category_slug)
      const mezmurKey = ms || txt(l.mezmur_import_id) || txt(l.mezmur_id)
      const isPub = (ms && publishedSlugs.has(ms)) || (txt(l.mezmur_id) && publishedIds.has(txt(l.mezmur_id)))
      if (cs && catCandidates.includes(cs) && mezmurKey && isPub) {
        distinct.add(mezmurKey)
      }
    }
    map.set(s.slug, distinct.size)
  }

  return map
}

async function collectionCountsFromLinks(
  sections?: HymnSection[],
  language?: MezmurLanguageFilter,
): Promise<Map<string, number>> {
  const map = new Map<string, number>()
  if (!supabase) return map

  try {
    const allSections = sections || (await fetchAllSections().catch(() => [] as HymnSection[]))

    const sectionToCollection = new Map<string, string>()
    for (const s of allSections) {
      sectionToCollection.set(`${s.collectionSlug}::${s.slug}`, s.collectionSlug)
      sectionToCollection.set(s.slug, s.collectionSlug)
    }

    // Query published Mezmurs in active language (mezmur_public already filters deleted_at is null)
    let query = supabase
      .from(T.data as never)
      .select('mezmur_id, slug, primary_language, singer_name, zemari_id, singer_slug, status')
      .eq('status', 'published')
      .limit(50000)

    const langFilter = language && language !== 'all' ? language : null
    if (langFilter) {
      query = query.in('primary_language', mezmurLanguageAliases(langFilter))
    }

    const { data: pubData, error: pubErr } = await query
    if (pubErr) {
      logSchemaError('collectionCountsFromLinks published mezmurs', pubErr)
      return map
    }

    const publishedRows = (pubData || []) as DataImportRow[]
    const publishedSlugs = new Set<string>()
    const publishedIds = new Set<string>()
    const distinct = new Map<string, Set<string>>()

    for (const col of Object.keys(COLLECTION_TAXONOMY_MAP)) {
      distinct.set(col, new Set())
    }
    distinct.set('zemari-singers', new Set())

    for (const row of publishedRows) {
      const slug = txt(row.slug)
      const id = txt(row.mezmur_id) || slug
      if (slug && isPublicMezmurRow(row)) {
        publishedSlugs.add(slug)
        if (txt(row.mezmur_id)) publishedIds.add(txt(row.mezmur_id))
        if (txt(row.singer_name) || txt(row.zemari_id) || txt(row.singer_slug)) {
          distinct.get('zemari-singers')!.add(id)
        }
        const pl = (txt(row.primary_language) || '').toLowerCase()
        if (['en', 'eng', 'english'].includes(pl) || normalizeMezmurLanguage(pl) === 'en') {
          distinct.get('english-mezmur')!.add(id)
        }
      }
    }

    const [linkRows, catLinks, occLinks] = await Promise.all([
      collectPagedRows<LinkImportRow>(async (from, to) => {
        const { data, error } = await supabase!
          .from(T.links as never)
          .select('section_slug, mezmur_slug')
          .range(from, to)
        if (error) return []
        return (data || []) as LinkImportRow[]
      }, { pageSize: 1000 }),
      fetchAllCategoryLinks(),
      fetchAllOccasionLinks(),
    ])

    // 1. Process Section Links
    for (const row of linkRows) {
      const sectionSlug = txt(row.section_slug)
      const mezmurSlug = txt(row.mezmur_slug)
      if (!sectionSlug || !mezmurSlug || !publishedSlugs.has(mezmurSlug)) continue

      const collectionSlug = sectionToCollection.get(sectionSlug)
      if (!collectionSlug) continue

      if (!distinct.has(collectionSlug)) distinct.set(collectionSlug, new Set())
      distinct.get(collectionSlug)!.add(mezmurSlug)
    }

    // 2. Process Category Links using Taxonomy Map
    for (const row of catLinks) {
      const catSlug = txt(row.category_slug)
      const mezmurSlug = txt(row.mezmur_slug)
      const mezmurUuid = txt(row.mezmur_import_id) || txt(row.mezmur_id) || mezmurSlug
      if (!catSlug || !mezmurSlug || !publishedSlugs.has(mezmurSlug)) continue

      for (const [colSlug, tax] of Object.entries(COLLECTION_TAXONOMY_MAP)) {
        if (tax.categories && tax.categories.includes(catSlug)) {
          distinct.get(colSlug)!.add(mezmurUuid)
        }
      }
    }

    // 3. Process Occasion Links using Taxonomy Map
    for (const row of occLinks) {
      const occSlug = txt(row.occasion_slug)
      const mezmurSlug = txt(row.mezmur_slug)
      const mezmurUuid = txt(row.mezmur_import_id) || txt(row.mezmur_id) || mezmurSlug
      if (!occSlug || !mezmurSlug || !publishedSlugs.has(mezmurSlug)) continue

      for (const [colSlug, tax] of Object.entries(COLLECTION_TAXONOMY_MAP)) {
        if (tax.occasions && tax.occasions.includes(occSlug)) {
          distinct.get(colSlug)!.add(mezmurUuid)
        }
      }
    }

    for (const [id, set] of distinct) {
      map.set(id, set.size)
    }
  } catch (cause) {
    if (isDev) console.error('[collectionCountsFromLinks]', cause)
  }

  return map
}

export async function getMezmursForSection(
  collectionSlugOrSectionId: string,
  sectionSlugOrOptions?:
    | string
    | { q?: string; page?: number; pageSize?: number; language?: MezmurLanguageFilter },
  maybeOptions?: { q?: string; page?: number; pageSize?: number; language?: MezmurLanguageFilter },
): Promise<{ items: HymnSectionMezmur[]; total: number; page: number }> {
  // Support both (collectionSlug, sectionSlug, opts) and legacy (sectionId, opts).
  let collectionSlug = ''
  let sectionSlug = ''
  let options: { q?: string; page?: number; pageSize?: number; language?: MezmurLanguageFilter } = {}

  if (typeof sectionSlugOrOptions === 'string') {
    collectionSlug = collectionSlugOrSectionId
    sectionSlug = sectionSlugOrOptions
    options = maybeOptions || {}
  } else {
    // Legacy: first arg was section id — treat as section slug only (no collection).
    sectionSlug = collectionSlugOrSectionId
    options = sectionSlugOrOptions || {}
  }

  if (!supabase || !sectionSlug.trim()) return { items: [], total: 0, page: 1 }

  const page = Math.max(1, options.page || 1)
  const pageSize = Math.min(100, Math.max(1, options.pageSize || 12))
  const from = (page - 1) * pageSize
  const to = from + pageSize - 1
  const q = (options.q || '').trim().toLowerCase()

  let section: HymnSection | null = null
  if (collectionSlug) {
    section = await getHymnSection(collectionSlug, sectionSlug, options.language).catch(() => null)
  }

  const links = await fetchLinksForSection(collectionSlug, sectionSlug.trim(), section)
  if (!links.length) return { items: [], total: 0, page }

  // Deduplicate links deterministically by slug or import UUID
  const seenLinkKeys = new Set<string>()
  const ordered: LinkImportRow[] = []
  for (const l of [...links].sort((a, b) => num(a.sort_order) - num(b.sort_order))) {
    const slug = txt(l.mezmur_slug)
    const key = slug || txt(l.mezmur_import_id) || txt(l.mezmur_id)
    if (key && !seenLinkKeys.has(key)) {
      seenLinkKeys.add(key)
      ordered.push(l)
    }
  }

  const slugs = ordered.map((l) => txt(l.mezmur_slug)).filter(Boolean)
  if (!slugs.length) return { items: [], total: 0, page }

  // Chunk .in() to avoid URL limits
  const bySlug = new Map<string, DataImportRow>()
  const chunkSize = 80
  for (let i = 0; i < slugs.length; i += chunkSize) {
    const chunk = slugs.slice(i, i + chunkSize)
    const { data, error } = await supabase.from(T.data as never).select('*').in('slug', chunk)
    if (error) {
      logSchemaError('getMezmursForSection data', error)
      throw permissionError(T.data, error)
    }
    for (const row of (data || []) as DataImportRow[]) {
      const slug = txt(row.slug)
      if (slug && isPublicMezmurRow(row)) bySlug.set(slug, row)
    }
  }

  let items: HymnSectionMezmur[] = []
  for (const link of ordered) {
    const slug = txt(link.mezmur_slug)
    const row = bySlug.get(slug)
    if (!row) continue
    const item = mapDataCard(row, num(link.sort_order))
    if (options.language && (options.language as string) !== 'all' && normalizeMezmurLanguage(item.language) !== options.language) continue
    if (q) {
      const hay =
        `${item.title} ${item.titleAmharic} ${item.titleEnglish} ${item.singerName || ''}`.toLowerCase()
      if (!hay.includes(q)) continue
    }
    items.push(item)
  }

  const total = items.length
  items = items.slice(from, to + 1)
  return { items, total, page }
}

export async function getMezmurBySlug(slug: string): Promise<ImportMezmurDetail | null> {
  if (!supabase || !slug.trim()) return null
  const trimmed = slug.trim()
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(trimmed)

  let row: DataImportRow | undefined
  const { data, error } = await supabase
    .from(T.data as never)
    .select('*')
    .eq('slug', trimmed)
    // A public slug is a route key, not an identity key. Fetch one extra row so
    // a legacy collision cannot silently open whichever row PostgREST returns.
    .limit(2)

  if (error) {
    logSchemaError('getMezmurBySlug', error)
    throw permissionError(T.data, error)
  }
  const matchingSlugRows = (data || []) as DataImportRow[]
  if (matchingSlugRows.length > 1) {
    throw new Error(
      'This hymn route is ambiguous because multiple published records share this slug. It cannot be selected safely until the slug collision is resolved.',
    )
  }
  row = matchingSlugRows[0]

  if (!row && isUuid) {
    const { data: idData } = await supabase
      .from(T.data as never)
      .select('*')
      .eq('mezmur_id', trimmed)
      .limit(2)
    const matchingLegacyIdRows = (idData || []) as DataImportRow[]
    if (matchingLegacyIdRows.length > 1) {
      throw new Error(
        'This hymn route is ambiguous because its legacy identifier matches multiple published records. It cannot be selected safely until the collision is resolved.',
      )
    }
    row = matchingLegacyIdRows[0]

    if (!row) {
      const [catMatch, occMatch] = await Promise.all([
        supabase.from(T.categories as never).select('mezmur_slug').eq('mezmur_import_id', trimmed).limit(1),
        supabase.from(T.occasions as never).select('mezmur_slug').eq('mezmur_import_id', trimmed).limit(1),
      ])
      const matchedSlug =
        (catMatch.data?.[0] as { mezmur_slug?: string } | undefined)?.mezmur_slug ||
        (occMatch.data?.[0] as { mezmur_slug?: string } | undefined)?.mezmur_slug
      if (matchedSlug) {
        const { data: slugData } = await supabase
          .from(T.data as never)
          .select('*')
          .eq('slug', matchedSlug)
          .limit(2)
        const matchingLinkedSlugRows = (slugData || []) as DataImportRow[]
        if (matchingLinkedSlugRows.length > 1) {
          throw new Error(
            'This hymn route is ambiguous because a linked legacy slug matches multiple published records. It cannot be selected safely until the slug collision is resolved.',
          )
        }
        row = matchingLinkedSlugRows[0]
      }
    }
  }

  if (!row || !isPublicMezmurRow(row)) return null

  const occasions = await getOccasionsForMezmur(txt(row.slug)).catch(() => [] as string[])
  const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null

  let lyricsAmharic = txt(row.lyrics_amharic) || null
  let lyricsTransliteration = txt(row.lyrics_transliteration) || null
  let lyricsEnglish = txt(row.lyrics_english) || null
  let lyricsGeez = txt(row.lyrics_geez) || null
  let lyricsOromo = txt(row.lyrics_oromo) || null

  // Fallback to get_public_mezmur_lyrics RPC if view returned redacted lyrics
  if (!lyricsAmharic && !lyricsGeez && !lyricsEnglish && !lyricsOromo) {
    try {
      const rpcResult = await (supabase.rpc as unknown as (name: string, params: Record<string, unknown>) => Promise<{ data: unknown; error: unknown }>)(
        'get_public_mezmur_lyrics',
        { p_slug: slug.trim() }
      )
      const rpcRow = Array.isArray(rpcResult.data)
        ? (rpcResult.data[0] as Record<string, unknown> | undefined)
        : (rpcResult.data as Record<string, unknown> | undefined)
      if (rpcRow) {
        if (rpcRow.lyrics_amharic) lyricsAmharic = txt(rpcRow.lyrics_amharic) || null
        if (rpcRow.lyrics_transliteration) lyricsTransliteration = txt(rpcRow.lyrics_transliteration) || null
        if (rpcRow.lyrics_english) lyricsEnglish = txt(rpcRow.lyrics_english) || null
        if (rpcRow.lyrics_geez) lyricsGeez = txt(rpcRow.lyrics_geez) || null
        if (rpcRow.lyrics_oromo) lyricsOromo = txt(rpcRow.lyrics_oromo) || null
      }
    } catch {
      // Ignore if RPC is not present
    }
  }

  return {
    id: txt(row.mezmur_id || row.slug),
    mezmur_id: txt(row.mezmur_id || row.slug),
    slug: txt(row.slug),
    title: txt(row.title),
    title_amharic: txt(row.title_amharic) || null,
    title_english: txt(row.title_english) || null,
    description: txt(row.description) || null,
    description_amharic: txt(row.description_amharic) || null,
    lyrics_amharic: lyricsAmharic,
    lyrics_transliteration: lyricsTransliteration,
    lyrics_english: lyricsEnglish,
    lyrics_geez: lyricsGeez,
    lyrics_oromo: lyricsOromo,
    primary_language: txt(row.primary_language) || null,
    language: txt(row.primary_language) || null,
    form: txt(row.form) || null,
    singer_id: txt(row.singer_id) || null,
    singer_slug: txt(row.singer_slug) || null,
    singer_name: txt(row.singer_name) || null,
    zemari_id: txt(row.zemari_id) || null,
    youtube_url: txt(row.youtube_url) || null,
    audio_url: txt(row.audio_url) || null,
    image_path: image,
    image_alt: txt(row.image_alt) || null,
    legacy_thumbnail_url: txt(row.legacy_thumbnail_url) || null,
    thumbnail_url: image,
    search_keywords: parseKeywords(row.search_keywords),
    status: txt(row.status) || null,
    review_status: txt(row.review_status) || null,
    review_notes: txt(row.review_notes) || null,
    source_url: txt(row.source_url) || null,
    source_notes: txt(row.source_notes) || null,
    rights_status: txt(row.rights_status) || 'owned',
    has_stored_lyrics: row.has_stored_lyrics !== undefined ? Boolean(row.has_stored_lyrics) : null,
    occasion_slugs: occasions,
  }
}

export async function getOccasionsForMezmur(mezmurSlug: string): Promise<string[]> {
  if (!supabase || !mezmurSlug.trim() || isMissing(T.occasions)) return []
  const { data, error } = await supabase
    .from(T.occasions as never)
    .select('*')
    .eq('mezmur_slug', mezmurSlug.trim())
  if (error) {
    if (error.code === 'PGRST205') markMissing(T.occasions)
    logSchemaError('getOccasionsForMezmur', error)
    return []
  }
  return [...new Set(((data || []) as LinkImportRow[]).map((r) => txt(r.occasion_slug)).filter(Boolean))]
}

export async function getHymnSingers(language?: MezmurLanguageFilter): Promise<HymnBrowseCard[]> {
  if (!supabase) return []

  // Canonical profile source: public.zemaris (+ counts view). Never derive profile from singer_*.
  const viewRes = (zemariCountsViewLacksTrashMetadata || zemariCountsViewPermissionDenied)
    ? { data: null, error: null }
    : await supabase
        .from('zemaris_with_counts' as never)
        .select(
          'id, slug, name, name_amharic, bio, image_path, image_alt, youtube_url, sort_order, is_featured, status, published_mezmur_count, mezmur_count, updated_at',
        )
        .eq('status', 'published')
        .is('deleted_at', null)
        .order('is_featured', { ascending: false })
        .order('sort_order')
        .order('name')

  let rows: Record<string, unknown>[] = []
  if (!viewRes.error && viewRes.data) {
    rows = (viewRes.data || []) as Record<string, unknown>[]
  } else {
    if (isZemariCountsTrashColumnError(viewRes.error)) zemariCountsViewLacksTrashMetadata = true
    if (viewRes.error?.code === '42501' || /permission denied/i.test(viewRes.error?.message || '')) {
      zemariCountsViewPermissionDenied = true
    } else if (viewRes.error && !/zemaris_with_counts|PGRST205|Could not find/i.test(viewRes.error.message || '')) {
      logSchemaError('getHymnSingers zemaris_with_counts', viewRes.error)
    }
    const plain = await supabase
      .from('zemaris' as never)
      .select(
        'id, slug, name, name_amharic, bio, image_path, image_alt, youtube_url, sort_order, is_featured, status, updated_at',
      )
      .eq('status', 'published')
      .is('deleted_at', null)
      .order('is_featured', { ascending: false })
      .order('sort_order')
      .order('name')
    if (plain.error) {
      logSchemaError('getHymnSingers zemaris', plain.error)
      throw permissionError('zemaris', plain.error)
    }
    rows = (plain.data || []) as Record<string, unknown>[]
  }

  const countByZemari = new Map<string, number>()
  const langFilter = language && language !== 'all' ? language : null
  let singerQuery = supabase
    .from(T.data as never)
    .select('zemari_id, singer_slug, status, primary_language')
    .eq('status', 'published')
    .limit(50000)

  if (langFilter) {
    singerQuery = singerQuery.in('primary_language', mezmurLanguageAliases(langFilter))
  }

  const linked = await singerQuery
  if (!linked.error) {
    for (const row of (linked.data || []) as Array<{ zemari_id?: string; singer_slug?: string; status?: string }>) {
      if (!isPublishedStatus(row.status)) continue
      const id = txt(row.zemari_id)
      if (id) countByZemari.set(id, (countByZemari.get(id) || 0) + 1)
      const sSlug = txt(row.singer_slug)
      if (sSlug) countByZemari.set(sSlug, (countByZemari.get(sSlug) || 0) + 1)
    }
  } else {
    logSchemaError('getHymnSingers count', linked.error)
  }

  return sortCards(
    rows
      .map((row) => {
        const id = txt(row.id)
        const slug = txt(row.slug)
        const name = txt(row.name) || humanizeSlug(slug)
        const path = txt(row.image_path) || null
        const fromView = num(row.published_mezmur_count)
        const repaired = (id ? countByZemari.get(id) : 0) || (slug ? countByZemari.get(slug) : 0) || 0
        const mezmurCount = repaired > 0 ? repaired : (langFilter ? 0 : fromView)
        const updated = txt(row.updated_at)
        const imageUrl = mediaUrl(path)
        return {
          kind: 'singer' as const,
          id: id || slug,
          slug,
          name,
          nameAmharic: txt(row.name_amharic),
          description: txt(row.bio),
          imagePath: path,
          // Bust CDN/browser cache when image_path is reused after replace.
          imageUrl: imageUrl && updated ? `${imageUrl}${imageUrl.includes('?') ? '&' : '?'}v=${encodeURIComponent(updated)}` : imageUrl,
          imageAlt: txt(row.image_alt) || name,
          mezmurCount,
          featured: truthy(row.is_featured),
          sortOrder: num(row.sort_order),
          href: `/practice/zemari/${slug}`,
          socialLinks: { youtube: txt(row.youtube_url) || null },
        }
      })
      .filter((card) => card.mezmurCount > 0),
  )
}

/** Public Zemari detail: profile from public.zemaris by slug (not singer_*). */
export async function getZemariPublicBySlug(slug: string): Promise<HymnBrowseCard | null> {
  if (!supabase || !slug.trim()) return null
  const needle = slug.trim()

  const viewRes = zemariCountsViewLacksTrashMetadata
    ? { data: null, error: null }
    : await supabase
        .from('zemaris_with_counts' as never)
        .select(
          'id, slug, name, name_amharic, bio, image_path, image_alt, youtube_url, sort_order, is_featured, status, published_mezmur_count, updated_at',
        )
        .eq('slug', needle)
        .eq('status', 'published')
        .is('deleted_at', null)
        .limit(1)

  if (isZemariCountsTrashColumnError(viewRes.error)) zemariCountsViewLacksTrashMetadata = true

  let row = !viewRes.error
    ? ((viewRes.data || [])[0] as Record<string, unknown> | undefined)
    : undefined
  if (!row) {
    const plain = await supabase
      .from('zemaris' as never)
      .select(
        'id, slug, name, name_amharic, bio, image_path, image_alt, youtube_url, sort_order, is_featured, status, updated_at',
      )
      .eq('slug', needle)
      .eq('status', 'published')
      .is('deleted_at', null)
      .limit(1)
    if (plain.error) {
      logSchemaError('getZemariPublicBySlug', plain.error)
      return null
    }
    row = (plain.data || [])[0] as Record<string, unknown> | undefined
  }
  if (!row) return null

  const id = txt(row.id)
  let mezmurCount = num(row.published_mezmur_count)
  if (mezmurCount <= 0 && id) {
    const linked = await supabase
      .from(T.data as never)
      .select('status')
      .eq('zemari_id', id)
      .limit(5000)
    if (!linked.error) {
      mezmurCount = ((linked.data || []) as Array<{ status?: string }>).filter((r) =>
        isPublishedStatus(r.status),
      ).length
    }
  }

  const name = txt(row.name) || humanizeSlug(txt(row.slug))
  const path = txt(row.image_path) || null
  const imageUrl = mediaUrl(path)
  const updated = txt(row.updated_at)
  return {
    kind: 'singer',
    id: id || txt(row.slug),
    slug: txt(row.slug),
    name,
    nameAmharic: txt(row.name_amharic),
    description: txt(row.bio),
    imagePath: path,
    imageUrl:
      imageUrl && updated
        ? `${imageUrl}${imageUrl.includes('?') ? '&' : '?'}v=${encodeURIComponent(updated)}`
        : imageUrl,
    imageAlt: txt(row.image_alt) || name,
    mezmurCount,
    featured: truthy(row.is_featured),
    sortOrder: num(row.sort_order),
    href: `/practice/zemari/${txt(row.slug)}`,
    socialLinks: { youtube: txt(row.youtube_url) || null },
  }
}

/** Published public Mezmurs linked to a Zemari via mezmur_public.zemari_id only. */
export async function listPublishedMezmursForZemari(zemariId: string): Promise<
  Array<{
    id: string
    slug: string
    title: string
    title_amharic: string | null
    thumbnail_url: string | null
    youtube_url: string | null
    singer_name: string | null
    language: string | null
    form: string | null
  }>
> {
  if (!supabase || !zemariId.trim()) return []
  const { data, error } = await supabase
    .from(T.data as never)
    .select(
      'mezmur_id, slug, title, title_amharic, image_path, legacy_thumbnail_url, youtube_url, singer_name, primary_language, form, status',
    )
    .eq('zemari_id', zemariId.trim())
    .order('title')
    .limit(1000)
  if (error) {
    logSchemaError('listPublishedMezmursForZemari', error)
    throw permissionError(T.data, error)
  }
  return ((data || []) as Record<string, unknown>[])
    .filter((row) => isPublicMezmurRow(row))
    .map((row) => {
      const path = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null
      return {
        id: txt(row.mezmur_id) || txt(row.slug),
        slug: txt(row.slug),
        title: txt(row.title) || txt(row.slug),
        title_amharic: txt(row.title_amharic) || null,
        thumbnail_url: path,
        youtube_url: txt(row.youtube_url) || null,
        singer_name: txt(row.singer_name) || null,
        language: txt(row.primary_language) || null,
        form: txt(row.form) || null,
      }
    })
}

export async function getHymnOccasions(language?: MezmurLanguageFilter): Promise<HymnBrowseCard[]> {
  if (!supabase || isMissing(T.occasions)) return []
  const [occLinks, pubRows] = await Promise.all([
    fetchAllOccasionLinks(),
    selectAllImportRows('mezmur_id, slug, primary_language, status', {
      language: language && language !== 'all' ? language : undefined,
    }),
  ])
  const publishedSlugs = new Set<string>()
  const publishedIds = new Set<string>()
  for (const r of pubRows) {
    const slug = txt(r.slug)
    const id = txt(r.mezmur_id)
    if (isPublicMezmurRow(r)) {
      if (slug) publishedSlugs.add(slug)
      if (id) publishedIds.add(id)
    }
  }
  const distinct = new Map<string, Set<string>>()
  for (const row of occLinks) {
    const slug = txt(row.occasion_slug)
    const mezmurSlug = txt(row.mezmur_slug)
    const mezmurUuid = txt(row.mezmur_import_id) || txt(row.mezmur_id) || mezmurSlug
    const isPub = (txt(row.mezmur_id) && publishedIds.has(txt(row.mezmur_id))) || (mezmurSlug && publishedSlugs.has(mezmurSlug))
    if (!slug || !mezmurSlug || !isPub) continue
    if (!distinct.has(slug)) distinct.set(slug, new Set())
    distinct.get(slug)!.add(mezmurUuid)
  }
  return sortCards(
    [...distinct.entries()]
      .filter(([, set]) => set.size > 0)
      .map(([slug, set]) => ({
        kind: 'occasion' as const,
        id: slug,
        slug,
        name: humanizeSlug(slug),
        nameAmharic: '',
        description: '',
        imagePath: null,
        imageUrl: '',
        imageAlt: humanizeSlug(slug),
        mezmurCount: set.size,
        featured: false,
        sortOrder: 0,
        href: `/practice/occasion/${slug}`,
      })),
  )
}

export async function getHymnCategories(language?: MezmurLanguageFilter): Promise<HymnBrowseCard[]> {
  if (!supabase || isMissing(T.categories)) return []
  const [catLinks, pubRows] = await Promise.all([
    fetchAllCategoryLinks(),
    selectAllImportRows('mezmur_id, slug, primary_language, status', {
      language: language && language !== 'all' ? language : undefined,
    }),
  ])
  const publishedSlugs = new Set<string>()
  const publishedIds = new Set<string>()
  for (const r of pubRows) {
    const slug = txt(r.slug)
    const id = txt(r.mezmur_id)
    if (isPublicMezmurRow(r)) {
      if (slug) publishedSlugs.add(slug)
      if (id) publishedIds.add(id)
    }
  }
  const distinct = new Map<string, Set<string>>()
  for (const row of catLinks) {
    const slug = txt(row.category_slug)
    const mezmurSlug = txt(row.mezmur_slug)
    const mezmurUuid = txt(row.mezmur_import_id) || txt(row.mezmur_id) || mezmurSlug
    const isPub = (txt(row.mezmur_id) && publishedIds.has(txt(row.mezmur_id))) || (mezmurSlug && publishedSlugs.has(mezmurSlug))
    if (!slug || !mezmurSlug || !isPub) continue
    if (!distinct.has(slug)) distinct.set(slug, new Set())
    distinct.get(slug)!.add(mezmurUuid)
  }
  return sortCards(
    [...distinct.entries()]
      .filter(([, set]) => set.size > 0)
      .map(([slug, set]) => ({
        kind: 'category' as const,
        id: slug,
        slug,
        name: humanizeSlug(slug),
        nameAmharic: '',
        description: '',
        imagePath: null,
        imageUrl: '',
        imageAlt: humanizeSlug(slug),
        mezmurCount: set.size,
        featured: false,
        sortOrder: 0,
        href: `/practice/category/${slug}`,
      })),
  )
}

export async function loadBrowseGroupChildren(
  collectionSlug: string,
  language?: MezmurLanguageFilter,
): Promise<{ group: HymnCollection | null; children: HymnBrowseCard[] }> {
  const group = await getHymnCollectionBySlug(collectionSlug, language)
  if (!group) return { group: null, children: [] }

  if (
    group.slug === 'zemari-singers' ||
    group.collectionType === 'singer_group' ||
    /zemari|singer/i.test(group.slug)
  ) {
    const singers = await getHymnSingers(language)
    return { group, children: singers }
  }

  const sections = await getSectionsForCollection(group.slug, language)
  return { group, children: sections.map(sectionToCard) }
}

export async function loadHymnBrowseIndex(language?: MezmurLanguageFilter): Promise<{
  occasions: HymnBrowseCard[]
  categories: HymnBrowseCard[]
  singers: HymnBrowseCard[]
}> {
  const [occasions, categories, singers] = await Promise.all([
    getHymnOccasions(language),
    getHymnCategories(language),
    getHymnSingers(language),
  ])
  return { occasions, categories, singers }
}

export async function loadBrowseGroupDetail(
  kind: HymnBrowseKind,
  slug: string,
): Promise<HymnBrowseCard | null> {
  if (kind === 'singer') return getZemariPublicBySlug(slug)
  const index = await loadHymnBrowseIndex()
  const list = kind === 'occasion' ? index.occasions : kind === 'category' ? index.categories : []
  return list.find((c) => c.slug === slug) || null
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
])

function searchTokens(query: string): string[] {
  const parts = query
    .trim()
    .toLowerCase()
    .split(/[\s,/|·]+/)
    .map((t) => t.trim())
    .filter((t) => t.length >= 3 && !SEARCH_STOP.has(t))
  // Keep meaningful short tokens only when they are the whole query (e.g. "እግ")
  if (!parts.length) {
    const fallback = query
      .trim()
      .toLowerCase()
      .split(/[\s,/|·]+/)
      .map((t) => t.trim())
      .filter((t) => t.length >= 2 && !SEARCH_STOP.has(t))
    return [...new Set(fallback)]
  }
  return [...new Set(parts)]
}

function hayMatchesTokens(hay: string, tokens: string[]): boolean {
  if (!tokens.length) return false
  // Prefer any token match so alias-expanded queries ("timkat timket epiphany") work.
  return tokens.some((t) => hay.includes(t))
}

export async function searchHymns(query: string, limit = 50): Promise<HymnDiscoveryHit[]> {
  const tokens = searchTokens(query)
  if (!tokens.length || !supabase) return []

  const sectionHits: HymnDiscoveryHit[] = []
  const mezmurHits: HymnDiscoveryHit[] = []
  const singerHits: HymnDiscoveryHit[] = []
  const collectionHits: HymnDiscoveryHit[] = []

  const [collections, sectionsRes, dataRes, singers] = await Promise.all([
    getMajorHymnGroups().catch(() => [] as HymnCollection[]),
    supabase.from(T.sections as never).select('*').is('deleted_at', null).limit(400),
    supabase
      .from(T.data as never)
      .select('mezmur_id, slug, title, title_amharic, title_english, singer_name, search_keywords, status')
      .limit(500),
    getHymnSingers().catch(() => [] as HymnBrowseCard[]),
  ])

  if (!sectionsRes.error && sectionsRes.data) {
    for (const row of sectionsRes.data as SectionImportRow[]) {
      if (!isPublishedStatus(row.status)) continue
      const section = mapSectionFromRow(row)
      const hay = `${section.title} ${section.titleAmharic} ${section.slug} ${section.description}`.toLowerCase()
      if (!hayMatchesTokens(hay, tokens)) continue
      sectionHits.push({
        type: 'section',
        id: section.id,
        title: section.title || humanizeSlug(section.slug),
        titleAmharic: section.titleAmharic,
        href: section.href,
        meta: humanizeSlug(section.collectionSlug),
      })
    }
  } else if (sectionsRes.error) {
    logSchemaError('searchHymns sections', sectionsRes.error)
  }

  for (const s of singers) {
    const hay = `${s.name} ${s.nameAmharic || ''} ${s.slug}`.toLowerCase()
    if (!hayMatchesTokens(hay, tokens)) continue
    singerHits.push({
      type: 'singer',
      id: s.id,
      title: s.name || humanizeSlug(s.slug),
      titleAmharic: s.nameAmharic || '',
      href: s.href,
      meta: `${s.mezmurCount} Mezmurs · Zemari`,
    })
  }

  if (!dataRes.error && dataRes.data) {
    for (const row of dataRes.data as DataImportRow[]) {
      if (!isPublicMezmurRow(row)) continue
      const title = txt(row.title)
      const titleAmharic = txt(row.title_amharic)
      const titleEnglish = txt(row.title_english)
      const singerName = txt(row.singer_name)
      const keywords = parseKeywords(row.search_keywords).join(' ')
      const slug = txt(row.slug)
      const hay =
        `${title} ${titleAmharic} ${titleEnglish} ${slug} ${singerName} ${keywords}`.toLowerCase()
      if (!hayMatchesTokens(hay, tokens)) continue
      mezmurHits.push({
        type: 'mezmur',
        id: txt(row.mezmur_id || slug),
        title: titleEnglish || title || humanizeSlug(slug),
        titleAmharic,
        href: `/practice/mezmur/${slug}`,
        meta: singerName ? `Mezmur · ${singerName}` : 'Mezmur',
      })
      if (mezmurHits.length >= limit * 2) break
    }
  } else if (dataRes.error) {
    logSchemaError('searchHymns data', dataRes.error)
  }

  for (const g of collections) {
    const hay = `${g.title} ${g.titleAmharic} ${g.description} ${g.slug}`.toLowerCase()
    if (!hayMatchesTokens(hay, tokens)) continue
    collectionHits.push({
      type: 'collection',
      id: g.id,
      title: g.title || humanizeSlug(g.slug),
      titleAmharic: g.titleAmharic,
      href: g.href,
      meta: 'Collection',
    })
  }

  // Specific entities first: sections → mezmurs → singers → collections
  return [...sectionHits, ...mezmurHits, ...singerHits, ...collectionHits].slice(0, limit)
}

/** @deprecated Prefer searchHymns */
export async function searchHymnDiscovery(query: string, limit = 12): Promise<HymnDiscoveryHit[]> {
  return searchHymns(query, limit)
}

/**
 * Paginated Mezmur search over the published mezmur_public projection only.
 * Used by Hymns Practice landing search results (never public.mezmur).
 */
export async function searchImportMezmurs(
  query: string,
  options?: { page?: number; pageSize?: number; language?: MezmurLanguageCode },
): Promise<{
  items: Array<{
    id: string
    slug: string
    title: string
    title_amharic: string | null
    title_english: string | null
    thumbnail_url: string | null
    youtube_url: string | null
    singer_name: string | null
    language: string | null
    form: string | null
  }>
  total: number
  page: number
}> {
  const rawNeedle = query.trim()
  const page = Math.max(1, options?.page || 1)
  const pageSize = Math.min(50, Math.max(1, options?.pageSize || 24))
  if (!supabase || (rawNeedle.length > 0 && rawNeedle.length < 2)) return { items: [], total: 0, page }

  const tokens = searchTokens(rawNeedle)
  const needle = rawNeedle.toLowerCase()
  if (rawNeedle && !tokens.length && needle.length < 2) return { items: [], total: 0, page }

  let data: DataImportRow[]
  try {
    data = await selectAllImportRows(
      'mezmur_id, slug, title, title_amharic, title_english, image_path, legacy_thumbnail_url, youtube_url, singer_name, primary_language, form, search_keywords, status',
      { language: options?.language },
    )
  } catch (cause) {
    logSchemaError('searchImportMezmurs', cause as { message?: string; code?: string })
    throw cause
  }

  const matched = data
    .filter((row) => isPublicMezmurRow(row))
    .filter((row) => !options?.language || normalizeMezmurLanguage(row.primary_language) === options.language)
    .map((row) => {
      const title = txt(row.title)
      const titleAmharic = txt(row.title_amharic)
      const titleEnglish = txt(row.title_english)
      const singer = txt(row.singer_name)
      const slug = txt(row.slug)
      const keywords = parseKeywords(row.search_keywords).join(' ')
      const hay =
        `${title} ${titleAmharic} ${titleEnglish} ${singer} ${keywords} ${slug}`.toLowerCase()
      const tokenHit = tokens.length ? hayMatchesTokens(hay, tokens) : false
      const score = !needle ? 1 : hay.includes(needle) ? 2 : tokenHit ? 1 : 0
      return { row, hay, score }
    })
    .filter((entry) => entry.score > 0)
    .sort((a, b) => b.score - a.score)

  const total = matched.length
  const slice = matched.slice((page - 1) * pageSize, page * pageSize)
  return {
    page,
    total,
    items: slice.map(({ row }) => {
      const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null
      return {
        id: txt(row.mezmur_id || row.slug),
        slug: txt(row.slug),
        title: txt(row.title),
        title_amharic: txt(row.title_amharic) || null,
        title_english: txt(row.title_english) || null,
        thumbnail_url: image,
        youtube_url: txt(row.youtube_url) || null,
        singer_name: txt(row.singer_name) || null,
        language: txt(row.primary_language) || null,
        form: txt(row.form) || null,
      }
    }),
  }
}

/** Lightweight approved public cards from mezmur_public for search/catalog. */
export async function listImportMezmurCards(limit = Number.POSITIVE_INFINITY): Promise<
  Array<{
    id: string
    import_id?: string
    slug: string
    title: string
    title_amharic: string | null
    thumbnail_url: string | null
    youtube_url: string | null
    singer_name: string | null
    zemari_id: string | null
    language: string | null
    form: string | null
    search_keywords: string[]
  }>
> {
  const client = supabase
  if (!client) return []
  let data: DataImportRow[] = []
  let primaryError: { message?: string; code?: string } | null = null
  const [dataResult, catLinks] = await Promise.all([
    selectAllImportRows(
      'mezmur_id, slug, title, title_amharic, image_path, legacy_thumbnail_url, youtube_url, singer_name, zemari_id, primary_language, form, search_keywords, status',
      { maxRows: limit },
    ).then((rows) => ({ rows, error: null })).catch((cause) => ({ rows: [] as DataImportRow[], error: cause as { message?: string; code?: string } })),
    fetchAllCategoryLinks().catch(() => []),
  ])

  const slugToImportId = new Map<string, string>()
  for (const l of catLinks) {
    if (l.mezmur_slug && l.mezmur_import_id) {
      slugToImportId.set(l.mezmur_slug, l.mezmur_import_id)
    }
  }

  if (dataResult.error) {
    primaryError = dataResult.error
  } else {
    data = dataResult.rows
  }

  if (primaryError) {
    // Retry without zemari_id if column not migrated yet
    if (/zemari_id/i.test(primaryError.message || '')) {
      try {
        const legacyRows = await collectPagedRows<DataImportRow>(async (from, to) => {
          const legacy = await client
            .from(T.data as never)
            .select(
              'mezmur_id, slug, title, title_amharic, image_path, legacy_thumbnail_url, youtube_url, singer_name, primary_language, form, search_keywords, status',
            )
            .eq('status', 'published')
            .range(from, to)
          if (legacy.error) throw permissionError(T.data, legacy.error)
          return (legacy.data || []) as DataImportRow[]
        }, { maxRows: limit })
        return legacyRows.map((row) => {
          const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null
          const slug = txt(row.slug)
          const importId = slugToImportId.get(slug) || txt(row.mezmur_id) || slug
          return {
            id: importId,
            import_id: importId,
            slug,
            title: txt(row.title),
            title_amharic: txt(row.title_amharic) || null,
            thumbnail_url: image,
            youtube_url: txt(row.youtube_url) || null,
            singer_name: txt(row.singer_name) || null,
            zemari_id: null,
            language: txt(row.primary_language) || null,
            form: txt(row.form) || null,
            search_keywords: parseKeywords(row.search_keywords),
          }
        })
      } catch (cause) {
        logSchemaError('listImportMezmurCards legacy', cause as { message?: string; code?: string })
        return []
      }
    }
    logSchemaError('listImportMezmurCards', primaryError)
    return []
  }
  return data
    .map((row) => {
      const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null
      const slug = txt(row.slug)
      const importId = slugToImportId.get(slug) || txt(row.mezmur_id) || slug
      return {
        id: importId,
        import_id: importId,
        slug,
        title: txt(row.title),
        title_amharic: txt(row.title_amharic) || null,
        thumbnail_url: image,
        youtube_url: txt(row.youtube_url) || null,
        singer_name: txt(row.singer_name) || null,
        zemari_id: txt(row.zemari_id) || null,
        language: txt(row.primary_language) || null,
        form: txt(row.form) || null,
        search_keywords: parseKeywords(row.search_keywords),
      }
    })
}

