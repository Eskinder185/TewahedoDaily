/**
 * Public Calendar Cards — curated visual strip from public.calendar_cards.
 * Synaxarium (days + commemorations) powers the selected-day detail only.
 */
import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import {
  ETHIOPIAN_MONTH_NAMES,
  formatEthiopianLong,
  gregorianToEthiopian,
  type EthiopianDateParts,
} from '../ethiopianDate'
import { ethiopianPartsToGregorian } from '../eotcCalendar/ethiopianGregorianBridge'
import { toGregorianIsoDate } from '../../data/utils/gregorianIso'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import {
  calendarImageManifest,
  resolveEventImageById,
} from '../../content/calendarImageManifest'

import {
  formatCalendarCardCategory,
  parseScriptureReferences,
} from '../calendar/calendarCardCategories'

export type CalendarCardImagePosition = 'center' | 'top' | 'bottom' | 'left' | 'right'

export type CalendarCard = {
  id: string
  slug: string
  daySlug: string
  dayId: string
  title: string
  titleAmharic: string
  category: string
  categoryLabel: string
  type: string
  typeLabel: string
  /** Longer CMS description (legacy / admin notes). */
  description: string
  /** Short public summary (English / default). */
  summary: string
  summaryAmharic: string
  whatIsIt: string
  whatIsItAmharic: string
  whyCelebrated: string
  whyCelebratedAmharic: string
  importantInformation: string
  importantInformationAmharic: string
  scriptureReferences: string
  fastingNotes: string
  fastingNotesAmharic: string
  seasonNotes: string
  seasonNotesAmharic: string
  shortLabel: string
  learnMoreLabel: string
  imagePath: string | null
  imageAlt: string
  imageUrl: string
  imagePosition: CalendarCardImagePosition
  objectPosition: string
  imageCaption: string
  imageCaptionAmharic: string
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

type CardRow = {
  id: string
  slug: string
  title: string
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
  ethiopian_month_number: number
  ethiopian_day: number
  is_monthly: boolean | null
  synaxarium_day_id: string | null
  synaxarium_day_slug: string | null
  featured: boolean | null
  sort_order: number
  status: string
}

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

function daysInMonth(monthNumber: number, ethYear: number): number {
  if (monthNumber !== 13) return 30
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

function slugifyMonth(name: string): string {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

function legacyImageForSlug(slug: string, title?: string): string {
  return (
    resolveEventImageById(slug) ||
    resolveEventImageById(title) ||
    calendarImageManifest.anchors.todayInChurch
  )
}

/**
 * Featured published cards from public.calendar_cards only.
 * Does not query synaxarium_commemorations. No Wed/Fri auto fillers.
 */
export async function getCalendarCards(options?: {
  from?: Date
  limit?: number
}): Promise<CalendarCard[]> {
  if (!db) return []
  const from = stripLocal(options?.from ?? new Date())
  const limit = options?.limit ?? 10

  try {
    const { data, error } = await db
      .from('calendar_cards')
      .select(
        `id,slug,title,title_amharic,category,card_type,description,
         summary,summary_amharic,what_is_it,what_is_it_amharic,
         why_celebrated,why_celebrated_amharic,
         important_information,important_information_amharic,scripture_references,
         fasting_notes,fasting_notes_amharic,season_notes,season_notes_amharic,
         short_label,learn_more_label,
         image_path,image_alt,image_position,image_caption,image_caption_amharic,
         ethiopian_month_number,ethiopian_day,is_monthly,synaxarium_day_id,synaxarium_day_slug,
         featured,sort_order,status`,
      )
      .eq('status', 'published')
      .eq('featured', true)
      .order('sort_order', { ascending: true })
      .limit(Math.max(limit, 24))

    if (error) {
      // Older DBs may lack the why/summary columns — retry without them.
      if (
        error.code === '42703' ||
        /column .* does not exist/i.test(error.message || '')
      ) {
        return getCalendarCardsLegacy(from, limit)
      }
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

    const rows = (data || []) as unknown as CardRow[]
    return mapCardRows(rows, from, limit)
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[calendarCards] getCalendarCards', cause)
    throw cause
  }
}

async function getCalendarCardsLegacy(from: Date, limit: number): Promise<CalendarCard[]> {
  if (!db) return []
  const { data, error } = await db
    .from('calendar_cards')
    .select(
      `id,slug,title,title_amharic,card_type,description,image_path,image_alt,image_position,
       ethiopian_month_number,ethiopian_day,is_monthly,synaxarium_day_id,synaxarium_day_slug,
       featured,sort_order,status`,
    )
    .eq('status', 'published')
    .eq('featured', true)
    .order('sort_order', { ascending: true })
    .limit(Math.max(limit, 24))
  if (error) throw error
  return mapCardRows((data || []) as unknown as CardRow[], from, limit)
}

function mapCardRows(rows: CardRow[], from: Date, limit: number): CalendarCard[] {
  const cards: CalendarCard[] = []

  for (const row of rows) {
    const monthNumber = Number(row.ethiopian_month_number) || 1
    const dayNumber = Number(row.ethiopian_day) || 1
    const monthly = Boolean(row.is_monthly) || /monthly/i.test(row.title || '')
    const occurrence = nextGregorianForEthiopianDate(monthNumber, dayNumber, from, {
      monthly,
    })

    const position = normalizeImagePosition(row.image_position)
    const alt = row.image_alt || row.title || 'Calendar observance'
    let imageUrl = ''
    let imagePath: string | null = row.image_path
    if (row.image_path?.trim()) {
      imageUrl = resolveContentMediaUrl(row.image_path) || ''
    }
    if (!imageUrl) {
      imageUrl = legacyImageForSlug(row.slug, row.title)
      imagePath = null
    }

    const projectedMonthName =
      ETHIOPIAN_MONTH_NAMES[occurrence.ethiopian.month - 1] ||
      `Month ${occurrence.ethiopian.month}`
    const projectedDaySlug =
      row.synaxarium_day_slug ||
      `${slugifyMonth(projectedMonthName)}-${occurrence.ethiopian.day}`

    const summary = (row.summary || '').trim()
    const description = (row.description || '').trim()
    const category = (row.category || '').trim()

    cards.push({
      id: row.id,
      slug: row.slug,
      daySlug: projectedDaySlug,
      dayId: row.synaxarium_day_id || '',
      title: row.title,
      titleAmharic: row.title_amharic || '',
      category,
      categoryLabel: formatCalendarCardCategory(category, row.card_type),
      type: row.card_type || 'other',
      typeLabel: formatCommemorationTypeLabel(row.card_type),
      description,
      summary,
      summaryAmharic: (row.summary_amharic || '').trim(),
      whatIsIt: (row.what_is_it || '').trim(),
      whatIsItAmharic: (row.what_is_it_amharic || '').trim(),
      whyCelebrated: (row.why_celebrated || '').trim(),
      whyCelebratedAmharic: (row.why_celebrated_amharic || '').trim(),
      importantInformation: (row.important_information || '').trim(),
      importantInformationAmharic: (row.important_information_amharic || '').trim(),
      scriptureReferences: (row.scripture_references || '').trim(),
      fastingNotes: (row.fasting_notes || '').trim(),
      fastingNotesAmharic: (row.fasting_notes_amharic || '').trim(),
      seasonNotes: (row.season_notes || '').trim(),
      seasonNotesAmharic: (row.season_notes_amharic || '').trim(),
      shortLabel: (row.short_label || '').trim(),
      learnMoreLabel: (row.learn_more_label || '').trim(),
      imagePath,
      imageAlt: alt,
      imageUrl,
      imagePosition: position,
      objectPosition: imagePositionToObjectPosition(position),
      imageCaption: (row.image_caption || '').trim(),
      imageCaptionAmharic: (row.image_caption_amharic || '').trim(),
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
      sortOrder: Number(row.sort_order) || 0,
    })
  }

  cards.sort((a, b) => {
    const t = civilOrder(a.gregorianDate) - civilOrder(b.gregorianDate)
    if (t !== 0) return t
    return a.sortOrder - b.sortOrder
  })

  return cards.slice(0, limit)
}

/** Prefer Amharic copy when locale is am; fall back to English/default. */
export function localizedCardText(
  locale: string,
  english: string,
  amharic: string,
): string {
  const en = (english || '').trim()
  const am = (amharic || '').trim()
  if (locale === 'am') return am || en
  return en || am
}

/** Public summary with CMS fallbacks (never invents religious copy). */
export function resolveCardSummary(card: CalendarCard, locale: string): string {
  const preferred = localizedCardText(locale, card.summary, card.summaryAmharic)
  if (preferred) return preferred
  return (card.description || '').trim()
}

export function resolveCardWhatIsIt(card: CalendarCard, locale: string): string {
  return localizedCardText(locale, card.whatIsIt, card.whatIsItAmharic)
}

export function resolveCardWhy(card: CalendarCard, locale: string): string {
  return localizedCardText(locale, card.whyCelebrated, card.whyCelebratedAmharic)
}

export function resolveCardImportant(card: CalendarCard, locale: string): string {
  return localizedCardText(locale, card.importantInformation, card.importantInformationAmharic)
}

export function resolveCardFasting(card: CalendarCard, locale: string): string {
  return localizedCardText(locale, card.fastingNotes, card.fastingNotesAmharic)
}

export function resolveCardSeason(card: CalendarCard, locale: string): string {
  return localizedCardText(locale, card.seasonNotes, card.seasonNotesAmharic)
}

export function resolveCardImageCaption(card: CalendarCard, locale: string): string {
  return localizedCardText(locale, card.imageCaption, card.imageCaptionAmharic)
}

export function resolveCardScripture(card: CalendarCard): string[] {
  return parseScriptureReferences(card.scriptureReferences)
}

export function cardCategoryBadge(card: CalendarCard): string {
  return (card.shortLabel || card.categoryLabel || card.typeLabel || '').trim()
}
