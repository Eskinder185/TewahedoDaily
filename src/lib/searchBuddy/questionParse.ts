/**
 * Deterministic Search Buddy question parsing.
 * No model. Original query is preserved for display.
 */
import {
  CALENDAR_ENTITIES,
  matchCalendarEntities,
  type CalendarEntity,
  type EntityMatch,
} from '../search/entityAliases.ts'
import { normalizeSearchText } from '../search/searchCore.ts'
import { containsEthiopic } from './amharicText.ts'
import { isExplanatoryTheologyQuery } from './calendarStructuredSearch.ts'

export type QuestionLanguage = 'en' | 'am'
export type QuestionDomain =
  | 'navigation'
  | 'hymn'
  | 'singer'
  | 'prayer'
  | 'bible'
  | 'teaching'
  | 'calendar'
  | 'website'

export type TemporalDirection = 'current' | 'next' | 'previous' | 'today' | 'tomorrow'
export type CalendarCategory =
  | 'fast'
  | 'annual_feast'
  | 'monthly_commemoration'
  | 'season'
  | 'weekly_fast'
  | 'ethiopian_date'
  | 'day_commemoration'

export type CalendarAction =
  | 'lookup'
  | 'is_observing'
  | 'start'
  | 'end'
  | 'days_until'
  | 'list_year'
  | 'list_month'
  | 'next_occurrence'

export type CalendarAmbiguity =
  | 'monthly_vs_annual'
  | 'weekly_vs_named_fast'
  | 'multiple_annual'
  | 'uncertain_entity'

export type PendingClarification = {
  originalQuery: string
  language: QuestionLanguage
  entityKey: string | null
  entityIds: string[]
  action: CalendarAction
  category: CalendarCategory | null
  temporal: TemporalDirection | null
  ambiguity: CalendarAmbiguity
  options: readonly string[]
}

export type ParsedCalendar = {
  action: CalendarAction
  category: CalendarCategory | null
  entity: CalendarEntity | null
  entityIds: string[]
  temporal: TemporalDirection | null
  startVsEnd: 'start' | 'end' | null
  ambiguity: CalendarAmbiguity | null
  suggestions: EntityMatch[]
}

export type ParsedQuestion = {
  originalQuery: string
  normalized: string
  language: QuestionLanguage
  domain: QuestionDomain
  isFollowUp: boolean
  calendar: ParsedCalendar | null
}

export type ParseQuestionOptions = {
  pending?: PendingClarification | null
}

const FOLLOW_UP_ANNUAL = /^(annual|yearly|ዓመታዊ|ዓመታዊው|annual feast)$/i
const FOLLOW_UP_MONTHLY = /^(monthly|monthly commemoration|ወርሃዊ|ወርሃዊው)$/i
const FOLLOW_UP_WEEKLY = /^(weekly|fasting day|next fasting day|የሳምንት|ሳምንታዊ)$/i
const FOLLOW_UP_NAMED_FAST = /^(named|period|fasting period|named fasting period|ጾም ወቅት|የጾም ወቅት)$/i

function hasEthiopic(text: string): boolean {
  return containsEthiopic(text)
}

function detectLanguage(text: string): QuestionLanguage {
  return hasEthiopic(text) ? 'am' : 'en'
}

function englishWord(hay: string, word: string): boolean {
  return new RegExp(`\\b${word}\\b`, 'i').test(hay)
}

function isNavigationQuery(n: string, raw: string): boolean {
  if (/^(go to|open|take me to|navigate to)\b/.test(n)) return true
  if (/^(ክፈት|ውሰደኝ)\b/.test(raw.trim())) return true
  if (/^(open calendar|go to calendar|take me to (the )?calendar)$/.test(n)) return true
  return false
}

function isHymnQuery(n: string, raw: string): boolean {
  if (englishWord(n, 'hymn') || englishWord(n, 'hymns') || englishWord(n, 'mezmur') || englishWord(n, 'mezmurs')) {
    return true
  }
  return raw.includes('መዝሙር')
}

function isSingerQuery(n: string, raw: string): boolean {
  return englishWord(n, 'singer') || englishWord(n, 'singers') || englishWord(n, 'zemari') || raw.includes('ዘማሪ')
}

function isPrayerQuery(n: string, raw: string): boolean {
  if (englishWord(n, 'prayer') || englishWord(n, 'prayers')) return true
  return raw.includes('ጸሎት')
}

