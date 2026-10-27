import { fetchBiblePassage, fetchBiblePassageBilingual } from '../src/lib/bible/passageService.ts'

async function run() {
  console.log('Testing fetchBiblePassage for Matthew 6:16-18 (English)...')
  const en = await fetchBiblePassage({
    bookSlug: 'matthew',
    chapterNumber: 6,
    verseStart: 16,
    verseEnd: 18,
    preferredEdition: 'web',
  })
  console.log('English passage:', {
    edition: en?.editionName,
    isComplete: en?.isComplete,
    missing: en?.missingVerses,
    verses: en?.verses.map(v => `${v.verseNumber}: ${v.text.slice(0, 40)}...`)
  })

  console.log('Testing fetchBiblePassage for Matthew 6:16-18 (Amharic)...')
  const am = await fetchBiblePassage({
    bookSlug: 'matthew',
    chapterNumber: 6,
    verseStart: 16,
    verseEnd: 18,
    preferredEdition: 'am',
  })
  console.log('Amharic passage:', {
    edition: am?.editionName,
    isComplete: am?.isComplete,
    missing: am?.missingVerses,
    verses: am?.verses.map(v => `${v.verseNumber}: ${v.text.slice(0, 40)}...`)
  })
}

run().catch(console.error)
