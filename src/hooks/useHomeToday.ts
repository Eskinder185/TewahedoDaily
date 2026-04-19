import { useMemo } from 'react'
import { buildChurchDaySnapshot } from '../lib/churchCalendar'
import type { ChurchDaySnapshot } from '../lib/churchCalendar'

export type HomeToday = {
  now: Date
  snapshot: ChurchDaySnapshot
}

/** Snapshot for the current local calendar day (stable for the session render). */
export function useHomeToday(): HomeToday {
  return useMemo(() => {
    const now = new Date()
    const snapshot = buildChurchDaySnapshot(now)
    return { now, snapshot }
  }, [])
}