function isBibleQuery(n: string, raw: string): boolean {
  if (/\b(genesis|exodus|leviticus|numbers|deuteronomy|matthew|mark|luke|john|psalm|psalms|romans|acts)\s+\d+/i.test(n)) {
    return true
  }
  if (/\b(jn|mt|mk|lk)\s*\d+\s*:\s*\d+/i.test(n)) return true
  if (/(ዮሐንስ|ማቴዎስ|ማርቆስ|ሉቃስ)/.test(raw) && /\d/.test(raw)) return true
  return false
}

function isWhoQuery(n: string, raw: string): boolean {
  if (/^who\s+(is|are)\b/.test(n) || /\bwho is\b/.test(n)) return true
  return raw.includes('ማን ነው') && !raw.includes('መታሰቢያ')
}

function hasWhen(n: string, raw: string): boolean {
  return englishWord(n, 'when') || n.includes('how long until') || raw.includes('መቼ')
}

function hasNext(n: string, raw: string): boolean {
  return (
    englishWord(n, 'next') ||
    englishWord(n, 'upcoming') ||
    englishWord(n, 'coming') ||
    raw.includes('ቀጣይ') ||
    raw.includes('ቀጣዩ') ||
    raw.includes('የሚመጣው') ||
    raw.includes('መጪው')
  )
}

function hasToday(n: string, raw: string): boolean {
  return englishWord(n, 'today') || raw.includes('ዛሬ') || raw.includes('የዛሬ')
}

function hasTomorrow(n: string, raw: string): boolean {
  return englishWord(n, 'tomorrow') || raw.includes('ነገ')
}

function hasMonthly(n: string, raw: string): boolean {
  return englishWord(n, 'monthly') || raw.includes('ወርሃዊ')
}

function hasAnnual(n: string, raw: string): boolean {
  return englishWord(n, 'annual') || englishWord(n, 'yearly') || raw.includes('ዓመታዊ')
}

function hasFast(n: string, raw: string): boolean {
  return /\bfast(?:ing|s)?\b/i.test(n) || raw.includes('ጾም') || raw.includes('ፆም')
}

function hasFeast(n: string, raw: string): boolean {
  return (
    englishWord(n, 'feast') ||
    englishWord(n, 'commemoration') ||
    englishWord(n, 'memorial') ||
    englishWord(n, 'observance') ||
    raw.includes('በዓል') ||
    raw.includes('መታሰቢያ')
  )
}

function hasSeason(n: string, raw: string): boolean {
  return englishWord(n, 'season') || n.includes('liturgical') || raw.includes('ዘመን')
}

function hasEthiopianCalendar(n: string, raw: string): boolean {
  return (
    n.includes('ethiopian calendar') ||
    n.includes('ethiopian date') ||
    raw.includes('ኢትዮጵያ አቆጣጠር') ||
    raw.includes('በኢትዮጵያ አቆጣጠር')
  )
}

function hasEnd(n: string, raw: string): boolean {
  return englishWord(n, 'end') || n.includes('over') || raw.includes('ያበቃል') || raw.includes('መጨረሻ')
}

function hasStart(n: string, raw: string): boolean {
  return englishWord(n, 'start') || englishWord(n, 'begin') || englishWord(n, 'begins') || raw.includes('ይጀምራል')
}

function hasCurrent(n: string, raw: string): boolean {
  return englishWord(n, 'current') || n.includes('this one') || raw.includes('የአሁኑ') || raw.includes('አሁን')
}

function hasListYear(n: string): boolean {
  return n.includes('this year') || n.includes('fasting periods')
}

function hasThisMonth(n: string, raw: string): boolean {
  return n.includes('this month') || raw.includes('በዚህ ወር')
}

function temporalFrom(n: string, raw: string): TemporalDirection | null {
  if (hasToday(n, raw)) return 'today'
  if (hasTomorrow(n, raw)) return 'tomorrow'
  if (hasCurrent(n, raw)) return 'current'
  if (hasNext(n, raw)) return 'next'
  if (englishWord(n, 'previous') || n.includes('last ')) return 'previous'
  return null
}

function entityByKey(key: string | null): CalendarEntity | null {
  if (!key) return null
  return CALENDAR_ENTITIES.find((row) => row.key === key) ?? null
}

function idsForFollowUp(
  entity: CalendarEntity | null,
  category: CalendarCategory | null,
  fallback: string[],
): string[] {
  if (!entity) return fallback
  if (category === 'monthly_commemoration') return [...entity.monthlyIds]
  if (category === 'annual_feast') return [...entity.annualIds, ...entity.feastIds]
  if (category === 'fast') return [...entity.fastIds]
  if (category === 'weekly_fast') return []
  if (category === 'season') return [...entity.seasonIds]
  return fallback
}

