import type { ChantLibraryEntry } from './chantLibrary'

const MAX = 118

/** Short plain-language line from optional `meaning` fields — never touches lyrics. */
export function chantMeaningTeaser(entry: ChantLibraryEntry): string | undefined {
  const raw =
    entry.form === 'mezmur'
      ? entry.item.meaning?.trim()
      : entry.item.meaning?.trim()
  if (!raw) return undefined
  return raw.length > MAX ? `${raw.slice(0, MAX - 1)}…` : raw
}
