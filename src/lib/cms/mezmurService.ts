/**
 * Admin Mezmur data access — ACTIVE SOURCE: mezmur_data_import
 * (public.mezmur and public.singers do not exist.)
 */
import { supabase } from '../supabase/client'
import type { ContentStatus } from '../supabase/cms.types'
import { resolveContentMediaUrl } from './contentMedia'
import { mapStaffWriteError, requireCmsStaffSession } from './cmsStaffAuth'

const DATA = 'mezmur_data_import' as const

export type ImportMezmurRow = {
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
  search_keywords: string | string[] | null
  status: string | null
  review_status: string | null
  review_notes: string | null
  source_url: string | null
  source_notes: string | null
  created_at: string | null
  updated_at: string | null
}

/** Normalized Mezmur shape for admin UI (id = mezmur_id). */
export type Mezmur = {
  id: string
  mezmur_id: string
  slug: string
  title: string
  title_amharic: string | null
  title_english: string | null
  title_oromo: string | null
  description: string | null
  description_amharic: string | null
  lyrics_amharic: string | null
  lyrics_english: string | null
  lyrics_oromo: string | null
  lyrics_geez: string | null
  transliteration: string | null
  youtube_url: string | null
  audio_url: string | null
  thumbnail_url: string | null
  thumbnail_path: string | null
  image_alt: string | null
  singer_id: string | null
  singer_slug: string | null
  singer_name: string | null
  zemari_id: string | null
  category_id: string | null
  language: string | null
  form: 'mezmur' | 'werb' | null
  category: string | null
  occasion: string | null
  occasion_tags: string[]
  saint_or_angel: string | null
  saint_tags: string[]
  themes: string[]
  search_keywords: string[]
  source: string | null
  status: ContentStatus
  featured: boolean
  published_at: string | null
  created_at: string
  updated_at: string
  created_by: string | null
  updated_by: string | null
  source_submission_id: string | null
  contributor_credit: string | null
}

export type Version = {
  id: string
  content_type: string
  content_id: string
  snapshot: unknown
  changed_by: string | null
  created_at: string
}

export type Category = {
  id: string
  name: string
  name_amharic: string | null
  slug: string
  description: string | null
  type: string
  is_archived: boolean
  created_at?: string
  updated_at?: string
}

export type Singer = {
  id: string
  name: string
  name_amharic: string | null
  description: string | null
  image_url: string | null
  is_archived: boolean
  slug?: string
  mezmur_count?: number
  created_at?: string
  updated_at?: string
}

export type Tag = { id: string; name: string; slug: string }

export const statuses: ContentStatus[] = [
  'draft',
  'pending_review',
  'published',
  'rejected',
  'archived',
]

export function db() {
  if (!supabase) throw new Error('Supabase is not configured.')
  return supabase
}

export function errorMessage(error: unknown) {
  if (typeof error === 'object' && error && 'code' in error) {
    const code = String((error as { code?: unknown }).code || '')
    const message = 'message' in error ? String((error as { message?: unknown }).message || '') : ''
    const details = 'details' in error ? String((error as { details?: unknown }).details || '') : ''
    const hint = 'hint' in error ? String((error as { hint?: unknown }).hint || '') : ''
    if (code === 'PGRST116') return 'This item was not found, or you do not have permission to view it.'
    if (/mezmur not found/i.test(message) || /mezmur no longer available/i.test(message)) {
      return 'This Mezmur no longer exists. Return to the library or create a new draft.'
    }
    if (code === '23505') return 'This slug already exists. Choose a unique slug.'
    if (code === '23503') {
      return 'This item is in use, or a selected category, singer, or tag no longer exists.'
    }
    if (code === '42501') {
      return 'You do not have permission to make this change. Your role or the content status may have changed.'
    }
    if (code === '42703' || /column .* does not exist/i.test(message)) {
      return import.meta.env.DEV
        ? `Database column mismatch: ${message}`
        : 'This form asked for a field that is not in the database yet.'
    }
    if (code === 'PGRST205' || /Could not find the table|relation .* does not exist/i.test(message)) {
      return import.meta.env.DEV
        ? `Missing table: ${message}`
        : 'This content source is unavailable. Try again later.'
    }
    if (import.meta.env.DEV && (message || details || hint)) {
      return [message, details, hint].filter(Boolean).join(' — ')
    }
    if (message && !/stack|exception|sqlstate/i.test(message)) return message
  }
  return error && typeof error === 'object' && 'message' in error
    ? String((error as { message?: unknown }).message)
    : 'Something went wrong. Please try again.'
}

