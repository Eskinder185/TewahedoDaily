import { db, errorMessage, slugify, statuses } from '../cms/mezmurService'
import type { ContentStatus } from '../supabase/cms.types'
import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import { formatCommemorationTypeLabel } from '../synaxarium/calendarCards'
import {
  CALENDAR_CARD_CATEGORIES,
  formatCalendarCardCategory,
} from '../calendar/calendarCardCategories'
import {
  CALENDAR_CARD_SOURCE_TYPES,
  isLinkedSourceType,
  normalizeSourceType,
  sourceTypeBadge,
  type CalendarCardSourceType,
} from '../calendar/resolveCalendarCard'
import { validateCalendarCardSource } from '../calendar/calendarCardSources'
import { invalidateCalendarCardsCache } from '../calendar/getCalendarEventsForDate'

export { CALENDAR_CARD_SOURCE_TYPES, sourceTypeBadge }
export type { CalendarCardSourceType }

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

export const CARD_TYPES = [
  'angel',
  'mary',
  'saint',
  'feast',
  'fast',
  'apostle',
  'prophet',
  'martyr',
  'other',
] as const

export const CARD_CATEGORIES = CALENDAR_CARD_CATEGORIES

/** @deprecated Use CARD_TYPES — kept for any leftover imports. */
export const COMMEMORATION_TYPES = CARD_TYPES

export const IMAGE_POSITIONS = [
  'center',
  'top',
  'top-center',
  'bottom',
  'left',
  'right',
] as const

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

const CARD_SELECT = `id,slug,title,title_amharic,category,card_type,description,
summary,summary_amharic,what_is_it,what_is_it_amharic,why_celebrated,why_celebrated_amharic,
important_information,important_information_amharic,scripture_references,
fasting_notes,fasting_notes_amharic,season_notes,season_notes_amharic,
short_label,learn_more_label,image_path,image_alt,image_position,image_caption,image_caption_amharic,
ethiopian_month_number,ethiopian_day,is_monthly,synaxarium_day_id,synaxarium_day_slug,
source_type,source_id,source_slug,
featured,show_on_home,home_featured,home_sort_order,home_start_date,home_end_date,
sort_order,status,created_at,updated_at`

export type CalendarCardRow = {
  id: string
  slug: string
  title: string | null
  title_amharic: string | null
  category: string | null
  card_type: string | null
  description: string | null
  summary: string | null
  summary_amharic: string | null
  what_is_it: string | null
  what_is_it_amharic: string | null
  why_celebrated: string | null
  why_celebrated_amharic: string | null
  important_information: string | null
  important_information_amharic: string | null
  scripture_references: string | null
  fasting_notes: string | null
  fasting_notes_amharic: string | null
  season_notes: string | null
  season_notes_amharic: string | null
  short_label: string | null
  learn_more_label: string | null
  image_path: string | null
  image_alt: string | null
  image_position: string | null
  image_caption: string | null
  image_caption_amharic: string | null
  ethiopian_month_number: number | null
  ethiopian_day: number | null
  is_monthly: boolean
  synaxarium_day_id: string | null
  synaxarium_day_slug: string | null
  source_type: string | null
  source_id: string | null
  source_slug: string | null
  featured: boolean
  show_on_home: boolean
  home_featured: boolean
  home_sort_order: number | null
  home_start_date: string | null
  home_end_date: string | null
  sort_order: number
  status: ContentStatus
  created_at?: string
  updated_at?: string
}

export type CalendarCardInput = {
  title: string | null
  title_amharic?: string | null
  slug?: string
  category?: string | null
  card_type?: string | null
  description?: string | null
  summary?: string | null
  summary_amharic?: string | null
  what_is_it?: string | null
  what_is_it_amharic?: string | null
  why_celebrated?: string | null
  why_celebrated_amharic?: string | null
  important_information?: string | null
  important_information_amharic?: string | null
  scripture_references?: string | null
  fasting_notes?: string | null
  fasting_notes_amharic?: string | null
  season_notes?: string | null
  season_notes_amharic?: string | null
  short_label?: string | null
  learn_more_label?: string | null
  sort_order?: number
  status?: ContentStatus
  image_path?: string | null
  image_alt?: string | null
  image_caption?: string | null
  image_caption_amharic?: string | null
  featured?: boolean
  show_on_home?: boolean
  home_featured?: boolean
  home_sort_order?: number | null
  home_start_date?: string | null
  home_end_date?: string | null
  is_monthly?: boolean
  image_position?: string | null
  ethiopian_month_number: number | null
  ethiopian_day: number | null
  source_type?: string | null
  source_id?: string | null
  source_slug?: string | null
}

