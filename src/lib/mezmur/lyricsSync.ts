/**
 * TEWAHEDODAILY — MEZMUR LYRICS SYNCHRONIZATION
 *
 * Line-level audio synchronization timestamps for authorized Mezmurs.
 * Only verified timestamps are used; if absent, static lyrics are displayed.
 */

export interface MezmurLineTimestamp {
  id: string
  mezmurId: string
  mediaSourceId?: string
  sectionIndex: number
  lineIndex: number
  lineIdentifier: string
  startTimeSeconds: number
  endTimeSeconds?: number
  verifiedBy?: string
  updatedAt: string
}

const STORAGE_KEY_PREFIX = 'tewahedo_mezmur_sync_'

export function getLocalMezmurSyncTimestamps(mezmurId: string): MezmurLineTimestamp[] {
  try {
    const raw = localStorage.getItem(`${STORAGE_KEY_PREFIX}${mezmurId}`)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    return Array.isArray(parsed) ? parsed : []
  } catch {
    return []
  }
}

export function saveLocalMezmurSyncTimestamps(
  mezmurId: string,
  timestamps: MezmurLineTimestamp[]
): void {
  try {
    localStorage.setItem(`${STORAGE_KEY_PREFIX}${mezmurId}`, JSON.stringify(timestamps))
  } catch {}
}

export function findActiveLyricLine(
  timestamps: MezmurLineTimestamp[],
  currentTimeSeconds: number
): MezmurLineTimestamp | null {
  if (!timestamps.length || currentTimeSeconds < 0) return null

  // Timestamps sorted ascending by start time
  for (let i = timestamps.length - 1; i >= 0; i--) {
    const ts = timestamps[i]
    if (currentTimeSeconds >= ts.startTimeSeconds) {
      if (ts.endTimeSeconds !== undefined) {
        if (currentTimeSeconds <= ts.endTimeSeconds) return ts
      } else {
        // Active until next line
        const next = timestamps[i + 1]
        if (!next || currentTimeSeconds < next.startTimeSeconds) return ts
      }
    }
  }

  return null
}
