/**
 * Shared Calendar Card field resolution:
 * card override → linked structured source → fallback.
 * Used by public Calendar, homepage, See More, and admin preview.
 */
import { ETHIOPIAN_MONTH_NAMES, formatEthiopianLong, gregorianToEthiopian } from '../ethiopianDate'
import { ethiopianPartsToGregorian } from '../eotcCalendar/ethiopianGregorianBridge'
import { addDays, resolvePaschaGregorianDate } from '../churchCalendar/pascha'
import { toGregorianIsoDate } from '../../data/utils/gregorianIso'
import { resolveContentMediaUrl } from '../cms/contentMedia'
import { formatCalendarCardCategory } from './calendarCardCategories'

export const CALENDAR_CARD_SOURCE_TYPES = [
  'manual',
  'observance',
  'fast',
  'season',
  'monthly_commemoration',
  'synaxarium_day',
  'synaxarium_commemoration',
] as const

export type CalendarCardSourceType = (typeof CALENDAR_CARD_SOURCE_TYPES)[number]

export type CalendarCardImagePosition =
  | 'center'
  | 'top'
  | 'bottom'
  | 'left'
  | 'right'
  | 'top-center'

export type LinkedCalendarSource = {
  sourceType: CalendarCardSourceType
  sourceId: string
  sourceSlug: string
  title: string
  titleAmharic: string
  category: string
  cardType: string
  description: string
  ethiopianMonthNumber: number | null
  ethiopianDay: number | null
  isMonthly: boolean
  isMovable: boolean
  paschaOffsetDays: number | null
  rangeLabel: string
  fastingNotes: string
  seasonNotes: string
  summary: string
  summaryAmharic: string
  whatIsIt: string
  whatIsItAmharic: string
  whyCelebrated: string
  whyCelebratedAmharic: string
  importantInformation: string
  importantInformationAmharic: string
  scriptureReferences: string
  fastingNotesAmharic: string
  seasonNotesAmharic: string
  imagePath: string | null
  imageAlt: string
  synaxariumDayId: string | null
  synaxariumDaySlug: string | null
}

export type CalendarCardRawFields = {
  id: string
  slug: string
  title: string
  title_amharic?: string | null
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
  image_path?: string | null
  image_alt?: string | null
  image_position?: string | null
  image_caption?: string | null
  image_caption_amharic?: string | null
  ethiopian_month_number?: number | null
  ethiopian_day?: number | null
  is_monthly?: boolean | null
  synaxarium_day_id?: string | null
  synaxarium_day_slug?: string | null
  featured?: boolean | null
  show_on_home?: boolean | null
  home_featured?: boolean | null
  home_sort_order?: number | null
  sort_order?: number | null
  source_type?: string | null
  source_id?: string | null
  source_slug?: string | null
}

/** Public resolved card — same shape Calendar / Homepage / See More consume. */
export type ResolvedCalendarCard = {
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
  description: string
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
  showOnHome: boolean
  homeFeatured: boolean
  homeSortOrder: number | null
  isMonthly: boolean
  sortOrder: number
  sourceEthiopianMonth: number
  sourceEthiopianDay: number
  sourceType: CalendarCardSourceType
  sourceId: string | null
  sourceSlug: string | null
  isManual: boolean
  sourceMissing: boolean
}

function trim(value?: string | null): string {
  return (value || '').trim()
}

export function normalizeSourceType(raw?: string | null): CalendarCardSourceType {
  const value = trim(raw).toLowerCase().replace(/[\s-]+/g, '_')
  if (!value) return 'manual'
  if ((CALENDAR_CARD_SOURCE_TYPES as readonly string[]).includes(value)) {
    return value as CalendarCardSourceType
  }
  switch (value) {
    case 'monthly':
    case 'monthly_commemorations':
    case 'monthlycommemoration':
      return 'monthly_commemoration'
    case 'observances':
    case 'orthodox_observance':
    case 'orthodox_observances':
      return 'observance'
    case 'fasts':
    case 'liturgical_fast':
    case 'liturgical_fasts':
      return 'fast'
    case 'seasons':
    case 'liturgical_season':
    case 'liturgical_seasons':
      return 'season'
    case 'synaxarium':
    case 'synax_day':
      return 'synaxarium_day'
    case 'synaxarium_commemorations':
    case 'synax_commemoration':
      return 'synaxarium_commemoration'
    default:
      return 'manual'
  }
}

