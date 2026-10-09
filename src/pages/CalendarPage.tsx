import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { MiniMonthCalendar } from '../components/todayInChurch/MiniMonthCalendar'
import { CalendarDateTimeline } from '../components/calendar/CalendarDateTimeline'
import { CalendarEventDetail } from '../components/calendar/CalendarEventDetail'
import { SynaxariumOfTheDay } from '../components/calendar/SynaxariumOfTheDay'
import { useHomeToday } from '../hooks/useHomeToday'
import {
  computeCalendarDayMarksAsync,
  type CalendarDayCellMark,
} from '../lib/churchCalendar'
import { getPublishedCalendarCardsForLinking, type CalendarCard } from '../lib/synaxarium/synaxariumService'
import { parseGregorianAnchorIso } from '../lib/churchCalendar/upcomingObservanceDisplay'
import {
  getCalendarEventsForRange,
  invalidateCalendarCardsCache,
  refreshPublishedCalendarCards,
  type CalendarDayGroup,
} from '../lib/calendar/getCalendarEventsForDate'
import type { PresentableCalendarEvent } from '../lib/calendar/calendarPresentation'
import { addDays, toIsoLocalDate } from '../lib/churchCalendar/pascha'
import { useLocale } from '../lib/i18n/locale'
import { useTranslation } from '../i18n'
import styles from './CalendarPage.module.css'

/** Type-only — runtime load is dynamic so mezmur scoring stays off the Calendar shell. */
type DayChurchContext = import('../services/dayChurchContext').DayChurchContext

async function loadDayChurchContext(date: Date): Promise<DayChurchContext> {
  const mod = await import('../services/dayChurchContext')
  return mod.loadDayChurchContext(date)
}

const PAST_DAYS = 7
const FUTURE_DAYS = 14
const EXTEND_DAYS = 10

function formatLongDate(d: Date): string {
  return d.toLocaleDateString('en-US', {
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  })
}

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

