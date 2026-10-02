/**
 * SINGLE SOURCE OF TRUTH for Calendar Card presentation resolution.
 *
 * Structured source (occurrence) → canonical calendar_cards row → normalized fields.
 * Calendar page and Homepage MUST both use this — no parallel card lookups.
 */
import { resolveContentMediaUrl } from '../cms/contentMedia'
import {
  inheritField,
  imagePositionToObjectPosition,
  normalizeImagePosition,
  normalizeSourceType,
  type ResolvedCalendarCard,
} from './resolveCalendarCard'
import {
  pickCanonicalCalendarCard,
  resolveCalendarCardForSource,
  type CalendarCardSourceMatch,
} from './calendarCardLookup'

export type { CalendarCardSourceMatch }
export { pickCanonicalCalendarCard, resolveCalendarCardForSource }

export type CalendarEventPresentationInput = {
  sourceType: string
  sourceId: string
  sourceSlug?: string | null
  occurrenceDate?: Date | string | null
  source: {
    title: string
    titleAmharic?: string | null
    summary?: string | null
    description?: string | null
    imagePath?: string | null
    imageAlt?: string | null
  }
  cards: CalendarCardSourceMatch[]
  surface?: 'calendar' | 'homepage'
}

export type ResolvedCalendarImage = {
  imagePath: string | null
  imageUrl: string | null
  imageAlt: string
  imagePosition: string
  objectPosition: string
  hasImage: boolean
  cardUpdatedAt: string | null
}

export type ResolvedCalendarEventPresentation = {
  cardId: string | null
  sourceType: string
  sourceId: string
  sourceSlug: string | null
  title: string
  titleAmharic: string
  imagePath: string | null
  imageUrl: string | null
  imageAlt: string
  imagePosition: string
  objectPosition: string
  hasImage: boolean
  cardUpdatedAt: string | null
  occurrenceKey: string
}

function trim(value?: string | null): string {
  return (value || '').trim()
}

function toIsoDay(value?: Date | string | null): string {
  if (!value) return ''
  if (typeof value === 'string') return value.slice(0, 10)
  const y = value.getFullYear()
  const m = String(value.getMonth() + 1).padStart(2, '0')
  const d = String(value.getDate()).padStart(2, '0')
  return `${y}-${m}-${d}`
}

/**
 * Presentation image: ONLY calendar_cards.image_path (via content-media).
 * Never borrow structured-source artwork or another event's image.
 */
export function resolveCalendarImage(
  card?: CalendarCardSourceMatch | ResolvedCalendarCard | null,
  _sourceImagePath?: string | null,
): ResolvedCalendarImage {
  const path = trim(card?.imagePath) || null
  const updatedAt = trim((card as CalendarCardSourceMatch | undefined)?.updatedAt) || null
  let url = ''
  if (path) {
    url = resolveContentMediaUrl(path)
    if (url && updatedAt) {
      const stamp = encodeURIComponent(updatedAt)
      url = url.includes('?') ? `${url}&v=${stamp}` : `${url}?v=${stamp}`
    }
  } else if (trim(card?.imageUrl)) {
    url = trim(card?.imageUrl)
  }

  const position = normalizeImagePosition(
    (card as { imagePosition?: string | null } | undefined)?.imagePosition || 'center',
  )

  return {
    imagePath: path,
    imageUrl: url || null,
    imageAlt: trim(card?.imageAlt) || '',
    imagePosition: position,
    objectPosition: imagePositionToObjectPosition(position),
    hasImage: Boolean(url),
    cardUpdatedAt: updatedAt,
  }
}

export function resolveCalendarEventPresentation(
  input: CalendarEventPresentationInput,
): ResolvedCalendarEventPresentation {
  const sourceType = normalizeSourceType(input.sourceType)
  const sourceId = trim(input.sourceId)
  const sourceSlug = trim(input.sourceSlug) || null
  const card = resolveCalendarCardForSource(
    input.cards,
    sourceType,
    sourceId,
    sourceSlug,
  )

  const image = resolveCalendarImage(card, input.source.imagePath)
  const title = inheritField(card?.title, input.source.title) || input.source.title
  const titleAmharic = inheritField(card?.titleAmharic, input.source.titleAmharic)
  const occurrenceDate = toIsoDay(input.occurrenceDate)
  const occurrenceKey = `${occurrenceDate || 'undated'}:${sourceType}:${sourceId || sourceSlug || 'unknown'}`

  if (import.meta.env.DEV && typeof console !== 'undefined') {
    const channel =
      input.surface === 'homepage' ? '[homepage-card-resolution]' : '[calendar-card-resolution]'
    console.debug(channel, {
      occurrenceDate: occurrenceDate || null,
      sourceType,
      sourceId: sourceId || null,
      sourceSlug,
      canonicalCardId: card?.id || null,
      imagePath: image.imagePath,
      updatedAt: image.cardUpdatedAt,
    })
  }

  return {
    cardId: card?.id || null,
    sourceType,
    sourceId: sourceId || '',
    sourceSlug,
    title,
    titleAmharic,
    imagePath: image.imagePath,
    imageUrl: image.imageUrl,
    imageAlt: image.imageAlt || title,
    imagePosition: image.imagePosition,
    objectPosition: image.objectPosition,
    hasImage: image.hasImage,
    cardUpdatedAt: image.cardUpdatedAt,
    occurrenceKey,
  }
}

/** Pure duplicate detection for tests / Content Health helpers. */
export function findDuplicateCalendarCardGroups(
  cards: CalendarCardSourceMatch[],
): Array<{
  key: string
  sourceType: string
  sourceId: string | null
  sourceSlug: string | null
  cardIds: string[]
  canonicalId: string | null
}> {
  const byId = new Map<string, CalendarCardSourceMatch[]>()
  for (const card of cards) {
    const type = normalizeSourceType(card.sourceType)
    if (type === 'manual') continue
    const id = trim(card.sourceId)
    if (!id) continue
    const key = `${type}:id:${id}`
    const list = byId.get(key) || []
    list.push(card)
    byId.set(key, list)
  }

  const groups: Array<{
    key: string
    sourceType: string
    sourceId: string | null
    sourceSlug: string | null
    cardIds: string[]
    canonicalId: string | null
  }> = []

  for (const [key, list] of byId) {
    if (list.length < 2) continue
    const canonical = pickCanonicalCalendarCard(list)
    groups.push({
      key,
      sourceType: normalizeSourceType(list[0].sourceType),
      sourceId: trim(list[0].sourceId) || null,
      sourceSlug: trim(list[0].sourceSlug) || null,
      cardIds: list.map((c) => c.id),
      canonicalId: canonical?.id || null,
    })
  }
  return groups
}
