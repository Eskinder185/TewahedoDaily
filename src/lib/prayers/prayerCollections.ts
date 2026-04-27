import { TSELOT_PRIMARY_LABEL, type TselotPrayer } from '../practice/types'
import { PSALMS } from './psalmData'
import { prayerEntryToTselotPrayer } from '../practice/fromCanonical'
import { MEHARENE_AB_CONTENT } from './mehareneAbContent'
import { MEHARENE_AB_ENTRY, YEKIDANE_TSELOT_ENTRY } from './mediaPrayerEntries'
import { WUDASE_DAY_ORDER, WUDASE_PRAYERS } from './wudaseData'
import { YEKIDANE_TSELOT_CONTENT } from './yekidaneTselotContent'
import { ZEWETER_PRAYERS } from './zeweterData'
import { slugifyPrayer } from './prayerSlug'

export type PrayerCollectionId =
  | 'zewter-tselot'
  | 'wudasie-mariam'
  | 'mezmure-dawit'
  | 'yekidane-tselot'
  | 'meharene-ab'

export type PrayerCollection = {
  id: PrayerCollectionId
  title: string
  amharicTitle: string
  description: string
  order: number
}

export type CollectionPrayer = TselotPrayer & {
  collection: string
  collectionSlug: PrayerCollectionId
  section: string
  chapter: string
  order: number
  youtubeId?: string
  youtubeUrl?: string
}

export const PRAYER_COLLECTIONS: PrayerCollection[] = [
  {
    id: 'zewter-tselot',
    title: 'Zewter Tselot',
    amharicTitle: 'ዘወትር ጸሎት',
    description: 'Daily Orthodox prayers used for regular prayer life.',
    order: 1,
  },
  {
    id: 'wudasie-mariam',
    title: 'Wudasie Mariam',
    amharicTitle: 'ውዳሴ ማርያም',
    description: 'Praises of the Theotokos organized by daily sections.',
    order: 2,
  },
  {
    id: 'mezmure-dawit',
    title: 'Mezmure Dawit',
    amharicTitle: 'መዝሙረ ዳዊት',
    description: 'Psalms of David for prayer, reading, and meditation.',
    order: 3,
  },
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

const COLLECTION_BY_ID = new Map(PRAYER_COLLECTIONS.map((collection) => [collection.id, collection]))

function collectionTitle(collectionSlug: PrayerCollectionId): string {
  return COLLECTION_BY_ID.get(collectionSlug)?.title ?? ''
}

function withCollection(
  prayer: TselotPrayer,
  collectionSlug: PrayerCollectionId,
  order: number,
  section = '',
  chapter = '',
  slug = prayer.slug,
): CollectionPrayer {
  return {
    ...prayer,
    slug,
    collection: collectionTitle(collectionSlug),
    collectionSlug,
    section,
    chapter,
    order,
  }
}

function fromPlainPrayer(input: {
  id: string
  slug: string
  title: string
  transliterationTitle?: string
  collectionSlug: PrayerCollectionId
  section?: string
  chapter?: string
  order: number
  primary?: TselotPrayer['categoryPrimary']
  usage?: string[]
  text: TselotPrayer['text']
  transliteration?: TselotPrayer['transliteration']
  summary?: TselotPrayer['summary']
  source?: TselotPrayer['source']
  youtubeId?: string
  youtubeUrl?: string
}): CollectionPrayer {
  const prayer = prayerEntryToTselotPrayer({
    type: 'prayer',
    id: input.id,
    slug: input.slug,
    title: input.title,
    transliterationTitle: input.transliterationTitle ?? '',
    collection: collectionTitle(input.collectionSlug),
    collectionSlug: input.collectionSlug,
    section: input.section ?? '',
    chapter: input.chapter ?? '',
    order: input.order,
    category: {
      primary: input.primary ?? 'liturgical',
      usage: input.usage ?? [],
      season: [],
      confidence: 'high',
    },
    text: input.text,
    transliteration: input.transliteration ?? { amharic: '', geez: '', english: '' },
    summary: input.summary ?? { amharic: '', english: '' },
    source: input.source ?? { bookTitle: collectionTitle(input.collectionSlug), fullTextLink: '', audioUrl: '' },
  }) as CollectionPrayer
  prayer.youtubeId = input.youtubeId
  prayer.youtubeUrl = input.youtubeUrl
  return prayer
}

const zeweterPrayers = ZEWETER_PRAYERS.map((prayer, index) =>
  withCollection(
    prayer,
    'zewter-tselot',
    index + 1,
    prayer.categoryUsage[1] ?? 'Daily prayers',
    '',
    prayer.id,
  ),
)

const wudaseById = new Map(WUDASE_PRAYERS.map((prayer) => [prayer.id, prayer]))
const wudasePrayers = WUDASE_DAY_ORDER.map((id, index) => {
  const prayer = wudaseById.get(id)
  if (!prayer) return null
  const day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][index] ?? ''
  return withCollection(
    prayer,
    'wudasie-mariam',
    index + 1,
    day,
    day,
    slugifyPrayer(day || prayer.transliterationTitle || prayer.id, prayer.id),
  )
}).filter((prayer): prayer is CollectionPrayer => Boolean(prayer))

