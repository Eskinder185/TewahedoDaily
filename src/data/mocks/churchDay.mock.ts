import {
  ETHIOPIAN_MONTH_NAMES,
  formatEthiopianLong,
  gregorianToEthiopian,
  type EthiopianDateParts,
} from '../../lib/ethiopianDate'
import {
  formatGregorianLong,
  formatWeekdayLong,
} from '../../lib/churchCalendar/formatters'
import type { DailyChurchData, MovableObservanceOnDay } from '../types/churchDay'
import { toGregorianIsoDate } from '../utils/gregorianIso'
import calendarBundle from '../calendarEvents.json'
import liturgical from '../todayInChurch.json'
import { movableObservancesOnGregorianDay } from '../../lib/churchCalendar/movablePaschalObservances'
import {
  addDays,
  isInPaschalFiftyDays,
  resolvePaschaGregorianDate,
} from '../../lib/churchCalendar/pascha'
import { mergeEotcIntoDailyChurch } from '../../lib/eotcCalendar/mergeEotcIntoDailyChurch'
import { buildUpcomingObservancesFromEotc } from '../../lib/eotcCalendar/buildUpcomingObservancesFromEotc'
import { eotcDatasetRowToMovableObservanceOnDay } from '../../lib/eotcCalendar/eotcMovableObservanceFromRow'
import { mapEotcDatasetRowToObservanceTypes } from '../../lib/eotcCalendar/eotcObservanceUiMapping'
import { sortEotcEntriesForCalendarPanel } from '../../lib/eotcCalendar/eotcCalendarPanelOrdering'
import { getEntriesForDate } from '../../lib/eotcCalendar/eotcDateResolution'
import type { EotcCalendarDatasetRow } from '../../lib/eotcCalendar/eotcTypes'

type MockCommemorationKey = `${number}-${number}`

type CatalogEvent = {
  id: string
  title: string
  englishTitle?: string
  transliterationTitle: string
  type?: string
  shortDescription: string
  summary?: string
  meaning: string
  whyItMatters?: string
  howToObserve?: string
  prayAndChant?: string
  observance: string
  notes?: string
  fixedOrMovable?: string
}

const EVENT_BY_ID = new Map<string, CatalogEvent>(
  (calendarBundle.events as CatalogEvent[]).map((e) => [e.id, e]),
)

type CommemorationFileRow = {
  eventId?: string
  feast?: string
  saint?: string
  transliterationTitle?: string
  observanceType?: string[]
  summary?: string
  significance?: string
  practicalGuidance?: string
  shortDescription?: string
  meaning?: string
  observance?: string
  shortMeaning?: string
  longMeaning?: string
}

type SeasonFileRow = {
  id?: string
  title: string
  transliterationTitle?: string
  summary: string
  shortDescription?: string
  meaning?: string
  observance?: string
}

const COMMEMORATIONS = liturgical.commemorations as Partial<
  Record<MockCommemorationKey, CommemorationFileRow>
>

const SEASON_BY_ETH_MONTH: Record<number, SeasonFileRow> = {}
for (const [k, v] of Object.entries(liturgical.seasonByEthMonth)) {
  SEASON_BY_ETH_MONTH[Number(k)] = v as SeasonFileRow
}

function mergeCommemoration(
  row: CommemorationFileRow | undefined,
  base: CatalogEvent | undefined,
  eth: EthiopianDateParts,
): {
  feast: string
  saint: string
  transliterationTitle: string
  observanceType: string[]
  summary: string
  significance: string
  practicalGuidance: string
  prayAndChant?: string
  notes?: string
  shortDescription: string
  meaning: string
  observance: string
  longMeaning: string
  catalogEventId: string
} {
  const m = ETHIOPIAN_MONTH_NAMES[eth.month - 1] ?? 'This month'
  const fallback = EVENT_BY_ID.get('daily-senksar-commemoration')
  if (!fallback) {
    throw new Error('calendarEvents: missing daily-senksar-commemoration')
  }
  const cat = row?.eventId ? EVENT_BY_ID.get(row.eventId) : undefined
  const effective = cat ?? base ?? fallback

  let feast = row?.feast
  if (!feast) {
    const isGenericSenksar =
      !row && base?.id === 'daily-senksar-commemoration'
    feast = isGenericSenksar
      ? `Daily Senkessar remembrance — ${m} ${eth.day}`
      : effective.title
  }

  const saint = row?.saint ?? ''
  const transliterationTitle =
    row?.transliterationTitle ?? effective.transliterationTitle ?? ''
  const observanceType = row?.observanceType ?? ['saint-commemoration']
  
  // Use rich catalog data when available (e.g., for movable feasts like Thomas Sunday)
  const summary = row?.summary ?? effective.summary ?? `Commemoration on ${m} ${eth.day}`
  const significance = row?.significance ?? effective.whyItMatters ?? 'A day to remember the faithful who walked with God'
  const practicalGuidance = row?.practicalGuidance ?? effective.howToObserve ?? 'Pray for the saints, practice works of mercy'
  
  const shortDescription =
    row?.shortDescription?.trim() ||
    row?.shortMeaning?.trim() ||
    effective.shortDescription ||
    ''
  const meaning = row?.meaning ?? effective.meaning ?? ''
  const observance = row?.observance ?? effective.observance ?? ''
  const longMeaning =
    row?.longMeaning?.trim() ||
    effective.notes ||
    [shortDescription, meaning, observance].filter(Boolean).join(' ')

  return {
    feast,
    saint,
    transliterationTitle,
    observanceType,
    summary,
    significance,
    practicalGuidance,
    prayAndChant: effective.prayAndChant,
    notes: effective.notes,
    shortDescription,
    meaning,
    observance,
    longMeaning,
    catalogEventId: effective.id,
  }
}

