/**
 * Admin CMS for Zemari / singer profiles — public.zemaris
 * Mezmurs link via mezmur_data_import.zemari_id.
 */
import { db, errorMessage } from './mezmurService'
import { resolveContentMediaUrl } from './contentMedia'
import { mapStaffWriteError, requireCmsStaffSession } from './cmsStaffAuth'

export type ZemariRow = {
  id: string
  slug: string
  name: string
  name_amharic: string | null
  bio: string | null
  bio_amharic: string | null
  image_path: string | null
  image_alt: string | null
  youtube_url: string | null
  website_url: string | null
  sort_order: number
  is_featured: boolean
  status: 'draft' | 'published' | 'archived' | string
  created_at: string | null
  updated_at: string | null
  mezmur_count?: number
  published_mezmur_count?: number
}

export type ZemariMezmurLink = {
  mezmur_id: string | null
  slug: string
  title: string
  title_amharic: string | null
  status: string | null
  zemari_id: string | null
}

const TABLE = 'zemaris' as const
const VIEW = 'zemaris_with_counts' as const
const DATA = 'mezmur_data_import' as const

let viewMissing = false

const ZEMARI_SELECT =
  'id, slug, name, name_amharic, bio, bio_amharic, image_path, image_alt, youtube_url, website_url, sort_order, is_featured, status, created_at, updated_at'

const VIEW_SELECT = `${ZEMARI_SELECT}, mezmur_count, published_mezmur_count`

function txt(value: unknown) {
  return String(value ?? '').trim()
}

function mapZemari(row: Record<string, unknown>): ZemariRow {
  return {
    id: txt(row.id),
    slug: txt(row.slug),
    name: txt(row.name) || txt(row.slug),
    name_amharic: txt(row.name_amharic) || null,
    bio: txt(row.bio) || null,
    bio_amharic: txt(row.bio_amharic) || null,
    image_path: txt(row.image_path) || null,
    image_alt: txt(row.image_alt) || null,
    youtube_url: txt(row.youtube_url) || null,
    website_url: txt(row.website_url) || null,
    sort_order: Number(row.sort_order) || 0,
    is_featured: Boolean(row.is_featured),
    status: (txt(row.status) || 'published') as ZemariRow['status'],
    created_at: txt(row.created_at) || null,
    updated_at: txt(row.updated_at) || null,
    mezmur_count: Number(row.mezmur_count) || 0,
    published_mezmur_count: Number(row.published_mezmur_count) || 0,
  }
}

function adminWriteError(scope: string, error: { code?: string; message?: string } | null): Error {
  return mapStaffWriteError(scope, error)
}

async function requireStaffSession(): Promise<void> {
  await requireCmsStaffSession('zemari')
}

export function zemariImagePreviewUrl(path: string | null | undefined): string {
  return path ? resolveContentMediaUrl(path) : ''
}

export function slugifyZemari(value: string) {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
    .slice(0, 80)
}

export type ZemariListFilters = {
  search?: string
  status?: 'all' | 'draft' | 'published' | 'archived'
  featured?: boolean
  hasMezmurs?: 'all' | 'yes' | 'no'
}

export async function listZemaris(filters: ZemariListFilters = {}): Promise<ZemariRow[]> {
  if (!viewMissing) {
    let query = db().from(VIEW as never).select(VIEW_SELECT).order('sort_order').order('name')
    const status = filters.status || 'all'
    if (status !== 'all') query = query.eq('status', status)
    if (filters.featured) query = query.eq('is_featured', true)
    const search = filters.search?.replace(/[,().%_*\\]/g, ' ').trim()
    if (search) {
      query = query.or(
        [`name.ilike.%${search}%`, `name_amharic.ilike.%${search}%`, `slug.ilike.%${search}%`].join(','),
      )
    }
    const { data, error } = await query
    if (!error) {
      let rows = ((data || []) as Record<string, unknown>[]).map(mapZemari)
      if (filters.hasMezmurs === 'yes') {
        rows = rows.filter((r) => (r.mezmur_count || 0) > 0)
      } else if (filters.hasMezmurs === 'no') {
        rows = rows.filter((r) => (r.mezmur_count || 0) === 0)
      }
      return rows
    }
    if (/zemaris_with_counts|PGRST205|Could not find/i.test(error.message || '')) {
      viewMissing = true
    } else {
      throw new Error(errorMessage(error))
    }
  }

  let plain = db().from(TABLE as never).select(ZEMARI_SELECT).order('sort_order').order('name')
  const status = filters.status || 'all'
  if (status !== 'all') plain = plain.eq('status', status)
  if (filters.featured) plain = plain.eq('is_featured', true)
  const search = filters.search?.replace(/[,().%_*\\]/g, ' ').trim()
  if (search) {
    plain = plain.or(
      [`name.ilike.%${search}%`, `name_amharic.ilike.%${search}%`, `slug.ilike.%${search}%`].join(','),
    )
  }
  const { data, error } = await plain
  if (error) throw new Error(errorMessage(error))
  return ((data || []) as Record<string, unknown>[]).map(mapZemari)
}

