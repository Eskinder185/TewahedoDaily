/**
 * Presentation slide engine for "Present Mezmur" and the PowerPoint export.
 *
 * Pure and deterministic: it only splits the stored lyric text into slides.
 * It never rewrites, translates, re-orders or repeats lyric lines. Section
 * headings already present in the text (VERSE 1, CHORUS, አዝማች …) become slide
 * labels; every other line is kept verbatim (repeat markers such as "(2x)" or
 * "/2/" included), in its original order.
 */

export type PresentationLanguage = 'original' | 'transliteration' | 'english' | 'both'
export type LinesPerSlide = 1 | 2 | 3 | 4 | 6 | 'auto'
export type SectionKind = 'verse' | 'chorus' | 'other'

export type PresentationSourceInput = {
  title?: string | null
  title_amharic?: string | null
  transliteration_title?: string | null
  singer_name?: string | null
  source?: string | null
  language?: string | null
  primary_language?: string | null
  lyrics_amharic?: string | null
  lyrics_geez?: string | null
  lyrics_tigrinya?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  lyrics_transliteration?: string | null
  transliteration?: string | null
}

export type LyricSection = {
  /** Heading as written in the lyrics, or '' when the block had none. */
  label: string
  kind: SectionKind
  lines: string[]
}

export type OriginalLanguage = {
  code: 'am' | 'gez' | 'ti' | 'en' | 'om'
  labelEn: string
  labelAm: string
  isEthiopic: boolean
}

export type LanguageOption = {
  id: PresentationLanguage
  labelEn: string
  labelAm: string
  available: boolean
  /** Why the option is disabled (English copy). */
  reason?: string
}

export type PresentationSource = {
  title: string
  subtitle: string | null
  singer: string | null
  attribution: string | null
  original: OriginalLanguage | null
  originalText: string
  transliterationText: string
  englishText: string
  languages: LanguageOption[]
  defaultLanguage: PresentationLanguage | null
  /** Alignment between original and transliteration ('none' = Both disabled). */
  bothAlignment: 'lines' | 'sections' | 'none'
}

export type SlideLine = {
  /** Primary text: original, transliteration or English depending on mode. */
  text: string
  /** Secondary text (transliteration) in "both" mode. */
  secondary?: string
}

export type PresentationSlide = {
  id: string
  type: 'title' | 'lyrics'
  label: string
  kind: SectionKind
  lines: SlideLine[]
  /** Script of the primary text, for fonts and lang attributes. */
  lang: string
  isEthiopic: boolean
  /** Title slide only. */
  title?: string
  subtitle?: string | null
  singer?: string | null
}

export type BuildSlidesOptions = {
  language: PresentationLanguage
  linesPerSlide: LinesPerSlide
  /** Used when linesPerSlide is 'auto': how many text lines fit on a slide. */
  autoCapacity?: number
  includeTitleSlide?: boolean
  /** Keep verse/refrain boundaries (true) or flow lines continuously (false). */
  groupBySection?: boolean
  /** In "both" mode, show the transliteration under each original line. */
  showTransliteration?: boolean
}

export const LINES_PER_SLIDE_OPTIONS: LinesPerSlide[] = [1, 2, 3, 4, 6, 'auto']

const HEADING =
  /^\[?\s*(verse|chorus|refrain|bridge|intro|outro|ቁጥር|አዝማች|አዝ|መልስ|ምላሽ)(?:\s*(?:\d+|[፩-፲]+))?\s*\]?[_\s:.-]*$/iu
const ETHIOPIC = /[ሀ-፿ᎀ-᎟ⶀ-⷟꬀-꬯]/u

function clean(value: string | null | undefined): string {
  return (value || '').replace(/\r\n?/g, '\n').trim()
}

export function isHeadingLine(line: string): boolean {
  return HEADING.test(line.trim())
}

function headingKind(line: string): SectionKind {
  const value = line.toLowerCase()
  if (/chorus|refrain|አዝማች|አዝ|መልስ|ምላሽ/u.test(value)) return 'chorus'
  if (/verse|ቁጥር/u.test(value)) return 'verse'
  return 'other'
}

/**
 * Split lyrics into sections. Blank lines and heading lines start a new
 * section; text lines are kept exactly (only surrounding whitespace trimmed).
 */
