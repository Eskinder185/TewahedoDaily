/**
 * Shared presentation helpers for Calendar page + Homepage Today in Church.
 * Structured orthodox day data is authoritative; calendar_cards supply images/overrides only.
 */
import { resolveContentMediaUrl } from '../cms/contentMedia'
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
import { inheritField, normalizeSourceType } from './resolveCalendarCard'

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

function resolveImage(
  sourcePath: string | null | undefined,
  card?: ResolvedCalendarCard | null,
): { url: string | null; alt: string; objectPosition: string; hasImage: boolean } {
  // Prefer THIS card's resolved image only — never a shared catalog fallback.
  const cardPath = trim(card?.imagePath)
  const cardUrl = trim(card?.imageUrl)
  if (cardUrl) {
    return {
      url: cardUrl,
      alt: card?.imageAlt || card?.title || '',
      objectPosition: card?.objectPosition || 'center center',
      hasImage: true,
    }
  }
  if (cardPath) {
    const url = resolveContentMediaUrl(cardPath)
    if (url) {
      return {
        url,
        alt: card?.imageAlt || card?.title || '',
        objectPosition: card?.objectPosition || 'center center',
        hasImage: true,
      }
    }
  }
  // Structured source image is allowed only when no card image exists.
  const fromSource = sourcePath ? resolveContentMediaUrl(sourcePath) : ''
  if (fromSource) {
    return {
      url: fromSource,
      alt: '',
      objectPosition: 'center center',
      hasImage: true,
    }
  }
  return {
    url: null,
    alt: '',
    objectPosition: 'center center',
    hasImage: false,
  }
}

function trim(value?: string | null): string {
  return (value || '').trim()
}

/** Minimal fields needed to pick a canonical presentation card for a source. */
export type CalendarCardSourceMatch = {
  id: string
  sourceType: string
  sourceId?: string | null
  sourceSlug?: string | null
  imagePath?: string | null
  imageUrl?: string | null
  title?: string | null
  titleAmharic?: string | null
  summary?: string | null
  imageAlt?: string | null
  imagePosition?: string | null
  featured?: boolean
  showOnHome?: boolean
  homeFeatured?: boolean
  sortOrder?: number
  updatedAt?: string | null
}

function presentationIntentScore(card: CalendarCardSourceMatch): number {
  let score = 0
  if (trim(card.imagePath) || trim(card.imageUrl)) score += 8
  if (trim(card.imageAlt)) score += 2
  if (trim(card.imagePosition) && trim(card.imagePosition) !== 'center') score += 1
  if (trim(card.title)) score += 1
  if (trim(card.titleAmharic)) score += 1
  if (trim(card.summary)) score += 1
  if (card.showOnHome) score += 1
  if (card.homeFeatured) score += 1
  if (card.featured) score += 1
  return score
}

/**
 * Deterministic canonical card among duplicates for the same source.
 * Prefer: correct source_id link → explicit image → presentation settings → sort → newest → id.
 */
export function pickCanonicalCalendarCard<T extends CalendarCardSourceMatch>(
  candidates: T[],
): T | null {
  if (!candidates.length) return null
  if (candidates.length === 1) return candidates[0]
  return [...candidates].sort((a, b) => {
    const aIdLinked = trim(a.sourceId) ? 1 : 0
    const bIdLinked = trim(b.sourceId) ? 1 : 0
    if (bIdLinked !== aIdLinked) return bIdLinked - aIdLinked

    const aImg = trim(a.imagePath) || trim(a.imageUrl) ? 1 : 0
    const bImg = trim(b.imagePath) || trim(b.imageUrl) ? 1 : 0
    if (bImg !== aImg) return bImg - aImg

    const intent = presentationIntentScore(b) - presentationIntentScore(a)
    if (intent !== 0) return intent

    const aSort = Number.isFinite(Number(a.sortOrder)) ? Number(a.sortOrder) : 9999
    const bSort = Number.isFinite(Number(b.sortOrder)) ? Number(b.sortOrder) : 9999
    if (aSort !== bSort) return aSort - bSort

    const aUpdated = trim(a.updatedAt)
    const bUpdated = trim(b.updatedAt)
    if (aUpdated !== bUpdated) return bUpdated.localeCompare(aUpdated)

    return a.id.localeCompare(b.id)
  })[0]
}

