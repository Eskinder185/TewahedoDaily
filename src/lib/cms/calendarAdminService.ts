import { db, errorMessage, slugify, statuses } from '../cms/mezmurService'
import type { ContentStatus } from '../supabase/cms.types'
import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import { formatCommemorationTypeLabel } from '../synaxarium/calendarCards'
import {
  formatKeywordsForInput,
  normalizeKeywords,
  parseKeywordsFromDb,
  serializeKeywordsForDb,
} from '../synaxarium/keywords'

export const CMS_ETHIOPIAN_MONTHS = [
  { number: 1, label: 'Meskerem' },
  { number: 2, label: 'Tikimt' },
  { number: 3, label: 'Hidar' },
  { number: 4, label: 'Tahsas' },
  { number: 5, label: 'Tir' },
  { number: 6, label: 'Yekatit' },
  { number: 7, label: 'Megabit' },
  { number: 8, label: 'Miazia' },
  { number: 9, label: 'Ginbot' },
  { number: 10, label: 'Sene' },
  { number: 11, label: 'Hamle' },
  { number: 12, label: 'Nehase' },
  { number: 13, label: 'Pagumen' },
] as const

export const COMMEMORATION_TYPES = [
  'angel',
  'saint',
  'mary',
  'feast',
  'martyr',
  'apostle',
  'prophet',
  'church-event',
  'other',
] as const

export const IMAGE_POSITIONS = ['center', 'top', 'bottom', 'left', 'right'] as const

export function monthLabel(number: number): string {
  return (
    CMS_ETHIOPIAN_MONTHS.find((m) => m.number === number)?.label ||
    ETHIOPIAN_MONTH_NAMES[number - 1] ||
    `Month ${number}`
  )
}

export function daysInEthiopianMonth(monthNumber: number): number {
  return monthNumber === 13 ? 6 : 30
}

/** Only columns confirmed present on live synaxarium_commemorations / days. */
const CARD_SELECT = `id,slug,title,title_amharic,commemoration_type,summary,body_amharic,body_english,scripture_references,keywords,sort_order,status,image_path,image_alt,featured,day_id,day_slug,
 day:synaxarium_days(id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_amharic,display_date_english,image_path,image_alt,status)`

export type CalendarCardRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  commemoration_type: string | null
  summary: string | null
  body_amharic: string | null
  body_english: string | null
  scripture_references: string | null
  /** Always normalized to string[] for the admin UI. */
  keywords: string[]
  sort_order: number
  status: ContentStatus
  image_path: string | null
  image_alt: string | null
  featured: boolean
  is_monthly: boolean
  image_position: string | null
  day_id: string
  day_slug: string | null
  day: {
    id: string
    slug: string
    ethiopian_month: string
    ethiopian_month_number: number
    ethiopian_day: number
    display_date_amharic: string | null
    display_date_english: string | null
    image_path: string | null
    image_alt: string | null
    status: ContentStatus
  } | null
  /** Soft warning when a row had unexpected shapes. */
  _warning?: string
}

export type CalendarCardInput = {
  title: string
  title_amharic?: string | null
  slug?: string
  commemoration_type?: string | null
  summary?: string | null
  body_amharic?: string | null
  body_english?: string | null
  scripture_references?: string | null
  keywords?: string[] | null
  sort_order?: number
  status?: ContentStatus
  image_path?: string | null
  image_alt?: string | null
  featured?: boolean
  is_monthly?: boolean
  image_position?: string | null
  ethiopian_month_number: number
  ethiopian_day: number
}

function previewUrl(path: string | null | undefined) {
  return path ? resolveContentMediaUrl(path) : ''
}

export function cardImagePreview(row: CalendarCardRow): { url: string; alt: string } {
  const path = row.image_path || row.day?.image_path || ''
  const alt = row.image_alt || row.day?.image_alt || row.title || ''
  return { url: previewUrl(path), alt }
}

export function typeLabel(type: string | null | undefined): string {
  return formatCommemorationTypeLabel(type)
}

function unwrapDay(day: CalendarCardRow['day'] | CalendarCardRow['day'][] | null | undefined) {
  if (!day) return null
  return Array.isArray(day) ? day[0] || null : day
}

