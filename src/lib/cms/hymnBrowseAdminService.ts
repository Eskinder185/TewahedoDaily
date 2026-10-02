/**
 * Admin CMS for Hymns Practice — ACTIVE SOURCE: import tables
 * mezmur_collections_import / mezmur_sections_import / mezmur_section_links_import
 */
import { db, errorMessage } from './mezmurService'
import { resolveContentMediaUrl } from './contentMedia'
import { requireCmsStaffSession } from './cmsStaffAuth'

export type HymnCollectionRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  description_amharic: string | null
  image_path: string | null
  image_alt: string | null
  collection_type:
    | 'occasion_group'
    | 'subject_group'
    | 'language_group'
    | 'singer_group'
    | 'general_group'
    | string
  sort_order: number
  is_featured: boolean
  status: 'draft' | 'published' | 'archived' | string
  updated_at?: string
}

export type HymnSectionRow = {
  id: string
  collection_id: string
  collection_slug?: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  description_amharic: string | null
  image_path: string | null
  image_alt: string | null
  section_type: string
  sort_order: number
  is_featured: boolean
  status: 'draft' | 'published' | 'archived' | string
  updated_at?: string
}

export type MezmurSectionLinkRow = {
  mezmur_id: string
  section_id: string
  mezmur_slug?: string
  section_slug?: string
  sort_order: number
  is_primary: boolean
}

/** @deprecated Alias — admin UI historically called these browse groups. */
export type HymnBrowseGroupRow = HymnCollectionRow
/** @deprecated Prefer HymnSectionRow */
export type HymnBrowseGroupItemRow = HymnSectionRow & {
  browse_group_id?: string
  item_type?: string
  item_id?: string | null
  item_slug?: string | null
  display_title?: string | null
  display_title_amharic?: string | null
}

const T = {
  collections: 'mezmur_collections_import',
  sections: 'mezmur_sections_import',
  links: 'mezmur_section_links_import',
  data: 'mezmur_data_import',
} as const

const COLLECTION_SELECT =
  'collection_id, collection_slug, title, title_amharic, description, description_amharic, image_path, image_alt, collection_type, sort_order, is_featured, status'

const SECTION_SELECT =
  'section_id, section_slug, collection_slug, parent_section_slug, title, title_amharic, description, description_amharic, image_path, image_alt, section_type, source_entity_type, source_entity_slug, sort_order, is_featured, status'

function txt(value: unknown): string {
  return String(value ?? '').trim()
}

function truthy(value: unknown): boolean {
  const v = txt(value).toLowerCase()
  return v === 'true' || v === '1' || v === 'yes' || v === 't'
}

/** Import staging columns store sort_order / is_featured as text. */
function asImportSortOrder(value: unknown): string {
  const n = Number(value)
  return String(Number.isFinite(n) ? n : 0)
}

function asImportFeatured(value: unknown): string {
  return truthy(value) || value === true ? 'true' : 'false'
}

export function hymnImagePreviewUrl(path: string | null | undefined): string {
  return path ? resolveContentMediaUrl(path) : ''
}

function adminWriteError(scope: string, error: { code?: string; message?: string; details?: string; hint?: string } | null): Error {
  if (import.meta.env.DEV) {
    console.error(`[hymn admin] ${scope}`, error)
  }
  if (!error) return new Error('Save failed.')
  const code = error.code || ''
  const message = error.message || ''
  const details = [error.details, error.hint].filter(Boolean).join(' ')
  if (code === '42501' || /permission denied|row-level security|rls/i.test(message)) {
    return new Error(
      `Permission denied (${code || 'RLS'}). Sign in as editor/admin and ensure staff UPDATE is granted on mezmur_*_import. ${details}`.trim(),
    )
  }
  if (code === 'PGRST116' || /0 rows|cannot coerce|JSON object requested/i.test(message)) {
    return new Error(`No matching row was updated (${scope}). Refresh and try again.`)
  }
  if (code === '23505') return new Error('This slug already exists. Choose a unique slug.')
  if (code === '23502' || /null value|violates check|invalid input/i.test(message)) {
    return new Error(`Validation failed: ${message}`)
  }
  if (/Failed to fetch|NetworkError|network/i.test(message)) {
    return new Error('Network error while saving. Check your connection and try again.')
  }
  if (/storage|bucket|object not found/i.test(message)) {
    return new Error(`Storage error: ${message}`)
  }
  return new Error(errorMessage(error) || message || 'Save failed.')
}

