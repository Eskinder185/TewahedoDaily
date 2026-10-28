import { LINES_PER_SLIDE_OPTIONS, type LinesPerSlide, type PresentationLanguage } from './presentationSlides'
import { PRESENTATION_THEMES, type PresentationTheme } from './presentationThemes'

/** Presentation preferences remembered on this device (no lyric content). */
export type PresentationPrefs = {
  language: PresentationLanguage | null
  linesPerSlide: LinesPerSlide
  fontSize: number
  align: 'left' | 'center'
  theme: PresentationTheme
  highContrast: boolean
  showTitle: boolean
  grouping: boolean
  showTransliteration: boolean
  includeAttribution: boolean
}

export const PRESENTATION_PREFS_KEY = 'td.mezmurPresentation.v1'
export const FONT_MIN = 32
export const FONT_MAX = 128
export const FONT_STEP = 4

export const DEFAULT_PRESENTATION_PREFS: PresentationPrefs = {
  language: null,
  linesPerSlide: 'auto',
  fontSize: 64,
  align: 'center',
  theme: 'navy',
  highContrast: false,
  showTitle: true,
  grouping: true,
  showTransliteration: true,
  includeAttribution: false,
}

const LANGS: PresentationLanguage[] = ['original', 'transliteration', 'english', 'both']

export function sanitizePresentationPrefs(value: unknown): PresentationPrefs {
  const d = DEFAULT_PRESENTATION_PREFS
  if (!value || typeof value !== 'object') return d
  const p = value as Partial<Record<keyof PresentationPrefs, unknown>>
  const bool = (v: unknown, fallback: boolean) => (typeof v === 'boolean' ? v : fallback)
  const size = Number(p.fontSize)
  return {
    language: LANGS.includes(p.language as PresentationLanguage) ? (p.language as PresentationLanguage) : null,
    linesPerSlide: LINES_PER_SLIDE_OPTIONS.includes(p.linesPerSlide as LinesPerSlide) ? (p.linesPerSlide as LinesPerSlide) : d.linesPerSlide,
    fontSize: Number.isFinite(size) ? Math.max(FONT_MIN, Math.min(FONT_MAX, Math.round(size))) : d.fontSize,
    align: p.align === 'left' ? 'left' : 'center',
    theme: typeof p.theme === 'string' && p.theme in PRESENTATION_THEMES ? (p.theme as PresentationTheme) : d.theme,
    highContrast: bool(p.highContrast, d.highContrast),
    showTitle: bool(p.showTitle, d.showTitle),
    grouping: bool(p.grouping, d.grouping),
    showTransliteration: bool(p.showTransliteration, d.showTransliteration),
    includeAttribution: bool(p.includeAttribution, d.includeAttribution),
  }
}

export function readPresentationPrefs(): PresentationPrefs {
  try {
    const raw = window.localStorage.getItem(PRESENTATION_PREFS_KEY)
    return raw ? sanitizePresentationPrefs(JSON.parse(raw)) : DEFAULT_PRESENTATION_PREFS
  } catch {
    return DEFAULT_PRESENTATION_PREFS
  }
}

export function writePresentationPrefs(prefs: PresentationPrefs) {
  try {
    window.localStorage.setItem(PRESENTATION_PREFS_KEY, JSON.stringify(prefs))
  } catch {
    /* storage unavailable — preferences are simply not remembered */
  }
}
