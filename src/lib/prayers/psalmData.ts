import type { PrayerEntryTextBlock } from '../../data/types/tselot'
import psalms001to050 from '../../data/tselot/mezmure-dawit/mezmure-dawit-001-050.json'
import psalms051to099 from '../../data/tselot/mezmure-dawit/mezmure-dawit-051-099.json'
import psalms100to150 from '../../data/tselot/mezmure-dawit/mezmure-dawit-100-150.json'

export type PsalmTitleBlock = {
  amharic: string
  geez: string
  english: string
}

export type PsalmEntry = {
  id: string
  number: number
  title: PsalmTitleBlock
  text: PrayerEntryTextBlock
}

// Transform function for the inconsistent data formats
function transformPsalmData(rawData: any[]): PsalmEntry[] {
  return rawData.map((item: any) => {
    // Handle both formats
    if (item.number && item.title?.amharic) {
      // Format from 001-050 (already correct)
      return item as PsalmEntry
    } else if (item.category?.chapter && typeof item.title === 'string') {
      // Format from 051-099 and 100-150 (needs transformation)
      const number = item.category.chapter
      const amharicTitle = item.title.replace('መዝሙረ ዳዊት ምዕራፍ ', 'መዝሙር ')
      
      return {
        id: item.id,
        number: number,
        title: {
          amharic: amharicTitle,
          geez: amharicTitle, // Use the same for geez if not available
          english: `Psalm ${number}`
        },
        text: {
          amharic: Array.isArray(item.text?.amharic) ? item.text.amharic.join('\n') : item.text?.amharic || '',
          geez: Array.isArray(item.text?.geez) ? item.text.geez.join('\n') : item.text?.geez || '',
          english: Array.isArray(item.text?.english) ? item.text.english.join('\n') : item.text?.english || ''
        }
      }
    } else {
      // Fallback for unexpected format
      console.warn('Unexpected psalm format:', item)
      return {
        id: item.id || `psalm-${Math.random()}`,
        number: 0,
        title: {
          amharic: 'Unknown',
          geez: 'Unknown',
          english: 'Unknown'
        },
        text: {
          amharic: '',
          geez: '',
          english: ''
        }
      }
    }
  })
}

// Combine all psalm collections into a single array
export const PSALMS = [
  ...transformPsalmData(psalms001to050 as any[]),
  ...transformPsalmData(psalms051to099 as any[]),
  ...transformPsalmData(psalms100to150 as any[]),
]
