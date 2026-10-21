/**
 * Deterministic next-occurrence calculator for EOTC commemorations.
 * Uses the same Beyene–Kudlek conversion as the frontend calendar UI.
 * Never invents feast content — only projects dates from structured records.
 */
import {
  ETHIOPIAN_MONTH_NAMES,
  formatEthiopianLong,
  gregorianToEthiopian,
  type EthiopianDateParts,
} from '../ethiopianDate.ts'
import { toIsoLocalDate, addDays } from '../churchCalendar/pascha.ts'
import { formatGregorianLong } from '../churchCalendar/formatters.ts'
import { ethiopianPartsToGregorian } from './ethiopianGregorianBridge.ts'
import { ethMonthFromEnglishName } from './eotcEthiopianMonthNames.ts'
import { EOTC_TAGGED_ENTRIES } from './eotcCalendarDataset.ts'
import { stripLocalCalendarDate } from './liturgicalCalendarContext.ts'
import type { EotcCalendarDatasetRow } from './eotcTypes.ts'

/** Display aliases preferred in Synaxarium / user-facing copy. */
const MONTH_DISPLAY_ALIAS: Record<number, string> = {
  2: 'Tikimt', // Tekemt
  3: 'Hidar', // Hedar
  10: 'Sene', // Senne
}

export type OccurrenceKind = 'monthly' | 'annual_fixed' | 'fast_start'

export type DatedOccurrence = {
  kind: OccurrenceKind
  entryId: string
  title: string
  titleAmharic?: string
  ethiopian: EthiopianDateParts
  ethiopianLabel: string
  gregorian: Date
  gregorianIso: string
  gregorianLabel: string
  sourceCollection: string
}

export type NextCommemorationAnswer = {
  querySubject: string
  referenceGregorianIso: string
  referenceEthiopianLabel: string
  monthly: DatedOccurrence | null
  nextAnnual: DatedOccurrence | null
  otherAnnual: DatedOccurrence[]
  answerEnglish: string
  answerAmharic: string
  verified: true
  found: true
}

/** Honest abstention when the query is calendar-shaped but the dataset has no match. */
export type NextCommemorationAbstention = {
  querySubject: string | null
  referenceGregorianIso: string
  referenceEthiopianLabel: string
  answerEnglish: string
  answerAmharic: string
  verified: true
  found: false
}

export type NextCommemorationResult = NextCommemorationAnswer | NextCommemorationAbstention

const QUERY_STOPWORDS = new Set([
  'when',
  'is',
  'the',
  'a',
  'an',
  'of',
  'for',
  'about',
  'tell',
  'me',
  'please',
  'next',
  'upcoming',
  'coming',
  'what',
  'which',
  'where',
  'how',
  'does',
  'do',
  'will',
  'be',
  'on',
  'in',
  'to',
  'and',
  'or',
  'saint',
  'st',
  'sts',
  'holy',
  'commemoration',
  'feast',
  'observance',
  'memorial',
  'day',
  'days',
  'month',
  'monthly',
  'annual',
  'major',
  'church',
  'ethiopian',
  'orthodox',
  'eotc',
  'date',
  'dates',
  'calendar',
  'fast',
  'fasting',
  'period',
  'periods',
  'event',
  'events',
])

function daysInEthiopianMonth(ethYear: number, ethMonth: number): number {
  if (ethMonth >= 1 && ethMonth <= 12) return 30
  // Pagumen: 6 days in Ethiopian leap years (year % 4 === 3), else 5.
  return ethYear % 4 === 3 ? 6 : 5
}

function formatEthLabel(parts: EthiopianDateParts): string {
  const alias = MONTH_DISPLAY_ALIAS[parts.month]
  const name = alias ?? ETHIOPIAN_MONTH_NAMES[parts.month - 1] ?? '—'
  return `${name} ${parts.day}, ${parts.year} E.C.`
}

function occurrenceFromParts(
  kind: OccurrenceKind,
  entry: EotcCalendarDatasetRow,
  eth: EthiopianDateParts,
): DatedOccurrence {
  const g = ethiopianPartsToGregorian(eth.year, eth.month, eth.day)
  const e = entry.entry
  return {
    kind,
    entryId: e.id,
    title: e.englishTitle?.trim() || e.title,
    titleAmharic: e.title,
    ethiopian: eth,
    ethiopianLabel: formatEthLabel(eth),
    gregorian: g,
    gregorianIso: toIsoLocalDate(g),
    gregorianLabel: formatGregorianLong(g),
    sourceCollection: entry.collection,
  }
}

