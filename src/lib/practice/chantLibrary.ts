import type { WerbEntry } from '../../data/types/werb'
import { MEZMUR_ITEMS } from './mezmurData'
import type { MezmurItem } from './types'
import { WERB_ENTRIES } from './werbData'

/** `mezmur` = workshop mezmur chants; `werb` = werb. Mezmur: `amharic-chants.json` + `english-mezmur-chants.json`. Werb: `werb.json` plus any `type: chant` / `form: werb` rows in `amharic-chants.json`. */
export type ChantForm = 'mezmur' | 'werb'

export type ChantLibraryEntry =
  | { form: 'mezmur'; item: MezmurItem }
  | { form: 'werb'; item: WerbEntry }

function compareTitles(a: string, b: string): number {
  return a.localeCompare(b, 'am', { sensitivity: 'base' })
}

function buildChantLibrary(): ChantLibraryEntry[] {
  const mezmur: ChantLibraryEntry[] = MEZMUR_ITEMS.map((item) => ({
    form: 'mezmur',
    item,
  }))
  const werb: ChantLibraryEntry[] = WERB_ENTRIES.map((item) => ({
    form: 'werb',
    item,
  }))
  return [...mezmur, ...werb].sort((x, y) =>
    compareTitles(x.item.title, y.item.title),
  )
}

/** Practice browse list: mezmur and werb from `data/chants/`, sorted by title. */
export const CHANT_LIBRARY: ChantLibraryEntry[] = buildChantLibrary()

export function chantEntryKey(entry: ChantLibraryEntry): string {
  return `${entry.form}:${entry.item.id}`
}
