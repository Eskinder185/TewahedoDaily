import type { ContentType } from '../supabase/cms.types.ts'

/** Editorial JSON relations may point at CMS rows or approved Bible routes. */
export type RelatedContentType = ContentType | 'bible'

export type Related = {
  type: RelatedContentType
  id: string
  title?: string
  /** Required for bible; optional override for CMS targets. */
  route?: string
}

export type ResolvedRelated = {
  type: RelatedContentType
  id: string
  title: string
  slug: string
  route: string
}

const CMS_TYPES = new Set<string>(['mezmur', 'saints', 'feasts', 'prayers', 'articles'])
const ALL_TYPES = new Set<string>([...CMS_TYPES, 'bible'])

const BIBLE_ROUTE =
  /^\/bible\/([a-z0-9]+(?:-[a-z0-9]+)*)\/(\d+)(?:#verse-\d+)?$/i

export function isRelatedContentType(value: string): value is RelatedContentType {
  return ALL_TYPES.has(value)
}

export function isCmsRelationType(value: string): value is ContentType {
  return CMS_TYPES.has(value)
}

/** Normalize stored JSON; drop invalid / oversized entries (max 30). */
export function normalizeRelatedList(raw: unknown): Related[] {
  if (!Array.isArray(raw)) return []
  const out: Related[] = []
  const seen = new Set<string>()
  for (const item of raw) {
    if (!item || typeof item !== 'object') continue
    const row = item as Record<string, unknown>
    const type = String(row.type || '').trim()
    const id = String(row.id || '').trim()
    if (!type || !id || !isRelatedContentType(type)) continue
    const key = `${type}:${id}`
    if (seen.has(key)) continue
    seen.add(key)

    const title = typeof row.title === 'string' ? row.title.trim() : ''
    const route = typeof row.route === 'string' ? row.route.trim() : ''

    if (type === 'bible') {
      const bibleRoute = route || (id.includes(':') ? bibleRouteFromId(id) : '')
      if (!bibleRoute || !BIBLE_ROUTE.test(bibleRoute)) continue
      out.push({
        type: 'bible',
        id,
        title: title || bibleTitleFromRoute(bibleRoute),
        route: bibleRoute,
      })
    } else {
      out.push({
        type,
        id,
        ...(title ? { title } : {}),
        ...(route ? { route } : {}),
      })
    }
    if (out.length >= 30) break
  }
  return out
}

export function bibleRouteFromId(id: string): string {
  const [slug, chapter] = id.split(':')
  if (!slug || !chapter || !/^\d+$/.test(chapter)) return ''
  return `/bible/${slug}/${chapter}`
}

export function bibleTitleFromRoute(route: string): string {
  const match = route.match(BIBLE_ROUTE)
  if (!match) return 'Bible'
  const slug = match[1].replace(/-/g, ' ')
  return `${slug.replace(/\b\w/g, (c) => c.toUpperCase())} ${match[2]}`
}

export function contentPathForRelated(
  type: RelatedContentType,
  slug: string,
  fallbackRoute?: string,
): string {
  if (type === 'bible') return fallbackRoute || ''
  if (type === 'mezmur') return `/practice/mezmur/${slug}`
  return `/content/${type}/${slug}`
}

/**
 * Preserve editor order. Drop unpublished / missing CMS targets.
 * Bible relations with a valid route are kept without a DB row.
 */
export function mergeResolvedRelations(
  requested: Related[],
  hydrated: Array<{
    type: ContentType
    id: string
    title: string
    slug: string
  }>,
): ResolvedRelated[] {
  const map = new Map(
    hydrated.map((row) => [`${row.type}:${row.id}`, row] as const),
  )
  const out: ResolvedRelated[] = []
  for (const req of normalizeRelatedList(requested)) {
    if (req.type === 'bible') {
      const route = req.route || bibleRouteFromId(req.id)
      if (!route || !BIBLE_ROUTE.test(route)) continue
      out.push({
        type: 'bible',
        id: req.id,
        title: req.title || bibleTitleFromRoute(route),
        slug: req.id,
        route,
      })
      continue
    }
    const hit = map.get(`${req.type}:${req.id}`)
    if (!hit) continue
    out.push({
      type: hit.type,
      id: hit.id,
      title: hit.title || req.title || hit.slug,
      slug: hit.slug,
      route: contentPathForRelated(hit.type, hit.slug, req.route),
    })
  }
  return out
}

export function relationTypeLabel(type: RelatedContentType): string {
  switch (type) {
    case 'mezmur':
      return 'Hymn'
    case 'saints':
      return 'Saint'
    case 'feasts':
      return 'Feast'
    case 'prayers':
      return 'Prayer'
    case 'articles':
      return 'Teaching'
    case 'bible':
      return 'Bible'
    default:
      return 'Related'
  }
}

/** Encyclopedia / teaching topic categories (must match DB check constraint). */
export const ENCYCLOPEDIA_CATEGORIES = [
  'Church teaching',
  'Saints',
  'Feasts',
  'Bible study',
  'Church history',
  'The Seven Mysteries',
] as const

export type EncyclopediaCategory = (typeof ENCYCLOPEDIA_CATEGORIES)[number]

export function isEncyclopediaCategory(value: string | null | undefined): value is EncyclopediaCategory {
  return Boolean(value && (ENCYCLOPEDIA_CATEGORIES as readonly string[]).includes(value))
}

/** Future topic templates keyed by teaching category — presentation only. */
export function encyclopediaTemplateKind(
  category: string | null | undefined,
): 'sacrament' | 'terminology' | 'history' | 'general' {
  if (category === 'The Seven Mysteries') return 'sacrament'
  if (category === 'Church history') return 'history'
  if (category === 'Church teaching' || category === 'Bible study') return 'terminology'
  return 'general'
}
