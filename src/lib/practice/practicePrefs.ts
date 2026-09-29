/** Local practice preferences (never uploaded). */

const SPEED_KEY = 'tewahedo:practice-speed'
const FONT_KEY = 'tewahedo:lyrics-font-size'
const FONT_KEY_LEGACY = 'tewahedo:practice-lyrics-size'
const MODE_KEY = 'tewahedo:practice-lyrics-mode'
const SCROLL_KEY = 'tewahedo:practice-auto-scroll'
const INTRO_KEY = 'tewahedo:lyrics-scroll-intro'
const OUTRO_KEY = 'tewahedo:lyrics-scroll-outro'

/** Pixel sizes available for lyrics text. */
export const LYRICS_FONT_SIZES = [18, 20, 22, 24, 28, 32, 36] as const
export type LyricsFontSizePx = (typeof LYRICS_FONT_SIZES)[number]

/** @deprecated Prefer LyricsFontSizePx — kept for migration of old sm/md/lg/xl values. */
export type LyricsFontSize = LyricsFontSizePx

export type LyricsScriptMode = 'lyrics' | 'transliteration' | 'both' | 'english'
export type AutoScrollSpeed = 'off' | 'slow' | 'medium' | 'fast'

const SPEEDS = [0.5, 0.75, 1, 1.25, 1.5] as const
export type PracticeSpeed = (typeof SPEEDS)[number]

const LEGACY_FONT_MAP: Record<string, LyricsFontSizePx> = {
  sm: 18,
  md: 20,
  lg: 28,
  xl: 32,
}

function read(key: string): string | null {
  try {
    return localStorage.getItem(key)
  } catch {
    return null
  }
}

function write(key: string, value: string) {
  try {
    localStorage.setItem(key, value)
  } catch {
    /* private mode */
  }
}

export function loadPlaybackSpeed(): PracticeSpeed {
  const raw = Number(read(SPEED_KEY))
  return (SPEEDS.find((s) => Math.abs(s - raw) < 0.01) || 1) as PracticeSpeed
}

export function savePlaybackSpeed(rate: number) {
  const snapped = SPEEDS.reduce((best, s) =>
    Math.abs(s - rate) < Math.abs(best - rate) ? s : best,
  )
  write(SPEED_KEY, String(snapped))
}

function clampFontPx(n: number): LyricsFontSizePx {
  const snapped = LYRICS_FONT_SIZES.reduce((best, s) =>
    Math.abs(s - n) < Math.abs(best - n) ? s : best,
  )
  return snapped
}

export function loadLyricsFontSize(): LyricsFontSizePx {
  const raw = read(FONT_KEY) ?? read(FONT_KEY_LEGACY)
  if (!raw) return 20
  if (LEGACY_FONT_MAP[raw]) return LEGACY_FONT_MAP[raw]
  const n = Number(raw)
  if (Number.isFinite(n)) return clampFontPx(n)
  return 20
}

export function saveLyricsFontSize(size: number) {
  const snapped = clampFontPx(size)
  write(FONT_KEY, String(snapped))
}

export function lyricsFontPx(size: number): number {
  return clampFontPx(size)
}

export function lyricsLineHeight(size: number): number {
  const px = clampFontPx(size)
  if (px <= 20) return 1.7
  if (px <= 22) return 1.7
  if (px <= 24) return 1.65
  if (px <= 28) return 1.6
  if (px <= 32) return 1.55
  return 1.5
}

export function loadLyricsMode(): LyricsScriptMode {
  const v = read(MODE_KEY)
  if (v === 'lyrics' || v === 'transliteration' || v === 'both' || v === 'english') return v
  return 'lyrics'
}

export function saveLyricsMode(mode: LyricsScriptMode) {
  write(MODE_KEY, mode)
}

export function loadAutoScroll(): AutoScrollSpeed {
  const v = read(SCROLL_KEY)
  if (v === 'off' || v === 'slow' || v === 'medium' || v === 'fast') return v
  return 'off'
}

export function saveAutoScroll(speed: AutoScrollSpeed) {
  write(SCROLL_KEY, speed)
}

export function loadScrollIntroSec(): number | null {
  const n = Number(read(INTRO_KEY))
  if (!Number.isFinite(n) || n < 0) return null
  return Math.min(120, Math.round(n))
}

export function saveScrollIntroSec(sec: number) {
  write(INTRO_KEY, String(Math.max(0, Math.min(120, Math.round(sec)))))
}

export function loadScrollOutroSec(): number | null {
  const n = Number(read(OUTRO_KEY))
  if (!Number.isFinite(n) || n < 0) return null
  return Math.min(120, Math.round(n))
}

export function saveScrollOutroSec(sec: number) {
  write(OUTRO_KEY, String(Math.max(0, Math.min(120, Math.round(sec)))))
}

export const PRACTICE_SPEEDS = SPEEDS