/** Next civil day on or after `from` whose Ethiopian day-of-month equals `day`. */
export function nextMonthlyDayOnOrAfter(from: Date, day: number): DatedOccurrence | null {
  if (day < 1 || day > 30) return null
  const start = stripLocalCalendarDate(from)
  for (let i = 0; i < 40; i++) {
    const d = addDays(start, i)
    const eth = gregorianToEthiopian(d)
    const dim = daysInEthiopianMonth(eth.year, eth.month)
    if (day > dim) continue
    if (eth.day === day) {
      return {
        kind: 'monthly',
        entryId: `monthly-day-${day}`,
        title: `Monthly day ${day}`,
        ethiopian: eth,
        ethiopianLabel: formatEthLabel(eth),
        gregorian: d,
        gregorianIso: toIsoLocalDate(d),
        gregorianLabel: formatGregorianLong(d),
        sourceCollection: 'computed',
      }
    }
  }
  return null
}

/** Next occurrence of a fixed Eth month/day on or after `from`. */
export function nextFixedEthDateOnOrAfter(
  from: Date,
  ethMonth: number,
  ethDay: number,
): { eth: EthiopianDateParts; gregorian: Date } | null {
  if (ethMonth < 1 || ethMonth > 13 || ethDay < 1 || ethDay > 30) return null
  const start = stripLocalCalendarDate(from)
  const eth0 = gregorianToEthiopian(start)
  for (let year = eth0.year; year <= eth0.year + 2; year++) {
    const dim = daysInEthiopianMonth(year, ethMonth)
    if (ethDay > dim) continue
    const g = ethiopianPartsToGregorian(year, ethMonth, ethDay)
    // Strict on-or-after: never return a past civil day as "next".
    if (g.getTime() >= start.getTime()) {
      return { eth: { year, month: ethMonth, day: ethDay }, gregorian: g }
    }
  }
  return null
}

function scoreEntryForSubject(entry: EotcCalendarDatasetRow, subject: string): number {
  const e = entry.entry
  const blob = [
    e.id,
    e.title,
    e.englishTitle,
    e.transliterationTitle,
    ...(e.searchKeywords || []),
  ]
    .filter(Boolean)
    .join(' ')
    .toLowerCase()
  const sub = subject.toLowerCase().trim()
  if (!sub) return 0
  let score = 0
  if (blob.includes(sub)) score += 10
  for (const token of sub.split(/\s+/).filter((t) => t.length > 2)) {
    if (blob.includes(token)) score += 3
  }
  // Prefer commemorations / fixed feasts / fasts over weekly noise.
  if (e.date.kind === 'monthly-recurring') score += 1
  if (e.date.kind === 'fixed') score += 1
  if (e.date.kind === 'season') score += 1
  return score
}

const SUBJECT_ALIASES: Array<{ match: RegExp; subject: string }> = [
  { match: /\b(st\.?\s*)?michael\b|mikael|ሚካኤል/i, subject: 'michael' },
  { match: /\b(st\.?\s*)?gabriel\b|ገብርኤል/i, subject: 'gabriel' },
  { match: /\b(st\.?\s*)?raphael\b|ራፋኤል/i, subject: 'raphael' },
  { match: /\b(st\.?\s*)?uriel\b|ዑራኤል/i, subject: 'uriel' },
  { match: /\bmary\b|mariam|ማርያም|theotokos|filseta|ፍልሰታ/i, subject: 'mary' },
  { match: /\b(st\.?\s*)?george\b|georgios|ጊዮርጊስ/i, subject: 'georgios' },
  { match: /\byared\b|ያሬድ/i, subject: 'yared' },
  { match: /\btekle\s*haymanot\b|ተክለ\s*ሃይማኖት/i, subject: 'tekle haymanot' },
  { match: /\bjohn\s+the\s+baptist\b|መጥምቅ/i, subject: 'john the baptist' },
  { match: /\b(st\.?\s*)?stephen\b|estifanos|እስጢፋኖስ/i, subject: 'estifanos' },
  {
    match: /\bprophets?\s+fast\b|\badvent\s+fast\b|tsome\s+nebiyat|ጾመ\s*ነቢያት/i,
    subject: 'prophets',
  },
  { match: /\bapostles?\s+fast\b|tsome\s+hawariat|ጾመ\s*ሐዋርያት/i, subject: 'apostles' },
  { match: /\bdormition\s+fast\b|tsome\s+filseta|ጾመ\s*ፍልሰታ/i, subject: 'dormition fast' },
]

