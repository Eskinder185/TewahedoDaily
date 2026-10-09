import type { BibleEdition, CanonicalBook, SourceBook } from './bibleTypes'

export type BookAvailability = { am: boolean; en: boolean }

export type CatalogBookMeta = {
  book: CanonicalBook
  availability: BookAvailability
  /** Distinct source volumes for the preferred edition (am, else web). */
  volumeCount: number
}

/** True when a string contains Unicode replacement characters (bad decode / truncation). */
export function hasCorruptText(value: string | null | undefined): boolean {
  if (!value) return false
  return /\uFFFD/.test(value)
}

/**
 * Frontend-only Amharic display names for combined canonical books that lack
 * `bible_canonical_books.name_am`. Keyed by canonical slug. Does not touch the DB.
 *
 * Strings use Unicode escapes so the source file cannot be corrupted in transit.
 */
export const CANONICAL_AMHARIC_DISPLAY_OVERRIDES: Readonly<Record<string, string>> = {
  // መጽሐፈ ሳሙኤል
  samuel: '\u1218\u133d\u1210\u1348 \u1233\u1219\u12a4\u120d',
  // መጽሐፈ ነገሥት
  kings: '\u1218\u133d\u1210\u1348 \u1290\u1308\u1225\u1275',
  // መጽሐፈ ዕዝራና ነህምያ
  'ezra-nehemiah': '\u1218\u133d\u1210\u1348 \u12d5\u12dd\u122b\u1293 \u1290\u1205\u121d\u12eb',
  // መጽሐፈ ዕዝራ ሱቱኤልና ካልእ
  'second-ezra-and-ezra-sutuel':
    '\u1218\u133d\u1210\u1348 \u12d5\u12dd\u122b \u1231\u1271\u12a4\u120d\u1293 \u12ab\u120d\u12a5',
  // መጽሐፈ መቃብያን ካልእና ሣልስ
  'second-and-third-meqabyan':
    '\u1218\u133d\u1210\u1348 \u1218\u1243\u1265\u12eb\u1295 \u12ab\u120d\u12a5\u1293 \u1223\u120d\u1235',
  // የኤርምያስ መጻሕፍት
  'jeremiah-collection': '\u12e8\u12a4\u122d\u121d\u12eb\u1235 \u1218\u133b\u1215\u134d\u1275',
}

function cleanName(value: string | null | undefined): string | null {
  const trimmed = value?.trim()
  if (!trimmed || hasCorruptText(trimmed)) return null
  return trimmed
}

/** Resolved Amharic canonical label: DB `name_am`, else slug override, else null. */
export function canonicalAmharicDisplayName(book: CanonicalBook): string | null {
  return (
    cleanName(book.name_am) ||
    cleanName(CANONICAL_AMHARIC_DISPLAY_OVERRIDES[book.slug]) ||
    null
  )
}

/**
 * Display name for catalog / book chrome.
 * Amharic: DB name_am → slug override → English → slug (never blank).
 * English: name_en → Amharic display → slug.
 * Never uses source-volume titles (1 Samuel / 2 Samuel) as the primary.
 */
export function displayBookName(book: CanonicalBook, language: 'en' | 'am'): string {
  const en = cleanName(book.name_en)
  const am = canonicalAmharicDisplayName(book)
  if (language === 'am') return am || en || book.slug
  return en || am || book.slug
}

/** True when both language labels exist and differ (for secondary line). */
export function hasBilingualBookNames(book: CanonicalBook): boolean {
  const en = cleanName(book.name_en)
  const am = canonicalAmharicDisplayName(book)
  return Boolean(en && am && en !== am)
}

export function displaySourceName(
  source: SourceBook,
  language: 'en' | 'am',
  fallbackVolume: number,
): string {
  const primary = language === 'am' ? source.source_name_am : source.source_name_en
  const secondary = language === 'am' ? source.source_name_en : source.source_name_am
  if (primary && !hasCorruptText(primary)) return primary
  if (secondary && !hasCorruptText(secondary)) return secondary
  return `Volume ${fallbackVolume}`
}

/** Deduplicate by id (and slug as safety), keep sort_order order. */
export function uniqueCanonicalBooks(books: CanonicalBook[]): CanonicalBook[] {
  const byId = new Map<string, CanonicalBook>()
  const bySlug = new Map<string, CanonicalBook>()
  for (const book of books) {
    if (byId.has(book.id) || bySlug.has(book.slug)) continue
    byId.set(book.id, book)
    bySlug.set(book.slug, book)
  }
  return [...byId.values()].sort(
    (a, b) => a.sort_order - b.sort_order || a.canonical_number - b.canonical_number,
  )
}

function editionCodeMap(editions: BibleEdition[]): Map<string, string> {
  return new Map(editions.map((edition) => [edition.id, edition.code]))
}

/**
 * Volume count = distinct source books in Amharic edition when present,
 * otherwise English (web). Catalog cards show this only when > 1.
 */
export function volumeCountForBook(
  bookId: string,
  sources: SourceBook[],
  editions: BibleEdition[],
): number {
  const codes = editionCodeMap(editions)
  const am = sources.filter(
    (s) => s.canonical_book_id === bookId && codes.get(s.edition_id) === 'am',
  )
  if (am.length) return am.length
  return sources.filter(
    (s) => s.canonical_book_id === bookId && codes.get(s.edition_id) === 'web',
  ).length
}

export function availabilityForBook(
  bookId: string,
  sources: SourceBook[],
  editions: BibleEdition[],
): BookAvailability {
  const codes = editionCodeMap(editions)
  let am = false
  let en = false
  for (const source of sources) {
    if (source.canonical_book_id !== bookId) continue
    const code = codes.get(source.edition_id)
    if (code === 'am') am = true
    if (code === 'web') en = true
  }
  return { am, en }
}

export function buildCatalogMeta(
  books: CanonicalBook[],
  sources: SourceBook[],
  editions: BibleEdition[],
): CatalogBookMeta[] {
  return uniqueCanonicalBooks(books).map((book) => ({
    book,
    availability: availabilityForBook(book.id, sources, editions),
    volumeCount: volumeCountForBook(book.id, sources, editions),
  }))
}

/** Local catalog book matches for the Bible search field (instant, no network). */
export function matchCatalogBooks(
  query: string,
  books: CanonicalBook[],
  limit = 8,
): CanonicalBook[] {
  const q = query.trim().toLowerCase()
  if (q.length < 1) return []
  const scored: Array<{ book: CanonicalBook; score: number }> = []
  const raw = query.trim()
  for (const book of uniqueCanonicalBooks(books)) {
    const en = (book.name_en || '').toLowerCase()
    const am = canonicalAmharicDisplayName(book) || ''
    const slug = book.slug.toLowerCase()
    let score = 0
    if (en === q || am === raw || slug === q) score = 100
    else if (en.startsWith(q) || slug.startsWith(q)) score = 80
    else if (am.includes(raw)) score = 75
    else if (en.includes(q) || slug.includes(q)) score = 60
    else continue
    scored.push({ book, score })
  }
  return scored
    .sort((a, b) => b.score - a.score || a.book.sort_order - b.book.sort_order)
    .slice(0, limit)
    .map((row) => row.book)
}
