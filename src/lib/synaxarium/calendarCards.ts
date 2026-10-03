/**
 * Public Calendar Cards — curated visual strip from public.calendar_cards.
 * Synaxarium (days + commemorations) powers the selected-day detail only.
 * Linked structured sources are resolved at runtime (not copied into the card).
 */
import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import { gregorianToEthiopian, type EthiopianDateParts } from '../ethiopianDate'
import { toGregorianIsoDate } from '../../data/utils/gregorianIso'
import { parseScriptureReferences } from '../calendar/calendarCardCategories'
import {
  loadLinkedSourcesForCards,
  lookupLinkedInMap,
} from '../calendar/calendarCardSources'
import {
  formatCommemorationTypeLabel,
  imagePositionToObjectPosition,
  nextGregorianForEthiopianDate,
  normalizeImagePosition,
  resolveCalendarCard,
  type CalendarCardRawFields,
  type ResolvedCalendarCard,
} from '../calendar/resolveCalendarCard'

export type CalendarCardImagePosition =
  import('../calendar/resolveCalendarCard').CalendarCardImagePosition

/** Public card model (resolved overrides + linked source). */
export type CalendarCard = ResolvedCalendarCard

type CardRow = CalendarCardRawFields & {
  home_start_date?: string | null
  home_end_date?: string | null
  status: string
}

type SynaxDb = {
  public: {
    Tables: Record<
      string,
      { Row: Record<string, unknown>; Insert: never; Update: never; Relationships: [] }
    >
    Views: Record<never, never>
    Functions: Record<never, never>
    Enums: Record<never, never>
    CompositeTypes: Record<never, never>
  }
}

const db = supabase as unknown as SupabaseClient<SynaxDb> | null

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

function civilOrder(d: Date): number {
  return stripLocal(d).getTime()
}

export {
  formatCommemorationTypeLabel,
  imagePositionToObjectPosition,
  nextGregorianForEthiopianDate,
  normalizeImagePosition,
  resolveCalendarCard,
}

const CARD_SELECT_FULL = `id,slug,title,title_amharic,category,card_type,description,
         summary,summary_amharic,what_is_it,what_is_it_amharic,
         why_celebrated,why_celebrated_amharic,
         important_information,important_information_amharic,scripture_references,
         fasting_notes,fasting_notes_amharic,season_notes,season_notes_amharic,
         short_label,learn_more_label,
         image_path,image_alt,image_position,image_caption,image_caption_amharic,
         ethiopian_month_number,ethiopian_day,is_monthly,synaxarium_day_id,synaxarium_day_slug,
         featured,show_on_home,home_featured,home_sort_order,home_start_date,home_end_date,
         source_type,source_id,source_slug,
         sort_order,status,updated_at`

const CARD_SELECT_LEGACY = `id,slug,title,title_amharic,card_type,description,image_path,image_alt,image_position,
       ethiopian_month_number,ethiopian_day,is_monthly,synaxarium_day_id,synaxarium_day_slug,
       featured,sort_order,status`

const CARD_SELECT_NO_SOURCE = `id,slug,title,title_amharic,category,card_type,description,
         summary,summary_amharic,what_is_it,what_is_it_amharic,
         why_celebrated,why_celebrated_amharic,
         important_information,important_information_amharic,scripture_references,
         fasting_notes,fasting_notes_amharic,season_notes,season_notes_amharic,
         short_label,learn_more_label,
         image_path,image_alt,image_position,image_caption,image_caption_amharic,
         ethiopian_month_number,ethiopian_day,is_monthly,synaxarium_day_id,synaxarium_day_slug,
         featured,show_on_home,home_featured,home_sort_order,home_start_date,home_end_date,
         sort_order,status`