/**
 * Shared Calendar / Homepage card lookup for a structured source.
 * Resolution order:
 * 1. exact source_type + source_id
 * 2. if missing, exact source_type + source_slug
 * Never resolves by title, array index, or "first monthly of the day".
 */
export function resolveCalendarCardForSource<T extends CalendarCardSourceMatch>(
  cards: T[],
  sourceType: string,
  sourceId: string,
  sourceSlug?: string | null,
): T | null {
  const type = normalizeSourceType(sourceType)
  const id = (sourceId || '').trim()
  const slug = (sourceSlug || '').trim()
  if (!id && !slug) return null

  const ofType = cards.filter((c) => normalizeSourceType(c.sourceType) === type)
  const byId = id ? ofType.filter((c) => (c.sourceId || '').trim() === id) : []
  if (byId.length) return pickCanonicalCalendarCard(byId)

  if (!slug) return null
  const bySlug = ofType.filter((c) => (c.sourceSlug || '').trim() === slug)
  return pickCanonicalCalendarCard(bySlug)
}

/** @deprecated Prefer resolveCalendarCardForSource — kept as alias for callers/tests. */
export function findCardForSource(
  cards: ResolvedCalendarCard[],
  sourceType: string,
  sourceId: string,
  sourceSlug?: string | null,
): ResolvedCalendarCard | null {
  return resolveCalendarCardForSource(cards, sourceType, sourceId, sourceSlug)
}

export function presentObservance(
  row: DayObservance,
  cards: ResolvedCalendarCard[] = [],
  ethMonthName?: string,
): PresentableCalendarEvent {
  const card = resolveCalendarCardForSource(cards, 'observance', row.id, row.slug)
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const kindLabel = observanceKindLabel(row.observanceType, row.isMajor)
  const tone = categoryToneFromText(row.category, row.observanceType, row.title, kindLabel)
  const image = resolveImage(row.imagePath, card)
  const isEve =
    tone === 'eve' ||
    /eve|vigil|preparation|demera|ketera|gahad/i.test(`${row.observanceType} ${row.title}`)

  return {
    id: row.id,
    slug: row.slug,
    kind: 'observance',
    cardId: card?.id || null,
    sourceType: 'observance',
    sourceId: row.id,
    sourceSlug: row.slug,
    imagePath: card?.imagePath || (image.hasImage ? row.imagePath : null) || null,
    title: inheritField(card?.title, row.title) || row.title,
    titleAmharic: inheritField(card?.titleAmharic, row.titleAmharic),
    categoryLabel: kindLabel.toUpperCase(),
    tone,
    isMajor: row.isMajor && !isEve,
    isEveOrPreparation: isEve,
    movableLabel: movableFriendlyLabel(row.isMovable),
    ethiopianDateLabel: ethDateLabel(row.ethiopianMonthNumber, row.ethiopianDay, ethMonthName),
    summary: summary.english,
    summaryAmharic: summary.amharic,
    description: row.description,
    imageUrl: image.url,
    imageAlt: image.alt || row.imageAlt || row.title,
    objectPosition: image.objectPosition,
    hasImage: image.hasImage,
    fields,
    occasionTag: row.occasionTag,
  }
}

export function presentFast(row: DayFast, cards: ResolvedCalendarCard[] = []): PresentableCalendarEvent {
  const card = resolveCalendarCardForSource(cards, 'fast', row.id, row.slug)
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const image = resolveImage(null, card)
  return {
    id: row.id,
    slug: row.slug,
    kind: 'fast',
    cardId: card?.id || null,
    sourceType: 'fast',
    sourceId: row.id,
    sourceSlug: row.slug,
    imagePath: card?.imagePath || null,
    title: inheritField(card?.title, row.name) || row.name,
    titleAmharic: inheritField(card?.titleAmharic, row.nameAmharic),
    categoryLabel: isFastFreeType(row.fastType) ? 'FAST-FREE' : 'FAST',
    tone: 'fast',
    isMajor: false,
    isEveOrPreparation: false,
    movableLabel: null,
    ethiopianDateLabel: '',
    summary: summary.english,
    summaryAmharic: summary.amharic,
    description: row.description,
    imageUrl: image.url,
    imageAlt: image.alt || row.name,
    objectPosition: image.objectPosition,
    hasImage: image.hasImage,
    fields,
    fastTypeLabel: humanFastTypeLabel(row.fastType),
    occasionTag: row.occasionTag,
  }
}

