import {
  formatEthiopianLong,
  gregorianToEthiopian,
  type EthiopianDateParts,
} from '../lib/ethiopianDate'
import {
  loadOrthodoxCalendarCatalog,
  resolveOrthodoxDay,
  type ResolvedOrthodoxDay,
} from '../lib/calendar/orthodoxCalendarData'
import { loadPrayerCollection } from '../lib/prayers/prayerSupabase'
import { prayerCollectionPath, prayerDetailPath } from '../lib/prayers/prayerSlug'
import {
  DAILY_COLLECTION_SLUGS,
  formatPsalmRangeLabel,
  localCalendarDate,
  localDateKey,
  mezmureDawitRangePath,
  PSALM_RANGE_BY_WEEKDAY,
  WEEKDAY_LABELS,
  WUDASE_FALLBACK_TITLE_AMHARIC,
  WUDASE_WEEKDAY_SECTION_SLUG,
  WUDASE_WEEKDAY_SLUG,
  weekdayIndexFromDate,
  type PsalmRange,
  type WeekdayIndex,
} from '../lib/prayers/dailyPrayerRhythmSchedule'

export type DailyPrayerCard = {
  id: 'zewter' | 'wudase' | 'psalms'
  title: string
  label: string
  subtitle: string
  to: string
}

export type DailyPrayerContextChip = {
  kind: 'feast' | 'fast' | 'season' | 'commemoration'
  label: string
  title: string
  titleAmharic?: string
}

export type DailyPrayerRhythm = {
  dateKey: string
  date: Date
  weekday: string
  weekdayAmharic: string
  weekdayIndex: WeekdayIndex
  ethiopianDate: EthiopianDateParts
  ethiopianDateLabel: string
  zewter: DailyPrayerCard
  wudase: DailyPrayerCard
  psalms: DailyPrayerCard
  /** Ordered cards for rendering */
  items: DailyPrayerCard[]
  psalmRange: PsalmRange | null
  context: DailyPrayerContextChip[]
  observanceContext: ResolvedOrthodoxDay | null
}

type BundleCacheEntry = {
  at: number
  value: Awaited<ReturnType<typeof loadPrayerCollection>>
}

const BUNDLE_TTL_MS = 5 * 60 * 1000
const bundleCache = new Map<string, BundleCacheEntry>()

async function loadCollectionCached(slug: string) {
  const hit = bundleCache.get(slug)
  if (hit && Date.now() - hit.at < BUNDLE_TTL_MS) return hit.value
  try {
    const value = await loadPrayerCollection(slug)
    bundleCache.set(slug, { at: Date.now(), value })
    return value
  } catch (cause) {
    if (import.meta.env.DEV) console.warn(`[dailyPrayerRhythm] collection ${slug}`, cause)
    return hit?.value ?? null
  }
}

async function resolveWudaseCard(day: WeekdayIndex): Promise<DailyPrayerCard> {
  const prayerSlug = WUDASE_WEEKDAY_SLUG[day]
  const sectionSlug = WUDASE_WEEKDAY_SECTION_SLUG[day]
  const fallbackLabel = WUDASE_FALLBACK_TITLE_AMHARIC[day]
  const fallbackTo = prayerDetailPath(prayerSlug, DAILY_COLLECTION_SLUGS.wudase)

  try {
    const bundle = await loadCollectionCached(DAILY_COLLECTION_SLUGS.wudase)
    if (!bundle) {
      return {
        id: 'wudase',
        title: 'Wudase Mariam',
        label: fallbackLabel,
        subtitle: 'The weekday praise of Saint Mary',
        to: fallbackTo,
      }
    }

    const prayer =
      bundle.prayers.find((item) => item.slug === prayerSlug) ||
      bundle.prayers.find((item) => item.slug === sectionSlug) ||
      bundle.prayers.find((item) => item.slug.endsWith(`-${sectionSlug}`)) ||
      bundle.sections.find((section) => section.slug === sectionSlug)?.prayers[0]
    const section = bundle.sections.find((item) => item.slug === sectionSlug)

    const label =
      prayer?.titles?.amharic?.trim() ||
      section?.titleAmharic?.trim() ||
      prayer?.title?.trim() ||
      section?.title?.trim() ||
      fallbackLabel

    const slug = prayer?.slug || prayerSlug

    return {
      id: 'wudase',
      title: 'Wudase Mariam',
      label,
      subtitle: 'The weekday praise of Saint Mary',
      to: prayerDetailPath(slug, DAILY_COLLECTION_SLUGS.wudase),
    }
  } catch (cause) {
    if (import.meta.env.DEV) console.warn('[dailyPrayerRhythm] wudase', cause)
    return {
      id: 'wudase',
      title: 'Wudase Mariam',
      label: fallbackLabel,
      subtitle: 'The weekday praise of Saint Mary',
      to: fallbackTo,
    }
  }
}