async function requireStaffSession(): Promise<void> {
  await requireCmsStaffSession('hymn browse admin')
}

function mapCollection(row: Record<string, unknown>): HymnCollectionRow {
  const slug = txt(row.collection_slug)
  return {
    id: txt(row.collection_id) || slug,
    slug,
    title: txt(row.title) || slug,
    title_amharic: txt(row.title_amharic) || null,
    description: txt(row.description) || null,
    description_amharic: txt(row.description_amharic) || null,
    image_path: txt(row.image_path) || null,
    image_alt: txt(row.image_alt) || null,
    collection_type: txt(row.collection_type) || 'general_group',
    sort_order: Number(row.sort_order) || 0,
    is_featured: truthy(row.is_featured),
    status: (txt(row.status) || 'published') as HymnCollectionRow['status'],
  }
}

function mapSection(row: Record<string, unknown>): HymnSectionRow {
  const collectionSlug = txt(row.collection_slug)
  const slug = txt(row.section_slug)
  return {
    id: txt(row.section_id) || `${collectionSlug}:${slug}`,
    collection_id: collectionSlug,
    collection_slug: collectionSlug,
    slug,
    title: txt(row.title) || slug,
    title_amharic: txt(row.title_amharic) || null,
    description: txt(row.description) || null,
    description_amharic: txt(row.description_amharic) || null,
    image_path: txt(row.image_path) || null,
    image_alt: txt(row.image_alt) || null,
    section_type: txt(row.section_type) || 'general',
    sort_order: Number(row.sort_order) || 0,
    is_featured: truthy(row.is_featured),
    status: (txt(row.status) || 'published') as HymnSectionRow['status'],
  }
}

export async function listHymnCollections(includeArchived = true): Promise<HymnCollectionRow[]> {
  let query = db().from(T.collections as never).select(COLLECTION_SELECT).order('sort_order')
  if (!includeArchived) query = query.neq('status', 'archived')
  const { data, error } = await query
  if (error) throw new Error(errorMessage(error))
  return ((data || []) as Record<string, unknown>[]).map(mapCollection)
}

/** @deprecated Prefer listHymnCollections */
export async function listHymnBrowseGroups(includeArchived = true): Promise<HymnCollectionRow[]> {
  return listHymnCollections(includeArchived)
}

export async function getHymnCollection(id: string): Promise<HymnCollectionRow> {
  const needle = id.trim()
  let { data, error } = await db()
    .from(T.collections as never)
    .select(COLLECTION_SELECT)
    .eq('collection_id', needle)
    .limit(1)
  if (error) throw new Error(errorMessage(error))
  let row = (data || [])[0] as Record<string, unknown> | undefined
  if (!row) {
    const bySlug = await db()
      .from(T.collections as never)
      .select(COLLECTION_SELECT)
      .eq('collection_slug', needle)
      .limit(1)
    if (bySlug.error) throw new Error(errorMessage(bySlug.error))
    row = (bySlug.data || [])[0] as Record<string, unknown> | undefined
  }
  if (!row) throw new Error('Collection not found.')
  return mapCollection(row)
}

/** @deprecated Prefer getHymnCollection */
export async function getHymnBrowseGroup(id: string): Promise<HymnCollectionRow> {
  return getHymnCollection(id)
}

