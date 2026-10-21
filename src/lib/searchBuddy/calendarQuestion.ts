/**
 * Resolve calendar questions from the bundled EOTC dataset and existing recurrence matchers.
 * Dates are never invented. Missing rules become an explicit limitation.
 */
import { addDays, toIsoLocalDate } from '../churchCalendar/pascha.ts'
import { formatGregorianLong, formatWeekdayLong } from '../churchCalendar/formatters.ts'
import {
  getAllCalendarEntries,
  getEntryById,
} from '../eotcCalendar/eotcCalendarDataset.ts'
import {
  getEntriesForDate,
  getSeasonEntriesForDate,
  getWeeklyRecurringEntriesForDate,
} from '../eotcCalendar/eotcDateResolution.ts'
import { findNextCivilDayForEntry } from '../eotcCalendar/eotcFindEntryOccurrence.ts'
import {
  nextFixedEthDateOnOrAfter,
  nextMonthlyDayOnOrAfter,
} from '../eotcCalendar/nextCommemoration.ts'
import { stripLocalCalendarDate } from '../eotcCalendar/liturgicalCalendarContext.ts'
import { ethMonthFromEnglishName } from '../eotcCalendar/eotcEthiopianMonthNames.ts'
import type { EotcCalendarDatasetRow, EotcCalendarEntry } from '../eotcCalendar/eotcTypes.ts'
import { gregorianToEthiopian } from '../ethiopianDate.ts'
import { entityCatalogIds, type CalendarEntity } from '../search/entityAliases.ts'
import {
  gregorianYmdInTimezone,
  userTimezone,
} from './calendarStructuredSearch.ts'
import type {
  CalendarAmbiguity,
  CalendarCategory,
  ParsedQuestion,
  PendingClarification,
  QuestionLanguage,
} from './questionParse.ts'

export type CalendarQuestionOptions = {
  now?: Date
  timeZone?: string
}

export type RelativeDay = 'today' | 'tomorrow' | 'in_days'

export type CalendarOccurrenceView = {
  name: string
  nameAmharic: string
  category: CalendarCategory
  ethiopianLabel: string
  gregorianIso: string
  gregorianLabel: string
  weekday: string
  relative: RelativeDay | null
  daysRemaining: number
  href: string
  entryId: string
  endGregorianIso?: string
  endEthiopianLabel?: string
  endUnsupported?: boolean
}

export type ClarifyOption = {
  id: string
  labelEn: string
  labelAm: string
}

export type CalendarQuestionResult =
  | {
      kind: 'answer'
      query: string
      language: QuestionLanguage
      headlineEn: string
      headlineAm: string
      occurrences: CalendarOccurrenceView[]
      notesEn: string[]
      notesAm: string[]
    }
  | {
      kind: 'clarify'
      query: string
      language: QuestionLanguage
      promptEn: string
      promptAm: string
      options: ClarifyOption[]
      pending: PendingClarification
    }
  | {
      kind: 'suggest'
      query: string
      language: QuestionLanguage
      promptEn: string
      promptAm: string
      options: ClarifyOption[]
    }
  | {
      kind: 'unsupported'
      query: string
      language: QuestionLanguage
      noticeEn: string
      noticeAm: string
    }

function referenceDate(options: CalendarQuestionOptions): Date {
  if (options.now) return stripLocalCalendarDate(options.now)
  const tz = options.timeZone || userTimezone()
  const ymd = gregorianYmdInTimezone(tz, 0)
  const [y, m, d] = ymd.split('-').map(Number)
  return new Date(y, m - 1, d)
}

function offsetDate(ref: Date, days: number): Date {
  return addDays(ref, days)
}

function ethLabel(date: Date): string {
  const eth = gregorianToEthiopian(date)
  const months = ['Meskerem', 'Tikimt', 'Hidar', 'Tahsas', 'Tir', 'Yekatit', 'Megabit', 'Miyazia', 'Ginbot', 'Sene', 'Hamle', 'Nehase', 'Pagumen']
  const name = months[eth.month - 1] ?? '—'
  return `${name} ${eth.day}, ${eth.year} E.C.`
}

function daysBetween(from: Date, to: Date): number {
  const a = stripLocalCalendarDate(from).getTime()
  const b = stripLocalCalendarDate(to).getTime()
  return Math.round((b - a) / 86400000)
}

function relativeFor(days: number): RelativeDay | null {
  if (days === 0) return 'today'
  if (days === 1) return 'tomorrow'
  if (days > 1) return 'in_days'
  return null
}

