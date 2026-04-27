import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'

const MONTH_BY_ENGLISH = new Map(
  ETHIOPIAN_MONTH_NAMES.map((n, i) => [n.toLowerCase(), i + 1]),
)

const MONTH_ALIASES: Record<string, number> = {
  teqemt: 2,
  tikimt: 2,
  hidar: 3,
  ter: 5,
  miyazia: 8,
  sene: 10,
  nehase: 12,
  nehassie: 12,
}

/** Map English month name from JSON (e.g. `Megabit`) to 1-based Ethiopian month index. */
export function ethMonthFromEnglishName(
  name: string | null | undefined,
): number | null {
  if (!name) return null
  const key = name.trim().toLowerCase()
  return MONTH_BY_ENGLISH.get(key) ?? MONTH_ALIASES[key] ?? null
}
