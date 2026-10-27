/**
 * Centralized Ethiopian Date re-export wrapper.
 * Delegates to the pure JDN ethiopianCalendarEngine.
 */
export * from './calendar/ethiopianCalendarEngine'

import {
  type EthiopianDate,
  
  formatEthiopianDate,
  ETHIOPIAN_MONTH_NAMES_EN,
} from './calendar/ethiopianCalendarEngine'

export type EthiopianDateParts = EthiopianDate

export const ETHIOPIAN_MONTH_NAMES = ETHIOPIAN_MONTH_NAMES_EN

export function formatEthiopianLong(parts: EthiopianDateParts): string {
  return formatEthiopianDate(parts, 'en', { includeYear: true })
}