export function CalendarPage() {
  const { now, snapshot } = useHomeToday()
  const { contentLocale } = useLocale()
  const t = useTranslation()
  const [searchParams] = useSearchParams()
  const [viewYear, setViewYear] = useState(now.getFullYear())
  const [viewMonth, setViewMonth] = useState(now.getMonth())
  const [selectedDay, setSelectedDay] = useState<number>(now.getDate())
  const [marks, setMarks] = useState<ReadonlyMap<number, CalendarDayCellMark>>(new Map())
  const [dayContext, setDayContext] = useState<DayChurchContext | null>(null)
  const [todayContext, setTodayContext] = useState<DayChurchContext | null>(null)
  const [dayLoading, setDayLoading] = useState(false)
  const [dayError, setDayError] = useState<string | null>(null)
  const [dayReloadTick, setDayReloadTick] = useState(0)
  const [calendarCards, setCalendarCards] = useState<CalendarCard[]>([])
  const [detailEvent, setDetailEvent] = useState<PresentableCalendarEvent | null>(null)
  const [timelineGroups, setTimelineGroups] = useState<CalendarDayGroup[]>([])
  const [timelineLoading, setTimelineLoading] = useState(true)
  const [rangeStart, setRangeStart] = useState(() => addDays(stripLocal(now), -PAST_DAYS))
  const [rangeEnd, setRangeEnd] = useState(() => addDays(stripLocal(now), FUTURE_DAYS))
  const monthRef = useRef<HTMLElement | null>(null)
  const dayContextCacheRef = useRef<Map<string, DayChurchContext>>(new Map())
  const dayRequestIdRef = useRef(0)
  const dateParamApplied = useRef(false)
  /** CAL-05: restore page scroll after closing detail sheet. */
  const savedScrollY = useRef(0)
  const prevScrollRestoration = useRef<ScrollRestoration | null>(null)

  useEffect(() => {
    if (dateParamApplied.current) return
    const raw = searchParams.get('date')
    if (!raw) return
    const d = parseGregorianAnchorIso(raw)
    if (!d) return
    dateParamApplied.current = true
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(d.getDate())
    const civil = stripLocal(d)
    setRangeStart(addDays(civil, -PAST_DAYS))
    setRangeEnd(addDays(civil, FUTURE_DAYS))
  }, [searchParams])

  useEffect(() => {
    let active = true
    const loadCards = (force = false) => {
      const loader = force
        ? refreshPublishedCalendarCards()
        : getPublishedCalendarCardsForLinking({ from: now, limit: 500 })
      void loader
        .then((cards) => {
          if (active) setCalendarCards(cards)
        })
        .catch((cause) => {
          if (import.meta.env.DEV) console.error('[CalendarPage] calendar_cards', cause)
          if (active) setCalendarCards([])
        })
    }
    loadCards(false)
    const onVisible = () => {
      if (document.visibilityState === 'visible') {
        invalidateCalendarCardsCache()
        loadCards(true)
      }
    }
    document.addEventListener('visibilitychange', onVisible)
    return () => {
      active = false
      document.removeEventListener('visibilitychange', onVisible)
    }
  }, [now])

  useEffect(() => {
    let active = true
    void loadDayChurchContext(now)
      .then((ctx) => {
        if (active) setTodayContext(ctx)
      })
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[CalendarPage] today context', cause)
      })
    return () => {
      active = false
    }
  }, [now])

  useEffect(() => {
    let active = true
    void computeCalendarDayMarksAsync(viewYear, viewMonth)
      .then((next) => {
        if (active) setMarks(next)
      })
      .catch(() => {
        if (active) setMarks(new Map())
      })
    return () => {
      active = false
    }
  }, [viewYear, viewMonth])

  const selectedDate = useMemo(
    () => new Date(viewYear, viewMonth, selectedDay),
    [viewYear, viewMonth, selectedDay],
  )

  const isSelectedToday =
    selectedDate.getFullYear() === now.getFullYear() &&
    selectedDate.getMonth() === now.getMonth() &&
    selectedDate.getDate() === now.getDate()

  // Ensure selected date stays inside the loaded timeline window
  useEffect(() => {
    const selected = stripLocal(selectedDate)
    if (selected < rangeStart) {
      setRangeStart(addDays(selected, -PAST_DAYS))
    } else if (selected > rangeEnd) {
      setRangeEnd(addDays(selected, FUTURE_DAYS))
    }
  }, [selectedDate, rangeStart, rangeEnd])

  useEffect(() => {
    let active = true
    setTimelineLoading(true)
    void getCalendarEventsForRange(rangeStart, rangeEnd, {
      cards: calendarCards.length ? calendarCards : undefined,
    })
      .then((groups) => {
        if (!active) return
        setTimelineGroups(groups)
      })
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[CalendarPage] timeline range', cause)
        if (active) setTimelineGroups([])
      })
      .finally(() => {
        if (active) setTimelineLoading(false)
      })
    return () => {
      active = false
    }
  }, [rangeStart, rangeEnd, calendarCards])

  useEffect(() => {
    let active = true
    if (isSelectedToday && todayContext) {
      setDayContext(todayContext)
      setDayLoading(false)
      setDayError(null)
      return
    }

    const cacheKey = toIsoLocalDate(selectedDate)
    const cached = dayContextCacheRef.current.get(cacheKey)
    if (cached) {
      setDayContext(cached)
      setDayLoading(false)
      setDayError(null)
      return
    }

    setDayLoading(true)
    setDayError(null)
    const requestId = ++dayRequestIdRef.current
    void loadDayChurchContext(selectedDate)
      .then((context) => {
        if (!active || requestId !== dayRequestIdRef.current) return
        dayContextCacheRef.current.set(cacheKey, context)
        setDayContext(context)
      })
      .catch((cause) => {
        if (!active || requestId !== dayRequestIdRef.current) return
        if (import.meta.env.DEV) console.error('[CalendarPage] day context', cause)
        setDayError(
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : 'Unable to load this day.',
        )
      })
      .finally(() => {
        if (active && requestId === dayRequestIdRef.current) setDayLoading(false)
      })
    return () => {
      active = false
    }
  }, [selectedDate, dayReloadTick, isSelectedToday, todayContext])

  const gregorianLabel = formatLongDate(selectedDate)
  const ethiopianLabel =
    dayContext?.ethiopianLabel ||
    (isSelectedToday ? snapshot.ethiopian?.labelLong || '' : '') ||
    (dayContext
      ? `${dayContext.ethiopianDate.monthName} ${dayContext.ethiopianDate.day}, ${dayContext.ethiopianDate.year}`
      : '') ||
    timelineGroups.find((g) => g.iso === toIsoLocalDate(selectedDate))?.ethiopianLabel ||
    ''

  const setSelectedCivilDate = useCallback((d: Date) => {
    const civil = stripLocal(d)
    setViewYear(civil.getFullYear())
    setViewMonth(civil.getMonth())
    setSelectedDay(civil.getDate())
    setDetailEvent(null)
  }, [])

  const jumpToday = () => {
    const civil = stripLocal(now)
    setSelectedCivilDate(civil)
    setRangeStart(addDays(civil, -PAST_DAYS))
    setRangeEnd(addDays(civil, FUTURE_DAYS))
  }

  const shiftSelectedDay = useCallback((delta: number) => {
    const next = addDays(new Date(viewYear, viewMonth, selectedDay), delta)
    setViewYear(next.getFullYear())
    setViewMonth(next.getMonth())
    setSelectedDay(next.getDate())
    setDetailEvent(null)
    setRangeStart((start) => {
      const civil = stripLocal(next)
      if (civil < start) return addDays(civil, -PAST_DAYS)
      return start
    })
    setRangeEnd((end) => {
      const civil = stripLocal(next)
      if (civil > end) return addDays(civil, FUTURE_DAYS)
      return end
    })
  }, [viewYear, viewMonth, selectedDay])

  const goPrevMonth = () => {
    const d = new Date(viewYear, viewMonth - 1, 1)
    const max = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate()
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay((prev) => Math.min(prev, max))
    setDetailEvent(null)
  }

  const goNextMonth = () => {
    const d = new Date(viewYear, viewMonth + 1, 1)
    const max = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate()
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay((prev) => Math.min(prev, max))
    setDetailEvent(null)
  }

  const selectCalendarDay = (day: number) => {
    setSelectedDay(day)
    setDetailEvent(null)
  }

  const openEvent = useCallback((event: PresentableCalendarEvent, date: Date) => {
    savedScrollY.current = window.scrollY
    try {
      if (prevScrollRestoration.current == null) {
        prevScrollRestoration.current = window.history.scrollRestoration
      }
      window.history.scrollRestoration = 'manual'
    } catch {
      /* ignore */
    }
    const civil = stripLocal(date)
    setViewYear(civil.getFullYear())
    setViewMonth(civil.getMonth())
    setSelectedDay(civil.getDate())
    setDetailEvent(event)
  }, [])

  const closeDetail = useCallback(() => {
    setDetailEvent(null)
    const y = savedScrollY.current
    const restore = () => {
      const maxY = Math.max(0, document.documentElement.scrollHeight - window.innerHeight)
      window.scrollTo({ top: Math.min(y, maxY), left: 0, behavior: 'auto' })
    }
    restore()
    window.requestAnimationFrame(() => {
      restore()
      window.requestAnimationFrame(() => {
        restore()
        try {
          if (prevScrollRestoration.current != null) {
            window.history.scrollRestoration = prevScrollRestoration.current
            prevScrollRestoration.current = null
          }
        } catch {
          /* ignore */
        }
      })
    })
    window.setTimeout(restore, 80)
    window.setTimeout(restore, 200)
  }, [])

  const loadEarlier = useCallback(() => {
    setRangeStart((prev) => addDays(prev, -EXTEND_DAYS))
  }, [])

  const loadLater = useCallback(() => {
    setRangeEnd((prev) => addDays(prev, EXTEND_DAYS))
  }, [])

  const synaxariumItems = dayContext?.synaxarium || []

  return (
    <PageSection id="calendar" variant="tint" className={styles.page}>
      <header className={styles.header}>
        <div className={styles.headerTop}>
          <div>
            <p className={styles.eyebrow}>{t('nav.calendar')}</p>
            <h1 className={styles.title}>{t('nav.calendar')}</h1>
          </div>
          <div className={styles.headerActions}>
            <button type="button" className={styles.btnPrimary} onClick={jumpToday}>
              {t('calendar.page.jumpToday')}
            </button>
          </div>
        </div>
      </header>

      <section className={styles.selectedBlock} aria-labelledby="timeline-heading">
        <header className={styles.selectedHead}>
          <div className={styles.dayNav}>
            <button
              type="button"
              className={styles.dayNavBtn}
              aria-label={t('calendar.page.previousDay')}
              onClick={() => shiftSelectedDay(-1)}
            >
              ←
            </button>
            <div className={styles.selectedHeadCopy}>
              <h2 id="timeline-heading" className={styles.selectedGregorian}>
                {gregorianLabel}
              </h2>
              {ethiopianLabel ? (
                <p className={styles.selectedEthiopian}>{ethiopianLabel}</p>
              ) : null}
            </div>
            <button
              type="button"
              className={styles.dayNavBtn}
              aria-label={t('calendar.page.nextDay')}
              onClick={() => shiftSelectedDay(1)}
            >
              →
            </button>
          </div>
        </header>

        {dayError && !dayContext && timelineGroups.length === 0 ? (
          <div className={styles.errorBox} role="alert">
            <p>{dayError}</p>
            <button
              type="button"
              className={styles.btnGhost}
              onClick={() => {
                dayContextCacheRef.current.delete(toIsoLocalDate(selectedDate))
                setDayReloadTick((n) => n + 1)
              }}
            >
              Try again
            </button>
          </div>
        ) : (
          <CalendarDateTimeline
            groups={timelineGroups}
            selectedDate={selectedDate}
            today={now}
            lang={contentLocale}
            loading={timelineLoading && timelineGroups.length === 0}
            onSelectDate={setSelectedCivilDate}
            onOpenEvent={openEvent}
            onLoadEarlier={loadEarlier}
            onLoadLater={loadLater}
          />
        )}
      </section>

      <div className={styles.mainSplit}>
        <section ref={monthRef} className={styles.monthPane} aria-label="Month calendar">
          <MiniMonthCalendar
            anchor={now}
            displayYear={viewYear}
            displayMonthIndex={viewMonth}
            dayMarks={marks}
            selectedDay={selectedDay}
            onSelectDay={selectCalendarDay}
            onPrevMonth={goPrevMonth}
            onNextMonth={goNextMonth}
          />
        </section>

        <SynaxariumOfTheDay
          ethiopianLabel={ethiopianLabel}
          gregorianLabel={gregorianLabel}
          items={synaxariumItems}
          loading={dayLoading && !dayContext}
          daySlug={dayContext?.synaxariumDaySlug}
        />
      </div>

      <CalendarEventDetail
        open={detailEvent != null}
        event={detailEvent}
        dateLabel={gregorianLabel}
        ethiopianLabel={ethiopianLabel || undefined}
        onClose={closeDetail}
      />
    </PageSection>
  )
}
