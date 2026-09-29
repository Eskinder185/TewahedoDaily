/**
 * Public Calendar Cards — Synaxarium commemorations marked featured.
 * Source of truth: synaxarium_days + synaxarium_commemorations (Supabase).
 */
import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import { ethiopianPartsToGregorian } from '../eotcCalendar/ethiopianGregorianBridge'
import {
  ETHIOPIAN_MONTH_NAMES,
  formatEthiopianLong,
  gregorianToEthiopian,
  type EthiopianDateParts,
} from '../ethiopianDate'
import { toGregorianIsoDate } from '../../data/utils/gregorianIso'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import {
  calendarImageManifest,
  resolveEventImageById,
} from '../../content/calendarImageManifest'
import { parseKeywordsFromDb } from './keywords'

export type CalendarCardImagePosition = 'center' | 'top' | 'bottom' | 'left' | 'right'

export type CalendarCard = {
  id: string
  slug: string
  daySlug: string
  dayId: string
  title: string
  titleAmharic: string
  type: string
  typeLabel: string
  summary: string
  imagePath: string | null
  imageAlt: string
  imageUrl: string
  imagePosition: CalendarCardImagePosition
  objectPosition: string
  ethiopianMonth: string
  ethiopianMonthNumber: number
  ethiopianDay: number
  ethiopianYear: number
  ethiopianLabel: string
  gregorianDate: Date
  gregorianIso: string
  gregorianLabel: string
  featured: boolean
  isMonthly: boolean
  sortOrder: number
}

type DayJoin = {
  id: string
  slug: string
  ethiopian_month: string
  ethiopian_month_number: number
  ethiopian_day: number
  display_date_amharic: string | null
  display_date_english: string | null
  image_path: string | null
  image_alt: string | null
  status: string
}

type FeaturedRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  commemoration_type: string | null
  summary: string | null
  sort_order: number
  status: string
  image_path: string | null
  image_alt: string | null
  featured: boolean | null
  is_monthly: boolean | null
  image_position: string | null
  day_id: string
  day_slug: string | null
  keywords: unknown
  day: DayJoin | DayJoin[] | null
}

type SoftImageRow = { image_path: string | null; image_alt: string | null; name?: string | null; slug?: string | null }

type SynaxDb = {
  public: {
    Tables: Record<string, { Row: Record<string, unknown>; Insert: never; Update: never; Relationships: [] }>
    Views: Record<never, never>
    Functions: Record<never, never>
    Enums: Record<never, never>
    CompositeTypes: Record<never, never>
  }
}

const db = supabase as unknown as SupabaseClient<SynaxDb> | null

const MONTH_ABBR = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'] as const

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

function civilOrder(d: Date): number {
  return stripLocal(d).getTime()
}

export function formatCommemorationTypeLabel(raw: string | null | undefined): string {
  const value = (raw || '').trim()
  if (!value) return 'COMMEMORATION'
  return value
    .replace(/[_-]+/g, ' ')
    .split(/\s+/)
    .filter(Boolean)
    .map((part) => part.toUpperCase())
    .join(' ')
}

export function normalizeImagePosition(raw: string | null | undefined): CalendarCardImagePosition {
  const v = (raw || '').trim().toLowerCase()
  if (v === 'top' || v === 'bottom' || v === 'left' || v === 'right' || v === 'center') return v
  return 'center'
}

export function imagePositionToObjectPosition(position: CalendarCardImagePosition): string {
  switch (position) {
    case 'top':
      return '50% 18%'
    case 'bottom':
      return '50% 82%'
    case 'left':
      return '22% 40%'
    case 'right':
      return '78% 40%'
    case 'center':
    default:
      return '50% 40%'
  }
}

function unwrapDay(day: FeaturedRow['day']): DayJoin | null {
  if (!day) return null
  return Array.isArray(day) ? day[0] || null : day
}

function daysInMonth(monthNumber: number, ethYear: number): number {
  if (monthNumber !== 13) return 30
  // Pagumen: 6 days in leap years (year % 4 === 3 in Ethiopic), else 5
  return ethYear % 4 === 3 ? 6 : 5
}

