/**
 * Hymns Practice browse — ACTIVE SOURCE: staging import tables.
 *
 * public.mezmur_collections_import (optional — may be absent)
 * public.mezmur_sections_import
 * public.mezmur_section_links_import
 * public.mezmur_data_import
 * public.mezmur_occasion_links_import
 * public.mezmur_category_links_import (optional)
 *
 * Does NOT query legacy views/tables:
 * hymn_major_browse_groups, hymn_browse_group_children,
 * hymn_browse_occasions, hymn_browse_categories, hymn_browse_singers,
 * hymn_collections_with_counts, hymn_sections_with_counts.
 */
import { supabase } from '../supabase/client'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import { resolveHymnSectionImageUrl } from './hymnSectionArtFallbacks'

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
  imagePath: string | null
  imageUrl: string
  imageAlt: string
  mezmurCount: number
  featured: boolean
  sortOrder: number
  href: string
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
  data: 'mezmur_data_import',
  occasions: 'mezmur_occasion_links_import',
  categories: 'mezmur_category_links_import',
} as const

const missingTables = new Set<string>()
let schemaErrorLogged = false

function logSchemaError(scope: string, error: { message?: string; code?: string } | null) {
  if (!error) return
  const permanent =
    error.code === '42501' ||
    error.code === '42P01' ||
    error.code === 'PGRST205' ||
    error.code === '42703' ||
    /permission denied|does not exist|Could not find the table|relation/i.test(error.message || '')
  if (permanent) {
    if (!schemaErrorLogged && import.meta.env.DEV) {
      schemaErrorLogged = true
      console.error(`[hymnBrowse/import] ${scope} (schema/permission — not retrying)`, error)
    }
    return
  }
  if (import.meta.env.DEV) console.error(`[hymnBrowse/import] ${scope}`, error)
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

function isVisibleImportStatus(status: unknown): boolean {
  const v = txt(status).toLowerCase()
  // Import CSV may leave status blank or use published/active.
  // Do NOT require .eq('status','published') until data is normalized.
  if (!v) return true
  if (v === 'published' || v === 'active' || v === 'true' || v === '1') return true
  if (v === 'draft' || v === 'archived' || v === 'hidden' || v === 'rejected' || v === 'deleted') {
    return false
  }
  // Unknown non-hidden values: include (staging data is messy).
  return true
}

/** @deprecated Prefer isVisibleImportStatus */
function isPublishedStatus(status: unknown): boolean {
  return isVisibleImportStatus(status)
}

const COLLECTION_SELECT =
  'collection_id, collection_slug, title, title_amharic, description, description_amharic, image_path, image_alt, collection_type, sort_order, is_featured, status'

/** Level 1 — collections from mezmur_collections_import. */
export async function getHymnCollections(): Promise<HymnCollection[]> {
  if (!supabase) {
    throw new Error('Supabase is not configured.')
  }

  const { data, error } = await supabase
    .from(T.collections as never)
    .select(COLLECTION_SELECT)

  if (import.meta.env.DEV) {
    console.log('[hymn collections raw]', data, error)
  }

  if (error) {
    logSchemaError('getHymnCollections', error)
    if (error.code === 'PGRST205' || /Could not find the table/i.test(error.message || '')) {
      markMissing(T.collections)
    }
    if (error.code === '42501' || /permission denied/i.test(error.message || '')) {
      throw permissionError(T.collections, error)
    }
    throw new Error(error.message || 'Unable to load hymn collections.')
  }

  const rawRows = (data || []) as Record<string, unknown>[]
  const visibleRows = rawRows.filter((row) => isVisibleImportStatus(row.status))

  if (import.meta.env.DEV) {
    console.log('[hymn collections visible]', visibleRows.length, {
      raw: rawRows.length,
      statuses: [...new Set(rawRows.map((r) => String(r.status ?? '')))],
    })
  }

  // Anon RLS often returns [] with no error while Table Editor shows rows.
  if (!rawRows.length) {
    if (import.meta.env.DEV) {
      console.warn(
        '[hymn collections] 0 rows from mezmur_collections_import. If Table Editor shows data, run FIX_MEZMUR_IMPORT_ANON_READ.sql (RLS/grants).',
      )
    }
    // Fall through: try deriving from sections (same RLS issue usually applies).
  } else {
    const counts = await collectionCountsFromLinks().catch(() => new Map<string, number>())
    return sortCollections(
      visibleRows.map((row) => {
        const mapped = mapCollectionFromRow(row)
        return { ...mapped, mezmurCount: counts.get(mapped.slug) ?? mapped.mezmurCount }
      }),
    )
  }

  // Derive from distinct collection_slug in sections when collections empty/missing.
  const sections = await fetchAllSections().catch(() => [] as HymnSection[])
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
      mezmurCount: 0,
      featured: false,
      sortOrder: 0,
      href: `/practice/browse/${slug}`,
    })
  }
  const counts = await collectionCountsFromLinks(sections).catch(() => new Map<string, number>())
  return sortCollections(
    [...bySlug.values()].map((c) => ({ ...c, mezmurCount: counts.get(c.slug) || 0 })),
  )
}

