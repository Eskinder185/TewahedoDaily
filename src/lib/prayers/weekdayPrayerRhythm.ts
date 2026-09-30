/**
 * @deprecated Prefer `getDailyPrayerRhythm` from `src/services/dailyPrayerRhythm.ts`.
 * Kept as a thin sync adapter for any legacy imports.
 */
import { prayerCollectionPath, prayerDetailPath } from './prayerSlug'
import {
  DAILY_COLLECTION_SLUGS,
  formatPsalmRangeLabel,
  mezmureDawitRangePath,
  PSALM_RANGE_BY_WEEKDAY,
  WEEKDAY_LABELS,
  WUDASE_FALLBACK_TITLE_AMHARIC,
  WUDASE_WEEKDAY_SLUG,
  weekdayIndexFromDate,
} from './dailyPrayerRhythmSchedule'

export type WeekdayPrayerRhythmItem = {
  id: string
  title: string
  label: string
  subtitle: string
  to: string
}

export type WeekdayPrayerRhythm = {
  weekday: string
  weekdayAmharic: string
  items: WeekdayPrayerRhythmItem[]
}

export function getWeekdayPrayerRhythm(date = new Date()): WeekdayPrayerRhythm {
  const day = weekdayIndexFromDate(date)
  const weekday = WEEKDAY_LABELS[day]
  const range = PSALM_RANGE_BY_WEEKDAY[day]
  const wudaseSlug = WUDASE_WEEKDAY_SLUG[day]

  return {
    weekday: weekday.english,
    weekdayAmharic: weekday.amharic,
    items: [
      {
        id: 'zewter-tselot',
        title: 'Zewter Tselot',
        label: 'Daily Orthodox prayer',
        subtitle: 'Begin with the regular prayer path',
        to: prayerCollectionPath(DAILY_COLLECTION_SLUGS.zewter),
      },
      {
        id: 'wudase-mariam',
        title: 'Wudase Mariam',
        label: WUDASE_FALLBACK_TITLE_AMHARIC[day],
        subtitle: 'The weekday praise of Saint Mary',
        to: prayerDetailPath(wudaseSlug, DAILY_COLLECTION_SLUGS.wudase),
      },
      {
        id: 'mezmure-dawit',
        title: 'Mezmure Dawit',
        label: formatPsalmRangeLabel(range, 'am'),
        subtitle: range ? "Today's psalm reading" : 'Rest from the weekly psalm range',
        to: mezmureDawitRangePath(range),
      },
    ],
  }
}
