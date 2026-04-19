import type { DailyChurchData } from '../../data/types/churchDay'
import {
  formatEthiopianLabel,
  formatGregorianLong,
  formatWeekdayLong,
} from './formatters'
import type { ChurchDaySnapshot } from './types'

/** Maps canonical daily record → UI snapshot (hero, Today in Church, path). */
export function dailyChurchDataToSnapshot(
  data: DailyChurchData,
  referenceDate: Date,
): ChurchDaySnapshot {
  const d = referenceDate
  return {
    source: data.source === 'live' ? 'live' : 'mock',
    referenceDate: d,
    gregorian: {
      year: d.getFullYear(),
      monthIndex: d.getMonth(),
      day: d.getDate(),
      labelLong: data.gregorianLabel || formatGregorianLong(d),
    },
    ethiopian: {
      ...data.ethiopianDate,
      labelLong:
        data.ethiopianLabel || formatEthiopianLabel(data.ethiopianDate),
    },
    weekday: {
      long: data.dayName || formatWeekdayLong(d),
    },
    commemoration: {
      catalogEventId: data.catalogEventId,
      title: data.feast,
      subtitle: data.saint.trim() ? data.saint : undefined,
      transliterationTitle: data.transliterationTitle,
      observanceType: data.observanceType as any,
      summary: data.summary,
      significance: data.significance,
      practicalGuidance: data.practicalGuidance,
      prayAndChant: (data as any).prayAndChant,
      notes: (data as any).notes,
      shortDescription:
        data.shortDescription?.trim() ||
        data.shortMeaning?.trim() ||
        '',
      meaning: data.meaning ?? '',
      observance: data.observance ?? '',
      whyTodayShort:
        data.shortMeaning?.trim() ||
        data.shortDescription?.trim() ||
        '',
      whyTodayLong: data.longMeaning,
    },
    movableOnDay: data.movableObservancesOnDay ?? [],
    season: {
      id: data.season.id,
      title: data.season.title,
      transliterationTitle: data.season.transliterationTitle,
      summary: data.season.summary,
      shortDescription:
        data.season.shortDescription?.trim() || data.season.summary,
      meaning: data.season.meaning ?? '',
      observance: data.season.observance ?? '',
    },
    fasting: {
      weeklyFast: data.fastWeekly,
      seasonalFast: data.fastSeasonal,
    },
    upcoming: data.upcomingObservances,
    miniCalendar: data.miniCalendar,
  }
}
