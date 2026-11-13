/**
 * Match & Discover boards: drawn from the WHOLE pair pool, preferring pairs the player has not seen, never repeating
 * a pair within a board, and never putting two cards with the same label on one board (a duplicate label would make
 * the answer ambiguous). If the pool cannot fill the requested size, the board is smaller and says so.
 */
import type { AppLocale } from '../i18n/locale'
import { localized, type MatchPair } from './types'
import { selectUnseen, type Seen } from './questionHistory'
import type { Rng } from './sessionRandom'

export const labelKey = (text: string) => text.normalize('NFKC').toLowerCase().replace(/[^\p{L}\p{N}]+/gu, ' ').trim()

export function pairLabels(pair: MatchPair, locale: AppLocale): [string, string] {
  return [labelKey(localized(pair.left, locale).text), labelKey(localized(pair.right, locale).text)]
}

export function pickBoard(pairs: readonly MatchPair[], size: number, locale: AppLocale, seen: Seen, random: Rng = Math.random): MatchPair[] {
  const ordered = selectUnseen([...pairs], (pair) => pair.id, seen, pairs.length, random).picked
  const used = new Set<string>()
  const board: MatchPair[] = []
  for (const pair of ordered) {
    if (board.length >= size) break
    const [left, right] = pairLabels(pair, locale)
    if (!left || !right || left === right || used.has(left) || used.has(right)) continue
    used.add(left); used.add(right)
    board.push(pair)
  }
  return board
}