/** Convert a raw Supabase row into a crash-safe CalendarCardRow. */
export function normalizeCalendarCardRow(raw: unknown): CalendarCardRow | null {
  if (!raw || typeof raw !== 'object') return null
  const row = raw as Record<string, unknown>
  const id = typeof row.id === 'string' ? row.id : ''
  if (!id) return null

  const warnings: string[] = []
  if (row.keywords != null && !Array.isArray(row.keywords) && typeof row.keywords !== 'string') {
    warnings.push('Unexpected keywords shape')
  }

  const day = unwrapDay(row.day as CalendarCardRow['day'])

  return {
    id,
    slug: String(row.slug || ''),
    title: String(row.title || 'Untitled'),
    title_amharic: (row.title_amharic as string | null) ?? null,
    commemoration_type: (row.commemoration_type as string | null) ?? null,
    summary: (row.summary as string | null) ?? null,
    body_amharic: (row.body_amharic as string | null) ?? null,
    body_english: (row.body_english as string | null) ?? null,
    scripture_references: (row.scripture_references as string | null) ?? null,
    keywords: parseKeywordsFromDb(row.keywords),
    sort_order: Number(row.sort_order) || 0,
    status: (row.status as ContentStatus) || 'draft',
    image_path: (row.image_path as string | null) ?? null,
    image_alt: (row.image_alt as string | null) ?? null,
    featured: Boolean(row.featured),
    is_monthly: Boolean(row.is_monthly) || /monthly/i.test(String(row.title || '')),
    image_position: (row.image_position as string | null) ?? 'center',
    day_id: String(row.day_id || day?.id || ''),
    day_slug: (row.day_slug as string | null) ?? day?.slug ?? null,
    day,
    _warning: warnings.length ? warnings.join('; ') : undefined,
  }
}

function matchesSearch(row: CalendarCardRow, q: string): boolean {
  const needle = q.toLowerCase()
  const keywords = normalizeKeywords(row.keywords).join(' ')
  return [row.title, row.title_amharic, row.summary, row.commemoration_type, keywords]
    .filter(Boolean)
    .some((v) => String(v).toLowerCase().includes(needle))
}

function logSupabaseError(context: string, error: { code?: string; message?: string; details?: string; hint?: string } | null) {
  if (!import.meta.env.DEV || !error) return
  console.error(`[calendarAdmin] ${context}`, {
    code: error.code,
    message: error.message,
    details: error.details,
    hint: error.hint,
  })
}

export async function listCalendarCards(options?: {
  search?: string
  status?: string
  monthNumber?: number
  type?: string
  featured?: 'yes' | 'no' | ''
  page?: number
  pageSize?: number
}) {
  const page = Math.max(1, options?.page ?? 1)
  const pageSize = options?.pageSize ?? 40
  const from = (page - 1) * pageSize
  const to = from + pageSize - 1

  let query = db()
    .from('synaxarium_commemorations' as never)
    .select(CARD_SELECT, { count: 'exact' })
    .order('sort_order', { ascending: true })
    .order('title', { ascending: true })
    .range(from, to)

  if (options?.status) query = query.eq('status', options.status)
  if (options?.type) query = query.eq('commemoration_type', options.type)
  if (options?.featured === 'yes') query = query.eq('featured', true)
  if (options?.featured === 'no') query = query.eq('featured', false)
  if (options?.search?.trim()) {
    const q = options.search.trim()
    query = query.or(
      `title.ilike.%${q}%,title_amharic.ilike.%${q}%,summary.ilike.%${q}%,commemoration_type.ilike.%${q}%,keywords.ilike.%${q}%`,
    )
  }

  const { data, error, count } = await query
  if (error) {
    logSupabaseError('listCalendarCards', error)
    // Fallback without nested day join if relationship metadata is broken.
    const flat = await db()
      .from('synaxarium_commemorations' as never)
      .select(
        'id,slug,title,title_amharic,commemoration_type,summary,body_amharic,body_english,scripture_references,keywords,sort_order,status,image_path,image_alt,featured,day_id,day_slug',
        { count: 'exact' },
      )
      .order('sort_order', { ascending: true })
      .order('title', { ascending: true })
      .range(from, to)
    if (flat.error) {
      logSupabaseError('listCalendarCards flat', flat.error)
      throw flat.error
    }
    let items = (flat.data || [])
      .map(normalizeCalendarCardRow)
      .filter((row): row is CalendarCardRow => Boolean(row))
    if (options?.monthNumber) {
      items = items.filter(() => true) // day not joined; keep all
    }
    if (options?.search?.trim()) {
      items = items.filter((row) => matchesSearch(row, options.search!.trim()))
    }
    return { items, total: flat.count ?? items.length }
  }

  let items = (data || [])
    .map(normalizeCalendarCardRow)
    .filter((row): row is CalendarCardRow => Boolean(row))
  if (options?.monthNumber) {
    items = items.filter((row) => row.day?.ethiopian_month_number === options.monthNumber)
  }
  if (options?.search?.trim()) {
    items = items.filter((row) => matchesSearch(row, options.search!.trim()))
  }
  return { items, total: count ?? items.length }
}

