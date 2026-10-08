import { db, errorMessage } from './mezmurService'
import type { ContentStatus, ContentType } from '../supabase/cms.types'
import type { Json } from '../supabase/database.types'
import {
  ENCYCLOPEDIA_CATEGORIES,
  isCmsRelationType,
  mergeResolvedRelations,
  normalizeRelatedList,
  type Related,
  type ResolvedRelated,
} from './contentRelations.ts'

export const contentKinds = ['saints', 'feasts', 'articles'] as const
export type EditorialKind = (typeof contentKinds)[number]

export const contentPath = (kind: string, slug: string) =>
  kind === 'mezmur' ? `/practice/mezmur/${slug}` : `/content/${kind}/${slug}`

/** @deprecated Prefer ENCYCLOPEDIA_CATEGORIES from contentRelations */
export const teachingCategories = [...ENCYCLOPEDIA_CATEGORIES]

export type { Related, ResolvedRelated }
export {
  ENCYCLOPEDIA_CATEGORIES,
  encyclopediaTemplateKind,
  isEncyclopediaCategory,
  normalizeRelatedList,
  relationTypeLabel,
} from './contentRelations.ts'

/**
 * Columns expected after FIX_CONTENT_RELATIONS.sql / platform migration.
 * Keep selects/writes within these sets to avoid HTTP 400s on older DBs —
 * run the FIX script before relying on related_content in production.
 */
export const contentColumns = {
  saints: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'name',
    'name_amharic',
    'description',
    'body',
    'body_amharic',
    'thumbnail_url',
    'image_path',
    'image_alt',
    'related_content',
    'status',
    'created_by',
    'updated_at',
    'published_at',
    'created_at',
    'commemoration_month',
    'commemoration_day',
  ],
  feasts: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'description',
    'body',
    'body_amharic',
    'thumbnail_url',
    'image_path',
    'image_alt',
    'related_content',
    'status',
    'created_by',
    'updated_at',
    'published_at',
    'created_at',
    'ethiopian_month',
    'ethiopian_day',
    'is_movable',
    'fasting_info',
  ],
  articles: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'description',
    'thumbnail_url',
    'body',
    'body_amharic',
    'related_content',
    'teaching_category',
    'status',
    'updated_at',
    'published_at',
    'created_at',
  ],
} as const satisfies Record<EditorialKind, readonly string[]>

export type EditorialContent = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  title_oromo: string | null
  description: string | null
  body: string | null
  body_amharic: string | null
  body_oromo: string | null
  thumbnail_url: string | null
  image_path?: string | null
  image_alt?: string | null
  audio_url: string | null
  date_notes: string | null
    related_content: Related[]
  status: ContentStatus
  created_by: string | null
  updated_at: string
  published_at: string | null
  commemoration_month?: number | null
  commemoration_day?: number | null
  ethiopian_month?: number | null
  ethiopian_day?: number | null
  is_movable?: boolean | null
  fasting_info?: string | null
  teaching_category?: string | null
  transliteration?: string | null
}

export function emptyContent(): EditorialContent {
  return {
    id: crypto.randomUUID(),
    slug: '',
    title: '',
    title_amharic: '',
    title_oromo: '',
    description: '',
    body: '',
    body_amharic: '',
    body_oromo: '',
    thumbnail_url: '',
    image_path: '',
    image_alt: '',
    audio_url: '',
    date_notes: '',
    related_content: [],
    status: 'draft',
    created_by: null,
    updated_at: '',
    published_at: null,
    is_movable: false,
    commemoration_month: null,
    commemoration_day: null,
    ethiopian_month: null,
    ethiopian_day: null,
    fasting_info: '',
    teaching_category: null,
    transliteration: '',
  }
}

export function supportsContentField(kind: EditorialKind, field: string) {
  return (contentColumns[kind] as readonly string[]).includes(field)
}

function listSelect(kind: EditorialKind) {
  const cols = ['id', 'slug', 'title', 'title_amharic', 'status', 'updated_at', 'thumbnail_url']
  if (supportsContentField(kind, 'description')) cols.push('description')
  if (supportsContentField(kind, 'teaching_category')) cols.push('teaching_category')
  return cols.join(',')
}

