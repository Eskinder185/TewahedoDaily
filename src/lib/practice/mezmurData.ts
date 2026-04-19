import type { MezmurEntry } from '../../data/types/mezmur'
import { youtubeThumbnailUrl, youtubeWatchUrl } from '../../data/utils/youtube'
import { CHANT_WORKSHOP_MEZMUR_ENTRIES } from './chantWorkshopEntries'
import { mezmurEntryToMezmurItem } from './fromCanonical'

/**
 * Practice tab mezmur entries — only `data/chants/amharic-chants.json` + `english-mezmur-chants.json`.
 * Full Psalm text lives under Prayers (`tselot/mezmure-dawit`).
 *
 * Duplicate `id` values: **last row in the merged list wins** (so appended JSON edits and
 * `npm run normalize:*` rewrites override earlier copies). First-wins used to hide new rows
 * when the file accidentally contained two blocks with overlapping ids.
 */
function dedupeById(entries: MezmurEntry[]): MezmurEntry[] {
  const byId = new Map<string, MezmurEntry>()
  for (const e of entries) {
    byId.set(e.id, e)
  }
  if (import.meta.env.DEV && entries.length > byId.size) {
    const counts = new Map<string, number>()
    for (const e of entries) {
      counts.set(e.id, (counts.get(e.id) ?? 0) + 1)
    }
    const dupIds = [...counts.entries()]
      .filter(([, n]) => n > 1)
      .map(([id]) => id)
    console.warn(
      `[mezmurData] ${entries.length - byId.size} duplicate workshop row(s); keeping last per id. Example ids: ${dupIds.slice(0, 8).join(', ')}${dupIds.length > 8 ? ' …' : ''}`,
    )
  }
  return [...byId.values()]
}

export const MEZMUR_ENTRIES: MezmurEntry[] = dedupeById(
  CHANT_WORKSHOP_MEZMUR_ENTRIES,
)

export const MEZMUR_ITEMS = MEZMUR_ENTRIES.map(mezmurEntryToMezmurItem)

export const youtubeThumbUrl = youtubeThumbnailUrl
export { youtubeWatchUrl }
