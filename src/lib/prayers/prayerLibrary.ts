import {
  loadPrayerCollection,
  loadPrayerCollections,
} from './prayerSupabase'
import {
  countLiturgySections,
  getLiturgyCollectionBySlug,
  getLiturgyCollections,
  getLiturgyEntriesForSection,
  getLiturgySectionBySlug,
  getLiturgySections,
} from './liturgySupabase'
import {
  countSynaxariumDays,
  getSynaxariumCommemorationsForDay,
  getSynaxariumDayBySlug,
  getSynaxariumDays,
  SYNAXARIUM_LIBRARY_SORT_ORDER,
} from './synaxariumSupabase'
import { prayerCollectionPath } from './prayerSlug'
import type {
  PrayerLibraryCollection,
  PrayerSearchResult,
} from './prayerLibraryTypes'

const LEGACY_LITURGY_PRAYER_SLUGS = new Set(['divine-liturgy'])

export function libraryCollectionPath(collection: Pick<PrayerLibraryCollection, 'slug'>): string {
  return prayerCollectionPath(collection.slug)
}

function normalizeLibraryText(value: string | null | undefined): string {
  const text = (value || '').trim()
  if (!text) return ''
  if (/^(null|undefined|n\/a|-)$/i.test(text)) return ''
  return text
}

/** Unified Prayer Collections list: normal prayers + liturgy + synaxarium. */
export async function loadPrayerLibraryCollections(): Promise<PrayerLibraryCollection[]> {
  const [prayerResult, liturgyResult, synaxResult] = await Promise.allSettled([
    loadPrayerCollections(),
    getLiturgyCollections(),
    countSynaxariumDays(),
  ])

  const prayerCollections = prayerResult.status === 'fulfilled' ? prayerResult.value : []
  const liturgyCollections = liturgyResult.status === 'fulfilled' ? liturgyResult.value : []
  const synaxariumDayCount = synaxResult.status === 'fulfilled' ? synaxResult.value : 0

  if (prayerResult.status === 'rejected' && import.meta.env.DEV) {
    console.error('[prayers] library normal prayers', prayerResult.reason)
  }
  if (liturgyResult.status === 'rejected' && import.meta.env.DEV) {
    console.error('[prayers] library liturgy', liturgyResult.reason)
  }
  if (synaxResult.status === 'rejected' && import.meta.env.DEV) {
    console.error('[prayers] library synaxarium', synaxResult.reason)
  }

  // If every source failed, surface an error to the page.
  if (
    prayerResult.status === 'rejected' &&
    liturgyResult.status === 'rejected' &&
    synaxResult.status === 'rejected'
  ) {
    throw prayerResult.reason ?? liturgyResult.reason ?? synaxResult.reason
  }

  const liturgySlugs = new Set(liturgyCollections.map((item) => item.slug))

  const prayerCards: PrayerLibraryCollection[] = prayerCollections
    .filter((collection) => {
      // Dedicated liturgy_* tables are authoritative — never show legacy prayer_collections Liturgy.
      if (LEGACY_LITURGY_PRAYER_SLUGS.has(collection.id)) return false
      if (liturgySlugs.has(collection.id)) return false
      return true
    })
    .map((collection) => {
      const countKind =
        collection.countLabel === 'psalms'
          ? ('psalms' as const)
          : collection.countLabel === 'prayers'
            ? ('prayers' as const)
            : ('sections' as const)
      const itemCount =
        countKind === 'sections'
          ? collection.sectionCount || collection.prayerCount
          : collection.prayerCount
      return {
        id: collection.id,
        slug: collection.id,
        title: normalizeLibraryText(collection.title),
        titleAmharic: normalizeLibraryText(collection.amharicTitle),
        description: normalizeLibraryText(collection.description),
        sortOrder: collection.order,
        status: 'published' as const,
        sourceType: 'prayer' as const,
        itemCount,
        countKind,
        imagePath: collection.imagePath,
        imageAlt: collection.imageAlt,
      }
    })
    .filter((collection) => Boolean(collection.title))

  const liturgyCards: PrayerLibraryCollection[] = (
    await Promise.all(
      liturgyCollections.map(async (collection) => {
        const sectionCount = await countLiturgySections(collection.id).catch(() => 0)
        return {
          id: collection.id,
          slug: collection.slug,
          title: normalizeLibraryText(collection.title),
          titleAmharic: normalizeLibraryText(collection.titleAmharic),
          description: normalizeLibraryText(collection.description),
          sortOrder: collection.sortOrder,
          status: 'published' as const,
          sourceType: 'liturgy' as const,
          itemCount: sectionCount,
          countKind: 'sections' as const,
          imagePath: collection.imagePath,
          imageAlt: collection.imageAlt,
        }
      }),
    )
  ).filter((collection) => Boolean(collection.title))

  const synaxariumCard: PrayerLibraryCollection = {
    id: 'synaxarium',
    slug: 'synaxarium',
    title: 'Synaxarium',
    titleAmharic: 'ስንክሳር',
    description: normalizeLibraryText(
      'Daily Ethiopian Orthodox commemorations, saints, feasts, and church history.',
    ),
    sortOrder: SYNAXARIUM_LIBRARY_SORT_ORDER,
    status: 'published',
    sourceType: 'synaxarium',
    itemCount: synaxariumDayCount,
    countKind: 'days',
  }

  const cards = [...prayerCards, ...liturgyCards]
  if (synaxResult.status === 'fulfilled') cards.push(synaxariumCard)

  return cards.sort((a, b) => a.sortOrder - b.sortOrder || a.title.localeCompare(b.title))
}