function viewFromDate(
  entry: EotcCalendarEntry,
  date: Date,
  ref: Date,
  category: CalendarCategory,
): CalendarOccurrenceView {
  const days = daysBetween(ref, date)
  return {
    name: entry.englishTitle?.trim() || entry.transliterationTitle?.trim() || entry.title,
    nameAmharic: entry.title,
    category,
    ethiopianLabel: ethLabel(date),
    gregorianIso: toIsoLocalDate(date),
    gregorianLabel: formatGregorianLong(date),
    weekday: formatWeekdayLong(date),
    relative: relativeFor(days),
    daysRemaining: days,
    href: `/calendar?date=${toIsoLocalDate(date)}`,
    entryId: entry.id,
  }
}

function categoryForEntry(entry: EotcCalendarEntry, fallback: CalendarCategory | null): CalendarCategory {
  if (entry.date.kind === 'monthly-recurring') return 'monthly_commemoration'
  if (entry.date.kind === 'weekly-recurring') return 'weekly_fast'
  if (entry.category.primary === 'fast' || entry.date.kind === 'season' && entry.observance.fastStatus === 'fast') {
    return 'fast'
  }
  if (entry.category.primary === 'season' || entry.date.kind === 'season') return 'season'
  if (entry.date.kind === 'fixed' || entry.date.kind === 'movable') return 'annual_feast'
  return fallback ?? 'day_commemoration'
}

function nextOccurrenceForEntry(entry: EotcCalendarEntry, from: Date): Date | null {
  const d = entry.date
  if (d.kind === 'monthly-recurring' && typeof d.monthlyRecurringDay === 'number') {
    const next = nextMonthlyDayOnOrAfter(from, d.monthlyRecurringDay)
    return next?.gregorian ?? null
  }
  if (d.kind === 'fixed') {
    const month =
      typeof d.ethiopianMonth === 'number'
        ? d.ethiopianMonth
        : ethMonthFromEnglishName(String(d.ethiopianMonth || ''))
    const day = typeof d.ethiopianDay === 'number' ? d.ethiopianDay : null
    if (!month || !day) return null
    return nextFixedEthDateOnOrAfter(from, month, day)?.gregorian ?? null
  }
  if (d.kind === 'season' && d.seasonRange?.startFixed) {
    const sf = d.seasonRange.startFixed
    const month = ethMonthFromEnglishName(sf.ethiopianMonth)
    if (!month) return null
    return nextFixedEthDateOnOrAfter(from, month, sf.ethiopianDay)?.gregorian ?? null
  }
  if (d.kind === 'season' || d.kind === 'movable' || d.kind === 'weekly-recurring') {
    return findNextCivilDayForEntry(entry.id, from, { maxDays: 420 })
  }
  return null
}

function seasonEndDate(entry: EotcCalendarEntry, from: Date): Date | null {
  const sr = entry.date.seasonRange
  if (!sr) return null
  if (sr.endFixed && !sr.endAnchor) {
    const month = ethMonthFromEnglishName(sr.endFixed.ethiopianMonth)
    if (!month) return null
    return nextFixedEthDateOnOrAfter(from, month, sr.endFixed.ethiopianDay)?.gregorian ?? null
  }
  if (sr.endAnchor) {
    const hits = findNextCivilDayForEntry(entry.id, from, { maxDays: 420 })
    if (!hits) return null
    for (let i = 0; i < 200; i += 1) {
      const d = addDays(hits, i)
      const still = getSeasonEntriesForDate(d).some((row) => row.entry.id === entry.id)
      if (!still) return i === 0 ? hits : addDays(hits, i - 1)
    }
  }
  return null
}

function attachSeasonEnd(view: CalendarOccurrenceView, entry: EotcCalendarEntry, from: Date): CalendarOccurrenceView {
  const end = seasonEndDate(entry, from)
  if (end) {
    return {
      ...view,
      endGregorianIso: toIsoLocalDate(end),
      endEthiopianLabel: ethLabel(end),
    }
  }
  if (entry.date.kind === 'season' || entry.category.primary === 'fast') {
    return { ...view, endUnsupported: true }
  }
  return view
}

function namedFastRows(): EotcCalendarDatasetRow[] {
  return getAllCalendarEntries().filter(
    (row) =>
      row.entry.category.primary === 'fast' &&
      row.entry.date.kind !== 'weekly-recurring' &&
      row.entry.id !== 'tsome-gehad',
  )
}

function weeklyFastOn(date: Date): EotcCalendarDatasetRow[] {
  return getWeeklyRecurringEntriesForDate(date).filter((row) =>
    /fast/i.test(row.entry.id) || row.entry.observance.fastStatus === 'fast',
  )
}

function namedFastOn(date: Date): EotcCalendarDatasetRow[] {
  return getEntriesForDate(date).filter(
    (row) =>
      row.entry.category.primary === 'fast' &&
      row.entry.date.kind !== 'weekly-recurring',
  )
}

