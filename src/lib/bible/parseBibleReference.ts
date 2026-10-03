/**
 * Parse user/voice Bible references into structured lookups.
 * Number-word conversion applies only inside a detected reference shape.
 */

export type ParsedBibleReference = {
  bookQuery: string
  chapter: number | null
  verseStart: number | null
  verseEnd: number | null
  /** True when the query looks like a scripture reference (not free text). */
  isReference: boolean
  raw: string
}

const NUMBER_WORDS: Record<string, number> = {
  zero: 0,
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9,
  ten: 10,
  eleven: 11,
  twelve: 12,
  thirteen: 13,
  fourteen: 14,
  fifteen: 15,
  sixteen: 16,
  seventeen: 17,
  eighteen: 18,
  nineteen: 19,
  twenty: 20,
  thirty: 30,
  forty: 40,
  fifty: 50,
  sixty: 60,
  seventy: 70,
  eighty: 80,
  ninety: 90,
}

const BOOK_ORDINAL_WORDS: Record<string, string> = {
  first: '1',
  second: '2',
  third: '3',
  '1st': '1',
  '2nd': '2',
  '3rd': '3',
  i: '1',
  ii: '2',
  iii: '3',
}

function collapseWs(value: string): string {
  return value.replace(/\s+/g, ' ').trim()
}

function looksLikeReferenceSkeleton(value: string): boolean {
  // Digits or English number-words after a book-like token, optionally with chapter/verse words.
  if (/\d/.test(value)) return true
  if (/\b(chapter|chapters|verse|verses|ch)\b/i.test(value)) return true
  if (
    /\b(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety)\b/i.test(
      value,
    )
  ) {
    return true
  }
  return false
}

/** Convert English number words to digits only inside a reference-shaped query. */
export function convertReferenceNumberWords(input: string): string {
  const raw = collapseWs(input)
  if (!raw || !looksLikeReferenceSkeleton(raw)) return raw

  // Normalize book ordinal words at the start: "First Corinthians" → "1 Corinthians"
  let text = raw.replace(
    /^(first|second|third|1st|2nd|3rd|i|ii|iii)\b\.?\s+/i,
    (_, word: string) => `${BOOK_ORDINAL_WORDS[word.toLowerCase()] || word} `,
  )

  const tokens = text.split(' ')
  const out: string[] = []
  for (let i = 0; i < tokens.length; i += 1) {
    const token = tokens[i]
    const lower = token.toLowerCase().replace(/\.$/, '')
    if (NUMBER_WORDS[lower] != null && NUMBER_WORDS[lower]! >= 20 && NUMBER_WORDS[lower]! % 10 === 0) {
      const next = tokens[i + 1]?.toLowerCase().replace(/\.$/, '')
      if (next && NUMBER_WORDS[next] != null && NUMBER_WORDS[next]! < 10) {
        out.push(String(NUMBER_WORDS[lower]! + NUMBER_WORDS[next]!))
        i += 1
        continue
      }
    }
    if (NUMBER_WORDS[lower] != null) {
      out.push(String(NUMBER_WORDS[lower]))
      continue
    }
    out.push(token)
  }

  // "John 3 16" / "1 Samuel 3 10" → chapter:verse (preserve leading book numbers).
  text = out.join(' ')
  text = text.replace(
    /^((?:[123]\s+)?[A-Za-z\u1200-\u137F][A-Za-z\u1200-\u137F\s.'’-]*)\s+(\d+)\s+(\d+)(?:\s*[-–—]\s*(\d+))?$/u,
    (_, book: string, chapter: string, verse: string, verseEnd?: string) =>
      verseEnd
        ? `${collapseWs(book)} ${chapter}:${verse}-${verseEnd}`
        : `${collapseWs(book)} ${chapter}:${verse}`,
  )

  return collapseWs(text)
}

function parseIntStrict(value: string | undefined): number | null {
  if (!value) return null
  if (!/^\d+$/.test(value)) return null
  const n = Number(value)
  if (!Number.isFinite(n) || n < 0) return null
  return n
}

/**
 * Parse a Bible reference query.
 * Book-only queries return isReference=true only when a later resolver confirms the book;
 * here book-only sets isReference=false so free-text words are not treated as refs yet.
 */
export function parseBibleReference(queryRaw: string): ParsedBibleReference {
  const raw = collapseWs(queryRaw || '')
  const empty: ParsedBibleReference = {
    bookQuery: '',
    chapter: null,
    verseStart: null,
    verseEnd: null,
    isReference: false,
    raw,
  }
  if (!raw) return empty

  const converted = convertReferenceNumberWords(raw)
  let text = converted
    .replace(/[–—]/g, '-')
    .replace(/\s*:\s*/g, ':')
    .replace(/\s*-\s*/g, '-')

  // Strip soft words while keeping structure.
  text = text
    .replace(/\b(chapter|chapters|ch)\b\.?/gi, ' ')
    .replace(/\b(verses|verse|vss|vs|v)\b\.?/gi, ':')
    .replace(/\s*:\s*/g, ':')
    .replace(/\s+/g, ' ')
    .trim()

  // Patterns with verse / range
  // Book chapter:verse-verse | Book chapter:verse | Book chapter
  const rangeMatch = text.match(
    /^(.+?)\s+(\d+):(\d+)(?:-(\d+))?$/u,
  )
  if (rangeMatch) {
    const bookQuery = collapseWs(rangeMatch[1] || '')
    const chapter = parseIntStrict(rangeMatch[2])
    const verseStart = parseIntStrict(rangeMatch[3])
    const verseEnd = parseIntStrict(rangeMatch[4]) ?? verseStart
    if (bookQuery && chapter != null && verseStart != null) {
      return {
        bookQuery,
        chapter,
        verseStart,
        verseEnd: verseEnd != null && verseEnd < verseStart ? verseStart : verseEnd,
        isReference: true,
        raw,
      }
    }
  }

  const chapterMatch = text.match(/^(.+?)\s+(\d+)$/u)
  if (chapterMatch) {
    const bookQuery = collapseWs(chapterMatch[1] || '')
    const chapter = parseIntStrict(chapterMatch[2])
    // Guard: bare "1" after nothing — need a non-empty book token that isn't only a number.
    if (bookQuery && !/^\d+$/.test(bookQuery) && chapter != null) {
      return {
        bookQuery,
        chapter,
        verseStart: null,
        verseEnd: null,
        isReference: true,
        raw,
      }
    }
  }

  // Book only — candidate; caller confirms via resolver.
  if (text && !/^\d+$/.test(text)) {
    return {
      bookQuery: text,
      chapter: null,
      verseStart: null,
      verseEnd: null,
      isReference: false,
      raw,
    }
  }

  return empty
}