export async function getCalendarCard(id: string): Promise<CalendarCardRow> {
  const { data, error } = await db()
    .from('synaxarium_commemorations' as never)
    .select(CARD_SELECT)
    .eq('id', id)
    .single()
  if (error) {
    logSupabaseError('getCalendarCard', error)
    throw error
  }
  const normalized = normalizeCalendarCardRow(data)
  if (!normalized) throw new Error('Calendar card not found.')
  return normalized
}

export async function findOrCreateSynaxariumDay(
  monthNumber: number,
  day: number,
): Promise<{ id: string; slug: string; ethiopian_month: string }> {
  const month = monthLabel(monthNumber)
  const { data: existing, error: findError } = await db()
    .from('synaxarium_days' as never)
    .select('id,slug,ethiopian_month')
    .eq('ethiopian_month_number', monthNumber)
    .eq('ethiopian_day', day)
    .maybeSingle()
  if (findError) throw findError
  if (existing) return existing as { id: string; slug: string; ethiopian_month: string }

  const slug = slugify(`${month}-${day}`) || `day-${monthNumber}-${day}`
  const payload = {
    slug,
    ethiopian_month: month,
    ethiopian_month_number: monthNumber,
    ethiopian_day: day,
    display_date_english: `${month} ${day}`,
    display_date_amharic: null,
    summary: null,
    status: 'published' as ContentStatus,
    updated_at: new Date().toISOString(),
  }
  const { data, error } = await db()
    .from('synaxarium_days' as never)
    .insert(payload as never)
    .select('id,slug,ethiopian_month')
    .single()
  if (error) throw error
  return data as { id: string; slug: string; ethiopian_month: string }
}

export async function saveCalendarCard(
  input: CalendarCardInput,
  existing?: CalendarCardRow | null,
) {
  const monthNumber = input.ethiopian_month_number
  const day = input.ethiopian_day
  if (monthNumber < 1 || monthNumber > 13) throw new Error('Choose a valid Ethiopian month.')
  if (day < 1 || day > daysInEthiopianMonth(monthNumber)) {
    throw new Error(`Day must be between 1 and ${daysInEthiopianMonth(monthNumber)}.`)
  }
  if (!input.title.trim()) throw new Error('Title is required.')

  const dayRow = await findOrCreateSynaxariumDay(monthNumber, day)
  const keywordsText = serializeKeywordsForDb(input.keywords)
  const payload: Record<string, unknown> = {
    day_id: dayRow.id,
    day_slug: dayRow.slug,
    slug: (input.slug || slugify(input.title)).trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic || null,
    commemoration_type: input.commemoration_type || null,
    summary: input.summary || null,
    body_amharic: input.body_amharic || null,
    body_english: input.body_english || null,
    scripture_references: input.scripture_references || null,
    keywords: keywordsText,
    sort_order: input.sort_order ?? 0,
    status: (input.status || 'draft') as ContentStatus,
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    featured: Boolean(input.featured),
    updated_at: new Date().toISOString(),
  }

  // Optional columns — only send when the admin form set them; ignore DB errors if missing.
  if (input.is_monthly != null) payload.is_monthly = Boolean(input.is_monthly)
  if (input.image_position) payload.image_position = input.image_position

  async function write(body: Record<string, unknown>) {
    if (existing) {
      const { data, error } = await db()
        .from('synaxarium_commemorations' as never)
        .update(body as never)
        .eq('id', existing.id)
        .select('id')
        .single()
      if (error) throw error
      return getCalendarCard((data as { id: string }).id)
    }
    const { data, error } = await db()
      .from('synaxarium_commemorations' as never)
      .insert(body as never)
      .select('id')
      .single()
    if (error) throw error
    return getCalendarCard((data as { id: string }).id)
  }

  try {
    return await write(payload)
  } catch (cause) {
    const message =
      cause && typeof cause === 'object' && 'message' in cause
        ? String((cause as { message?: unknown }).message)
        : ''
    if (/is_monthly|image_position/i.test(message)) {
      const { is_monthly: _m, image_position: _p, ...base } = payload
      return write(base)
    }
    throw cause
  }
}

export async function archiveCalendarCard(id: string) {
  const { error } = await db()
    .from('synaxarium_commemorations' as never)
    .update({ status: 'archived', featured: false, updated_at: new Date().toISOString() } as never)
    .eq('id', id)
  if (error) throw error
}

export async function deleteCalendarCard(id: string) {
  const { error } = await db()
    .from('synaxarium_commemorations' as never)
    .delete()
    .eq('id', id)
  if (error) throw error
}

export { errorMessage, statuses, slugify, formatKeywordsForInput, normalizeKeywords }
export type { ContentStatus }