function normalizeRow(kind: EditorialKind, row: Record<string, unknown>): EditorialContent {
  return {
    ...emptyContent(),
    ...row,
    title_amharic: (row.title_amharic as string | null) ?? '',
    title_oromo: (row.title_oromo as string | null) ?? '',
    description: (row.description as string | null) ?? '',
    body: (row.body as string | null) ?? '',
    body_amharic: (row.body_amharic as string | null) ?? '',
    body_oromo: (row.body_oromo as string | null) ?? '',
    thumbnail_url: (row.thumbnail_url as string | null) ?? '',
    image_path: (row.image_path as string | null) ?? '',
    image_alt: (row.image_alt as string | null) ?? '',
    audio_url: (row.audio_url as string | null) ?? '',
    date_notes: (row.date_notes as string | null) ?? '',
    related_content: normalizeRelatedList(row.related_content),
    created_by: (row.created_by as string | null) ?? null,
    published_at: (row.published_at as string | null) ?? null,
    ethiopian_month: supportsContentField(kind, 'ethiopian_month')
      ? ((row.ethiopian_month as number | null) ?? null)
      : null,
    ethiopian_day: supportsContentField(kind, 'ethiopian_day')
      ? ((row.ethiopian_day as number | null) ?? null)
      : null,
    teaching_category: supportsContentField(kind, 'teaching_category')
      ? ((row.teaching_category as string | null) ?? null)
      : null,
    fasting_info: supportsContentField(kind, 'fasting_info')
      ? ((row.fasting_info as string | null) ?? null)
      : null,
    is_movable: supportsContentField(kind, 'is_movable')
      ? Boolean(row.is_movable)
      : false,
    commemoration_month: supportsContentField(kind, 'commemoration_month')
      ? ((row.commemoration_month as number | null) ?? null)
      : null,
    commemoration_day: supportsContentField(kind, 'commemoration_day')
      ? ((row.commemoration_day as number | null) ?? null)
      : null,
  }
}

function writablePayload(kind: EditorialKind, input: EditorialContent) {
  const allowed = new Set(contentColumns[kind] as readonly string[])
  const payload: Record<string, unknown> = {}
  for (const key of allowed) {
    if (key === 'updated_at' || key === 'created_at' || key === 'created_by') continue
    if (key in input) payload[key] = (input as Record<string, unknown>)[key]
  }
  payload.id = input.id
  payload.slug = input.slug.trim()
  payload.title = input.title.trim()
  payload.title_amharic = input.title_amharic || null
  payload.thumbnail_url = input.thumbnail_url || null
  if (allowed.has('image_path')) payload.image_path = input.image_path || null
  if (allowed.has('image_alt')) payload.image_alt = input.image_alt || null
  payload.status = input.status
  if (allowed.has('name') && !payload.name) payload.name = input.title.trim()
  if (allowed.has('name_amharic')) payload.name_amharic = input.title_amharic || null
  if (allowed.has('description')) payload.description = input.description || null
  if (allowed.has('body')) payload.body = input.body || null
  if (allowed.has('body_amharic')) payload.body_amharic = input.body_amharic || null
  if (allowed.has('ethiopian_month')) payload.ethiopian_month = input.ethiopian_month ?? null
  if (allowed.has('ethiopian_day')) payload.ethiopian_day = input.ethiopian_day ?? null
  if (allowed.has('is_movable')) payload.is_movable = Boolean(input.is_movable)
  if (allowed.has('fasting_info')) payload.fasting_info = input.fasting_info || null
  if (allowed.has('teaching_category')) {
    payload.teaching_category = input.teaching_category || null
  }
  if (allowed.has('commemoration_month')) {
    payload.commemoration_month = input.commemoration_month ?? null
  }
  if (allowed.has('commemoration_day')) {
    payload.commemoration_day = input.commemoration_day ?? null
  }
  if (allowed.has('related_content')) {
    payload.related_content = normalizeRelatedList(input.related_content)
  }
  if (input.status === 'published') {
    payload.published_at = input.published_at || new Date().toISOString()
  } else {
    payload.published_at = null
  }
  return payload
}

export async function getContent(kind: EditorialKind, id: string) {
  const { data, error } = await db().from(kind).select('*').eq('id', id).single()
  if (error) throw error
  return normalizeRow(kind, data as Record<string, unknown>)
}

export async function listContent(
  kind: EditorialKind,
  q = '',
  status = '',
  page = 1,
  category = '',
) {
  let query = db()
    .from(kind)
    .select(listSelect(kind), { count: 'exact' })
  const text = q
    .replace(/[,().%_*\\]/g, ' ')
    .slice(0, 200)
    .trim()
  if (text) {
    const filters = [`title.ilike.%${text}%`, `title_amharic.ilike.%${text}%`]
    if (supportsContentField(kind, 'description')) filters.push(`description.ilike.%${text}%`)
    query = query.or(filters.join(','))
  }
  if (status) query = query.eq('status', status as ContentStatus)
  if (kind === 'articles' && category && supportsContentField(kind, 'teaching_category')) {
    // Narrowed to articles — teaching_category is not on saints/feasts row types.
    query = (query as typeof query & { eq: (c: string, v: string) => typeof query }).eq(
      'teaching_category',
      category,
    )
  }
  const { data, error, count } = await query
    .order('updated_at', { ascending: false })
    .order('id')
    .range((page - 1) * 24, page * 24 - 1)
  if (error) throw error
  return { items: (data as unknown as EditorialContent[]) || [], total: count || 0 }
}