function defaultCommemoration(eth: EthiopianDateParts) {
  const base = EVENT_BY_ID.get('daily-senksar-commemoration')
  return mergeCommemoration(undefined, base, eth)
}

function weeklyFast(d: Date, pascha: Date | null): string | null {
  if (pascha && isInPaschalFiftyDays(d, pascha)) return null
  const dow = d.getDay()
  if (dow === 5) return 'Friday — fast of the Cross (የመስቀል ወፍ)'
  if (dow === 3) return 'Wednesday — fast of the disciples (የሐዋርያት ወፍ)'
  return null
}

function seasonalFast(d: Date, ethMonth: number): string | null {
  const y = d.getFullYear()
  const pascha =
    resolvePaschaGregorianDate(y) ??
    resolvePaschaGregorianDate(y + 1) ??
    resolvePaschaGregorianDate(y - 1)
  if (pascha) {
    const lentStart = addDays(pascha, -55)
    if (d >= lentStart && d < pascha) {
      return 'Great Lent (Ābiy Tsom) — through eve of Fasika (movable with Pascha)'
    }
  } else if (ethMonth === 6) {
    return 'Great Lent (Ābiy Tsom) — verify start/end yearly'
  }
  if (ethMonth === 3) return 'Nativity fast window — confirm with parish books'
  return null
}

function combineFastChip(
  weekly: string | null,
  seasonal: string | null,
): string | null {
  if (weekly && seasonal) return `${weekly} · ${seasonal}`
  return weekly ?? seasonal ?? null
}

function resolveSeason(ethMonth: number): DailyChurchData['season'] {
  const row = SEASON_BY_ETH_MONTH[ethMonth]
  if (!row || !row.shortDescription) {
    return {
      title: 'Church year',
      summary: 'Walk with the rhythm of prayer and fasting',
      shortDescription:
        'Each Ethiopian month orders prayer and fasting in step with the synaxarium.',
      meaning:
        'Ordinary time still belongs to God; the Church forms the soul through steady liturgy.',
      observance:
        'Wednesday and Friday fasts when required, Sunday liturgy, and mercy to neighbor.',
    }
  }
  return {
    id: row.id,
    title: row.title,
    transliterationTitle: row.transliterationTitle,
    summary: row.summary,
    shortDescription: row.shortDescription ?? row.summary,
    meaning: row.meaning ?? '',
    observance: row.observance ?? '',
  }
}

function overlayCommemorationWithEotcPrimary(
  base: ReturnType<typeof mergeCommemoration>,
  primary: EotcCalendarDatasetRow,
): ReturnType<typeof mergeCommemoration> {
  const e = primary.entry
  const practices = e.observance.commonPractices.filter(Boolean)
  return {
    ...base,
    feast: e.englishTitle?.trim() || e.title,
    transliterationTitle: e.transliterationTitle ?? base.transliterationTitle,
    observanceType: mapEotcDatasetRowToObservanceTypes(primary) as any,
    summary: e.summary.panel?.trim() || e.summary.short || base.summary,
    significance: e.summary.whyItMatters || base.significance,
    practicalGuidance: practices.join(' · ') || base.practicalGuidance,
    shortDescription: e.summary.short || base.shortDescription,
    meaning: e.summary.whyItMatters || base.meaning,
    observance: practices.join(', ') || base.observance,
    longMeaning:
      [e.summary.panel, e.content.extended, ...e.content.notes]
        .filter(Boolean)
        .join('\n\n')
        .trim() || base.longMeaning,
    catalogEventId: e.id,
  }
}

