/**
 * TEWAHEDODAILY — STRUCTURED MEZMUR LYRICS PARSER
 *
 * Normalizes original Amharic/Ge'ez lyrics, Latin transliteration, and English translation
 * into aligned stanzas, lines, and repetition indicators without mutating source database text.
 */

export type LyricSectionKind = 'chorus' | 'verse' | 'bridge' | 'intro' | 'outro' | 'other'

export interface ParsedLyricLine {
  id: string
  lineIndex: number
  originalText: string
  transliterationText?: string
  englishText?: string
  cleanOriginal: string
  cleanTransliteration?: string
  cleanEnglish?: string
  repetitionCount: number
}

export interface ParsedLyricSection {
  id: string
  sectionIndex: number
  kind: LyricSectionKind
  label: string
  labelAmharic: string
  labelTransliteration?: string
  lines: ParsedLyricLine[]
}

export interface ParsedHymnLyrics {
  sections: ParsedLyricSection[]
  totalOriginalLines: number
  totalTransliterationLines: number
  hasTransliteration: boolean
  hasEnglish: boolean
  alignmentStatus: 'perfect_match' | 'section_mismatch' | 'line_mismatch' | 'no_transliteration'
  mismatches: string[]
}

const SECTION_HEADER_REGEX = /^(?:\[?(chorus|refrain|verse|bridge|intro|outro|ቁጥር|አዝማች|አዝ|መልስ|ምላሽ)(?:\s*(\d+|[፩-፲]+))?\]?)[_\s:.-]*$/i

const REPETITION_REGEX = /\s*(?:\((\d+|[፩-፲]+)\s*[x×Xጊዚዜ]+\)|\((\d+|[፩-፲]+)\)|([፪፫፬፭])\s*[x×X]?)\s*$/

const ETHIOPIC_NUMERALS: Record<string, number> = {
  '፩': 1, '፪': 2, '፫': 3, '፬': 4, '፭': 5,
  '፮': 6, '፯': 7, '፰': 8, '፱': 9, '፲': 10,
}

function parseRepetition(text: string): { clean: string; count: number } {
  const match = text.match(REPETITION_REGEX)
  if (!match) return { clean: text.trim(), count: 1 }

  let count = 1
  if (match[1]) {
    count = ETHIOPIC_NUMERALS[match[1]] ?? parseInt(match[1], 10)
  } else if (match[2]) {
    count = ETHIOPIC_NUMERALS[match[2]] ?? parseInt(match[2], 10)
  } else if (match[3]) {
    count = ETHIOPIC_NUMERALS[match[3]] ?? 1
  }

  const clean = text.replace(REPETITION_REGEX, '').trim()
  return { clean, count: Number.isFinite(count) && count > 0 ? count : 1 }
}

function parseSectionKind(header: string): { kind: LyricSectionKind; number?: number } {
  const match = header.match(SECTION_HEADER_REGEX)
  if (!match) return { kind: 'verse' }

  const term = match[1].toLowerCase()
  const numStr = match[2]
  const num = numStr ? (ETHIOPIC_NUMERALS[numStr] ?? parseInt(numStr, 10)) : undefined

  if (/chorus|refrain|አዝማች|አዝ|መልስ|ምላሽ/.test(term)) {
    return { kind: 'chorus', number: num }
  }
  if (/bridge/.test(term)) {
    return { kind: 'bridge', number: num }
  }
  if (/intro/.test(term)) {
    return { kind: 'intro', number: num }
  }
  if (/outro/.test(term)) {
    return { kind: 'outro', number: num }
  }
  return { kind: 'verse', number: num }
}

interface RawSection {
  header: string
  lines: string[]
}

function splitIntoRawSections(rawText: string): RawSection[] {
  if (!rawText || !rawText.trim()) return []

  const rawLines = rawText.split(/\r?\n/)
  const sections: RawSection[] = []
  let currentHeader = ''
  let currentLines: string[] = []

  for (const line of rawLines) {
    const trimmed = line.trim()
    if (!trimmed) {
      if (currentLines.length > 0) {
        sections.push({ header: currentHeader, lines: currentLines })
        currentHeader = ''
        currentLines = []
      }
      continue
    }

    if (SECTION_HEADER_REGEX.test(trimmed)) {
      if (currentLines.length > 0) {
        sections.push({ header: currentHeader, lines: currentLines })
        currentLines = []
      }
      currentHeader = trimmed
    } else {
      currentLines.push(trimmed)
    }
  }

  if (currentLines.length > 0) {
    sections.push({ header: currentHeader, lines: currentLines })
  }

  return sections
}

/**
 * Parses and aligns original Ethiopic text, Latin transliteration, and optional English translation.
 */
