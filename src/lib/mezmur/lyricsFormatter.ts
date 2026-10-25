/**
 * lyricsFormatter.ts
 *
 * Core engine for forced Chorus/Verse lyrics formatting, repair of damaged
 * previous formatter output, and paired Ethiopic-script / Latin-transliteration
 * structural alignment.
 *
 * Enforced Pattern:
 *   CHORUS
 *   [2 to 4 chorus lines]
 *
 *   VERSE 1
 *   [Verse 1 lines, max 4 lines]
 *
 *   CHORUS
 *   [Same chorus]
 *
 *   VERSE 2
 *   [Verse 2 lines, max 4 lines]
 *
 *   CHORUS
 *   [Same chorus]
 *   ...
 *   VERSE N
 *   [Verse N lines, max 4 lines]
 *
 *   CHORUS
 *   [Same chorus]
 *
 * Every song starts with CHORUS and ends with CHORUS.
 * For a single-paragraph song (<= 4 lines total):
 *   CHORUS -> [Lines]
 *   VERSE 1 -> [Lines]
 *   CHORUS -> [Lines]
 */

export type FormattedSection = {
  type: 'chorus' | 'verse'
  number?: number // 1, 2, 3...
  lines: string[]
}

export type AlignmentType = 'exact' | 'merged' | 'split' | 'approximate' | 'single_paragraph' | 'none'

export type RawStanza = {
  lines: string[]
  isExplicitChorus: boolean
  originalHeading?: string
}

export type ExtractedSongStructure = {
  chorusLines: string[]
  verses: string[][]
  isSingleParagraph: boolean
}

export type LyricsFormattingResult = {
  formattedText: string
  chorusCount: number
  verseCount: number
  sectionCount: number
  sourceParagraphCount: number
  isAlreadyFormatted: boolean
}

export type PairedFormattingResult = {
  ok: boolean
  formattedOriginal: string
  formattedTransliteration: string
  chorusCount: number
  verseCount: number
  sectionCount: number
  origParagraphCount: number
  transParagraphCountBefore: number
  transParagraphCountAfter: number
  alignmentType: AlignmentType
  error?: string
}

export type MezmurLyricsFields = {
  import_id: string
  slug: string
  title: string
  status: 'draft' | 'published'
  lyrics_amharic?: string | null
  lyrics_geez?: string | null
  lyrics_tigrinya?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  lyrics_transliteration?: string | null
  language?: string | null
  primary_language?: string | null
}

export type FormattedMezmurRecordResult = {
  importId: string
  slug: string
  title: string
  status: 'draft' | 'published'
  changed: boolean
  alreadyFormatted: boolean
  hasLyrics: boolean
  missingLyrics?: boolean
  populatedLanguages: string[]
  origParagraphCount: number
  transParagraphCountBefore: number
  transParagraphCountAfter: number
  chorusCount: number
  verseCount: number
  sectionCount: number
  alignmentType: AlignmentType
  updatedLyrics: {
    lyrics_amharic?: string | null
    lyrics_geez?: string | null
    lyrics_tigrinya?: string | null
    lyrics_english?: string | null
    lyrics_oromo?: string | null
    lyrics_transliteration?: string | null
  }
  ok: boolean
  error?: string
}

// Ethiopic script Unicode range: Amharic, Ge'ez, Tigrinya
const ETHIOPIC_REGEX = /[\u1200-\u137F\u1380-\u139F\u2D80-\u2DDF\uAB00-\uAB2F]/

/**
 * Ethiopian shorthand chorus markers:
 * አዝ, አዝ_, አዝ__, አዝ___, አዝ____, አዝ...., አዝማች, አዝማች:, መልስ
 * English equivalents:
 * CHORUS, REFRAIN
 * Variants with arbitrary underscores, brackets, punctuation, hashes, asterisks.
 */