export async function listPublishedZemarisWithMezmurs(): Promise<ZemariRow[]> {
  if (viewMissing) return []
  const { data, error } = await db()
    .from(VIEW as never)
    .select(VIEW_SELECT)
    .eq('status', 'published')
    .gt('published_mezmur_count', 0)
    .order('is_featured', { ascending: false })
    .order('sort_order')
    .order('name')
  if (error) {
    if (/zemaris_with_counts|PGRST205|Could not find/i.test(error.message || '')) {
      viewMissing = true
      return []
    }
    throw new Error(errorMessage(error))
  }
  return ((data || []) as Record<string, unknown>[]).map(mapZemari)
}

export async function getZemari(idOrSlug: string): Promise<ZemariRow> {
  const needle = idOrSlug.trim()
  if (!viewMissing) {
    let { data, error } = await db()
      .from(VIEW as never)
      .select(VIEW_SELECT)
      .eq('id', needle)
      .limit(1)
    if (error && /zemaris_with_counts|PGRST205/i.test(error.message || '')) {
      viewMissing = true
    } else if (error) {
      throw new Error(errorMessage(error))
    } else {
      let row = (data || [])[0] as Record<string, unknown> | undefined
      if (!row) {
        const bySlug = await db()
          .from(VIEW as never)
          .select(VIEW_SELECT)
          .eq('slug', needle)
          .limit(1)
        if (bySlug.error && /zemaris_with_counts|PGRST205/i.test(bySlug.error.message || '')) {
          viewMissing = true
        } else if (bySlug.error) {
          throw new Error(errorMessage(bySlug.error))
        } else {
          row = (bySlug.data || [])[0] as Record<string, unknown> | undefined
        }
      }
      if (row) return mapZemari(row)
    }
  }

  const plain = await db().from(TABLE as never).select(ZEMARI_SELECT).eq('id', needle).limit(1)
  let row = (plain.data || [])[0] as Record<string, unknown> | undefined
  if (!row) {
    const bySlug = await db().from(TABLE as never).select(ZEMARI_SELECT).eq('slug', needle).limit(1)
    row = (bySlug.data || [])[0] as Record<string, unknown> | undefined
  }
  if (!row) throw new Error('Zemari not found.')
  return mapZemari(row)
}

export async function saveZemari(
  input: Partial<ZemariRow> & { name: string; slug: string },
  existingId?: string | null,
): Promise<ZemariRow> {
  await requireStaffSession()
  const payload = {
    slug: input.slug.trim(),
    name: input.name.trim(),
    name_amharic: input.name_amharic?.trim() || null,
    bio: input.bio?.trim() || null,
    bio_amharic: input.bio_amharic?.trim() || null,
    image_path: input.image_path?.trim() || null,
    image_alt: input.image_alt?.trim() || null,
    youtube_url: input.youtube_url?.trim() || null,
    website_url: input.website_url?.trim() || null,
    sort_order: Number(input.sort_order) || 0,
    is_featured: Boolean(input.is_featured),
    status: input.status || 'draft',
  }
  let savedId = existingId || ''
  if (existingId) {
    const { data, error } = await db()
      .from(TABLE as never)
      .update(payload as never)
      .eq('id', existingId)
      .select('id')
      .limit(1)
    if (error) throw adminWriteError('zemari update', error)
    const row = (data || [])[0] as { id?: string } | undefined
    if (!row?.id) throw new Error('Zemari update returned no row.')
    savedId = row.id
  } else {
    const { data, error } = await db()
      .from(TABLE as never)
      .insert(payload as never)
      .select('id')
      .limit(1)
    if (error) throw adminWriteError('zemari insert', error)
    const row = (data || [])[0] as { id?: string } | undefined
    if (!row?.id) throw new Error('Zemari create returned no row.')
    savedId = row.id
  }
  // Refetch after write so UI sees DB truth (image_path, status, counts).
  return getZemari(savedId)
}