/** @deprecated Prefer getHymnCollections */
export async function getMajorHymnGroups(): Promise<HymnCollection[]> {
  return getHymnCollections()
}

/** @deprecated Prefer getHymnCollections */
export async function loadMajorBrowseGroups(): Promise<HymnCollection[]> {
  return getHymnCollections()
}

export async function getHymnCollectionBySlug(slug: string): Promise<HymnCollection | null> {
  const needle = slug.trim()
  if (!needle || !supabase) return null

  if (!isMissing(T.collections)) {
    const { data, error } = await supabase
      .from(T.collections as never)
      .select('*')
      .eq('collection_slug', needle)
      .limit(1)
    if (!error && data?.[0] && isPublishedStatus((data[0] as Record<string, unknown>).status)) {
      const mapped = mapCollectionFromRow(data[0] as Record<string, unknown>)
      const counts = await collectionCountsFromLinks()
      return { ...mapped, mezmurCount: counts.get(mapped.slug) ?? mapped.mezmurCount }
    }
    if (error && error.code !== 'PGRST116') {
      if (error.code === 'PGRST205') markMissing(T.collections)
      else logSchemaError('getHymnCollectionBySlug', error)
    }
  }

  const groups = await getHymnCollections()
  return groups.find((g) => g.slug === needle) || null
}

async function fetchAllSections(): Promise<HymnSection[]> {
  if (!supabase) return []
  if (isMissing(T.sections)) return []
  const { data, error } = await supabase.from(T.sections as never).select('*')
  if (error) {
    logSchemaError('fetchAllSections', error)
    if (error.code === 'PGRST205') markMissing(T.sections)
    throw permissionError(T.sections, error)
  }
  return ((data || []) as SectionImportRow[])
    .filter((row) => isPublishedStatus(row.status))
    .map(mapSectionFromRow)
}

export async function getSectionsForCollection(collectionSlug: string): Promise<HymnSection[]> {
  if (!supabase || !collectionSlug.trim()) return []
  const { data, error } = await supabase
    .from(T.sections as never)
    .select(
      'section_id, section_slug, collection_slug, parent_section_slug, title, title_amharic, description, description_amharic, image_path, image_alt, section_type, source_entity_type, source_entity_slug, sort_order, is_featured, status',
    )
    .eq('collection_slug', collectionSlug.trim())

  if (import.meta.env.DEV) {
    console.log('[hymn sections raw]', collectionSlug, data?.length, error)
  }

  if (error) {
    logSchemaError('getSectionsForCollection', error)
    throw permissionError(T.sections, error)
  }

  const sections = sortSections(
    ((data || []) as SectionImportRow[])
      .filter((row) => isVisibleImportStatus(row.status))
      .map(mapSectionFromRow),
  )

  const counts = await sectionCountsForCollection(collectionSlug.trim(), sections)
  return sections.map((s) => ({ ...s, mezmurCount: counts.get(s.slug) || 0 }))
}

