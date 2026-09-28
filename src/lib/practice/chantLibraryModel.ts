import type { WerbEntry } from '../../data/types/werb'
import type { MezmurItem } from './types'

/** `mezmur` = workshop mezmur chants; `werb` = werb. */
export type ChantForm = 'mezmur' | 'werb'

export type ChantLibraryEntry =
  | { form: 'mezmur'; item: MezmurItem }
  | { form: 'werb'; item: WerbEntry }

function compareTitles(a: string, b: string): number {
  return a.localeCompare(b, 'am', { sensitivity: 'base' })
}

export function buildChantLibrary(
  mezmurItems: MezmurItem[],
  werbEntries: WerbEntry[],
): ChantLibraryEntry[] {
  const mezmur: ChantLibraryEntry[] = mezmurItems.map((item) => ({
    form: 'mezmur',
    item,
  }))
  const werb: ChantLibraryEntry[] = werbEntries.map((item) => ({
    form: 'werb',
    item,
  }))
  return [...mezmur, ...werb].sort((x, y) =>
    compareTitles(x.item.title, y.item.title),
  )
}

export function chantEntryKey(entry: ChantLibraryEntry): string {
  return `${entry.form}:${entry.item.id}`
}

export function findMezmurInLibrary(
  entries: ChantLibraryEntry[],
  slug?: string | null,
): MezmurItem | undefined {
  const normalized = slug?.trim().toLowerCase()
  if (!normalized) return undefined
  const match = entries.find(
    (entry) =>
      entry.form === 'mezmur' &&
      (entry.item.slug.toLowerCase() === normalized ||
        entry.item.id.toLowerCase() === normalized),
  )
  return match?.form === 'mezmur' ? match.item : undefined
}