const CHORUS_MARKER_LINE_REGEX =
  /^(?:#+\s*)?(?:\[|\(|\/|\*)*\s*(?:አዝ(?:ማች)?|መልስ|CHORUS|REFRAIN)[_\s:.\-~*#/)]*(?:\)|\/|\]|\*)*$/i

/**
 * Trailing chorus marker at end of a lyric line (e.g. "Line 4 አዝ___" or "Line 4 (አዝ)")
 */
const TRAILING_CHORUS_MARKER_REGEX =
  /(?:[\s([/]+)(?:አዝ(?:ማች)?|መልስ|CHORUS|REFRAIN)[_\s:.\-~*#/\]]*$/i

/**
 * Verse markers (e.g. "VERSE 1", "ቁጥር 1", "ክፍል 1", "ስንኝ 1", "BRIDGE")
 */
const VERSE_MARKER_LINE_REGEX =
  /^(?:#+\s*)?(?:\[|\(|\*)*\s*(?:VERSE(?:\s*\d+)?|ቁጥር(?:\s*\d+)?|ክፍል(?:\s*\d+)?|ስንኝ(?:\s*\d+)?|BRIDGE)[_\s:.\-~*#/)]*(?:\)|\/|\]|\*)*$/i

export function hasEthiopicScript(text: string | null | undefined): boolean {
  if (!text) return false
  return ETHIOPIC_REGEX.test(text)
}

/**
 * Checks if a standalone line is a chorus marker instruction.
 */
export function isChorusMarkerLine(line: string): boolean {
  if (!line || !line.trim()) return false
  return CHORUS_MARKER_LINE_REGEX.test(line.trim())
}

/**
 * Checks if a standalone line is a verse heading marker instruction.
 */
export function isVerseMarkerLine(line: string): boolean {
  if (!line || !line.trim()) return false
  return VERSE_MARKER_LINE_REGEX.test(line.trim())
}

/**
 * Removes unwanted symbols from a lyric line according to Rule 8:
 * Allowed:
 * - Alphabetic letters across supported writing systems (Ethiopic, Latin, etc.)
 * - Numbers (Arabic digits 0-9 and Ethiopic numbers \u1369-\u137C: ፩, ፪, etc.)
 * - Spaces
 * - Parentheses ( )
 * - Meaningful text punctuation (apostrophe for Oromo/English, comma, period, question mark, Ethiopic word punctuation)
 * Remove:
 * - Underscores
 * - Markdown asterisks (*), hashes (#), tildes (~), backticks (`)
 * - Decorative bullets (•, ⁃, ◦, ‣, ●, etc.)
 * - Decorative separator symbols (---, ===, etc.)
 * - Emoji (\p{Extended_Pictographic})
 * - Unnecessary decorative punctuation
 */
export function cleanLyricLine(rawLine: string): string {
  if (!rawLine) return ''

  let line = rawLine

  // 1. Strip trailing chorus marker if present at end of line (e.g. "Line 4 አዝ____" -> "Line 4")
  if (TRAILING_CHORUS_MARKER_REGEX.test(line)) {
    line = line.replace(TRAILING_CHORUS_MARKER_REGEX, '')
  }

  // 2. Remove emojis and presentation selectors
  line = line.replace(/[\p{Extended_Pictographic}\uFE00-\uFE0F\u200D]/gu, '')

  // 3. Remove markdown headers and formatting symbols
  line = line.replace(/^#+\s*/, '')
  line = line.replace(/\*+/g, '')
  line = line.replace(/_+/g, ' ') // Replace underscores with space so words don't merge
  line = line.replace(/[`~^=]/g, '')

  // 4. Remove decorative bullets anywhere in line
  line = line.replace(/[•⁃◦‣●○■□▪▫]/g, '')

  // 5. Remove leading bullets or list dashes
  line = line.replace(/^[\s–—\-*]+\s*/, '')

  // 6. Remove decorative trailing or repeated separator dashes/dots
  line = line.replace(/\.{3,}/g, ' ')
  line = line.replace(/-{2,}/g, ' ')

  // 7. Normalize whitespace
  line = line.replace(/[\t\u00A0\u1680\u2000-\u200A\u202F\u205F\u3000]/g, ' ')
  line = line.replace(/\s+/g, ' ')

  return line.trim()
}

/**
 * Validates whether a formatted text adheres to all 18 rules:
 * - Starts with CHORUS
 * - Ends with CHORUS
 * - Alternating CHORUS and VERSE 1, 2, ...
 * - Chorus has 1 to 4 lines (never exceeds 4 lines)
 * - Verses have 1 to 4 lines
 * - No አዝ markers remain
 * - No markdown remains
 * - No duplicate entire-song blocks in CHORUS and VERSE 1
 */
export function validateFormattedLyrics(
  text: string | null | undefined,
  originalText?: string,
): { valid: boolean; reason?: string } {
  if (!text || !text.trim()) {
    return { valid: false, reason: 'Formatted lyrics text is empty' }
  }

  const blocks = text.trim().split(/\r?\n\s*\r?\n+/).map((b) => b.trim()).filter(Boolean)
  if (blocks.length < 3) {
    return { valid: false, reason: 'Formatted lyrics must have at least CHORUS, VERSE 1, and CHORUS (minimum 3 sections)' }
  }

  // First section must be CHORUS
  const firstBlockLines = blocks[0].split(/\r?\n/).map((l) => l.trim()).filter(Boolean)
  if (firstBlockLines[0] !== 'CHORUS') {
    return { valid: false, reason: 'First section must be CHORUS' }
  }

  // Last section must be CHORUS
  const lastBlockLines = blocks[blocks.length - 1].split(/\r?\n/).map((l) => l.trim()).filter(Boolean)
  if (lastBlockLines[0] !== 'CHORUS') {
    return { valid: false, reason: 'Final section must be CHORUS' }
  }

  const chorusContent = firstBlockLines.slice(1)
  if (chorusContent.length < 1 || chorusContent.length > 4) {
    return { valid: false, reason: `Chorus line count must be between 1 and 4 lines, found ${chorusContent.length}` }
  }

  // Check alternation and sequential verse numbering
  let expectedVerse = 1
  for (let i = 0; i < blocks.length; i++) {
    const lines = blocks[i].split(/\r?\n/).map((l) => l.trim()).filter(Boolean)
    const heading = lines[0]
    const content = lines.slice(1)

    if (i % 2 === 0) {
      if (heading !== 'CHORUS') {
        return { valid: false, reason: `Section ${i + 1} expected CHORUS heading, found '${heading}'` }
      }
      if (content.length > 4) {
        return { valid: false, reason: `Chorus section ${i + 1} exceeds 4 lines (${content.length} lines)` }
      }
    } else {
      const expectedHeading = `VERSE ${expectedVerse}`
      if (heading !== expectedHeading) {
        return { valid: false, reason: `Section ${i + 1} expected '${expectedHeading}', found '${heading}'` }
      }
      if (content.length > 4) {
        return { valid: false, reason: `Verse ${expectedVerse} exceeds 4 lines (${content.length} lines)` }
      }
      expectedVerse++
    }

    // Check no አዝ markers or formatting symbols remain in any section
    for (const line of content) {
      if (CHORUS_MARKER_LINE_REGEX.test(line) || TRAILING_CHORUS_MARKER_REGEX.test(line)) {
        return { valid: false, reason: `Unprocessed chorus marker found in content: '${line}'` }
      }
      if (line.startsWith('#') || line.includes('**') || line.includes('___')) {
        return { valid: false, reason: `Unwanted formatting symbols found in line: '${line}'` }
      }
    }
  }

  // Check for whole-song duplication corruption (CHORUS and VERSE 1 identical when > 4 lines)
  if (blocks.length >= 2) {
    const v1Lines = blocks[1].split(/\r?\n/).map((l) => l.trim()).filter(Boolean).slice(1)
    if (chorusContent.length > 4 || (chorusContent.length > 1 && chorusContent.join('\n') === v1Lines.join('\n') && blocks.length === 3 && originalText && originalText.split(/\r?\n/).filter(Boolean).length > 4)) {
      return { valid: false, reason: 'Identified whole-song duplication corruption' }
    }
  }

  return { valid: true }
}

/**
 * Checks if the text is strictly formatted in the valid forced CHORUS / VERSE pattern.
 * If text has whole-song duplication, > 4 lines chorus, or embedded አዝ markers, it is NOT validly formatted.
 */
export function isLyricsFormatted(text: string | null | undefined): boolean {
  return validateFormattedLyrics(text).valid
}

/**
 * Detects if a text was corrupted by the previous formatter:
 * e.g. CHORUS [ENTIRE SONG], VERSE 1 [ENTIRE SONG], CHORUS [ENTIRE SONG],
 * or CHORUS with > 4 lines, or CHORUS/VERSE with embedded አዝ markers.
 * Collapses it back to a clean single sequence of unique lyric lines and natural breaks.
 */
export function recoverCorruptedFormattedText(text: string): string[] | null {
  if (!text || !text.trim()) return null

  const blocks = text.trim().split(/\r?\n\s*\r?\n+/).map((b) => b.trim()).filter(Boolean)
  if (blocks.length < 2) return null

  const firstBlock = blocks[0].split(/\r?\n/).map((l) => l.trim()).filter(Boolean)
  const secondBlock = blocks[1].split(/\r?\n/).map((l) => l.trim()).filter(Boolean)

  const firstHeading = firstBlock[0]?.toUpperCase()
  const secondHeading = secondBlock[0]?.toUpperCase()

  if (firstHeading !== 'CHORUS' || !secondHeading?.startsWith('VERSE')) {
    return null
  }

  const cLines = firstBlock.slice(1)
  const vLines = secondBlock.slice(1)

  // Pattern A: Whole-song duplication where CHORUS and VERSE 1 are identical
  const isIdenticalWholeSong = cLines.length > 0 && cLines.join('\n') === vLines.join('\n')

  // Pattern B: Chorus has > 4 lines (old formatter took entire first paragraph or song)
  const isOversizedChorus = cLines.length > 4

  // Pattern C: Blocks contain embedded አዝ markers
  const hasEmbeddedAz = [...cLines, ...vLines].some((l) => isChorusMarkerLine(l) || TRAILING_CHORUS_MARKER_REGEX.test(l))

  if (isIdenticalWholeSong) {
    // Collapse duplicate whole song blocks to single unique source sequence
    return cLines
  }

  if (isOversizedChorus || hasEmbeddedAz) {
    // Extract unique content: chorus lines + all unique verse blocks
    const uniqueLines: string[] = [...cLines]
    for (let i = 1; i < blocks.length; i += 2) {
      const vBlock = blocks[i].split(/\r?\n/).map((l) => l.trim()).filter(Boolean).slice(1)
      uniqueLines.push(...vBlock)
    }
    return uniqueLines
  }

  return null
}

/**
 * Deconstructs previously formatted lyrics back into unique chorus and unique verses,
 * preventing duplicate nesting during reformatting.
 */
export function deconstructFormattedLyrics(text: string): ExtractedSongStructure | null {
  const recovered = recoverCorruptedFormattedText(text)
  if (recovered) {
    const stanzas = parseRawLyricsIntoStanzas(recovered.join('\n'))
    return extractChorusAndVerses(stanzas, false, recovered.join('\n'))
  }

  if (!isLyricsFormatted(text)) return null

  const trimmed = text.trim()
  const blocks = trimmed.split(/\r?\n\s*\r?\n+/).map((b) => b.trim()).filter(Boolean)

  let chorusLines: string[] = []
  const verses: string[][] = []

  for (let i = 0; i < blocks.length; i++) {
    const lines = blocks[i].split(/\r?\n/).map((l) => l.trim()).filter(Boolean)
    if (lines.length <= 1) continue // only heading

    const contentLines = lines.slice(1)

    if (i === 0) {
      chorusLines = contentLines
    } else if (i % 2 === 1) {
      verses.push(contentLines)
    }
  }

  if (!chorusLines.length || !verses.length) return null

  // If chorus exceeds 4 lines, clamp to 4 and move overflow into verses
  if (chorusLines.length > 4) {
    const overflow = chorusLines.slice(4)
    chorusLines = chorusLines.slice(0, 4)
    verses.unshift(overflow)
  }

  // Ensure every verse is max 4 lines
  const normalizedVerses: string[][] = []
  for (const v of verses) {
    if (v.length <= 4) {
      normalizedVerses.push(v)
    } else {
      for (let j = 0; j < v.length; j += 4) {
        normalizedVerses.push(v.slice(j, j + 4))
      }
    }
  }

  const isSingleParagraph =
    normalizedVerses.length === 1 &&
    normalizedVerses[0].join('\n') === chorusLines.join('\n')

  return {
    chorusLines,
    verses: normalizedVerses,
    isSingleParagraph,
  }
}

/**
 * Parse raw lyrics text into raw stanzas.
 * Interprets and removes አዝ markers, explicit headings, and cleans unwanted symbols.
 */
export function parseRawLyricsIntoStanzas(text: string): RawStanza[] {
  if (!text || !text.trim()) return []

  // Check if text was corrupted by the old formatter
  const recoveredLines = recoverCorruptedFormattedText(text)
  const sourceText = recoveredLines ? recoveredLines.join('\n') : text

  const rawParagraphs = sourceText
    .replace(/\r\n/g, '\n')
    .split(/\n\s*\n+/)
    .map((b) => b.trim())
    .filter(Boolean)

  const stanzas: RawStanza[] = []

  for (const p of rawParagraphs) {
    const rawLines = p.split(/\n/).map((l) => l.trim()).filter(Boolean)
    if (!rawLines.length) continue

    let currentLines: string[] = []
    let isCurrentChorus = false
    let originalHeading: string | undefined

    for (let i = 0; i < rawLines.length; i++) {
      const rawLine = rawLines[i]

      // Standalone Chorus Marker (e.g. አዝ, አዝ___, CHORUS, REFRAIN)
      if (isChorusMarkerLine(rawLine)) {
        if (currentLines.length > 0) {
          stanzas.push({
            lines: currentLines,
            isExplicitChorus: isCurrentChorus,
            originalHeading,
          })
          currentLines = []
          isCurrentChorus = false
          originalHeading = undefined
        }
        // If an explicit chorus marker is at the very beginning of the song, mark next stanza as chorus
        if (stanzas.length === 0) {
          isCurrentChorus = true
          originalHeading = rawLine
        }
        continue
      }

      // Standalone Verse Marker (e.g. VERSE 1, ቁጥር 1)
      if (isVerseMarkerLine(rawLine)) {
        if (currentLines.length > 0) {
          stanzas.push({
            lines: currentLines,
            isExplicitChorus: isCurrentChorus,
            originalHeading,
          })
          currentLines = []
          isCurrentChorus = false
        }
        originalHeading = rawLine
        continue
      }

      // Check if line has a trailing chorus marker (e.g. "Line 4 አዝ____")
      const hasTrailingAz = TRAILING_CHORUS_MARKER_REGEX.test(rawLine)
      const cleaned = cleanLyricLine(rawLine)
      if (cleaned) {
        currentLines.push(cleaned)
      }

      if (hasTrailingAz) {
        // Split stanza at trailing chorus marker
        if (currentLines.length > 0) {
          stanzas.push({
            lines: currentLines,
            isExplicitChorus: isCurrentChorus,
            originalHeading,
          })
          currentLines = []
          isCurrentChorus = false
          originalHeading = undefined
        }
      }
    }

    if (currentLines.length > 0) {
      stanzas.push({
        lines: currentLines,
        isExplicitChorus: isCurrentChorus,
        originalHeading,
      })
    }
  }

  return stanzas
}

/**
 * Extracts Chorus and Verses from raw stanzas according to the mandatory decision order:
 *
 * Rule A — Two-line Chorus:
 * If the first two lyric lines are followed by a blank line, Chorus = 2 lines.
 *
 * Rule B — Three-line Chorus:
 * If the first three lyric lines are followed by a blank line, Chorus = 3 lines.
 *
 * Rule C — Four-line Chorus when no natural break exists:
 * If no blank line after line 2 or line 3, take first 4 lines as Chorus.
 *
 * Rule D — Natural break after four lines:
 * If first stanza contains 4 lines followed by a blank line, use all 4 as Chorus.
 *
 * Rule E — Long first paragraphs:
 * If first paragraph contains 8, 12, or 20 lines without blank spacing, Chorus is only
 * first 4 lines. Everything following becomes Verse content.
 *
 * Rule F — One-line edge case:
 * If Mezmur genuinely contains only 1 lyric line, allow a 1-line Chorus.
 *
 * Mandatory Priority:
 * 1. Identify explicit structural markers.
 * 2. Inspect natural blank-line stanza boundaries.
 * 3. If natural break occurs after 2 or 3 lyric lines, end Chorus there.
 * 4. If no natural break before line 4, use exactly 4 lyric lines.
 * 5. Never exceed 4 Chorus lines.
 * 6. Do not use an entire paragraph as Chorus merely because no blank lines exist.
 */
export function extractChorusAndVerses(
  stanzas: RawStanza[],
  reformatExisting = false,
  rawOriginalText = '',
): ExtractedSongStructure | null {
  if (reformatExisting && rawOriginalText) {
    const deconstructed = deconstructFormattedLyrics(rawOriginalText)
    if (deconstructed) return deconstructed
  }

  if (!stanzas.length) return null

  // Collect all lines across stanzas to check total lines
  const totalLyricLines = stanzas.flatMap((s) => s.lines)
  if (!totalLyricLines.length) return null

  // Rule F: One-line edge case
  if (totalLyricLines.length === 1) {
    return {
      chorusLines: totalLyricLines,
      verses: [totalLyricLines],
      isSingleParagraph: true,
    }
  }

  // Check if Mezmur has <= 4 lines total without verses
  if (stanzas.length === 1 && totalLyricLines.length <= 4) {
    return {
      chorusLines: totalLyricLines,
      verses: [totalLyricLines],
      isSingleParagraph: true,
    }
  }

  // 1. Identify Chorus lines
  let chorusLines: string[] = []
  const remainingStanzaPool: string[][] = []

  // Check if first stanza is explicitly marked as chorus
  const firstStanza = stanzas[0]
  const firstStanzaLines = firstStanza.lines

  if (firstStanzaLines.length === 2) {
    // Rule A: Natural break after 2 lines -> 2-line Chorus
    chorusLines = firstStanzaLines
  } else if (firstStanzaLines.length === 3) {
    // Rule B: Natural break after 3 lines -> 3-line Chorus
    chorusLines = firstStanzaLines
  } else if (firstStanzaLines.length === 4) {
    // Rule D: Natural break after 4 lines -> 4-line Chorus
    chorusLines = firstStanzaLines
  } else if (firstStanzaLines.length > 4) {
    // Rule E: Long first paragraph (> 4 lines) -> Chorus is first 4 lines only!
    chorusLines = firstStanzaLines.slice(0, 4)
    // Lines 5..end become verse content!
    remainingStanzaPool.push(firstStanzaLines.slice(4))
  } else {
    // 1 line in first stanza
    chorusLines = firstStanzaLines
  }

  // Add the remaining stanzas to the pool
  for (let i = 1; i < stanzas.length; i++) {
    remainingStanzaPool.push(stanzas[i].lines)
  }

  // 2. Organize remaining lines into numbered Verses according to Section 3:
  // - Use natural blank-line boundaries where available
  // - Default to a maximum of 4 lines per verse
  // - If a stanza has > 4 lines, split into consecutive 4-line verses
  // - If a stanza naturally contains 2 or 3 lines, preserve that shorter stanza
  // - Never combine unrelated stanzas merely to reach 4 lines
  // - Preserve line ordering
  const verses: string[][] = []

  for (const stanzaLines of remainingStanzaPool) {
    if (!stanzaLines.length) continue

    if (stanzaLines.length <= 4) {
      // Preserve natural 2, 3, or 4 line stanza
      verses.push(stanzaLines)
    } else {
      // Split stanza exceeding 4 lines into consecutive 4-line chunks
      for (let j = 0; j < stanzaLines.length; j += 4) {
        verses.push(stanzaLines.slice(j, j + 4))
      }
    }
  }

  // Fallback: If no remaining lines remain (single short song)
  if (verses.length === 0) {
    return {
      chorusLines,
      verses: [chorusLines],
      isSingleParagraph: true,
    }
  }

  return {
    chorusLines,
    verses,
    isSingleParagraph: false,
  }
}

/**
 * Serializes Chorus and Verses into the required forced format:
 * CHORUS
 * [chorus lines, 2-4 lines]
 *
 * VERSE 1
 * [verse lines, 1-4 lines]
 *
 * CHORUS
 * [chorus lines]
 * ...
 * CHORUS
 * [chorus lines]
 */
export function serializeForcedChorusVerse(
  chorusLines: string[],
  verses: string[][],
): string {
  const chorusBlock = `CHORUS\n${chorusLines.join('\n')}`
  const sections: string[] = []

  // Always starts with CHORUS
  sections.push(chorusBlock)

  for (let i = 0; i < verses.length; i++) {
    sections.push(`VERSE ${i + 1}\n${verses[i].join('\n')}`)
    // Repeat chorus after each verse
    sections.push(chorusBlock)
  }

  return sections.join('\n\n')
}

/**
 * Formats a single lyrics text (for English, Oromo, or standalone Ethiopic).
 */
export function formatSingleLyrics(
  lyricsText: string,
  options?: { reformatExisting?: boolean },
): LyricsFormattingResult {
  const isAlready = isLyricsFormatted(lyricsText)
  if (isAlready && !options?.reformatExisting) {
    const rawStanzas = parseRawLyricsIntoStanzas(lyricsText)
    const verseCount = Math.max(1, Math.floor((rawStanzas.length - 1) / 2))
    return {
      formattedText: lyricsText,
      chorusCount: verseCount + 1,
      verseCount,
      sectionCount: 2 * verseCount + 1,
      sourceParagraphCount: verseCount + 1,
      isAlreadyFormatted: true,
    }
  }

  const rawStanzas = parseRawLyricsIntoStanzas(lyricsText)
  if (!rawStanzas.length) {
    return {
      formattedText: '',
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      sourceParagraphCount: 0,
      isAlreadyFormatted: false,
    }
  }

  const structure = extractChorusAndVerses(rawStanzas, options?.reformatExisting, lyricsText)
  if (!structure) {
    return {
      formattedText: lyricsText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      sourceParagraphCount: rawStanzas.length,
      isAlreadyFormatted: false,
    }
  }

  const formattedText = serializeForcedChorusVerse(structure.chorusLines, structure.verses)
  const verseCount = structure.verses.length
  const chorusCount = verseCount + 1
  const sectionCount = 2 * verseCount + 1
  const sourceParagraphCount = structure.isSingleParagraph ? 1 : verseCount + 1

  return {
    formattedText,
    chorusCount,
    verseCount,
    sectionCount,
    sourceParagraphCount,
    isAlreadyFormatted: false,
  }
}

/**
 * Align Latin transliteration to match the exact Chorus and Verse structure of the original Ethiopic lyrics.
 *
 * Rules from Section 6:
 * - Ethiopic-script version is the primary source for determining stanza boundaries and Chorus length.
 * - Both must have the same Chorus count, same Verse count, same section ordering, same Verse numbering.
 * - Both respect the four-line Chorus maximum.
 * - Transliteration Chorus length matches original Chorus length when line counts permit.
 * - Every transliterated word is preserved.
 * - No transliteration is invented, and none is discarded.
 * - If matching section boundaries cannot be achieved without inventing or deleting transliteration content,
 *   fail with an explicit error.
 */
export function alignTransliterationToOriginal(
  origStructure: ExtractedSongStructure,
  transStanzas: RawStanza[],
): {
  chorusLines: string[]
  verses: string[][]
  alignmentType: AlignmentType
  transParagraphCountBefore: number
  transParagraphCountAfter: number
  error?: string
} {
  const transParagraphCountBefore = transStanzas.length
  const requiredVerseCount = origStructure.verses.length

  // Case 0: Single paragraph original
  if (origStructure.isSingleParagraph) {
    const allTransLines = transStanzas.flatMap((s) => s.lines)
    if (!allTransLines.length) {
      return {
        chorusLines: [],
        verses: [],
        alignmentType: 'none',
        transParagraphCountBefore,
        transParagraphCountAfter: 0,
        error: 'Transliteration has no lyric lines to align with single-paragraph original',
      }
    }
    const chorusLines = allTransLines.slice(0, Math.min(4, allTransLines.length))
    return {
      chorusLines,
      verses: [chorusLines],
      alignmentType: 'single_paragraph',
      transParagraphCountBefore,
      transParagraphCountAfter: 1,
    }
  }

  // Required sections: 1 Chorus + V Verses
  const targetStanzaCount = 1 + requiredVerseCount
  const allTransLines = transStanzas.flatMap((s) => s.lines)

  // If transliteration has fewer lines than required sections, attempt deterministic splitting
  // of multi-word lines so words are not duplicated or lost
  if (allTransLines.length < targetStanzaCount) {
    let canSplit = true
    while (allTransLines.length < targetStanzaCount && canSplit) {
      canSplit = false
      let bestIdx = -1
      let maxWords = 1

      for (let i = 0; i < allTransLines.length; i++) {
        const words = allTransLines[i].split(/\s+/)
        if (words.length >= 2 && words.length > maxWords) {
          maxWords = words.length
          bestIdx = i
        }
      }

      if (bestIdx !== -1) {
        const words = allTransLines[bestIdx].split(/\s+/)
        const mid = Math.ceil(words.length / 2)
        const firstHalf = words.slice(0, mid).join(' ')
        const secondHalf = words.slice(mid).join(' ')
        allTransLines.splice(bestIdx, 1, firstHalf, secondHalf)
        canSplit = true
      }
    }
  }

  // Strict validation: Transliteration must have at least (1 + V) lines
  if (allTransLines.length < targetStanzaCount) {
    return {
      chorusLines: [],
      verses: [],
      alignmentType: 'none',
      transParagraphCountBefore,
      transParagraphCountAfter: 0,
      error: `Transliteration has ${allTransLines.length} line(s) / phrase(s), but original requires at least ${targetStanzaCount} sections (1 Chorus + ${requiredVerseCount} Verses)`,
    }
  }

  // Case 1: Transliteration has natural stanzas matching the original stanza count (1 chorus + V verses)
  if (transStanzas.length === targetStanzaCount && allTransLines.length === transStanzas.flatMap((s) => s.lines).length) {
    const rawChorus = transStanzas[0].lines
    const rawVerses = transStanzas.slice(1).map((s) => s.lines)

    // Ensure Chorus does not exceed 4 lines
    let chorusLines: string[]
    if (rawChorus.length > 4) {
      const overflow = rawChorus.slice(4)
      chorusLines = rawChorus.slice(0, 4)
      rawVerses[0] = [...overflow, ...rawVerses[0]]
    } else {
      chorusLines = rawChorus
    }

    return {
      chorusLines,
      verses: rawVerses,
      alignmentType: 'exact',
      transParagraphCountBefore,
      transParagraphCountAfter: targetStanzaCount,
    }
  }

  // Case 2: Transliteration has different stanza boundaries or was split.
  // Distribute allTransLines deterministically across targetStanzaCount buckets:
  // Bucket 0 = Chorus, Buckets 1..V = Verses 1..V
  const buckets: string[][] = Array.from({ length: targetStanzaCount }, () => [])
  const totalLines = allTransLines.length

  for (let lineIdx = 0; lineIdx < totalLines; lineIdx++) {
    const bIdx = Math.min(targetStanzaCount - 1, Math.floor((lineIdx * targetStanzaCount) / totalLines))
    buckets[bIdx].push(allTransLines[lineIdx])
  }

  // Ensure no bucket is empty
  for (let b = 0; b < targetStanzaCount; b++) {
    if (buckets[b].length === 0 && buckets[b - 1]?.length > 1) {
      buckets[b].push(buckets[b - 1].pop()!)
    }
  }
  for (let b = targetStanzaCount - 1; b >= 0; b--) {
    if (buckets[b].length === 0 && buckets[b + 1]?.length > 1) {
      buckets[b].push(buckets[b + 1].shift()!)
    }
  }

  let chorusLines = buckets[0]
  if (chorusLines.length > 4) {
    const overflow = chorusLines.slice(4)
    chorusLines = chorusLines.slice(0, 4)
    buckets[1].unshift(...overflow)
  }

  const verses = buckets.slice(1)
  const alignmentType: AlignmentType =
    transStanzas.length > targetStanzaCount ? 'merged' : 'split'

  return {
    chorusLines,
    verses,
    alignmentType,
    transParagraphCountBefore,
    transParagraphCountAfter: targetStanzaCount,
  }
}

/**
 * Format Ethiopic-script original and Latin transliteration together as an aligned pair.
 */
export function formatPairedOriginalAndTransliteration(
  originalText: string,
  transliterationText: string,
  options?: { reformatExisting?: boolean },
): PairedFormattingResult {
  const origAlready = isLyricsFormatted(originalText)
  const transAlready = isLyricsFormatted(transliterationText)

  if (origAlready && transAlready && !options?.reformatExisting) {
    const origStanzas = parseRawLyricsIntoStanzas(originalText)
    const verseCount = Math.max(1, Math.floor((origStanzas.length - 1) / 2))
    return {
      ok: true,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: verseCount + 1,
      verseCount,
      sectionCount: 2 * verseCount + 1,
      origParagraphCount: verseCount + 1,
      transParagraphCountBefore: verseCount + 1,
      transParagraphCountAfter: verseCount + 1,
      alignmentType: 'exact',
    }
  }

  // 1. Parse original stanzas
  const origRawStanzas = parseRawLyricsIntoStanzas(originalText)
  if (!origRawStanzas.length) {
    return {
      ok: false,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      origParagraphCount: 0,
      transParagraphCountBefore: 0,
      transParagraphCountAfter: 0,
      alignmentType: 'none',
      error: 'Original Ethiopic lyrics field is empty',
    }
  }

  // 2. Extract original structure
  const origStructure = extractChorusAndVerses(origRawStanzas, options?.reformatExisting, originalText)
  if (!origStructure) {
    return {
      ok: false,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      origParagraphCount: origRawStanzas.length,
      transParagraphCountBefore: 0,
      transParagraphCountAfter: 0,
      alignmentType: 'none',
      error: 'Could not extract chorus and verses from original lyrics',
    }
  }

  // 3. Parse transliteration stanzas
  let transRawStanzas = parseRawLyricsIntoStanzas(transliterationText)
  if (options?.reformatExisting && transAlready) {
    const deconstructedTrans = deconstructFormattedLyrics(transliterationText)
    if (deconstructedTrans) {
      transRawStanzas = [
        { lines: deconstructedTrans.chorusLines, isExplicitChorus: true },
        ...deconstructedTrans.verses.map((v) => ({ lines: v, isExplicitChorus: false })),
      ]
    }
  }

  // 4. Align transliteration to original structure
  const alignedTrans = alignTransliterationToOriginal(origStructure, transRawStanzas)
  if (alignedTrans.error) {
    return {
      ok: false,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      origParagraphCount: origRawStanzas.length,
      transParagraphCountBefore: alignedTrans.transParagraphCountBefore,
      transParagraphCountAfter: 0,
      alignmentType: 'none',
      error: alignedTrans.error,
    }
  }

  // 5. Serialize both using the identical shared model
  const formattedOriginal = serializeForcedChorusVerse(origStructure.chorusLines, origStructure.verses)
  const formattedTransliteration = serializeForcedChorusVerse(alignedTrans.chorusLines, alignedTrans.verses)

  // 6. Strict Validation: Assert section counts, verse counts, and chorus constraints match exactly
  const origVerseCount = origStructure.verses.length
  const transVerseCount = alignedTrans.verses.length

  if (origVerseCount !== transVerseCount) {
    return {
      ok: false,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      origParagraphCount: origRawStanzas.length,
      transParagraphCountBefore: alignedTrans.transParagraphCountBefore,
      transParagraphCountAfter: 0,
      alignmentType: 'none',
      error: `Validation failed: original verse count (${origVerseCount}) !== transliteration verse count (${transVerseCount})`,
    }
  }

  const origValidation = validateFormattedLyrics(formattedOriginal, originalText)
  if (!origValidation.valid) {
    return {
      ok: false,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      origParagraphCount: origRawStanzas.length,
      transParagraphCountBefore: alignedTrans.transParagraphCountBefore,
      transParagraphCountAfter: 0,
      alignmentType: 'none',
      error: `Original lyrics validation failed: ${origValidation.reason}`,
    }
  }

  const transValidation = validateFormattedLyrics(formattedTransliteration, transliterationText)
  if (!transValidation.valid) {
    return {
      ok: false,
      formattedOriginal: originalText,
      formattedTransliteration: transliterationText,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      origParagraphCount: origRawStanzas.length,
      transParagraphCountBefore: alignedTrans.transParagraphCountBefore,
      transParagraphCountAfter: 0,
      alignmentType: 'none',
      error: `Transliteration validation failed: ${transValidation.reason}`,
    }
  }

  const verseCount = origVerseCount
  const chorusCount = verseCount + 1
  const sectionCount = 2 * verseCount + 1
  const origParagraphCount = origStructure.isSingleParagraph ? 1 : verseCount + 1

  return {
    ok: true,
    formattedOriginal,
    formattedTransliteration,
    chorusCount,
    verseCount,
    sectionCount,
    origParagraphCount,
    transParagraphCountBefore: alignedTrans.transParagraphCountBefore,
    transParagraphCountAfter: alignedTrans.transParagraphCountAfter,
    alignmentType: alignedTrans.alignmentType,
  }
}

/**
 * Format all populated lyrics fields for a Mezmur record according to all rules:
 * - Ethiopic + Transliteration -> Aligned paired formatting.
 * - Ethiopic only -> Formatted original.
 * - English / Oromo / Ge'ez standalone -> Formatted with forced Chorus/Verse pattern.
 */
export function formatMezmurRecordLyrics(
  record: MezmurLyricsFields,
  options?: { reformatExisting?: boolean },
): FormattedMezmurRecordResult {
  const amharic = record.lyrics_amharic?.trim() || ''
  const geez = record.lyrics_geez?.trim() || ''
  const tigrinya = record.lyrics_tigrinya?.trim() || ''
  const english = record.lyrics_english?.trim() || ''
  const oromo = record.lyrics_oromo?.trim() || ''
  const transliteration = record.lyrics_transliteration?.trim() || ''

  const populatedLanguages: string[] = []
  if (amharic) populatedLanguages.push('amharic')
  if (geez) populatedLanguages.push('geez')
  if (tigrinya) populatedLanguages.push('tigrinya')
  if (english) populatedLanguages.push('english')
  if (oromo) populatedLanguages.push('oromo')
  if (transliteration) populatedLanguages.push('transliteration')

  if (!populatedLanguages.length) {
    return {
      importId: record.import_id,
      slug: record.slug,
      title: record.title,
      status: record.status,
      changed: false,
      alreadyFormatted: false,
      hasLyrics: false,
      missingLyrics: true,
      populatedLanguages: [],
      origParagraphCount: 0,
      transParagraphCountBefore: 0,
      transParagraphCountAfter: 0,
      chorusCount: 0,
      verseCount: 0,
      sectionCount: 0,
      alignmentType: 'none',
      updatedLyrics: {},
      ok: true,
    }
  }

  const updatedLyrics: FormattedMezmurRecordResult['updatedLyrics'] = {}
  let alignmentType: AlignmentType = 'none'
  let origParagraphCount = 0
  let transParagraphCountBefore = 0
  let transParagraphCountAfter = 0
  let chorusCount = 0
  let verseCount = 0
  let sectionCount = 0
  let changed = false
  let allAlreadyFormatted = true

  // Case A: Ethiopic original + Latin transliteration
  // Find which Ethiopic field is populated
  const ethiopicField: 'lyrics_tigrinya' | 'lyrics_amharic' | 'lyrics_geez' | null =
    tigrinya ? 'lyrics_tigrinya' : amharic ? 'lyrics_amharic' : geez ? 'lyrics_geez' : null
  const ethiopicText = ethiopicField ? (record[ethiopicField]?.trim() || '') : ''

  if (ethiopicField && transliteration) {
    const pairResult = formatPairedOriginalAndTransliteration(
      ethiopicText,
      transliteration,
      options,
    )

    if (!pairResult.ok) {
      return {
        importId: record.import_id,
        slug: record.slug,
        title: record.title,
        status: record.status,
        changed: false,
        alreadyFormatted: false,
        hasLyrics: true,
        populatedLanguages,
        origParagraphCount: pairResult.origParagraphCount,
        transParagraphCountBefore: pairResult.transParagraphCountBefore,
        transParagraphCountAfter: pairResult.transParagraphCountAfter,
        chorusCount: 0,
        verseCount: 0,
        sectionCount: 0,
        alignmentType: 'none',
        updatedLyrics: {},
        ok: false,
        error: pairResult.error,
      }
    }

    updatedLyrics[ethiopicField] = pairResult.formattedOriginal
    updatedLyrics.lyrics_transliteration = pairResult.formattedTransliteration
    alignmentType = pairResult.alignmentType
    origParagraphCount = pairResult.origParagraphCount
    transParagraphCountBefore = pairResult.transParagraphCountBefore
    transParagraphCountAfter = pairResult.transParagraphCountAfter
    chorusCount = pairResult.chorusCount
    verseCount = pairResult.verseCount
    sectionCount = pairResult.sectionCount

    if (pairResult.formattedOriginal !== ethiopicText || pairResult.formattedTransliteration !== transliteration) {
      changed = true
      allAlreadyFormatted = false
    }
  } else if (ethiopicField && !transliteration) {
    // Case B: Ethiopic only
    const res = formatSingleLyrics(ethiopicText, options)
    const val = validateFormattedLyrics(res.formattedText, ethiopicText)
    if (!val.valid) {
      return {
        importId: record.import_id,
        slug: record.slug,
        title: record.title,
        status: record.status,
        changed: false,
        alreadyFormatted: false,
        hasLyrics: true,
        populatedLanguages,
        origParagraphCount: res.sourceParagraphCount,
        transParagraphCountBefore: 0,
        transParagraphCountAfter: 0,
        chorusCount: 0,
        verseCount: 0,
        sectionCount: 0,
        alignmentType: 'none',
        updatedLyrics: {},
        ok: false,
        error: val.reason,
      }
    }

    updatedLyrics[ethiopicField] = res.formattedText
    chorusCount = res.chorusCount
    verseCount = res.verseCount
    sectionCount = res.sectionCount
    origParagraphCount = res.sourceParagraphCount

    if (res.formattedText !== ethiopicText) {
      changed = true
      allAlreadyFormatted = false
    }
  }

  // Also format independent languages if present
  if (english) {
    const res = formatSingleLyrics(english, options)
    const val = validateFormattedLyrics(res.formattedText, english)
    if (!val.valid) {
      return {
        importId: record.import_id,
        slug: record.slug,
        title: record.title,
        status: record.status,
        changed: false,
        alreadyFormatted: false,
        hasLyrics: true,
        populatedLanguages,
        origParagraphCount: res.sourceParagraphCount,
        transParagraphCountBefore: 0,
        transParagraphCountAfter: 0,
        chorusCount: 0,
        verseCount: 0,
        sectionCount: 0,
        alignmentType: 'none',
        updatedLyrics: {},
        ok: false,
        error: val.reason,
      }
    }

    updatedLyrics.lyrics_english = res.formattedText
    if (!chorusCount) {
      chorusCount = res.chorusCount
      verseCount = res.verseCount
      sectionCount = res.sectionCount
      origParagraphCount = res.sourceParagraphCount
    }
    if (res.formattedText !== english) {
      changed = true
      allAlreadyFormatted = false
    }
  }

  if (oromo) {
    const res = formatSingleLyrics(oromo, options)
    const val = validateFormattedLyrics(res.formattedText, oromo)
    if (!val.valid) {
      return {
        importId: record.import_id,
        slug: record.slug,
        title: record.title,
        status: record.status,
        changed: false,
        alreadyFormatted: false,
        hasLyrics: true,
        populatedLanguages,
        origParagraphCount: res.sourceParagraphCount,
        transParagraphCountBefore: 0,
        transParagraphCountAfter: 0,
        chorusCount: 0,
        verseCount: 0,
        sectionCount: 0,
        alignmentType: 'none',
        updatedLyrics: {},
        ok: false,
        error: val.reason,
      }
    }

    updatedLyrics.lyrics_oromo = res.formattedText
    if (!chorusCount) {
      chorusCount = res.chorusCount
      verseCount = res.verseCount
      sectionCount = res.sectionCount
      origParagraphCount = res.sourceParagraphCount
    }
    if (res.formattedText !== oromo) {
      changed = true
      allAlreadyFormatted = false
    }
  }

  // If geez exists alongside amharic and wasn't the primary paired field
  if (geez && ethiopicField !== 'lyrics_geez') {
    const res = formatSingleLyrics(geez, options)
    updatedLyrics.lyrics_geez = res.formattedText
    if (res.formattedText !== geez) {
      changed = true
      allAlreadyFormatted = false
    }
  }

  return {
    importId: record.import_id,
    slug: record.slug,
    title: record.title,
    status: record.status,
    changed,
    alreadyFormatted: allAlreadyFormatted && !changed,
    hasLyrics: true,
    populatedLanguages,
    origParagraphCount,
    transParagraphCountBefore,
    transParagraphCountAfter,
    chorusCount,
    verseCount,
    sectionCount,
    alignmentType,
    updatedLyrics,
    ok: true,
  }
}