/** @deprecated Prefer getSectionsForCollection */
export async function getHymnSectionsForCollection(
  collectionId: string,
  collectionSlug: string,
): Promise<HymnSection[]> {
  return getSectionsForCollection(collectionSlug || collectionId)
}

export async function getHymnSection(
  collectionSlugOrId: string,
  sectionSlug: string,
): Promise<HymnSection | null> {
  const collectionSlug = collectionSlugOrId.trim()
  const slug = sectionSlug.trim()
  if (!supabase || !collectionSlug || !slug) return null

  const { data, error } = await supabase
    .from(T.sections as never)
    .select('*')
    .eq('collection_slug', collectionSlug)
    .eq('section_slug', slug)
    .limit(1)

  if (error) {
    logSchemaError('getHymnSection', error)
    throw permissionError(T.sections, error)
  }
  const row = (data || [])[0] as SectionImportRow | undefined
  if (!row || !isPublishedStatus(row.status)) return null
  const mapped = mapSectionFromRow(row)
  const counts = await sectionCountsForCollection(collectionSlug, [mapped])
  return { ...mapped, mezmurCount: counts.get(mapped.slug) || 0 }
}

async function fetchLinksForSection(
  collectionSlug: string,
  sectionSlug: string,
): Promise<LinkImportRow[]> {
  if (!supabase) return []
  const { data, error } = await supabase
    .from(T.links as never)
    .select('*')
    .eq('section_slug', sectionSlug)

  if (error) {
    logSchemaError('fetchLinksForSection', error)
    throw permissionError(T.links, error)
  }

  const rows = (data || []) as LinkImportRow[]
  // Prefer collection_slug + section_slug when the link table carries collection_slug.
  const hasCollection = rows.some((r) => 'collection_slug' in r && txt(r.collection_slug))
  if (hasCollection) {
    return rows.filter((r) => {
      const c = txt(r.collection_slug)
      return !c || c === collectionSlug
    })
  }
  return rows
}

async function sectionCountsForCollection(
  collectionSlug: string,
  sections: HymnSection[],
): Promise<Map<string, number>> {
  const map = new Map<string, number>()
  if (!supabase || !sections.length) return map

  const sectionSlugs = sections.map((s) => s.slug)
  // One query for all section links in this collection's sections.
  const { data, error } = await supabase
    .from(T.links as never)
    .select('*')
    .in('section_slug', sectionSlugs)

  if (error) {
    logSchemaError('sectionCountsForCollection', error)
    return map
  }

  const rows = (data || []) as LinkImportRow[]
  const hasCollection = rows.some((r) => 'collection_slug' in r && txt(r.collection_slug))
  const distinct = new Map<string, Set<string>>()
  for (const row of rows) {
    const section = txt(row.section_slug)
    const mezmur = txt(row.mezmur_slug)
    if (!section || !mezmur) continue
    if (hasCollection) {
      const c = txt(row.collection_slug)
      if (c && c !== collectionSlug) continue
    }
    if (!distinct.has(section)) distinct.set(section, new Set())
    distinct.get(section)!.add(mezmur)
  }
  for (const [slug, set] of distinct) map.set(slug, set.size)
  return map
}