export async function resolveLibraryCollection(slugInput?: string | null) {
  const slug = slugInput?.trim().toLowerCase()
  if (!slug) return null
  if (slug === 'synaxarium') {
    const dayCount = await countSynaxariumDays()
    return {
      sourceType: 'synaxarium' as const,
      collection: {
        id: 'synaxarium',
        slug: 'synaxarium',
        title: 'Synaxarium',
        titleAmharic: 'ስንክሳር',
        description:
          'Daily Ethiopian Orthodox commemorations, saints, feasts, and church history.',
        sortOrder: SYNAXARIUM_LIBRARY_SORT_ORDER,
        status: 'published' as const,
        sourceType: 'synaxarium' as const,
        itemCount: dayCount,
        countKind: 'days' as const,
      },
    }
  }

  const liturgy = await getLiturgyCollectionBySlug(slug)
  if (liturgy) {
    const sectionCount = await countLiturgySections(liturgy.id)
    return {
      sourceType: 'liturgy' as const,
      collection: {
        id: liturgy.id,
        slug: liturgy.slug,
        title: liturgy.title,
        titleAmharic: liturgy.titleAmharic,
        description: liturgy.description,
        sortOrder: liturgy.sortOrder,
        status: 'published' as const,
        sourceType: 'liturgy' as const,
        itemCount: sectionCount,
        countKind: 'sections' as const,
      },
      liturgy,
    }
  }

  const prayerBundle = await loadPrayerCollection(slug)
  if (!prayerBundle) return null
  const countKind =
    prayerBundle.collection.countLabel === 'psalms'
      ? ('psalms' as const)
      : prayerBundle.collection.countLabel === 'prayers'
        ? ('prayers' as const)
        : ('sections' as const)
  return {
    sourceType: 'prayer' as const,
    collection: {
      id: prayerBundle.collection.id,
      slug: prayerBundle.collection.id,
      title: prayerBundle.collection.title,
      titleAmharic: prayerBundle.collection.amharicTitle,
      description: prayerBundle.collection.description,
      sortOrder: prayerBundle.collection.order,
      status: 'published' as const,
      sourceType: 'prayer' as const,
      itemCount:
        countKind === 'sections'
          ? prayerBundle.collection.sectionCount || prayerBundle.collection.prayerCount
          : prayerBundle.collection.prayerCount,
      countKind,
    },
    prayerBundle,
  }
}

export async function searchPrayerLibrary(queryInput: string): Promise<PrayerSearchResult[]> {
  const { searchPrayCatalog } = await import('./prayerSearch')
  const { results } = await searchPrayCatalog(queryInput, { limit: 30 })
  return results
}

export async function suggestPrayerLibrary(queryInput: string, limit = 8) {
  const { searchPrayCatalog } = await import('./prayerSearch')
  return searchPrayCatalog(queryInput, { limit, suggestionLimit: limit })
}

export {
  loadPrayerCollection,
  getLiturgyCollectionBySlug,
  getLiturgySections,
  getLiturgySectionBySlug,
  getLiturgyEntriesForSection,
  getSynaxariumDays,
  getSynaxariumDayBySlug,
  getSynaxariumCommemorationsForDay,
}
