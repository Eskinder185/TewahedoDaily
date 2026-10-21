/**
 * Calendar and related-content Bible links.
 * A link is returned only when a published catalog match confirms the target.
 * Unparsed or missing passages stay as text.
 */
import { parseBibleReference } from './parseBibleReference.ts'
import { searchBibleReference } from './bibleSearch.ts'
import { citationHrefFromSearchHit } from './citationHref.ts'

export type { CitationSearchHit } from './citationHref.ts'
export { citationHrefFromSearchHit } from './citationHref.ts'

export type ScriptureCitation = {
  label: string
  /** Reader route, including #verse-N only when that verse row exists. */
  href: string | null
}

/** Resolve one stored reference against the published Bible catalog. */
export async function resolveScriptureCitation(
  raw: string,
  language: 'en' | 'am' = 'en',
): Promise<ScriptureCitation> {
  const label = (raw || '').trim()
  if (!label) return { label: '', href: null }
  const parsed = parseBibleReference(label)
  if (!parsed.isReference || !parsed.bookQuery || parsed.chapter == null) {
    return { label, href: null }
  }
  try {
    const found = await searchBibleReference(parsed, { language })
    const verse = parsed.verseStart
    for (const hit of found.results) {
      const href = citationHrefFromSearchHit(hit, verse)
      if (href) return { label, href }
    }
  } catch {
    return { label, href: null }
  }
  return { label, href: null }
}
