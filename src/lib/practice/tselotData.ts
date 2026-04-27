import type { PrayerEntry } from '../../data/types/tselot'
import tselotJson from '../../data/tselot/tselot.json'
import zeweterJson from '../../data/tselot/zeweter-tselot.json'
import { prayerEntryToTselotPrayer } from './fromCanonical'
import type { TselotPrayer } from './types'
import { slugifyPrayer } from '../prayers/prayerSlug'

/** General `tselot.json` rows plus Zeweter Tselot for prayer readers and data mapping. */
const rawTselotEntries = [
  ...(tselotJson as unknown as PrayerEntry[]),
  ...(zeweterJson as unknown as PrayerEntry[]),
]

function dedupeById(entries: PrayerEntry[]): PrayerEntry[] {
  const seen = new Set<string>()
  const out: PrayerEntry[] = []
  for (const entry of entries) {
    if (seen.has(entry.id)) continue
    seen.add(entry.id)
    out.push(entry)
  }
  return out
}

const SLUG_OVERRIDES_BY_ID: Record<string, string> = {
  'our-father': 'our-father',
  'nicene-creed': 'faith-of-the-fathers',
}

function withUniqueSlugs(entries: PrayerEntry[]): TselotPrayer[] {
  const used = new Map<string, number>()

  return entries.map((entry) => {
    const base = slugifyPrayer(
      SLUG_OVERRIDES_BY_ID[entry.id] ||
        entry.slug ||
        entry.transliterationTitle ||
        entry.title ||
        entry.id,
      slugifyPrayer(entry.id, 'prayer'),
    )
    const count = used.get(base) ?? 0
    used.set(base, count + 1)
    const slug = count === 0 ? base : `${base}-${slugifyPrayer(entry.id, String(count + 1))}`
    return prayerEntryToTselotPrayer({ ...entry, slug })
  })
}

export const TSELOT_ENTRIES = dedupeById(rawTselotEntries)

export const TSELOT_PRAYERS = withUniqueSlugs(TSELOT_ENTRIES)

export const TSELOT_PRAYERS_BY_SLUG = new Map(
  TSELOT_PRAYERS.flatMap((prayer) => [
    [prayer.slug, prayer] as const,
    [prayer.id, prayer] as const,
  ]),
)

export function findTselotPrayerBySlug(slug?: string | null): TselotPrayer | undefined {
  if (!slug) return undefined
  return TSELOT_PRAYERS_BY_SLUG.get(slug.trim().toLowerCase())
}
