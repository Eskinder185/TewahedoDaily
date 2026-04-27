import type { MezmurEntry } from '../../data/types/mezmur'
import { youtubeThumbnailUrl, youtubeWatchUrl } from '../../data/utils/youtube'
import { CHANT_WORKSHOP_MEZMUR_ENTRIES } from './chantWorkshopEntries'
import { mezmurEntryToMezmurItem } from './fromCanonical'
import type { MezmurItem } from './types'
import { slugifyMezmur } from './mezmurSlug'

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

const SLUG_OVERRIDES_BY_ID: Record<string, string> = {
  'dink-adirgolignyal': 'dink-adirgolignal',
}

function withUniqueSlugs(entries: MezmurEntry[]): MezmurItem[] {
  const used = new Map<string, number>()

  return entries.map((entry) => {
    const base = slugifyMezmur(
      SLUG_OVERRIDES_BY_ID[entry.id] ||
        entry.slug ||
        entry.transliterationTitle ||
        entry.title ||
        entry.id,
      slugifyMezmur(entry.id, 'mezmur'),
    )
    const count = used.get(base) ?? 0
    used.set(base, count + 1)
    const slug =
      count === 0
        ? base
        : `${base}-${slugifyMezmur(entry.id, String(count + 1))}`

    return mezmurEntryToMezmurItem({ ...entry, slug })
  })
}

export const MEZMUR_ITEMS = withUniqueSlugs(MEZMUR_ENTRIES)

export const MEZMUR_ITEMS_BY_SLUG = new Map(
  MEZMUR_ITEMS.flatMap((item) => [
    [item.slug, item] as const,
    [item.id, item] as const,
  ]),
)

export function findMezmurBySlug(slug?: string | null): MezmurItem | undefined {
  if (!slug) return undefined
  return MEZMUR_ITEMS_BY_SLUG.get(slug.trim().toLowerCase())
}

export const youtubeThumbUrl = youtubeThumbnailUrl
export { youtubeWatchUrl }
