import { supabase } from '../supabase/client'
import { gregorianToEthiopian } from '../ethiopianDate'
import {
  addDays,
  resolvePaschaGregorianDate,
  sameLocalCalendarDay,
} from '../churchCalendar/pascha'
import { normalizeStringList } from '../normalize/stringList'
import type {
  DayFast,
  DayMonthlyCommemoration,
  DayObservance,
  DaySeason,
  LiturgicalFastRow,
  LiturgicalSeasonRow,
  MonthlyCommemorationRow,
  OrthodoxObservanceRow,
} from './orthodoxCalendarTypes'

export type OrthodoxCalendarCatalog = {
  observances: OrthodoxObservanceRow[]
  fasts: LiturgicalFastRow[]
  seasons: LiturgicalSeasonRow[]
  monthly: MonthlyCommemorationRow[]
  loadedAt: number
}

export type ResolvedOrthodoxDay = {
  observances: DayObservance[]
  primaryObservance: DayObservance | null
  activeFast: DayFast | null
  season: DaySeason | null
  monthlyCommemorations: DayMonthlyCommemoration[]
  fastingStatus: {
    isFastDay: boolean
    label: string | null
  }
}

const WEEKDAY_NAMES = [
  'sunday',
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
] as const

let catalogPromise: Promise<OrthodoxCalendarCatalog> | null = null
let catalogCache: OrthodoxCalendarCatalog | null = null

function logSupabaseError(label: string, error: unknown) {
  if (!import.meta.env.DEV) return
  const err = error as {
    code?: string
    message?: string
    details?: string
    hint?: string
  } | null
  console.error(`[orthodoxCalendar] ${label}`, {
    code: err?.code,
    message: err?.message,
    details: err?.details,
    hint: err?.hint,
  })
}

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

function ethiopianOrdinal(month: number, day: number): number {
  return (month - 1) * 30 + day
}

function inEthiopianRange(
  month: number,
  day: number,
  startMonth: number,
  startDay: number,
  endMonth: number,
  endDay: number,
): boolean {
  const value = ethiopianOrdinal(month, day)
  const start = ethiopianOrdinal(startMonth, startDay)
  const end = ethiopianOrdinal(endMonth, endDay)
  if (start <= end) return value >= start && value <= end
  return value >= start || value <= end
}

function resolvePascha(day: Date): Date | null {
  const y = day.getFullYear()
  return (
    resolvePaschaGregorianDate(y) ??
    resolvePaschaGregorianDate(y - 1) ??
    resolvePaschaGregorianDate(y + 1)
  )
}

function mapObservance(row: OrthodoxObservanceRow): DayObservance {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    description: (row.description || '').trim(),
    observanceType: row.observance_type || 'observance',
    category: row.category || '',
    isMajor: Boolean(row.is_major),
    isMovable: Boolean(row.is_movable),
    occasionTag: row.occasion_tag,
    imagePath: row.image_path,
    imageAlt: row.image_alt || row.title,
  }
}

function mapFast(row: LiturgicalFastRow): DayFast {
  return {
    id: row.id,
    slug: row.slug,
    name: row.name,
    nameAmharic: row.name_amharic || '',
    description: (row.description || '').trim(),
    fastType: row.fast_type || 'fast',
    occasionTag: row.occasion_tag,
    priority: row.priority ?? 0,
  }
}

function mapSeason(row: LiturgicalSeasonRow): DaySeason {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    description: (row.description || '').trim(),
    seasonType: row.season_type || 'season',
    occasionTags: normalizeStringList(row.occasion_tags),
    priority: row.priority ?? 0,
  }
}

function mapMonthly(row: MonthlyCommemorationRow): DayMonthlyCommemoration {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic || '',
    category: row.category || '',
    ethiopianDay: row.ethiopian_day,
    description: (row.description || '').trim(),
    occasionTag: row.occasion_tag,
  }
}

function observanceMatchesDay(
  row: OrthodoxObservanceRow,
  ethMonth: number,
  ethDay: number,
  civil: Date,
  pascha: Date | null,
): boolean {
  if (row.is_movable) {
    if (row.pascha_offset_days == null || !pascha) return false
    return sameLocalCalendarDay(civil, addDays(pascha, row.pascha_offset_days))
  }
  return (
    row.ethiopian_month_number === ethMonth && row.ethiopian_day === ethDay
  )
}

function fastMatchesDay(
  row: LiturgicalFastRow,
  ethMonth: number,
  ethDay: number,
  civil: Date,
  pascha: Date | null,
): boolean {
  const type = (row.fast_type || '').toLowerCase()

  if (type === 'weekly_fast') {
    const days = normalizeStringList(row.weekly_days).map((d) => d.toLowerCase())
    const weekday = WEEKDAY_NAMES[civil.getDay()]
    if (!days.includes(weekday)) return false
    return true
  }

  if (row.is_movable) {
    if (row.pascha_start_offset == null || row.pascha_end_offset == null || !pascha) {
      return false
    }
    const start = addDays(pascha, row.pascha_start_offset)
    const end = addDays(pascha, row.pascha_end_offset)
    const t = civil.getTime()
    return t >= start.getTime() && t <= end.getTime()
  }

  if (
    row.ethiopian_month_number_start == null ||
    row.ethiopian_day_start == null ||
    row.ethiopian_month_number_end == null ||
    row.ethiopian_day_end == null
  ) {
    return false
  }

  return inEthiopianRange(
    ethMonth,
    ethDay,
    row.ethiopian_month_number_start,
    row.ethiopian_day_start,
    row.ethiopian_month_number_end,
    row.ethiopian_day_end,
  )
}