export function presentSeason(
  row: DaySeason,
  cards: ResolvedCalendarCard[] = [],
): PresentableCalendarEvent {
  const card = resolveCalendarCardForSource(cards, 'season', row.id, row.slug)
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const image = resolveImage(null, card)
  return {
    id: row.id,
    slug: row.slug,
    kind: 'season',
    cardId: card?.id || null,
    sourceType: 'season',
    sourceId: row.id,
    sourceSlug: row.slug,
    imagePath: card?.imagePath || null,
    title: inheritField(card?.title, row.title) || row.title,
    titleAmharic: inheritField(card?.titleAmharic, row.titleAmharic),
    categoryLabel: 'SEASON',
    tone: 'season',
    isMajor: false,
    isEveOrPreparation: false,
    movableLabel: null,
    ethiopianDateLabel: '',
    summary: summary.english,
    summaryAmharic: summary.amharic,
    description: row.description,
    imageUrl: image.url,
    imageAlt: image.alt || row.title,
    objectPosition: image.objectPosition,
    hasImage: image.hasImage,
    fields,
    occasionTag: row.occasionTags[0] || null,
  }
}

export function presentMonthly(
  row: DayMonthlyCommemoration,
  cards: ResolvedCalendarCard[] = [],
): PresentableCalendarEvent {
  const card = resolveCalendarCardForSource(cards, 'monthly_commemoration', row.id, row.slug)
  const fields = fieldsFromDay(row)
  const summary = enrichedSummary(fields)
  const image = resolveImage(row.imagePath, card)
  return {
    id: row.id,
    slug: row.slug,
    kind: 'monthly',
    cardId: card?.id || null,
    sourceType: 'monthly_commemoration',
    sourceId: row.id,
    sourceSlug: row.slug,
    imagePath: card?.imagePath || (image.hasImage ? row.imagePath : null) || null,
    title: inheritField(card?.title, row.title) || row.title,
    titleAmharic: inheritField(card?.titleAmharic, row.titleAmharic),
    categoryLabel: 'MONTHLY COMMEMORATION',
    tone: categoryToneFromText(row.category, row.title),
    isMajor: false,
    isEveOrPreparation: false,
    movableLabel: null,
    ethiopianDateLabel: `Day ${row.ethiopianDay}`,
    summary: summary.english,
    summaryAmharic: summary.amharic,
    description: row.description,
    imageUrl: image.url,
    imageAlt: image.alt || row.imageAlt || row.title,
    objectPosition: image.objectPosition,
    hasImage: image.hasImage,
    fields,
    occasionTag: row.occasionTag,
  }
}

export function displaySummary(
  event: PresentableCalendarEvent,
  mode: CalendarLocaleMode,
): string {
  if (mode === 'am') return event.summaryAmharic || event.summary || event.description
  if (mode === 'both') return event.summaryAmharic || event.summary || event.description
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
): PresentableCalendarEvent[] {
  const ethName = ctx.ethiopianDate.monthName
  const items: PresentableCalendarEvent[] = []
  for (const o of ctx.observances) items.push(presentObservance(o, cards, ethName))
  for (const m of ctx.monthlyCommemorations) items.push(presentMonthly(m, cards))
  if (ctx.activeFast) items.push(presentFast(ctx.activeFast, cards))
  if (ctx.season) items.push(presentSeason(ctx.season, cards))
  const sorted = sortPresentableCalendarEvents(items)
  if (import.meta.env.DEV && typeof console !== 'undefined') {
    for (const event of sorted) {
      const card = event.cardId
        ? cards.find((c) => c.id === event.cardId) || null
        : resolveCalendarCardForSource(cards, event.sourceType || '', event.sourceId || '', event.sourceSlug)
      console.debug('[calendar-debug]', {
        occurrenceDate: ethName,
        sourceType: event.sourceType,
        sourceId: event.sourceId,
        sourceSlug: event.sourceSlug,
        cardId: event.cardId,
        cardImagePath: card?.imagePath || null,
        cardTitleOverride: trim(card?.title) || null,
        sourceTitle: event.title,
        finalTitle: event.title,
        finalImagePath: event.imagePath,
        finalImageUrl: event.imageUrl,
        rule: event.ethiopianDateLabel || event.movableLabel,
      })
    }
  }
  return sorted
}
