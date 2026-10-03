/**
 * Published Synaxarium search catalog for Search Buddy.
 * Only status=published rows; never invents commemorations or routes.
 */
import type { SupabaseClient } from '@supabase/supabase-js'
import { gregorianToEthiopian } from '../ethiopianDate'
import { parseKeywordsFromDb } from '../synaxarium/keywords'
import { normalizeSearchText } from './searchCore'
import {
  searchSynaxariumCatalog as searchSynaxariumCatalogCore,
  type SynaxariumSearchDoc,
} from './synaxariumSearchCore'
import type { SiteSearchResult } from './types'

export type { SynaxariumSearchDoc } from './synaxariumSearchCore'
export { isTodaySynaxariumQuery } from './synaxariumSearchCore'

type DayRow = {
  id: string
  slug: string
  ethiopian_month: string
  ethiopian_month_number: number
  ethiopian_day: number
  display_date_english: string | null
  display_date_amharic: string | null
  summary: string | null
  status: string
  image_path?: string | null
}

type CommRow = {
  id: string
  day_id: string
  day_slug: string
  slug: string
  title: string
  title_amharic: string | null
  summary: string | null
  summary_amharic?: string | null
  body_english: string | null
  body_amharic: string | null
  keywords: string[] | string | null
  sort_order: number
  status: string
  image_path?: string | null
  content_review_status?: string | null
}

type SynaxDb = {
  public: {
    Tables: {
      synaxarium_days: { Row: DayRow; Insert: Partial<DayRow>; Update: Partial<DayRow>; Relationships: [] }
      synaxarium_commemorations: {
        Row: CommRow
        Insert: Partial<CommRow>
        Update: Partial<CommRow>
        Relationships: []
      }
    }
    Views: Record<never, never>
    Functions: Record<never, never>
    Enums: Record<never, never>
    CompositeTypes: Record<never, never>
  }
}

let cache: SynaxariumSearchDoc[] | null = null
let cacheAt = 0
const TTL_MS = 10 * 60 * 1000

async function getDb(): Promise<SupabaseClient<SynaxDb> | null> {
  try {
    const mod = await import('../supabase/client')
    return (mod.supabase as unknown as SupabaseClient<SynaxDb> | null) ?? null
  } catch {
    return null
  }
}

function excerptFrom(...parts: Array<string | null | undefined>): string {
  for (const part of parts) {
    const t = (part || '').trim()
    if (!t) continue
    return t.length > 180 ? `${t.slice(0, 177).trim()}…` : t
  }
  return ''
}

async function fetchAllPublishedDays(): Promise<DayRow[]> {
  const db = await getDb()
  if (!db) return []
  const out: DayRow[] = []
  const pageSize = 500
  for (let from = 0; ; from += pageSize) {
    const { data, error } = await db
      .from('synaxarium_days')
      .select(
        'id,slug,ethiopian_month,ethiopian_month_number,ethiopian_day,display_date_english,display_date_amharic,summary,status,image_path',
      )
      .eq('status', 'published')
      .order('ethiopian_month_number')
      .order('ethiopian_day')
      .range(from, from + pageSize - 1)
    if (error) throw error
    const rows = data ?? []
    out.push(...rows)
    if (rows.length < pageSize) break
  }
  return out
}

async function fetchAllPublishedCommemorations(): Promise<CommRow[]> {
  const db = await getDb()
  if (!db) return []
  const out: CommRow[] = []
  const pageSize = 500
  for (let from = 0; ; from += pageSize) {
    const { data, error } = await db
      .from('synaxarium_commemorations')
      .select(
        // Avoid columns that may not exist yet (summary_amharic, content_review_status).
        'id,day_id,day_slug,slug,title,title_amharic,summary,body_english,body_amharic,keywords,sort_order,status,image_path',
      )
      .eq('status', 'published')
      .order('sort_order')
      .range(from, from + pageSize - 1)
    if (error) throw error
    const rows = data ?? []
    out.push(...rows)
    if (rows.length < pageSize) break
  }
  return out
}

export async function loadSynaxariumSearchCatalog(force = false): Promise<SynaxariumSearchDoc[]> {
  const now = Date.now()
  if (!force && cache && now - cacheAt < TTL_MS) return cache

  const [days, commemorations] = await Promise.all([
    fetchAllPublishedDays(),
    fetchAllPublishedCommemorations(),
  ])
  const dayById = new Map(days.map((d) => [d.id, d]))
  const dayBySlug = new Map(days.map((d) => [d.slug.toLowerCase(), d]))

  const docs: SynaxariumSearchDoc[] = []

  for (const day of days) {
    const eth = `${day.ethiopian_month} ${day.ethiopian_day}`
    const ethAm = (day.display_date_amharic || '').trim()
    const engDate = (day.display_date_english || eth).trim()
    docs.push({
      id: `day:${day.id}`,
      kind: 'day',
      title: engDate,
      titleAmharic: ethAm,
      daySlug: day.slug,
      ethiopianLabel: eth,
      ethiopianLabelAm: ethAm,
      displayDateEnglish: engDate,
      monthNumber: day.ethiopian_month_number,
      dayNumber: day.ethiopian_day,
      excerpt: excerptFrom(day.summary),
      imagePath: day.image_path || null,
      blob: normalizeSearchText(
        [
          engDate,
          ethAm,
          eth,
          day.slug,
          day.summary,
          day.ethiopian_month,
          String(day.ethiopian_day),
          'synaxarium',
          'senkesar',
          'ስንክሳር',
        ]
          .filter(Boolean)
          .join(' '),
      ),
    })
  }

  for (const row of commemorations) {
    const day =
      dayById.get(row.day_id) ||
      (row.day_slug ? dayBySlug.get(row.day_slug.toLowerCase()) : undefined)
    if (!day?.slug) continue

    const keywords = parseKeywordsFromDb(row.keywords).join(' ')
    const eth = `${day.ethiopian_month} ${day.ethiopian_day}`
    const ethAm = (day.display_date_amharic || '').trim()
    const engDate = (day.display_date_english || eth).trim()
    const title = (row.title || '').trim()
    const titleAm = (row.title_amharic || '').trim()
    const excerpt = excerptFrom(row.summary, row.body_english, row.body_amharic)

    docs.push({
      id: `comm:${row.id}`,
      kind: 'commemoration',
      title: title || engDate,
      titleAmharic: titleAm,
      daySlug: day.slug,
      ethiopianLabel: eth,
      ethiopianLabelAm: ethAm,
      displayDateEnglish: engDate,
      monthNumber: day.ethiopian_month_number,
      dayNumber: day.ethiopian_day,
      excerpt,
      imagePath: row.image_path || day.image_path || null,
      blob: normalizeSearchText(
        [
          title,
          titleAm,
          row.summary,
          keywords,
          engDate,
          eth,
          ethAm,
          day.slug,
          day.ethiopian_month,
          String(day.ethiopian_day),
          'synaxarium',
          'senkesar',
          'ስንክሳር',
        ]
          .filter(Boolean)
          .join(' '),
      ),
    })
  }

  cache = docs
  cacheAt = now
  return docs
}

export function searchSynaxariumCatalog(
  docs: SynaxariumSearchDoc[],
  queryRaw: string,
  limit = 10,
): SiteSearchResult[] {
  let todayEth: { month: number; day: number } | null = null
  try {
    const eth = gregorianToEthiopian(new Date())
    todayEth = { month: eth.month, day: eth.day }
  } catch {
    todayEth = null
  }
  return searchSynaxariumCatalogCore(docs, queryRaw, limit, todayEth)
}