function nextWeeklyFast(from: Date): { row: EotcCalendarDatasetRow; date: Date } | null {
  for (let i = 0; i < 14; i += 1) {
    const d = offsetDate(from, i)
    const rows = weeklyFastOn(d)
    if (rows.length) return { row: rows[0], date: d }
  }
  return null
}

function nextNamedFast(from: Date, ids?: readonly string[]): { row: EotcCalendarDatasetRow; date: Date } | null {
  const rows = ids?.length
    ? ids.map((id) => getEntryById(id)).filter((row): row is EotcCalendarDatasetRow => Boolean(row))
    : namedFastRows()
  let best: { row: EotcCalendarDatasetRow; date: Date } | null = null
  for (const row of rows) {
    const date = nextOccurrenceForEntry(row.entry, from)
    if (!date) continue
    if (!best || date.getTime() < best.date.getTime()) best = { row, date }
  }
  return best
}

function occurrenceViewsForIds(
  ids: string[],
  from: Date,
  category: CalendarCategory | null,
): CalendarOccurrenceView[] {
  const views: CalendarOccurrenceView[] = []
  for (const id of ids) {
    const row = getEntryById(id)
    if (!row) continue
    const date = nextOccurrenceForEntry(row.entry, from)
    if (!date) continue
    const cat = categoryForEntry(row.entry, category)
    views.push(attachSeasonEnd(viewFromDate(row.entry, date, from, cat), row.entry, from))
  }
  views.sort((a, b) => a.gregorianIso.localeCompare(b.gregorianIso))
  return views
}

function dayCommemorations(date: Date, ref: Date): CalendarOccurrenceView[] {
  return getEntriesForDate(date)
    .filter((row) => row.entry.date.kind !== 'weekly-recurring')
    .map((row) => viewFromDate(row.entry, date, ref, categoryForEntry(row.entry, 'day_commemoration')))
}

function unsupported(query: string, language: QuestionLanguage, en: string, am: string): CalendarQuestionResult {
  return { kind: 'unsupported', query, language, noticeEn: en, noticeAm: am }
}

function answer(
  query: string,
  language: QuestionLanguage,
  headlineEn: string,
  headlineAm: string,
  occurrences: CalendarOccurrenceView[],
  notesEn: string[] = [],
  notesAm: string[] = [],
): CalendarQuestionResult {
  return { kind: 'answer', query, language, headlineEn, headlineAm, occurrences, notesEn, notesAm }
}

function clarify(
  parsed: ParsedQuestion,
  ambiguity: CalendarAmbiguity,
  promptEn: string,
  promptAm: string,
  options: ClarifyOption[],
  entityIds: string[],
): CalendarQuestionResult {
  const cal = parsed.calendar
  return {
    kind: 'clarify',
    query: parsed.originalQuery,
    language: parsed.language,
    promptEn,
    promptAm,
    options,
    pending: {
      originalQuery: parsed.originalQuery,
      language: parsed.language,
      entityKey: cal?.entity?.key ?? null,
      entityIds,
      action: cal?.action ?? 'next_occurrence',
      category: cal?.category ?? null,
      temporal: cal?.temporal ?? 'next',
      ambiguity,
      options: options.map((o) => o.id),
    },
  }
}

function idsForCategory(entity: CalendarEntity | null, category: CalendarCategory | null, fallback: string[]): string[] {
  if (!entity) return fallback
  if (category === 'monthly_commemoration') return [...entity.monthlyIds]
  if (category === 'annual_feast') return [...entity.annualIds, ...entity.feastIds]
  if (category === 'fast') return [...entity.fastIds]
  if (category === 'season') return [...entity.seasonIds]
  return entityCatalogIds(entity)
}

