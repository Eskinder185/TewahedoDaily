/**
 * Website-search accounting and published editorial hits.
 * Pure: no network, no generated text.
 */
import { isPublicContentRoute } from './searchCore'
import type { SiteSearchResult, SiteSourceReport, SiteSourceStatus } from './types'

export type EditorialSearchKind = 'saints' | 'feasts' | 'articles'

export type SiteSourceAttempt = {
  name: string
  failed: boolean
  count: number
}

export function reportSiteSources(sources: SiteSourceAttempt[]): SiteSourceReport[] {
  return sources.map((source) => {
    const status: SiteSourceStatus = source.failed
      ? 'failed'
      : source.count > 0
        ? 'matches'
        : 'empty'
    return {
      name: source.name,
      status,
      count: source.failed ? 0 : source.count,
    }
  })
}

export function siteSearchFlags(reports: SiteSourceReport[], resultCount: number) {
  const failedCount = reports.filter((report) => report.status === 'failed').length
  const failed = reports.length > 0 && failedCount === reports.length
  return {
    partial: failedCount > 0,
    failed,
    zeroResults: resultCount === 0 && !failed,
  }
}

export function isNavigationResult(result: {
  sourceType: string
  matchKind: string
}): boolean {
  return (
    result.sourceType === 'page' ||
    result.sourceType === 'account' ||
    result.matchKind === 'intent' ||
    result.matchKind === 'personal'
  )
}

export type EditorialSearchRow = {
  id: string
  slug: string
  title: string
  title_amharic?: string | null
  description?: string | null
  status?: string | null
  thumbnail_url?: string | null
  image_path?: string | null
  teaching_category?: string | null
}

const EDITORIAL_LABEL: Record<
  EditorialSearchKind,
  { sourceType: SiteSearchResult['sourceType']; typeLabel: string }
> = {
  saints: { sourceType: 'saint', typeLabel: 'Saint' },
  feasts: { sourceType: 'feast', typeLabel: 'Feast' },
  articles: { sourceType: 'learn', typeLabel: 'Learn' },
}

/** Published saint, feast, and learning rows only. Drafts and unsafe slugs are dropped. */
export function editorialSearchResults(
  kind: EditorialSearchKind,
  items: EditorialSearchRow[],
): SiteSearchResult[] {
  const label = EDITORIAL_LABEL[kind]
  const out: SiteSearchResult[] = []
  for (const item of items) {
    if (item.status !== 'published') continue
    const slug = item.slug.trim()
    const title = item.title.trim()
    if (!slug || !title || slug.includes('/') || slug.includes('..') || slug.includes('\\')) continue
    const route = `/content/${kind}/${slug}`
    if (!isPublicContentRoute(route)) continue
    const description = item.description?.trim() || item.teaching_category?.trim() || ''
    out.push({
      sourceType: label.sourceType,
      sourceId: `${kind}:${item.id}`,
      title,
      titleAmharic: item.title_amharic?.trim() || '',
      description,
      route,
      imagePath: item.thumbnail_url || item.image_path || null,
      score: 0.04,
      matchKind: 'keyword',
      typeLabel: label.typeLabel,
    })
  }
  return out
}
