/**
 * Extract a Psalm number from Mezmure Dawit rows / slugs / titles.
 *
 * Live Supabase slug patterns:
 * - `psalm-001` … `psalm-041` (zero-padded)
 * - `psalm-42` … `psalm-99` (unpadded)
 * - `psalm-100` … `psalm-150`
 *
 * Prefer the explicit `psalm-N` / `mezmure-dawit-N` token — never a generic
 * “first number in the string” regex that can grab unrelated digits.
 */
export type PsalmNumberSource = {
  slug?: string | null
  title?: string | null
  transliterationTitle?: string | null
}

export function getPsalmNumber(
  rowOrSlug?: PsalmNumberSource | string | null,
  title?: string | null,
): number | null {
  if (rowOrSlug && typeof rowOrSlug === 'object') {
    const fromSlug = extractPsalmNumberFromSlug(rowOrSlug.slug)
    if (fromSlug != null) return fromSlug
    return (
      extractPsalmNumberFromTitle(rowOrSlug.title) ??
      extractPsalmNumberFromTitle(rowOrSlug.transliterationTitle) ??
      extractPsalmNumberFromTitle(title)
    )
  }

  const fromSlug = extractPsalmNumberFromSlug(rowOrSlug)
  if (fromSlug != null) return fromSlug
  return extractPsalmNumberFromTitle(title)
}

function extractPsalmNumberFromSlug(slug?: string | null): number | null {
  const value = (slug || '').trim().toLowerCase()
  if (!value) return null

  // Prefer explicit psalm / mezmur(e)-dawit patterns so unrelated trailing digits are ignored.
  const patterned = value.match(
    /(?:^|[-_])(?:psalm|mezmure?-?dawit|mezmur-?dawit)[-_]?0*(\d{1,3})(?:$|[-_])/i,
  )
  if (patterned) {
    const n = Number.parseInt(patterned[1], 10)
    return Number.isFinite(n) && n > 0 && n <= 150 ? n : null
  }

  // Fallback: psalm-001 style where the only number is the psalm index.
  if (/^psalm[-_]?\d+$/i.test(value) || /^mezmure?-?dawit[-_]?\d+$/i.test(value)) {
    const bare = value.match(/(\d{1,3})$/)
    if (bare) {
      const n = Number.parseInt(bare[1], 10)
      return Number.isFinite(n) && n > 0 && n <= 150 ? n : null
    }
  }

  return null
}

function extractPsalmNumberFromTitle(title?: string | null): number | null {
  const value = (title || '').trim()
  if (!value) return null
  const match = value.match(/\b(?:psalm|መዝሙር|mezmure\s+dawit\s+mi['’]?raf)\s*0*(\d{1,3})\b/i)
  if (!match) return null
  const n = Number.parseInt(match[1], 10)
  return Number.isFinite(n) && n > 0 && n <= 150 ? n : null
}

export function compareByPsalmNumber(
  a: { slug?: string | null; title?: string | null; order?: number | null },
  b: { slug?: string | null; title?: string | null; order?: number | null },
): number {
  const an = getPsalmNumber(a)
  const bn = getPsalmNumber(b)
  const av = an ?? (typeof a.order === 'number' ? a.order + 10_000 : 99_999)
  const bv = bn ?? (typeof b.order === 'number' ? b.order + 10_000 : 99_999)
  if (av !== bv) return av - bv
  return (a.slug || '').localeCompare(b.slug || '')
}

export function formatPsalmLabel(number: number): string {
  return `Psalm ${number}`
}
