/**
 * Human-readable calendar SOURCE rules for Admin.
 * Never invent Meskerem 1 — return "Needs review" when data is insufficient.
 */
import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'
import type { CalendarCardSourceType, LinkedCalendarSource } from './resolveCalendarCard'
import { normalizeSourceType } from './resolveCalendarCard'

function monthName(number?: number | null): string {
  if (number == null || number < 1 || number > 13) return ''
  return ETHIOPIAN_MONTH_NAMES[number - 1] || `Month ${number}`
}

function fixedDayLabel(month?: number | null, day?: number | null): string | null {
  if (day != null && day > 0 && month != null && month > 0) {
    return `${monthName(month)} ${day}`
  }
  if (day != null && day > 0 && (month == null || month <= 0)) {
    return `Day ${day} each month`
  }
  return null
}

/**
 * Format the authoritative date/rule for a linked structured source.
 * This is the SOURCE RULE (Admin), not a resolved Gregorian occurrence.
 */
export function formatCalendarSourceRule(
  sourceType: string | null | undefined,
  source: LinkedCalendarSource | null | undefined,
): string {
  const type = normalizeSourceType(sourceType)
  if (!source) {
    if (type === 'manual') return 'Manual date on card'
    return 'Needs review'
  }

  if (source.isMovable || (source.paschaOffsetDays != null && source.isMovable !== false && type !== 'monthly_commemoration')) {
    if (source.paschaOffsetDays != null) {
      const offset = source.paschaOffsetDays
      const offsetLabel =
        offset === 0 ? 'Pascha' : offset > 0 ? `Pascha + ${offset} days` : `Pascha − ${Math.abs(offset)} days`
      if (type === 'fast') return `Movable fast · ${offsetLabel}`
      if (type === 'season') return `Movable season · ${offsetLabel}`
      return `Movable · ${offsetLabel}`
    }
    if (source.rangeLabel?.trim()) return source.rangeLabel.trim()
    return 'Movable · calculated from Pascha'
  }

  if (type === 'monthly_commemoration' || source.isMonthly) {
    const day = source.ethiopianDay
    if (day != null && day > 0) return `Monthly · Day ${day}`
    if (source.rangeLabel?.trim()) return source.rangeLabel.trim()
    return 'Needs review'
  }

  if (type === 'fast' || type === 'season') {
    if (source.rangeLabel?.trim()) return source.rangeLabel.trim()
    const start = fixedDayLabel(source.ethiopianMonthNumber, source.ethiopianDay)
    if (start) return start
    return 'Needs review'
  }

  const fixed = fixedDayLabel(source.ethiopianMonthNumber, source.ethiopianDay)
  if (fixed) return fixed
  if (source.rangeLabel?.trim()) return source.rangeLabel.trim()
  return 'Needs review'
}

/** Prefer live source rule; never invent Meskerem 1 from empty card fields. */
export function formatCardDateRuleDisplay(options: {
  sourceType?: string | null
  linked?: LinkedCalendarSource | null
  cardMonth?: number | null
  cardDay?: number | null
  isMonthly?: boolean | null
}): string {
  const type = normalizeSourceType(options.sourceType) as CalendarCardSourceType
  if (type !== 'manual' && options.linked) {
    return formatCalendarSourceRule(type, options.linked)
  }
  if (type !== 'manual' && !options.linked) {
    return 'Needs review'
  }
  const month = options.cardMonth
  const day = options.cardDay
  if (options.isMonthly && day != null && day > 0) {
    return `Monthly · Day ${day}`
  }
  const fixed = fixedDayLabel(month, day)
  if (fixed) return fixed
  return 'Needs review'
}
