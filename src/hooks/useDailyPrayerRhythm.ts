import { useEffect, useState } from 'react'
import {
  getDailyPrayerRhythm,
  type DailyPrayerRhythm,
} from '../services/dailyPrayerRhythm'
import { localDateKey } from '../lib/prayers/dailyPrayerRhythmSchedule'
import { useLocalCalendarDate } from './useLocalCalendarDate'

type State = {
  rhythm: DailyPrayerRhythm | null
  loading: boolean
  error: string | null
}

export function useDailyPrayerRhythm(): State & { date: Date; reload: () => void } {
  const date = useLocalCalendarDate()
  const [tick, setTick] = useState(0)
  const [state, setState] = useState<State>({
    rhythm: null,
    loading: true,
    error: null,
  })

  useEffect(() => {
    let active = true
    setState((current) => ({
      ...current,
      loading: current.rhythm?.dateKey === localDateKey(date) ? false : true,
      error: null,
    }))

    void getDailyPrayerRhythm(date)
      .then((rhythm) => {
        if (!active) return
        setState({ rhythm, loading: false, error: null })
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[dailyPrayerRhythm]', cause)
        setState({
          rhythm: null,
          loading: false,
          error: "We couldn't load today's prayer path.",
        })
      })

    return () => {
      active = false
    }
  }, [date, tick])

  return {
    ...state,
    date,
    reload: () => setTick((n) => n + 1),
  }
}
