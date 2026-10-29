/**
 * A game question may only appear when its cited source is publicly readable.
 * Church Library citations point at /library/read/<book>; until that book is
 * `published`, the link would show "not published yet", so such questions stay
 * hidden. Bible, Mezmur and calendar sources are always public on this site.
 */
import { supabase } from '../supabase/client'
import type { SourceReference } from './types'

const LIBRARY_ROUTE = /^\/library\/read\/([^/?#]+)/

export const librarySlugOf = (source: SourceReference) =>
  source.kind === 'church-library' ? source.route.match(LIBRARY_ROUTE)?.[1] ?? null : null

let cache: Promise<Set<string>> | null = null

/** Slugs of Church Library books that are published (readable by every visitor). */
export function publishedLibraryBooks(): Promise<Set<string>> {
  if (!cache) {
    cache = (async () => {
      if (!supabase) return new Set<string>()
      try {
        const { data, error } = await (supabase as unknown as {
          from: (t: string) => { select: (c: string) => { eq: (k: string, v: string) => Promise<{ data: { slug: string }[] | null; error: unknown }> } }
        }).from('church_library_books').select('slug').eq('publication_status', 'published')
        if (error || !data) return new Set<string>()
        return new Set(data.map((row) => row.slug))
      } catch {
        return new Set<string>()
      }
    })()
  }
  return cache
}

export function isSourcePublic(source: SourceReference, published: Set<string>) {
  const slug = librarySlugOf(source)
  return slug === null ? source.kind !== 'church-library' : published.has(slug)
}

/** Keep only items whose source a visitor can open. */
export async function withPublicSources<T extends { source: SourceReference }>(items: T[]): Promise<T[]> {
  if (!items.some((item) => item.source.kind === 'church-library')) return items
  const published = await publishedLibraryBooks()
  return items.filter((item) => isSourcePublic(item.source, published))
}

/** Synchronous first pass: drop library-sourced items until availability is known. */
export const withoutLibrarySources = <T extends { source: SourceReference }>(items: T[]) =>
  items.filter((item) => item.source.kind !== 'church-library')
