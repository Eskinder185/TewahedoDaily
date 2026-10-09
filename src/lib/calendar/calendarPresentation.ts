/**
 * Shared presentation helpers for Calendar page + Homepage Today in Church.
 * Structured orthodox day data is authoritative; calendar_cards supply images/overrides only.
 */
import { calendarImageManifest } from '../../content/calendarImageManifest'
import type {
  DayEnrichedFields,
  DayFast,
  DayMonthlyCommemoration,
  DayObservance,
  DaySeason,
} from './orthodoxCalendarTypes'
import {
  enrichedSummary,
  humanFastTypeLabel,
  isFastFreeType,
  movableFriendlyLabel,
  observanceKindLabel,
  publicText,
  type CalendarLocaleMode,
  type EnrichedContentFields,
} from './calendarEnrichedContent'
import type { ResolvedCalendarCard } from './resolveCalendarCard'
import {
  resolveCalendarEventPresentation,
  resolveCalendarCardForSource,
  pickCanonicalCalendarCard,
  type CalendarCardSourceMatch,
} from './resolveCalendarEventPresentation'

export type { CalendarCardSourceMatch }
export { resolveCalendarCardForSource, pickCanonicalCalendarCard }

/** @deprecated Prefer resolveCalendarCardForSource */
export function findCardForSource(
  cards: ResolvedCalendarCard[],
  sourceType: string,
  sourceId: string,
  sourceSlug?: string | null,
): ResolvedCalendarCard | null {
  return resolveCalendarCardForSource(cards, sourceType, sourceId, sourceSlug)
}

export type CalendarCategoryTone =
  | 'christ'
  | 'marian'
  | 'angel'
  | 'saint'
  | 'cross'
  | 'fast'
  | 'season'
  | 'eve'
  | 'neutral'

export type PresentableCalendarEvent = {
  id: string
  slug: string
  kind: 'observance' | 'fast' | 'season' | 'monthly'
  /** Linked calendar_cards.id when presentation was resolved from a card. */
  cardId?: string | null
  sourceType?: string | null
  sourceId?: string | null
  sourceSlug?: string | null
  imagePath?: string | null
  /** Stable React key: occurrenceDate:sourceType:sourceId */
  occurrenceKey?: string
  imagePosition?: string | null
  cardUpdatedAt?: string | null
  title: string
  titleAmharic: string
  categoryLabel: string
  tone: CalendarCategoryTone
  isMajor: boolean
  isEveOrPreparation: boolean
  movableLabel: string | null
  ethiopianDateLabel: string
  summary: string
  summaryAmharic: string
  description: string
  imageUrl: string | null
  imageAlt: string
  objectPosition: string
  hasImage: boolean
  fields: EnrichedContentFields
  fastTypeLabel?: string
  occasionTag?: string | null
}

const PLACEHOLDER = calendarImageManifest.anchors.todayInChurch

export function categoryToneFromText(...parts: Array<string | null | undefined>): CalendarCategoryTone {
  const blob = parts.filter(Boolean).join(' ').toLowerCase()
  if (/eve|vigil|preparation|demera|ketera|gahad|gena eve/.test(blob)) return 'eve'
  if (/mary|mariam|theotokos|filseta|assump/.test(blob)) return 'marian'
  if (/angel|gabriel|michael|raphael|uri?el/.test(blob)) return 'angel'
  if (/cross|meskel|seble/.test(blob)) return 'cross'
  if (/christ|jesus|gena|timket|fasika|pascha|ascension|transfigur/.test(blob)) return 'christ'
  if (/fast|tsom|abi?y|hudadi|filseta/.test(blob)) return 'fast'
  if (/season|zemen|lent|paschal/.test(blob)) return 'season'
  if (/saint|kidus|abba|martyr/.test(blob)) return 'saint'
  return 'neutral'
}