export async function saveHymnCollection(
  input: Partial<HymnCollectionRow> & { title: string; slug: string },
  existingId?: string | null,
): Promise<HymnCollectionRow> {
  await requireStaffSession()
  const payload = {
    collection_slug: input.slug.trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic?.trim() || null,
    description: input.description?.trim() || null,
    description_amharic: input.description_amharic?.trim() || null,
    image_path: input.image_path?.trim() || null,
    image_alt: input.image_alt?.trim() || null,
    collection_type: input.collection_type || 'general_group',
    // Staging columns are text — do not send native boolean/number.
    sort_order: asImportSortOrder(input.sort_order),
    is_featured: asImportFeatured(input.is_featured),
    status: input.status || 'draft',
  }
  if (existingId) {
    const { data, error } = await db()
      .from(T.collections as never)
      .update(payload as never)
      .eq('collection_id', existingId)
      .select(COLLECTION_SELECT)
      .limit(1)
    if (error) throw adminWriteError('collection update by collection_id', error)
    const row = (data || [])[0] as Record<string, unknown> | undefined
    if (row) return mapCollection(row)
    // Fallback: match by slug when route id is the slug
    const bySlug = await db()
      .from(T.collections as never)
      .update(payload as never)
      .eq('collection_slug', existingId)
      .select(COLLECTION_SELECT)
      .limit(1)
    if (bySlug.error) throw adminWriteError('collection update by collection_slug', bySlug.error)
    const mapped = (bySlug.data || [])[0] as Record<string, unknown> | undefined
    if (!mapped) throw new Error('Collection update returned no row.')
    return mapCollection(mapped)
  }
  const insertPayload = {
    ...payload,
    collection_id: crypto.randomUUID(),
  }
  const { data, error } = await db()
    .from(T.collections as never)
    .insert(insertPayload as never)
    .select(COLLECTION_SELECT)
    .limit(1)
  if (error) throw adminWriteError('collection insert', error)
  const row = (data || [])[0] as Record<string, unknown> | undefined
  if (!row) throw new Error('Collection create returned no row.')
  return mapCollection(row)
}

/** Quick image-only update keyed by collection_id (fallback: collection_slug). */
export async function updateCollectionImage(
  collection: Pick<HymnCollectionRow, 'id' | 'slug'>,
  image: { image_path: string | null; image_alt: string | null },
): Promise<HymnCollectionRow> {
  await requireStaffSession()
  const payload = {
    image_path: image.image_path?.trim() || null,
    image_alt: image.image_alt?.trim() || null,
  }
  let query = db()
    .from(T.collections as never)
    .update(payload as never)
    .eq('collection_id', collection.id)
    .select(COLLECTION_SELECT)
    .limit(1)
  let { data, error } = await query
  if (error) throw adminWriteError('collection image update', error)
  let row = (data || [])[0] as Record<string, unknown> | undefined
  if (!row && collection.slug) {
    const bySlug = await db()
      .from(T.collections as never)
      .update(payload as never)
      .eq('collection_slug', collection.slug)
      .select(COLLECTION_SELECT)
      .limit(1)
    if (bySlug.error) throw adminWriteError('collection image update by slug', bySlug.error)
    row = (bySlug.data || [])[0] as Record<string, unknown> | undefined
  }
  if (!row) throw new Error('Collection image update returned no row.')
  return mapCollection(row)
}

/** @deprecated Prefer saveHymnCollection */
export async function saveHymnBrowseGroup(
  input: Partial<HymnCollectionRow> & { title: string; slug: string },
  existingId?: string | null,
): Promise<HymnCollectionRow> {
  return saveHymnCollection(input, existingId)
}

export async function listHymnSectionsForCollection(collectionId: string): Promise<HymnSectionRow[]> {
  // collectionId may be collection_id or collection_slug
  const collection = await getHymnCollection(collectionId).catch(() => null)
  const slug = collection?.slug || collectionId
  const { data, error } = await db()
    .from(T.sections as never)
    .select(SECTION_SELECT)
    .eq('collection_slug', slug)
    .order('sort_order')
  if (error) throw new Error(errorMessage(error))
  return ((data || []) as Record<string, unknown>[]).map(mapSection)
}

/** @deprecated Prefer listHymnSectionsForCollection */
export async function listHymnBrowseGroupItems(groupId: string): Promise<HymnSectionRow[]> {
  return listHymnSectionsForCollection(groupId)
}