const psalmPrayers = [...PSALMS]
  .sort((a, b) => a.number - b.number)
  .map((psalm) =>
    fromPlainPrayer({
      id: psalm.id,
      slug: `psalm-${psalm.number}`,
      title: psalm.title.amharic || psalm.title.english,
      transliterationTitle: psalm.title.english,
      collectionSlug: 'mezmure-dawit',
      section: psalm.number <= 50 ? 'Psalms 1-50' : psalm.number <= 99 ? 'Psalms 51-99' : 'Psalms 100-150',
      chapter: `Psalm ${psalm.number}`,
      order: psalm.number,
      primary: 'liturgical',
      usage: ['psalm', 'mezmure-dawit'],
      text: psalm.text,
      source: { bookTitle: 'Mezmure Dawit', fullTextLink: '', audioUrl: '' },
    }),
  )

const yekidanePrayers = YEKIDANE_TSELOT_CONTENT.sections.map((section, index) =>
  fromPlainPrayer({
    id: `yekidane-tselot-${section.id}`,
    slug: slugifyPrayer(section.id || section.title, `section-${index + 1}`),
    title: section.title,
    collectionSlug: 'yekidane-tselot',
    section: section.title,
    chapter: `Section ${index + 1}`,
    order: index + 1,
    primary: 'liturgical',
    usage: ['yekidane-tselot', 'covenant-prayer'],
    text: section.text,
    summary: YEKIDANE_TSELOT_CONTENT.summary,
    source: {
      bookTitle: 'YeKidane Tselot',
      fullTextLink: YEKIDANE_TSELOT_CONTENT.sourcePdfPath,
      audioUrl: '',
    },
    youtubeId: YEKIDANE_TSELOT_ENTRY.youtubeId,
    youtubeUrl: YEKIDANE_TSELOT_ENTRY.youtubeUrl,
  }),
)

const meharenePrayers = [
  fromPlainPrayer({
    id: 'meharene-ab-full-prayer',
    slug: 'full-prayer',
    title: MEHARENE_AB_CONTENT.title,
    transliterationTitle: MEHARENE_AB_CONTENT.transliterationTitle,
    collectionSlug: 'meharene-ab',
    section: 'Full prayer',
    chapter: 'Full prayer',
    order: 1,
    primary: 'repentance',
    usage: ['mercy', 'repentance', 'meharene-ab'],
    text: MEHARENE_AB_CONTENT.text,
    transliteration: MEHARENE_AB_CONTENT.transliteration,
    summary: MEHARENE_AB_CONTENT.summary,
    source: { bookTitle: 'Meharene Ab', fullTextLink: '', audioUrl: '' },
    youtubeId: MEHARENE_AB_ENTRY.youtubeId,
    youtubeUrl: MEHARENE_AB_ENTRY.youtubeUrl,
  }),
]

export const COLLECTION_PRAYERS: CollectionPrayer[] = [
  ...zeweterPrayers,
  ...wudasePrayers,
  ...psalmPrayers,
  ...yekidanePrayers,
  ...meharenePrayers,
]

export function getPrayerCollection(slug?: string | null): PrayerCollection | undefined {
  if (!slug) return undefined
  return COLLECTION_BY_ID.get(slug.trim().toLowerCase() as PrayerCollectionId)
}

export function getCollectionPrayers(collectionSlug?: string | null): CollectionPrayer[] {
  if (!collectionSlug) return []
  const normalized = collectionSlug.trim().toLowerCase()
  return COLLECTION_PRAYERS.filter((prayer) => prayer.collectionSlug === normalized)
}

export function findCollectionPrayer(
  collectionSlug?: string | null,
  prayerSlug?: string | null,
): CollectionPrayer | undefined {
  if (!collectionSlug || !prayerSlug) return undefined
  const normalizedCollection = collectionSlug.trim().toLowerCase()
  const normalizedPrayer = prayerSlug.trim().toLowerCase()
  return COLLECTION_PRAYERS.find(
    (prayer) =>
      prayer.collectionSlug === normalizedCollection &&
      (prayer.slug === normalizedPrayer || prayer.id === normalizedPrayer),
  )
}

export function findPrayerByLegacySlug(slug?: string | null): CollectionPrayer | undefined {
  if (!slug) return undefined
  const normalized = slug.trim().toLowerCase()
  return COLLECTION_PRAYERS.find((prayer) => prayer.slug === normalized || prayer.id === normalized)
}

export function collectionPrayerCount(collectionSlug: string): number {
  return getCollectionPrayers(collectionSlug).length
}

export function categoryLabel(prayer: CollectionPrayer): string {
  return TSELOT_PRIMARY_LABEL[prayer.categoryPrimary]
}
