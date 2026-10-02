/**
 * Load / search structured calendar sources for Calendar Card linking.
 */
import { supabase } from '../supabase/client'
import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'
import type {
  CalendarCardSourceType,
  LinkedCalendarSource,
} from './resolveCalendarCard'
import { isLinkedSourceType, normalizeSourceType } from './resolveCalendarCard'
import type {
  LiturgicalFastRow,
  LiturgicalSeasonRow,
  MonthlyCommemorationRow,
  OrthodoxObservanceRow,
} from './orthodoxCalendarTypes'

export type CalendarSourceSearchHit = {
  sourceType: CalendarCardSourceType
  id: string
  slug: string
  title: string
  titleAmharic: string
  meta: string
  description: string
  category: string
  cardType: string
}

function monthLabel(number: number): string {
  return ETHIOPIAN_MONTH_NAMES[number - 1] || `Month ${number}`
}

function logErr(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[calendarCardSources] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[calendarCardSources] ${context}`, error)
}

function tableForType(type: CalendarCardSourceType): string | null {
  switch (type) {
    case 'observance':
      return 'orthodox_observances'
    case 'fast':
      return 'liturgical_fasts'
    case 'season':
      return 'liturgical_seasons'
    case 'monthly_commemoration':
      return 'monthly_commemorations'
    case 'synaxarium_day':
      return 'synaxarium_days'
    case 'synaxarium_commemoration':
      return 'synaxarium_commemorations'
    default:
      return null
  }
}

function monthDayMeta(month?: number | null, day?: number | null): string {
  if (day && month) return `${monthLabel(month)} ${day}`
  if (day) return `Day ${day} (monthly)`
  return ''
}

function enrichedFromRow(row: {
  summary?: string | null
  summary_amharic?: string | null
  what_is_it?: string | null
  what_is_it_amharic?: string | null
  why_celebrated?: string | null
  why_celebrated_amharic?: string | null
  important_information?: string | null
  important_information_amharic?: string | null
  scripture_references?: string | null
  fasting_notes?: string | null
  fasting_notes_amharic?: string | null
  season_notes?: string | null
  season_notes_amharic?: string | null
  description?: string | null
  image_path?: string | null
  image_alt?: string | null
}): Pick<
  LinkedCalendarSource,
  | 'summary'
  | 'summaryAmharic'
  | 'whatIsIt'
  | 'whatIsItAmharic'
  | 'whyCelebrated'
  | 'whyCelebratedAmharic'
  | 'importantInformation'
  | 'importantInformationAmharic'
  | 'scriptureReferences'
  | 'fastingNotes'
  | 'fastingNotesAmharic'
  | 'seasonNotes'
  | 'seasonNotesAmharic'
  | 'imagePath'
  | 'imageAlt'
> {
  return {
    summary: (row.summary || '').trim(),
    summaryAmharic: (row.summary_amharic || '').trim(),
    whatIsIt: (row.what_is_it || '').trim(),
    whatIsItAmharic: (row.what_is_it_amharic || '').trim(),
    whyCelebrated: (row.why_celebrated || '').trim(),
    whyCelebratedAmharic: (row.why_celebrated_amharic || '').trim(),
    importantInformation: (row.important_information || '').trim(),
    importantInformationAmharic: (row.important_information_amharic || '').trim(),
    scriptureReferences: (row.scripture_references || '').trim(),
    fastingNotes: (row.fasting_notes || '').trim(),
    fastingNotesAmharic: (row.fasting_notes_amharic || '').trim(),
    seasonNotes: (row.season_notes || '').trim(),
    seasonNotesAmharic: (row.season_notes_amharic || '').trim(),
    imagePath: row.image_path || null,
    imageAlt: (row.image_alt || '').trim(),
  }
}

export function linkedSourceFromObservance(row: OrthodoxObservanceRow): LinkedCalendarSource {
  return {
    sourceType: 'observance',
    sourceId: row.id,
    sourceSlug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    category: row.category || row.observance_type || '',
    cardType: (row.observance_type || 'feast').toLowerCase(),
    description: (row.description || '').trim(),
    ethiopianMonthNumber: row.ethiopian_month_number,
    ethiopianDay: row.ethiopian_day,
    isMonthly: false,
    isMovable: Boolean(row.is_movable),
    paschaOffsetDays: row.pascha_offset_days,
    rangeLabel: row.is_movable
      ? 'Movable feast · Calculated from Pascha'
      : monthDayMeta(row.ethiopian_month_number, row.ethiopian_day),
    ...enrichedFromRow(row),
    fastingNotes: (row.fasting_notes || '').trim(),
    seasonNotes: (row.season_notes || '').trim(),
    synaxariumDayId: null,
    synaxariumDaySlug: null,
  }
}

export function linkedSourceFromFast(row: LiturgicalFastRow): LinkedCalendarSource {
  const movable = Boolean(row.is_movable)
  const enriched = enrichedFromRow(row)
  return {
    sourceType: 'fast',
    sourceId: row.id,
    sourceSlug: row.slug,
    title: row.name,
    titleAmharic: row.name_amharic || '',
    category: 'Fast',
    cardType: 'fast',
    description: (row.description || '').trim(),
    ethiopianMonthNumber: row.ethiopian_month_number_start,
    ethiopianDay: row.ethiopian_day_start,
    isMonthly: false,
    isMovable: movable,
    paschaOffsetDays: movable ? row.pascha_start_offset : null,
    rangeLabel: movable
      ? 'Movable fast · Calculated from Pascha'
      : `${monthDayMeta(row.ethiopian_month_number_start, row.ethiopian_day_start)} – ${monthDayMeta(row.ethiopian_month_number_end, row.ethiopian_day_end)}`,
    ...enriched,
    fastingNotes: enriched.fastingNotes || (row.description || '').trim(),
    synaxariumDayId: null,
    synaxariumDaySlug: null,
  }
}

export function linkedSourceFromSeason(row: LiturgicalSeasonRow): LinkedCalendarSource {
  const movable = Boolean(row.is_movable)
  const enriched = enrichedFromRow(row)
  return {
    sourceType: 'season',
    sourceId: row.id,
    sourceSlug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    category: row.season_type || 'Season',
    cardType: 'other',
    description: (row.description || '').trim(),
    ethiopianMonthNumber: row.ethiopian_month_number_start,
    ethiopianDay: row.ethiopian_day_start,
    isMonthly: false,
    isMovable: movable,
    paschaOffsetDays: movable ? row.pascha_start_offset : null,
    rangeLabel: movable
      ? 'Movable season · Calculated from Pascha'
      : `${monthDayMeta(row.ethiopian_month_number_start, row.ethiopian_day_start)} – ${monthDayMeta(row.ethiopian_month_number_end, row.ethiopian_day_end)}`,
    ...enriched,
    seasonNotes: enriched.seasonNotes || (row.description || '').trim(),
    synaxariumDayId: null,
    synaxariumDaySlug: null,
  }
}

export function linkedSourceFromMonthly(row: MonthlyCommemorationRow): LinkedCalendarSource {
  return {
    sourceType: 'monthly_commemoration',
    sourceId: row.id,
    sourceSlug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    category: row.category || '',
    cardType: (row.category || 'saint').toLowerCase(),
    description: (row.description || '').trim(),
    ethiopianMonthNumber: null,
    ethiopianDay: row.ethiopian_day,
    isMonthly: true,
    isMovable: false,
    paschaOffsetDays: null,
    rangeLabel: `Day ${row.ethiopian_day} each month`,
    ...enrichedFromRow(row),
    synaxariumDayId: null,
    synaxariumDaySlug: null,
  }
}

type SynaxDay = {
  id: string
  slug: string
  ethiopian_month_number: number
  ethiopian_day: number
  summary?: string | null
  display_date_english?: string | null
}

type SynaxComm = {
  id: string
  slug: string
  day_id: string | null
  day_slug: string | null
  title: string
  title_amharic: string | null
  summary: string | null
  body_english: string | null
  commemoration_type: string | null
}

export function linkedSourceFromSynaxDay(row: SynaxDay): LinkedCalendarSource {
  return {
    sourceType: 'synaxarium_day',
    sourceId: row.id,
    sourceSlug: row.slug,
    title: row.display_date_english || row.slug,
    titleAmharic: '',
    category: 'Synaxarium',
    cardType: 'other',
    description: (row.summary || '').trim(),
    ethiopianMonthNumber: row.ethiopian_month_number,
    ethiopianDay: row.ethiopian_day,
    isMonthly: false,
    isMovable: false,
    paschaOffsetDays: null,
    rangeLabel: monthDayMeta(row.ethiopian_month_number, row.ethiopian_day),
    fastingNotes: '',
    seasonNotes: '',
    summary: (row.summary || '').trim(),
    summaryAmharic: '',
    whatIsIt: '',
    whatIsItAmharic: '',
    whyCelebrated: '',
    whyCelebratedAmharic: '',
    importantInformation: '',
    importantInformationAmharic: '',
    scriptureReferences: '',
    fastingNotesAmharic: '',
    seasonNotesAmharic: '',
    imagePath: null,
    imageAlt: '',
    synaxariumDayId: row.id,
    synaxariumDaySlug: row.slug,
  }
}

export function linkedSourceFromSynaxComm(
  row: SynaxComm,
  day?: SynaxDay | null,
): LinkedCalendarSource {
  return {
    sourceType: 'synaxarium_commemoration',
    sourceId: row.id,
    sourceSlug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    category: row.commemoration_type || 'Synaxarium',
    cardType: (row.commemoration_type || 'saint').toLowerCase(),
    description: (row.summary || row.body_english || '').trim(),
    ethiopianMonthNumber: day?.ethiopian_month_number ?? null,
    ethiopianDay: day?.ethiopian_day ?? null,
    isMonthly: false,
    isMovable: false,
    paschaOffsetDays: null,
    rangeLabel: day
      ? monthDayMeta(day.ethiopian_month_number, day.ethiopian_day)
      : row.day_slug || '',
    fastingNotes: '',
    seasonNotes: '',
    summary: (row.summary || '').trim(),
    summaryAmharic: '',
    whatIsIt: '',
    whatIsItAmharic: '',
    whyCelebrated: '',
    whyCelebratedAmharic: '',
    importantInformation: '',
    importantInformationAmharic: '',
    scriptureReferences: '',
    fastingNotesAmharic: '',
    seasonNotesAmharic: '',
    imagePath: null,
    imageAlt: '',
    synaxariumDayId: day?.id || row.day_id,
    synaxariumDaySlug: day?.slug || row.day_slug,
  }
}

export async function fetchLinkedSource(
  sourceType: string | null | undefined,
  sourceId?: string | null,
  sourceSlug?: string | null,
): Promise<LinkedCalendarSource | null> {
  const type = normalizeSourceType(sourceType)
  if (!isLinkedSourceType(type)) return null
  const table = tableForType(type)
  if (!table || !supabase) return null
  if (!sourceId && !sourceSlug) return null

  try {
    if (sourceId) {
      const { data, error } = await supabase
        .from(table as never)
        .select('*')
        .eq('id', sourceId)
        .limit(1)
        .maybeSingle()
      if (error) logErr(`fetch ${type} by id`, error)
      else if (data) return mapRowToLinked(type, data as Record<string, unknown>)
    }

    if (sourceSlug) {
      const { data, error } = await supabase
        .from(table as never)
        .select('*')
        .eq('slug', sourceSlug)
        .limit(1)
        .maybeSingle()
      if (error) {
        logErr(`fetch ${type} by slug`, error)
        return null
      }
      if (!data) return null
      return mapRowToLinked(type, data as Record<string, unknown>)
    }

    return null
  } catch (cause) {
    logErr(`fetch ${type}`, cause)
    return null
  }
}

async function mapRowToLinked(
  type: CalendarCardSourceType,
  data: Record<string, unknown>,
): Promise<LinkedCalendarSource | null> {
  switch (type) {
    case 'observance':
      return linkedSourceFromObservance(data as unknown as OrthodoxObservanceRow)
    case 'fast':
      return linkedSourceFromFast(data as unknown as LiturgicalFastRow)
    case 'season':
      return linkedSourceFromSeason(data as unknown as LiturgicalSeasonRow)
    case 'monthly_commemoration':
      return linkedSourceFromMonthly(data as unknown as MonthlyCommemorationRow)
    case 'synaxarium_day':
      return linkedSourceFromSynaxDay(data as unknown as SynaxDay)
    case 'synaxarium_commemoration': {
      const row = data as unknown as SynaxComm
      let day: SynaxDay | null = null
      if (row.day_id && supabase) {
        const { data: dayRow } = await supabase
          .from('synaxarium_days' as never)
          .select('id,slug,ethiopian_month_number,ethiopian_day,summary,display_date_english')
          .eq('id', row.day_id)
          .maybeSingle()
        day = (dayRow as SynaxDay | null) || null
      }
      return linkedSourceFromSynaxComm(row, day)
    }
    default:
      return null
  }
}

/** Batch-load linked sources for a set of calendar card rows. */
export async function loadLinkedSourcesForCards(
  rows: Array<{ source_type?: string | null; source_id?: string | null; source_slug?: string | null }>,
): Promise<Map<string, LinkedCalendarSource>> {
  const map = new Map<string, LinkedCalendarSource>()
  const needed = rows.filter(
    (row) =>
      isLinkedSourceType(normalizeSourceType(row.source_type)) &&
      (row.source_id || row.source_slug),
  )
  if (!needed.length || !supabase) return map

  const byType = new Map<CalendarCardSourceType, { ids: string[]; slugs: string[] }>()
  for (const row of needed) {
    const type = normalizeSourceType(row.source_type)
    if (!isLinkedSourceType(type)) continue
    const bucket = byType.get(type) || { ids: [], slugs: [] }
    if (row.source_id) bucket.ids.push(row.source_id)
    if (row.source_slug) bucket.slugs.push(row.source_slug)
    byType.set(type, bucket)
  }

  await Promise.all(
    [...byType.entries()].map(async ([type, { ids, slugs }]) => {
      const table = tableForType(type)
      if (!table) return
      const uniqueIds = [...new Set(ids)]
      const uniqueSlugs = [...new Set(slugs)]

      const fetchBy = async (column: 'id' | 'slug', values: string[]) => {
        if (!values.length) return []
        const { data, error } = await supabase!
          .from(table as never)
          .select('*')
          .in(column, values)
        if (error) {
          logErr(`batch ${type} by ${column}`, error)
          return []
        }
        return (data || []) as Record<string, unknown>[]
      }

      const [byId, bySlug] = await Promise.all([
        fetchBy('id', uniqueIds),
        fetchBy('slug', uniqueSlugs),
      ])

      for (const row of [...byId, ...bySlug]) {
        const linked = await mapRowToLinked(type, row)
        if (!linked) continue
        map.set(`${type}:id:${linked.sourceId}`, linked)
        if (linked.sourceSlug) map.set(`${type}:slug:${linked.sourceSlug}`, linked)
      }
    }),
  )

  return map
}

export function lookupLinkedInMap(
  map: Map<string, LinkedCalendarSource>,
  sourceType?: string | null,
  sourceId?: string | null,
  sourceSlug?: string | null,
): LinkedCalendarSource | null {
  const type = normalizeSourceType(sourceType)
  if (!isLinkedSourceType(type)) return null
  if (sourceId && map.has(`${type}:id:${sourceId}`)) return map.get(`${type}:id:${sourceId}`) || null
  if (sourceSlug && map.has(`${type}:slug:${sourceSlug}`)) {
    return map.get(`${type}:slug:${sourceSlug}`) || null
  }
  return null
}

/** Admin searchable source picker. */
export async function searchCalendarSources(
  sourceType: CalendarCardSourceType,
  query: string,
  limit = 20,
): Promise<CalendarSourceSearchHit[]> {
  if (!isLinkedSourceType(sourceType) || !supabase) return []
  const table = tableForType(sourceType)
  if (!table) return []
  const q = query.trim().replace(/[%_,]/g, ' ').slice(0, 80)

  try {
    let request = supabase.from(table as never).select('*').limit(limit)
    if (sourceType !== 'synaxarium_day') {
      request = request.eq('status' as never, 'published')
    }
    if (q) {
      if (sourceType === 'fast') {
        request = request.or(`name.ilike.%${q}%,name_amharic.ilike.%${q}%,slug.ilike.%${q}%`)
      } else if (sourceType === 'synaxarium_day') {
        request = request.or(
          `slug.ilike.%${q}%,summary.ilike.%${q}%,display_date_english.ilike.%${q}%`,
        )
      } else {
        request = request.or(
          `title.ilike.%${q}%,title_amharic.ilike.%${q}%,slug.ilike.%${q}%`,
        )
      }
    }
    const { data, error } = await request
    if (error) {
      logErr('search', error)
      return []
    }

    const hits: CalendarSourceSearchHit[] = []
    for (const raw of (data || []) as Record<string, unknown>[]) {
      const linked = await mapRowToLinked(sourceType, raw)
      if (!linked) continue
      hits.push({
        sourceType,
        id: linked.sourceId,
        slug: linked.sourceSlug,
        title: linked.title,
        titleAmharic: linked.titleAmharic,
        meta: [sourceTypeBadgeLabel(sourceType), linked.rangeLabel, linked.category]
          .filter(Boolean)
          .join(' · '),
        description: linked.description.slice(0, 180),
        category: linked.category,
        cardType: linked.cardType,
      })
    }
    return hits
  } catch (cause) {
    logErr('search', cause)
    return []
  }
}

function sourceTypeBadgeLabel(type: CalendarCardSourceType): string {
  switch (type) {
    case 'observance':
      return 'Observance'
    case 'fast':
      return 'Fast'
    case 'season':
      return 'Season'
    case 'monthly_commemoration':
      return 'Monthly'
    case 'synaxarium_day':
      return 'Synaxarium day'
    case 'synaxarium_commemoration':
      return 'Synaxarium'
    default:
      return 'Manual'
  }
}

export async function validateCalendarCardSource(
  sourceType: string | null | undefined,
  sourceId?: string | null,
  sourceSlug?: string | null,
): Promise<{ ok: boolean; message?: string; linked?: LinkedCalendarSource }> {
  const type = normalizeSourceType(sourceType)
  if (!isLinkedSourceType(type)) return { ok: true }
  if (!sourceId && !sourceSlug) {
    return { ok: false, message: 'Choose a source record or switch to Manual card.' }
  }
  const linked = await fetchLinkedSource(type, sourceId, sourceSlug)
  if (!linked) {
    return {
      ok: false,
      message: `Linked ${type} was not found. Check source_id / source_slug.`,
    }
  }
  return { ok: true, linked }
}