export async function saveHymnSection(
  input: Partial<HymnSectionRow> & {
    collection_id: string
    title: string
    slug: string
  },
  existingId?: string | null,
): Promise<HymnSectionRow> {
  await requireStaffSession()
  const collection = await getHymnCollection(input.collection_id).catch(() => null)
  const collectionSlug = collection?.slug || input.collection_slug || input.collection_id
  const payload = {
    collection_slug: collectionSlug,
    section_slug: input.slug.trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic?.trim() || null,
    description: input.description?.trim() || null,
    description_amharic: input.description_amharic?.trim() || null,
    image_path: input.image_path?.trim() || null,
    image_alt: input.image_alt?.trim() || null,
    section_type: input.section_type || 'general',
    sort_order: asImportSortOrder(input.sort_order),
    is_featured: asImportFeatured(input.is_featured),
    status: input.status || 'published',
  }
  if (existingId) {
    const { data, error } = await db()
      .from(T.sections as never)
      .update(payload as never)
      .eq('section_id', existingId)
      .select(SECTION_SELECT)
      .limit(1)
    if (error) throw adminWriteError('section update by section_id', error)
    let row = (data || [])[0] as Record<string, unknown> | undefined
    if (!row) {
      const sectionSlug = existingId.includes(':')
        ? existingId.split(':').pop() || existingId
        : existingId
      const bySlug = await db()
        .from(T.sections as never)
        .update(payload as never)
        .eq('section_slug', sectionSlug)
        .eq('collection_slug', collectionSlug)
        .select(SECTION_SELECT)
        .limit(1)
      if (bySlug.error) {
        throw adminWriteError('section update by collection_slug+section_slug', bySlug.error)
      }
      row = (bySlug.data || [])[0] as Record<string, unknown> | undefined
    }
    if (!row) throw new Error('Section update returned no row.')
    return mapSection(row)
  }
  const insertPayload = {
    ...payload,
    section_id: crypto.randomUUID(),
  }
  const { data, error } = await db()
    .from(T.sections as never)
    .insert(insertPayload as never)
    .select(SECTION_SELECT)
    .limit(1)
  if (error) throw adminWriteError('section insert', error)
  const row = (data || [])[0] as Record<string, unknown> | undefined
  if (!row) throw new Error('Section create returned no row.')
  return mapSection(row)
}

/** Quick image-only update keyed by section_id (fallback: collection_slug + section_slug). */
export async function updateSectionImage(
  section: Pick<HymnSectionRow, 'id' | 'slug' | 'collection_slug' | 'collection_id'>,
  image: { image_path: string | null; image_alt: string | null },
): Promise<HymnSectionRow> {
  await requireStaffSession()
  const payload = {
    image_path: image.image_path?.trim() || null,
    image_alt: image.image_alt?.trim() || null,
  }
  const sectionId = section.id?.trim() || ''
  const looksLikeId = Boolean(sectionId) && !sectionId.includes(':')

  if (looksLikeId) {
    const { data, error } = await db()
      .from(T.sections as never)
      .update(payload as never)
      .eq('section_id', sectionId)
      .select(SECTION_SELECT)
      .limit(1)
    if (error) throw adminWriteError('section image update by section_id', error)
    const row = (data || [])[0] as Record<string, unknown> | undefined
    if (row) return mapSection(row)
  }

  const collectionSlug = (section.collection_slug || section.collection_id || '').trim()
  const sectionSlug = (section.slug || '').trim()
  if (!collectionSlug || !sectionSlug) {
    throw new Error('Section image update needs section_id or collection_slug + section_slug.')
  }
  const byPair = await db()
    .from(T.sections as never)
    .update(payload as never)
    .eq('collection_slug', collectionSlug)
    .eq('section_slug', sectionSlug)
    .select(SECTION_SELECT)
    .limit(1)
  if (byPair.error) throw adminWriteError('section image update by slug pair', byPair.error)
  const mapped = (byPair.data || [])[0] as Record<string, unknown> | undefined
  if (!mapped) throw new Error('Section image update returned no row.')
  return mapSection(mapped)
}

/** @deprecated Prefer saveHymnSection */
export async function saveHymnBrowseGroupItem(
  input: Partial<HymnSectionRow> & {
    browse_group_id?: string
    collection_id?: string
    title?: string
    slug?: string
    item_type?: string
    item_slug?: string | null
    display_title?: string | null
    display_title_amharic?: string | null
  },
  existingId?: string | null,
): Promise<HymnSectionRow> {
  return saveHymnSection(
    {
      collection_id: input.collection_id || input.browse_group_id || '',
      title: (input.title || input.display_title || input.item_slug || 'Untitled').trim(),
      slug: (input.slug || input.item_slug || 'untitled').trim(),
      title_amharic: input.title_amharic ?? input.display_title_amharic ?? null,
      description: input.description ?? null,
      description_amharic: input.description_amharic ?? null,
      image_path: input.image_path ?? null,
      image_alt: input.image_alt ?? null,
      section_type: input.section_type || input.item_type || 'general',
      sort_order: input.sort_order ?? 0,
      is_featured: Boolean(input.is_featured),
      status: input.status || 'published',
    },
    existingId,
  )
}

