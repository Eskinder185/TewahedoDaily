import { db, errorMessage } from './mezmurService'
import type { ContentStatus, ContentType } from '../supabase/cms.types'
import type { Json } from '../supabase/database.types'

export const contentKinds = ['saints', 'feasts', 'prayers', 'articles'] as const
export type EditorialKind = (typeof contentKinds)[number]

export const contentPath = (kind: string, slug: string) =>
  kind === 'mezmur' ? `/practice/mezmur/${slug}` : `/content/${kind}/${slug}`

export const teachingCategories = [
  'Church teaching',
  'Saints',
  'Feasts',
  'Bible study',
  'Church history',
  'The Seven Mysteries',
]

export type Related = { type: ContentType; id: string; title?: string }

/**
 * Columns confirmed present on the live Supabase project after the compatibility
 * migration. Selects/writes must stay within these sets to avoid HTTP 400s.
 */
export const contentColumns = {
  saints: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'description',
    'thumbnail_url',
    'status',
    'created_by',
    'updated_at',
    'published_at',
    'created_at',
  ],
  feasts: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'description',
    'thumbnail_url',
    'status',
    'created_by',
    'updated_at',
    'published_at',
    'created_at',
    'ethiopian_month',
    'ethiopian_day',
  ],
  prayers: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'thumbnail_url',
    'status',
    'created_by',
    'updated_at',
    'published_at',
    'created_at',
  ],
  articles: [
    'id',
    'slug',
    'title',
    'title_amharic',
    'thumbnail_url',
    'body',
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
  is_movable?: boolean
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
    audio_url: (row.audio_url as string | null) ?? '',
    date_notes: (row.date_notes as string | null) ?? '',
    related_content: Array.isArray(row.related_content) ? (row.related_content as Related[]) : [],
    created_by: (row.created_by as string | null) ?? null,
    published_at: (row.published_at as string | null) ?? null,
    ethiopian_month: supportsContentField(kind, 'ethiopian_month')
      ? ((row.ethiopian_month as number | null) ?? null)
      : null,
    ethiopian_day: supportsContentField(kind, 'ethiopian_day')
      ? ((row.ethiopian_day as number | null) ?? null)
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
  payload.status = input.status
  if (allowed.has('description')) payload.description = input.description || null
  if (allowed.has('body')) payload.body = input.body || null
  if (allowed.has('ethiopian_month')) payload.ethiopian_month = input.ethiopian_month ?? null
  if (allowed.has('ethiopian_day')) payload.ethiopian_day = input.ethiopian_day ?? null
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
  // teaching_category is not on the live articles table — ignore category filter.
  void category
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
  const [versions, authors] = await Promise.all([
    db()
      .from('content_versions')
      .select('*')
      .eq('content_type', kind)
      .eq('content_id', id)
      .order('created_at', { ascending: false })
      .limit(50),
    db().rpc('cms_version_authors', {}),
  ])
  if (versions.error) throw versions.error
  if (authors.error) {
    if (authors.error.code === 'PGRST202') return { versions: versions.data, authors: [] }
    throw authors.error
  }
  return { versions: versions.data, authors: authors.data }
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

export async function publicRelations(relations: Related[]) {
  return (
    await Promise.all(
      (['mezmur', ...contentKinds] as const).map(async (kind) => {
        const ids = relations
          .filter((r) => r.type === kind)
          .slice(0, 30)
          .map((r) => r.id)
        if (!ids.length) return []
        const { data, error } = await db()
          .from(kind)
          .select('id,title,slug')
          .in('id', ids)
          .eq('status', 'published')
          .limit(30)
        if (error) throw error
        return data.map((row) => ({ ...row, type: kind }))
      }),
    )
  ).flat()
}
