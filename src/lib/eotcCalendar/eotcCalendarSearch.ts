import { getAllCalendarEntries } from './eotcCalendarDataset'
import type { EotcCalendarDatasetRow } from './eotcTypes'

/** UI / filter bucket ids aligned with `category.primary` and `date.kind` in the JSON. */
export type EotcContentCategoryFilter =
  | 'major-feast'
  | 'fast'
  | 'mary'
  | 'angel'
  | 'saint'
  | 'season'
  | 'weekly-observance'

export const EOTC_CONTENT_CATEGORY_FILTERS: readonly EotcContentCategoryFilter[] = [
  'major-feast',
  'fast',
  'mary',
  'angel',
  'saint',
  'season',
  'weekly-observance',
] as const

export const DEFAULT_MAX_EOTC_SEARCH_RESULTS = 80

const ALL_ROWS = getAllCalendarEntries()

/** Lowercased, single-spaced search blob per row (title + english + translit + keywords). */
const SEARCH_HAYSTACK: readonly string[] = ALL_ROWS.map((row) => buildSearchHaystack(row))

function buildSearchHaystack(row: EotcCalendarDatasetRow): string {
  const e = row.entry
  const parts: string[] = [e.title, e.englishTitle ?? '', e.transliterationTitle ?? '']
  if (e.searchKeywords?.length) parts.push(...e.searchKeywords)
  return normalizeEotcSearchQuery(parts.join(' '))
}

/** Normalize free-text for case- and whitespace-insensitive substring search. */
export function normalizeEotcSearchQuery(raw: string): string {
  return raw
    .trim()
    .toLowerCase()
    .replace(/\s+/g, ' ')
}

function tokenizeQuery(normalized: string): string[] {
  if (!normalized) return []
  return normalized.split(' ').filter((t) => t.length > 0)
}

function rowMatchesCategory(row: EotcCalendarDatasetRow, filter: EotcContentCategoryFilter): boolean {
  const { primary, secondary } = row.entry.category
  const kind = row.entry.date.kind
  const has = (cat: string) => primary === cat || secondary.includes(cat)

  switch (filter) {
    case 'major-feast':
      return has('major-feast')
    case 'fast':
      return has('fast')
    case 'mary':
      return has('mary')
    case 'angel':
      return has('angel')
    case 'saint':
      return has('saint') || has('martyr') || has('apostle')
    case 'season':
      return primary === 'season' || kind === 'season'
    case 'weekly-observance':
      return primary === 'weekly-observance' || kind === 'weekly-recurring'
    default:
      return false
  }
}

/** True if `filters` is empty, or the row matches at least one selected filter (OR). */
export function rowMatchesCategoryFilters(
  row: EotcCalendarDatasetRow,
  filters: readonly EotcContentCategoryFilter[],
): boolean {
  if (filters.length === 0) return true
  return filters.some((f) => rowMatchesCategory(row, f))
}

function rowMatchesTokens(rowIndex: number, tokens: readonly string[]): boolean {
  if (tokens.length === 0) return true
  const hay = SEARCH_HAYSTACK[rowIndex]
  return tokens.every((tok) => hay.includes(tok))
}

export type EotcCalendarSearchOptions = {
  /** Normalized internally; empty means “no text constraint” (use with category filters). */
  query: string
  /** If non-empty, a row must match at least one filter (OR). */
  categoryFilters?: readonly EotcContentCategoryFilter[]
  /** Cap on returned rows (default {@link DEFAULT_MAX_EOTC_SEARCH_RESULTS}). */
  maxResults?: number
}

/**
 * Search and filter the bundled EOTC calendar JSON (all collections).
 * - Text: every whitespace-separated token must appear as a substring in the row haystack (AND).
 * - Category: OR across selected filters; if none selected, no category constraint.
 * - If both query and filters are empty, returns an empty array.
 */
export function searchEotcCalendarEntries(options: EotcCalendarSearchOptions): EotcCalendarDatasetRow[] {
  const normalized = normalizeEotcSearchQuery(options.query)
  const tokens = tokenizeQuery(normalized)
  const filters = options.categoryFilters ?? []
  const cap = Math.min(options.maxResults ?? DEFAULT_MAX_EOTC_SEARCH_RESULTS, 500)

  if (tokens.length === 0 && filters.length === 0) return []

  const out: EotcCalendarDatasetRow[] = []
  for (let i = 0; i < ALL_ROWS.length; i++) {
    const row = ALL_ROWS[i]
    if (!rowMatchesCategoryFilters(row, filters)) continue
    if (!rowMatchesTokens(i, tokens)) continue
    out.push(row)
    if (out.length >= cap) break
  }
  return out
}

/** Haystack string for a row (same normalization as the bundled index). For custom row lists / tests. */
export function getEotcEntrySearchHaystack(row: EotcCalendarDatasetRow): string {
  return buildSearchHaystack(row)
}