function buildPsalmCard(day: WeekdayIndex): DailyPrayerCard {
  const range = PSALM_RANGE_BY_WEEKDAY[day]
  try {
    return {
      id: 'psalms',
      title: 'Mezmure Dawit',
      label: formatPsalmRangeLabel(range, 'am'),
      subtitle: range ? "Today's psalm reading" : 'Rest from the weekly psalm range',
      to: mezmureDawitRangePath(range),
    }
  } catch (cause) {
    if (import.meta.env.DEV) console.warn('[dailyPrayerRhythm] psalms', cause)
    return {
      id: 'psalms',
      title: 'Mezmure Dawit',
      label: 'Open Mezmure Dawit',
      subtitle: "Today's psalm reading",
      to: prayerCollectionPath(DAILY_COLLECTION_SLUGS.mezmureDawit),
    }
  }
}

function buildZewterCard(): DailyPrayerCard {
  return {
    id: 'zewter',
    title: 'Zewter Tselot',
    label: 'Daily Orthodox prayer',
    subtitle: 'Begin with the regular prayer path',
    to: prayerCollectionPath(DAILY_COLLECTION_SLUGS.zewter),
  }
}

function contextFromDay(resolved: ResolvedOrthodoxDay): DailyPrayerContextChip[] {
  const chips: DailyPrayerContextChip[] = []

  if (resolved.primaryObservance) {
    chips.push({
      kind: 'feast',
      label: 'Feast',
      title: resolved.primaryObservance.title,
      titleAmharic: resolved.primaryObservance.titleAmharic || undefined,
    })
  }

  if (resolved.activeFast && resolved.fastingStatus.isFastDay) {
    chips.push({
      kind: 'fast',
      label: 'Fast',
      title: resolved.activeFast.name,
      titleAmharic: resolved.activeFast.nameAmharic || undefined,
    })
  }

  if (resolved.season) {
    chips.push({
      kind: 'season',
      label: 'Season',
      title: resolved.season.title,
      titleAmharic: resolved.season.titleAmharic || undefined,
    })
  }

  const monthly = resolved.monthlyCommemorations[0]
  if (monthly && (!resolved.primaryObservance || monthly.slug !== resolved.primaryObservance.slug)) {
    chips.push({
      kind: 'commemoration',
      label: 'Commemoration',
      title: monthly.title,
      titleAmharic: monthly.titleAmharic || undefined,
    })
  }

  return chips
}

async function resolveObservanceContext(date: Date): Promise<{
  resolved: ResolvedOrthodoxDay | null
  context: DailyPrayerContextChip[]
}> {
  try {
    const catalog = await loadOrthodoxCalendarCatalog()
    const resolved = resolveOrthodoxDay(date, catalog)
    return { resolved, context: contextFromDay(resolved) }
  } catch (cause) {
    if (import.meta.env.DEV) console.warn('[dailyPrayerRhythm] calendar', cause)
    return { resolved: null, context: [] }
  }
}

/**
 * Build today's prayer rhythm for a local calendar date.
 * Pass an explicit Date in tests; production uses the current local day.
 */
export async function getDailyPrayerRhythm(dateInput = new Date()): Promise<DailyPrayerRhythm> {
  const date = localCalendarDate(dateInput)
  const weekdayIndex = weekdayIndexFromDate(date)
  const weekday = WEEKDAY_LABELS[weekdayIndex]
  const eth = gregorianToEthiopian(date)

  const [wudase, calendar] = await Promise.all([
    resolveWudaseCard(weekdayIndex),
    resolveObservanceContext(date),
  ])

  const zewter = buildZewterCard()
  const psalms = buildPsalmCard(weekdayIndex)
  const items = [zewter, wudase, psalms]

  return {
    dateKey: localDateKey(date),
    date,
    weekday: weekday.english,
    weekdayAmharic: weekday.amharic,
    weekdayIndex,
    ethiopianDate: eth,
    ethiopianDateLabel: formatEthiopianLong(eth),
    zewter,
    wudase,
    psalms,
    items,
    psalmRange: PSALM_RANGE_BY_WEEKDAY[weekdayIndex],
    context: calendar.context,
    observanceContext: calendar.resolved,
  }
}

/** Sync schedule resolution for tests (no network). */
export function getDailyPrayerRhythmSchedule(dateInput = new Date()) {
  const date = localCalendarDate(dateInput)
  const weekdayIndex = weekdayIndexFromDate(date)
  const weekday = WEEKDAY_LABELS[weekdayIndex]
  const range = PSALM_RANGE_BY_WEEKDAY[weekdayIndex]
  const wudaseSlug = WUDASE_WEEKDAY_SLUG[weekdayIndex]

  return {
    dateKey: localDateKey(date),
    weekday: weekday.english,
    weekdayAmharic: weekday.amharic,
    weekdayIndex,
    wudaseSlug,
    wudasePath: prayerDetailPath(wudaseSlug, DAILY_COLLECTION_SLUGS.wudase),
    zewterPath: prayerCollectionPath(DAILY_COLLECTION_SLUGS.zewter),
    psalmRange: range,
    psalmsPath: mezmureDawitRangePath(range),
    psalmLabel: formatPsalmRangeLabel(range, 'am'),
  }
}