function applyFollowUp(pending: PendingClarification, raw: string): ParsedQuestion | null {
  const n = normalizeSearchText(raw)
  const compact = n.replace(/\s+/g, ' ').trim()
  let category = pending.category
  let ambiguity: CalendarAmbiguity | null = null
  if (FOLLOW_UP_ANNUAL.test(compact)) {
    if (pending.ambiguity !== 'monthly_vs_annual' && pending.ambiguity !== 'multiple_annual') return null
    category = 'annual_feast'
  } else if (FOLLOW_UP_MONTHLY.test(compact)) {
    if (pending.ambiguity !== 'monthly_vs_annual') return null
    category = 'monthly_commemoration'
  } else if (FOLLOW_UP_WEEKLY.test(compact)) {
    if (pending.ambiguity !== 'weekly_vs_named_fast') return null
    category = 'weekly_fast'
  } else if (FOLLOW_UP_NAMED_FAST.test(compact)) {
    if (pending.ambiguity !== 'weekly_vs_named_fast') return null
    category = 'fast'
  } else {
    return null
  }
  const entity = entityByKey(pending.entityKey)
  return {
    originalQuery: pending.originalQuery,
    normalized: normalizeSearchText(pending.originalQuery),
    language: pending.language,
    domain: 'calendar',
    isFollowUp: true,
    calendar: {
      action: pending.action,
      category,
      entity,
      entityIds: idsForFollowUp(entity, category, pending.entityIds),
      temporal: pending.temporal,
      startVsEnd: category === 'fast' && pending.action === 'end' ? 'end' : null,
      ambiguity,
      suggestions: [],
    },
  }
}

