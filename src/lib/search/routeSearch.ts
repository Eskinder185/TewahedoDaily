import {
  normalizeAmharicSearchText,
  normalizeLatinSearchText,
} from '../publicContent/mezmurSearch'
import { QUERY_ALIASES, ROUTE_CATALOG, type RouteCatalogEntry } from './routeCatalog'
import type { SiteSearchResult } from './types'

function scoreAlias(queryNorm: string, entry: RouteCatalogEntry): number | null {
  const titleNorm = normalizeLatinSearchText(entry.title)
  if (titleNorm === queryNorm) return 0.001
  if (titleNorm.startsWith(queryNorm) && queryNorm.length >= 3) return 0.02

  for (const alias of entry.aliases) {
    const a = normalizeLatinSearchText(alias)
    const am = normalizeAmharicSearchText(alias)
    if (a === queryNorm || am === queryNorm) return 0.005
    if (a.includes(queryNorm) && queryNorm.length >= 3) return 0.04
    if (queryNorm.includes(a) && a.length >= 4) return 0.05
  }

  const blob = normalizeLatinSearchText(
    `${entry.title} ${entry.description} ${entry.aliases.join(' ')}`,
  )
  if (queryNorm.length >= 3 && blob.includes(queryNorm)) return 0.12
  return null
}

export function searchRouteCatalog(queryRaw: string, limit = 8): SiteSearchResult[] {
  const query = queryRaw.trim()
  if (!query) return []
  const queryNorm = normalizeLatinSearchText(query)
  const queryAm = normalizeAmharicSearchText(query)
  const expanded = new Set<string>([queryNorm, queryAm])
  for (const [key, vals] of Object.entries(QUERY_ALIASES)) {
    if (queryNorm.includes(normalizeLatinSearchText(key))) {
      for (const v of vals) expanded.add(normalizeLatinSearchText(v))
    }
  }

  const hits: SiteSearchResult[] = []
  for (const entry of ROUTE_CATALOG) {
    let best: number | null = null
    let kind: SiteSearchResult['matchKind'] = 'fuzzy'
    for (const q of expanded) {
      if (!q) continue
      const s = scoreAlias(q, entry)
      if (s == null) continue
      if (best == null || s < best) {
        best = s
        kind = s <= 0.01 ? 'exact' : s <= 0.05 ? 'alias' : 'keyword'
      }
    }
    if (best == null) continue
    // Lower score is better (Fuse-like); convert with priority boost
    const score = best - entry.priority / 100000
    hits.push({
      sourceType: entry.sourceType,
      sourceId: entry.id,
      title: entry.title,
      titleAmharic: entry.titleAmharic || '',
      description: entry.description,
      route: entry.route,
      imagePath: null,
      score,
      matchKind: kind,
      typeLabel: entry.typeLabel,
    })
  }

  return hits.sort((a, b) => a.score - b.score).slice(0, limit)
}

/** Direct navigation intents (“go to calendar”, “open hymns”). */
export function matchNavigationIntent(queryRaw: string): SiteSearchResult | null {
  const q = normalizeLatinSearchText(queryRaw)
  if (!q) return null

  const go =
    /^(go to|open|take me to|show me|navigate to|where is|where can i find)\s+(.+)$/i.exec(
      queryRaw.trim(),
    )
  const target = go ? go[2].trim() : queryRaw.trim()
  const hits = searchRouteCatalog(target, 3)
  if (!hits.length) return null

  // Only treat as pure intent when strongly matched
  const top = hits[0]
  if (top.matchKind === 'exact' || top.matchKind === 'alias' || top.score <= 0.06) {
    return { ...top, matchKind: 'intent' }
  }
  if (go && top.score <= 0.15) return { ...top, matchKind: 'intent' }
  return null
}
