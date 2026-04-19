import type { PrayerEntry } from '../../data/types/tselot'
import zeweterJson from '../../data/tselot/zeweter-tselot.json'
import { prayerEntryToTselotPrayer } from '../practice/fromCanonical'

export const ZEWETER_ENTRIES = zeweterJson as unknown as PrayerEntry[]
export const ZEWETER_PRAYERS = ZEWETER_ENTRIES.map(prayerEntryToTselotPrayer)