/**
 * Prefer explicit card override when it differs from the source.
 * Empty / whitespace → inherit.
 * Identical copy of source text → inherit (stale placeholder, not a real override).
 */
export function inheritField(override?: string | null, inherited?: string | null): string {
  const o = trim(override)
  const i = trim(inherited)
  if (!o) return i
  if (i && o === i) return i
  return o
}

export function pickOverride(override?: string | null, inherited?: string | null): string {
  return inheritField(override, inherited)
}

export function isLinkedSourceType(type: CalendarCardSourceType): boolean {
  return type !== 'manual'
}

export function normalizeImagePosition(raw: string | null | undefined): CalendarCardImagePosition {
  const v = (raw || '').trim().toLowerCase()
  if (
    v === 'top' ||
    v === 'bottom' ||
    v === 'left' ||
    v === 'right' ||
    v === 'center' ||
    v === 'top-center'
  ) {
    return v
  }
  return 'center'
}

export function imagePositionToObjectPosition(position: CalendarCardImagePosition): string {
  switch (position) {
    case 'top':
    case 'top-center':
      return 'center top'
    case 'bottom':
      return 'center bottom'
    case 'left':
      return 'left center'
    case 'right':
      return 'right center'
    case 'center':
    default:
      return 'center center'
  }
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

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

function civilOrder(d: Date): number {
  return stripLocal(d).getTime()
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
): { gregorian: Date; ethiopian: { year: number; month: number; day: number } } {
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
  return { gregorian: fallback, ethiopian: gregorianToEthiopian(fallback) }
}

/** Next occurrence of a Pascha-offset day on or after `from`. */
export function nextGregorianForPaschaOffset(
  paschaOffsetDays: number,
  from: Date,
): { gregorian: Date; ethiopian: { year: number; month: number; day: number } } {
  const start = stripLocal(from)
  const year = start.getFullYear()
  for (const y of [year - 1, year, year + 1, year + 2]) {
    const pascha = resolvePaschaGregorianDate(y)
    if (!pascha) continue
    const g = stripLocal(addDays(pascha, paschaOffsetDays))
    if (civilOrder(g) >= civilOrder(start)) {
      return { gregorian: g, ethiopian: gregorianToEthiopian(g) }
    }
  }
  const fallbackPascha = resolvePaschaGregorianDate(year + 1) || resolvePaschaGregorianDate(year)
  const g = stripLocal(addDays(fallbackPascha || start, paschaOffsetDays))
  return { gregorian: g, ethiopian: gregorianToEthiopian(g) }
}

const MONTH_ABBR = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'] as const

function formatGregorianShort(d: Date): string {
  return `${MONTH_ABBR[d.getMonth()]} ${d.getDate()}`
}

function formatEthiopianWithEra(parts: { year: number; month: number; day: number }): string {
  return `${formatEthiopianLong(parts)} E.C.`
}

function slugifyMonth(name: string): string {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

function resolveOccurrence(
  row: CalendarCardRawFields,
  linked: LinkedCalendarSource | null,
  from: Date,
): {
  gregorian: Date
  ethiopian: { year: number; month: number; day: number }
  monthNumber: number
  dayNumber: number
  monthly: boolean
} {
  const monthly =
    Boolean(row.is_monthly) ||
    Boolean(linked?.isMonthly) ||
    /monthly/i.test(row.title || '') ||
    linked?.sourceType === 'monthly_commemoration'

  if (linked?.isMovable && linked.paschaOffsetDays != null) {
    const occurrence = nextGregorianForPaschaOffset(linked.paschaOffsetDays, from)
    return {
      ...occurrence,
      monthNumber: occurrence.ethiopian.month,
      dayNumber: occurrence.ethiopian.day,
      monthly: false,
    }
  }

  const ethToday = gregorianToEthiopian(from)
  const monthNumber =
    linked?.ethiopianMonthNumber ??
    (Number(row.ethiopian_month_number) || ethToday.month)
  const dayNumber =
    linked?.ethiopianDay ?? (Number(row.ethiopian_day) || ethToday.day)

  const occurrence = nextGregorianForEthiopianDate(monthNumber, dayNumber, from, { monthly })

  return {
    gregorian: occurrence.gregorian,
    ethiopian: occurrence.ethiopian,
    monthNumber,
    dayNumber,
    monthly,
  }
}

export function resolveCalendarCard(
  row: CalendarCardRawFields,
  from: Date,
  linked: LinkedCalendarSource | null = null,
): ResolvedCalendarCard {
  const sourceType = normalizeSourceType(row.source_type)
  const wantsLink = isLinkedSourceType(sourceType) && Boolean(row.source_id || row.source_slug)
  const sourceMissing = wantsLink && !linked
  const effectiveLink = linked && linked.sourceType === sourceType ? linked : null

  const occurrence = resolveOccurrence(row, effectiveLink, from)
  const position = normalizeImagePosition(row.image_position)

  const title = inheritField(row.title, effectiveLink?.title) || 'Untitled'
  const titleAmharic = inheritField(row.title_amharic, effectiveLink?.titleAmharic)
  const category = inheritField(row.category, effectiveLink?.category)
  const cardType = inheritField(row.card_type, effectiveLink?.cardType) || 'other'
  const description = inheritField(row.description, effectiveLink?.description)
  const summary = inheritField(row.summary, effectiveLink?.summary || effectiveLink?.description)
  const summaryAmharic = inheritField(row.summary_amharic, effectiveLink?.summaryAmharic)
  const whatIsIt = inheritField(row.what_is_it, effectiveLink?.whatIsIt)
  const whatIsItAmharic = inheritField(row.what_is_it_amharic, effectiveLink?.whatIsItAmharic)
  const whyCelebrated = inheritField(row.why_celebrated, effectiveLink?.whyCelebrated)
  const whyCelebratedAmharic = inheritField(
    row.why_celebrated_amharic,
    effectiveLink?.whyCelebratedAmharic,
  )
  const importantInformation = inheritField(
    row.important_information,
    effectiveLink?.importantInformation,
  )
  const importantInformationAmharic = inheritField(
    row.important_information_amharic,
    effectiveLink?.importantInformationAmharic,
  )
  const scriptureReferences = inheritField(
    row.scripture_references,
    effectiveLink?.scriptureReferences,
  )
  const fastingNotes = inheritField(row.fasting_notes, effectiveLink?.fastingNotes)
  const fastingNotesAmharic = inheritField(
    row.fasting_notes_amharic,
    effectiveLink?.fastingNotesAmharic,
  )
  const seasonNotes = inheritField(row.season_notes, effectiveLink?.seasonNotes)
  const seasonNotesAmharic = inheritField(row.season_notes_amharic, effectiveLink?.seasonNotesAmharic)

  const alt = trim(row.image_alt) || trim(effectiveLink?.imageAlt) || title || 'Calendar observance'
  // Presentation image comes ONLY from this card (or explicit source image_path).
  // Never borrow another event's catalog artwork via slug/title fuzzy match.
  const storedPath = trim(row.image_path) || trim(effectiveLink?.imagePath) || null
  let imageUrl = storedPath ? resolveContentMediaUrl(storedPath) : ''
  let imagePath: string | null = storedPath
  if (!imageUrl) {
    imageUrl = ''
    imagePath = null
  }

  if (import.meta.env.DEV && typeof console !== 'undefined') {
    // Temporary diagnostics for source/image identity — no-op in production builds.
    console.debug('[calendar-debug]', {
      cardId: row.id,
      sourceType,
      sourceId: row.source_id,
      sourceSlug: row.source_slug,
      sourceTitle: effectiveLink?.title || title,
      imagePath: storedPath,
      finalImageUrl: imageUrl || null,
      rule: effectiveLink?.rangeLabel || null,
      idMatched: Boolean(effectiveLink && row.source_id && effectiveLink.sourceId === row.source_id),
      slugMatched: Boolean(
        effectiveLink && row.source_slug && effectiveLink.sourceSlug === row.source_slug,
      ),
    })
  }

  const projectedMonthName =
    ETHIOPIAN_MONTH_NAMES[occurrence.ethiopian.month - 1] ||
    `Month ${occurrence.ethiopian.month}`
  const dayId =
    trim(row.synaxarium_day_id) || trim(effectiveLink?.synaxariumDayId) || ''
  const daySlug =
    trim(row.synaxarium_day_slug) ||
    trim(effectiveLink?.synaxariumDaySlug) ||
    `${slugifyMonth(projectedMonthName)}-${occurrence.ethiopian.day}`

  return {
    id: row.id,
    slug: row.slug,
    daySlug,
    dayId,
    title,
    titleAmharic,
    category,
    categoryLabel: formatCalendarCardCategory(category, cardType),
    type: cardType,
    typeLabel: formatCommemorationTypeLabel(cardType),
    description,
    summary,
    summaryAmharic,
    whatIsIt,
    whatIsItAmharic,
    whyCelebrated,
    whyCelebratedAmharic,
    importantInformation,
    importantInformationAmharic,
    scriptureReferences,
    fastingNotes,
    fastingNotesAmharic,
    seasonNotes,
    seasonNotesAmharic,
    shortLabel: trim(row.short_label),
    learnMoreLabel: trim(row.learn_more_label),
    imagePath,
    imageAlt: alt,
    imageUrl,
    imagePosition: position,
    objectPosition: imagePositionToObjectPosition(position),
    imageCaption: trim(row.image_caption),
    imageCaptionAmharic: trim(row.image_caption_amharic),
    ethiopianMonth: projectedMonthName,
    ethiopianMonthNumber: occurrence.ethiopian.month,
    ethiopianDay: occurrence.ethiopian.day,
    ethiopianYear: occurrence.ethiopian.year,
    ethiopianLabel: formatEthiopianWithEra(occurrence.ethiopian),
    gregorianDate: occurrence.gregorian,
    gregorianIso: toGregorianIsoDate(occurrence.gregorian),
    gregorianLabel: formatGregorianShort(occurrence.gregorian),
    featured: Boolean(row.featured),
    showOnHome: Boolean(row.show_on_home),
    homeFeatured: Boolean(row.home_featured),
    homeSortOrder:
      row.home_sort_order == null || !Number.isFinite(Number(row.home_sort_order))
        ? null
        : Number(row.home_sort_order),
    isMonthly: occurrence.monthly,
    sortOrder: Number(row.sort_order) || 0,
    sourceEthiopianMonth: occurrence.monthNumber,
    sourceEthiopianDay: occurrence.dayNumber,
    sourceType: wantsLink ? sourceType : 'manual',
    sourceId: trim(row.source_id) || null,
    sourceSlug: trim(row.source_slug) || effectiveLink?.sourceSlug || null,
    isManual: !wantsLink || sourceType === 'manual',
    sourceMissing,
  }
}

export function sourceTypeBadge(type?: string | null): string {
  switch (normalizeSourceType(type)) {
    case 'observance':
      return 'OBSERVANCE'
    case 'fast':
      return 'FAST'
    case 'season':
      return 'SEASON'
    case 'monthly_commemoration':
      return 'MONTHLY'
    case 'synaxarium_day':
      return 'SYNAX DAY'
    case 'synaxarium_commemoration':
      return 'SYNAX'
    default:
      return 'MANUAL'
  }
}