/** Next Gregorian occurrence of an Ethiopian month/day on or after `from`. */
export function nextGregorianForEthiopianDate(
  ethMonth: number,
  ethDay: number,
  from: Date,
  options?: { monthly?: boolean },
): { gregorian: Date; ethiopian: EthiopianDateParts } {
  const start = stripLocal(from)
  const todayEth = gregorianToEthiopian(start)

  if (options?.monthly) {
    let year = todayEth.year
    let month = todayEth.month
    // Try current month first if day is still ahead or today
    for (let step = 0; step < 14; step++) {
      const maxDay = daysInMonth(month, year)
      const day = Math.min(ethDay, maxDay)
      if (day >= 1) {
        const g = stripLocal(ethiopianPartsToGregorian(year, month, day))
        if (civilOrder(g) >= civilOrder(start)) {
          return { gregorian: g, ethiopian: { year, month, day } }
        }
      }
      month += 1
      if (month > 13) {
        month = 1
        year += 1
      }
    }
  }

  // Fixed annual: this EC year, else next
  let year = todayEth.year
  for (let i = 0; i < 2; i++) {
    const maxDay = daysInMonth(ethMonth, year)
    const day = Math.min(ethDay, maxDay)
    const g = stripLocal(ethiopianPartsToGregorian(year, ethMonth, day))
    if (civilOrder(g) >= civilOrder(start)) {
      return { gregorian: g, ethiopian: { year, month: ethMonth, day } }
    }
    year += 1
  }

  const fallback = stripLocal(ethiopianPartsToGregorian(todayEth.year + 1, ethMonth, ethDay))
  const eth = gregorianToEthiopian(fallback)
  return { gregorian: fallback, ethiopian: eth }
}

function formatGregorianShort(d: Date): string {
  return `${MONTH_ABBR[d.getMonth()]} ${d.getDate()}`
}

function formatEthiopianWithEra(parts: EthiopianDateParts): string {
  return `${formatEthiopianLong(parts)} E.C.`
}

async function lookupRelatedImage(
  title: string,
  type: string,
): Promise<{ path: string; alt: string } | null> {
  if (!db) return null
  const needle = title.toLowerCase()
  const tryTable = async (table: 'saints' | 'feasts') => {
    try {
      const { data, error } = await db!
        .from(table)
        .select('image_path,image_alt,name,slug')
        .not('image_path', 'is', null)
        .limit(40)
      if (error || !data) return null
      const rows = data as unknown as SoftImageRow[]
      const hit = rows.find((row) => {
        const name = (row.name || row.slug || '').toLowerCase()
        if (!name || !row.image_path) return false
        return needle.includes(name) || name.includes(needle.split(' ')[0] || '')
      })
      if (hit?.image_path) {
        return { path: hit.image_path, alt: hit.image_alt || title }
      }
    } catch {
      /* table may not exist */
    }
    return null
  }

  if (/mary|marian|mariam/i.test(type) || /mary|mariam/i.test(title)) {
    const feast = await tryTable('feasts')
    if (feast) return feast
  }
  const saint = await tryTable('saints')
  if (saint) return saint
  if (/feast|major/i.test(type)) {
    const feast = await tryTable('feasts')
    if (feast) return feast
  }
  return null
}

function legacyImageForSlug(slug: string, title?: string): string {
  return (
    resolveEventImageById(slug) ||
    resolveEventImageById(title) ||
    calendarImageManifest.anchors.todayInChurch
  )
}

/**
 * Resolve card image URL.
 * Priority: commemoration.image_path → saint/feast match → day.image_path → legacy/fallback asset.
 */
export async function resolveCalendarCardImage(input: {
  slug: string
  title: string
  type: string
  imagePath: string | null
  imageAlt: string | null
  dayImagePath: string | null
  dayImageAlt: string | null
}): Promise<{ url: string; alt: string; path: string | null }> {
  const altFallback = input.imageAlt || input.dayImageAlt || input.title || 'Calendar observance'

  if (input.imagePath?.trim()) {
    const url = resolveContentMediaUrl(input.imagePath)
    if (url) return { url, alt: altFallback, path: input.imagePath }
  }

  const related = await lookupRelatedImage(input.title, input.type)
  if (related?.path) {
    const url = resolveContentMediaUrl(related.path)
    if (url) return { url, alt: related.alt || altFallback, path: related.path }
  }

  if (input.dayImagePath?.trim()) {
    const url = resolveContentMediaUrl(input.dayImagePath)
    if (url) return { url, alt: input.dayImageAlt || altFallback, path: input.dayImagePath }
  }

  return {
    url: legacyImageForSlug(input.slug, input.title),
    alt: altFallback,
    path: null,
  }
}