export function splitLyricSections(text: string | null | undefined): LyricSection[] {
  const sections: LyricSection[] = []
  let current: LyricSection | null = null
  const flush = () => {
    if (current && current.lines.length) sections.push(current)
    current = null
  }
  for (const raw of clean(text).split('\n')) {
    const line = raw.trim()
    if (!line) {
      flush()
      continue
    }
    if (isHeadingLine(line)) {
      flush()
      current = { label: line.replace(/[_\s:.-]+$/u, '').replace(/^\[|\]$/gu, '').trim(), kind: headingKind(line), lines: [] }
      continue
    }
    if (!current) current = { label: '', kind: 'verse', lines: [] }
    current.lines.push(line)
  }
  flush()
  return sections
}

function detectOriginal(input: PresentationSourceInput): { lang: OriginalLanguage; text: string } | null {
  const amharic = clean(input.lyrics_amharic)
  const geez = clean(input.lyrics_geez)
  const tigrinya = clean(input.lyrics_tigrinya)
  const english = clean(input.lyrics_english)
  const oromo = clean(input.lyrics_oromo)
  const prime = (input.language || input.primary_language || '').toLowerCase()

  const am: OriginalLanguage = { code: 'am', labelEn: 'Amharic', labelAm: 'አማርኛ', isEthiopic: true }
  const gez: OriginalLanguage = { code: 'gez', labelEn: 'Geʽez', labelAm: 'ግዕዝ', isEthiopic: true }
  const ti: OriginalLanguage = { code: 'ti', labelEn: 'Tigrinya', labelAm: 'ትግርኛ', isEthiopic: true }

  if (tigrinya) return { lang: ti, text: tigrinya }
  if ((prime.startsWith('ti') || prime === 'tigrinya') && (amharic || geez)) return { lang: ti, text: amharic || geez }
  if ((prime.startsWith('gez') || prime === 'geez') && (geez || amharic)) return { lang: gez, text: geez || amharic }
  if (amharic) {
    // English text stored in lyrics_amharic stays English.
    if (!ETHIOPIC.test(amharic)) return { lang: { code: 'en', labelEn: 'English', labelAm: 'English', isEthiopic: false }, text: amharic }
    return { lang: am, text: amharic }
  }
  if (geez) return { lang: gez, text: geez }
  if (oromo) return { lang: { code: 'om', labelEn: 'Afaan Oromoo', labelAm: 'Afaan Oromoo', isEthiopic: false }, text: oromo }
  if (english) return { lang: { code: 'en', labelEn: 'English', labelAm: 'English', isEthiopic: false }, text: english }
  return null
}

function lineCount(sections: LyricSection[]): number {
  return sections.reduce((sum, section) => sum + section.lines.length, 0)
}

export function describeBothAlignment(originalText: string, transliterationText: string): PresentationSource['bothAlignment'] {
  if (!originalText || !transliterationText) return 'none'
  const orig = splitLyricSections(originalText)
  const trans = splitLyricSections(transliterationText)
  if (!orig.length || !trans.length) return 'none'
  if (lineCount(orig) === lineCount(trans)) return 'lines'
  if (orig.length === trans.length) return 'sections'
  return 'none'
}