/** True for “when is the next …”, upcoming feast/fast, Amharic መቼ / ቀጣይ. */
export function isNextOccurrenceQuery(query: string): boolean {
  const q = (query || '').toLowerCase()
  if (!q) return false
  if (
    /\b(next|upcoming|coming)\b/.test(q) &&
    /\b(commemoration|feast|observance|memorial|fast(?:ing)?|saint|day|event)\b/.test(q)
  ) {
    return true
  }
  if (
    /\bwhen\s+(is|does|will)\b/.test(q) &&
    /\b(commemoration|feast|observance|fast(?:ing)?|saint|michael|gabriel|mary|georgios|george)\b/i.test(
      q,
    )
  ) {
    return true
  }
  if (q.includes('መቼ') || q.includes('ቀጣይ') || q.includes('የሚመጣው') || q.includes('መጪው')) {
    return true
  }
  return false
}

function stripQueryToSubjectTokens(query: string): string {
  const withoutEthiopicStop = (query || '')
    .replace(/መቼ|ቀጣይ|የሚመጣው|መጪው|ነው|የ|ለ|ስለ|በዓል|መታሰቢያ|ጾም|ቅዱስ/g, ' ')
  return withoutEthiopicStop
    .replace(/[^\p{L}\p{N}\s]/gu, ' ')
    .split(/\s+/)
    .map((t) => t.trim())
    .filter((t) => t.length > 1 && !QUERY_STOPWORDS.has(t.toLowerCase()))
    .join(' ')
    .trim()
}

/**
 * Resolve a subject string for dataset matching.
 * Prefers known saint/fast aliases; otherwise uses remaining query tokens.
 */
export function detectCommemorationSubject(query: string): string | null {
  const q = (query || '').trim()
  if (!q) return null
  for (const row of SUBJECT_ALIASES) {
    if (row.match.test(q)) return row.subject
  }
  const tokens = stripQueryToSubjectTokens(q)
  return tokens.length >= 2 ? tokens : null
}

function rowsForSubject(subject: string, rows: readonly EotcCalendarDatasetRow[]) {
  return [...rows]
    .map((r) => ({ row: r, score: scoreEntryForSubject(r, subject) }))
    .filter((x) => x.score >= 10)
    .sort((a, b) => b.score - a.score)
    .map((x) => x.row)
}

function abstention(
  ref: Date,
  refEth: EthiopianDateParts,
  subject: string | null,
  preferAmharic: boolean,
): NextCommemorationAbstention {
  const en =
    'I do not have a verified date for that in the TewahedoDaily church calendar dataset, so I will not guess. ' +
    `Reference date: ${formatGregorianLong(ref)} (${formatEthLabel(refEth)}).`
  const am =
    'በተረጋገጠ የቤተ ክርስቲያን የቀን መቁጠሪያ መረጃ ውስጥ ለዚህ ጥያቄ ቀን አላገኘሁም፤ ስለዚህ አልገምትም። ' +
    `የማጣቀሻ ቀን፦ ${formatGregorianLong(ref)} (${formatEthLabel(refEth)})።`
  return {
    querySubject: subject,
    referenceGregorianIso: toIsoLocalDate(ref),
    referenceEthiopianLabel: formatEthLabel(refEth),
    answerEnglish: en,
    answerAmharic: preferAmharic ? am : en,
    verified: true,
    found: false,
  }
}

/**
 * Resolve next monthly / annual / fast-start occurrences from the EOTC dataset.
 * Always returns a result for next-occurrence-shaped queries (answer or abstention).
 */
