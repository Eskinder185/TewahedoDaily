/**
 * Public-safe enriched calendar content helpers.
 * Never exposes content_review_* fields to the public UI.
 */
export type CalendarLocaleMode = 'en' | 'am' | 'both'

export type EnrichedContentFields = {
  summary?: string | null
  summaryAmharic?: string | null
  whatIsIt?: string | null
  whatIsItAmharic?: string | null
  whyCelebrated?: string | null
  whyCelebratedAmharic?: string | null
  importantInformation?: string | null
  importantInformationAmharic?: string | null
  scriptureReferences?: string | null
  fastingNotes?: string | null
  fastingNotesAmharic?: string | null
  seasonNotes?: string | null
  seasonNotesAmharic?: string | null
  description?: string | null
  contentReviewStatus?: string | null
}

export type BilingualBlock = {
  english: string
  amharic: string
}

function clean(value?: string | null): string {
  return (value || '').trim()
}

/** Prefer enriched public text; fall back to description when review not approved or empty. */
export function publicText(
  preferred?: string | null,
  fallback?: string | null,
  reviewStatus?: string | null,
): string {
  const status = (reviewStatus || '').trim().toLowerCase()
  const preferredClean = clean(preferred)
  if (preferredClean && status !== 'rejected' && status !== 'blocked') return preferredClean
  return clean(fallback)
}

export function bilingualField(
  english?: string | null,
  amharic?: string | null,
  fallbackEnglish?: string | null,
  reviewStatus?: string | null,
): BilingualBlock {
  return {
    english: publicText(english, fallbackEnglish, reviewStatus),
    amharic: publicText(amharic, null, reviewStatus),
  }
}

export function pickByLocale(block: BilingualBlock, mode: CalendarLocaleMode): string {
  if (mode === 'am') return block.amharic || block.english
  if (mode === 'en') return block.english || block.amharic
  return block.amharic || block.english
}

export function enrichedSummary(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.summary,
    fields.summaryAmharic,
    fields.description,
    fields.contentReviewStatus,
  )
}

export function enrichedWhatIsIt(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(fields.whatIsIt, fields.whatIsItAmharic, null, fields.contentReviewStatus)
}

export function enrichedWhy(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.whyCelebrated,
    fields.whyCelebratedAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedImportant(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.importantInformation,
    fields.importantInformationAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedFasting(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.fastingNotes,
    fields.fastingNotesAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedSeason(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.seasonNotes,
    fields.seasonNotesAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedScripture(fields: EnrichedContentFields): string {
  return publicText(fields.scriptureReferences, null, fields.contentReviewStatus)
}

const FAST_TYPE_LABELS: Record<string, string> = {
  period_fast: 'Period Fast',
  fast_component: 'Fast Component',
  optional_complete_abstinence: 'Optional Fast',
  strict_fast: 'Strict Fast',
  fast_free: 'Fast-Free Period',
  fast_free_period: 'Fast-Free Period',
  weekly_fast: 'Weekly Fast',
  vigil_fast: 'Vigil Fast',
  optional_fast: 'Optional Fast',
}

export function humanFastTypeLabel(raw?: string | null): string {
  const key = (raw || '').trim().toLowerCase()
  if (!key) return 'Fast'
  return FAST_TYPE_LABELS[key] || raw!.replace(/_/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
}

export function isFastFreeType(raw?: string | null): boolean {
  const key = (raw || '').trim().toLowerCase()
  return key === 'fast_free' || key === 'fast_free_period' || key.includes('fast_free')
}

export function observanceKindLabel(observanceType?: string | null, isMajor?: boolean): string {
  const raw = (observanceType || '').trim().toLowerCase()
  if (raw.includes('eve') || raw.includes('vigil') || raw.includes('preparation') || raw.includes('gahad')) {
    if (raw.includes('eve')) return 'Eve'
    if (raw.includes('vigil')) return 'Vigil'
    if (raw.includes('preparation') || raw.includes('demera') || raw.includes('ketera')) return 'Preparation'
  }
  if (isMajor) return 'Great Feast'
  if (raw.includes('feast')) return 'Feast'
  if (raw.includes('commemoration')) return 'Commemoration'
  if (raw) return raw.replace(/_/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
  return 'Observance'
}

export function movableFriendlyLabel(isMovable?: boolean): string | null {
  if (!isMovable) return null
  return 'Movable feast · Calculated from Pascha'
}

export type DetailSection = {
  id: string
  title: string
  english: string
  amharic: string
}

export function buildDetailSections(fields: EnrichedContentFields): DetailSection[] {
  const sections: DetailSection[] = []
  const what = enrichedWhatIsIt(fields)
  if (what.english || what.amharic) {
    sections.push({ id: 'what', title: 'What is this?', english: what.english, amharic: what.amharic })
  }
  const why = enrichedWhy(fields)
  if (why.english || why.amharic) {
    sections.push({
      id: 'why',
      title: 'Why is it celebrated?',
      english: why.english,
      amharic: why.amharic,
    })
  }
  const important = enrichedImportant(fields)
  if (important.english || important.amharic) {
    sections.push({
      id: 'important',
      title: 'Important information',
      english: important.english,
      amharic: important.amharic,
    })
  }
  const scripture = enrichedScripture(fields)
  if (scripture) {
    sections.push({ id: 'scripture', title: 'Scripture', english: scripture, amharic: '' })
  }
  const fasting = enrichedFasting(fields)
  if (fasting.english || fasting.amharic) {
    sections.push({
      id: 'fasting',
      title: 'Fasting information',
      english: fasting.english,
      amharic: fasting.amharic,
    })
  }
  const season = enrichedSeason(fields)
  if (season.english || season.amharic) {
    sections.push({
      id: 'season',
      title: 'Season information',
      english: season.english,
      amharic: season.amharic,
    })
  }
  return sections
}

export const CALENDAR_DETAIL_LANG_KEY = 'td-calendar-detail-lang-v1'

export function loadCalendarDetailLang(): CalendarLocaleMode {
  if (typeof window === 'undefined') return 'en'
  try {
    const raw = window.localStorage.getItem(CALENDAR_DETAIL_LANG_KEY)
    if (raw === 'en' || raw === 'am' || raw === 'both') return raw
  } catch {
    /* ignore */
  }
  return 'en'
}

export function saveCalendarDetailLang(mode: CalendarLocaleMode) {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(CALENDAR_DETAIL_LANG_KEY, mode)
  } catch {
    /* ignore */
  }
}
