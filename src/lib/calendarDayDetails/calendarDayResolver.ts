import rawDayDetails from '../../data/calendar/day-details.json'
import rawLiturgyRules from '../../data/calendar/liturgy-rules.json'
import rawMezmurIndex from '../../data/calendar/mezmur-index.json'
import { formatEthiopianLong, gregorianToEthiopian } from '../ethiopianDate'
import { ethMonthFromEnglishName } from '../eotcCalendar/eotcEthiopianMonthNames'
import { sortEotcEntriesForCalendarPanel } from '../eotcCalendar/eotcCalendarPanelOrdering'
import type { EotcCalendarDatasetRow, EotcSource } from '../eotcCalendar'
import type { SynaxariumEntry } from '../synaxarium'
import {
  getSynaxariumEntryForEthiopianDate,
  hasDetailedSynaxariumEntry,
} from '../synaxarium'
import type {
  CalendarDayCommemoration,
  CalendarDayDetail,
  CalendarExpandedContent,
  CalendarLiturgyContext,
} from './types'

type StoredDayDetail = Omit<CalendarDayDetail, 'liturgyContext'> & {
  summary?: string
  seasonNote?: string
  liturgyContext?: {
    structure?: string[]
    candidateAnaphora?: {
      id?: string
      title?: string
      reason?: string
      confidence?: string
    }
    anaphora?: CalendarLiturgyContext['anaphora']
    readings?: Partial<CalendarLiturgyContext['readings']>
    mezmur?: Partial<CalendarLiturgyContext['mezmur']>
    reason?: string
    whyToday?: string
  }
  ui?: {
    headlineCommemoration?: string
  }
}

type LiturgyRule = {
  id: string
  ruleType?: string
  label?: string
  condition: {
    ethiopianMonth?: string
    ethiopianDay?: number
    monthlyRecurringDay?: number
    weekdays?: string[]
    seasonRange?: {
      startMonth: string
      startDay: number
      endMonth: string
      endDay: number
    }
    containsAny?: string[]
  }
  result: {
    anaphoraId?: string
    candidateAnaphora?: { id: string; title: string }
  }
  confidence: string
  status?: string
  note?: string
  sourcePageStart?: number
  sourcePageEnd?: number
}

type DayDetailsFile = {
  days: StoredDayDetail[]
}

type LiturgyRulesFile = {
  standardStructure?: Array<string | { id?: string; title: string; summary?: string }>
  anaphoras?: Array<{
    id: string
    title: string
    summary?: string
    occasionNotes?: string[]
  }>
  readingPattern?: {
    title?: string
    summary?: string
    status?: string
    note?: string
    order?: Array<string | { id?: string; title: string; order?: number }>
    notes?: string[]
  }
  rules?: LiturgyRule[]
}

type MezmurIndexFile = {
  items: Array<{
    id: string
    title: string
    transliterationTitle?: string | null
    sourceFile: string
    category: {
      primary?: string
      confidence?: string
    }
    searchTerms: string[]
  }>
}

const DAY_DETAILS = rawDayDetails as unknown as DayDetailsFile
const LITURGY_RULES = rawLiturgyRules as unknown as LiturgyRulesFile
const MEZMUR_INDEX = rawMezmurIndex as unknown as MezmurIndexFile

const ANAPHORA_BY_ID = new Map(
  (LITURGY_RULES.anaphoras ?? []).map((anaphora) => [anaphora.id, anaphora]),
)

const BY_ETHIOPIAN_DAY = new Map<string, StoredDayDetail>()

for (const day of DAY_DETAILS.days) {
  const month = ethMonthFromEnglishName(day.ethiopianDate.month)
  if (month) BY_ETHIOPIAN_DAY.set(monthDayKey(month, day.ethiopianDate.day), day)
}

function monthDayKey(month: number, day: number): string {
  return `${month}-${day}`
}

function clean(value: string | undefined | null): string | undefined {
  const trimmed = value?.trim()
  return trimmed || undefined
}