function seasonMatchesDay(
  row: LiturgicalSeasonRow,
  ethMonth: number,
  ethDay: number,
  civil: Date,
  pascha: Date | null,
): boolean {
  if (row.is_movable) {
    if (row.pascha_start_offset == null || row.pascha_end_offset == null || !pascha) {
      return false
    }
    const start = addDays(pascha, row.pascha_start_offset)
    const end = addDays(pascha, row.pascha_end_offset)
    const t = civil.getTime()
    return t >= start.getTime() && t <= end.getTime()
  }

  if (
    row.ethiopian_month_number_start == null ||
    row.ethiopian_day_start == null ||
    row.ethiopian_month_number_end == null ||
    row.ethiopian_day_end == null
  ) {
    return false
  }

  return inEthiopianRange(
    ethMonth,
    ethDay,
    row.ethiopian_month_number_start,
    row.ethiopian_day_start,
    row.ethiopian_month_number_end,
    row.ethiopian_day_end,
  )
}

async function fetchPublished<T>(table: string): Promise<T[]> {
  if (!supabase) return []
  try {
    const { data, error } = await supabase
      .from(table as never)
      .select('*')
      .eq('status' as never, 'published')
    if (error) {
      logSupabaseError(table, error)
      return []
    }
    return (data || []) as T[]
  } catch (cause) {
    logSupabaseError(table, cause)
    return []
  }
}

export async function loadOrthodoxCalendarCatalog(
  force = false,
): Promise<OrthodoxCalendarCatalog> {
  if (!force && catalogCache) return catalogCache
  if (!force && catalogPromise) return catalogPromise

  catalogPromise = (async () => {
    const [observances, fasts, seasons, monthly] = await Promise.all([
      fetchPublished<OrthodoxObservanceRow>('orthodox_observances'),
      fetchPublished<LiturgicalFastRow>('liturgical_fasts'),
      fetchPublished<LiturgicalSeasonRow>('liturgical_seasons'),
      fetchPublished<MonthlyCommemorationRow>('monthly_commemorations'),
    ])
    const next: OrthodoxCalendarCatalog = {
      observances,
      fasts,
      seasons,
      monthly,
      loadedAt: Date.now(),
    }
    catalogCache = next
    return next
  })()

  try {
    return await catalogPromise
  } finally {
    catalogPromise = null
  }
}

export function resolveOrthodoxDay(
  date: Date,
  catalog: OrthodoxCalendarCatalog,
): ResolvedOrthodoxDay {
  const civil = stripLocal(date)
  const eth = gregorianToEthiopian(civil)
  const pascha = resolvePascha(civil)

  const observances = catalog.observances
    .filter((row) =>
      observanceMatchesDay(row, eth.month, eth.day, civil, pascha),
    )
    .map(mapObservance)
    .sort((a, b) => {
      if (a.isMajor !== b.isMajor) return a.isMajor ? -1 : 1
      return a.title.localeCompare(b.title)
    })

  const primaryObservance =
    observances.find((o) => o.isMajor) || observances[0] || null

  const matchingFasts = catalog.fasts
    .filter((row) => fastMatchesDay(row, eth.month, eth.day, civil, pascha))
    .sort((a, b) => (b.priority ?? 0) - (a.priority ?? 0))

  const topFast = matchingFasts[0] || null
  let activeFast: DayFast | null = null
  let isFastDay = false
  let fastLabel: string | null = null

  if (topFast) {
    const type = (topFast.fast_type || '').toLowerCase()
    if (type === 'fast_free') {
      isFastDay = false
      fastLabel = null
    } else {
      activeFast = mapFast(topFast)
      isFastDay = true
      fastLabel = activeFast.name
    }
  }

  const seasonRow = catalog.seasons
    .filter((row) => seasonMatchesDay(row, eth.month, eth.day, civil, pascha))
    .sort((a, b) => (b.priority ?? 0) - (a.priority ?? 0))[0]

  const monthlyCommemorations = catalog.monthly
    .filter((row) => row.ethiopian_day === eth.day)
    .sort((a, b) => (a.sort_order ?? 0) - (b.sort_order ?? 0))
    .map(mapMonthly)

  return {
    observances,
    primaryObservance,
    activeFast,
    season: seasonRow ? mapSeason(seasonRow) : null,
    monthlyCommemorations,
    fastingStatus: {
      isFastDay,
      label: fastLabel,
    },
  }
}

export async function loadResolvedOrthodoxDay(date: Date): Promise<ResolvedOrthodoxDay> {
  const catalog = await loadOrthodoxCalendarCatalog()
  return resolveOrthodoxDay(date, catalog)
}