export function buildPresentationSource(input: PresentationSourceInput): PresentationSource {
  const detected = detectOriginal(input)
  const originalText = detected?.text || ''
  const transliterationText = clean(input.lyrics_transliteration || input.transliteration)
  const englishRaw = clean(input.lyrics_english)
  // English is a separate option only when it is not already the original.
  const englishText = detected?.lang.code === 'en' && detected.text === englishRaw ? '' : englishRaw
  const bothAlignment =
    detected?.lang.isEthiopic && transliterationText
      ? describeBothAlignment(originalText, transliterationText)
      : 'none'

  const originalLabelEn = detected?.lang.labelEn || 'Amharic'
  const originalLabelAm = detected?.lang.labelAm || 'አማርኛ'
  const languages: LanguageOption[] = [
    {
      id: 'original',
      labelEn: originalLabelEn,
      labelAm: originalLabelAm,
      available: Boolean(originalText),
      reason: originalText ? undefined : `${originalLabelEn} lyrics are not available for this Mezmur.`,
    },
    {
      id: 'transliteration',
      labelEn: 'Transliteration',
      labelAm: 'በላቲን ፊደል',
      available: Boolean(transliterationText),
      reason: transliterationText ? undefined : 'No transliteration is available for this Mezmur.',
    },
    {
      id: 'english',
      labelEn: 'English',
      labelAm: 'እንግሊዝኛ',
      available: Boolean(englishText),
      reason: englishText ? undefined : 'No English lyrics are available for this Mezmur.',
    },
    {
      id: 'both',
      labelEn: 'Both',
      labelAm: 'ሁለቱም',
      available: bothAlignment !== 'none',
      reason:
        bothAlignment !== 'none'
          ? undefined
          : !transliterationText || !detected?.lang.isEthiopic
            ? 'Both needs the original lyrics and a transliteration.'
            : 'The transliteration does not line up with the original lyrics.',
    },
  ]

  const prime = (input.language || input.primary_language || '').toLowerCase()
  const order: PresentationLanguage[] = prime.startsWith('en') && englishText ? ['english', 'original', 'transliteration'] : ['original', 'transliteration', 'english']
  const defaultLanguage = order.find((id) => languages.find((l) => l.id === id)?.available) || null

  const amTitle = clean(input.title_amharic)
  const title = amTitle || clean(input.title)
  const translitTitle = clean(input.transliteration_title) || clean(input.title)
  return {
    title,
    subtitle: translitTitle && translitTitle !== title ? translitTitle : null,
    singer: clean(input.singer_name) || null,
    attribution: clean(input.source) || null,
    original: detected?.lang || null,
    originalText,
    transliterationText,
    englishText,
    languages,
    defaultLanguage,
    bothAlignment,
  }
}

export function isLanguageAvailable(source: PresentationSource, language: PresentationLanguage): boolean {
  return Boolean(source.languages.find((l) => l.id === language)?.available)
}

/** Fall back to an available language when the requested one is not. */
export function resolveLanguage(source: PresentationSource, requested: PresentationLanguage | null | undefined): PresentationLanguage | null {
  if (requested && isLanguageAvailable(source, requested)) return requested
  return source.defaultLanguage
}

type Unit = { text: string; secondary?: string }
type UnitSection = { label: string; kind: SectionKind; units: Unit[] }

function sectionsToUnits(sections: LyricSection[]): UnitSection[] {
  return sections.map((s) => ({ label: s.label, kind: s.kind, units: s.lines.map((text) => ({ text })) }))
}

/** Split `items` into `parts` contiguous, nearly equal chunks (order kept). */
function evenSplit<T>(items: T[], parts: number): T[][] {
  const out: T[][] = []
  const n = Math.max(1, Math.min(parts, items.length))
  let start = 0
  for (let i = 0; i < n; i++) {
    const size = Math.floor(items.length / n) + (i < items.length % n ? 1 : 0)
    out.push(items.slice(start, start + size))
    start += size
  }
  return out.filter((c) => c.length)
}

/**
 * Pair original and transliteration. Line-for-line when the totals match;
 * otherwise section-by-section, where each section becomes one paired block
 * (secondary text attached to the block, never re-assigned across sections).
 */
function pairBoth(originalText: string, transliterationText: string, alignment: PresentationSource['bothAlignment']): UnitSection[] {
  const orig = splitLyricSections(originalText)
  const trans = splitLyricSections(transliterationText)
  if (alignment === 'lines') {
    const flat = trans.flatMap((s) => s.lines)
    let k = 0
    return orig.map((s) => ({
      label: s.label,
      kind: s.kind,
      units: s.lines.map((text) => ({ text, secondary: flat[k++] })),
    }))
  }
  if (alignment === 'sections') {
    return orig.map((s, i) => {
      const t = trans[i]?.lines || []
      // Same line count inside this section → pair lines; otherwise distribute
      // the section's transliteration lines evenly over its original lines.
      if (t.length === s.lines.length) {
        return { label: s.label, kind: s.kind, units: s.lines.map((text, j) => ({ text, secondary: t[j] })) }
      }
      const groups = evenSplit(t, s.lines.length)
      return {
        label: s.label,
        kind: s.kind,
        units: s.lines.map((text, j) => ({ text, secondary: groups[j]?.join(' ') || undefined })),
      }
    })
  }
  return sectionsToUnits(orig)
}