function normalizeForCompare(value: string | undefined | null): string {
  return (value ?? '')
    .trim()
    .replace(/\s+/g, ' ')
    .toLocaleLowerCase()
}

function uniqueLines(lines: Array<string | undefined>): string[] {
  const seen = new Set<string>()
  const result: string[] = []
  for (const line of lines) {
    const trimmed = clean(line)
    if (!trimmed) continue
    const key = normalizeForCompare(trimmed)
    if (seen.has(key)) continue
    seen.add(key)
    result.push(trimmed)
  }
  return result
}

function distinctFromSections(
  lines: Array<string | undefined>,
  sectionText: Array<string | undefined>,
): string[] {
  const blocked = new Set(sectionText.map(normalizeForCompare).filter(Boolean))
  return uniqueLines(lines).filter((line) => !blocked.has(normalizeForCompare(line)))
}

function eotcTitle(row: EotcCalendarDatasetRow): string {
  return row.entry.englishTitle?.trim() || row.entry.title.trim()
}

function eotcSourceField(source: EotcSource | undefined, key: string): string | undefined {
  const value = source?.[key]
  return typeof value === 'string' && value.trim() ? value.trim() : undefined
}

function eotcSourcePage(source: EotcSource | undefined): number | undefined {
  const value = source?.sourcePage ?? source?.page ?? source?.pdfPage
  return typeof value === 'number' && Number.isFinite(value) ? value : undefined
}

function buildSourceMetadata(
  rows: readonly EotcCalendarDatasetRow[],
  synaxarium: SynaxariumEntry | null,
): CalendarExpandedContent['source'] | undefined {
  const primary = rows[0]?.entry
  const expandedSource = primary?.content.expandedContent?.source
  const synaxariumSource = primary?.sources?.find((source) => {
    const title = source.title?.toLocaleLowerCase() ?? ''
    const type = source.type?.toLocaleLowerCase() ?? ''
    return type.includes('synaxarium') || title.includes('synaxarium')
  })
  const firstSource = synaxariumSource ?? primary?.sources?.[0]
  const title =
    firstSource?.title?.trim() ||
    expandedSource?.title?.trim() ||
    (synaxarium ? 'Ethiopian Synaxarium' : undefined)
  const entryLabel =
    eotcSourceField(firstSource, 'dateHeading') ||
    expandedSource?.entryLabel?.trim() ||
    synaxarium?.sourceDateHeading
  const sourcePage =
    eotcSourcePage(firstSource) ??
    (typeof expandedSource?.sourcePage === 'number' ? expandedSource.sourcePage : undefined) ??
    synaxarium?.sourcePage ??
    undefined
  const provenanceNote =
    synaxarium?.status === 'verified' ? 'Verified from original source' : undefined

  if (!title && !entryLabel && !sourcePage && !provenanceNote) return undefined
  return {
    title: title || 'EOTC calendar data',
    file: expandedSource?.file?.trim(),
    entryLabel,
    provenanceNote,
    originalReference: sourcePage ? `PDF page ${sourcePage}` : undefined,
  }
}

function eotcRowsToExpandedContent(
  rows: readonly EotcCalendarDatasetRow[],
  synaxarium: SynaxariumEntry | null,
): CalendarExpandedContent | undefined {
  const primary = rows[0]?.entry
  if (!primary) return synaxariumToExpandedContent(synaxarium)

  const explicit = primary.content.expandedContent
  const whyCelebrated =
    clean(explicit?.whyCelebrated) ||
    clean(primary.summary.panel) ||
    clean(primary.summary.short)
  const significance =
    clean(explicit?.significance) ||
    clean(primary.summary.whyItMatters) ||
    clean(primary.summary.connection)
  const whatHappened = distinctFromSections(
    [
      ...(explicit?.whatHappened ?? []),
      clean(primary.content.extended),
      clean(primary.summary.connection),
    ],
    [whyCelebrated, significance],
  )
  const source = buildSourceMetadata(rows, synaxarium)

  if (!whyCelebrated && whatHappened.length === 0 && !significance && !source) {
    return undefined
  }
  return {
    whyCelebrated,
    whatHappened,
    significance,
    source,
  }
}

