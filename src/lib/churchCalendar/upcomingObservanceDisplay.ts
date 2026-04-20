import type { UpcomingObservance } from './types'

const MONTH_NAMES = [
  'january',
  'february',
  'march',
  'april',
  'may',
  'june',
  'july',
  'august',
  'september',
  'october',
  'november',
  'december',
] as const

const MONTH_ABBR = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'] as const

function stripConfirmSuffix(s: string): string {
  return s.replace(/\s*—\s*confirm.*$/i, '').replace(/\s*confirm.*$/i, '').trim()
}

/** Parse `YYYY-MM-DD` as local calendar midnight (sorting / display). */
export function parseGregorianAnchorIso(iso: string): Date | null {
  const t = iso.trim()
  const p = t.split('-').map((x) => Number.parseInt(x, 10))
  if (p.length !== 3 || p.some((n) => Number.isNaN(n))) return null
  const [y, m, d] = p
  if (m < 1 || m > 12 || d < 1 || d > 31) return null
  const dt = new Date(y, m - 1, d)
  if (dt.getFullYear() !== y || dt.getMonth() !== m - 1 || dt.getDate() !== d) return null
  return dt
}

/** Compact civil label, e.g. `Jan 19`. */
export function formatCivilMonthDayFromIso(iso: string): string | null {
  const d = parseGregorianAnchorIso(iso)
  if (!d) return null
  return `${MONTH_ABBR[d.getMonth()]} ${d.getDate()}`
}

/** First `Mon d` or `January d` token in a free string (e.g. "Near Jan 19"). */
function parseFirstMonthDayInText(s: string): Date | null {
  const cleaned = stripConfirmSuffix(s)
  const y = new Date().getFullYear()
  for (let mi = 0; mi < 12; mi++) {
    const ab = MONTH_ABBR[mi]
    const r = new RegExp(`\\b${ab}\\.?\\s+(\\d{1,2})\\b`, 'i')
    const m = cleaned.match(r)
    if (m) {
      const day = Number.parseInt(m[1], 10)
      if (day < 1 || day > 31) continue
      const dt = new Date(y, mi, day)
      if (dt.getMonth() === mi && dt.getDate() === day) return dt
    }
  }
  for (let mi = 0; mi < 12; mi++) {
    const name = MONTH_NAMES[mi]
    const r = new RegExp(`\\b${name}\\s+(\\d{1,2})\\b`, 'i')
    const m = cleaned.match(r)
    if (m) {
      const day = Number.parseInt(m[1], 10)
      if (day < 1 || day > 31) continue
      const dt = new Date(y, mi, day)
      if (dt.getMonth() === mi && dt.getDate() === day) return dt
    }
  }
  return null
}

function parseLateMonth(s: string): Date | null {
  const t = stripConfirmSuffix(s).toLowerCase()
  const late = t.match(/late\s+(jan|feb|mar|apr|may|jun|jul|aug|sep|sept|oct|nov|dec)/i)
  if (!late) return null
  const map: Record<string, number> = {
    jan: 0,
    feb: 1,
    mar: 2,
    apr: 3,
    may: 4,
    jun: 5,
    jul: 6,
    aug: 7,
    sep: 8,
    sept: 8,
    oct: 9,
    nov: 10,
    dec: 11,
  }
  const mi = map[late[1].toLowerCase()]
  if (mi === undefined) return null
  const y = new Date().getFullYear()
  return new Date(y, mi, 22)
}

/** Monotonic sort key: exact anchor → inferred civil mention → late-month → end bucket for browse-only rows. */
export function upcomingObservanceSortKey(item: UpcomingObservance, isCompanion: boolean): number {
  const iso = item.gregorianAnchorIso?.trim()
  if (iso) {
    const d = parseGregorianAnchorIso(iso)
    if (d) return d.getTime()
  }
  const greg = item.dateGregorian?.trim()
  if (greg) {
    const fromLoose = parseFirstMonthDayInText(greg)
    if (fromLoose) return fromLoose.getTime()
    const late = parseLateMonth(greg)
    if (late) return late.getTime()
  }
  if (isCompanion) return Number.MAX_SAFE_INTEGER - 10_000
  return Number.MAX_SAFE_INTEGER - 500_000
}