export async function listMezmursForZemari(zemariId: string): Promise<ZemariMezmurLink[]> {
  const { data, error } = await db()
    .from(DATA as never)
    .select('mezmur_id, slug, title, title_amharic, status, zemari_id')
    .eq('zemari_id', zemariId)
    .order('title')
  if (error) throw new Error(errorMessage(error))
  return ((data || []) as Record<string, unknown>[]).map((row) => ({
    mezmur_id: txt(row.mezmur_id) || null,
    slug: txt(row.slug),
    title: txt(row.title) || txt(row.slug),
    title_amharic: txt(row.title_amharic) || null,
    status: txt(row.status) || null,
    zemari_id: txt(row.zemari_id) || null,
  }))
}

export async function searchMezmursToLink(query: string, limit = 20): Promise<ZemariMezmurLink[]> {
  const q = query.replace(/[,().%_*\\]/g, ' ').trim()
  let request = db()
    .from(DATA as never)
    .select('mezmur_id, slug, title, title_amharic, status, zemari_id')
    .order('title')
    .limit(limit)
  if (q) {
    request = request.or(
      [`title.ilike.%${q}%`, `title_amharic.ilike.%${q}%`, `slug.ilike.%${q}%`].join(','),
    )
  }
  const { data, error } = await request
  if (error) throw new Error(errorMessage(error))
  return ((data || []) as Record<string, unknown>[]).map((row) => ({
    mezmur_id: txt(row.mezmur_id) || null,
    slug: txt(row.slug),
    title: txt(row.title) || txt(row.slug),
    title_amharic: txt(row.title_amharic) || null,
    status: txt(row.status) || null,
    zemari_id: txt(row.zemari_id) || null,
  }))
}

/** Set or clear mezmur_data_import.zemari_id; sync legacy singer fields when linking. */
export async function setMezmurZemari(
  mezmur: { mezmur_id?: string | null; slug: string },
  zemari: Pick<ZemariRow, 'id' | 'slug' | 'name'> | null,
): Promise<ZemariMezmurLink> {
  await requireStaffSession()
  const payload = {
    zemari_id: zemari?.id || null,
    singer_id: zemari?.id || null,
    singer_slug: zemari?.slug || null,
    singer_name: zemari?.name || null,
    updated_at: new Date().toISOString(),
  }
  const selectCols = 'mezmur_id, slug, title, title_amharic, status, zemari_id'
  const id = mezmur.mezmur_id?.trim()
  let row: Record<string, unknown> | undefined
  if (id) {
    const { data, error } = await db()
      .from(DATA as never)
      .update(payload as never)
      .eq('mezmur_id', id)
      .select(selectCols)
      .limit(1)
    if (error) throw adminWriteError('mezmur zemari link by id', error)
    row = (data || [])[0] as Record<string, unknown> | undefined
  }
  if (!row) {
    const slug = mezmur.slug.trim()
    if (!slug) throw new Error('Mezmur slug is required to update Zemari link.')
    const { data, error } = await db()
      .from(DATA as never)
      .update(payload as never)
      .eq('slug', slug)
      .select(selectCols)
      .limit(1)
    if (error) throw adminWriteError('mezmur zemari link by slug', error)
    row = (data || [])[0] as Record<string, unknown> | undefined
  }
  if (!row) throw new Error('Mezmur link update returned no row.')
  return {
    mezmur_id: txt(row.mezmur_id) || null,
    slug: txt(row.slug),
    title: txt(row.title) || txt(row.slug),
    title_amharic: txt(row.title_amharic) || null,
    status: txt(row.status) || null,
    zemari_id: txt(row.zemari_id) || null,
  }
}

export async function assignMezmurToZemari(
  zemari: Pick<ZemariRow, 'id' | 'slug' | 'name'>,
  mezmur: { mezmur_id?: string | null; slug: string },
): Promise<ZemariMezmurLink> {
  return setMezmurZemari(mezmur, zemari)
}

export async function removeMezmurFromZemari(mezmur: {
  mezmur_id?: string | null
  slug: string
}): Promise<ZemariMezmurLink> {
  return setMezmurZemari(mezmur, null)
}