export function parseStructuredLyrics(
  originalText: string | null | undefined,
  transliterationText?: string | null | undefined,
  englishText?: string | null | undefined
): ParsedHymnLyrics {
  const origSections = splitIntoRawSections(originalText || '')
  const transSections = splitIntoRawSections(transliterationText || '')
  const engSections = splitIntoRawSections(englishText || '')

  const hasTransliteration = transSections.length > 0
  const hasEnglish = engSections.length > 0
  const mismatches: string[] = []

  if (!hasTransliteration && (originalText?.trim() || '')) {
    mismatches.push('No Latin transliteration available for this hymn.')
  }

  if (hasTransliteration && origSections.length !== transSections.length) {
    mismatches.push(
      `Section count difference: Original has ${origSections.length} sections, Transliteration has ${transSections.length} sections.`
    )
  }

  let totalOriginalLines = 0
  let totalTransliterationLines = 0

  const maxSections = Math.max(origSections.length, transSections.length, engSections.length)
  const sections: ParsedLyricSection[] = []

  let verseCounter = 1
  let chorusCounter = 1

  // Detect introductory chorus without heading
  const sec0HasNoHeader = !origSections[0]?.header && !transSections[0]?.header
  const sec1HasVerseHeader = Boolean(
    (origSections[1]?.header && /verse|ቁጥር/i.test(origSections[1].header)) ||
    (transSections[1]?.header && /verse|ቁጥር/i.test(transSections[1].header))
  )
  const isIntroChorusWithoutHeading = sec0HasNoHeader && sec1HasVerseHeader && maxSections > 1

  for (let sIdx = 0; sIdx < maxSections; sIdx++) {
    const origSec = origSections[sIdx]
    const transSec = transSections[sIdx]
    const engSec = engSections[sIdx]

    const header = origSec?.header || transSec?.header || engSec?.header || ''
    const { kind, number } = parseSectionKind(header)

    let labelEn = ''
    let labelAm = ''

    if (sIdx === 0 && isIntroChorusWithoutHeading) {
      // Opening chorus without heading: keep label empty so lyrics start continuously
      labelEn = ''
      labelAm = ''
    } else if (kind === 'chorus') {
      const idx = number ?? (chorusCounter++)
      labelEn = `CHORUS ${idx > 1 ? idx : ''}`.trim()
      labelAm = `አዝማች ${idx > 1 ? idx : ''}`.trim()
    } else if (kind === 'bridge') {
      labelEn = 'BRIDGE'
      labelAm = 'ድልድይ'
    } else if (kind === 'intro') {
      labelEn = 'INTRO'
      labelAm = 'መግቢያ'
    } else if (kind === 'outro') {
      labelEn = 'OUTRO'
      labelAm = 'መደምደሚያ'
    } else {
      const idx = number ?? (verseCounter++)
      labelEn = `VERSE ${idx}`
      labelAm = `ቁጥር ${idx}`
    }

    const origLines = origSec?.lines || []
    const transLines = transSec?.lines || []
    const engLines = engSec?.lines || []

    totalOriginalLines += origLines.length
    totalTransliterationLines += transLines.length

    if (hasTransliteration && origLines.length !== transLines.length) {
      mismatches.push(
        `Section ${sIdx + 1} (${labelEn}) line count difference: Original ${origLines.length} lines vs Transliteration ${transLines.length} lines.`
      )
    }

    const maxLines = Math.max(origLines.length, transLines.length, engLines.length)
    const lines: ParsedLyricLine[] = []

    for (let lIdx = 0; lIdx < maxLines; lIdx++) {
      const rawOrig = origLines[lIdx] || ''
      const rawTrans = transLines[lIdx] || ''
      const rawEng = engLines[lIdx] || ''

      const origRep = parseRepetition(rawOrig)
      const transRep = parseRepetition(rawTrans)
      const engRep = parseRepetition(rawEng)

      const repetitionCount = Math.max(origRep.count, transRep.count, engRep.count)

      lines.push({
        id: `s${sIdx + 1}-l${lIdx + 1}`,
        lineIndex: lIdx + 1,
        originalText: rawOrig,
        transliterationText: rawTrans || undefined,
        englishText: rawEng || undefined,
        cleanOriginal: origRep.clean,
        cleanTransliteration: transRep.clean || undefined,
        cleanEnglish: engRep.clean || undefined,
        repetitionCount,
      })
    }

    sections.push({
      id: `section-${sIdx + 1}`,
      sectionIndex: sIdx + 1,
      kind,
      label: labelEn,
      labelAmharic: labelAm,
      labelTransliteration: header || undefined,
      lines,
    })
  }

  let alignmentStatus: ParsedHymnLyrics['alignmentStatus'] = 'perfect_match'
  if (!hasTransliteration) {
    alignmentStatus = 'no_transliteration'
  } else if (origSections.length !== transSections.length) {
    alignmentStatus = 'section_mismatch'
  } else if (mismatches.some((m) => m.includes('line count difference'))) {
    alignmentStatus = 'line_mismatch'
  }

  return {
    sections,
    totalOriginalLines,
    totalTransliterationLines,
    hasTransliteration,
    hasEnglish,
    alignmentStatus,
    mismatches,
  }
}