function ethDateLabel(month?: number | null, day?: number | null, monthName?: string): string {
  if (day == null) return ''
  if (monthName) return `${monthName} ${day}`
  if (month != null) return `Day ${day}`
  return `Day ${day}`
}

function fieldsFromDay(row: DayEnrichedFields & { description?: string }): EnrichedContentFields {
  return {
    summary: row.summary,
    summaryAmharic: row.summaryAmharic,
    whatIsIt: row.whatIsIt,
    whatIsItAmharic: row.whatIsItAmharic,
    whyCelebrated: row.whyCelebrated,
    whyCelebratedAmharic: row.whyCelebratedAmharic,
    importantInformation: row.importantInformation,
    importantInformationAmharic: row.importantInformationAmharic,
    scriptureReferences: row.scriptureReferences,
    fastingNotes: row.fastingNotes,
    fastingNotesAmharic: row.fastingNotesAmharic,
    seasonNotes: row.seasonNotes,
    seasonNotesAmharic: row.seasonNotesAmharic,
    description: row.description,
    contentReviewStatus: row.contentReviewStatus,
  }
}

function presentFromResolved(
  base: Omit<
    PresentableCalendarEvent,
    | 'cardId'
    | 'sourceType'
    | 'sourceId'
    | 'sourceSlug'
    | 'imagePath'
    | 'imageUrl'
    | 'imageAlt'
    | 'objectPosition'
    | 'hasImage'
    | 'title'
    | 'titleAmharic'
    | 'occurrenceKey'
    | 'imagePosition'
    | 'cardUpdatedAt'
  > & { title?: string; titleAmharic?: string },
  presentation: ReturnType<typeof resolveCalendarEventPresentation>,
): PresentableCalendarEvent {
  return {
    ...base,
    cardId: presentation.cardId,
    sourceType: presentation.sourceType,
    sourceId: presentation.sourceId,
    sourceSlug: presentation.sourceSlug,
    imagePath: presentation.imagePath,
    imageUrl: presentation.imageUrl,
    imageAlt: presentation.imageAlt || base.title || presentation.title,
    objectPosition: presentation.objectPosition,
    hasImage: presentation.hasImage,
    title: presentation.title || base.title || '',
    titleAmharic: presentation.titleAmharic || base.titleAmharic || '',
    occurrenceKey: presentation.occurrenceKey,
    imagePosition: presentation.imagePosition,
    cardUpdatedAt: presentation.cardUpdatedAt,
  }
}

export function presentObservance(
  row: DayObservance,
  cards: ResolvedCalendarCard[] = [],
  ethMonthName?: string,
  options?: { occurrenceDate?: Date | string | null; surface?: 'calendar' | 'homepage' },
): PresentableCalendarEvent {
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const kindLabel = observanceKindLabel(row.observanceType, row.isMajor)
  const tone = categoryToneFromText(row.category, row.observanceType, row.title, kindLabel)
  const isEve =
    tone === 'eve' ||
    /eve|vigil|preparation|demera|ketera|gahad/i.test(`${row.observanceType} ${row.title}`)
  const presentation = resolveCalendarEventPresentation({
    sourceType: 'observance',
    sourceId: row.id,
    sourceSlug: row.slug,
    occurrenceDate: options?.occurrenceDate,
    source: {
      title: row.title,
      titleAmharic: row.titleAmharic,
      summary: row.summary,
      description: row.description,
      imagePath: row.imagePath,
      imageAlt: row.imageAlt,
    },
    cards,
    surface: options?.surface,
  })

  return presentFromResolved(
    {
      id: row.id,
      slug: row.slug,
      kind: 'observance',
      title: row.title,
      titleAmharic: row.titleAmharic,
      categoryLabel: kindLabel.toUpperCase(),
      tone,
      isMajor: row.isMajor && !isEve,
      isEveOrPreparation: isEve,
      movableLabel: movableFriendlyLabel(row.isMovable),
      ethiopianDateLabel: ethDateLabel(row.ethiopianMonthNumber, row.ethiopianDay, ethMonthName),
      summary: summary.english,
      summaryAmharic: summary.amharic,
      description: row.description,
      fields,
      occasionTag: row.occasionTag,
    },
    presentation,
  )
}

