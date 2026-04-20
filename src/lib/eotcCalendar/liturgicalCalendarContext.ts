import { gregorianToEthiopian, type EthiopianDateParts } from '../ethiopianDate'
import { addDays, resolvePaschaGregorianDate } from '../churchCalendar/pascha'

/**
 * ## Liturgical calendar context (Bahre Hasab stand-in)
 *
 * Full **Bahre Hasab** (Ethiopian computus) is not implemented here. Instead this module
 * exposes a small, replaceable surface that maps civil dates to the anchors the EOTC
 * JSON uses (`calendar.config.json` → `movableAnchors`).
 *
 * **Current assumptions (explicit, so they can be swapped later):**
 *
 * 1. **Fasika (Pascha)** — Gregorian date comes from `paschaGregorianTable.ts` for the
 *    civil year of the selected day, with ±1 year fallbacks when the table is missing.
 * 2. **Named anchors** — Derived from that Pascha with fixed Gregorian offsets that match
 *    the bundled EOTC `paschal-cycle.json` (Nineveh Monday = Pascha − 69 days; Ābiy Tsom
 *    Monday = Pascha − 55; Hosanna = Pascha − 7; …). This matches the dataset’s
 *    “offset from Fast of Nineveh” chain when the anchor is `nineveh-fast`.
 * 3. **Ethiopian civil date** — `gregorianToEthiopian` (Beyene–Kudlek / JDN) as elsewhere
 *    in the app; used for `fixed`, `monthly-recurring`, and fixed `season` windows.
 *
 * When a proper Bahre Hasab implementation exists, replace `resolvePaschaForLocalCivilDay`
 * and/or `anchorToGregorian` behind the same exports; callers (`getEntriesForDate`, UI
 * merge layer) should import only from `eotcDateResolution` / this file, not hard-code
 * offsets in components.
 */

export type LiturgicalCalendarContext = {
  /** Local midnight–normalized civil day under test. */
  selectedDate: Date
  /** Ethiopian calendar parts for `selectedDate` (app standard conversion). */
  ethiopian: EthiopianDateParts
  /**
   * Gregorian Fasika for the Paschal year used to interpret `selectedDate`, or null if
   * the table does not cover the resolved civil year(s).
   */
  pascha: Date | null
}

export function stripLocalCalendarDate(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

/**
 * Pascha for the given civil day: try the day’s year, then previous and next Gregorian
 * year (covers edge cases around calendar year vs liturgical year boundaries).
 */
export function resolvePaschaForLocalCivilDay(d: Date): Date | null {
  const y = d.getFullYear()
  return (
    resolvePaschaGregorianDate(y) ??
    resolvePaschaGregorianDate(y - 1) ??
    resolvePaschaGregorianDate(y + 1)
  )
}

/**
 * Map a named movable anchor to a Gregorian **local civil** date for the given Pascha.
 * Offsets are aligned with the current EOTC bundle (Nineveh Monday anchor at Pascha−69).
 */
export function anchorToGregorian(anchor: string, pascha: Date): Date | null {
  switch (anchor) {
    case 'nineveh-fast':
      return addDays(pascha, -69)
    case 'great-lent':
      return addDays(pascha, -55)
    case 'hosanna':
      return addDays(pascha, -7)
    case 'good-friday':
      return addDays(pascha, -2)
    case 'fasika':
      return pascha
    case 'ascension':
      return addDays(pascha, 39)
    case 'pentecost':
      return addDays(pascha, 49)
    default:
      return null
  }
}

export function buildLiturgicalCalendarContext(
  selectedDate: Date,
): LiturgicalCalendarContext {
  const selected = stripLocalCalendarDate(selectedDate)
  return {
    selectedDate: selected,
    ethiopian: gregorianToEthiopian(selected),
    pascha: resolvePaschaForLocalCivilDay(selected),
  }
}