export async function getCalendarCards(options?: {
  from?: Date
  limit?: number
  /** When false (default for public calendar), do not require featured=true. */
  featuredOnly?: boolean
}): Promise<CalendarCard[]> {
  if (!db) return []
  const from = stripLocal(options?.from ?? new Date())
  const limit = options?.limit ?? 10
  const featuredOnly = options?.featuredOnly === true

  try {
    let query = db
      .from('calendar_cards')
      .select(CARD_SELECT_FULL)
      .eq('status', 'published')
      .order('sort_order', { ascending: true })
      .limit(Math.max(limit, 24))
    if (featuredOnly) query = query.eq('featured', true)

    const { data, error } = await query

    if (error) {
      if (error.code === '42703' || /column .* does not exist/i.test(error.message || '')) {
        let retryQ = db
          .from('calendar_cards')
          .select(CARD_SELECT_NO_SOURCE)
          .eq('status', 'published')
          .order('sort_order', { ascending: true })
          .limit(Math.max(limit, 24))
        if (featuredOnly) retryQ = retryQ.eq('featured', true)
        const retry = await retryQ
        if (!retry.error) {
          return mapCardRows((retry.data || []) as unknown as CardRow[], from, limit)
        }
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

    return mapCardRows((data || []) as unknown as CardRow[], from, limit)
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[calendarCards] getCalendarCards', cause)
    throw cause
  }
}

/**
 * All published calendar_cards for public page image / override linking.
 * Does not require `featured` — used by the selected-date Calendar Card strip.
 */
export async function getPublishedCalendarCardsForLinking(options?: {
  from?: Date
  limit?: number
}): Promise<CalendarCard[]> {
  if (!db) return []
  const from = stripLocal(options?.from ?? new Date())
  // Linking needs the full published set — prefer a high ceiling over strip-sized pages.
  const limit = Math.min(Math.max(options?.limit ?? 500, 100), 1000)

  try {
    const { data, error } = await db
      .from('calendar_cards')
      .select(CARD_SELECT_FULL)
      .eq('status', 'published')
      .order('sort_order', { ascending: true })
      .limit(limit)

    if (error) {
      if (error.code === '42703' || /column .* does not exist/i.test(error.message || '')) {
        const retry = await db
          .from('calendar_cards')
          .select(CARD_SELECT_NO_SOURCE)
          .eq('status', 'published')
          .order('sort_order', { ascending: true })
          .limit(limit)
        if (retry.error) {
          if (import.meta.env.DEV) {
            console.error('[calendarCards] getPublishedCalendarCardsForLinking retry', retry.error)
          }
          return getCalendarCards({ from, limit }).catch(() => [])
        }
        return mapCardRowsForLinking((retry.data || []) as unknown as CardRow[], from)
      }
      if (import.meta.env.DEV) {
        console.error('[calendarCards] getPublishedCalendarCardsForLinking', error)
      }
      return getCalendarCards({ from, limit }).catch(() => [])
    }

    // Linking must keep EVERY published card — do not truncate by next-occurrence date.
    return mapCardRowsForLinking((data || []) as unknown as CardRow[], from)
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[calendarCards] getPublishedCalendarCardsForLinking', cause)
    return getCalendarCards({ from, limit }).catch(() => [])
  }
}

async function getCalendarCardsLegacy(from: Date, limit: number): Promise<CalendarCard[]> {
  // Last-resort schema fallback for very old DBs. Prefer published cards without
  // requiring featured — Calendar page visibility ≠ homepage featured.
  if (!db) return []
  const { data, error } = await db
    .from('calendar_cards')
    .select(CARD_SELECT_LEGACY)
    .eq('status', 'published')
    .order('sort_order', { ascending: true })
    .limit(Math.max(limit, 24))
  if (error) throw error
  return mapCardRows((data || []) as unknown as CardRow[], from, limit)
}

function homeSortKey(row: CardRow): number {
  const home = row.home_sort_order
  if (home != null && Number.isFinite(Number(home))) return Number(home)
  return Number(row.sort_order) || 0
}

function matchesEthiopianToday(row: CardRow, eth: EthiopianDateParts): boolean {
  const day = Number(row.ethiopian_day) || 0
  if (Boolean(row.is_monthly) || /monthly/i.test(row.title || '')) {
    return day === eth.day
  }
  return Number(row.ethiopian_month_number) === eth.month && day === eth.day
}

function inHomeDateWindow(row: CardRow, todayIso: string): boolean {
  const start = (row.home_start_date || '').trim()
  const end = (row.home_end_date || '').trim()
  if (!start && !end) return true
  if (start && todayIso < start) return false
  if (end && todayIso > end) return false
  return true
}

export async function getHomepageCalendarCards(options?: {
  today?: Date
  limit?: number
}): Promise<CalendarCard[]> {
  if (!db) return []
  const today = stripLocal(options?.today ?? new Date())
  const limit = options?.limit ?? 12
  const todayIso = toGregorianIsoDate(today)
  const eth = gregorianToEthiopian(today)

  try {
    const { data, error } = await db
      .from('calendar_cards')
      .select(CARD_SELECT_FULL)
      .eq('status', 'published')
      .eq('show_on_home', true)
      .order('home_sort_order', { ascending: true, nullsFirst: false })
      .order('sort_order', { ascending: true })
      .limit(48)

    if (error) {
      if (error.code === '42703' || /column .* does not exist/i.test(error.message || '')) {
        if (import.meta.env.DEV) {
          console.warn(
            '[calendarCards] getHomepageCalendarCards: columns missing — run FIX SQL migrations',
            {
              code: error.code,
              message: error.message,
            },
          )
        }
        const retry = await db
          .from('calendar_cards')
          .select(CARD_SELECT_NO_SOURCE)
          .eq('status', 'published')
          .eq('show_on_home', true)
          .order('home_sort_order', { ascending: true, nullsFirst: false })
          .order('sort_order', { ascending: true })
          .limit(48)
        if (retry.error) return []
        return finalizeHomepageRows(
          (retry.data || []) as unknown as CardRow[],
          today,
          todayIso,
          eth,
          limit,
        )
      }
      if (import.meta.env.DEV) {
        console.error('[calendarCards] getHomepageCalendarCards', {
          code: (error as { code?: string }).code,
          message: error.message,
        })
      }
      throw error
    }

    return finalizeHomepageRows((data || []) as unknown as CardRow[], today, todayIso, eth, limit)
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[calendarCards] getHomepageCalendarCards', cause)
    throw cause
  }
}

async function finalizeHomepageRows(
  rawRows: CardRow[],
  today: Date,
  todayIso: string,
  eth: EthiopianDateParts,
  limit: number,
): Promise<CalendarCard[]> {
  const rows = rawRows.filter((row) => inHomeDateWindow(row, todayIso))
  const linkedMap = await loadLinkedSourcesForCards(rows)

  const byPriority = (a: CardRow, b: CardRow) => {
    const sortDiff = homeSortKey(a) - homeSortKey(b)
    if (sortDiff !== 0) return sortDiff
    return (a.title || '').localeCompare(b.title || '', undefined, { sensitivity: 'base' })
  }

  const isToday = (row: CardRow) => {
    const linked = lookupLinkedInMap(linkedMap, row.source_type, row.source_id, row.source_slug)
    const day = Number(row.ethiopian_day) || linked?.ethiopianDay || 0
    const month = Number(row.ethiopian_month_number) || linked?.ethiopianMonthNumber || 0
    const monthly =
      Boolean(row.is_monthly) ||
      linked?.isMonthly ||
      linked?.sourceType === 'monthly_commemoration' ||
      /monthly/i.test(row.title || '')
    if (monthly) return day === eth.day
    if (month && day) return month === eth.month && day === eth.day
    return matchesEthiopianToday(row, eth)
  }

  const todayMatches = rows.filter(isToday).sort(byPriority)
  const todayIds = new Set(todayMatches.map((row) => row.id))
  const featured = rows
    .filter((row) => Boolean(row.home_featured) && !todayIds.has(row.id))
    .sort(byPriority)
  const featuredIds = new Set(featured.map((row) => row.id))
  const rest = rows
    .filter((row) => !todayIds.has(row.id) && !featuredIds.has(row.id))
    .sort(byPriority)

  const ordered = [...todayMatches, ...featured, ...rest].slice(0, limit)

  return ordered.map((row) =>
    resolveCalendarCard(
      row,
      today,
      lookupLinkedInMap(linkedMap, row.source_type, row.source_id, row.source_slug),
    ),
  )
}

async function mapCardRows(rows: CardRow[], from: Date, limit: number): Promise<CalendarCard[]> {
  const cards = await mapCardRowsForLinking(rows, from)

  cards.sort((a, b) => {
    const t = civilOrder(a.gregorianDate) - civilOrder(b.gregorianDate)
    if (t !== 0) return t
    return a.sortOrder - b.sortOrder
  })

  // Date-sorted truncation is only for upcoming-strip UIs — never for source linking.
  return cards.slice(0, limit)
}

/**
 * Resolve every published card for source→presentation linking.
 * Does NOT sort/truncate by next occurrence — Bisrate Gabriel must remain
 * findable even when its next day is further out than the strip window.
 */
async function mapCardRowsForLinking(rows: CardRow[], from: Date): Promise<CalendarCard[]> {
  const linkedMap = await loadLinkedSourcesForCards(rows)
  return rows.map((row) =>
    resolveCalendarCard(
      row,
      from,
      lookupLinkedInMap(linkedMap, row.source_type, row.source_id, row.source_slug),
    ),
  )
}

export function localizedCardText(locale: string, english: string, amharic: string): string {
  const en = (english || '').trim()
  const am = (amharic || '').trim()
  if (locale === 'am') return am || en
  if (locale === 'both') return am || en
  return en || am
}

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
