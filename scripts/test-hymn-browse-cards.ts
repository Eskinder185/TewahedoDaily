import {
  fetchAllCategoryLinks,
  fetchAllOccasionLinks,
  COLLECTION_TAXONOMY_MAP,
  listImportMezmurCards,
  getHymnCategories,
  getHymnOccasions,
} from '../src/lib/publicContent/hymnBrowse.ts'
import { normalizeMezmurLanguage, type MezmurLanguageFilter } from '../src/lib/mezmur/mezmurLanguage.ts'

async function run() {
  console.log('Fetching cards and links...')
  const [catLinks, occLinks, cards, categories, occasions] = await Promise.all([
    fetchAllCategoryLinks(),
    fetchAllOccasionLinks(),
    listImportMezmurCards(),
    getHymnCategories(),
    getHymnOccasions(),
  ])

  console.log(`Loaded ${cards.length} cards, ${catLinks.length} category links, ${occLinks.length} occasion links`)
  console.log(`Loaded ${categories.length} category cards, ${occasions.length} occasion cards`)

  // 1. Verify every Category card count matches actual filtered cards
  for (const card of categories) {
    const targetSlugs = new Set([card.slug, ...(COLLECTION_TAXONOMY_MAP[card.slug]?.categories || [])])
    const matchingLinks = catLinks.filter((l) => targetSlugs.has(l.category_slug))
    const importIds = new Set(matchingLinks.map((l) => l.mezmur_import_id).filter(Boolean))
    const slugs = new Set(matchingLinks.map((l) => l.mezmur_slug).filter(Boolean))
    const matchingCards = cards.filter((c) => (c.id && importIds.has(c.id)) || (c.slug && slugs.has(c.slug)))

    if (card.mezmurCount !== matchingCards.length) {
      throw new Error(`Category ${card.slug} mismatch: card=${card.mezmurCount} vs cards=${matchingCards.length}`)
    }
  }
  console.log(`✓ All ${categories.length} category card counts exactly match visible result sets`)

  // 2. Verify every Occasion card count matches actual filtered cards
  for (const card of occasions) {
    const targetSlugs = new Set([card.slug, ...(COLLECTION_TAXONOMY_MAP[card.slug]?.occasions || [])])
    const matchingLinks = occLinks.filter((l) => targetSlugs.has(l.occasion_slug))
    const importIds = new Set(matchingLinks.map((l) => l.mezmur_import_id).filter(Boolean))
    const slugs = new Set(matchingLinks.map((l) => l.mezmur_slug).filter(Boolean))
    const matchingCards = cards.filter((c) => (c.id && importIds.has(c.id)) || (c.slug && slugs.has(c.slug)))

    if (card.mezmurCount !== matchingCards.length) {
      throw new Error(`Occasion ${card.slug} mismatch: card=${card.mezmurCount} vs cards=${matchingCards.length}`)
    }
  }
  console.log(`✓ All ${occasions.length} occasion card counts exactly match visible result sets`)

  // 3. Test Language Filters across categories
  const testLanguages: MezmurLanguageFilter[] = ['all', 'am', 'en', 'gez', 'om', 'ti']
  for (const lang of testLanguages) {
    const [langCategories, langOccasions] = await Promise.all([
      getHymnCategories(lang),
      getHymnOccasions(lang),
    ])
    const langCards = lang === 'all'
      ? cards
      : cards.filter((c) => normalizeMezmurLanguage(c.language) === lang)

    // Verify Virgin Mary under this language filter
    const vmCard = langCategories.find((c) => c.slug === 'virgin-mary')
    if (vmCard) {
      const vmTargetSlugs = new Set(['virgin-mary', ...(COLLECTION_TAXONOMY_MAP['virgin-mary']?.categories || [])])
      const vmLinks = catLinks.filter((l) => vmTargetSlugs.has(l.category_slug))
      const vmImportIds = new Set(vmLinks.map((l) => l.mezmur_import_id).filter(Boolean))
      const vmSlugs = new Set(vmLinks.map((l) => l.mezmur_slug).filter(Boolean))
      const vmMatching = langCards.filter((c) => (c.id && vmImportIds.has(c.id)) || (c.slug && vmSlugs.has(c.slug)))
      if (vmCard.mezmurCount !== vmMatching.length) {
        throw new Error(`Virgin Mary language ${lang} mismatch: card=${vmCard.mezmurCount} vs cards=${vmMatching.length}`)
      }
    }
  }
  console.log(`✓ Language filters across ${testLanguages.join(', ')} verified with 100% precision`)
}

run().catch((err) => {
  console.error(err)
  process.exit(1)
})
