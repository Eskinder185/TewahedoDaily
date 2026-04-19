import type { PrayerEntry } from '../../data/types/tselot'
import wudaseJson from '../../data/tselot/wudase-mariam.json'
import { prayerEntryToTselotPrayer } from '../practice/fromCanonical'

export const WUDASE_ENTRIES = wudaseJson as unknown as PrayerEntry[]
export const WUDASE_PRAYERS = WUDASE_ENTRIES.map(prayerEntryToTselotPrayer)

export const WUDASE_DAY_ORDER = [
  'wudase-mariam-monday',
  'wudase-mariam-tuesday',
  'wudase-mariam-wednesday',
  'wudase-mariam-thursday',
  'wudase-mariam-friday',
  'wudase-mariam-saturday',
  'wudase-mariam-sunday',
] as const
