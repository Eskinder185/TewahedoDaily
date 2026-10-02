import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import type {
  SynaxariumCommemoration,
  SynaxariumDay,
  SynaxariumDayBundle,
  SynaxariumMonthDayPreview,
} from './prayerLibraryTypes'
import { parseKeywordsFromDb } from '../synaxarium/keywords'

type Status = 'draft' | 'pending_review' | 'published' | 'rejected' | 'archived'

type DayRow = {
  id: string
  slug: string
  ethiopian_month: string
  ethiopian_month_number: number
  ethiopian_day: number
  display_date_english: string | null
  display_date_amharic: string | null
  summary: string | null
  status: Status
  image_path?: string | null
  image_alt?: string | null
}

type CommemorationRow = {
  id: string
  day_id: string
  day_slug: string
  slug: string
  title: string
  title_amharic: string | null
  commemoration_type: string | null
  summary: string | null
  summary_amharic?: string | null
  body_amharic: string | null
  body_english: string | null
  scripture_references: string | null
  keywords: string[] | string | null
  sort_order: number
  status: Status
  image_path?: string | null
  image_alt?: string | null
  featured?: boolean | null
  is_monthly?: boolean | null
  image_position?: string | null
  content_review_status?: string | null
}

type CommemorationPreviewRow = {
  day_id: string
  title: string
  title_amharic: string | null
  sort_order: number
}

type Table<Row> = {
  Row: Row
  Insert: Partial<Row>
  Update: Partial<Row>
  Relationships: []
}

type SynaxariumDatabase = {
  public: {
    Tables: {
      synaxarium_days: Table<DayRow>
      synaxarium_commemorations: Table<CommemorationRow>
    }
    Views: Record<never, never>
    Functions: Record<never, never>
    Enums: Record<never, never>
    CompositeTypes: Record<never, never>
  }
}

const db = supabase as unknown as SupabaseClient<SynaxariumDatabase> | null

/** Frontend sort position for the Synaxarium library card among prayer books. */
export const SYNAXARIUM_LIBRARY_SORT_ORDER = 20

