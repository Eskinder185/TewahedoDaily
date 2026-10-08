/**
 * Canonical Bible reader routes from FastAPI / local search payloads.
 * Never invents book slugs — requires an explicit slug or safe ASCII slug string.
 */

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function asTrimmedString(value: unknown): string {
  return typeof value === 'string' ? value.trim() : ''
}

/** Safe Bible book slug for /bible/:slug */
export function isSafeBibleBookSlug(value: unknown): value is string {
  if (typeof value !== 'string') return false
  const slug = value.trim().toLowerCase()
  if (!slug || slug.length > 80) return false
  return /^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(slug)
}

export function extractBibleBookSlug(payload: {
  book?: unknown
  book_slug?: unknown
  book_name?: unknown
}): string | null {
  const direct = payload.book_slug
  if (isSafeBibleBookSlug(direct)) return direct.trim().toLowerCase()

  if (isRecord(payload.book)) {
    const nested = payload.book.slug
    if (isSafeBibleBookSlug(nested)) return nested.trim().toLowerCase()
  }

  if (isSafeBibleBookSlug(payload.book)) return String(payload.book).trim().toLowerCase()
  return null
}

function positiveInt(value: unknown): number | null {
  const n = typeof value === 'number' ? value : Number(value)
  if (!Number.isSafeInteger(n) || n < 1) return null
  return n
}

/**
 * Resolve /bible/:slug or /bible/:slug/:chapter[#verse-N] from API rows.
 * Chapter number is used as the reader ordinal (matches BiblePage routing).
 * When verse is present, append `#verse-{n}` for in-chapter scroll (BiblePage).
 */
export function resolveBibleDetailPath(payload: {
  book?: unknown
  book_slug?: unknown
  book_name?: unknown
  chapter?: unknown
  verse?: unknown
  verse_number?: unknown
  end_verse?: unknown
}): string | null {
  const slug = extractBibleBookSlug(payload)
  if (!slug) return null
  const chapter = positiveInt(payload.chapter)
  if (!chapter) return `/bible/${slug}`
  const verse = positiveInt(payload.verse ?? payload.verse_number)
  if (verse) return `/bible/${slug}/${chapter}#verse-${verse}`
  return `/bible/${slug}/${chapter}`
}

/** Display helpers when book may be a nested object. */
export function flattenBibleBookFields(payload: {
  book?: unknown
  book_name?: unknown
  book_slug?: unknown
}): {
  book: string | null
  book_name: string | null
  book_name_amharic: string | null
  book_slug: string | null
} {
  const slug = extractBibleBookSlug(payload)
  if (isRecord(payload.book)) {
    const nameEn = asTrimmedString(payload.book.name_en)
    const nameAm = asTrimmedString(payload.book.name_am)
    return {
      book: nameEn || slug,
      book_name: nameEn || nameAm || slug,
      book_name_amharic: nameAm || null,
      book_slug: slug,
    }
  }
  const book = asTrimmedString(payload.book) || null
  const book_name = asTrimmedString(payload.book_name) || book
  return { book, book_name, book_name_amharic: null, book_slug: slug }
}
