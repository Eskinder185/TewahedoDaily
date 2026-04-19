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
import type { DailyChurchData, UpcomingObservanceEntry } from '../types/churchDay'
import { toGregorianIsoDate } from '../utils/gregorianIso'
import calendarBundle from '../calendarEvents.json'
import liturgical from '../todayInChurch.json'
import {
  buildPaschalUpcomingEntries,
  markedGregorianDaysForMonth,
  movableObservancesOnGregorianDay,
} from '../../lib/churchCalendar/movablePaschalObservances'
import { addDays, resolvePaschaGregorianDate } from '../../lib/churchCalendar/pascha'
import { parseGregorianAnchorIso } from '../../lib/churchCalendar/upcomingObservanceDisplay'

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

function weeklyFast(dow: number): string | null {
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

/** Observances whose civil anchors are derived from the Fasika table (not duplicated from static rows). */
const PASCHA_DRIVEN_IDS = new Set([
  'abiy-tsom',
  'hosanna',
  'semune-himamat',
  'siqlet',
  'fasika',
  'damawi-tensae',
  'erget',
  'peraklitos',
])

function upcomingFromCatalog(
  d: Date,
  _eth: EthiopianDateParts,
  eventById: Map<string, CatalogEvent>,
): UpcomingObservanceEntry[] {
  const toEntry = (
    id: string,
    kind: UpcomingObservanceEntry['kind'],
    dateEth: string,
    dateGreg?: string,
    gregorianAnchorIso?: string,
  ): UpcomingObservanceEntry | null => {
    const ev = eventById.get(id)
    if (!ev) return null
    return {
      id: ev.id,
      title: ev.title,
      transliterationTitle: ev.transliterationTitle,
      shortDescription: ev.shortDescription,
      meaning: ev.meaning,
      observance: ev.observance,
      kind,
      dateEthiopian: dateEth,
      dateGregorian: dateGreg,
      gregorianAnchorIso,
    }
  }
  const list: UpcomingObservanceEntry[] = []
  const push = (e: UpcomingObservanceEntry | null) => {
    if (e) list.push(e)
  }

  /** Illustrative civil anchors for UI navigation — confirm yearly with parish books. */
  const rows: Array<{
    id: string
    kind: UpcomingObservanceEntry['kind']
    dateEth: string
    dateGreg?: string
    iso?: string
  }> = [
    { id: 'gena', kind: 'feast', dateEth: 'Tahsas 29 (approx.)', dateGreg: 'Jan 7 — confirm', iso: '2026-01-07' },
    { id: 'timket', kind: 'feast', dateEth: 'Tir 11 (approx.)', dateGreg: 'Near Jan 19 — confirm', iso: '2026-01-19' },
    { id: 'nineveh-fast', kind: 'fast', dateEth: 'Yakatit (3 days; movable)', dateGreg: 'Before Great Lent', iso: '2026-02-02' },
    { id: 'debre-zeit', kind: 'feast', dateEth: 'Megabit (approx.)', dateGreg: 'Spring — confirm', iso: '2026-04-02' },
    { id: 'tsome-hawaryat', kind: 'fast', dateEth: 'Before apostles’ feast', dateGreg: 'Summer — confirm', iso: '2026-06-15' },
    { id: 'beale-selassie', kind: 'commemoration', dateEth: 'Monthly Trinity', dateGreg: 'Each month — confirm', iso: '2026-06-01' },
    { id: 'righteous-remembrance', kind: 'commemoration', dateEth: 'Senkessar cycle', dateGreg: 'Varies', iso: '2026-07-20' },
    { id: 'debre-tabor', kind: 'feast', dateEth: 'Nehasse 13 (approx.)', dateGreg: 'Aug — confirm', iso: '2026-08-19' },
    { id: 'filseta', kind: 'feast', dateEth: 'Nehasse 16 (approx.)', dateGreg: 'Late Aug — confirm', iso: '2026-08-22' },
    { id: 'meskel', kind: 'feast', dateEth: 'Meskerem 17', dateGreg: 'Sep 26 — confirm', iso: '2026-09-27' },
    { id: 'pagumen', kind: 'commemoration', dateEth: 'Pagumen days', dateGreg: 'Before Enkutatash — confirm', iso: '2026-09-10' },
    { id: 'enkutatash', kind: 'feast', dateEth: 'Meskerem 1', dateGreg: 'Sep 11 — confirm', iso: '2026-09-11' },
    { id: 'tsige', kind: 'feast', dateEth: 'Feast of the Cross (annual)', dateGreg: 'Sep — confirm', iso: '2026-09-14' },
    { id: 'tsome-nebiyat', kind: 'fast', dateEth: 'Hedar–Tahsas window', dateGreg: 'Before Gena — confirm', iso: '2026-11-25' },
    { id: 'nativity-fast', kind: 'fast', dateEth: 'Advent fast', dateGreg: 'Before Gena — confirm', iso: '2026-11-28' },
    { id: 'beale-michael', kind: 'commemoration', dateEth: 'Monthly Michael', dateGreg: 'Each month — confirm', iso: '2026-04-29' },
    { id: 'beale-gabriel', kind: 'commemoration', dateEth: 'Monthly Gabriel', dateGreg: 'Each month — confirm', iso: '2026-05-06' },
    { id: 'beale-maryam', kind: 'commemoration', dateEth: 'Monthly Marian feast', dateGreg: 'Each month — confirm', iso: '2026-04-21' },
    { id: 'lideta-maryam', kind: 'feast', dateEth: 'Tahsas 21', dateGreg: 'Dec 30 — confirm', iso: '2026-12-30' },
    { id: 'abune-teklehaymanot', kind: 'commemoration', dateEth: 'Senkessar date', dateGreg: 'Dec — confirm', iso: '2026-12-17' },
    {
      id: 'daily-senksar-commemoration',
      kind: 'commemoration',
      dateEth: 'Each day in synaxarium',
      dateGreg: 'Today’s saint — confirm',
      iso: '2026-04-18',
    },
  ]

  for (const r of rows) {
    if (PASCHA_DRIVEN_IDS.has(r.id)) continue
    push(toEntry(r.id, r.kind, r.dateEth, r.dateGreg, r.iso))
  }

  const y = d.getFullYear()
  const paschal = buildPaschalUpcomingEntries(y, eventById)
  const byId = new Map<string, UpcomingObservanceEntry>()
  for (const p of paschal) {
    byId.set(p.id, { ...p, scheduling: 'movable' })
  }
  for (const x of list) {
    if (!byId.has(x.id)) byId.set(x.id, { ...x, scheduling: 'fixed' })
  }

  const merged = [...byId.values()]
  merged.sort((a, b) => {
    const ta = a.gregorianAnchorIso
      ? parseGregorianAnchorIso(a.gregorianAnchorIso)?.getTime() ?? 0
      : 0
    const tb = b.gregorianAnchorIso
      ? parseGregorianAnchorIso(b.gregorianAnchorIso)?.getTime() ?? 0
      : 0
    if (ta !== tb) return ta - tb
    return a.title.localeCompare(b.title, undefined, { sensitivity: 'base' })
  })
  return merged
}

function markedGregorianDays(year: number, monthIndex: number): number[] {
  const key = `${year}-${monthIndex}`
  const presets: Record<string, number[]> = {
    '2026-3': [4, 11, 19, 29],
    '2026-4': [1, 9, 17, 25],
  }
  const base = presets[key] ?? [5, 12, 20, 27]
  const paschal = markedGregorianDaysForMonth(year, monthIndex, EVENT_BY_ID)
  return [...new Set([...base, ...paschal])].sort((a, b) => a - b)
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
  const key = `${eth.month}-${eth.day}` as MockCommemorationKey
  const row = COMMEMORATIONS[key]
  const rowCat = row?.eventId ? EVENT_BY_ID.get(row.eventId) : undefined
  const merged = row
    ? mergeCommemoration(row, rowCat, eth)
    : defaultCommemoration(eth)

  const season = resolveSeason(eth.month)
  const fastWeekly = weeklyFast(d.getDay())
  const fastSeasonal = seasonalFast(d, eth.month)
  const movableObservancesOnDay = movableObservancesOnGregorianDay(d, d.getFullYear(), EVENT_BY_ID)

  return {
    source: 'mock',
    gregorianDate: toGregorianIsoDate(d),
    gregorianLabel: formatGregorianLong(d),
    ethiopianDate: { year: eth.year, month: eth.month, day: eth.day },
    ethiopianLabel: formatEthiopianLong(eth),
    dayName: formatWeekdayLong(d),
    observanceType: merged.observanceType as any,
    summary: merged.summary,
    significance: merged.significance,
    practicalGuidance: merged.practicalGuidance,
    prayAndChant: merged.prayAndChant,
    notes: merged.notes,
    season,
    fast: combineFastChip(fastWeekly, fastSeasonal),
    fastWeekly,
    fastSeasonal,
    feast: merged.feast,
    saint: merged.saint,
    catalogEventId: merged.catalogEventId,
    transliterationTitle: merged.transliterationTitle,
    shortDescription: merged.shortDescription,
    meaning: merged.meaning,
    observance: merged.observance,
    shortMeaning: undefined,
    longMeaning: merged.longMeaning,
    movableObservancesOnDay,
    upcomingObservances: upcomingFromCatalog(d, eth, EVENT_BY_ID),
    miniCalendar: {
      year: d.getFullYear(),
      monthIndex: d.getMonth(),
      markedDays: markedGregorianDays(d.getFullYear(), d.getMonth()),
    },
  }
}