export function resolveNextCommemoration(
  query: string,
  referenceDate: Date = new Date(),
  rows: readonly EotcCalendarDatasetRow[] = EOTC_TAGGED_ENTRIES,
): NextCommemorationResult | null {
  if (!isNextOccurrenceQuery(query)) return null

  const ref = stripLocalCalendarDate(referenceDate)
  const refEth = gregorianToEthiopian(ref)
  const preferAmharic = /[\u1200-\u137f]/.test(query)
  const subject = detectCommemorationSubject(query)

  if (!subject) {
    return abstention(ref, refEth, null, preferAmharic)
  }

  const matched = rowsForSubject(subject, rows)
  if (!matched.length) {
    return abstention(ref, refEth, subject, preferAmharic)
  }

  let monthly: DatedOccurrence | null = null
  const annuals: DatedOccurrence[] = []
  const fastStarts: DatedOccurrence[] = []

  for (const row of matched) {
    const d = row.entry.date
    if (d.kind === 'monthly-recurring' && typeof d.monthlyRecurringDay === 'number') {
      const next = nextMonthlyDayOnOrAfter(ref, d.monthlyRecurringDay)
      if (next) {
        // Keep the earliest monthly if multiple match (unusual).
        const candidate: DatedOccurrence = {
          ...next,
          entryId: row.entry.id,
          title: row.entry.englishTitle?.trim() || row.entry.title,
          titleAmharic: row.entry.title,
          sourceCollection: row.collection,
        }
        if (!monthly || candidate.gregorian.getTime() < monthly.gregorian.getTime()) {
          monthly = candidate
        }
      }
    }
    if (d.kind === 'fixed') {
      const month =
        typeof d.ethiopianMonth === 'number'
          ? d.ethiopianMonth
          : ethMonthFromEnglishName(String(d.ethiopianMonth || ''))
      const day = typeof d.ethiopianDay === 'number' ? d.ethiopianDay : null
      if (month && day) {
        const n = nextFixedEthDateOnOrAfter(ref, month, day)
        if (n) annuals.push(occurrenceFromParts('annual_fixed', row, n.eth))
      }
    }
    if (d.kind === 'season' && d.seasonRange?.startFixed) {
      const sf = d.seasonRange.startFixed
      const month =
        typeof sf.ethiopianMonth === 'number'
          ? sf.ethiopianMonth
          : ethMonthFromEnglishName(String(sf.ethiopianMonth || ''))
      const day = typeof sf.ethiopianDay === 'number' ? sf.ethiopianDay : null
      if (month && day) {
        const n = nextFixedEthDateOnOrAfter(ref, month, day)
        if (n) fastStarts.push(occurrenceFromParts('fast_start', row, n.eth))
      }
    }
  }

  annuals.sort((a, b) => a.gregorian.getTime() - b.gregorian.getTime())
  fastStarts.sort((a, b) => a.gregorian.getTime() - b.gregorian.getTime())
  const nextAnnual = annuals[0] ?? null
  const otherAnnual = annuals.slice(1)
  const nextFast = fastStarts[0] ?? null

  if (!monthly && !nextAnnual && !nextFast) {
    return abstention(ref, refEth, subject, preferAmharic)
  }

  const title =
    monthly?.title ||
    nextAnnual?.title ||
    nextFast?.title ||
    matched[0]?.entry.englishTitle ||
    subject

  const linesEn: string[] = []
  if (monthly) {
    linesEn.push(
      `Next monthly ${monthly.title}: ${monthly.ethiopianLabel} — ${monthly.gregorianLabel}.`,
    )
  }
  if (nextAnnual) {
    const annualLabel =
      nextAnnual.sourceCollection === 'angels' || /major/i.test(nextAnnual.title)
        ? 'Next major annual feast'
        : 'Next annual feast'
    linesEn.push(
      `${annualLabel}: ${nextAnnual.title} on ${nextAnnual.ethiopianLabel} — ${nextAnnual.gregorianLabel}.`,
    )
  }
  if (nextFast) {
    linesEn.push(
      `Next fasting period begins: ${nextFast.title} on ${nextFast.ethiopianLabel} — ${nextFast.gregorianLabel}.`,
    )
  }
  for (const extra of otherAnnual) {
    linesEn.push(
      `Also recorded: ${extra.title} on ${extra.ethiopianLabel} — ${extra.gregorianLabel}.`,
    )
  }
  linesEn.push(
    `Reference date: ${formatGregorianLong(ref)} (${formatEthLabel(refEth)}).`,
  )
  linesEn.push(
    'Dates are calculated from the app calendar dataset (not model estimates).',
  )

  const linesAm: string[] = []
  const amTitle = monthly?.titleAmharic || nextAnnual?.titleAmharic || nextFast?.titleAmharic || title
  if (monthly) {
    linesAm.push(
      `ቀጣዩ ወርሃዊ የ${amTitle} መታሰቢያ፦ ${monthly.ethiopianLabel} — ${monthly.gregorianLabel}።`,
    )
  }
  if (nextAnnual) {
    linesAm.push(
      `ቀጣዩ ዓመታዊ በዓል፦ ${nextAnnual.ethiopianLabel} — ${nextAnnual.gregorianLabel}።`,
    )
  }
  if (nextFast) {
    linesAm.push(
      `ቀጣዩ ጾም ይጀምራል፦ ${nextFast.ethiopianLabel} — ${nextFast.gregorianLabel}።`,
    )
  }
  linesAm.push(
    `የማጣቀሻ ቀን፦ ${formatGregorianLong(ref)} (${formatEthLabel(refEth)})።`,
  )

  return {
    querySubject: subject,
    referenceGregorianIso: toIsoLocalDate(ref),
    referenceEthiopianLabel: formatEthLabel(refEth),
    monthly,
    nextAnnual,
    otherAnnual,
    answerEnglish: linesEn.join('\n'),
    answerAmharic: linesAm.join('\n'),
    verified: true,
    found: true,
  }
}

/** Exported for tests — Pagume length & leap boundary helpers. */
export function ethiopianMonthLength(ethYear: number, ethMonth: number): number {
  return daysInEthiopianMonth(ethYear, ethMonth)
}

export { formatEthLabel, formatEthiopianLong }