export function slugify(text: string) {
  return text
    .normalize('NFKD')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

export function label(status: string) {
  return status.replaceAll('_', ' ')
}

function txt(value: unknown): string {
  return String(value ?? '').trim()
}

function parseKeywords(value: unknown): string[] {
  if (Array.isArray(value)) return value.map((v) => txt(v)).filter(Boolean)
  const raw = txt(value)
  if (!raw) return []
  return raw
    .split(/[|,;]+/)
    .map((v) => v.trim())
    .filter(Boolean)
}

function normalizeForm(value: unknown): 'mezmur' | 'werb' | null {
  const v = txt(value).toLowerCase()
  if (v === 'werb' || v === 'wereb') return 'werb'
  if (v === 'mezmur') return 'mezmur'
  return null
}

function normalizeStatus(value: unknown): ContentStatus {
  const v = txt(value).toLowerCase()
  if (statuses.includes(v as ContentStatus)) return v as ContentStatus
  if (v === 'active' || v === 'true' || v === '1') return 'published'
  return (v || 'draft') as ContentStatus
}

export function mapImportMezmur(row: ImportMezmurRow | Record<string, unknown>): Mezmur {
  const r = row as ImportMezmurRow
  const mezmurId = txt(r.mezmur_id) || txt((row as { id?: unknown }).id) || txt(r.slug)
  const image = txt(r.image_path) || txt(r.legacy_thumbnail_url) || null
  const updated = txt(r.updated_at) || txt(r.created_at) || new Date(0).toISOString()
  const created = txt(r.created_at) || updated
  return {
    id: mezmurId,
    mezmur_id: mezmurId,
    slug: txt(r.slug),
    title: txt(r.title),
    title_amharic: txt(r.title_amharic) || null,
    title_english: txt(r.title_english) || null,
    title_oromo: null,
    description: txt(r.description) || null,
    description_amharic: txt(r.description_amharic) || null,
    lyrics_amharic: txt(r.lyrics_amharic) || null,
    lyrics_english: txt(r.lyrics_english) || null,
    lyrics_oromo: txt(r.lyrics_oromo) || null,
    lyrics_geez: txt(r.lyrics_geez) || null,
    transliteration: txt(r.lyrics_transliteration) || null,
    youtube_url: txt(r.youtube_url) || null,
    audio_url: txt(r.audio_url) || null,
    thumbnail_url: image,
    thumbnail_path: txt(r.image_path) || null,
    image_alt: txt(r.image_alt) || null,
    singer_id: txt(r.singer_id) || null,
    singer_slug: txt(r.singer_slug) || null,
    singer_name: txt(r.singer_name) || null,
    zemari_id: txt(r.zemari_id) || null,
    category_id: null,
    language: txt(r.primary_language) || null,
    form: normalizeForm(r.form),
    category: null,
    occasion: null,
    occasion_tags: [],
    saint_or_angel: null,
    saint_tags: [],
    themes: [],
    search_keywords: parseKeywords(r.search_keywords),
    source: txt(r.source_url) || txt(r.source_notes) || null,
    status: normalizeStatus(r.status),
    featured: false,
    published_at: null,
    created_at: created,
    updated_at: updated,
    created_by: null,
    updated_by: null,
    source_submission_id: null,
    contributor_credit: null,
  }
}

export const editableKeys = [
  'title',
  'title_amharic',
  'slug',
  'description',
  'singer_id',
  'zemari_id',
  'category_id',
  'lyrics_amharic',
  'lyrics_english',
  'transliteration',
  'youtube_url',
  'audio_url',
  'thumbnail_url',
  'thumbnail_path',
  'image_alt',
  'language',
  'form',
  'category',
  'occasion',
  'featured',
  'status',
] as const

export type MezmurInput = Pick<Mezmur, (typeof editableKeys)[number]>

export function editable(row: Mezmur): MezmurInput {
  return Object.fromEntries(
    editableKeys.map((key) => [key, row[key as keyof Mezmur] ?? null]),
  ) as MezmurInput
}

export function emptyMezmur(): MezmurInput {
  return {
    title: '',
    title_amharic: '',
    slug: '',
    description: '',
    singer_id: null,
    zemari_id: null,
    category_id: null,
    lyrics_amharic: '',
    lyrics_english: '',
    transliteration: '',
    youtube_url: '',
    audio_url: '',
    thumbnail_url: '',
    thumbnail_path: '',
    image_alt: '',
    language: 'amharic',
    form: 'mezmur',
    category: null,
    occasion: null,
    featured: false,
    status: 'draft',
  }
}

export const PAGE_SIZE = 20

export type Filters = {
  search?: string
  status?: string
  category?: string
  singer?: string
  featured?: string
  sort?: string
  page?: number
}

const LIST_SELECT =
  'mezmur_id, slug, title, title_amharic, title_english, description, description_amharic, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo, primary_language, form, singer_id, singer_slug, singer_name, zemari_id, youtube_url, audio_url, image_path, image_alt, legacy_thumbnail_url, search_keywords, status, review_status, review_notes, source_url, source_notes, created_at, updated_at'

export async function listMezmur(filters: Filters = {}) {
  let query = db().from(DATA as never).select(LIST_SELECT, { count: 'exact' })
  const search = filters.search?.replace(/[,().%_*\\]/g, ' ').trim()
  if (search) {
    query = query.or(
      [
        `title.ilike.%${search}%`,
        `title_amharic.ilike.%${search}%`,
        `title_english.ilike.%${search}%`,
        `lyrics_amharic.ilike.%${search}%`,
        `lyrics_transliteration.ilike.%${search}%`,
        `lyrics_english.ilike.%${search}%`,
        `description.ilike.%${search}%`,
        `singer_name.ilike.%${search}%`,
        `search_keywords.ilike.%${search}%`,
        `slug.ilike.%${search}%`,
      ].join(','),
    )
  }
  if (statuses.includes(filters.status as ContentStatus)) {
    query = query.eq('status', filters.status as ContentStatus)
  }
  if (filters.singer) {
    query = query.or(`singer_id.eq.${filters.singer},zemari_id.eq.${filters.singer}`)
  }
  // featured / category_id do not exist on import — ignore filters that cannot apply

  const sorts = {
    updated: ['updated_at', false],
    oldest: ['updated_at', true],
    title: ['title', true],
    published: ['updated_at', false],
  } as const
  const [column, ascending] = sorts[filters.sort as keyof typeof sorts] || sorts.updated
  const page = Math.max(1, filters.page || 1)
  const { data, error, count } = await query
    .order(column, { ascending, nullsFirst: false })
    .order('mezmur_id')
    .range((page - 1) * PAGE_SIZE, page * PAGE_SIZE - 1)
  if (error) throw error
  return {
    rows: ((data || []) as ImportMezmurRow[]).map(mapImportMezmur),
    count: count || 0,
  }
}

export async function getPublishedMezmur(slug: string) {
  const { data, error } = await db()
    .from(DATA as never)
    .select(LIST_SELECT)
    .eq('slug', slug)
    .eq('status', 'published')
    .limit(1)
  if (error) throw error
  const row = (data || [])[0] as ImportMezmurRow | undefined
  return row ? mapImportMezmur(row) : null
}

export async function listPublishedMezmur(page = 1) {
  return listMezmur({ status: 'published', sort: 'published', page })
}

export async function getMezmur(id: string) {
  const needle = id.trim()
  if (!needle) return null
  // Prefer mezmur_id; also allow slug for legacy edit URLs.
  const first = await db()
    .from(DATA as never)
    .select(LIST_SELECT)
    .eq('mezmur_id', needle)
    .limit(1)
  if (first.error) throw first.error
  let row = (first.data || [])[0] as ImportMezmurRow | undefined
  if (!row) {
    const bySlug = await db().from(DATA as never).select(LIST_SELECT).eq('slug', needle).limit(1)
    if (bySlug.error) throw bySlug.error
    row = (bySlug.data || [])[0] as ImportMezmurRow | undefined
  }
  return row ? mapImportMezmur(row) : null
}

async function allRows<T>(
  fetchPage: (offset: number) => PromiseLike<{ data: T[] | null; error: unknown }>,
) {
  const rows: T[] = []
  for (let offset = 0; ; offset += 500) {
    const { data, error } = await fetchPage(offset)
    if (error) throw error
    rows.push(...(data || []))
    if (!data || data.length < 500) return rows
  }
}

async function loadDerivedSingers(): Promise<Singer[]> {
  try {
    const { listZemaris } = await import('./zemariAdminService')
    const rows = await listZemaris({ status: 'all' })
    return rows.map((row) => ({
      id: row.id,
      name: row.name,
      name_amharic: row.name_amharic,
      description: row.bio,
      image_url: row.image_path ? resolveContentMediaUrl(row.image_path) : null,
      is_archived: row.status === 'archived',
      slug: row.slug,
      mezmur_count: row.mezmur_count || 0,
    }))
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[mezmurService] zemaris taxonomy', cause)
    return []
  }
}

async function loadDerivedCategories(): Promise<Category[]> {
  try {
    const { listDerivedCategories } = await import('./hymnTaxonomyImport')
    const rows = await listDerivedCategories()
    return rows.map((row) => ({
      id: row.slug,
      name: row.name,
      name_amharic: null,
      slug: row.slug,
      description: null,
      type: 'mezmur',
      is_archived: false,
    }))
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[mezmurService] derived categories', cause)
    return []
  }
}

export async function listTaxonomyOccasions() {
  const { listDerivedOccasions } = await import('./hymnTaxonomyImport')
  return listDerivedOccasions()
}

export async function getTaxonomy() {
  const [categories, singers, tags] = await Promise.all([
    loadDerivedCategories(),
    loadDerivedSingers(),
    // Tags metadata table is optional; never spam retries on miss.
    allRows<Tag>((n) =>
      db()
        .from('tags')
        .select('*')
        .order('name')
        .order('id')
        .range(n, n + 499)
        .then((result) => {
          if (result.error) {
            if (import.meta.env.DEV) console.error('[mezmurService] tags', result.error)
            return { data: [] as Tag[], error: null }
          }
          return result
        }),
    ).catch(() => [] as Tag[]),
  ])
  return { categories, singers, tags }
}

export async function getTagIds(_id: string) {
  // mezmur_tags may not exist with the import schema — do not 404 spam.
  return [] as string[]
}

function toImportPayload(input: MezmurInput, existing?: Mezmur): Record<string, unknown> {
  const mezmurId = existing?.mezmur_id || existing?.id || crypto.randomUUID()
  const zemariId = input.zemari_id || input.singer_id || null
  return {
    mezmur_id: mezmurId,
    slug: input.slug.trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic?.trim() || null,
    description: input.description?.trim() || null,
    lyrics_amharic: input.lyrics_amharic?.trim() || null,
    lyrics_transliteration: input.transliteration?.trim() || null,
    lyrics_english: input.lyrics_english?.trim() || null,
    primary_language: input.language?.trim() || null,
    form: input.form || null,
    zemari_id: zemariId,
    singer_id: zemariId || input.singer_id || null,
    youtube_url: input.youtube_url?.trim() || null,
    audio_url: input.audio_url?.trim() || null,
    image_path: input.thumbnail_path?.trim() || input.thumbnail_url?.trim() || null,
    image_alt: input.image_alt?.trim() || null,
    status: input.status,
    updated_at: new Date().toISOString(),
  }
}

export async function saveMezmur(input: MezmurInput, _tags: string[], existing?: Mezmur) {
  await requireCmsStaffSession('mezmur save')
  const payload = toImportPayload(input, existing)
  const zemariId = String(payload.zemari_id || '').trim()
  if (zemariId) {
    try {
      const { getZemari } = await import('./zemariAdminService')
      const z = await getZemari(zemariId)
      payload.singer_id = z.id
      payload.singer_slug = z.slug
      payload.singer_name = z.name
      payload.zemari_id = z.id
    } catch {
      /* keep payload as-is if zemari lookup fails */
    }
  } else {
    payload.zemari_id = null
    payload.singer_id = null
    payload.singer_slug = null
    payload.singer_name = null
  }
  if (existing?.mezmur_id || existing?.id) {
    const id = existing.mezmur_id || existing.id
    let { data, error } = await db()
      .from(DATA as never)
      .update(payload as never)
      .eq('mezmur_id', id)
      .select(LIST_SELECT)
      .limit(1)
    if (error && /zemari_id/i.test(error.message || '') && error.code !== '42501') {
      const { zemari_id: _drop, ...withoutZemari } = payload
      const retry = await db()
        .from(DATA as never)
        .update(withoutZemari as never)
        .eq('mezmur_id', id)
        .select(LIST_SELECT.replace(', zemari_id', ''))
        .limit(1)
      error = retry.error
      data = retry.data
    }
    if (error) throw mapStaffWriteError('mezmur update', error)
    let row = (data || [])[0] as ImportMezmurRow | undefined
    if (!row && existing.slug) {
      const bySlug = await db()
        .from(DATA as never)
        .update(payload as never)
        .eq('slug', existing.slug)
        .select(LIST_SELECT)
        .limit(1)
      if (bySlug.error) throw mapStaffWriteError('mezmur update by slug', bySlug.error)
      row = (bySlug.data || [])[0] as ImportMezmurRow | undefined
    }
    if (!row) throw new Error('No saved record was returned.')
    return mapImportMezmur(row)
  }
  if (!payload.created_at) payload.created_at = new Date().toISOString()
  const { data, error } = await db()
    .from(DATA as never)
    .insert(payload as never)
    .select(LIST_SELECT)
    .limit(1)
  if (error) throw mapStaffWriteError('mezmur insert', error)
  const row = (data || [])[0] as ImportMezmurRow | undefined
  if (!row) throw new Error('No saved record was returned.')
  return mapImportMezmur(row)
}

export async function duplicateMezmur(row: Mezmur) {
  return saveMezmur(
    {
      ...editable(row),
      title: `${row.title} (copy)`,
      slug: `${row.slug}-copy-${crypto.randomUUID().slice(0, 8)}`,
      status: 'draft',
      featured: false,
      audio_url: null,
      thumbnail_url: null,
      thumbnail_path: null,
    },
    [],
  )
}

export async function deleteMezmur(row: Mezmur) {
  const id = row.mezmur_id || row.id
  const { data, error } = await db()
    .from(DATA as never)
    .delete()
    .eq('mezmur_id', id)
    .select('mezmur_id')
  if (error) throw error
  if (!data?.length) {
    throw new Error('Content changed or you no longer have permission. Refresh the list.')
  }
}

export async function getVersions(_id: string) {
  // content_versions tied to old public.mezmur — skip without 404 spam
  return { versions: [] as Version[], authors: [] as { id: string; display_name: string }[] }
}

export function parseVersion(
  version: Version,
): { input: MezmurInput; tags: string[] | null } | null {
  const snapshot = version.snapshot
  if (!snapshot || typeof snapshot !== 'object' || Array.isArray(snapshot)) return null
  const record = (snapshot as { record?: Record<string, unknown> }).record
  if (
    !record ||
    typeof record !== 'object' ||
    Array.isArray(record) ||
    typeof record.title !== 'string' ||
    typeof record.slug !== 'string'
  ) {
    return null
  }
  const input = emptyMezmur()
  for (const key of editableKeys) {
    if (key === 'featured') input.featured = record.featured === true
    else if (key === 'status') {
      input.status = statuses.includes(record.status as ContentStatus)
        ? (record.status as ContentStatus)
        : 'draft'
    } else if (key === 'form') {
      input.form = record.form === 'mezmur' || record.form === 'werb' ? record.form : null
    } else if (typeof record[key] === 'string' || record[key] === null) {
      ;(input as Record<string, unknown>)[key] = record[key]
    }
  }
  const tagIds = (snapshot as { tag_ids?: unknown }).tag_ids
  return {
    input,
    tags: Array.isArray(tagIds) ? tagIds.filter((id): id is string => typeof id === 'string') : null,
  }
}

export async function getDashboard() {
  const otherTypes = ['saints', 'feasts', 'prayers', 'articles'] as const

  const countTotal = await db().from(DATA as never).select('mezmur_id', { count: 'exact', head: true })
  const countPublished = await db()
    .from(DATA as never)
    .select('mezmur_id', { count: 'exact', head: true })
    .eq('status', 'published')
  const countDraft = await db()
    .from(DATA as never)
    .select('mezmur_id', { count: 'exact', head: true })
    .eq('status', 'draft')
  const countPending = await db()
    .from(DATA as never)
    .select('mezmur_id', { count: 'exact', head: true })
    .eq('status', 'pending_review')
  const countSaints = await db().from('saints').select('id', { count: 'exact', head: true })
  const countArticles = await db().from('articles').select('id', { count: 'exact', head: true })

  const counts = [
    countTotal,
    countPublished,
    countDraft,
    countPending,
    countSaints,
    countArticles,
  ]
  for (const result of counts) {
    if (result.error) {
      // Soft-fail non-mezmur tables; hard-fail mezmur_data_import
      const isMezmur =
        result === countTotal ||
        result === countPublished ||
        result === countDraft ||
        result === countPending
      if (isMezmur) throw result.error
      if (import.meta.env.DEV) console.error('[getDashboard] count', result.error)
    }
  }

  async function recentMezmur(mode: 'edited' | 'published' | 'review') {
    let query = db()
      .from(DATA as never)
      .select('mezmur_id, slug, title, title_amharic, status, updated_at, created_at')
    if (mode === 'published') query = query.eq('status', 'published')
    if (mode === 'review') query = query.eq('status', 'pending_review')
    const { data, error } = await query.order('updated_at', { ascending: mode === 'review' }).limit(5)
    if (error) throw error
    return ((data || []) as Array<Record<string, unknown>>).map((row) => ({
      id: String(row.mezmur_id || ''),
      title: String(row.title || ''),
      status: String(row.status || ''),
      updated_at: String(row.updated_at || row.created_at || ''),
      published_at: null as string | null,
      type: 'mezmur' as const,
    }))
  }

  async function recentOther(mode: 'edited' | 'published' | 'review') {
    const rows = await Promise.all(
      otherTypes.map(async (type) => {
        try {
          let query = db().from(type).select('id,title,status,updated_at')
          if (mode === 'published') query = query.eq('status', 'published')
          if (mode === 'review') query = query.eq('status', 'pending_review')
          const { data, error } = await query.order('updated_at', { ascending: mode === 'review' }).limit(5)
          if (error) {
            if (import.meta.env.DEV) console.error(`[getDashboard] recent ${type}`, error)
            return []
          }
          return (data || []).map((row) => ({
            ...row,
            published_at: null as string | null,
            type,
          }))
        } catch (cause) {
          if (import.meta.env.DEV) console.error(`[getDashboard] recent ${type}`, cause)
          return []
        }
      }),
    )
    return rows.flat()
  }

  async function recent(mode: 'edited' | 'published' | 'review') {
    const [mezmurRows, otherRows] = await Promise.all([recentMezmur(mode), recentOther(mode)])
    return [...mezmurRows, ...otherRows]
      .sort((a, b) => {
        const key = 'updated_at' as const
        return mode === 'review'
          ? (a[key] || '').localeCompare(b[key] || '')
          : (b[key] || '').localeCompare(a[key] || '')
      })
      .slice(0, 5)
  }

  const [edited, published, review] = await Promise.all([
    recent('edited'),
    recent('published'),
    recent('review'),
  ])

  return {
    counts: counts.map((result) => result.count || 0),
    edited,
    published,
    review,
  }
}
