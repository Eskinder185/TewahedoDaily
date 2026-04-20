import type { EotcCalendarDatasetRow } from './eotcTypes'
import { getEntryById } from './eotcCalendarDataset'

/**
 * Display priority for `/calendar` selected-day EOTC list (lower = earlier).
 *
 * Tiers (aligned with product ordering):
 * 1 — Major feasts (`majorHoliday` + `major-feast`, including major movable feasts)
 * 2 — Major fasts
 * 3 — Major Marian days
 * 4 — Major angel / saint / martyr / apostle days
 * 5 — Other feasts, movables, and fixed observances not in 1–4
 * 6 — Monthly recurring commemorations
 * 7 — Weekly recurring observances
 * 8 — Season ranges
 */
export function getEotcPanelTier(row: EotcCalendarDatasetRow): number {
  const e = row.entry
  const p = e.category.primary
  const mh = e.category.majorHoliday
  const k = e.date.kind

  if (k === 'season') return 8
  if (k === 'weekly-recurring') return 7
  if (k === 'monthly-recurring') return 6

  if (mh && p === 'major-feast') return 1
  if (mh && p === 'fast') return 2
  if (mh && p === 'mary') return 3
  if (mh && (p === 'angel' || p === 'saint' || p === 'martyr' || p === 'apostle'))
    return 4

  return 5
}

function panelSortTuple(row: EotcCalendarDatasetRow): [number, number, string] {
  const tier = getEotcPanelTier(row)
  const pri = row.entry.display.priority
  const label = (row.entry.englishTitle ?? row.entry.title).toLowerCase()
  return [tier, pri, label]
}

/** Stable sort: tier → dataset `priority` → title. */
export function sortEotcEntriesForCalendarPanel(
  rows: readonly EotcCalendarDatasetRow[],
): EotcCalendarDatasetRow[] {
  return [...rows].sort((a, b) => {
    const [ta, pa, la] = panelSortTuple(a)
    const [tb, pb, lb] = panelSortTuple(b)
    if (ta !== tb) return ta - tb
    if (pa !== pb) return pa - pb
    return la.localeCompare(lb, undefined, { sensitivity: 'base' })
  })
}

const MAX_RELATED = 5

/** Human-readable related entry titles for the panel (falls back to id). */
export function formatRelatedEntryLabels(ids: readonly string[]): string {
  const labels = ids
    .slice(0, MAX_RELATED)
    .map((id) => {
      const row = getEntryById(id)
      if (!row) return id
      return row.entry.englishTitle?.trim() || row.entry.title
    })
  const extra = ids.length > MAX_RELATED ? ` (+${ids.length - MAX_RELATED} more)` : ''
  return labels.join(' · ') + extra
}
