import { getEotcPanelTier, sortEotcEntriesForCalendarPanel } from './eotcCalendarPanelOrdering'
import type { EotcCalendarDatasetRow } from './eotcTypes'

/** Consecutive rows sharing the same panel tier (for grouped headings). */
export type EotcSecondaryTierGroup = {
  tier: number
  rows: EotcCalendarDatasetRow[]
}

/** Primary narrative fields from the dataset `summary` object. */
export type PrimaryObservanceStory = {
  short?: string
  why?: string
  connection?: string
}

/**
 * Grouped display model for the calendar selected-day panel.
 * Primary = first row after feast/fast priority sort; secondary = remainder grouped by tier bands.
 */
export type SelectedDayObservanceModel = {
  sortedRows: EotcCalendarDatasetRow[]
  primary: EotcCalendarDatasetRow | null
  primaryStory: PrimaryObservanceStory | null
  secondaryGroups: EotcSecondaryTierGroup[]
  secondaryCount: number
  /** Distinct panel tiers present in secondary rows (sorted), for compact summary lines. */
  secondaryTierIds: readonly number[]
}

function groupConsecutiveByTier(rows: EotcCalendarDatasetRow[]): EotcSecondaryTierGroup[] {
  if (rows.length === 0) return []
  const groups: EotcSecondaryTierGroup[] = []
  let curTier = getEotcPanelTier(rows[0])
  let cur: EotcCalendarDatasetRow[] = [rows[0]]
  for (let i = 1; i < rows.length; i++) {
    const row = rows[i]
    const tier = getEotcPanelTier(row)
    if (tier === curTier) cur.push(row)
    else {
      groups.push({ tier: curTier, rows: cur })
      curTier = tier
      cur = [row]
    }
  }
  groups.push({ tier: curTier, rows: cur })
  return groups
}

function buildPrimaryStory(row: EotcCalendarDatasetRow): PrimaryObservanceStory | null {
  const s = row.entry.summary
  const short = s.short?.trim()
  const why = s.whyItMatters?.trim()
  const conn = s.connection?.trim()
  if (!short && !why && !conn) return null
  return { short, why, connection: conn }
}

/** Build the grouped observance model from raw same-day EOTC rows (any order). */
export function buildSelectedDayObservanceModel(
  rows: readonly EotcCalendarDatasetRow[],
): SelectedDayObservanceModel {
  const sortedRows = sortEotcEntriesForCalendarPanel(rows)
  const primary = sortedRows[0] ?? null
  const primaryStory = primary ? buildPrimaryStory(primary) : null
  const secondary = sortedRows.slice(1)
  const secondaryGroups = groupConsecutiveByTier(secondary)
  const secondaryTierIds = [...new Set(secondary.map((r) => getEotcPanelTier(r)))].sort(
    (a, b) => a - b,
  )
  return {
    sortedRows,
    primary,
    primaryStory,
    secondaryGroups,
    secondaryCount: secondary.length,
    secondaryTierIds,
  }
}