async function collectionCountsFromLinks(
  sections?: HymnSection[],
): Promise<Map<string, number>> {
  const map = new Map<string, number>()
  if (!supabase) return map
  const allSections = sections || (await fetchAllSections().catch(() => [] as HymnSection[]))
  if (!allSections.length) return map

  const sectionToCollection = new Map<string, string>()
  // section_slug may collide across collections — key by collection:section when possible
  for (const s of allSections) {
    sectionToCollection.set(`${s.collectionSlug}::${s.slug}`, s.collectionSlug)
    // Also keep last-wins by section_slug for link tables without collection_slug
    sectionToCollection.set(s.slug, s.collectionSlug)
  }

  const { data, error } = await supabase.from(T.links as never).select('*')
  if (error) {
    logSchemaError('collectionCountsFromLinks', error)
    return map
  }

  const distinct = new Map<string, Set<string>>()
  for (const row of (data || []) as LinkImportRow[]) {
    const sectionSlug = txt(row.section_slug)
    const mezmurSlug = txt(row.mezmur_slug)
    if (!sectionSlug || !mezmurSlug) continue
    const collectionSlug =
      txt(row.collection_slug) ||
      sectionToCollection.get(`${txt(row.collection_slug)}::${sectionSlug}`) ||
      sectionToCollection.get(sectionSlug)
    if (!collectionSlug) continue
    if (!distinct.has(collectionSlug)) distinct.set(collectionSlug, new Set())
    distinct.get(collectionSlug)!.add(mezmurSlug)
  }
  for (const [id, set] of distinct) map.set(id, set.size)
  return map
}

