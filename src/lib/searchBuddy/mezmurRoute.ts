import type { HymnRow } from './apiTypes.ts'

/** Public Mezmur detail route used across Practice / Search Buddy. */
export const MEZMUR_DETAIL_ROUTE_PREFIX = '/practice/mezmur'

/**
 * Safe URL slug for /practice/mezmur/:slug.
 * Rejects titles, spaces, path segments, and other untrusted values.
 */
export function isSafeMezmurSlug(value: unknown): value is string {
  if (typeof value !== 'string') return false
  const slug = value.trim()
  if (!slug || slug.length > 200) return false
  // Canonical Practice slugs are ASCII with hyphens (e.g. absera-gebriel).
  return /^[a-z0-9]+(?:-[a-z0-9]+)*$/i.test(slug)
}

/**
 * Resolve a Mezmur detail path from a FastAPI hymn row.
 * Prefers explicit slug / route identifiers — never invents from titles.
 */
export function resolveMezmurDetailPath(hymn: HymnRow | null | undefined): string | null {
  if (!hymn || typeof hymn !== 'object') return null

  const candidates: unknown[] = [
    hymn.slug,
    hymn.mezmur_slug,
    hymn.canonical_slug,
  ]

  // Trusted absolute path fields only when they already point at mezmur detail.
  for (const key of ['route', 'canonical_route', 'path', 'href'] as const) {
    const raw = hymn[key]
    if (typeof raw !== 'string') continue
    const trimmed = raw.trim()
    const match = trimmed.match(/^\/practice\/mezmur\/([a-z0-9]+(?:-[a-z0-9]+)*)$/i)
    if (match) return `${MEZMUR_DETAIL_ROUTE_PREFIX}/${match[1].toLowerCase()}`
  }

  for (const candidate of candidates) {
    if (!isSafeMezmurSlug(candidate)) continue
    return `${MEZMUR_DETAIL_ROUTE_PREFIX}/${candidate.trim().toLowerCase()}`
  }

  return null
}