function resolveEntityQuestion(parsed: ParsedQuestion, ref: Date): CalendarQuestionResult {
  const cal = parsed.calendar
  if (!cal) {
    return unsupported(
      parsed.originalQuery,
      parsed.language,
      'That calendar question could not be parsed.',
      'ያንን የቀን መቁጠሪያ ጥያቄ መተንተን አልተቻለም።',
    )
  }

  if (cal.ambiguity === 'uncertain_entity') {
    if (!cal.suggestions.length) {
      return unsupported(
        parsed.originalQuery,
        parsed.language,
        'That name is not in the church calendar dataset, so no date is shown.',
        'ያ ስም በቤተ ክርስቲያን የቀን መቁጠሪያ መረጃ ውስጥ የለም።',
      )
    }
    return {
      kind: 'suggest',
      query: parsed.originalQuery,
      language: parsed.language,
      promptEn: 'Which of these did you mean?',
      promptAm: 'ከእነዚህ ውስጥ የትኛውን ነው የጠየቁት?',
      options: cal.suggestions.map((s) => ({
        id: s.entity.key,
        labelEn: s.entity.aliases[0],
        labelAm: s.entity.aliases.find((a) => /[\u1200-\u137F]/.test(a)) || s.entity.aliases[0],
      })),
    }
  }

  if (cal.ambiguity === 'monthly_vs_annual' && cal.entity) {
    return clarify(
      parsed,
      'monthly_vs_annual',
      `Did you mean the monthly commemoration or the annual feast of ${cal.entity.aliases[0]}?`,
      'ወርሃዊ መታሰቢያ ይፈልጋሉ ወይስ ዓመታዊ በዓል?',
      [
        { id: 'monthly', labelEn: 'Monthly commemoration', labelAm: 'ወርሃዊ መታሰቢያ' },
        { id: 'annual', labelEn: 'Annual feast', labelAm: 'ዓመታዊ በዓል' },
      ],
      entityCatalogIds(cal.entity),
    )
  }

  const ids = idsForCategory(cal.entity, cal.category, cal.entityIds)
  const target = cal.temporal === 'tomorrow' ? offsetDate(ref, 1) : ref

  if (cal.action === 'is_observing' && cal.entity) {
    const hits = getEntriesForDate(target).filter((row) => ids.includes(row.entry.id))
    if (!hits.length) {
      const next = occurrenceViewsForIds(ids, target, cal.category)
      const when = cal.temporal === 'tomorrow' ? 'Tomorrow is not' : 'Today is not'
      const whenAm = cal.temporal === 'tomorrow' ? 'ነገ' : 'ዛሬ'
      return answer(
        parsed.originalQuery,
        parsed.language,
        next.length
          ? `${when} that commemoration. Next: ${next[0].name} on ${next[0].ethiopianLabel} / ${next[0].gregorianLabel}.`
          : `${when} that commemoration, and the calendar dataset has no later occurrence.`,
        next.length
          ? `${whenAm} ያ መታሰቢያ አይደለም። ቀጣዩ፦ ${next[0].nameAmharic} ${next[0].ethiopianLabel} / ${next[0].gregorianLabel}።`
          : `${whenAm} ያ መታሰቢያ አይደለም።`,
        next.slice(0, 3),
      )
    }
    const views = hits.map((row) => viewFromDate(row.entry, target, ref, categoryForEntry(row.entry, cal.category)))
    const label = cal.temporal === 'tomorrow' ? 'Tomorrow' : 'Today'
    const labelAm = cal.temporal === 'tomorrow' ? 'ነገ' : 'ዛሬ'
    return answer(
      parsed.originalQuery,
      parsed.language,
      `${label}: ${views.map((v) => v.name).join('; ')}.`,
      `${labelAm}፦ ${views.map((v) => v.nameAmharic).join('፤ ')}።`,
      views,
    )
  }

  const views = occurrenceViewsForIds(ids, cal.temporal === 'tomorrow' ? offsetDate(ref, 1) : ref, cal.category)
  if (!views.length) {
    return unsupported(
      parsed.originalQuery,
      parsed.language,
      'The church calendar dataset does not have a verified date for that observance, so no date is shown.',
      'በቤተ ክርስቲያን የቀን መቁጠሪያ መረጃ ውስጥ ለዚህ በዓል የተረጋገጠ ቀን የለም።',
    )
  }

  if (cal.ambiguity === 'multiple_annual' && views.length > 1 && !parsed.isFollowUp) {
    return answer(
      parsed.originalQuery,
      parsed.language,
      'Several annual observances are recorded. Nearest first:',
      'በርካታ ዓመታዊ በዓላት ተመዝግበዋል። የቀረበው መጀመሪያ፦',
      views,
    )
  }

  const first = views[0]
  const catLabel =
    first.category === 'monthly_commemoration'
      ? 'Next monthly commemoration'
      : first.category === 'annual_feast'
        ? 'Next annual feast'
        : 'Next observance'
  const catAm =
    first.category === 'monthly_commemoration'
      ? 'ቀጣዩ ወርሃዊ መታሰቢያ'
      : first.category === 'annual_feast'
        ? 'ቀጣዩ ዓመታዊ በዓል'
        : 'ቀጣዩ መታሰቢያ'
  return answer(
    parsed.originalQuery,
    parsed.language,
    `${catLabel} of ${first.name}: ${first.ethiopianLabel} / ${first.gregorianLabel}.`,
    `${catAm} የ${first.nameAmharic}፦ ${first.ethiopianLabel} / ${first.gregorianLabel}።`,
    views,
  )
}