function chunk(units: Unit[], size: number, balanced: boolean): Unit[][] {
  if (units.length <= size) return [units]
  if (balanced) return evenSplit(units, Math.ceil(units.length / size))
  const out: Unit[][] = []
  for (let i = 0; i < units.length; i += size) out.push(units.slice(i, i + size))
  return out
}

/** Default number of text lines a 16:9 slide holds at a given font size. */
export function autoLinesCapacity(fontSizePx: number, bothMode: boolean, stageHeightPx = 1080): number {
  const usable = stageHeightPx * 0.72
  const perLine = fontSizePx * (bothMode ? 1.45 + 0.8 * 1.35 : 1.45)
  return Math.max(1, Math.min(8, Math.floor(usable / perLine)))
}

export function buildPresentationSlides(source: PresentationSource, options: BuildSlidesOptions): PresentationSlide[] {
  const language = resolveLanguage(source, options.language)
  const slides: PresentationSlide[] = []
  if (options.includeTitleSlide && source.title) {
    slides.push({
      id: 'title',
      type: 'title',
      label: '',
      kind: 'other',
      lines: [],
      lang: source.original?.isEthiopic && ETHIOPIC.test(source.title) ? source.original.code : 'en',
      isEthiopic: ETHIOPIC.test(source.title),
      title: source.title,
      subtitle: source.subtitle,
      singer: source.singer,
    })
  }
  if (!language) return slides

  let sections: UnitSection[]
  let lang = 'en'
  let isEthiopic = false
  if (language === 'original') {
    sections = sectionsToUnits(splitLyricSections(source.originalText))
    lang = source.original?.code || 'am'
    isEthiopic = Boolean(source.original?.isEthiopic)
  } else if (language === 'transliteration') {
    sections = sectionsToUnits(splitLyricSections(source.transliterationText))
  } else if (language === 'english') {
    sections = sectionsToUnits(splitLyricSections(source.englishText))
  } else {
    sections = pairBoth(source.originalText, source.transliterationText, source.bothAlignment)
    if (options.showTransliteration === false) {
      sections = sections.map((s) => ({ ...s, units: s.units.map((u) => ({ text: u.text })) }))
    }
    lang = source.original?.code || 'am'
    isEthiopic = true
  }

  const auto = options.linesPerSlide === 'auto'
  const size = auto ? Math.max(1, Math.floor(options.autoCapacity || 4)) : options.linesPerSlide
  const grouped = options.groupBySection !== false

  const groups: UnitSection[] = grouped
    ? sections
    : [{ label: '', kind: 'verse', units: sections.flatMap((s) => s.units) }]

  let n = 0
  for (const group of groups) {
    for (const part of chunk(group.units, size as number, auto)) {
      n += 1
      slides.push({
        id: `slide-${n}`,
        type: 'lyrics',
        label: grouped ? group.label : '',
        kind: group.kind,
        lines: part.map((u) => (u.secondary ? { text: u.text, secondary: u.secondary } : { text: u.text })),
        lang,
        isEthiopic,
      })
    }
  }
  return slides
}

/** Every lyric line of the chosen language, in order — used by tests to prove nothing is lost. */
export function flattenSlideText(slides: PresentationSlide[]): string[] {
  return slides.filter((s) => s.type === 'lyrics').flatMap((s) => s.lines.map((l) => l.text))
}

export function clampSlideIndex(index: number, total: number): number {
  if (total <= 0) return 0
  return Math.max(0, Math.min(total - 1, index))
}

/** Keep roughly the same place in the song when the slide list is rebuilt. */
export function mapSlideIndex(previous: PresentationSlide[], next: PresentationSlide[], index: number): number {
  if (!next.length) return 0
  const prev = previous[index]
  if (!prev) return clampSlideIndex(index, next.length)
  if (prev.type === 'title') return 0
  const lineOffset = previous.slice(0, index).reduce((sum, s) => sum + (s.type === 'lyrics' ? s.lines.length : 0), 0)
  let seen = 0
  for (let i = 0; i < next.length; i++) {
    if (next[i].type !== 'lyrics') continue
    if (seen + next[i].lines.length > lineOffset) return i
    seen += next[i].lines.length
  }
  return next.length - 1
}