function previewUrl(path: string | null | undefined) {
  return path ? resolveContentMediaUrl(path) : ''
}

export function cardImagePreview(row: Pick<CalendarCardRow, 'image_path' | 'image_alt' | 'title'>): {
  url: string
  alt: string
} {
  return {
    url: previewUrl(row.image_path),
    alt: row.image_alt || row.title || '',
  }
}

export function typeLabel(type: string | null | undefined): string {
  return formatCommemorationTypeLabel(type)
}

export function categoryLabel(category: string | null | undefined, cardType?: string | null): string {
  return formatCalendarCardCategory(category, cardType)
}

function trimOrNull(value?: string | null): string | null {
  const text = (value || '').trim()
  return text || null
}

function logSupabaseError(
  context: string,
  error: { code?: string; message?: string; details?: string; hint?: string } | null,
) {
  if (!import.meta.env.DEV || !error) return
  console.error(`[calendarAdmin] ${context}`, {
    code: error.code,
    message: error.message,
    details: error.details,
    hint: error.hint,
  })
}

export function normalizeCalendarCardRow(raw: unknown): CalendarCardRow | null {
  if (!raw || typeof raw !== 'object') return null
  const row = raw as Record<string, unknown>
  const id = typeof row.id === 'string' ? row.id : ''
  if (!id) return null

  return {
    id,
    slug: String(row.slug || ''),
    title: row.title == null || row.title === '' ? null : String(row.title),
    title_amharic: (row.title_amharic as string | null) ?? null,
    category: (row.category as string | null) ?? null,
    card_type: (row.card_type as string | null) ?? 'other',
    description: (row.description as string | null) ?? null,
    summary: (row.summary as string | null) ?? null,
    summary_amharic: (row.summary_amharic as string | null) ?? null,
    what_is_it: (row.what_is_it as string | null) ?? null,
    what_is_it_amharic: (row.what_is_it_amharic as string | null) ?? null,
    why_celebrated: (row.why_celebrated as string | null) ?? null,
    why_celebrated_amharic: (row.why_celebrated_amharic as string | null) ?? null,
    important_information: (row.important_information as string | null) ?? null,
    important_information_amharic: (row.important_information_amharic as string | null) ?? null,
    scripture_references: (row.scripture_references as string | null) ?? null,
    fasting_notes: (row.fasting_notes as string | null) ?? null,
    fasting_notes_amharic: (row.fasting_notes_amharic as string | null) ?? null,
    season_notes: (row.season_notes as string | null) ?? null,
    season_notes_amharic: (row.season_notes_amharic as string | null) ?? null,
    short_label: (row.short_label as string | null) ?? null,
    learn_more_label: (row.learn_more_label as string | null) ?? null,
    image_path: (row.image_path as string | null) ?? null,
    image_alt: (row.image_alt as string | null) ?? null,
    image_position: (row.image_position as string | null) ?? 'center',
    image_caption: (row.image_caption as string | null) ?? null,
    image_caption_amharic: (row.image_caption_amharic as string | null) ?? null,
    ethiopian_month_number:
      row.ethiopian_month_number == null || row.ethiopian_month_number === ''
        ? null
        : Number(row.ethiopian_month_number) || null,
    ethiopian_day:
      row.ethiopian_day == null || row.ethiopian_day === ''
        ? null
        : Number(row.ethiopian_day) || null,
    is_monthly: Boolean(row.is_monthly),
    synaxarium_day_id: (row.synaxarium_day_id as string | null) ?? null,
    synaxarium_day_slug: (row.synaxarium_day_slug as string | null) ?? null,
    source_type: (row.source_type as string | null) ?? null,
    source_id: (row.source_id as string | null) ?? null,
    source_slug: (row.source_slug as string | null) ?? null,
    featured: row.featured !== false,
    show_on_home: Boolean(row.show_on_home),
    home_featured: Boolean(row.home_featured),
    home_sort_order: (() => {
      if (row.home_sort_order == null || row.home_sort_order === '') return null
      const n = Number(row.home_sort_order)
      return Number.isFinite(n) ? n : null
    })(),
    home_start_date: (row.home_start_date as string | null) ?? null,
    home_end_date: (row.home_end_date as string | null) ?? null,
    sort_order: Number(row.sort_order) || 0,
    status: (row.status as ContentStatus) || 'draft',
    created_at: row.created_at as string | undefined,
    updated_at: row.updated_at as string | undefined,
  }
}