export function presentFast(
  row: DayFast,
  cards: ResolvedCalendarCard[] = [],
  options?: { occurrenceDate?: Date | string | null; surface?: 'calendar' | 'homepage' },
): PresentableCalendarEvent {
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const presentation = resolveCalendarEventPresentation({
    sourceType: 'fast',
    sourceId: row.id,
    sourceSlug: row.slug,
    occurrenceDate: options?.occurrenceDate,
    source: {
      title: row.name,
      titleAmharic: row.nameAmharic,
      summary: row.summary,
      description: row.description,
    },
    cards,
    surface: options?.surface,
  })

  return presentFromResolved(
    {
      id: row.id,
      slug: row.slug,
      kind: 'fast',
      title: row.name,
      titleAmharic: row.nameAmharic,
      categoryLabel: isFastFreeType(row.fastType) ? 'FAST-FREE' : 'FAST',
      tone: 'fast',
      isMajor: false,
      isEveOrPreparation: false,
      movableLabel: null,
      ethiopianDateLabel: '',
      summary: summary.english,
      summaryAmharic: summary.amharic,
      description: row.description,
      fields,
      fastTypeLabel: humanFastTypeLabel(row.fastType),
      occasionTag: row.occasionTag,
    },
    presentation,
  )
}

export function presentSeason(
  row: DaySeason,
  cards: ResolvedCalendarCard[] = [],
  options?: { occurrenceDate?: Date | string | null; surface?: 'calendar' | 'homepage' },
): PresentableCalendarEvent {
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const presentation = resolveCalendarEventPresentation({
    sourceType: 'season',
    sourceId: row.id,
    sourceSlug: row.slug,
    occurrenceDate: options?.occurrenceDate,
    source: {
      title: row.title,
      titleAmharic: row.titleAmharic,
      summary: row.summary,
      description: row.description,
    },
    cards,
    surface: options?.surface,
  })

  return presentFromResolved(
    {
      id: row.id,
      slug: row.slug,
      kind: 'season',
      title: row.title,
      titleAmharic: row.titleAmharic,
      categoryLabel: 'SEASON',
      tone: 'season',
      isMajor: false,
      isEveOrPreparation: false,
      movableLabel: null,
      ethiopianDateLabel: '',
      summary: summary.english,
      summaryAmharic: summary.amharic,
      description: row.description,
      fields,
      occasionTag: row.occasionTags[0] || null,
    },
    presentation,
  )
}

export function presentMonthly(
  row: DayMonthlyCommemoration,
  cards: ResolvedCalendarCard[] = [],
  options?: { occurrenceDate?: Date | string | null; surface?: 'calendar' | 'homepage' },
): PresentableCalendarEvent {
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const presentation = resolveCalendarEventPresentation({
    sourceType: 'monthly_commemoration',
    sourceId: row.id,
    sourceSlug: row.slug,
    occurrenceDate: options?.occurrenceDate,
    source: {
      title: row.title,
      titleAmharic: row.titleAmharic,
      summary: row.summary,
      description: row.description,
      imagePath: row.imagePath,
      imageAlt: row.imageAlt,
    },
    cards,
    surface: options?.surface,
  })

  return presentFromResolved(
    {
      id: row.id,
      slug: row.slug,
      kind: 'monthly',
      title: row.title,
      titleAmharic: row.titleAmharic,
      categoryLabel: 'MONTHLY COMMEMORATION',
      tone: categoryToneFromText(row.category, row.title),
      isMajor: false,
      isEveOrPreparation: false,
      movableLabel: null,
      ethiopianDateLabel: `Day ${row.ethiopianDay}`,
      summary: summary.english,
      summaryAmharic: summary.amharic,
      description: row.description,
      fields,
      occasionTag: row.occasionTag,
    },
    presentation,
  )
}

