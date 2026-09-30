import { useEffect, useState } from 'react'
import { localCalendarDate, localDateKey } from '../lib/prayers/dailyPrayerRhythmSchedule'

function msUntilNextLocalMidnight(from = new Date()): number {
  const next = new Date(from.getFullYear(), from.getMonth(), from.getDate() + 1)
  return Math.max(1_000, next.getTime() - from.getTime())
}

/**
 * Tracks the user's current local calendar day.
 * Refreshes at local midnight, on focus, and when the tab becomes visible.
 */
export function useLocalCalendarDate(): Date {
  const [date, setDate] = useState(() => localCalendarDate())

  useEffect(() => {
    let midnightTimer: number | undefined

    const sync = () => {
      const next = localCalendarDate()
      setDate((current) => (localDateKey(current) === localDateKey(next) ? current : next))
    }

    const scheduleMidnight = () => {
      if (midnightTimer) window.clearTimeout(midnightTimer)
      midnightTimer = window.setTimeout(() => {
        sync()
        scheduleMidnight()
      }, msUntilNextLocalMidnight())
    }

    const onFocus = () => sync()
    const onVisibility = () => {
      if (document.visibilityState === 'visible') sync()
    }

    scheduleMidnight()
    window.addEventListener('focus', onFocus)
    document.addEventListener('visibilitychange', onVisibility)

    return () => {
      if (midnightTimer) window.clearTimeout(midnightTimer)
      window.removeEventListener('focus', onFocus)
      document.removeEventListener('visibilitychange', onVisibility)
    }
  }, [])

  return date
}
