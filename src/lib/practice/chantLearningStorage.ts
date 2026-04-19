const PREFIX = 'tewahedo-chant-progress:'

export type ChantProgress = 'learned' | 'review'

export function getChantProgress(entryId: string): ChantProgress | null {
  try {
    const v = localStorage.getItem(PREFIX + entryId)
    if (v === 'learned' || v === 'review') return v
  } catch {
    /* ignore */
  }
  return null
}

export function setChantProgress(entryId: string, state: ChantProgress | null) {
  try {
    if (state === null) localStorage.removeItem(PREFIX + entryId)
    else localStorage.setItem(PREFIX + entryId, state)
  } catch {
    /* ignore */
  }
}
