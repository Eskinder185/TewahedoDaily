import type { PrayerEntry } from '../../data/types/tselot'
import zeweterJson from '../../data/tselot/zeweter-tselot.json'
import { prayerEntryToTselotPrayer } from '../practice/fromCanonical'
import { slugifyPrayer } from './prayerSlug'

export const ZEWETER_ENTRIES = zeweterJson as unknown as PrayerEntry[]

const usedSlugs = new Map<string, number>()

export const ZEWETER_PRAYERS = ZEWETER_ENTRIES.map((entry) => {
  const base = slugifyPrayer(
    entry.slug || entry.transliterationTitle || entry.title || entry.id,
    slugifyPrayer(entry.id, 'prayer'),
  )
  const count = usedSlugs.get(base) ?? 0
  usedSlugs.set(base, count + 1)
  const slug = count === 0 ? base : `${base}-${slugifyPrayer(entry.id, String(count + 1))}`
  return prayerEntryToTselotPrayer({ ...entry, slug })
})
