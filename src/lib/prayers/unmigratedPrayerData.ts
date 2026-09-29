import { prayerEntryToTselotPrayer } from '../practice/fromCanonical'
import { MEHARENE_AB_CONTENT } from './mehareneAbContent'
import { MEHARENE_AB_ENTRY, YEKIDANE_TSELOT_ENTRY } from './mediaPrayerEntries'
import { slugifyPrayer } from './prayerSlug'
import { YEKIDANE_TSELOT_CONTENT } from './yekidaneTselotContent'
import type { CollectionPrayer, PrayerCollection } from './prayerCollections'

export const UNMIGRATED_PRAYER_COLLECTIONS: PrayerCollection[] = [
  {
    id: 'yekidane-tselot',
    title: 'YeKidane Tselot',
    amharicTitle: 'የኪዳን ጸሎት',
    description: 'Covenant prayers and related prayer sections.',
    order: 4,
  },
  {
    id: 'meharene-ab',
    title: 'Meharene Ab',
    amharicTitle: 'መሐረነ አብ',
    description: 'Prayer of mercy and repentance.',
    order: 5,
  },
]

function collectionPrayer(input: Parameters<typeof prayerEntryToTselotPrayer>[0]): CollectionPrayer {
  return prayerEntryToTselotPrayer(input) as CollectionPrayer
}

const yekidanePrayers = YEKIDANE_TSELOT_CONTENT.sections.map((section, index) =>
  collectionPrayer({
    type: 'prayer',
    id: `yekidane-tselot-${section.id}`,
    slug: slugifyPrayer(section.id || section.title, `section-${index + 1}`),
    title: section.title,
    transliterationTitle: '',
    collection: 'YeKidane Tselot',
    collectionSlug: 'yekidane-tselot',
    section: section.title,
    chapter: `Section ${index + 1}`,
    order: index + 1,
    category: {
      primary: 'liturgical',
      usage: ['yekidane-tselot', 'covenant-prayer'],
      season: [],
      confidence: 'high',
    },
    text: section.text,
    transliteration: { amharic: '', geez: '', english: '' },
    summary: YEKIDANE_TSELOT_CONTENT.summary,
    source: {
      bookTitle: 'YeKidane Tselot',
      fullTextLink: YEKIDANE_TSELOT_CONTENT.sourcePdfPath,
      audioUrl: '',
    },
  }),
)

for (const prayer of yekidanePrayers) {
  prayer.youtubeId = YEKIDANE_TSELOT_ENTRY.youtubeId
  prayer.youtubeUrl = YEKIDANE_TSELOT_ENTRY.youtubeUrl
}

const meharenePrayer = collectionPrayer({
  type: 'prayer',
  id: 'meharene-ab-full-prayer',
  slug: 'full-prayer',
  title: MEHARENE_AB_CONTENT.title,
  transliterationTitle: MEHARENE_AB_CONTENT.transliterationTitle,
  collection: 'Meharene Ab',
  collectionSlug: 'meharene-ab',
  section: 'Full prayer',
  chapter: 'Full prayer',
  order: 1,
  category: {
    primary: 'repentance',
    usage: ['mercy', 'repentance', 'meharene-ab'],
    season: [],
    confidence: 'high',
  },
  text: MEHARENE_AB_CONTENT.text,
  transliteration: MEHARENE_AB_CONTENT.transliteration,
  summary: MEHARENE_AB_CONTENT.summary,
  source: { bookTitle: 'Meharene Ab', fullTextLink: '', audioUrl: '' },
})
meharenePrayer.youtubeId = MEHARENE_AB_ENTRY.youtubeId
meharenePrayer.youtubeUrl = MEHARENE_AB_ENTRY.youtubeUrl

export const UNMIGRATED_PRAYERS: CollectionPrayer[] = [...yekidanePrayers, meharenePrayer]