async function saveContentDirect(
  kind: EditorialKind,
  input: EditorialContent,
  existing?: EditorialContent,
) {
  const payload = writablePayload(kind, input)
  const table = db().from(kind) as ReturnType<typeof db>['from'] extends (...args: infer _A) => infer R
    ? R
    : never
  void table
  const request = existing?.updated_at
    ? db()
        .from(kind)
        .update(payload as never)
        .eq('id', input.id)
        .eq('updated_at', existing.updated_at)
    : db().from(kind).insert(payload as never)
  const { data, error } = await request.select('*').single()
  if (error) throw error
  return normalizeRow(kind, data as Record<string, unknown>)
}

export async function saveContent(
  kind: EditorialKind,
  input: EditorialContent,
  existing?: EditorialContent,
) {
  const { data, error } = await db().rpc('save_cms_content', {
    content_kind: kind,
    payload: input as unknown as Json,
    expected_updated_at: existing?.updated_at || null,
  })
  if (!error) return data as unknown as EditorialContent

  // Live projects may not have the RPC yet; fall back to a column-safe upsert.
  if (error.code === 'PGRST202' || /Could not find the function/i.test(error.message || '')) {
    try {
      return await saveContentDirect(kind, input, existing)
    } catch (fallbackError) {
      throw Object.assign(new Error(errorMessage(fallbackError)), {
        cause: fallbackError,
        code: typeof fallbackError === 'object' && fallbackError && 'code' in fallbackError
          ? (fallbackError as { code?: string }).code
          : undefined,
        details: `save_cms_content RPC unavailable; direct save failed.`,
        hint: import.meta.env.DEV
          ? `RPC error was: ${error.message}`
          : undefined,
        message: errorMessage(fallbackError),
      })
    }
  }
  throw error
}

export async function contentHistory(kind: EditorialKind, id: string) {
  const versions = await db()
    .from('content_versions')
    .select('*')
    .eq('content_type', kind)
    .eq('content_id', id)
    .order('created_at', { ascending: false })
    .limit(50)
  if (versions.error) throw versions.error

  const authorIds = [
    ...new Set(
      (versions.data || [])
        .map((row) => (row as { changed_by?: string | null }).changed_by)
        .filter((value): value is string => typeof value === 'string' && value.length > 0),
    ),
  ]
  let authors: { id: string; display_name: string }[] = []
  if (authorIds.length) {
    const { data, error } = await db()
      .from('profiles')
      .select('id,display_name')
      .in('id', authorIds)
    if (error && error.code !== 'PGRST202') throw error
    authors = (data || []).map((row) => ({
      id: row.id,
      display_name: row.display_name || 'CMS member',
    }))
  }
  return { versions: versions.data, authors }
}

export async function lookupContent(kind: ContentType, q = '') {
  let query = db().from(kind).select('id,title,slug').eq('status', 'published')
  if (q)
    query = query.ilike(
      'title',
      '%' + q.replace(/[%_]/g, '').slice(0, 100) + '%',
    )
  const { data, error } = await query.order('title').limit(50)
  if (error) throw error
  return data
}

/**
 * Resolve related_content for public pages.
 * - Only published CMS rows hydrate
 * - Missing / unpublished / deleted IDs are omitted (no errors to visitors)
 * - Bible entries with a valid route are kept without inventing verse text
 * - Editor order is preserved
 */
export async function publicRelations(relations: Related[]): Promise<ResolvedRelated[]> {
  const requested = normalizeRelatedList(relations)
  if (!requested.length) return []

  const cmsKinds = [
    ...new Set(
      requested.map((r) => r.type).filter((t): t is ContentType => isCmsRelationType(t)),
    ),
  ]

  const hydrated = (
    await Promise.all(
      cmsKinds.map(async (kind) => {
        const ids = requested.filter((r) => r.type === kind).map((r) => r.id)
        if (!ids.length) return [] as Array<{
          type: ContentType
          id: string
          title: string
          slug: string
        }>
        try {
          const { data, error } = await db()
            .from(kind)
            .select('id,title,slug')
            .in('id', ids)
            .eq('status', 'published')
            .limit(30)
          if (error) {
            if (import.meta.env.DEV) {
              console.warn(`[publicRelations] ${kind}`, error.message)
            }
            return []
          }
          return (data || []).map((row) => ({
            type: kind,
            id: row.id as string,
            title: (row.title as string) || '',
            slug: (row.slug as string) || '',
          }))
        } catch (cause) {
          if (import.meta.env.DEV) console.warn(`[publicRelations] ${kind}`, cause)
          return []
        }
      }),
    )
  ).flat()

  return mergeResolvedRelations(requested, hydrated)
}
