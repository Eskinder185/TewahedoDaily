/** Per-hymn quick practice loops (Loop 1 / 2 / 3) — localStorage only. */

export type QuickLoopId = 1 | 2 | 3

export type QuickLoopSlot = {
  startTime: number | null
  endTime: number | null
}

export type QuickLoopsState = {
  loop1: QuickLoopSlot
  loop2: QuickLoopSlot
  loop3: QuickLoopSlot
}

const STORAGE_PREFIX = 'mezmurPracticeLoops:'
const MIN_SPAN = 0.35

export function emptyQuickLoops(): QuickLoopsState {
  return {
    loop1: { startTime: null, endTime: null },
    loop2: { startTime: null, endTime: null },
    loop3: { startTime: null, endTime: null },
  }
}

export function quickLoopKey(id: QuickLoopId): keyof QuickLoopsState {
  return `loop${id}` as keyof QuickLoopsState
}

function isFiniteNumber(n: unknown): n is number {
  return typeof n === 'number' && Number.isFinite(n)
}

function sanitizeSlot(raw: unknown, durationSec?: number): QuickLoopSlot {
  if (!raw || typeof raw !== 'object') return { startTime: null, endTime: null }
  const startRaw = (raw as { startTime?: unknown }).startTime
  const endRaw = (raw as { endTime?: unknown }).endTime
  let startTime = isFiniteNumber(startRaw) ? startRaw : null
  let endTime = isFiniteNumber(endRaw) ? endRaw : null

  if (startTime != null && startTime < 0) startTime = null
  if (endTime != null && endTime < 0) endTime = null

  if (durationSec != null && durationSec > 0) {
    if (startTime != null && startTime >= durationSec) startTime = null
    if (endTime != null && endTime > durationSec) endTime = null
  }

  if (startTime != null && endTime != null && endTime <= startTime + MIN_SPAN) {
    return { startTime: null, endTime: null }
  }

  return { startTime, endTime }
}

export function sanitizeQuickLoops(
  raw: unknown,
  durationSec?: number,
): QuickLoopsState {
  const empty = emptyQuickLoops()
  if (!raw || typeof raw !== 'object') return empty
  const obj = raw as Record<string, unknown>
  return {
    loop1: sanitizeSlot(obj.loop1, durationSec),
    loop2: sanitizeSlot(obj.loop2, durationSec),
    loop3: sanitizeSlot(obj.loop3, durationSec),
  }
}

export function loadQuickLoops(mezmurId: string, durationSec?: number): QuickLoopsState {
  if (!mezmurId) return emptyQuickLoops()
  try {
    const raw = localStorage.getItem(`${STORAGE_PREFIX}${mezmurId}`)
    if (!raw) return emptyQuickLoops()
    return sanitizeQuickLoops(JSON.parse(raw) as unknown, durationSec)
  } catch {
    return emptyQuickLoops()
  }
}

export function persistQuickLoops(mezmurId: string, loops: QuickLoopsState): void {
  if (!mezmurId) return
  try {
    const clean = sanitizeQuickLoops(loops)
    localStorage.setItem(`${STORAGE_PREFIX}${mezmurId}`, JSON.stringify(clean))
  } catch {
    /* private mode / quota */
  }
}

export function slotIsConfigured(slot: QuickLoopSlot): boolean {
  return (
    slot.startTime != null &&
    slot.endTime != null &&
    slot.endTime > slot.startTime + MIN_SPAN
  )
}

export function validateQuickLoopRange(
  startTime: number | null,
  endTime: number | null,
): string | null {
  if (startTime == null || endTime == null) return null
  if (endTime <= startTime + MIN_SPAN) {
    return 'End must be after start.'
  }
  return null
}

export const QUICK_LOOP_IDS: QuickLoopId[] = [1, 2, 3]
export const QUICK_LOOP_MIN_SPAN = MIN_SPAN
