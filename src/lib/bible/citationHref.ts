/**
 * Turn a catalog search hit into a reader route.
 * Notice cards and unmatched verse requests do not become links.
 */

export type CitationSearchHit = {
  sourceType: string
  sourceId: string
  route: string
}

const NOTICE_ID = /^bible-notice:/

export function citationHrefFromSearchHit(
  hit: CitationSearchHit,
  verse: number | null,
): string | null {
  const route = (hit.route || '').split('#')[0]
  if (!route.startsWith('/bible/')) return null
  if (NOTICE_ID.test(hit.sourceId || '')) return null
  if (hit.sourceType === 'bible-verse' || hit.sourceType === 'bible-range') {
    if (verse == null || verse < 1) return null
    return `${route}#verse-${verse}`
  }
  if (hit.sourceType === 'bible-chapter' && verse == null) return route
  return null
}
