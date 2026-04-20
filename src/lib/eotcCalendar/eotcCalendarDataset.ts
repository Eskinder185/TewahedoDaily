import type {
  EotcCalendarCollectionFile,
  EotcCalendarConfigFile,
  EotcCalendarDatasetRow,
  EotcCalendarIndexFile,
} from './eotcTypes'

import calendarConfig from '../../data/eotc_calendar_json/calendar.config.json'
import calendarIndex from '../../data/eotc_calendar_json/calendar.index.json'
import fixedFeasts from '../../data/eotc_calendar_json/fixed-feasts.json'
import paschalCycle from '../../data/eotc_calendar_json/paschal-cycle.json'
import fasts from '../../data/eotc_calendar_json/fasts.json'
import mary from '../../data/eotc_calendar_json/mary.json'
import angels from '../../data/eotc_calendar_json/angels.json'
import majorSaints from '../../data/eotc_calendar_json/major-saints.json'
import monthlyCommemorations from '../../data/eotc_calendar_json/monthly-commemorations.json'
import weeklyObservances from '../../data/eotc_calendar_json/weekly-observances.json'
import liturgicalSeasons from '../../data/eotc_calendar_json/liturgical-seasons.json'

const CALENDAR_CONFIG = calendarConfig as EotcCalendarConfigFile
const CALENDAR_INDEX = calendarIndex as EotcCalendarIndexFile

const COLLECTION_FILES: EotcCalendarCollectionFile[] = [
  fixedFeasts as EotcCalendarCollectionFile,
  paschalCycle as EotcCalendarCollectionFile,
  fasts as EotcCalendarCollectionFile,
  mary as EotcCalendarCollectionFile,
  angels as EotcCalendarCollectionFile,
  majorSaints as EotcCalendarCollectionFile,
  monthlyCommemorations as EotcCalendarCollectionFile,
  weeklyObservances as EotcCalendarCollectionFile,
  liturgicalSeasons as EotcCalendarCollectionFile,
]

function buildDatasetRows(): EotcCalendarDatasetRow[] {
  return COLLECTION_FILES.flatMap((file) =>
    file.entries.map((entry) => ({
      collection: file.name,
      entry,
    })),
  )
}

const DATASET_ROWS: readonly EotcCalendarDatasetRow[] =
  Object.freeze(buildDatasetRows()) as readonly EotcCalendarDatasetRow[]

const BY_ID = new Map<string, EotcCalendarDatasetRow>()
for (const row of DATASET_ROWS) {
  if (!BY_ID.has(row.entry.id)) BY_ID.set(row.entry.id, row)
}

/** Static bundle: every entry with its collection name (used by liturgical resolvers). */
export const EOTC_TAGGED_ENTRIES: readonly EotcCalendarDatasetRow[] = DATASET_ROWS

export function getCalendarConfig(): EotcCalendarConfigFile {
  return CALENDAR_CONFIG
}

export function getCalendarIndex(): EotcCalendarIndexFile {
  return CALENDAR_INDEX
}

/** All calendar entries from all collection JSON files, each tagged with `collection`. */
export function getAllCalendarEntries(): readonly EotcCalendarDatasetRow[] {
  return DATASET_ROWS
}

/** First occurrence wins if duplicate `id` ever appears across files. */
export function getEntryById(id: string): EotcCalendarDatasetRow | undefined {
  return BY_ID.get(id)
}

/**
 * Entries whose `category.primary` equals `category`, or whose `category.secondary`
 * includes it (e.g. `"paschal-cycle"`, `"fast"`).
 */
export function getEntriesByCategory(category: string): EotcCalendarDatasetRow[] {
  const needle = category.trim()
  if (!needle) return []
  return DATASET_ROWS.filter(
    (row) =>
      row.entry.category.primary === needle ||
      row.entry.category.secondary.includes(needle),
  )
}

/** Entries with `display.featured === true`, stable collection file order then file order. */
export function getFeaturedEntries(): EotcCalendarDatasetRow[] {
  return DATASET_ROWS.filter((row) => row.entry.display.featured)
}
