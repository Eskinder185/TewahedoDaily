import type { ChantForm } from './chantLibrary'

const STORAGE_KEY = 'tewahedo-daily-chant-loop-sections'

export type SavedChantLoopSection = {
  id: string
  label: string
  startSec: number
  endSec: number
}

function keyForChant(form: ChantForm, entryId: string): string {
  return `${form}:${entryId}`
}

export function loadSavedLoopSections(
  form: ChantForm,
  entryId: string,
): SavedChantLoopSection[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return []
    const all = JSON.parse(raw) as Record<string, unknown>
    const k = keyForChant(form, entryId)
    const list = all[k]
    if (!Array.isArray(list)) return []
    return list
      .filter(
        (x): x is SavedChantLoopSection =>
          typeof x === 'object' &&
          x !== null &&
          typeof (x as SavedChantLoopSection).id === 'string' &&
          typeof (x as SavedChantLoopSection).startSec === 'number' &&
          typeof (x as SavedChantLoopSection).endSec === 'number',
      )
      .map((x) => ({
        id: x.id,
        label: typeof x.label === 'string' ? x.label : 'Loop',
        startSec: x.startSec,
        endSec: x.endSec,
      }))
  } catch {
    return []
  }
}

export function persistSavedLoopSections(
  form: ChantForm,
  entryId: string,
  sections: SavedChantLoopSection[],
): void {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    const all: Record<string, SavedChantLoopSection[]> = raw
      ? (JSON.parse(raw) as Record<string, SavedChantLoopSection[]>)
      : {}
    all[keyForChant(form, entryId)] = sections
    localStorage.setItem(STORAGE_KEY, JSON.stringify(all))
  } catch {
    /* private mode / quota */
  }
}