export function displaySummary(
  event: PresentableCalendarEvent,
  mode: CalendarLocaleMode,
): string {
  if (mode === 'am') return event.summaryAmharic || event.summary || event.description
  return event.summary || event.description || event.summaryAmharic
}

export function publicSummaryLine(fields: EnrichedContentFields): string {
  return publicText(fields.summary, fields.description, fields.contentReviewStatus)
}

export const calendarPlaceholderImage = PLACEHOLDER

export type CalendarFilterId =
  | 'all'
  | 'major'
  | 'christ'
  | 'mary'
  | 'angels'
  | 'saints'
  | 'cross'
  | 'fasts'
  | 'seasons'

export function matchesCalendarFilter(
  event: PresentableCalendarEvent,
  filter: CalendarFilterId,
  query: string,
): boolean {
  const q = query.trim().toLowerCase()
  if (q) {
    const hay = [
      event.title,
      event.titleAmharic,
      event.summary,
      event.summaryAmharic,
      event.categoryLabel,
      event.occasionTag || '',
      event.fields.whatIsIt || '',
    ]
      .join(' ')
      .toLowerCase()
    if (!hay.includes(q)) return false
  }
  switch (filter) {
    case 'all':
      return true
    case 'major':
      return event.isMajor
    case 'christ':
      return event.tone === 'christ'
    case 'mary':
      return event.tone === 'marian'
    case 'angels':
      return event.tone === 'angel'
    case 'saints':
      return event.tone === 'saint' || event.kind === 'monthly'
    case 'cross':
      return event.tone === 'cross'
    case 'fasts':
      return event.kind === 'fast'
    case 'seasons':
      return event.kind === 'season'
    default:
      return true
  }
}

/**
 * Public Calendar card strip order:
 * major observance → other observance → fast → monthly → season
 * (eves/preparations follow majors within observances).
 */
export function sortPresentableCalendarEvents(
  events: PresentableCalendarEvent[],
): PresentableCalendarEvent[] {
  const kindRank = (e: PresentableCalendarEvent): number => {
    if (e.kind === 'observance' && e.isMajor) return 0
    if (e.kind === 'observance') return 1
    if (e.kind === 'fast') return 2
    if (e.kind === 'monthly') return 3
    if (e.kind === 'season') return 4
    return 5
  }
  return [...events].sort((a, b) => {
    const kr = kindRank(a) - kindRank(b)
    if (kr !== 0) return kr
    if (a.isEveOrPreparation !== b.isEveOrPreparation) {
      return a.isEveOrPreparation ? 1 : -1
    }
    return a.title.localeCompare(b.title, undefined, { sensitivity: 'base' })
  })
}

/** Build the selected-date strip from day church context + linked calendar_cards imagery. */
export function presentEventsForDayContext(
  ctx: {
    observances: DayObservance[]
    monthlyCommemorations: DayMonthlyCommemoration[]
    activeFast: DayFast | null
    season: DaySeason | null
    ethiopianDate: { monthName: string }
  },
  cards: ResolvedCalendarCard[] = [],
  options?: { occurrenceDate?: Date | string | null; surface?: 'calendar' | 'homepage' },
): PresentableCalendarEvent[] {
  const ethName = ctx.ethiopianDate.monthName
  const presentOpts = { occurrenceDate: options?.occurrenceDate, surface: options?.surface }
  const items: PresentableCalendarEvent[] = []
  for (const o of ctx.observances) items.push(presentObservance(o, cards, ethName, presentOpts))
  for (const m of ctx.monthlyCommemorations) items.push(presentMonthly(m, cards, presentOpts))
  if (ctx.activeFast) items.push(presentFast(ctx.activeFast, cards, presentOpts))
  if (ctx.season) items.push(presentSeason(ctx.season, cards, presentOpts))
  return sortPresentableCalendarEvents(items)
}