/** Civil days in a Gregorian month that have at least one resolved EOTC row (no circular snapshot dependency). */
function markedGregorianDaysFromEotc(year: number, monthIndex: number): number[] {
  const dim = new Date(year, monthIndex + 1, 0).getDate()
  const days: number[] = []
  for (let day = 1; day <= dim; day++) {
    const dt = new Date(year, monthIndex, day)
    if (getEntriesForDate(dt).length > 0) days.push(day)
  }
  return days
}

/**
 * Mock “daily church” bundle. Later: `getLiveDailyChurchData(date)` returns the same shape from your API.
 */
export function getMockDailyChurchData(gregorian: Date): DailyChurchData {
  const d = new Date(
    gregorian.getFullYear(),
    gregorian.getMonth(),
    gregorian.getDate(),
  )
  const eth = gregorianToEthiopian(d)
  const y = d.getFullYear()
  const pascha =
    resolvePaschaGregorianDate(y) ??
    resolvePaschaGregorianDate(y + 1) ??
    resolvePaschaGregorianDate(y - 1)
  const key = `${eth.month}-${eth.day}` as MockCommemorationKey
  const row = COMMEMORATIONS[key]
  const rowCat = row?.eventId ? EVENT_BY_ID.get(row.eventId) : undefined
  const merged = row
    ? mergeCommemoration(row, rowCat, eth)
    : defaultCommemoration(eth)

  const season = resolveSeason(eth.month)
  const fastWeekly = weeklyFast(d, pascha)
  const fastSeasonal = seasonalFast(d, eth.month)

  const eotcSorted = sortEotcEntriesForCalendarPanel(getEntriesForDate(d))

  let enhancedCommemoration = merged
  let movableObservancesOnDay: MovableObservanceOnDay[] = []

  if (eotcSorted.length > 0) {
    enhancedCommemoration = overlayCommemorationWithEotcPrimary(merged, eotcSorted[0])
    movableObservancesOnDay = eotcSorted
      .slice(1)
      .map(eotcDatasetRowToMovableObservanceOnDay)
      .slice(0, 12)
  } else {
    movableObservancesOnDay = movableObservancesOnGregorianDay(
      d,
      d.getFullYear(),
      EVENT_BY_ID,
    )
    const majorMovableFeast = movableObservancesOnDay.find((m) =>
      ['damawi-tensae', 'fasika', 'hosanna', 'erget', 'peraklitos'].includes(m.id),
    )
    if (majorMovableFeast) {
      const majorEvent = EVENT_BY_ID.get(majorMovableFeast.id)
      if (majorEvent) {
        enhancedCommemoration = {
          ...merged,
          feast: majorEvent.title,
          transliterationTitle: majorEvent.transliterationTitle,
          summary: majorEvent.summary || merged.summary,
          significance: majorEvent.whyItMatters || merged.significance,
          practicalGuidance: majorEvent.howToObserve || merged.practicalGuidance,
          prayAndChant: majorEvent.prayAndChant || merged.prayAndChant,
          notes: majorEvent.notes || merged.notes,
          shortDescription: majorEvent.shortDescription,
          meaning: majorEvent.meaning,
          observance: majorEvent.observance,
          catalogEventId: majorEvent.id,
        }
      }
    }
  }

  return mergeEotcIntoDailyChurch({
    source: 'mock',
    gregorianDate: toGregorianIsoDate(d),
    gregorianLabel: formatGregorianLong(d),
    ethiopianDate: { year: eth.year, month: eth.month, day: eth.day },
    ethiopianLabel: formatEthiopianLong(eth),
    dayName: formatWeekdayLong(d),
    observanceType: enhancedCommemoration.observanceType as any,
    summary: enhancedCommemoration.summary,
    significance: enhancedCommemoration.significance,
    practicalGuidance: enhancedCommemoration.practicalGuidance,
    prayAndChant: enhancedCommemoration.prayAndChant,
    notes: enhancedCommemoration.notes,
    season,
    fast: combineFastChip(fastWeekly, fastSeasonal),
    fastWeekly,
    fastSeasonal,
    feast: enhancedCommemoration.feast,
    saint: enhancedCommemoration.saint,
    catalogEventId: enhancedCommemoration.catalogEventId,
    transliterationTitle: enhancedCommemoration.transliterationTitle,
    shortDescription: enhancedCommemoration.shortDescription,
    meaning: enhancedCommemoration.meaning,
    observance: enhancedCommemoration.observance,
    shortMeaning: undefined,
    longMeaning: enhancedCommemoration.longMeaning,
    movableObservancesOnDay,
    upcomingObservances: buildUpcomingObservancesFromEotc(d),
    miniCalendar: {
      year: d.getFullYear(),
      monthIndex: d.getMonth(),
      markedDays: markedGregorianDaysFromEotc(d.getFullYear(), d.getMonth()),
    },
  })
}