export async function listCalendarCards(options?: {
  search?: string
  status?: string
  monthNumber?: number
  type?: string
  category?: string
  featured?: 'yes' | 'no' | ''
  homepage?: 'all' | 'home' | 'home_featured' | ''
  page?: number
  pageSize?: number
}) {
  const page = Math.max(1, options?.page ?? 1)
  const pageSize = options?.pageSize ?? 48
  const from = (page - 1) * pageSize
  const to = from + pageSize - 1

  let query = db()
    .from('calendar_cards' as never)
    .select(CARD_SELECT, { count: 'exact' })
    .order('sort_order', { ascending: true })
    .order('title', { ascending: true })
    .range(from, to)

  if (options?.status) query = query.eq('status', options.status)
  if (options?.type) query = query.eq('card_type', options.type)
  if (options?.category) query = query.eq('category', options.category)
  if (options?.featured === 'yes') query = query.eq('featured', true)
  if (options?.featured === 'no') query = query.eq('featured', false)
  if (options?.homepage === 'home') query = query.eq('show_on_home', true)
  if (options?.homepage === 'home_featured') {
    query = query.eq('show_on_home', true).eq('home_featured', true)
  }
  if (options?.monthNumber) {
    query = query.eq('ethiopian_month_number', options.monthNumber)
  }
  if (options?.search?.trim()) {
    const q = options.search.trim().replace(/[%_,]/g, ' ')
    query = query.or(
      `title.ilike.%${q}%,title_amharic.ilike.%${q}%,description.ilike.%${q}%,summary.ilike.%${q}%,category.ilike.%${q}%,card_type.ilike.%${q}%,slug.ilike.%${q}%,source_slug.ilike.%${q}%`,
    )
  }

  const { data, error, count } = await query
  if (error) {
    logSupabaseError('listCalendarCards', error)
    throw error
  }

  const items = (data || [])
    .map(normalizeCalendarCardRow)
    .filter((row): row is CalendarCardRow => Boolean(row))
  return { items, total: count ?? items.length }
}

