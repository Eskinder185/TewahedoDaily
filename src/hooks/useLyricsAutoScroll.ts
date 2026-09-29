import { useCallback, useEffect, useRef, useState, type RefObject } from 'react'
import type { AutoScrollSpeed } from '../lib/practice/practicePrefs'

const MANUAL_PAUSE_MS = 5000
const SMOOTHING = 0.18
const DEBUG =
  typeof import.meta !== 'undefined' &&
  Boolean((import.meta as ImportMeta & { env?: { DEV?: boolean } }).env?.DEV) &&
  typeof window !== 'undefined' &&
  (() => {
    try {
      return localStorage.getItem('tewahedo:debug-lyrics-scroll') === '1'
    } catch {
      return false
    }
  })()

export type LyricsWindow = {
  introSec: number
  outroSec: number
  lyricsStart: number
  lyricsEnd: number
}

/**
 * Adaptive intro/outro for mezmur structure.
 * Defaults ~30s / 30s for songs ≥ 4 minutes; scales down for shorter tracks.
 * When preferredIntro/Outro are provided, they are used then clamped so
 * lyricsEnd > lyricsStart.
 */
export function computeLyricsWindow(
  durationSec: number,
  preferredIntro: number | null = null,
  preferredOutro: number | null = null,
): LyricsWindow {
  const D = Number.isFinite(durationSec) && durationSec > 0 ? durationSec : 0
  if (D <= 0) {
    return { introSec: 0, outroSec: 0, lyricsStart: 0, lyricsEnd: 0 }
  }

  let intro: number
  let outro: number

  if (D >= 240) {
    intro = preferredIntro ?? 30
    outro = preferredOutro ?? 30
  } else if (D >= 120) {
    // 2–4 min: ~15–25s
    const scaled = Math.round(15 + ((D - 120) / 120) * 10)
    intro = preferredIntro ?? scaled
    outro = preferredOutro ?? scaled
  } else {
    // under 2 min: proportional, keep a usable active window
    const scaled = Math.max(3, Math.round(D * 0.12))
    intro = preferredIntro ?? scaled
    outro = preferredOutro ?? scaled
  }

  // Ensure lyricsEnd > lyricsStart with a usable middle window
  const maxPad = Math.max(0, (D - 2) / 2)
  intro = Math.min(Math.max(0, intro), maxPad)
  outro = Math.min(Math.max(0, outro), maxPad)

  let lyricsStart = intro
  let lyricsEnd = D - outro
  if (lyricsEnd <= lyricsStart) {
    lyricsStart = Math.min(intro, D * 0.15)
    lyricsEnd = Math.max(lyricsStart + 1, D * 0.85)
    if (lyricsEnd > D) lyricsEnd = D
  }

  return {
    introSec: lyricsStart,
    outroSec: D - lyricsEnd,
    lyricsStart,
    lyricsEnd,
  }
}

export function lyricsProgress(
  currentTimeSec: number,
  window: LyricsWindow,
  pace: AutoScrollSpeed,
): number {
  const { lyricsStart, lyricsEnd } = window
  const span = lyricsEnd - lyricsStart
  if (span <= 0) return 0

  let progress: number
  if (currentTimeSec <= lyricsStart) progress = 0
  else if (currentTimeSec >= lyricsEnd) progress = 1
  else progress = (currentTimeSec - lyricsStart) / span

  // Pace multiplies progress within the active window (still clamped 0–1)
  const factor = pace === 'slow' ? 0.85 : pace === 'fast' ? 1.15 : 1
  if (progress > 0 && progress < 1) {
    progress = Math.min(1, progress * factor)
  }

  return Math.max(0, Math.min(1, progress))
}

type Options = {
  enabled: boolean
  isPlaying: boolean
  currentTimeSec: number
  durationSec: number
  pace: AutoScrollSpeed
  preferredIntroSec: number | null
  preferredOutroSec: number | null
  /** Recompute when font/content changes scrollHeight */
  layoutKey: string | number
  scrollRef: RefObject<HTMLElement | null>
}

