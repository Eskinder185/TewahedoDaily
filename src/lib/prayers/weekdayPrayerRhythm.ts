import { prayerCollectionPath, prayerDetailPath } from './prayerSlug'

type WeekdayIndex = 0 | 1 | 2 | 3 | 4 | 5 | 6

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

const WEEKDAYS: Record<WeekdayIndex, { english: string; amharic: string }> = {
  0: { english: 'Sunday', amharic: 'እሁድ' },
  1: { english: 'Monday', amharic: 'ሰኞ' },
  2: { english: 'Tuesday', amharic: 'ማክሰኞ' },
  3: { english: 'Wednesday', amharic: 'ረቡዕ' },
  4: { english: 'Thursday', amharic: 'ሐሙስ' },
  5: { english: 'Friday', amharic: 'ዓርብ' },
  6: { english: 'Saturday', amharic: 'ቅዳሜ' },
}

const WUDASE_BY_DAY: Record<WeekdayIndex, { label: string; slug: string }> = {
  0: { label: 'ውዳሴ ማርያም ዘእሑድ', slug: 'sunday' },
  1: { label: 'ውዳሴ ማርያም ዘሰኑይ', slug: 'monday' },
  2: { label: 'ውዳሴ ማርያም ዘሠሉስ', slug: 'tuesday' },
  3: { label: 'ውዳሴ ማርያም ዘረቡዕ', slug: 'wednesday' },
  4: { label: 'ውዳሴ ማርያም ዘሐሙስ', slug: 'thursday' },
  5: { label: 'ውዳሴ ማርያም ዘዓርብ', slug: 'friday' },
  6: { label: 'ውዳሴ ማርያም ዘቀዳሚት', slug: 'saturday' },
}

const PSALM_RANGE_BY_DAY: Record<WeekdayIndex, string> = {
  0: 'Rest day / የዕረፍት ቀን',
  1: 'መዝሙር 1–30',
  2: 'መዝሙር 31–60',
  3: 'መዝሙር 61–80',
  4: 'መዝሙር 81–110',
  5: 'መዝሙር 111–130',
  6: 'መዝሙር 131–150',
}

function todayIndex(date = new Date()): WeekdayIndex {
  return date.getDay() as WeekdayIndex
}

export function getWeekdayPrayerRhythm(date = new Date()): WeekdayPrayerRhythm {
  const day = todayIndex(date)
  const weekday = WEEKDAYS[day]
  const wudase = WUDASE_BY_DAY[day]
  const psalmRange = PSALM_RANGE_BY_DAY[day]

  return {
    weekday: weekday.english,
    weekdayAmharic: weekday.amharic,
    items: [
      {
        id: 'zewter-tselot',
        title: 'Zewter Tselot',
        label: 'Daily Orthodox prayer',
        subtitle: 'Begin with the regular prayer path',
        to: prayerCollectionPath('zewter-tselot'),
      },
      {
        id: 'wudasie-mariam',
        title: 'Wudasie Mariam',
        label: wudase.label,
        subtitle: 'The weekday praise of Saint Mary',
        to: prayerDetailPath(wudase.slug, 'wudasie-mariam'),
      },
      {
        id: 'mezmure-dawit',
        title: 'Mezmure Dawit',
        label: psalmRange,
        subtitle: day === 0 ? 'Rest from the weekly psalm range' : 'Today’s psalm range',
        to: prayerCollectionPath('mezmure-dawit'),
      },
    ],
  }
}