/** Collapse extended EOTC kinds onto the three visual buckets used by CSS. */
export function upcomingObservanceVisualBucket(
  kind: UpcomingObservance['kind'],
): 'feast' | 'fast' | 'commemoration' {
  if (kind === 'feast' || kind === 'season') return 'feast'
  if (kind === 'fast' || kind === 'weekly') return 'fast'
  return 'commemoration'
}

export function simpleObservanceKindLabel(kind: UpcomingObservance['kind']): string {
  switch (kind) {
    case 'feast':
      return 'Feast'
    case 'season':
      return 'Season'
    case 'fast':
    case 'weekly':
      return 'Fast'
    case 'marian':
      return 'Mary'
    case 'angel':
      return 'Angel'
    case 'saint':
      return 'Saint'
    case 'commemoration':
    default:
      return 'Saint'
  }
}

export type ObservanceCardDates = {
  /** Main line on the card (civil short date or best window text). */
  primary: string
  /** Ethiopian / extra timing (compact). */
  secondary?: string
  /** True when `gregorianAnchorIso` parses as a real civil day. */
  hasExactCivilAnchor: boolean
}

/**
 * Card-facing dates: prefer parsed civil anchor; otherwise clear windows from catalog copy
 * (movable fasts, “Late Aug”, monthly rhythms, etc.).
 */
export function buildObservanceCardDates(item: UpcomingObservance): ObservanceCardDates {
  const iso = item.gregorianAnchorIso?.trim()
  const hintRaw = item.dateGregorian?.trim()
  const hint = hintRaw ? stripConfirmSuffix(hintRaw) : ''
  const ethRaw = item.dateEthiopian?.trim()
  const ethCompact = ethRaw
    ? ethRaw.replace(/\s*\(approx\.?\)\s*/gi, ' approx.').replace(/\s+/g, ' ').trim()
    : ''

  if (iso) {
    const civil = formatCivilMonthDayFromIso(iso)
    if (civil) {
      const secondaryParts: string[] = []
      if (ethCompact && ethCompact.length <= 56) secondaryParts.push(ethCompact)
      if (
        hint &&
        hint.length > 0 &&
        !civilMatchesHint(civil, hint) &&
        !hintLooksRedundant(hint, civil)
      ) {
        secondaryParts.unshift(hint)
      }
      const secondary = secondaryParts.length
        ? secondaryParts.filter((v, i, a) => a.indexOf(v) === i).join(' · ')
        : undefined
      return { primary: civil, secondary, hasExactCivilAnchor: true }
    }
  }

  const primary = hint || ethCompact || 'Timing varies'
  const secondary =
    ethCompact && hint && ethCompact !== hint && primary !== ethCompact ? ethCompact : undefined
  return { primary, secondary, hasExactCivilAnchor: false }
}

function civilMatchesHint(civil: string, hint: string): boolean {
  const h = hint.toLowerCase()
  const [mon, dayStr] = civil.split(' ')
  const day = Number.parseInt(dayStr ?? '', 10)
  const mi = MONTH_ABBR.findIndex((x) => x === mon)
  if (mi < 0 || Number.isNaN(day)) return false
  const monthName = MONTH_NAMES[mi]
  return (
    h.includes(`${monthName} ${day}`) ||
    h.includes(`${MONTH_ABBR[mi].toLowerCase()} ${day}`) ||
    h.includes(`${mon.toLowerCase()} ${day}`)
  )
}

function hintLooksRedundant(hint: string, civil: string): boolean {
  const compact = hint.replace(/\s+/g, ' ').trim()
  return compact.length < 4 || compact.toLowerCase() === civil.toLowerCase()
}
