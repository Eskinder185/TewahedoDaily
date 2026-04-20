import { getEotcEntrySearchHaystack, normalizeEotcSearchQuery } from './eotcCalendarSearch'
import type { EotcCalendarDatasetRow } from './eotcTypes'

/** UI buckets for browse, filters, and placeholder styling. */
export type ObservanceGalleryBucket =
  | 'major-feast'
  | 'minor-feast'
  | 'fast'
  | 'mary'
  | 'angel'
  | 'saint'
  | 'apostle'
  | 'martyr'
  | 'prophet'
  | 'season'
  | 'weekly-observance'
  | 'movable'

export const OBSERVANCE_GALLERY_BUCKET_ORDER: readonly ObservanceGalleryBucket[] = [
  'major-feast',
  'minor-feast',
  'movable',
  'fast',
  'mary',
  'angel',
  'apostle',
  'martyr',
  'prophet',
  'saint',
  'weekly-observance',
  'season',
]

function hasCat(row: EotcCalendarDatasetRow, needle: string): boolean {
  const p = row.entry.category.primary
  const s = row.entry.category.secondary
  return p === needle || s.includes(needle)
}

/**
 * Primary bucket for grouping + filtering one row.
 * Apostle / martyr / prophet take precedence when present in primary or secondary.
 */
export function getObservanceGalleryBucket(row: EotcCalendarDatasetRow): ObservanceGalleryBucket {
  const kind = row.entry.date.kind
  if (kind === 'weekly-recurring') return 'weekly-observance'
  if (kind === 'season') return 'season'
  if (kind === 'movable') return 'movable'

  if (hasCat(row, 'prophet')) return 'prophet'
  if (hasCat(row, 'apostle')) return 'apostle'
  if (hasCat(row, 'martyr')) return 'martyr'

  const p = row.entry.category.primary
  if (p === 'major-feast') return 'major-feast'
  if (p === 'minor-feast') return 'minor-feast'
  if (p === 'fast') return 'fast'
  if (p === 'mary') return 'mary'
  if (p === 'angel') return 'angel'
  if (p === 'saint') return 'saint'
  return 'saint'
}

/** Visual placeholder lane — collapses apostle/martyr/prophet into themed groups. */
export type ObservancePlaceholderVisual =
  | 'feastMajor'
  | 'feastMinor'
  | 'fast'
  | 'mary'
  | 'angel'
  | 'saintWarm'
  | 'apostle'
  | 'martyr'
  | 'prophet'
  | 'season'
  | 'weekly'
  | 'movable'

export function galleryBucketToPlaceholderVisual(
  bucket: ObservanceGalleryBucket,
): ObservancePlaceholderVisual {
  switch (bucket) {
    case 'major-feast':
      return 'feastMajor'
    case 'minor-feast':
      return 'feastMinor'
    case 'fast':
      return 'fast'
    case 'mary':
      return 'mary'
    case 'angel':
      return 'angel'
    case 'saint':
      return 'saintWarm'
    case 'apostle':
      return 'apostle'
    case 'martyr':
      return 'martyr'
    case 'prophet':
      return 'prophet'
    case 'season':
      return 'season'
    case 'weekly-observance':
      return 'weekly'
    case 'movable':
      return 'movable'
    default:
      return 'saintWarm'
  }
}

export function formatEntryDateHint(row: EotcCalendarDatasetRow): string {
  const e = row.entry
  const d = e.date
  if (d.kind === 'fixed' && d.ethiopianMonth && d.ethiopianDay != null) {
    return `${d.ethiopianMonth} ${d.ethiopianDay} (Ethiopian)`
  }
  if (d.gregorianHint?.trim()) return d.gregorianHint.trim()
  if (d.kind === 'movable') {
    const anchor = d.movableAnchor?.trim()
    const off = d.offsetFromAnchor
    if (anchor && off != null) return `Movable · ${anchor} ${off >= 0 ? '+' : ''}${off}d`
    return 'Movable (Paschal cycle)'
  }
  if (d.kind === 'monthly-recurring' && d.monthlyRecurringDay != null) {
    return `Monthly · day ${d.monthlyRecurringDay}`
  }
  if (d.kind === 'weekly-recurring' && d.weeklyRecurringDay) {
    return `Each ${d.weeklyRecurringDay}`
  }
  if (d.kind === 'season') return 'Seasonal period'
  return 'Date varies — confirm with parish'
}

export function formatObservanceStateLabel(row: EotcCalendarDatasetRow): string {
  const fs = row.entry.observance.fastStatus
  const k = row.entry.date.kind
  if (fs === 'fast') return 'Fast'
  if (fs === 'feast') return 'Feast'
  if (fs === 'commemoration') return 'Commemoration'
  return k === 'season' ? 'Season' : 'Observance'
}

function tokenize(normalized: string): string[] {
  if (!normalized) return []
  return normalized.split(' ').filter(Boolean)
}

export type GalleryBrowseFilter = ObservanceGalleryBucket | 'all'

export function filterGalleryRows(
  rows: readonly EotcCalendarDatasetRow[],
  query: string,
  filter: GalleryBrowseFilter,
): EotcCalendarDatasetRow[] {
  const nq = normalizeEotcSearchQuery(query)
  const tokens = tokenize(nq)

  let out = [...rows]
  if (tokens.length > 0) {
    out = out.filter((row) => {
      const hay = getEotcEntrySearchHaystack(row)
      return tokens.every((t) => hay.includes(t))
    })
  }
  if (filter !== 'all') {
    out = out.filter((r) => getObservanceGalleryBucket(r) === filter)
  }

  out.sort((a, b) => {
    const pa = a.entry.display.priority
    const pb = b.entry.display.priority
    if (pa !== pb) return pa - pb
    const ta = (a.entry.englishTitle ?? a.entry.title).toLowerCase()
    const tb = (b.entry.englishTitle ?? b.entry.title).toLowerCase()
    return ta.localeCompare(tb, undefined, { sensitivity: 'base' })
  })

  return out
}

export function partitionRowsByBucket(
  rows: readonly EotcCalendarDatasetRow[],
): Map<ObservanceGalleryBucket, EotcCalendarDatasetRow[]> {
  const map = new Map<ObservanceGalleryBucket, EotcCalendarDatasetRow[]>()
  for (const b of OBSERVANCE_GALLERY_BUCKET_ORDER) map.set(b, [])
  for (const row of rows) {
    const b = getObservanceGalleryBucket(row)
    map.get(b)?.push(row)
  }
  return map
}

export function getFeaturedRows(
  rows: readonly EotcCalendarDatasetRow[],
): EotcCalendarDatasetRow[] {
  return rows
    .filter((r) => r.entry.display.featured || r.entry.category.majorHoliday)
    .sort(
      (a, b) =>
        a.entry.display.priority - b.entry.display.priority ||
        (a.entry.englishTitle ?? a.entry.title).localeCompare(
          b.entry.englishTitle ?? b.entry.title,
          undefined,
          { sensitivity: 'base' },
        ),
    )
}