function resolveFastQuestion(parsed: ParsedQuestion, ref: Date): CalendarQuestionResult {
  const cal = parsed.calendar
  if (!cal) {
    return unsupported(parsed.originalQuery, parsed.language, 'That fasting question could not be parsed.', 'የጾም ጥያቄው አልተተነተነም።')
  }

  const target = cal.temporal === 'tomorrow' ? offsetDate(ref, 1) : ref
  const namedIds = cal.entity?.fastIds ?? []

  if (cal.action === 'list_year') {
    const views: CalendarOccurrenceView[] = []
    for (const row of namedFastRows()) {
      const start = nextOccurrenceForEntry(row.entry, ref)
      if (!start) continue
      views.push(attachSeasonEnd(viewFromDate(row.entry, start, ref, 'fast'), row.entry, ref))
    }
    views.sort((a, b) => a.gregorianIso.localeCompare(b.gregorianIso))
    if (!views.length) {
      return unsupported(
        parsed.originalQuery,
        parsed.language,
        'No named fasting periods with resolvable dates are in the calendar dataset.',
        'በመረጃው ውስጥ ቀን የሚሰጡ የጾም ወቅቶች አልተገኙም።',
      )
    }
    return answer(
      parsed.originalQuery,
      parsed.language,
      'Named fasting periods with dates in the calendar dataset:',
      'በቀን መቁጠሪያው የተመዘገቡ የጾም ወቅቶች፦',
      views,
      ['Weekly Wednesday and Friday fasts are separate from these named periods.'],
      ['የረቡዕና የዓርብ ሳምንታዊ ጾሞች ከእነዚህ ወቅቶች የተለዩ ናቸው።'],
    )
  }

  if (cal.action === 'is_observing') {
    const weekly = weeklyFastOn(target)
    const named = namedFastOn(target)
    const views = [
      ...weekly.map((row) => viewFromDate(row.entry, target, ref, 'weekly_fast')),
      ...named.map((row) => attachSeasonEnd(viewFromDate(row.entry, target, ref, 'fast'), row.entry, target)),
    ]
    const when = cal.temporal === 'tomorrow' ? 'Tomorrow' : 'Today'
    const whenAm = cal.temporal === 'tomorrow' ? 'ነገ' : 'ዛሬ'
    if (!views.length) {
      return answer(
        parsed.originalQuery,
        parsed.language,
        `${when} is not a fasting day in the calendar dataset.`,
        `${whenAm} በቀን መቁጠሪያው ጾም አይደለም።`,
        [],
      )
    }
    return answer(
      parsed.originalQuery,
      parsed.language,
      `${when} is a fasting day: ${views.map((v) => v.name).join('; ')}.`,
      `${whenAm} ጾም ነው፦ ${views.map((v) => v.nameAmharic).join('፤ ')}።`,
      views,
    )
  }

  if (cal.action === 'end') {
    const active = namedFastOn(ref)
    if (!active.length) {
      const weekly = weeklyFastOn(ref)
      if (weekly.length) {
        return answer(
          parsed.originalQuery,
          parsed.language,
          'Today is a weekly fasting day. Weekly Wednesday and Friday fasts do not have a named period end date.',
          'ዛሬ ሳምንታዊ ጾም ነው። የረቡዕና የዓርብ ጾሞች የወቅት መጨረሻ የላቸውም።',
          weekly.map((row) => viewFromDate(row.entry, ref, ref, 'weekly_fast')),
        )
      }
      return answer(
        parsed.originalQuery,
        parsed.language,
        'No named fasting period is active today in the calendar dataset.',
        'ዛሬ የተሰየመ የጾም ወቅት አይታይም።',
        [],
      )
    }
    const views = active.map((row) => {
      const start = viewFromDate(row.entry, ref, ref, 'fast')
      return attachSeasonEnd(start, row.entry, ref)
    })
    const withEnd = views.filter((v) => v.endGregorianIso)
    const without = views.filter((v) => v.endUnsupported)
    const notesEn = without.map(
      (v) => `${v.name} is recorded, but this dataset does not include a verified end date.`,
    )
    const notesAm = without.map(
      (v) => `${v.nameAmharic} ተመዝግቧል፤ የመጨረሻ ቀን ግን በዚህ መረጃ ውስጥ የለም።`,
    )
    if (!withEnd.length) {
      return answer(
        parsed.originalQuery,
        parsed.language,
        notesEn[0] || 'The current fast has no verified end date in the calendar dataset.',
        notesAm[0] || 'የአሁኑ ጾም መጨረሻ በመረጃው አልተቀመጠም።',
        views,
        notesEn,
        notesAm,
      )
    }
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Current fast ends: ${withEnd[0].name} on ${withEnd[0].endEthiopianLabel} / ${withEnd[0].endGregorianIso}.`,
      `የአሁኑ ጾም ያበቃል፦ ${withEnd[0].nameAmharic} ${withEnd[0].endEthiopianLabel} / ${withEnd[0].endGregorianIso}።`,
      withEnd,
      notesEn,
      notesAm,
    )
  }

  if (namedIds.length && cal.category === 'fast') {
    const next = nextNamedFast(ref, namedIds)
    if (!next) {
      return unsupported(
        parsed.originalQuery,
        parsed.language,
        'That fasting period has no verified next date in the calendar dataset.',
        'ለዚያ ጾም የተረጋገጠ ቀጣይ ቀን የለም።',
      )
    }
    const view = attachSeasonEnd(viewFromDate(next.row.entry, next.date, ref, 'fast'), next.row.entry, ref)
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Next ${view.name}: ${view.ethiopianLabel} / ${view.gregorianLabel}.`,
      `ቀጣዩ ${view.nameAmharic}፦ ${view.ethiopianLabel} / ${view.gregorianLabel}።`,
      [view],
    )
  }

  if (cal.category === 'weekly_fast') {
    const next = nextWeeklyFast(ref)
    if (!next) {
      return unsupported(
        parsed.originalQuery,
        parsed.language,
        'No upcoming weekly fasting day could be resolved from the calendar rules.',
        'ቀጣይ ሳምንታዊ ጾም ከሕጎቹ ሊሰላ አልተቻለም።',
      )
    }
    const view = viewFromDate(next.row.entry, next.date, ref, 'weekly_fast')
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Next fasting day: ${view.name} on ${view.ethiopianLabel} / ${view.gregorianLabel}.`,
      `ቀጣዩ የጾም ቀን፦ ${view.nameAmharic} ${view.ethiopianLabel} / ${view.gregorianLabel}።`,
      [view],
    )
  }

  if (cal.category === 'fast') {
    const next = nextNamedFast(ref, namedIds.length ? namedIds : undefined)
    if (!next) {
      return unsupported(
        parsed.originalQuery,
        parsed.language,
        'No upcoming named fasting period could be resolved from the calendar dataset.',
        'ቀጣይ የተሰየመ የጾም ወቅት አልተገኘም።',
      )
    }
    const view = attachSeasonEnd(viewFromDate(next.row.entry, next.date, ref, 'fast'), next.row.entry, ref)
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Next named fasting period: ${view.name} on ${view.ethiopianLabel} / ${view.gregorianLabel}.`,
      `ቀጣዩ የጾም ወቅት፦ ${view.nameAmharic} ${view.ethiopianLabel} / ${view.gregorianLabel}።`,
      [view],
    )
  }

  if (cal.ambiguity === 'weekly_vs_named_fast' && !parsed.isFollowUp) {
    return clarify(
      parsed,
      'weekly_vs_named_fast',
      'Did you mean the next weekly fasting day, or the next named fasting period?',
      'ቀጣዩ ሳምንታዊ የጾም ቀን ይፈልጋሉ ወይስ ቀጣዩ የተሰየመ የጾም ወቅት?',
      [
        { id: 'weekly', labelEn: 'Next fasting day', labelAm: 'ቀጣዩ የጾም ቀን' },
        { id: 'named', labelEn: 'Next named fasting period', labelAm: 'ቀጣዩ የጾም ወቅት' },
      ],
      [...namedIds],
    )
  }

  const weekly = nextWeeklyFast(ref)
  const named = nextNamedFast(ref)
  if (weekly && named) {
    return clarify(
      parsed,
      'weekly_vs_named_fast',
      'Did you mean the next weekly fasting day, or the next named fasting period?',
      'ቀጣዩ ሳምንታዊ የጾም ቀን ይፈልጋሉ ወይስ ቀጣዩ የተሰየመ የጾም ወቅት?',
      [
        { id: 'weekly', labelEn: 'Next fasting day', labelAm: 'ቀጣዩ የጾም ቀን' },
        { id: 'named', labelEn: 'Next named fasting period', labelAm: 'ቀጣዩ የጾም ወቅት' },
      ],
      [],
    )
  }
  if (named) {
    const view = attachSeasonEnd(viewFromDate(named.row.entry, named.date, ref, 'fast'), named.row.entry, ref)
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Next named fasting period: ${view.name} on ${view.ethiopianLabel} / ${view.gregorianLabel}.`,
      `ቀጣዩ የጾም ወቅት፦ ${view.nameAmharic} ${view.ethiopianLabel} / ${view.gregorianLabel}።`,
      [view],
    )
  }
  if (weekly) {
    const view = viewFromDate(weekly.row.entry, weekly.date, ref, 'weekly_fast')
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Next fasting day: ${view.name} on ${view.ethiopianLabel} / ${view.gregorianLabel}.`,
      `ቀጣዩ የጾም ቀን፦ ${view.nameAmharic} ${view.ethiopianLabel} / ${view.gregorianLabel}።`,
      [view],
    )
  }
  return unsupported(
    parsed.originalQuery,
    parsed.language,
    'No upcoming fast could be resolved from the calendar dataset.',
    'ቀጣይ ጾም ከቀን መቁጠሪያው ሊሰላ አልተቻለም።',
  )
}