function synaxariumToExpandedContent(
  synaxarium: SynaxariumEntry | null,
): CalendarExpandedContent | undefined {
  if (!synaxarium || !hasDetailedSynaxariumEntry(synaxarium)) return undefined
  const whatHappened = synaxarium.mainCommemorations
    .map((line) => line.trim())
    .filter(Boolean)
    .slice(0, 5)
  return {
    whyCelebrated:
      clean(synaxarium.shortSummary) ||
      `This day keeps the remembrance for ${synaxarium.sourceDateHeading}.`,
    whatHappened,
    significance:
      'The Church keeps the memory of saints, feasts, and holy events so the faithful can learn from their witness and ask their prayers.',
    source: {
      title: 'Ethiopian Synaxarium',
      entryLabel: synaxarium.sourceDateHeading,
      provenanceNote:
        synaxarium.status === 'verified' ? 'Verified from original source' : undefined,
      originalReference: synaxarium.sourcePage
        ? `PDF page ${synaxarium.sourcePage}`
        : undefined,
    },
  }
}

function eotcRowsToCommemorations(
  rows: readonly EotcCalendarDatasetRow[],
): CalendarDayCommemoration[] {
  return rows.map((row, index) => {
    const entry = row.entry
    return {
      title: eotcTitle(row),
      category: entry.display.calendarBadge || entry.category.primary,
      kind: entry.category.primary,
      priority: index === 0 ? 'headline' : 'secondary',
      expandedContent: eotcRowsToExpandedContent([row], null),
    }
  })
}

function synaxariumToCommemorations(
  synaxarium: SynaxariumEntry | null,
): CalendarDayCommemoration[] {
  if (!synaxarium || !hasDetailedSynaxariumEntry(synaxarium)) return []
  return synaxarium.mainCommemorations.slice(0, 6).map((title, index) => ({
    title,
    category: synaxarium.type,
    kind: synaxarium.category,
    priority: index === 0 ? 'headline' : 'secondary',
  }))
}

function allCommemorationText(
  day: StoredDayDetail | null,
  synaxarium: SynaxariumEntry | null,
  eotcRows: readonly EotcCalendarDatasetRow[],
): string {
  return [
    day?.title,
    day?.summary,
    ...(day?.commemorations.map((c) => `${c.title} ${c.category ?? ''}`) ?? []),
    synaxarium?.title,
    ...(synaxarium?.mainCommemorations ?? []),
    ...eotcRows.map((row) =>
      [
        row.entry.englishTitle,
        row.entry.transliterationTitle,
        row.entry.title,
        row.entry.id,
        row.entry.category.primary,
        ...row.entry.category.secondary,
        row.entry.summary.short,
        row.entry.summary.panel,
        row.entry.summary.connection,
        row.entry.content.extended,
      ].join(' '),
    ),
  ]
    .filter(Boolean)
    .join(' ')
    .toLocaleLowerCase()
}

function allCategoryText(
  day: StoredDayDetail | null,
  eotcRows: readonly EotcCalendarDatasetRow[],
): string {
  return [
    ...(day?.commemorations.map((c) => `${c.category ?? ''} ${c.kind ?? ''}`) ?? []),
    ...eotcRows.map((row) => [row.entry.category.primary, ...row.entry.category.secondary].join(' ')),
  ]
    .filter(Boolean)
    .join(' ')
    .toLocaleLowerCase()
}

function ethMonthDayCompare(month: number, day: number, otherMonth: number, otherDay: number) {
  if (month !== otherMonth) return month - otherMonth
  return day - otherDay
}

