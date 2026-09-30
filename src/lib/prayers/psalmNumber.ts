/**
 * Extract a Psalm number from Mezmure Dawit slugs / titles.
 * Live Supabase pattern: `psalm-001`, `psalm-025`, `psalm-150`.
 */
export function getPsalmNumber(
  slug?: string | null,
  title?: string | null,
): number | null {
  const fromSlug = extractPsalmNumberFromSlug(slug)
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
    return Number.isFinite(n) && n > 0 ? n : null
  }

  // Fallback: psalm-001 style where the only number is the psalm index.
  if (/^psalm[-_]?\d+$/i.test(value) || /^mezmure?-?dawit[-_]?\d+$/i.test(value)) {
    const bare = value.match(/(\d{1,3})$/)
    if (bare) {
      const n = Number.parseInt(bare[1], 10)
      return Number.isFinite(n) && n > 0 ? n : null
    }
  }

  return null
}

function extractPsalmNumberFromTitle(title?: string | null): number | null {
  const value = (title || '').trim()
  if (!value) return null
  const match = value.match(/\b(?:psalm|መዝሙር)\s*0*(\d{1,3})\b/i)
  if (!match) return null
  const n = Number.parseInt(match[1], 10)
  return Number.isFinite(n) && n > 0 ? n : null
}

export function compareByPsalmNumber(
  a: { slug?: string | null; title?: string | null; order?: number | null },
  b: { slug?: string | null; title?: string | null; order?: number | null },
): number {
  const an = getPsalmNumber(a.slug, a.title)
  const bn = getPsalmNumber(b.slug, b.title)
  const av = an ?? (typeof a.order === 'number' ? a.order + 10_000 : 99_999)
  const bv = bn ?? (typeof b.order === 'number' ? b.order + 10_000 : 99_999)
  if (av !== bv) return av - bv
  return (a.slug || '').localeCompare(b.slug || '')
}

export function formatPsalmLabel(number: number): string {
  return `Psalm ${number}`
}
