export type PrayerMediaEntry = {
  id: string
  route: string
  title: string
  transliteration: string
  summary: string
  badge: string
  noteAmharic: string
  noteEnglish: string
  youtubeId: string
  youtubeUrl: string
  marksStorageKey: string
  settingsStorageKey: string
}

export const YEKIDANE_TSELOT_ENTRY: PrayerMediaEntry = {
  id: 'yekidane-tselot',
  route: '/prayers/yekidane-tselot',
  title: 'የኪዳን ጸሎት',
  transliteration: 'Yekidane Tselot',
  summary:
    'የጸሎቱ ዜማ ቪዲዮ እና ከምንጭ ፒዲኤፍ የተዘጋጀ የጽሑፍ ንባብ አንድ ላይ ተቀርበዋል።',
  badge: 'ዜማ + ጽሑፍ',
  noteAmharic: 'የዜማ ቪዲዮ እና የጸሎት ጽሑፍ',
  noteEnglish: 'This page includes both the zema video and structured prayer text.',
  youtubeId: 'Q5Zty4FBLzY',
  youtubeUrl: 'https://www.youtube.com/watch?v=Q5Zty4FBLzY',
  marksStorageKey: 'prayer-yekidane-tselot-marks',
  settingsStorageKey: 'prayer-yekidane-tselot-settings',
}

export const MEHARENE_AB_ENTRY: PrayerMediaEntry = {
  id: 'meharene-ab',
  route: '/prayers/meharene-ab',
  title: 'መሐረነ አብ',
  transliteration: 'Meharene Ab',
  summary:
    'የመሐረነ አብ ዜማ ቪዲዮ ከሙሉ የጸሎት ጽሑፍ ጋር አንድ ላይ ተቀርቧል።',
  badge: 'ዜማ + ጽሑፍ',
  noteAmharic: 'የዜማ ቪዲዮ እና ሙሉ የጸሎት ጽሑፍ',
  noteEnglish: 'This page includes both the zema video and the full prayer text.',
  youtubeId: 'nN84vHGrInw',
  youtubeUrl: 'https://www.youtube.com/watch?v=nN84vHGrInw',
  marksStorageKey: 'prayer-meharene-ab-marks',
  settingsStorageKey: 'prayer-meharene-ab-settings',
}