function isWithinSeasonRange(
  ethMonth: number,
  ethDay: number,
  range: NonNullable<LiturgyRule['condition']['seasonRange']>,
) {
  const startMonth = ethMonthFromEnglishName(range.startMonth)
  const endMonth = ethMonthFromEnglishName(range.endMonth)
  if (!startMonth || !endMonth) return false
  const startsBeforeEnds = ethMonthDayCompare(startMonth, range.startDay, endMonth, range.endDay) <= 0
  if (startsBeforeEnds) {
    return (
      ethMonthDayCompare(ethMonth, ethDay, startMonth, range.startDay) >= 0 &&
      ethMonthDayCompare(ethMonth, ethDay, endMonth, range.endDay) <= 0
    )
  }
  return (
    ethMonthDayCompare(ethMonth, ethDay, startMonth, range.startDay) >= 0 ||
    ethMonthDayCompare(ethMonth, ethDay, endMonth, range.endDay) <= 0
  )
}

function confidenceScore(confidence: string | undefined): number {
  if (confidence === 'high') return 3
  if (confidence === 'medium') return 2
  if (confidence === 'low') return 1
  return 0
}

function findMatchingRule(
  ethMonthName: string,
  ethDay: number,
  weekday: string,
  text: string,
  categoryText: string,
): LiturgyRule | null {
  const ethMonth = ethMonthFromEnglishName(ethMonthName)
  if (!ethMonth) return null

  const matches = (LITURGY_RULES.rules ?? [])
    .map((rule, index) => {
      const condition = rule.condition
      let score = 0
      const hasCalendarSpecificCondition = Boolean(
        condition.ethiopianMonth ||
          condition.monthlyRecurringDay ||
          condition.seasonRange ||
          condition.weekdays?.length,
      )

      // Resolution priority: exact date > monthly date > named/season context > weekday > keyword.
    if (
      condition.ethiopianMonth &&
      condition.ethiopianDay != null &&
      condition.ethiopianMonth.toLocaleLowerCase() === ethMonthName.toLocaleLowerCase() &&
      condition.ethiopianDay === ethDay
    ) {
        score = 100
    }

      if (condition.monthlyRecurringDay === ethDay) {
        score = Math.max(score, 90)
      }

      if (condition.seasonRange && isWithinSeasonRange(ethMonth, ethDay, condition.seasonRange)) {
        score = Math.max(score, 70)
      }

      if (rule.ruleType === 'dayOfWeek' && condition.weekdays?.includes(weekday)) {
        score = Math.max(score, 60)
      }

      const keywordHaystack = rule.status === 'explicit-partial' ? categoryText : text
      if (
        !hasCalendarSpecificCondition &&
        condition.containsAny?.some((keyword) => keywordHaystack.includes(keyword.toLocaleLowerCase()))
      ) {
        score = Math.max(score, 50)
      }

      if (score === 0) return null
      return {
        rule,
        score: score + confidenceScore(rule.confidence),
        index,
      }
    })
    .filter(Boolean) as Array<{ rule: LiturgyRule; score: number; index: number }>

  matches.sort((a, b) => b.score - a.score || a.index - b.index)
  return matches[0]?.rule ?? null
}

function structureFromJson(): string[] {
  const structure = LITURGY_RULES.standardStructure ?? []
  const titles = structure.map((item) => (typeof item === 'string' ? item : item.title)).filter(Boolean)
  return titles.length ? titles : ['Opening', 'Readings', 'Anaphora', 'Communion']
}

function readingPatternFromJson(): CalendarLiturgyContext['readings']['pattern'] {
  return (LITURGY_RULES.readingPattern?.order ?? [])
    .map((item) => {
      if (typeof item === 'string') return { title: item }
      return {
        id: item.id,
        title: item.title,
        order: item.order,
      }
    })
    .filter((item) => item.title)
}