function resolveTodayQuestion(parsed: ParsedQuestion, ref: Date): CalendarQuestionResult {
  const cal = parsed.calendar
  const target = cal?.temporal === 'tomorrow' ? offsetDate(ref, 1) : ref
  const eth = gregorianToEthiopian(target)
  const dateLine = `${ethLabel(target)} / ${formatGregorianLong(target)}`
  if (cal?.category === 'ethiopian_date') {
    const when = cal.temporal === 'tomorrow' ? 'Tomorrow' : 'Today'
    const whenAm = cal.temporal === 'tomorrow' ? 'ነገ' : 'ዛሬ'
    return answer(
      parsed.originalQuery,
      parsed.language,
      `${when} in the Ethiopian calendar: ${dateLine}.`,
      `${whenAm} በኢትዮጵያ አቆጣጠር፦ ${dateLine}።`,
      [
        {
          name: when,
          nameAmharic: whenAm,
          category: 'ethiopian_date',
          ethiopianLabel: ethLabel(target),
          gregorianIso: toIsoLocalDate(target),
          gregorianLabel: formatGregorianLong(target),
          weekday: formatWeekdayLong(target),
          relative: relativeFor(daysBetween(ref, target)),
          daysRemaining: daysBetween(ref, target),
          href: `/calendar?date=${toIsoLocalDate(target)}`,
          entryId: `day-${toIsoLocalDate(target)}`,
        },
      ],
    )
  }

  if (cal?.category === 'season') {
    const seasons = getSeasonEntriesForDate(target).filter((row) => row.entry.category.primary === 'season')
    if (!seasons.length) {
      return answer(
        parsed.originalQuery,
        parsed.language,
        'No liturgical season is recorded for this date in the calendar dataset.',
        'ለዚህ ቀን የተመዘገበ ዘመን የለም።',
        [],
      )
    }
    const views = seasons.map((row) => viewFromDate(row.entry, target, ref, 'season'))
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Current season: ${views.map((v) => v.name).join('; ')}.`,
      `ያሁኑ ዘመን፦ ${views.map((v) => v.nameAmharic).join('፤ ')}።`,
      views,
    )
  }

  if (cal?.action === 'list_month') {
    const month = eth.month
    const annuals = getAllCalendarEntries().filter((row) => {
      if (row.entry.date.kind !== 'fixed') return false
      const m = ethMonthFromEnglishName(String(row.entry.date.ethiopianMonth || ''))
      return m === month
    })
    const monthlies = getAllCalendarEntries().filter((row) => row.entry.date.kind === 'monthly-recurring')
    const views: CalendarOccurrenceView[] = []
    for (const row of annuals) {
      const date = nextOccurrenceForEntry(row.entry, ref)
      if (date) views.push(viewFromDate(row.entry, date, ref, 'annual_feast'))
    }
    for (const row of monthlies) {
      const day = row.entry.date.monthlyRecurringDay
      if (!day) continue
      const next = nextMonthlyDayOnOrAfter(ref, day)
      if (next && gregorianToEthiopian(next.gregorian).month === month) {
        views.push(viewFromDate(row.entry, next.gregorian, ref, 'monthly_commemoration'))
      }
    }
    views.sort((a, b) => a.gregorianIso.localeCompare(b.gregorianIso))
    return answer(
      parsed.originalQuery,
      parsed.language,
      `Commemorations in this Ethiopian month (${ethLabel(target).replace(/ \d+,/, ',')}) from the calendar dataset:`,
      'በዚህ ወር የተመዘገቡ መታሰቢያዎች፦',
      views.slice(0, 12),
    )
  }

  const views = dayCommemorations(target, ref)
  const when = cal?.temporal === 'tomorrow' ? 'Tomorrow' : 'Today'
  const whenAm = cal?.temporal === 'tomorrow' ? 'ነገ' : 'ዛሬ'
  if (!views.length) {
    return answer(
      parsed.originalQuery,
      parsed.language,
      `${when} (${dateLine}) has no additional commemorations in the bundled calendar dataset.`,
      `${whenAm} (${dateLine}) በመረጃው ተጨማሪ መታሰቢያ የለውም።`,
      [
        {
          name: when,
          nameAmharic: whenAm,
          category: 'ethiopian_date',
          ethiopianLabel: ethLabel(target),
          gregorianIso: toIsoLocalDate(target),
          gregorianLabel: formatGregorianLong(target),
          weekday: formatWeekdayLong(target),
          relative: relativeFor(daysBetween(ref, target)),
          daysRemaining: daysBetween(ref, target),
          href: `/calendar?date=${toIsoLocalDate(target)}`,
          entryId: `day-${toIsoLocalDate(target)}`,
        },
      ],
    )
  }
  return answer(
    parsed.originalQuery,
    parsed.language,
    `${when} (${dateLine}): ${views.map((v) => v.name).join('; ')}.`,
    `${whenAm} (${dateLine})፦ ${views.map((v) => v.nameAmharic).join('፤ ')}።`,
    views,
  )
}

function resolveNextAnnualFeast(parsed: ParsedQuestion, ref: Date): CalendarQuestionResult {
  const rows = getAllCalendarEntries().filter(
    (row) =>
      (row.entry.date.kind === 'fixed' || row.entry.date.kind === 'movable') &&
      row.entry.category.majorHoliday &&
      row.entry.category.primary !== 'fast',
  )
  let best: CalendarOccurrenceView | null = null
  for (const row of rows) {
    const date = nextOccurrenceForEntry(row.entry, ref)
    if (!date) continue
    const view = viewFromDate(row.entry, date, ref, 'annual_feast')
    if (!best || view.gregorianIso < best.gregorianIso) best = view
  }
  if (!best) {
    return unsupported(
      parsed.originalQuery,
      parsed.language,
      'No upcoming annual feast could be resolved from the calendar dataset.',
      'ቀጣይ ዓመታዊ በዓል አልተገኘም።',
    )
  }
  return answer(
    parsed.originalQuery,
    parsed.language,
    `Next annual feast: ${best.name} on ${best.ethiopianLabel} / ${best.gregorianLabel}.`,
    `ቀጣዩ ዓመታዊ በዓል፦ ${best.nameAmharic} ${best.ethiopianLabel} / ${best.gregorianLabel}።`,
    [best],
  )
}

export function resolveCalendarQuestion(
  parsed: ParsedQuestion,
  options: CalendarQuestionOptions = {},
): CalendarQuestionResult {
  const ref = referenceDate(options)
  const cal = parsed.calendar
  if (!cal) {
    return unsupported(
      parsed.originalQuery,
      parsed.language,
      'That is not a calendar question the app can resolve from its church calendar dataset.',
      'ይህ ከቀን መቁጠሪያው ሊመለስ የሚችል ጥያቄ አይደለም።',
    )
  }

  if (cal.ambiguity === 'uncertain_entity') {
    return resolveEntityQuestion(parsed, ref)
  }

  const fastQuestion =
    cal.category === 'fast' ||
    cal.category === 'weekly_fast' ||
    cal.ambiguity === 'weekly_vs_named_fast' ||
    cal.entity?.kind === 'fast' ||
    (cal.action === 'is_observing' && !cal.entity && !cal.category)

  if (fastQuestion) {
    return resolveFastQuestion(parsed, ref)
  }

  if (cal.entity || cal.entityIds.length) {
    if (cal.category === 'fast' || cal.entity?.kind === 'fast') return resolveFastQuestion(parsed, ref)
    if (cal.category === 'season' || cal.entity?.kind === 'season') {
      const ids = idsForCategory(cal.entity, 'season', cal.entityIds)
      const views = occurrenceViewsForIds(ids, ref, 'season')
      if (!views.length) {
        return resolveTodayQuestion(parsed, ref)
      }
      return answer(
        parsed.originalQuery,
        parsed.language,
        `Season: ${views[0].name} on ${views[0].ethiopianLabel} / ${views[0].gregorianLabel}.`,
        `ዘመን፦ ${views[0].nameAmharic} ${views[0].ethiopianLabel} / ${views[0].gregorianLabel}።`,
        views,
      )
    }
    return resolveEntityQuestion(parsed, ref)
  }

  if (cal.action === 'list_year' || cal.category === 'fast' || cal.category === 'weekly_fast') {
    return resolveFastQuestion(parsed, ref)
  }

  if (cal.action === 'next_occurrence' && cal.category === 'annual_feast') {
    return resolveNextAnnualFeast(parsed, ref)
  }

  return resolveTodayQuestion(parsed, ref)
}

export function pendingFromResult(result: CalendarQuestionResult): PendingClarification | null {
  return result.kind === 'clarify' ? result.pending : null
}