export async function getMezmursForSection(
  collectionSlugOrSectionId: string,
  sectionSlugOrOptions?:
    | string
    | { q?: string; page?: number; pageSize?: number },
  maybeOptions?: { q?: string; page?: number; pageSize?: number },
): Promise<{ items: HymnSectionMezmur[]; total: number; page: number }> {
  // Support both (collectionSlug, sectionSlug, opts) and legacy (sectionId, opts).
  let collectionSlug = ''
  let sectionSlug = ''
  let options: { q?: string; page?: number; pageSize?: number } = {}

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
  const pageSize = Math.min(100, Math.max(1, options.pageSize || 48))
  const from = (page - 1) * pageSize
  const to = from + pageSize - 1
  const q = (options.q || '').trim().toLowerCase()

  if (collectionSlug) {
    const section = await getHymnSection(collectionSlug, sectionSlug)
    if (!section) return { items: [], total: 0, page }
  }

  const links = await fetchLinksForSection(collectionSlug, sectionSlug.trim())
  if (!links.length) return { items: [], total: 0, page }

  const ordered = [...links].sort((a, b) => num(a.sort_order) - num(b.sort_order))
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
      if (slug && isPublishedStatus(row.status)) bySlug.set(slug, row)
    }
  }

  let items: HymnSectionMezmur[] = []
  for (const link of ordered) {
    const slug = txt(link.mezmur_slug)
    const row = bySlug.get(slug)
    if (!row) continue
    const item = mapDataCard(row, num(link.sort_order))
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
  const { data, error } = await supabase
    .from(T.data as never)
    .select('*')
    .eq('slug', slug.trim())
    .limit(1)

  if (error) {
    logSchemaError('getMezmurBySlug', error)
    throw permissionError(T.data, error)
  }
  const row = (data || [])[0] as DataImportRow | undefined
  if (!row || !isPublishedStatus(row.status)) return null

  const occasions = await getOccasionsForMezmur(txt(row.slug)).catch(() => [] as string[])
  const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null

  return {
    id: txt(row.mezmur_id || row.slug),
    mezmur_id: txt(row.mezmur_id || row.slug),
    slug: txt(row.slug),
    title: txt(row.title),
    title_amharic: txt(row.title_amharic) || null,
    title_english: txt(row.title_english) || null,
    description: txt(row.description) || null,
    description_amharic: txt(row.description_amharic) || null,
    lyrics_amharic: txt(row.lyrics_amharic) || null,
    lyrics_transliteration: txt(row.lyrics_transliteration) || null,
    lyrics_english: txt(row.lyrics_english) || null,
    lyrics_geez: txt(row.lyrics_geez) || null,
    lyrics_oromo: txt(row.lyrics_oromo) || null,
    primary_language: txt(row.primary_language) || null,
    language: txt(row.primary_language) || null,
    form: txt(row.form) || null,
    singer_id: txt(row.singer_id) || null,
    singer_slug: txt(row.singer_slug) || null,
    singer_name: txt(row.singer_name) || null,
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

export async function getHymnSingers(): Promise<HymnBrowseCard[]> {
  if (!supabase) return []
  // Derive from mezmur_data_import — do not query public.singers (can 400).
  const { data, error } = await supabase
    .from(T.data as never)
    .select('singer_id, singer_slug, singer_name, status')

  if (error) {
    logSchemaError('getHymnSingers', error)
    throw permissionError(T.data, error)
  }

  const tally = new Map<
    string,
    { id: string; slug: string; name: string; count: number }
  >()
  for (const row of (data || []) as DataImportRow[]) {
    if (!isPublishedStatus(row.status)) continue
    const name = txt(row.singer_name)
    const slug =
      txt(row.singer_slug) ||
      name
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/^-|-$/g, '')
    if (!name && !slug) continue
    const key = txt(row.singer_id) || slug || name
    const prev = tally.get(key)
    if (prev) prev.count += 1
    else tally.set(key, { id: key, slug: slug || key, name: name || humanizeSlug(slug), count: 1 })
  }

  return sortCards(
    [...tally.values()]
      .filter((s) => s.count > 0)
      .map((s) => ({
        kind: 'singer' as const,
        id: s.id,
        slug: s.slug,
        name: s.name,
        nameAmharic: '',
        description: '',
        imagePath: null,
        imageUrl: '',
        imageAlt: s.name,
        mezmurCount: s.count,
        featured: false,
        sortOrder: 0,
        href: `/practice/singer/${s.slug}`,
      })),
  )
}

export async function getHymnOccasions(): Promise<HymnBrowseCard[]> {
  if (!supabase || isMissing(T.occasions)) return []
  const { data, error } = await supabase.from(T.occasions as never).select('*')
  if (error) {
    if (error.code === 'PGRST205') markMissing(T.occasions)
    logSchemaError('getHymnOccasions', error)
    return []
  }
  const tally = new Map<string, number>()
  for (const row of (data || []) as LinkImportRow[]) {
    const slug = txt(row.occasion_slug)
    if (!slug) continue
    tally.set(slug, (tally.get(slug) || 0) + 1)
  }
  return sortCards(
    [...tally.entries()]
      .filter(([, count]) => count > 0)
      .map(([slug, count]) => ({
        kind: 'occasion' as const,
        id: slug,
        slug,
        name: humanizeSlug(slug),
        nameAmharic: '',
        description: '',
        imagePath: null,
        imageUrl: '',
        imageAlt: humanizeSlug(slug),
        mezmurCount: count,
        featured: false,
        sortOrder: 0,
        href: `/practice/occasion/${slug}`,
      })),
  )
}

export async function getHymnCategories(): Promise<HymnBrowseCard[]> {
  if (!supabase || isMissing(T.categories)) return []
  const { data, error } = await supabase.from(T.categories as never).select('*').limit(1)
  if (error) {
    if (error.code === 'PGRST205' || /Could not find the table/i.test(error.message || '')) {
      markMissing(T.categories)
    }
    logSchemaError('getHymnCategories', error)
    return []
  }
  // Table exists — fetch all for counts
  const all = data?.length
    ? await supabase.from(T.categories as never).select('*')
    : { data: [], error: null }
  if (all.error) {
    logSchemaError('getHymnCategories all', all.error)
    return []
  }
  const tally = new Map<string, number>()
  for (const row of (all.data || []) as LinkImportRow[]) {
    const slug = txt(row.category_slug)
    if (!slug) continue
    tally.set(slug, (tally.get(slug) || 0) + 1)
  }
  return sortCards(
    [...tally.entries()]
      .filter(([, count]) => count > 0)
      .map(([slug, count]) => ({
        kind: 'category' as const,
        id: slug,
        slug,
        name: humanizeSlug(slug),
        nameAmharic: '',
        description: '',
        imagePath: null,
        imageUrl: '',
        imageAlt: humanizeSlug(slug),
        mezmurCount: count,
        featured: false,
        sortOrder: 0,
        href: `/practice/category/${slug}`,
      })),
  )
}

export async function loadBrowseGroupChildren(
  collectionSlug: string,
): Promise<{ group: HymnCollection | null; children: HymnBrowseCard[] }> {
  const group = await getHymnCollectionBySlug(collectionSlug)
  if (!group) return { group: null, children: [] }

  if (
    group.slug === 'zemari-singers' ||
    group.collectionType === 'singer_group' ||
    /zemari|singer/i.test(group.slug)
  ) {
    const singers = await getHymnSingers()
    return { group, children: singers }
  }

  const sections = await getSectionsForCollection(group.slug)
  return { group, children: sections.map(sectionToCard) }
}

export async function loadHymnBrowseIndex(): Promise<{
  occasions: HymnBrowseCard[]
  categories: HymnBrowseCard[]
  singers: HymnBrowseCard[]
}> {
  const [occasions, categories, singers] = await Promise.all([
    getHymnOccasions(),
    getHymnCategories(),
    getHymnSingers(),
  ])
  return { occasions, categories, singers }
}

export async function loadBrowseGroupDetail(
  kind: HymnBrowseKind,
  slug: string,
): Promise<HymnBrowseCard | null> {
  const index = await loadHymnBrowseIndex()
  const list =
    kind === 'occasion'
      ? index.occasions
      : kind === 'category'
        ? index.categories
        : kind === 'singer'
          ? index.singers
          : []
  return list.find((c) => c.slug === slug) || null
}

export async function searchHymns(query: string, limit = 50): Promise<HymnDiscoveryHit[]> {
  const needle = query.trim().toLowerCase()
  if (needle.length < 2 || !supabase) return []

  const hits: HymnDiscoveryHit[] = []

  const [collections, sectionsRes, dataRes, singers] = await Promise.all([
    getMajorHymnGroups().catch(() => [] as HymnCollection[]),
    supabase.from(T.sections as never).select('*').limit(400),
    supabase
      .from(T.data as never)
      .select('mezmur_id, slug, title, title_amharic, title_english, singer_name, search_keywords, status')
      .limit(500),
    getHymnSingers().catch(() => [] as HymnBrowseCard[]),
  ])

  for (const g of collections) {
    const hay = `${g.title} ${g.titleAmharic} ${g.description} ${g.slug}`.toLowerCase()
    if (hay.includes(needle)) {
      hits.push({
        type: 'collection',
        id: g.id,
        title: g.title,
        titleAmharic: g.titleAmharic,
        href: g.href,
        meta: 'Collection',
      })
      hits.push({
        type: 'browse_group',
        id: g.id,
        title: g.title,
        titleAmharic: g.titleAmharic,
        href: g.href,
        meta: 'Collection',
      })
    }
  }

  if (!sectionsRes.error && sectionsRes.data) {
    for (const row of sectionsRes.data as SectionImportRow[]) {
      if (!isPublishedStatus(row.status)) continue
      const section = mapSectionFromRow(row)
      const hay = `${section.title} ${section.titleAmharic} ${section.slug}`.toLowerCase()
      if (!hay.includes(needle)) continue
      hits.push({
        type: 'section',
        id: section.id,
        title: section.title,
        titleAmharic: section.titleAmharic,
        href: section.href,
        meta: humanizeSlug(section.collectionSlug),
      })
    }
  } else if (sectionsRes.error) {
    logSchemaError('searchHymns sections', sectionsRes.error)
  }

  for (const s of singers) {
    const hay = `${s.name} ${s.slug}`.toLowerCase()
    if (hay.includes(needle)) {
      hits.push({
        type: 'singer',
        id: s.id,
        title: s.name,
        titleAmharic: '',
        href: s.href,
        meta: `${s.mezmurCount} Mezmurs · Singer`,
      })
    }
  }

  if (!dataRes.error && dataRes.data) {
    for (const row of dataRes.data as DataImportRow[]) {
      if (!isPublishedStatus(row.status)) continue
      const title = txt(row.title)
      const titleAmharic = txt(row.title_amharic)
      const titleEnglish = txt(row.title_english)
      const singerName = txt(row.singer_name)
      const keywords = parseKeywords(row.search_keywords).join(' ')
      const slug = txt(row.slug)
      const hay =
        `${title} ${titleAmharic} ${titleEnglish} ${slug} ${singerName} ${keywords}`.toLowerCase()
      if (!hay.includes(needle)) continue
      hits.push({
        type: 'mezmur',
        id: txt(row.mezmur_id || slug),
        title,
        titleAmharic,
        href: `/practice/mezmur/${slug}`,
        meta: singerName ? `Mezmur · ${singerName}` : 'Mezmur',
      })
      if (hits.length >= limit * 2) break
    }
  } else if (dataRes.error) {
    logSchemaError('searchHymns data', dataRes.error)
  }

  return hits.slice(0, limit)
}

/** @deprecated Prefer searchHymns */
export async function searchHymnDiscovery(query: string, limit = 12): Promise<HymnDiscoveryHit[]> {
  return searchHymns(query, limit)
}

/**
 * Paginated Mezmur search over mezmur_data_import only.
 * Used by Hymns Practice landing search results (never public.mezmur).
 */
export async function searchImportMezmurs(
  query: string,
  options?: { page?: number; pageSize?: number },
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
  const needle = query.trim().toLowerCase()
  const page = Math.max(1, options?.page || 1)
  const pageSize = Math.min(50, Math.max(1, options?.pageSize || 24))
  if (!supabase || needle.length < 2) return { items: [], total: 0, page }

  const { data, error } = await supabase
    .from(T.data as never)
    .select(
      'mezmur_id, slug, title, title_amharic, title_english, image_path, legacy_thumbnail_url, youtube_url, singer_name, primary_language, form, search_keywords, status',
    )
    .limit(500)

  if (error) {
    logSchemaError('searchImportMezmurs', error)
    throw permissionError(T.data, error)
  }

  const matched = ((data || []) as DataImportRow[])
    .filter((row) => isPublishedStatus(row.status))
    .map((row) => {
      const title = txt(row.title)
      const titleAmharic = txt(row.title_amharic)
      const titleEnglish = txt(row.title_english)
      const singer = txt(row.singer_name)
      const slug = txt(row.slug)
      const keywords = parseKeywords(row.search_keywords).join(' ')
      const hay =
        `${title} ${titleAmharic} ${titleEnglish} ${singer} ${keywords} ${slug}`.toLowerCase()
      return { row, hay, score: hay.includes(needle) ? 1 : 0 }
    })
    .filter((entry) => entry.score > 0)

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

/** Lightweight published cards from mezmur_data_import for search/catalog. */
export async function listImportMezmurCards(limit = 800): Promise<
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
    search_keywords: string[]
  }>
> {
  if (!supabase) return []
  const { data, error } = await supabase
    .from(T.data as never)
    .select(
      'mezmur_id, slug, title, title_amharic, image_path, legacy_thumbnail_url, youtube_url, singer_name, primary_language, form, search_keywords, status',
    )
    .limit(limit)
  if (error) {
    logSchemaError('listImportMezmurCards', error)
    return []
  }
  return ((data || []) as DataImportRow[])
    .filter((row) => isPublishedStatus(row.status))
    .map((row) => {
      const image = txt(row.image_path) || txt(row.legacy_thumbnail_url) || null
      return {
        id: txt(row.mezmur_id || row.slug),
        slug: txt(row.slug),
        title: txt(row.title),
        title_amharic: txt(row.title_amharic) || null,
        thumbnail_url: image,
        youtube_url: txt(row.youtube_url) || null,
        singer_name: txt(row.singer_name) || null,
        language: txt(row.primary_language) || null,
        form: txt(row.form) || null,
        search_keywords: parseKeywords(row.search_keywords),
      }
    })
}