export async function removeHymnSection(id: string): Promise<void> {
  const { error } = await db().from(T.sections as never).delete().eq('section_id', id)
  if (error) {
    // Fallback composite id "collection:section"
    if (id.includes(':')) {
      const [collectionSlug, sectionSlug] = id.split(':')
      const retry = await db()
        .from(T.sections as never)
        .delete()
        .eq('collection_slug', collectionSlug)
        .eq('section_slug', sectionSlug)
      if (retry.error) throw new Error(errorMessage(retry.error))
      return
    }
    throw new Error(errorMessage(error))
  }
}

/** @deprecated Prefer removeHymnSection */
export async function removeHymnBrowseGroupItem(id: string): Promise<void> {
  return removeHymnSection(id)
}

export async function listAllHymnSections(): Promise<HymnSectionRow[]> {
  const { data, error } = await db()
    .from(T.sections as never)
    .select(SECTION_SELECT)
    .neq('status', 'archived')
    .order('title')
  if (error) throw new Error(errorMessage(error))
  return ((data || []) as Record<string, unknown>[]).map(mapSection)
}

async function resolveMezmurSlug(mezmurIdOrSlug: string): Promise<string> {
  const needle = mezmurIdOrSlug.trim()
  const byId = await db()
    .from(T.data as never)
    .select('slug, mezmur_id')
    .eq('mezmur_id', needle)
    .limit(1)
  if (!byId.error && byId.data?.[0]) {
    return txt((byId.data[0] as { slug?: string }).slug) || needle
  }
  const bySlug = await db()
    .from(T.data as never)
    .select('slug')
    .eq('slug', needle)
    .limit(1)
  if (!bySlug.error && bySlug.data?.[0]) {
    return txt((bySlug.data[0] as { slug?: string }).slug) || needle
  }
  return needle
}

export async function listMezmurSectionLinks(mezmurId: string): Promise<MezmurSectionLinkRow[]> {
  const mezmurSlug = await resolveMezmurSlug(mezmurId)
  const { data, error } = await db()
    .from(T.links as never)
    .select('mezmur_slug, section_slug, sort_order, is_primary')
    .eq('mezmur_slug', mezmurSlug)
    .order('sort_order')
  if (error) throw new Error(errorMessage(error))

  const sections = await listAllHymnSections().catch(() => [] as HymnSectionRow[])
  const bySlug = new Map(sections.map((s) => [s.slug, s]))

  return ((data || []) as Record<string, unknown>[]).map((row) => {
    const sectionSlug = txt(row.section_slug)
    const section = bySlug.get(sectionSlug)
    return {
      mezmur_id: mezmurId,
      section_id: section?.id || sectionSlug,
      mezmur_slug: mezmurSlug,
      section_slug: sectionSlug,
      sort_order: Number(row.sort_order) || 0,
      is_primary: truthy(row.is_primary),
    }
  })
}

export async function setMezmurSectionLinks(
  mezmurId: string,
  sectionIds: string[],
): Promise<void> {
  const mezmurSlug = await resolveMezmurSlug(mezmurId)
  const sections = await listAllHymnSections().catch(() => [] as HymnSectionRow[])
  const byId = new Map(sections.map((s) => [s.id, s]))
  const bySlug = new Map(sections.map((s) => [s.slug, s]))

  const unique = [...new Set(sectionIds.filter(Boolean))]
  const { error: delErr } = await db()
    .from(T.links as never)
    .delete()
    .eq('mezmur_slug', mezmurSlug)
  if (delErr) throw new Error(errorMessage(delErr))
  if (!unique.length) return

  const rows = unique.map((sectionId, index) => {
    const section = byId.get(sectionId) || bySlug.get(sectionId)
    return {
      mezmur_slug: mezmurSlug,
      section_slug: section?.slug || sectionId,
      sort_order: (index + 1) * 10,
      is_primary: index === 0,
    }
  })
  const { error } = await db().from(T.links as never).insert(rows as never)
  if (error) throw new Error(errorMessage(error))
}