function resolveReadings(
  stored: StoredDayDetail | null,
): CalendarLiturgyContext['readings'] {
  const exactItems = stored?.liturgyContext?.readings?.items?.filter((item) => item.title)
  if (exactItems?.length) {
    return {
      title: 'Appointed readings',
      status: 'resolved',
      note: stored?.liturgyContext?.readings?.note || 'Readings are supplied by the calendar day data.',
      items: exactItems,
    }
    }

  const pattern = readingPatternFromJson()
  const note =
    LITURGY_RULES.readingPattern?.summary ||
    LITURGY_RULES.readingPattern?.notes?.find((line) => line.includes('getsawe')) ||
    'Exact daily readings are not linked yet; the liturgy data supplies the standard reading order.'
  return {
    title: LITURGY_RULES.readingPattern?.title || 'Standard Qedasi reading order',
    status: 'standard-order',
    note,
    pattern,
  }
}

const LOW_SIGNAL_MEZMUR_TERMS = new Set([
  'general',
  'church-service',
  'general-worship',
  'praise',
  'faith',
  'worship',
  'liturgical',
  'healing',
  'protection',
  'intercession',
  'blessing',
  'joy',
  'saint-commemoration',
  'saints-commemoration',
  'feast-program',
  'kidase-related',
  'chant',
  'choir',
])

function normalizeToken(value: string): string {
  return value.toLocaleLowerCase().replace(/[_\s]+/g, '-')
}

function resolveMezmur(
  stored: StoredDayDetail | null,
  text: string,
): CalendarLiturgyContext['mezmur'] {
  const storedMezmur = stored?.liturgyContext?.mezmur
  if (storedMezmur?.id || storedMezmur?.title) {
    return {
      id: storedMezmur.id,
      title: storedMezmur.title,
      status: storedMezmur.status || 'resolved',
      note: storedMezmur.note || 'Linked from calendar day liturgy data.',
    }
  }

  const scored = MEZMUR_INDEX.items
    .map((item) => {
      let score = 0
      const matchedTerms: string[] = []
      for (const term of item.searchTerms) {
        const normalized = normalizeToken(term)
        if (LOW_SIGNAL_MEZMUR_TERMS.has(normalized)) continue
        if (text.includes(normalized) || text.includes(normalized.replace(/-/g, ' '))) {
          score += 3
          matchedTerms.push(term)
        }
      }
      if (item.category.primary && text.includes(normalizeToken(item.category.primary))) score += 1
      if (item.category.confidence === 'high') score += 1
      return { item, score, matchedTerms }
    })
    .filter((row) => row.score >= 6)
    .sort((a, b) => b.score - a.score)

  const best = scored[0]
  if (!best) {
    return {
      status: 'not-linked',
      note: 'No specific mezmur linked for this day yet.',
    }
  }

  return {
    id: best.item.id,
    title: best.item.title,
    status: 'metadata-match',
    note: `Matched chant metadata: ${best.matchedTerms.slice(0, 3).join(', ')}.`,
  }
}

function buildLiturgyContext(
  day: StoredDayDetail | null,
  synaxarium: SynaxariumEntry | null,
  eotcRows: readonly EotcCalendarDatasetRow[],
  ethMonthName: string,
  ethDay: number,
  weekday: string,
): CalendarLiturgyContext {
  const text = allCommemorationText(day, synaxarium, eotcRows)
  const categoryText = allCategoryText(day, eotcRows)
  const storedCandidate = day?.liturgyContext?.anaphora ?? day?.liturgyContext?.candidateAnaphora
  const storedResolved =
    storedCandidate &&
    storedCandidate.id &&
    !['unresolved', 'multiple-supported-rules'].includes(storedCandidate.id) &&
    !['unresolved', 'needs_review'].includes(storedCandidate.confidence ?? '')
      ? storedCandidate
      : null
  const rule = storedResolved
    ? null
    : findMatchingRule(ethMonthName, ethDay, weekday, text, categoryText)
  const anaphoraId = storedResolved?.id ?? rule?.result.anaphoraId ?? rule?.result.candidateAnaphora?.id
  const anaphoraMeta = anaphoraId ? ANAPHORA_BY_ID.get(anaphoraId) : undefined
  const reason = storedResolved
    ? storedResolved.reason || 'Resolved from exact calendar day liturgy data.'
    : rule
    ? `${rule.label || rule.note || rule.id}.`
    : 'No source-supported anaphora mapping is available for this day yet.'

  return {
    structure: day?.liturgyContext?.structure?.length ? day.liturgyContext.structure : structureFromJson(),
    anaphora: {
      id: anaphoraId ?? 'unresolved',
      title: storedResolved?.title || anaphoraMeta?.title || 'Not resolved from current data',
      summary: anaphoraMeta?.summary,
      reason,
      confidence: storedResolved?.confidence ?? rule?.confidence ?? 'unresolved',
    },
    readings: resolveReadings(day),
    mezmur: resolveMezmur(day, text),
    whyToday: reason,
    source: {
      from: [
        'src/data/calendar/day-details.json',
        'src/data/calendar/liturgy-rules.json',
        'src/data/calendar/mezmur-index.json',
      ],
    },
  }
}