function calendarFromSignals(
  originalQuery: string,
  n: string,
  matches: EntityMatch[],
): ParsedCalendar {
  const exactOrAlias = matches.filter((m) => m.kind === 'exact' || m.kind === 'alias')
  const fuzzy = matches.filter((m) => m.kind === 'fuzzy')
  const primary = exactOrAlias[0]?.entity ?? null
  const suggestions = exactOrAlias.length ? exactOrAlias : fuzzy

  if (!primary && fuzzy.length > 1) {
    return {
      action: 'lookup',
      category: null,
      entity: null,
      entityIds: [],
      temporal: temporalFrom(n, originalQuery),
      startVsEnd: null,
      ambiguity: 'uncertain_entity',
      suggestions: fuzzy,
    }
  }

  const entity = primary ?? fuzzy[0]?.entity ?? null
  const entityIds = entity
    ? [...new Set([...entity.monthlyIds, ...entity.annualIds, ...entity.feastIds, ...entity.fastIds, ...entity.seasonIds])]
    : []

  const monthly = hasMonthly(n, originalQuery)
  const annual = hasAnnual(n, originalQuery)
  const today = hasToday(n, originalQuery)
  const tomorrow = hasTomorrow(n, originalQuery)
  const next = hasNext(n, originalQuery)
  const fast = hasFast(n, originalQuery)
  const feast = hasFeast(n, originalQuery)
  const season = hasSeason(n, originalQuery)
  const ethDate = hasEthiopianCalendar(n, originalQuery)
  const end = hasEnd(n, originalQuery)
  const start = hasStart(n, originalQuery)
  const current = hasCurrent(n, originalQuery)
  const daysUntil = n.includes('how many days') || n.includes('how long until') || n.includes('days until')
  const afterThis = n.includes('after this') || n.includes('comes after')

  if (ethDate && (today || (!feast && !fast && !entity))) {
    return {
      action: 'lookup',
      category: 'ethiopian_date',
      entity,
      entityIds,
      temporal: today ? 'today' : temporalFrom(n, originalQuery) ?? 'today',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  if (hasThisMonth(n, originalQuery) && (feast || originalQuery.includes('መታሰቢያ') || n.includes('commemorat'))) {
    return {
      action: 'list_month',
      category: 'day_commemoration',
      entity,
      entityIds,
      temporal: 'current',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  if (fast && hasListYear(n)) {
    return {
      action: 'list_year',
      category: 'fast',
      entity,
      entityIds,
      temporal: 'current',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  if (fast || entity?.kind === 'fast') {
    const observing = (today || tomorrow) && !next && !end && !start && !daysUntil
    if (observing) {
      return {
        action: 'is_observing',
        category: null,
        entity,
        entityIds,
        temporal: tomorrow ? 'tomorrow' : 'today',
        startVsEnd: null,
        ambiguity: 'weekly_vs_named_fast',
        suggestions,
      }
    }
    if (end || (current && end) || originalQuery.includes('ያበቃል')) {
      return {
        action: 'end',
        category: 'fast',
        entity,
        entityIds,
        temporal: 'current',
        startVsEnd: 'end',
        ambiguity: entity ? null : 'weekly_vs_named_fast',
        suggestions,
      }
    }
    if (daysUntil || afterThis || next || start || hasWhen(n, originalQuery)) {
      const named = Boolean(entity?.fastIds.length)
      return {
        action: daysUntil ? 'days_until' : start ? 'start' : 'next_occurrence',
        category: named ? 'fast' : null,
        entity,
        entityIds,
        temporal: 'next',
        startVsEnd: start ? 'start' : null,
        ambiguity: named ? null : 'weekly_vs_named_fast',
        suggestions,
      }
    }
  }

  if (season && !feast && !fast && !entity) {
    return {
      action: 'lookup',
      category: 'season',
      entity,
      entityIds,
      temporal: temporalFrom(n, originalQuery) ?? 'current',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  if (entity?.kind === 'season') {
    return {
      action: 'lookup',
      category: 'season',
      entity,
      entityIds,
      temporal: temporalFrom(n, originalQuery) ?? 'next',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  if (entity?.kind === 'feast' || (entity && !fast && (feast || hasWhen(n, originalQuery) || next))) {
    if (monthly && !annual) {
      return {
        action: today || tomorrow ? 'is_observing' : 'next_occurrence',
        category: 'monthly_commemoration',
        entity,
        entityIds,
        temporal: tomorrow ? 'tomorrow' : today ? 'today' : 'next',
        startVsEnd: null,
        ambiguity: null,
        suggestions,
      }
    }
    if (annual && !monthly) {
      const manyAnnual = (entity.annualIds?.length ?? 0) > 1
      return {
        action: 'next_occurrence',
        category: 'annual_feast',
        entity,
        entityIds,
        temporal: 'next',
        startVsEnd: null,
        ambiguity: manyAnnual ? 'multiple_annual' : null,
        suggestions,
      }
    }
    if (today || tomorrow) {
      return {
        action: 'is_observing',
        category: feast ? 'day_commemoration' : null,
        entity,
        entityIds,
        temporal: tomorrow ? 'tomorrow' : 'today',
        startVsEnd: null,
        ambiguity: null,
        suggestions,
      }
    }
    if (entity.kind === 'feast') {
      return {
        action: 'next_occurrence',
        category: 'annual_feast',
        entity,
        entityIds,
        temporal: 'next',
        startVsEnd: null,
        ambiguity: (entity.annualIds.length || entity.feastIds.length) > 1 ? 'multiple_annual' : null,
        suggestions,
      }
    }
    if (entity.monthlyIds.length && entity.annualIds.length) {
      return {
        action: 'next_occurrence',
        category: null,
        entity,
        entityIds,
        temporal: 'next',
        startVsEnd: null,
        ambiguity: 'monthly_vs_annual',
        suggestions,
      }
    }
    if (entity.annualIds.length) {
      return {
        action: 'next_occurrence',
        category: 'annual_feast',
        entity,
        entityIds,
        temporal: 'next',
        startVsEnd: null,
        ambiguity: entity.annualIds.length > 1 ? 'multiple_annual' : null,
        suggestions,
      }
    }
    if (entity.monthlyIds.length) {
      return {
        action: 'next_occurrence',
        category: 'monthly_commemoration',
        entity,
        entityIds,
        temporal: 'next',
        startVsEnd: null,
        ambiguity: null,
        suggestions,
      }
    }
  }

  if ((today || tomorrow) && (feast || n.includes('commemorat') || originalQuery.includes('መታሰቢያ'))) {
    return {
      action: 'lookup',
      category: 'day_commemoration',
      entity,
      entityIds,
      temporal: tomorrow ? 'tomorrow' : 'today',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  const namedUnknown =
    !entity &&
    feast &&
    (/\bsaint\b|\bst\b/.test(n) || originalQuery.includes('ቅዱስ') || originalQuery.includes('ቅድስት'))
  if (namedUnknown && !today && !tomorrow) {
    return {
      action: 'lookup',
      category: null,
      entity: null,
      entityIds: [],
      temporal: temporalFrom(n, originalQuery) ?? 'next',
      startVsEnd: null,
      ambiguity: 'uncertain_entity',
      suggestions,
    }
  }

  if (next && feast && !entity) {
    return {
      action: 'next_occurrence',
      category: 'annual_feast',
      entity: null,
      entityIds: [],
      temporal: 'next',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  if (today && !fast) {
    return {
      action: 'lookup',
      category: ethDate ? 'ethiopian_date' : 'day_commemoration',
      entity,
      entityIds,
      temporal: 'today',
      startVsEnd: null,
      ambiguity: null,
      suggestions,
    }
  }

  return {
    action: 'lookup',
    category: feast ? 'day_commemoration' : fast ? 'fast' : null,
    entity,
    entityIds,
    temporal: temporalFrom(n, originalQuery),
    startVsEnd: end ? 'end' : start ? 'start' : null,
    ambiguity: null,
    suggestions,
  }
}

function looksLikeCalendarQuestion(n: string, raw: string, matches: EntityMatch[]): boolean {
  if (hasEthiopianCalendar(n, raw)) return true
  if (hasFast(n, raw) && (hasWhen(n, raw) || hasNext(n, raw) || hasToday(n, raw) || hasTomorrow(n, raw) || hasCurrent(n, raw) || hasEnd(n, raw) || hasListYear(n))) {
    return true
  }
  if (hasSeason(n, raw) && (hasToday(n, raw) || n.includes('are we in') || raw.includes('ምን ዘመን'))) return true
  if (hasThisMonth(n, raw) && (hasFeast(n, raw) || n.includes('commemorat'))) return true
  if (
    matches.some((m) => m.kind !== 'fuzzy' || matches.length === 1) &&
    (hasWhen(n, raw) || hasNext(n, raw) || hasMonthly(n, raw) || hasAnnual(n, raw) || hasFeast(n, raw) || hasToday(n, raw) || hasTomorrow(n, raw))
  ) {
    return true
  }
  if ((hasToday(n, raw) || hasTomorrow(n, raw)) && (hasFeast(n, raw) || n.includes('calendar') || raw.includes('ቀን መቁጠሪያ'))) {
    return true
  }
  if (n.includes('church calendar') || raw.includes('ቀን መቁጠሪያ')) return true
  if ((hasWhen(n, raw) || hasNext(n, raw)) && hasFeast(n, raw)) return true
  return false
}

/**
 * Parse a user question into a typed intent.
 * Calendar lookups require a date/when/next/today signal — a saint name alone is not enough.
 */
export function parseQuestion(rawQuery: string, options: ParseQuestionOptions = {}): ParsedQuestion {
  const originalQuery = (rawQuery || '').replace(/\s+/g, ' ').trim()
  const normalized = normalizeSearchText(originalQuery)
  const language = detectLanguage(originalQuery)

  if (options.pending) {
    const follow = applyFollowUp(options.pending, originalQuery)
    if (follow) return follow
  }

  if (!originalQuery) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'website',
      isFollowUp: false,
      calendar: null,
    }
  }

  if (isNavigationQuery(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'navigation',
      isFollowUp: false,
      calendar: null,
    }
  }

  if (isHymnQuery(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'hymn',
      isFollowUp: false,
      calendar: null,
    }
  }

  if (isSingerQuery(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'singer',
      isFollowUp: false,
      calendar: null,
    }
  }

  if (isBibleQuery(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'bible',
      isFollowUp: false,
      calendar: null,
    }
  }

  const teaching = isExplanatoryTheologyQuery(originalQuery)
  if (teaching && !hasWhen(normalized, originalQuery) && !hasNext(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'teaching',
      isFollowUp: false,
      calendar: null,
    }
  }

  if (isWhoQuery(normalized, originalQuery) && !hasWhen(normalized, originalQuery) && !hasFeast(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'website',
      isFollowUp: false,
      calendar: null,
    }
  }

  if (isPrayerQuery(normalized, originalQuery) && !hasWhen(normalized, originalQuery) && !hasFast(normalized, originalQuery)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'prayer',
      isFollowUp: false,
      calendar: null,
    }
  }

  const matches = matchCalendarEntities(normalized)
  if (looksLikeCalendarQuestion(normalized, originalQuery, matches)) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'calendar',
      isFollowUp: false,
      calendar: calendarFromSignals(originalQuery, normalized, matches),
    }
  }

  if (teaching) {
    return {
      originalQuery,
      normalized,
      language,
      domain: 'teaching',
      isFollowUp: false,
      calendar: null,
    }
  }

  return {
    originalQuery,
    normalized,
    language,
    domain: 'website',
    isFollowUp: false,
    calendar: null,
  }
}

export function isUnrelatedToPending(query: string, pending: PendingClarification | null | undefined): boolean {
  if (!pending) return false
  if (applyFollowUp(pending, query)) return false
  const parsed = parseQuestion(query)
  if (parsed.domain === 'calendar' && parsed.calendar?.entity?.key && parsed.calendar.entity.key === pending.entityKey) {
    return false
  }
  return parsed.domain !== 'website' || query.trim().split(/\s+/).length > 2
}
