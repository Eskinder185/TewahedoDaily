import type { UpcomingObservance } from '../lib/churchCalendar'

/**
 * Curated “calendar art” rows so every image in the Next Observances pool appears intentionally,
 * without inventing anchor dates. These never set `gregorianAnchorIso` — they are browse-only.
 */
export const COMPANION_IMAGE_FILE: Record<string, string> = {
  'companion:debre-tabor-alt': 'DebreTabor.png',
  'companion:joyful-feast-season': 'JoyfulFeastSeason.jpg',
  'companion:liturgical-season': 'LiturgicalSeason.png',
  'companion:today-in-church': 'TodayInChurch.png',
  'companion:upcoming-holy-days': 'UpcomingHolyDays.png',
  'companion:marian-feasts-art': 'MarianFeast.png',
  'companion:saint-gabriel-feast': 'SaintGabrielFeast.png',
  'companion:saint-michael-feast': 'SaintMichaelFeast.png',
}

export const COMPANION_OBSERVANCES: UpcomingObservance[] = [
  {
    id: 'companion:debre-tabor-alt',
    kind: 'feast',
    title: 'Transfiguration — alternate sacred art',
    transliterationTitle: 'Debre Tabor',
    shortDescription:
      'A second luminous image for Mount Tabor, echoing the Lord’s glory revealed to the disciples.',
    dateEthiopian: 'Nehasse 13 (annual)',
    dateGregorian: 'Varies yearly',
  },
  {
    id: 'companion:joyful-feast-season',
    kind: 'feast',
    title: 'Joy after the fast — festal season',
    shortDescription:
      'Sacred art for the bright days when the Church rests from strict fasting and sings Paschal praise.',
    dateEthiopian: 'After major feasts',
    dateGregorian: 'Varies with Pascha',
  },
  {
    id: 'companion:liturgical-season',
    kind: 'feast',
    title: 'The liturgical year in living color',
    shortDescription:
      'A calm visual for the turning seasons of prayer: feasts, fasts, and the patience of ordinary time.',
    dateEthiopian: 'Year-round rhythm',
    dateGregorian: undefined,
  },
  {
    id: 'companion:today-in-church',
    kind: 'commemoration',
    title: 'What the Church is keeping today',
    shortDescription:
      'Sacred companion for the daily intersection of synaxarium, fasting rule, and parish prayer.',
    dateEthiopian: 'Each morning',
    dateGregorian: undefined,
  },
  {
    id: 'companion:upcoming-holy-days',
    kind: 'feast',
    title: 'Holy days on the horizon',
    shortDescription:
      'Art for looking ahead with reverence: the next feast, fast, or solemn commemoration in the Church.',
    dateEthiopian: 'As the calendar turns',
    dateGregorian: undefined,
  },
  {
    id: 'companion:marian-feasts-art',
    kind: 'feast',
    title: 'Marian feasts in sacred art',
    transliterationTitle: 'Maryam',
    shortDescription:
      'Visual companion for the Mother of God in festal joy, intercession, and the tenderness of Ethiopian hymnody.',
    dateEthiopian: 'Monthly & annual feasts',
    dateGregorian: undefined,
  },
  {
    id: 'companion:saint-gabriel-feast',
    kind: 'commemoration',
    title: 'Feast of Saint Gabriel the Archangel',
    transliterationTitle: 'Gabriel',
    shortDescription:
      'Image representing the herald of the Incarnation, praised in hymns and monthly intercession.',
    dateEthiopian: 'Annual feast — confirm',
    dateGregorian: 'Confirm locally',
  },
  {
    id: 'companion:saint-michael-feast',
    kind: 'commemoration',
    title: 'Feast of Saint Michael the Archangel',
    transliterationTitle: 'Michael',
    shortDescription:
      'Sacred art for the captain of the hosts: protection, courage, and the victory of humility.',
    dateEthiopian: 'Annual feast — confirm',
    dateGregorian: 'Confirm locally',
  },
]

export function isCompanionObservanceId(id: string): boolean {
  return id.startsWith('companion:')
}
