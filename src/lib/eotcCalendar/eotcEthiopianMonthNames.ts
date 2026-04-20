import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'

const MONTH_BY_ENGLISH = new Map(
  ETHIOPIAN_MONTH_NAMES.map((n, i) => [n.toLowerCase(), i + 1]),
)

/** Map English month name from JSON (e.g. `Megabit`) to 1-based Ethiopian month index. */
export function ethMonthFromEnglishName(
  name: string | null | undefined,
): number | null {
  if (!name) return null
  return MONTH_BY_ENGLISH.get(name.trim().toLowerCase()) ?? null
}
