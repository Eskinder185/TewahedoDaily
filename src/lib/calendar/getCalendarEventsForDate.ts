/**
 * Shared Calendar / Homepage event resolution for a civil date.
 * Structured day data is authoritative; calendar_cards supply images/overrides.
 */
import {
  getPublishedCalendarCardsForLinking,
  type CalendarCard,
} from '../synaxarium/synaxariumService'
import type { DayChurchContext } from '../../services/dayChurchContext'
import {
  presentEventsForDayContext,
  type PresentableCalendarEvent,
} from './calendarPresentation'
import {
  loadOrthodoxCalendarCatalog,
  resolveOrthodoxDay,
} from './orthodoxCalendarData'
import { gregorianToEthiopian, ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate'
import { addDays, toIsoLocalDate } from '../churchCalendar/pascha'
import type { ResolvedCalendarCard } from './resolveCalendarCard'

export type CalendarEventsForDateResult = {
  context: DayChurchContext
  events: PresentableCalendarEvent[]
  cards: CalendarCard[]
}

export type CalendarDayGroup = {
  date: Date
  iso: string
  /** Compact gregorian label, e.g. "OCT 1" */
  gregorianShort: string
  /** Accessible full gregorian date */
  gregorianAria: string
  /** Ethiopian month + day, e.g. "Meskerem 21" */
  ethiopianLabel: string
  events: PresentableCalendarEvent[]
}

let cardsCache: { at: number; cards: CalendarCard[] } | null = null
/** Short TTL so Admin presentation edits reach Calendar/Homepage without a long wait. */
const CARDS_TTL_MS = 30 * 1000

/** Clear in-memory calendar_cards cache (call after Admin mutations). */
export function invalidateCalendarCardsCache() {
  cardsCache = null
}

async function loadCardsCached(options?: { force?: boolean }): Promise<CalendarCard[]> {
  const now = Date.now()
  if (!options?.force && cardsCache && now - cardsCache.at < CARDS_TTL_MS) {
    return cardsCache.cards
  }
  try {
    // High limit: linking must see every published card, not a truncated page.
    const cards = await getPublishedCalendarCardsForLinking({ limit: 500 })
    cardsCache = { at: now, cards }
    return cards
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[getCalendarEventsForDate] cards', cause)
    return cardsCache?.cards || []
  }
}

/** Force-refresh published cards for public Calendar / Homepage. */
export async function refreshPublishedCalendarCards(): Promise<CalendarCard[]> {
  invalidateCalendarCardsCache()
  return loadCardsCached({ force: true })
}

function formatGregorianShort(d: Date): string {
  return d
    .toLocaleDateString('en-US', { month: 'short', day: 'numeric' })
    .toUpperCase()
}

function formatGregorianAria(d: Date): string {
  return d.toLocaleDateString('en-US', {
    weekday: 'long',
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  })
}

function ethiopianShortLabel(d: Date): string {
  const eth = gregorianToEthiopian(d)
  const monthName = ETHIOPIAN_MONTH_NAMES[eth.month - 1] || `Month ${eth.month}`
  return `${monthName} ${eth.day}`
}

function asResolvedCards(cards: CalendarCard[]): ResolvedCalendarCard[] {
  return cards as unknown as ResolvedCalendarCard[]
}

/**
 * Resolve all public Calendar Card events (observance / fast / monthly / season)
 * for a Gregorian local date, plus the full day church context (incl. Synaxarium).
 */
export async function getCalendarEventsForDate(
  date: Date,
  options?: { cards?: CalendarCard[] },
): Promise<CalendarEventsForDateResult> {
  // Dynamic import keeps Synaxarium/mezmur scoring off the Homepage critical path.
  const { loadDayChurchContext } = await import('../../services/dayChurchContext')
  const [context, cards] = await Promise.all([
    loadDayChurchContext(date),
    options?.cards ? Promise.resolve(options.cards) : loadCardsCached(),
  ])

  let events: PresentableCalendarEvent[] = []
  try {
    events = presentEventsForDayContext(context, asResolvedCards(cards), {
      occurrenceDate: date,
      surface: 'calendar',
    })
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[getCalendarEventsForDate] present', cause)
    events = []
  }

  return { context, events, cards }
}

/**
 * Lightweight Homepage / strip events for one civil day.
 * Uses orthodox catalog + calendar_cards only — no Synaxarium/mezmur fan-out.
 */
export async function getHomepageTodayEvents(
  date: Date,
  options?: { cards?: CalendarCard[] },
): Promise<PresentableCalendarEvent[]> {
  // Same occurrence engine + canonical card resolver as Calendar — never a separate card table walk.
  const start = new Date(date.getFullYear(), date.getMonth(), date.getDate())
  const [catalog, cards] = await Promise.all([
    loadOrthodoxCalendarCatalog(),
    options?.cards ? Promise.resolve(options.cards) : loadCardsCached(),
  ])
  const eth = gregorianToEthiopian(start)
  const monthName = ETHIOPIAN_MONTH_NAMES[eth.month - 1] || `Month ${eth.month}`
  const orthodox = resolveOrthodoxDay(start, catalog)
  try {
    return presentEventsForDayContext(
      {
        observances: orthodox.observances,
        monthlyCommemorations: orthodox.monthlyCommemorations,
        activeFast: orthodox.activeFast,
        season: orthodox.season,
        ethiopianDate: { monthName },
      },
      asResolvedCards(cards),
      { occurrenceDate: start, surface: 'homepage' },
    )
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[getHomepageTodayEvents] present', cause)
    return []
  }
}

export function eventsFromDayContext(
  context: DayChurchContext,
  cards: CalendarCard[] = [],
): PresentableCalendarEvent[] {
  try {
    return presentEventsForDayContext(context, asResolvedCards(cards))
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[eventsFromDayContext]', cause)
    return []
  }
}

/**
 * Efficient multi-day event resolution for the Calendar timeline.
 * Loads the orthodox catalog + cards once, then resolves each civil day locally
 * (no per-day Synaxarium / liturgy fetches).
 */
export async function getCalendarEventsForRange(
  startDate: Date,
  endDate: Date,
  options?: { cards?: CalendarCard[] },
): Promise<CalendarDayGroup[]> {
  const start = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate())
  const end = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate())
  if (end < start) return []

  const [catalog, cards] = await Promise.all([
    loadOrthodoxCalendarCatalog(),
    options?.cards ? Promise.resolve(options.cards) : loadCardsCached(),
  ])
  const resolvedCards = asResolvedCards(cards)

  const groups: CalendarDayGroup[] = []
  for (let cursor = start; cursor <= end; cursor = addDays(cursor, 1)) {
    const day = new Date(cursor.getFullYear(), cursor.getMonth(), cursor.getDate())
    const eth = gregorianToEthiopian(day)
    const monthName = ETHIOPIAN_MONTH_NAMES[eth.month - 1] || `Month ${eth.month}`
    const orthodox = resolveOrthodoxDay(day, catalog)

    let events: PresentableCalendarEvent[] = []
    try {
      events = presentEventsForDayContext(
        {
          observances: orthodox.observances,
          monthlyCommemorations: orthodox.monthlyCommemorations,
          activeFast: orthodox.activeFast,
          season: orthodox.season,
          ethiopianDate: { monthName },
        },
        resolvedCards,
        { occurrenceDate: day, surface: 'calendar' },
      )
    } catch (cause) {
      if (import.meta.env.DEV) console.error('[getCalendarEventsForRange] present', cause)
      events = []
    }

    groups.push({
      date: day,
      iso: toIsoLocalDate(day),
      gregorianShort: formatGregorianShort(day),
      gregorianAria: formatGregorianAria(day),
      ethiopianLabel: ethiopianShortLabel(day),
      events,
    })
  }

  return groups
}

/** De-emphasize identical season cards that repeat across many days in a window. */
export function filterRepeatedSeasonsForTimeline(
  groups: CalendarDayGroup[],
  selectedIso: string,
): CalendarDayGroup[] {
  const seasonCounts = new Map<string, number>()
  for (const group of groups) {
    for (const event of group.events) {
      if (event.kind !== 'season') continue
      seasonCounts.set(event.id, (seasonCounts.get(event.id) || 0) + 1)
    }
  }

  const repeated = new Set(
    [...seasonCounts.entries()].filter(([, count]) => count > 1).map(([id]) => id),
  )
  if (repeated.size === 0) return groups

  return groups.map((group) => {
    if (group.iso === selectedIso) return group
    return {
      ...group,
      events: group.events.filter(
        (event) => !(event.kind === 'season' && repeated.has(event.id)),
      ),
    }
  })
}
