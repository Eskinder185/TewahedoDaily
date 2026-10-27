/**
 * cleanMezmurLyrics(text)
 * 
 * Deterministically removes repeated chorus blocks from a Mezmur's lyrics.
 * 
 * Rules:
 * 1. Remove the text heading CHORUS or አዝማች when it is used as a structural label.
 * 2. Keep the first chorus lyrics once at the beginning if already present there.
 * 3. Remove duplicate chorus blocks repeated between verses or at the end.
 * 4. Preserve all VERSE 1, VERSE 2, VERSE 3 headings and their associated lyrics.
 * 5. Preserve every unique lyric line, punctuation mark, and Ethiopic character.
 * 6. Keep normal line breaks and stanza spacing.
 * 7. If a hymn has no chorus, leave it unchanged.
 * 8. If a hymn contains chorus variations with different lyrics, do not delete those unique lyrics.
 * 9. Idempotent: running twice produces identical output.
 */

export const CHORUS_HEADING_REGEX = /^\s*\[?(?:chorus|refrain|አዝማች|አዝ|መልስ|ምላሽ)(?:\s*(\d+|[፩-፲]+))?\]?[_\s:.-]*$/i
export const VERSE_HEADING_REGEX = /^\s*\[?(?:verse|ቁጥር)(?:\s*(\d+|[፩-፲]+))?\]?[_\s:.-]*$/i
export const OTHER_HEADING_REGEX = /^\s*\[?(?:bridge|intro|outro|ድልድይ|መግቢያ|መደምደሚያ)(?:\s*(\d+|[፩-፲]+))?\]?[_\s:.-]*$/i

/**
 * Normalizes text lines for content comparison (ignores minor trailing whitespace).
 */
function normalizeContentForMatching(lines: string[]): string {
  return lines
    .map((l) => l.trim())
    .filter(Boolean)
    .join('\n')
}

export interface CleanLyricsResult {
  cleanedText: string
  hasChorus: boolean
  removedChorusCount: number
  preservedVerseCount: number
  isChanged: boolean
}

