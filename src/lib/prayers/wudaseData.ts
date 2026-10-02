/**
 * Legacy Wudase Mariam JSON — production Pray uses Supabase collections.
 * Archived: `archive/local-data/tselot/wudase-mariam.json`
 */
import type { TselotPrayer } from '../practice/types'

export const WUDASE_ENTRIES: unknown[] = []
export const WUDASE_PRAYERS: TselotPrayer[] = []

export const WUDASE_DAY_ORDER = [
  'wudase-mariam-monday',
  'wudase-mariam-tuesday',
  'wudase-mariam-wednesday',
  'wudase-mariam-thursday',
  'wudase-mariam-friday',
  'wudase-mariam-saturday',
  'wudase-mariam-sunday',
] as const