export function resolveCalendarDayDetail(
  date: Date,
  eotcRows: readonly EotcCalendarDatasetRow[] = [],
): CalendarDayDetail {
  const orderedEotcRows = sortEotcEntriesForCalendarPanel(eotcRows)
  const eth = gregorianToEthiopian(date)
  const ethMonthName = formatEthiopianLong({ ...eth, year: eth.year }).split(' ')[0]
  const synaxarium = getSynaxariumEntryForEthiopianDate(eth.month, eth.day)
  const weekday = date.toLocaleDateString('en-US', { weekday: 'long' }).toLocaleLowerCase()
  const stored = BY_ETHIOPIAN_DAY.get(monthDayKey(eth.month, eth.day)) ?? null
  const storedExpanded = stored?.expandedContent
  const eotcExpanded = eotcRowsToExpandedContent(orderedEotcRows, synaxarium)
  const primaryEotc = orderedEotcRows[0]?.entry
  const commemorations =
    orderedEotcRows.length > 0
      ? eotcRowsToCommemorations(orderedEotcRows)
      : stored?.commemorations?.length
      ? stored.commemorations
      : synaxariumToCommemorations(synaxarium)
  const title =
    clean(primaryEotc?.englishTitle) ||
    clean(primaryEotc?.title) ||
    clean(stored?.ui?.headlineCommemoration) ||
    clean(stored?.title) ||
    clean(synaxarium?.title) ||
    `${ethMonthName} ${String(eth.day).padStart(2, '0')}`
  const shortDescription =
    clean(primaryEotc?.summary.short) ||
    clean(primaryEotc?.summary.panel) ||
    clean(stored?.shortDescription) ||
    clean(stored?.summary) ||
    clean(synaxarium?.shortSummary) ||
    'No detailed calendar note is available for this date yet.'

  return {
    id: stored?.id ?? `${ethMonthName.toLocaleLowerCase()}-${String(eth.day).padStart(2, '0')}`,
    title,
    shortDescription,
    ethiopianDate: {
      month: ethMonthName,
      day: eth.day,
      year: eth.year,
      label: formatEthiopianLong(eth),
    },
    gregorianDate: {
      label: date.toLocaleDateString(undefined, {
        weekday: 'long',
        month: 'long',
        day: 'numeric',
        year: 'numeric',
      }),
      month: date.getMonth() + 1,
      day: date.getDate(),
    },
    commemorations,
    expandedContent: storedExpanded ?? eotcExpanded,
    liturgyContext: buildLiturgyContext(stored, synaxarium, orderedEotcRows, ethMonthName, eth.day, weekday),
    source: stored?.source ?? {
      synaxarium: {
        file: 'src/data/eotc_calendar_json',
        entryLabel: synaxarium?.sourceDateHeading,
        originalReference: synaxarium?.sourcePage
          ? `PDF page ${synaxarium.sourcePage}`
          : undefined,
      },
      liturgy: {
        file: 'englishethiopianliturgy.pdf',
      },
    },
  }
}
