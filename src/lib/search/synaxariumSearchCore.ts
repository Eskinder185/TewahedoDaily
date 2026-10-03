/**
 * Pure Synaxarium Search Buddy matching (no network / Supabase).
 */
import {
  displayTitle,
  expandSearchAliases,
  normalizeSearchText,
  searchTokens,
} from './searchCore.ts'
import type { SiteSearchResult } from './types.ts'

export type SynaxariumSearchDoc = {
  id: string
  kind: 'day' | 'commemoration'
  title: string
  titleAmharic: string
  daySlug: string
  ethiopianLabel: string
  ethiopianLabelAm: string
  /** English display date (often includes Gregorian) */
  displayDateEnglish: string
  monthNumber: number
  dayNumber: number
  excerpt: string
  imagePath: string | null
  blob: string
}

export type SynaxariumTodayParts = { month: number; day: number }

function dualCalendarLabel(
  doc: Pick<SynaxariumSearchDoc, 'ethiopianLabel' | 'ethiopianLabelAm' | 'displayDateEnglish'>,
): string {
  const parts = [doc.displayDateEnglish || doc.ethiopianLabel, doc.ethiopianLabelAm]
    .map((p) => (p || '').trim())
    .filter(Boolean)
  return parts.filter((v, i, arr) => arr.indexOf(v) === i).join(' · ')
}

function dayRoute(slug: string): string {
  return `/pray/synaxarium/${slug.trim().toLowerCase()}`
}

export function isTodaySynaxariumQuery(query: string): boolean {
  const q = normalizeSearchText(query)
  return (
    (/\b(today|todays)\b/.test(q) &&
      /\b(synaxarium|senkesar|senkessar|saints?)\b/.test(q)) ||
    q === 'todays synaxarium' ||
    q === 'today synaxarium' ||
    (q.includes('ስንክሳር') && q.includes('ዛሬ'))
  )
}

function matchesDateTokens(doc: SynaxariumSearchDoc, tokens: string[]): boolean {
  const month = normalizeSearchText(doc.ethiopianLabel.split(/\s+/)[0] || '')
  const dayNum = String(doc.dayNumber)
  const hasMonth = tokens.some((t) => month.includes(t) || t.includes(month))
  const hasDay = tokens.some((t) => t === dayNum || t === dayNum.padStart(2, '0'))
  return hasMonth && hasDay
}

/** Whole-token match so "synax" does not hit "synaxarium". */
function textHasToken(haystack: string, token: string): boolean {
  if (!token || !haystack) return false
  if (haystack === token) return true
  return ` ${haystack} `.includes(` ${token} `)
}

export function searchSynaxariumCatalog(
  docs: SynaxariumSearchDoc[],
  queryRaw: string,
  limit = 10,
  todayEth?: SynaxariumTodayParts | null,
): SiteSearchResult[] {
  const query = queryRaw.trim()
  if (!query || !docs.length) return []

  const expanded = expandSearchAliases(query)
  const tokens = searchTokens(expanded)
  const today = isTodaySynaxariumQuery(query)
  const todayMonth = todayEth?.month ?? 0
  const todayDay = todayEth?.day ?? 0

  const hits: Array<SiteSearchResult & { _adj: number }> = []

  for (const doc of docs) {
    let score = 0.12
    let kind: SiteSearchResult['matchKind'] = 'keyword'
    let matched = false

    if (today && todayMonth && todayDay && doc.monthNumber === todayMonth && doc.dayNumber === todayDay) {
      matched = true
      score = doc.kind === 'day' ? 0.01 : 0.015
      kind = 'alias'
    }

    const titleNorm = normalizeSearchText(doc.title)
    const amNorm = normalizeSearchText(doc.titleAmharic)
    for (const token of tokens) {
      if (!token) continue
      if (titleNorm === token || amNorm === token) {
        matched = true
        score = Math.min(score, 0.01)
        kind = 'exact'
      } else if (textHasToken(titleNorm, token) || textHasToken(amNorm, token)) {
        matched = true
        score = Math.min(score, 0.03)
        kind = kind === 'exact' ? 'exact' : 'alias'
      } else if (token.length >= 4 && textHasToken(doc.blob, token)) {
        matched = true
        score = Math.min(score, 0.08)
      }
    }

    if (!matched && tokens.length >= 2 && matchesDateTokens(doc, tokens)) {
      matched = true
      score = Math.min(score, 0.04)
      kind = 'alias'
    }

    if (!matched) continue

    const dateLabel = dualCalendarLabel(doc)
    const titled =
      doc.kind === 'commemoration' && doc.title && !doc.title.includes(doc.ethiopianLabel)
        ? `${doc.title} · ${doc.ethiopianLabel}`
        : doc.title
    hits.push({
      sourceType: doc.kind === 'day' ? 'synaxarium' : 'synaxarium_commemoration',
      sourceId: doc.id,
      title: displayTitle(titled, dayRoute(doc.daySlug)),
      titleAmharic: doc.titleAmharic,
      description: dateLabel || 'Synaxarium',
      route: dayRoute(doc.daySlug),
      imagePath: doc.imagePath,
      score,
      matchKind: kind,
      typeLabel: doc.kind === 'day' ? 'Synaxarium Day' : 'Synaxarium',
      dateLabel,
      excerpt: doc.excerpt,
      sourceLabel: 'Synaxarium',
      _adj: score,
    })
  }

  hits.sort((a, b) => a._adj - b._adj || a.title.localeCompare(b.title))
  return hits.slice(0, limit).map(({ _adj: _ignored, ...rest }) => {
    void _ignored
    return rest
  })
}
