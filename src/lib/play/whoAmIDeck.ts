/**
 * Who Am I? rounds: every eligible card is reachable. A round walks a freshly shuffled order of the chosen category,
 * cards the player has not seen first, and never shows a card twice within a round (the round ends when the deck does).
 */
import type { AppLocale } from '../i18n/locale'
import { selectUnseen, type Seen } from './questionHistory'
import type { Rng } from './sessionRandom'
import type { WhoAmICard } from './types'

const CATEGORY_LABEL: Record<string, Record<AppLocale, string>> = {
  'biblical-people': { en: 'Biblical people', am: 'የመጽሐፍ ቅዱስ ሰዎች' },
  'biblical-locations': { en: 'Biblical locations', am: 'የመጽሐፍ ቅዱስ ቦታዎች' },
  saints: { en: 'Saints', am: 'ቅዱሳን' },
  'holy-objects': { en: 'Holy objects', am: 'ቅዱሳት ዕቃዎች' },
}

/** Categories that actually have cards, with how many, largest first. */
export function categoriesOf(cards: readonly WhoAmICard[]): Array<{ id: string; count: number }> {
  const counts = new Map<string, number>()
  for (const card of cards) counts.set(card.category, (counts.get(card.category) ?? 0) + 1)
  return [...counts.entries()].map(([id, count]) => ({ id, count })).sort((a, b) => b.count - a.count || a.id.localeCompare(b.id))
}

export const categoryLabel = (id: string, locale: AppLocale) => CATEGORY_LABEL[id]?.[locale] ?? id

export function buildRoundOrder(cards: readonly WhoAmICard[], category: string, seen: Seen, random: Rng = Math.random): WhoAmICard[] {
  const pool = cards.filter((card) => category === 'all' || card.category === category)
  return selectUnseen([...pool], (card) => card.id, seen, pool.length, random).picked
}