export async function getCalendarCard(id: string): Promise<CalendarCardRow> {
  const { data, error } = await db()
    .from('calendar_cards' as never)
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

/** Look up an existing Synaxarium day — do not create one. */
export async function lookupSynaxariumDay(
  monthNumber: number,
  day: number,
): Promise<{ id: string; slug: string } | null> {
  const { data, error } = await db()
    .from('synaxarium_days' as never)
    .select('id,slug')
    .eq('ethiopian_month_number', monthNumber)
    .eq('ethiopian_day', day)
    .maybeSingle()
  if (error) throw error
  if (!data) return null
  return data as { id: string; slug: string }
}

/** @deprecated Prefer lookupSynaxariumDay — cards no longer create Synaxarium days. */
export async function findOrCreateSynaxariumDay(monthNumber: number, day: number) {
  const found = await lookupSynaxariumDay(monthNumber, day)
  if (found) {
    return { id: found.id, slug: found.slug, ethiopian_month: monthLabel(monthNumber) }
  }
  throw new Error(
    `No Synaxarium day exists for ${monthLabel(monthNumber)} ${day}. Create it under Calendar → Synaxarium first, or save the card without a day link.`,
  )
}

export async function saveCalendarCard(
  input: CalendarCardInput,
  existing?: CalendarCardRow | null,
) {
  const sourceType = normalizeSourceType(input.source_type)
  const linkedMode = isLinkedSourceType(sourceType)

  let linkedTitle = ''
  let monthNumber: number | null =
    input.ethiopian_month_number == null || Number.isNaN(Number(input.ethiopian_month_number))
      ? null
      : Number(input.ethiopian_month_number)
  let day: number | null =
    input.ethiopian_day == null || Number.isNaN(Number(input.ethiopian_day))
      ? null
      : Number(input.ethiopian_day)
  let linkedMonthly = Boolean(input.is_monthly)
  let linkedSource: Awaited<ReturnType<typeof validateCalendarCardSource>>['linked'] = undefined

  if (linkedMode) {
    const validation = await validateCalendarCardSource(
      sourceType,
      input.source_id,
      input.source_slug,
    )
    if (!validation.ok || !validation.linked) {
      throw new Error(validation.message || 'Invalid linked calendar source.')
    }
    linkedSource = validation.linked
    linkedTitle = validation.linked.title
    linkedMonthly =
      validation.linked.isMonthly ||
      validation.linked.sourceType === 'monthly_commemoration' ||
      linkedMonthly

    // Authoritative dates from structured source — never invent Meskerem 1.
    if (linkedMonthly) {
      monthNumber = null
      day =
        validation.linked.ethiopianDay != null && validation.linked.ethiopianDay > 0
          ? validation.linked.ethiopianDay
          : day
    } else if (validation.linked.isMovable) {
      monthNumber = null
      day = null
    } else {
      if (validation.linked.ethiopianMonthNumber != null && validation.linked.ethiopianMonthNumber > 0) {
        monthNumber = validation.linked.ethiopianMonthNumber
      }
      if (validation.linked.ethiopianDay != null && validation.linked.ethiopianDay > 0) {
        day = validation.linked.ethiopianDay
      }
    }
  }

  if (!linkedMode) {
    if (monthNumber == null || monthNumber < 1 || monthNumber > 13) {
      throw new Error('Choose a valid Ethiopian month.')
    }
    if (day == null || day < 1 || day > daysInEthiopianMonth(monthNumber)) {
      throw new Error(`Day must be between 1 and ${daysInEthiopianMonth(monthNumber)}.`)
    }
  } else if (monthNumber != null && (monthNumber < 1 || monthNumber > 13)) {
    throw new Error('Choose a valid Ethiopian month.')
  } else if (
    day != null &&
    monthNumber != null &&
    (day < 1 || day > daysInEthiopianMonth(monthNumber))
  ) {
    throw new Error(`Day must be between 1 and ${daysInEthiopianMonth(monthNumber)}.`)
  } else if (day != null && (day < 1 || day > 30)) {
    throw new Error('Day must be between 1 and 30.')
  }

  if (!linkedMode && !(input.title || '').trim()) {
    throw new Error('Title is required for manual cards.')
  }

  const synax =
    monthNumber != null && day != null ? await lookupSynaxariumDay(monthNumber, day) : null
  const type = (input.card_type || linkedSource?.cardType || 'other').trim() || 'other'
  if (!(CARD_TYPES as readonly string[]).includes(type)) {
    throw new Error('Choose a valid card type.')
  }

  const category =
    trimOrNull(input.category) ||
    trimOrNull(linkedSource?.category) ||
    formatCalendarCardCategory(null, type)

  const payload: Record<string, unknown> = {
    slug: (input.slug || slugify(input.title || linkedTitle || 'calendar-card')).trim(),
    // Linked mode: blank/null title means inherit from structured source at resolve time.
    title: linkedMode ? trimOrNull(input.title) : (input.title || '').trim() || 'Untitled',
    title_amharic: trimOrNull(input.title_amharic),
    category,
    card_type: type,
    description: trimOrNull(input.description),
    summary: trimOrNull(input.summary),
    summary_amharic: trimOrNull(input.summary_amharic),
    what_is_it: trimOrNull(input.what_is_it),
    what_is_it_amharic: trimOrNull(input.what_is_it_amharic),
    why_celebrated: trimOrNull(input.why_celebrated),
    why_celebrated_amharic: trimOrNull(input.why_celebrated_amharic),
    important_information: trimOrNull(input.important_information),
    important_information_amharic: trimOrNull(input.important_information_amharic),
    scripture_references: trimOrNull(input.scripture_references),
    fasting_notes: trimOrNull(input.fasting_notes),
    fasting_notes_amharic: trimOrNull(input.fasting_notes_amharic),
    season_notes: trimOrNull(input.season_notes),
    season_notes_amharic: trimOrNull(input.season_notes_amharic),
    short_label: trimOrNull(input.short_label),
    learn_more_label: trimOrNull(input.learn_more_label),
    sort_order: input.sort_order ?? 0,
    status: (input.status || 'draft') as ContentStatus,
    image_path: trimOrNull(input.image_path),
    image_alt: trimOrNull(input.image_alt),
    image_position: input.image_position || 'center',
    image_caption: trimOrNull(input.image_caption),
    image_caption_amharic: trimOrNull(input.image_caption_amharic),
    ethiopian_month_number: monthNumber,
    ethiopian_day: day,
    is_monthly: linkedMonthly,
    synaxarium_day_id: synax?.id ?? null,
    synaxarium_day_slug: synax?.slug ?? null,
    source_type: linkedMode ? sourceType : 'manual',
    source_id: linkedMode ? trimOrNull(input.source_id) || linkedSource?.sourceId || null : null,
    source_slug: linkedMode ? trimOrNull(input.source_slug) || linkedSource?.sourceSlug || null : null,
    featured: input.featured !== false,
    show_on_home: Boolean(input.show_on_home),
    home_featured: Boolean(input.home_featured),
    home_sort_order:
      input.home_sort_order == null || Number.isNaN(Number(input.home_sort_order))
        ? null
        : Number(input.home_sort_order),
    home_start_date: trimOrNull(input.home_start_date),
    home_end_date: trimOrNull(input.home_end_date),
    updated_at: new Date().toISOString(),
  }

  if (existing) {
    const { data, error } = await db()
      .from('calendar_cards' as never)
      .update(payload as never)
      .eq('id', existing.id)
      .select('id')
      .single()
    if (error) throw error
    const saved = await getCalendarCard((data as { id: string }).id)
    // Confirm image persistence when a path was requested.
    const wanted = trimOrNull(input.image_path)
    if (wanted && saved.image_path !== wanted) {
      throw new Error(
        `Image path did not persist on card ${saved.id}. Expected “${wanted}”, got “${saved.image_path || ''}”.`,
      )
    }
    invalidateCalendarCardsCache()
    return saved
  }

  const { data, error } = await db()
    .from('calendar_cards' as never)
    .insert(payload as never)
    .select('id')
    .single()
  if (error) throw error
  const saved = await getCalendarCard((data as { id: string }).id)
  const wanted = trimOrNull(input.image_path)
  if (wanted && saved.image_path !== wanted) {
    throw new Error(
      `Image path did not persist on card ${saved.id}. Expected “${wanted}”, got “${saved.image_path || ''}”.`,
    )
  }
  invalidateCalendarCardsCache()
  return saved
}

export async function archiveCalendarCard(id: string) {
  const { error } = await db()
    .from('calendar_cards' as never)
    .update({
      status: 'archived',
      featured: false,
      show_on_home: false,
      home_featured: false,
      updated_at: new Date().toISOString(),
    } as never)
    .eq('id', id)
  if (error) throw error
  invalidateCalendarCardsCache()
}

export async function deleteCalendarCard(id: string) {
  const { error } = await db()
    .from('calendar_cards' as never)
    .delete()
    .eq('id', id)
  if (error) throw error
  invalidateCalendarCardsCache()
}

export { errorMessage, statuses, slugify }
export type { ContentStatus }