export function useLyricsAutoScroll({
  enabled,
  isPlaying,
  currentTimeSec,
  durationSec,
  pace,
  preferredIntroSec,
  preferredOutroSec,
  layoutKey,
  scrollRef,
}: Options) {
  const [manualPaused, setManualPaused] = useState(false)
  const [showResume, setShowResume] = useState(false)
  const targetRef = useRef(0)
  const rafRef = useRef<number | null>(null)
  const resumeTimerRef = useRef<number | null>(null)
  const applyingScrollRef = useRef(false)
  const timeRef = useRef(currentTimeSec)
  const playingRef = useRef(isPlaying)
  const enabledRef = useRef(enabled)
  const paceRef = useRef(pace)
  const durationRef = useRef(durationSec)
  const introRef = useRef(preferredIntroSec)
  const outroRef = useRef(preferredOutroSec)
  const manualRef = useRef(manualPaused)

  timeRef.current = currentTimeSec
  playingRef.current = isPlaying
  enabledRef.current = enabled
  paceRef.current = pace
  durationRef.current = durationSec
  introRef.current = preferredIntroSec
  outroRef.current = preferredOutroSec
  manualRef.current = manualPaused

  const computeTarget = useCallback(() => {
    const el = scrollRef.current
    if (!el) return 0
    const window = computeLyricsWindow(
      durationRef.current,
      introRef.current,
      outroRef.current,
    )
    const progress = lyricsProgress(timeRef.current, window, paceRef.current)
    const scrollable = Math.max(0, el.scrollHeight - el.clientHeight)
    const target = progress * scrollable

    if (DEBUG) {
      // eslint-disable-next-line no-console
      console.debug('[lyrics-scroll]', {
        duration: durationRef.current,
        currentTime: timeRef.current,
        lyricsStart: window.lyricsStart,
        lyricsEnd: window.lyricsEnd,
        progress,
        scrollHeight: el.scrollHeight,
        clientHeight: el.clientHeight,
        targetScrollTop: target,
      })
    }

    return target
  }, [scrollRef])

  const resumeAutoScroll = useCallback(() => {
    if (resumeTimerRef.current) {
      window.clearTimeout(resumeTimerRef.current)
      resumeTimerRef.current = null
    }
    setManualPaused(false)
    setShowResume(false)
    targetRef.current = computeTarget()
  }, [computeTarget])

  const pauseForManual = useCallback(() => {
    if (!enabledRef.current) return
    if (applyingScrollRef.current) return
    setManualPaused(true)
    setShowResume(true)
    if (resumeTimerRef.current) window.clearTimeout(resumeTimerRef.current)
    resumeTimerRef.current = window.setTimeout(() => {
      resumeAutoScroll()
    }, MANUAL_PAUSE_MS)
  }, [resumeAutoScroll])

  // Recalculate target when playback time / layout / prefs change
  useEffect(() => {
    if (!enabled || pace === 'off') return
    targetRef.current = computeTarget()
  }, [
    enabled,
    pace,
    currentTimeSec,
    durationSec,
    preferredIntroSec,
    preferredOutroSec,
    layoutKey,
    computeTarget,
  ])

  // Smooth rAF interpolation while playing and not manually paused
  useEffect(() => {
    const tick = () => {
      const el = scrollRef.current
      if (
        el &&
        enabledRef.current &&
        paceRef.current !== 'off' &&
        playingRef.current &&
        !manualRef.current
      ) {
        const target = targetRef.current
        const current = el.scrollTop
        const delta = target - current
        if (Math.abs(delta) > 0.4) {
          applyingScrollRef.current = true
          el.scrollTop = current + delta * SMOOTHING
          // release flag after browser paints
          requestAnimationFrame(() => {
            applyingScrollRef.current = false
          })
        } else if (Math.abs(delta) > 0.05) {
          applyingScrollRef.current = true
          el.scrollTop = target
          requestAnimationFrame(() => {
            applyingScrollRef.current = false
          })
        }
      }
      rafRef.current = requestAnimationFrame(tick)
    }
    rafRef.current = requestAnimationFrame(tick)
    return () => {
      if (rafRef.current != null) cancelAnimationFrame(rafRef.current)
    }
  }, [scrollRef])

  // ResizeObserver — font size / content height changes
  useEffect(() => {
    const el = scrollRef.current
    if (!el || typeof ResizeObserver === 'undefined') return
    const ro = new ResizeObserver(() => {
      targetRef.current = computeTarget()
    })
    ro.observe(el)
    return () => ro.disconnect()
  }, [scrollRef, layoutKey, computeTarget])

  // Manual scroll listeners (wheel / touch / keys) — also onScroll from element
  useEffect(() => {
    const el = scrollRef.current
    if (!el) return

    const onWheel = () => pauseForManual()
    const onTouch = () => pauseForManual()
    const onKey = (event: KeyboardEvent) => {
      if (
        event.key === 'PageUp' ||
        event.key === 'PageDown' ||
        event.key === 'ArrowUp' ||
        event.key === 'ArrowDown' ||
        event.key === 'Home' ||
        event.key === 'End'
      ) {
        if (el.contains(document.activeElement) || document.activeElement === el) {
          pauseForManual()
        }
      }
    }

    el.addEventListener('wheel', onWheel, { passive: true })
    el.addEventListener('touchstart', onTouch, { passive: true })
    window.addEventListener('keydown', onKey)
    return () => {
      el.removeEventListener('wheel', onWheel)
      el.removeEventListener('touchstart', onTouch)
      window.removeEventListener('keydown', onKey)
    }
  }, [scrollRef, pauseForManual, layoutKey])

  useEffect(() => {
    return () => {
      if (resumeTimerRef.current) window.clearTimeout(resumeTimerRef.current)
    }
  }, [])

  const onScroll = useCallback(() => {
    pauseForManual()
  }, [pauseForManual])

  const windowInfo = computeLyricsWindow(durationSec, preferredIntroSec, preferredOutroSec)

  return {
    manualPaused,
    showResume,
    resumeAutoScroll,
    onScroll,
    lyricsWindow: windowInfo,
  }
}
