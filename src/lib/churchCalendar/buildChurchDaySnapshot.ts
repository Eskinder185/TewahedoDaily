import { getMockDailyChurchData } from '../../data/mocks/churchDay.mock'
import type { ChurchDaySnapshot } from './types'
import { dailyChurchDataToSnapshot } from './fromDailyChurchData'

/**
 * Assemble the public snapshot.
 * Swap point: call your API, map JSON → `DailyChurchData`, then `dailyChurchDataToSnapshot`.
 */
export function buildChurchDaySnapshot(referenceDate = new Date()): ChurchDaySnapshot {
  const d = new Date(
    referenceDate.getFullYear(),
    referenceDate.getMonth(),
    referenceDate.getDate(),
  )
  const data = getMockDailyChurchData(d)
  return dailyChurchDataToSnapshot(data, d)
}