export function cleanMezmurLyrics(rawText: string | null | undefined): CleanLyricsResult {
  if (!rawText || !rawText.trim()) {
    return {
      cleanedText: rawText || '',
      hasChorus: false,
      removedChorusCount: 0,
      preservedVerseCount: 0,
      isChanged: false,
    }
  }

  // Preserve line ending convention (\r\n vs \n)
  const isCrlf = rawText.includes('\r\n')
  const newline = isCrlf ? '\r\n' : '\n'

  // Split into raw stanzas/blocks separated by blank lines
  const rawBlocks = rawText.trim().split(/\r?\n\s*\r?\n+/)
  if (rawBlocks.length === 0) {
    return {
      cleanedText: rawText,
      hasChorus: false,
      removedChorusCount: 0,
      preservedVerseCount: 0,
      isChanged: false,
    }
  }

  // Parse each block
  interface BlockInfo {
    raw: string
    headingType: 'chorus' | 'verse' | 'other' | 'none'
    headingText: string
    lines: string[]
    normalizedContent: string
  }

  const parsedBlocks: BlockInfo[] = rawBlocks.map((b) => {
    const rawLines = b.split(/\r?\n/)
    const firstLineTrimmed = (rawLines[0] || '').trim()

    let headingType: BlockInfo['headingType'] = 'none'
    let headingText = ''
    let contentLines: string[] = rawLines

    if (CHORUS_HEADING_REGEX.test(firstLineTrimmed)) {
      headingType = 'chorus'
      headingText = firstLineTrimmed
      contentLines = rawLines.slice(1)
      // Strip any secondary stacked chorus structural headings (e.g. "CHORUS\nአዝ")
      while (contentLines.length > 0 && CHORUS_HEADING_REGEX.test(contentLines[0].trim())) {
        contentLines.shift()
      }
    } else if (VERSE_HEADING_REGEX.test(firstLineTrimmed)) {
      headingType = 'verse'
      headingText = firstLineTrimmed
      contentLines = rawLines.slice(1)
      // Remove any standalone structural chorus heading markers (e.g. standalone "አዝ" line)
      contentLines = contentLines.filter((l) => !CHORUS_HEADING_REGEX.test(l.trim()))
    } else if (OTHER_HEADING_REGEX.test(firstLineTrimmed)) {
      headingType = 'other'
      headingText = firstLineTrimmed
      contentLines = rawLines.slice(1)
      contentLines = contentLines.filter((l) => !CHORUS_HEADING_REGEX.test(l.trim()))
    }

    // Filter out leading/trailing empty lines inside the block's content
    while (contentLines.length > 0 && !contentLines[0].trim()) contentLines.shift()
    while (contentLines.length > 0 && !contentLines[contentLines.length - 1].trim()) contentLines.pop()

    return {
      raw: b,
      headingType,
      headingText,
      lines: contentLines,
      normalizedContent: normalizeContentForMatching(contentLines),
    }
  })

  // Check if any block has an explicit chorus heading
  const hasExplicitChorus = parsedBlocks.some((b) => b.headingType === 'chorus')

  // If no explicit chorus heading exists, check if Block 0 is an introductory stanza followed by VERSE 1
  // and repeated later.
  let isIntroChorusWithoutHeading = false
  if (!hasExplicitChorus && parsedBlocks.length > 2 && parsedBlocks[0].headingType === 'none') {
    const block0Content = parsedBlocks[0].normalizedContent
    const block1IsVerse = parsedBlocks[1].headingType === 'verse'
    const repeatsLater = parsedBlocks.slice(2).some((b) => b.normalizedContent === block0Content)
    if (block0Content && block1IsVerse && repeatsLater) {
      isIntroChorusWithoutHeading = true
    }
  }

  if (!hasExplicitChorus && !isIntroChorusWithoutHeading) {
    // Rule 7: If a hymn has no chorus, leave it unchanged.
    return {
      cleanedText: rawText,
      hasChorus: false,
      removedChorusCount: 0,
      preservedVerseCount: parsedBlocks.filter((b) => b.headingType === 'verse').length,
      isChanged: false,
    }
  }

  // Track unique choruses seen
  const seenChorusContents = new Set<string>()
  const outputBlocks: string[] = []
  let removedChorusCount = 0
  let preservedVerseCount = 0

  // If Block 0 was explicit chorus or intro chorus without heading
  for (let i = 0; i < parsedBlocks.length; i++) {
    const block = parsedBlocks[i]

    if (block.headingType === 'chorus' || (i === 0 && isIntroChorusWithoutHeading)) {
      if (!block.normalizedContent) {
        // Empty chorus block with only heading
        removedChorusCount++
        continue
      }

      if (seenChorusContents.has(block.normalizedContent)) {
        // Rule 3: Remove duplicate chorus blocks repeated between verses or at the end.
        removedChorusCount++
        continue
      }

      // First time seeing this chorus content:
      // Rule 1: Remove the text heading CHORUS or አዝማች when it is used as a structural label.
      // Rule 2: Keep the first chorus lyrics once at the beginning if already present there.
      // Rule 8: If a hymn contains chorus variations with different lyrics, do not delete those unique lyrics.
      seenChorusContents.add(block.normalizedContent)
      outputBlocks.push(block.lines.join(newline))
    } else if (block.headingType === 'verse') {
      // Check if this verse block accidentally duplicated the exact chorus content
      // (sometimes a chorus is mistakenly labeled as a verse like VERSE 2 with chorus text)
      // BUT Rule: "Do not remove repeated verse blocks, only duplicate chorus blocks."
      // So if it's a verse heading, we preserve it.
      preservedVerseCount++
      const blockLines = [block.headingText, ...block.lines]
      outputBlocks.push(blockLines.join(newline))
    } else if (block.headingType === 'other') {
      // Bridge, Intro, Outro
      const blockLines = [block.headingText, ...block.lines]
      outputBlocks.push(blockLines.join(newline))
    } else {
      // headingType === 'none'
      // Check if this unheaded block is a duplicate of an already seen chorus
      if (seenChorusContents.has(block.normalizedContent)) {
        removedChorusCount++
        continue
      }

      outputBlocks.push(block.lines.join(newline))
    }
  }

  const cleanedText = outputBlocks.join(newline + newline)
  const isChanged = cleanedText !== rawText

  return {
    cleanedText,
    hasChorus: true,
    removedChorusCount,
    preservedVerseCount,
    isChanged,
  }
}
