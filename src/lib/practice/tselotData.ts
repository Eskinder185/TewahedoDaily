import type { PrayerEntry } from '../../data/types/tselot'
import tselotJson from '../../data/tselot/tselot.json'
import zeweterJson from '../../data/tselot/zeweter-tselot.json'
import { prayerEntryToTselotPrayer } from './fromCanonical'

/** General `tselot.json` rows plus Zeweter Tselot for prayer readers and data mapping. */
export const TSELOT_ENTRIES = [
  ...(tselotJson as unknown as PrayerEntry[]),
  ...(zeweterJson as unknown as PrayerEntry[]),
]

export const TSELOT_PRAYERS = TSELOT_ENTRIES.map(prayerEntryToTselotPrayer)
