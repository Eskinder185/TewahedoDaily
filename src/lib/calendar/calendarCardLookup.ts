/**
 * Canonical calendar_cards lookup by structured source identity.
 * Shared by Calendar, Homepage, Admin preview, and Sync — never resolve by title/date/index.
 */
import { normalizeSourceType } from './resolveCalendarCard'

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

function trim(value?: string | null): string {
  return (value || '').trim()
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
 * Prefer: source_id link → image → presentation settings → sort → newest → id.
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
 * Resolve the Calendar Card for a structured source.
 * 1. source_type + source_id
 * 2. source_type + source_slug
 * Never: title, date, category, array index, first-of-type.
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