function prioritizeSameDay(
  rows: FeaturedRow[],
): FeaturedRow[] {
  // One card per eth day occurrence preference: featured already filtered; among same day_id pick lowest sort_order
  const byDay = new Map<string, FeaturedRow>()
  const sorted = [...rows].sort((a, b) => {
    const fa = a.featured ? 0 : 1
    const fb = b.featured ? 0 : 1
    if (fa !== fb) return fa - fb
    if (a.sort_order !== b.sort_order) return a.sort_order - b.sort_order
    return a.title.localeCompare(b.title)
  })
  const out: FeaturedRow[] = []
  for (const row of sorted) {
    const day = unwrapDay(row.day)
    const key = day
      ? `${day.ethiopian_month_number}-${day.ethiopian_day}-${row.is_monthly ? row.slug : 'fixed'}`
      : row.id
    // Monthly cards each get their own slot (different saints share days rarely)
    if (row.is_monthly) {
      out.push(row)
      continue
    }
    if (byDay.has(key)) continue
    byDay.set(key, row)
    out.push(row)
  }
  return out
}

/**
 * Featured published commemorations projected onto upcoming Gregorian dates.
 * Does not include Wednesday/Friday fast fillers.
 */
export async function getCalendarCards(options?: {
  from?: Date
  limit?: number
}): Promise<CalendarCard[]> {
  if (!db) return []
  const from = stripLocal(options?.from ?? new Date())
  const limit = options?.limit ?? 8

  try {
    // Only select columns confirmed on live schema (no is_monthly / image_position).
    const { data, error } = await db
      .from('synaxarium_commemorations')
      .select(
        `id,slug,title,title_amharic,commemoration_type,summary,sort_order,status,image_path,image_alt,featured,day_id,day_slug,keywords,
         day:synaxarium_days(id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_amharic,display_date_english,image_path,image_alt,status)`,
      )
      .eq('status', 'published')
      .eq('featured', true)
      .order('sort_order', { ascending: true })
      .limit(80)

    if (error) {
      if (import.meta.env.DEV) {
        console.error('[calendarCards] getCalendarCards', {
          code: (error as { code?: string }).code,
          message: error.message,
          details: (error as { details?: string }).details,
          hint: (error as { hint?: string }).hint,
        })
      }
      throw error
    }

    const rows = prioritizeSameDay((data || []) as unknown as FeaturedRow[])

    const cards: CalendarCard[] = []
    for (const row of rows) {
      const day = unwrapDay(row.day)
      if (!day) continue
      if (!row.is_monthly && day.status && day.status !== 'published') continue

      const keywordList = parseKeywordsFromDb(row.keywords)
      const monthly =
        Boolean(row.is_monthly) ||
        /monthly/i.test(row.title || '') ||
        keywordList.some((k) => /monthly/i.test(k))
      const occurrence = nextGregorianForEthiopianDate(
        day.ethiopian_month_number,
        day.ethiopian_day,
        from,
        { monthly },
      )

      const position = normalizeImagePosition(row.image_position)
      const image = await resolveCalendarCardImage({
        slug: row.slug,
        title: row.title,
        type: row.commemoration_type || '',
        imagePath: row.image_path,
        imageAlt: row.image_alt,
        dayImagePath: day.image_path,
        dayImageAlt: day.image_alt,
      })

      const projectedMonthName =
        ETHIOPIAN_MONTH_NAMES[occurrence.ethiopian.month - 1] ||
        `Month ${occurrence.ethiopian.month}`
      const projectedDaySlug = `${slugifyMonth(projectedMonthName)}-${occurrence.ethiopian.day}`

      cards.push({
        id: row.id,
        slug: row.slug,
        daySlug: projectedDaySlug,
        dayId: day.id,
        title: row.title,
        titleAmharic: row.title_amharic || '',
        type: row.commemoration_type || 'commemoration',
        typeLabel: formatCommemorationTypeLabel(row.commemoration_type),
        summary: row.summary || '',
        imagePath: image.path,
        imageAlt: image.alt,
        imageUrl: image.url,
        imagePosition: position,
        objectPosition: imagePositionToObjectPosition(position),
        ethiopianMonth: projectedMonthName,
        ethiopianMonthNumber: occurrence.ethiopian.month,
        ethiopianDay: occurrence.ethiopian.day,
        ethiopianYear: occurrence.ethiopian.year,
        ethiopianLabel: formatEthiopianWithEra(occurrence.ethiopian),
        gregorianDate: occurrence.gregorian,
        gregorianIso: toGregorianIsoDate(occurrence.gregorian),
        gregorianLabel: formatGregorianShort(occurrence.gregorian),
        featured: Boolean(row.featured),
        isMonthly: monthly,
        sortOrder: row.sort_order,
      })
    }

    cards.sort((a, b) => {
      const t = civilOrder(a.gregorianDate) - civilOrder(b.gregorianDate)
      if (t !== 0) return t
      return a.sortOrder - b.sortOrder
    })

    return cards.slice(0, limit)
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[calendarCards] getCalendarCards', cause)
    throw cause
  }
}

function slugifyMonth(name: string): string {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}
