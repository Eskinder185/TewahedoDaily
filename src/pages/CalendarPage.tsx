import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useLocation, useNavigate, useSearchParams } from 'react-router-dom'
import { useUrlChoice } from '../hooks/useUrlState'
import { PageSection } from '../components/ui/PageSection'
import { OrthodoxInteractiveCalendar } from '../components/calendar/OrthodoxInteractiveCalendar'
import { CalendarDateTimeline } from '../components/calendar/CalendarDateTimeline'
import { CalendarEventDetail } from '../components/calendar/CalendarEventDetail'
import { DailyFaithDashboard } from '../components/dailyFaith/DailyFaithDashboard'
import { useHomeToday } from '../hooks/useHomeToday'
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
import { formatEthiopianDay, formatGregorianMonth } from '../lib/calendar/calendarDateLabels'
import { CalendarReminderToggle } from '../components/calendar/CalendarReminderToggle'
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

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

export function CalendarPage() {
  const { now } = useHomeToday()
  const { contentLocale } = useLocale()
  const t = useTranslation()
  const [searchParams, setSearchParams] = useSearchParams()
  const location = useLocation()
  const navigate = useNavigate()
  const dateParam = searchParams.get('date')
  const selectedDate = useMemo(() => parseGregorianAnchorIso(dateParam || '') || stripLocal(now), [dateParam, now])
  const viewYear = selectedDate.getFullYear()
  const viewMonth = selectedDate.getMonth()
  const selectedDay = selectedDate.getDate()
  const [dayContext, setDayContext] = useState<DayChurchContext | null>(null)
  const [todayContext, setTodayContext] = useState<DayChurchContext | null>(null)
  const [dayLoading, setDayLoading] = useState(false)
  const [dayError, setDayError] = useState<string | null>(null)
  const [dayReloadTick, setDayReloadTick] = useState(0)
  const [calendarCards, setCalendarCards] = useState<CalendarCard[]>([])
  const [timelineGroups, setTimelineGroups] = useState<CalendarDayGroup[]>([])
  const [timelineLoading, setTimelineLoading] = useState(true)
  const [rangeStart, setRangeStart] = useState(() => addDays(stripLocal(now), -PAST_DAYS))
  const [rangeEnd, setRangeEnd] = useState(() => addDays(stripLocal(now), FUTURE_DAYS))
  const [grid, setGrid] = useUrlChoice('grid', 'closed', ['closed', 'open'])
  const monthGridOpen = grid === 'open'
  const monthRef = useRef<HTMLElement | null>(null)
  const dayContextCacheRef = useRef<Map<string, DayChurchContext>>(new Map())
  const dayRequestIdRef = useRef(0)
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
        setDayError(t('calendar.timeline.loadError'))
      })
      .finally(() => {
        if (active && requestId === dayRequestIdRef.current) setDayLoading(false)
      })
    return () => {
      active = false
    }
  }, [selectedDate, dayReloadTick, isSelectedToday, todayContext, t])

  // Reserve roughly the loaded height only while the placeholders are showing, so the
  // timeline carousel and dashboard do not push content down when they arrive.
  const timelineReserveSpace =
    timelineLoading && timelineGroups.length === 0 && !(dayError && !dayContext)
  const dashboardLoading = dayLoading && !dayContext

  const gregorianLabel = formatGregorianMonth(selectedDate, contentLocale)
  const ethiopianLabel = formatEthiopianDay(selectedDate, contentLocale, true)

  const setSelectedCivilDate = useCallback((d: Date) => {
    const civil = stripLocal(d)
    const iso = toIsoLocalDate(civil)
    if (searchParams.get('date') === iso && !searchParams.has('month') && !searchParams.has('event')) return
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev)
      next.set("date", iso)
      next.delete("month")
      next.delete("event")
      return next
    })
  }, [searchParams, setSearchParams])

  const jumpToday = () => {
    const civil = stripLocal(now)
    setSelectedCivilDate(civil)
    setRangeStart(addDays(civil, -PAST_DAYS))
    setRangeEnd(addDays(civil, FUTURE_DAYS))
  }

  const shiftSelectedDay = useCallback((delta: number) => {
    const next = addDays(new Date(viewYear, viewMonth, selectedDay), delta)
    setSelectedCivilDate(next)
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
  }, [viewYear, viewMonth, selectedDay, setSelectedCivilDate])

  const eventId = searchParams.get('event')
  const detailEvent = timelineGroups.find(group => group.iso === toIsoLocalDate(selectedDate))
    ?.events.find(event => event.id === eventId) || null
  const openEvent = useCallback((event: PresentableCalendarEvent, date: Date) => {
    const next = new URLSearchParams(searchParams)
    next.set('date', toIsoLocalDate(date))
    next.set('event', event.id)
    setSearchParams(next, { state: { calendarDetailParent: `${location.pathname}${location.search}` } })
  }, [searchParams, setSearchParams, location.pathname, location.search])
  const closeDetail = useCallback(() => {
    if (location.state?.calendarDetailParent) { navigate(-1); return }
    const next = new URLSearchParams(searchParams)
    next.delete('event')
    setSearchParams(next)
  }, [location.state, navigate, searchParams, setSearchParams])

  const loadEarlier = useCallback(() => {
    setRangeStart((prev) => addDays(prev, -EXTEND_DAYS))
  }, [])

  const loadLater = useCallback(() => {
    setRangeEnd((prev) => addDays(prev, EXTEND_DAYS))
  }, [])
  const dayTouchStartX = useRef<number | null>(null)
  const dayTouchStartY = useRef<number | null>(null)

  const onDayTouchStart = (e: React.TouchEvent) => {
    dayTouchStartX.current = e.touches[0].clientX
    dayTouchStartY.current = e.touches[0].clientY
  }

  const onDayTouchEnd = (e: React.TouchEvent) => {
    if (dayTouchStartX.current == null || dayTouchStartY.current == null) return
    const deltaX = e.changedTouches[0].clientX - dayTouchStartX.current
    const deltaY = e.changedTouches[0].clientY - dayTouchStartY.current
    dayTouchStartX.current = null
    dayTouchStartY.current = null
    if (Math.abs(deltaX) > 40 && Math.abs(deltaX) > Math.abs(deltaY) * 1.5) {
      if (deltaX < 0) shiftSelectedDay(1)
      else shiftSelectedDay(-1)
    }
  }

  return (
    <PageSection id="calendar" variant="tint" className={styles.page}>
      <header className={styles.header}>
        <div className={styles.headerTop}>
          <h1 className={styles.title}>{t('nav.calendar')}</h1>
          <CalendarReminderToggle />
        </div>

        <div className={styles.dateRow}>
          <div className={styles.dayNav} aria-label={t('calendar.page.dayNavAria')} onTouchStart={onDayTouchStart} onTouchEnd={onDayTouchEnd}>
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
                <p className={styles.selectedEthiopian} lang={contentLocale === 'am' ? 'am' : 'en'}>
                  {ethiopianLabel}
                </p>
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
          <button type="button" className={styles.todayBtn} onClick={jumpToday}>
            {t('calendar.page.today')}
          </button>
          <button
            type="button"
            className={styles.monthToggleBtn}
            onClick={() => setGrid(monthGridOpen ? 'closed' : 'open')}
            aria-expanded={monthGridOpen}
          >
            {monthGridOpen
              ? (contentLocale === 'am' ? '▲ የቀን መቁጠሪያ ዝጋ' : '▲ Hide Month Grid')
              : (contentLocale === 'am' ? '📅 ወርሃዊ የቀን መቁጠሪያ' : '📅 Month Grid')}
          </button>
        </div>
      </header>

      <section
        className={`${styles.selectedBlock} ${timelineReserveSpace ? styles.selectedBlockLoading : ''}`}
        aria-labelledby="timeline-heading"
      >
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
              {t('calendar.timeline.tryAgain')}
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

      {monthGridOpen ? (
        <section
          ref={monthRef}
          className={styles.monthAccordionPane}
          aria-label={t('calendar.timeline.month')}
        >
          <div className={styles.monthCardWrapper}>
            <OrthodoxInteractiveCalendar
              selectedDate={selectedDate}
              today={now}
              locale={contentLocale}
              onSelectDate={setSelectedCivilDate}
            />
          </div>
        </section>
      ) : null}

      <div
        className={`${styles.dashboardContainer} ${dashboardLoading ? styles.dashboardContainerLoading : ''}`}
      >
        <DailyFaithDashboard
          context={dayContext}
          loading={dashboardLoading}
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