function logError(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[synaxarium] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[synaxarium] ${context}`, error)
}

function mapDay(row: DayRow): SynaxariumDay {
  return {
    id: row.id,
    slug: row.slug,
    ethiopianMonth: row.ethiopian_month,
    ethiopianMonthNumber: row.ethiopian_month_number,
    ethiopianDay: row.ethiopian_day,
    displayDateEnglish: row.display_date_english ?? `${row.ethiopian_month} ${row.ethiopian_day}`,
    displayDateAmharic: row.display_date_amharic ?? '',
    summary: row.summary ?? '',
    imagePath: row.image_path ?? undefined,
    imageAlt: row.image_alt ?? undefined,
  }
}

function mapCommemoration(row: CommemorationRow): SynaxariumCommemoration {
  const keywords = parseKeywordsFromDb(row.keywords)
  return {
    id: row.id,
    slug: row.slug,
    dayId: row.day_id,
    daySlug: row.day_slug,
    title: row.title,
    titleAmharic: row.title_amharic ?? '',
    commemorationType: row.commemoration_type ?? '',
    summary: row.summary ?? '',
    summaryAmharic: row.summary_amharic ?? '',
    bodyAmharic: row.body_amharic ?? '',
    bodyEnglish: row.body_english ?? '',
    scriptureReferences: row.scripture_references ?? '',
    keywords,
    sortOrder: row.sort_order,
    imagePath: row.image_path ?? undefined,
    imageAlt: row.image_alt ?? undefined,
    featured: Boolean(row.featured),
    isMonthly:
      Boolean(row.is_monthly) ||
      /monthly/i.test(row.title || '') ||
      keywords.some((k) => /monthly/i.test(k)),
    imagePosition: row.image_position ?? undefined,
    contentReviewStatus: row.content_review_status ?? null,
  }
}

/** Priority: commemoration image → day image. */
export function pickSynaxariumImagePath(
  bundle: SynaxariumDayBundle | null | undefined,
): { path: string; alt: string } | null {
  if (!bundle) return null
  for (const item of bundle.commemorations) {
    const path = (item.imagePath || '').trim()
    if (path) return { path, alt: (item.imageAlt || item.title || '').trim() }
  }
  const dayPath = (bundle.day.imagePath || '').trim()
  if (dayPath) return { path: dayPath, alt: (bundle.day.imageAlt || '').trim() }
  return null
}

export async function countSynaxariumDays(): Promise<number> {
  if (!db) return 0
  const { count, error } = await db
    .from('synaxarium_days')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'published')
  if (error) throw error
  return count ?? 0
}

export async function countSynaxariumCommemorations(): Promise<number> {
  if (!db) return 0
  const { count, error } = await db
    .from('synaxarium_commemorations')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'published')
  if (error) throw error
  return count ?? 0
}

export async function getSynaxariumDays(): Promise<SynaxariumDay[]> {
  if (!db) return []
  try {
    const { data, error } = await db
      .from('synaxarium_days')
      .select(
        'id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_english,display_date_amharic,summary,status',
      )
      .eq('status', 'published')
      .order('ethiopian_month_number')
      .order('ethiopian_day')
    if (error) throw error
    return (data ?? []).map(mapDay)
  } catch (error) {
    logError('getSynaxariumDays', error)
    throw error
  }
}

/** Published synaxarium_days for one Ethiopian month number (1–13). */
export async function getSynaxariumDaysForMonth(monthNumber: number): Promise<SynaxariumDay[]> {
  if (!db || !Number.isFinite(monthNumber)) return []
  try {
    const { data, error } = await db
      .from('synaxarium_days')
      .select(
        'id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_english,display_date_amharic,summary,status,image_path,image_alt',
      )
      .eq('status', 'published')
      .eq('ethiopian_month_number', monthNumber)
      .order('ethiopian_day')
    if (error) throw error
    return (data ?? []).map(mapDay)
  } catch (error) {
    logError(`getSynaxariumDaysForMonth(${monthNumber})`, error)
    throw error
  }
}

/** Month-level days plus primary title previews (no body text). */
export async function getSynaxariumMonthDayPreviews(
  monthNumber: number,
): Promise<SynaxariumMonthDayPreview[]> {
  const days = await getSynaxariumDaysForMonth(monthNumber)
  if (!db || days.length === 0) {
    return days.map((day) => ({
      day,
      primaryTitle: day.summary || day.displayDateEnglish,
      primaryTitleAmharic: day.displayDateAmharic,
      commemorationsCount: 0,
    }))
  }

  try {
    const { data, error } = await db
      .from('synaxarium_commemorations')
      .select('day_id,title,title_amharic,sort_order')
      .eq('status', 'published')
      .in(
        'day_id',
        days.map((day) => day.id),
      )
      .order('sort_order')
    if (error) throw error

    const byDay = new Map<string, CommemorationPreviewRow[]>()
    for (const row of (data ?? []) as CommemorationPreviewRow[]) {
      const list = byDay.get(row.day_id) ?? []
      list.push(row)
      byDay.set(row.day_id, list)
    }

    return days.map((day) => {
      const rows = byDay.get(day.id) ?? []
      const primary = rows[0]
      return {
        day,
        primaryTitle: primary?.title?.trim() || day.summary || day.displayDateEnglish,
        primaryTitleAmharic: primary?.title_amharic?.trim() || day.displayDateAmharic,
        commemorationsCount: rows.length,
      }
    })
  } catch (error) {
    logError(`getSynaxariumMonthDayPreviews(${monthNumber})`, error)
    throw error
  }
}

export async function getSynaxariumDayBySlug(slugInput?: string | null) {
  const slug = slugInput?.trim().toLowerCase()
  if (!slug || !db) return null
  try {
    const { data, error } = await db
      .from('synaxarium_days')
      .select(
        'id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_english,display_date_amharic,summary,status,image_path,image_alt',
      )
      .eq('slug', slug)
      .eq('status', 'published')
      .maybeSingle()
    if (error) throw error
    return data ? mapDay(data) : null
  } catch (error) {
    logError(`getSynaxariumDayBySlug(${slug})`, error)
    throw error
  }
}

export async function getSynaxariumDay(
  monthNumber: number,
  day: number,
): Promise<SynaxariumDay | null> {
  if (!db || !Number.isFinite(monthNumber) || !Number.isFinite(day)) return null
  try {
    const { data, error } = await db
      .from('synaxarium_days')
      .select(
        'id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_english,display_date_amharic,summary,status,image_path,image_alt',
      )
      .eq('status', 'published')
      .eq('ethiopian_month_number', monthNumber)
      .eq('ethiopian_day', day)
      .maybeSingle()
    if (error) throw error
    return data ? mapDay(data) : null
  } catch (error) {
    logError(`getSynaxariumDay(${monthNumber},${day})`, error)
    throw error
  }
}

export async function getSynaxariumCommemorationsForDay(dayId: string) {
  if (!db) return []
  try {
    const { data, error } = await db
      .from('synaxarium_commemorations')
      .select('*')
      .eq('day_id', dayId)
      .eq('status', 'published')
      .order('sort_order')
    if (error) throw error
    return (data ?? []).map(mapCommemoration)
  } catch (error) {
    logError('getSynaxariumCommemorationsForDay', error)
    throw error
  }
}

/**
 * Published commemorations for a calendar day, including monthly-recurring
 * commemorations whose canonical day shares the same Ethiopian day number.
 * Ordered: featured first, then sort_order.
 */
export async function getSynaxariumCommemorationsForEthiopianDay(
  dayId: string | null,
  ethiopianDay: number,
): Promise<SynaxariumCommemoration[]> {
  const direct = dayId ? await getSynaxariumCommemorationsForDay(dayId) : []
  if (!db) return direct

  let monthly: SynaxariumCommemoration[] = []
  // Do not select is_monthly / image_position — those columns may not exist yet (400).
  // Detect monthly commemorations from title (and optional keyword) after fetch.
  try {
    const { data, error } = await db
      .from('synaxarium_commemorations')
      .select(
        `id,day_id,day_slug,slug,title,title_amharic,commemoration_type,summary,body_amharic,body_english,scripture_references,keywords,sort_order,status,image_path,image_alt,featured,
         day:synaxarium_days(ethiopian_day)`,
      )
      .eq('status', 'published')
      .ilike('title', '%monthly%')
      .order('sort_order')
    if (error) throw error
    type MonthlyRow = CommemorationRow & {
      day: { ethiopian_day: number } | { ethiopian_day: number }[] | null
    }
    monthly = ((data ?? []) as unknown as MonthlyRow[])
      .filter((row) => {
        const day = Array.isArray(row.day) ? row.day[0] : row.day
        return day?.ethiopian_day === ethiopianDay
      })
      .map(mapCommemoration)
  } catch (error) {
    logError('getSynaxariumCommemorationsForEthiopianDay monthly', error)
  }

  const seen = new Set(direct.map((item) => item.id))
  const merged = [...direct]
  for (const item of monthly) {
    if (seen.has(item.id)) continue
    seen.add(item.id)
    merged.push(item)
  }

  return merged.sort((a, b) => {
    const fa = a.featured ? 0 : 1
    const fb = b.featured ? 0 : 1
    if (fa !== fb) return fa - fb
    if (a.sortOrder !== b.sortOrder) return a.sortOrder - b.sortOrder
    return a.title.localeCompare(b.title)
  })
}

export async function getSynaxariumDayWithCommemorations(
  monthNumber: number,
  day: number,
): Promise<SynaxariumDayBundle | null> {
  const synDay = await getSynaxariumDay(monthNumber, day)
  const commemorations = await getSynaxariumCommemorationsForEthiopianDay(
    synDay?.id ?? null,
    day,
  )
  if (synDay) return { day: synDay, commemorations }
  if (commemorations.length === 0) return null

  // Monthly featured commemorations can appear on months that do not yet have a day row.
  const monthName =
    ['Meskerem', 'Tikimt', 'Hidar', 'Tahsas', 'Tir', 'Yekatit', 'Megabit', 'Miazia', 'Ginbot', 'Sene', 'Hamle', 'Nehase', 'Pagumen'][
      monthNumber - 1
    ] || `Month ${monthNumber}`
  return {
    day: {
      id: `virtual-${monthNumber}-${day}`,
      slug: `${monthName.toLowerCase()}-${day}`,
      ethiopianMonth: monthName,
      ethiopianMonthNumber: monthNumber,
      ethiopianDay: day,
      displayDateEnglish: `${monthName} ${day}`,
      displayDateAmharic: '',
      summary: '',
    },
    commemorations,
  }
}

export async function searchSynaxarium(query: string, limit = 12): Promise<SynaxariumCommemoration[]> {
  if (!db || !query.trim()) return []
  const pattern = `%${query.trim()}%`
  try {
    const { data, error } = await db
      .from('synaxarium_commemorations')
      .select('*')
      .eq('status', 'published')
      .or(
        [
          `title.ilike.${pattern}`,
          `title_amharic.ilike.${pattern}`,
          `summary.ilike.${pattern}`,
          `body_amharic.ilike.${pattern}`,
          `body_english.ilike.${pattern}`,
        ].join(','),
      )
      .order('sort_order')
      .limit(limit)
    if (error) throw error
    return (data ?? []).map(mapCommemoration)
  } catch (error) {
    logError('searchSynaxarium', error)
    throw error
  }
}
