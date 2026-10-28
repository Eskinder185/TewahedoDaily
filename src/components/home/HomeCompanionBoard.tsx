import { useCallback, useEffect, useId, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { imageManifest } from '../../content/imageManifest'
import { CalendarEventImage } from '../calendar/CalendarEventImage'
import { localizeCalendarEventType, type PresentableCalendarEvent } from '../../lib/calendar/calendarPresentation'
import {
  ETHIOPIAN_MONTH_NAMES_AM,
  formatGregorianMonth,
} from '../../lib/calendar/calendarDateLabels'
import { prefetchRoute } from '../../lib/routePrefetch'
import { ETHIOPIAN_MONTH_NAMES, gregorianToEthiopian } from '../../lib/ethiopianDate'
import { addDays, toIsoLocalDate } from '../../lib/churchCalendar/pascha'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import styles from './HomeCompanionBoard.module.css'

const READ_MS = 8000
const FLIP_MS = 650
const DATE_TURN_MS = 460

function todayLocal(): Date {
  const now = new Date()
  return new Date(now.getFullYear(), now.getMonth(), now.getDate())
}

function formatWeekday(date: Date, locale: 'en' | 'am'): string {
  const tag = locale === 'am' ? 'am-ET' : 'en-US'
  try {
    return new Intl.DateTimeFormat(tag, { weekday: 'long' }).format(date)
  } catch {
    return new Intl.DateTimeFormat('en-US', { weekday: 'long' }).format(date)
  }
}

function ethiopianMonthYear(date: Date, locale: 'en' | 'am'): { day: number; monthYear: string } {
  const eth = gregorianToEthiopian(date)
  const names = locale === 'am' ? ETHIOPIAN_MONTH_NAMES_AM : ETHIOPIAN_MONTH_NAMES
  const month = names[eth.month - 1] || String(eth.month)
  return { day: eth.day, monthYear: `${month} ${eth.year}` }
}

function prefersReducedMotion(): boolean {
  if (typeof window === 'undefined' || typeof window.matchMedia !== 'function') return false
  return window.matchMedia('(prefers-reduced-motion: reduce)').matches
}

function eventHeading(event: PresentableCalendarEvent, locale: 'en' | 'am'): string {
  return locale === 'am' && event.titleAmharic ? event.titleAmharic : event.title
}

function ResourceIcon({ name }: { name: 'bible' | 'hymns' | 'pray' | 'calendar' }) {
  if (name === 'bible') {
    return (
      <svg viewBox="0 0 48 48" aria-hidden="true" focusable="false">
        <path
          d="M10 8.5h13.5c3.4 0 6 2.2 6 5.4V39c-2.8-1.8-5.5-2.5-8.6-2.5H10V8.5Z"
          fill="none"
          stroke="currentColor"
          strokeWidth="1.7"
        />
        <path
          d="M38 8.5H24.5c-3.4 0-6 2.2-6 5.4V39c2.8-1.8 5.5-2.5 8.6-2.5H38V8.5Z"
          fill="none"
          stroke="currentColor"
          strokeWidth="1.7"
        />
        <path d="M24 11.5v24" stroke="currentColor" strokeWidth="1.5" />
      </svg>
    )
  }
  if (name === 'hymns') {
    return (
      <svg viewBox="0 0 48 48" aria-hidden="true" focusable="false">
        <path d="M18 34.5a6 6 0 1 1-2-4.5V12.5l18-4v21.6a6 6 0 1 1-2-4.5" fill="none" stroke="currentColor" strokeWidth="1.7" />
        <path d="M18 16.5 34 13" stroke="currentColor" strokeWidth="1.5" />
      </svg>
    )
  }
  if (name === 'pray') {
    return (
      <svg viewBox="0 0 48 48" aria-hidden="true" focusable="false">
        <path d="M24 7.5v8.2M24 7.5 20 13M24 7.5l4 5.5" fill="none" stroke="currentColor" strokeWidth="1.6" strokeLinejoin="round" />
        <path d="M16 20.5c0-4 3.4-7 8-7s8 3 8 7c0 6.5-8 14-8 14s-8-7.5-8-14Z" fill="none" stroke="currentColor" strokeWidth="1.7" />
        <path d="M19.5 36.5h9v4.2h-9z" fill="none" stroke="currentColor" strokeWidth="1.5" />
      </svg>
    )
  }
  return (
    <svg viewBox="0 0 48 48" aria-hidden="true" focusable="false">
      <rect x="10" y="11" width="28" height="26" rx="3" fill="none" stroke="currentColor" strokeWidth="1.7" />
      <path d="M10 18.5h28M16 11v-3.2M32 11v-3.2" stroke="currentColor" strokeWidth="1.6" />
      <rect x="16" y="23" width="5" height="5" rx="0.8" fill="currentColor" />
      <rect x="22.5" y="23" width="5" height="5" rx="0.8" fill="currentColor" opacity="0.55" />
      <rect x="29" y="23" width="5" height="5" rx="0.8" fill="currentColor" opacity="0.35" />
    </svg>
  )
}

function PauseGlyph({ paused }: { paused: boolean }) {
  if (paused) {
    return (
      <svg viewBox="0 0 20 20" aria-hidden="true" focusable="false">
        <path d="M6.4 4.2 16 10 6.4 15.8Z" fill="currentColor" />
      </svg>
    )
  }
  return (
    <svg viewBox="0 0 20 20" aria-hidden="true" focusable="false">
      <rect x="5.2" y="4.2" width="3.1" height="11.6" rx="0.7" fill="currentColor" />
      <rect x="11.7" y="4.2" width="3.1" height="11.6" rx="0.7" fill="currentColor" />
    </svg>
  )
}

function EventVisual({
  event,
  locale,
  t,
}: {
  event: PresentableCalendarEvent
  locale: 'en' | 'am'
  t: (key: string) => string
}) {
  const title = eventHeading(event, locale)
  const kind = localizeCalendarEventType(event.categoryLabel, t) || event.categoryLabel
  return (
    <>
      {event.hasImage && event.imageUrl ? (
        <CalendarEventImage
          src={event.imageUrl}
          alt=""
          position={event.objectPosition}
          className={styles.eventFrame}
          imageClassName={styles.eventPhoto}
          sizes="(max-width: 700px) 92vw, 26rem"
          decorativeFallback={false}
        />
      ) : (
        <div className={styles.eventFallback} aria-hidden="true" />
      )}
      <p className={styles.eventKind}>{kind}</p>
      <p className={styles.eventTitle}>{title}</p>
    </>
  )
}

function SheetChrome({
  weekday,
  day,
  monthYear,
  gregorian,
}: {
  weekday: string
  day: number
  monthYear: string
  gregorian: string
}) {
  return (
    <>
      <p className={styles.weekday}>{weekday}</p>
      <p className={styles.ethDay}>{day}</p>
      <p className={styles.ethMonth}>{monthYear}</p>
      <p className={styles.gregorian}>{gregorian}</p>
      <div className={styles.goldLine} aria-hidden="true" />
    </>
  )
}

export function HomeCompanionBoard() {
  const t = useTranslation()
  const { uiLocale: locale } = useLocale()
  const liveId = useId()
  const calendarRef = useRef<HTMLElement | null>(null)
  const requestRef = useRef(0)
  const turningRef = useRef(false)
  const flipTimerRef = useRef(0)
  const dateTimerRef = useRef(0)
  const indexRef = useRef(0)
  const countRef = useRef(0)
  const userPausedRef = useRef(false)
  const focusPausedRef = useRef(false)
  const hiddenRef = useRef(false)
  const offscreenRef = useRef(false)
  const startFlipRef = useRef<(nextIndex: number) => void>(() => {})

  const [selectedDate, setSelectedDate] = useState(todayLocal)
  const [events, setEvents] = useState<PresentableCalendarEvent[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [eventIndex, setEventIndex] = useState(0)
  const [incomingIndex, setIncomingIndex] = useState(0)
  const [turning, setTurning] = useState(false)
  const [userPaused, setUserPaused] = useState(false)
  const [focusPaused, setFocusPaused] = useState(false)
  const [hiddenPaused, setHiddenPaused] = useState(false)
  const [offscreenPaused, setOffscreenPaused] = useState(false)
  const [reducedMotion, setReducedMotion] = useState(prefersReducedMotion)
  const [dateTurning, setDateTurning] = useState(false)

  indexRef.current = eventIndex
  countRef.current = events.length
  userPausedRef.current = userPaused
  focusPausedRef.current = focusPaused
  hiddenRef.current = hiddenPaused
  offscreenRef.current = offscreenPaused

  const iso = useMemo(() => toIsoLocalDate(selectedDate), [selectedDate])
  const eth = useMemo(() => ethiopianMonthYear(selectedDate, locale), [selectedDate, locale])
  const weekday = useMemo(() => formatWeekday(selectedDate, locale), [selectedDate, locale])
  const gregorian = useMemo(() => formatGregorianMonth(selectedDate, locale), [selectedDate, locale])

  const loadEvents = useCallback(async (date: Date) => {
    const token = ++requestRef.current
    window.clearTimeout(flipTimerRef.current)
    turningRef.current = false
    setTurning(false)
    setLoading(true)
    setError(false)
    try {
      const { getHomepageTodayEvents } = await import('../../lib/calendar/getCalendarEventsForDate')
      const next = await getHomepageTodayEvents(date)
      if (token !== requestRef.current) return
      setEvents(next)
      setEventIndex(0)
      setIncomingIndex(next.length > 1 ? 1 : 0)
      setLoading(false)
    } catch {
      if (token !== requestRef.current) return
      setEvents([])
      setEventIndex(0)
      setIncomingIndex(0)
      setError(true)
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    void loadEvents(selectedDate)
  }, [selectedDate, loadEvents])

  useEffect(() => {
    const media = window.matchMedia('(prefers-reduced-motion: reduce)')
    const sync = () => setReducedMotion(media.matches)
    sync()
    media.addEventListener('change', sync)
    return () => media.removeEventListener('change', sync)
  }, [])

  useEffect(() => {
    const onVisibility = () => setHiddenPaused(document.visibilityState !== 'visible')
    onVisibility()
    document.addEventListener('visibilitychange', onVisibility)
    return () => document.removeEventListener('visibilitychange', onVisibility)
  }, [])

  useEffect(() => {
    const node = calendarRef.current
    if (!node || typeof IntersectionObserver === 'undefined') return
    const observer = new IntersectionObserver(
      (entries) => {
        const entry = entries[0]
        if (!entry) return
        setOffscreenPaused(!entry.isIntersecting)
      },
      { threshold: 0.15 },
    )
    observer.observe(node)
    return () => observer.disconnect()
  }, [])

  const finishFlip = useCallback((nextIndex: number, count: number) => {
    setEventIndex(nextIndex)
    setIncomingIndex(count > 1 ? (nextIndex + 1) % count : 0)
    setTurning(false)
    turningRef.current = false
  }, [])

  const startFlip = useCallback(
    (nextIndex: number) => {
      const count = countRef.current
      if (turningRef.current || count < 2) return
      if (reducedMotion) {
        finishFlip(nextIndex, count)
        return
      }
      turningRef.current = true
      setIncomingIndex(nextIndex)
      setTurning(true)
      window.clearTimeout(flipTimerRef.current)
      flipTimerRef.current = window.setTimeout(() => {
        finishFlip(nextIndex, count)
      }, FLIP_MS)
    },
    [finishFlip, reducedMotion],
  )

  startFlipRef.current = startFlip

  useEffect(() => {
    if (reducedMotion || loading || events.length < 2) return undefined
    const interval = window.setInterval(() => {
      if (
        userPausedRef.current ||
        focusPausedRef.current ||
        hiddenRef.current ||
        offscreenRef.current ||
        turningRef.current
      ) {
        return
      }
      const count = countRef.current
      if (count < 2) return
      startFlipRef.current((indexRef.current + 1) % count)
    }, READ_MS)
    return () => {
      window.clearInterval(interval)
    }
  }, [iso, events.length, loading, reducedMotion])

  useEffect(() => {
    return () => {
      window.clearTimeout(flipTimerRef.current)
      window.clearTimeout(dateTimerRef.current)
    }
  }, [])

  const eventCount = events.length
  const activeEvent = eventCount > 0 ? events[Math.min(eventIndex, eventCount - 1)] : null
  const incomingEvent = eventCount > 1 ? events[Math.min(incomingIndex, eventCount - 1)] : null
  const showCarousel = eventCount > 1
  const calendarHref = `/calendar?date=${iso}`

  const syncFocusPause = (root: HTMLElement) => {
    const active = document.activeElement
    if (!(active instanceof HTMLElement) || !root.contains(active)) {
      setFocusPaused(false)
      return
    }
    if (active.dataset.pauseControl === 'true') {
      setFocusPaused(false)
      return
    }
    setFocusPaused(true)
  }

  const shiftDate = (days: number) => {
    window.clearTimeout(flipTimerRef.current)
    turningRef.current = false
    setTurning(false)
    setEvents([])
    setEventIndex(0)
    setIncomingIndex(0)
    setLoading(true)
    setDateTurning(true)
    window.clearTimeout(dateTimerRef.current)
    dateTimerRef.current = window.setTimeout(() => setDateTurning(false), DATE_TURN_MS)
    setSelectedDate((current) => addDays(current, days))
  }

  const goToday = () => {
    window.clearTimeout(flipTimerRef.current)
    turningRef.current = false
    setTurning(false)
    setEvents([])
    setEventIndex(0)
    setIncomingIndex(0)
    setLoading(true)
    setDateTurning(true)
    window.clearTimeout(dateTimerRef.current)
    dateTimerRef.current = window.setTimeout(() => setDateTurning(false), DATE_TURN_MS)
    setSelectedDate(todayLocal())
  }

  const stepEvent = (delta: number) => {
    if (eventCount < 2 || turningRef.current) return
    startFlip((eventIndex + delta + eventCount) % eventCount)
  }

  const resources = [
    {
      key: 'bible' as const,
      to: '/bible',
      title: t('home.board.bibleTitle'),
      deck: t('home.board.bibleDeck'),
      className: styles.resourceBible,
    },
    {
      key: 'hymns' as const,
      to: '/practice',
      title: t('home.board.hymnsTitle'),
      deck: t('home.board.hymnsDeck'),
      className: styles.resourceHymns,
    },
    {
      key: 'pray' as const,
      to: '/pray',
      title: t('home.board.prayTitle'),
      deck: t('home.board.prayDeck'),
      className: styles.resourcePray,
    },
    {
      key: 'calendar' as const,
      to: '/calendar',
      title: t('home.board.calendarTitle'),
      deck: t('home.board.calendarDeck'),
      className: styles.resourceCalendar,
    },
  ]

  const meter = showCarousel ? (
    <div className={styles.meter}>
      {reducedMotion ? (
        <button
          type="button"
          className={styles.quietNav}
          data-event-nav="true"
          aria-label={t('home.board.previousEvent')}
          onClick={() => stepEvent(-1)}
        >
          ‹
        </button>
      ) : null}
      <p className={styles.eventPosition}>
        {eventIndex + 1} / {eventCount}
      </p>
      {reducedMotion ? (
        <button
          type="button"
          className={styles.quietNav}
          data-event-nav="true"
          aria-label={t('home.board.nextEvent')}
          onClick={() => stepEvent(1)}
        >
          ›
        </button>
      ) : (
        <button
          type="button"
          className={styles.pauseIcon}
          data-pause-control="true"
          aria-pressed={userPaused}
          aria-label={userPaused ? t('home.board.playEvents') : t('home.board.pauseEvents')}
          onClick={() => setUserPaused((value) => !value)}
        >
          <PauseGlyph paused={userPaused} />
        </button>
      )}
    </div>
  ) : null

  return (
    <section className={styles.page} aria-labelledby={liveId}>
      <div className={styles.backdrop} aria-hidden="true">
        <picture>
          <source
            media="(max-width: 700px)"
            type="image/webp"
            srcSet="/images/home/home-hero-lalibela-640.webp 640w, /images/home/home-hero-lalibela-1024.webp 1024w"
            sizes="100vw"
          />
          <img
            className={styles.landscape}
            src={imageManifest.home.hero}
            srcSet={imageManifest.home.heroSrcSet}
            sizes="(max-width: 700px) 100vw, 1600px"
            width={imageManifest.home.heroWidth}
            height={imageManifest.home.heroHeight}
            alt=""
            fetchPriority="high"
            decoding="async"
          />
        </picture>
        <div className={styles.scrim} />
      </div>

      <div className={styles.inner}>
        <header className={styles.intro}>
          <p className={styles.eyebrow}>{t('home.hero.eyebrow')}</p>
          <div className={styles.ornament} aria-hidden="true">
            <span />
            <i />
            <span />
          </div>
          <h1 id={liveId} className={styles.title}>
            {t('home.hero.title')}
          </h1>
          <p className={styles.lede}>{t('home.hero.tagline')}</p>
        </header>

        <div className={styles.stage}>
          <div className={styles.colLeft}>
            {resources.slice(0, 2).map((item) => (
              <Link
                key={item.key}
                to={item.to}
                className={`${styles.resource} ${item.className}`}
                onPointerEnter={() => prefetchRoute(item.to)}
                onPointerDown={() => prefetchRoute(item.to)}
                onFocus={() => prefetchRoute(item.to)}
              >
                <span className={styles.resourceIcon}>
                  <ResourceIcon name={item.key} />
                </span>
                <span className={styles.resourceCopy}>
                  <span className={styles.resourceTitle}>{item.title}</span>
                  <span className={styles.resourceDeck}>{item.deck}</span>
                </span>
                <span className={styles.resourceChevron} aria-hidden="true">
                  ›
                </span>
              </Link>
            ))}
          </div>

          <div className={styles.center}>
            <article
              ref={calendarRef}
              className={`${styles.calendar} ${dateTurning ? styles.calendarTurn : ''}`}
              data-iso={iso}
              data-event-index={String(eventIndex)}
              data-event-id={activeEvent?.occurrenceKey || activeEvent?.id || ''}
              data-event-title={activeEvent ? eventHeading(activeEvent, locale) : ''}
              onFocusCapture={(event) => syncFocusPause(event.currentTarget)}
              onBlurCapture={() => {
                window.setTimeout(() => {
                  if (calendarRef.current) syncFocusPause(calendarRef.current)
                }, 0)
              }}
            >
              <div className={styles.sheetStack} aria-hidden="true">
                <span className={styles.sheetBack} />
                <span className={styles.sheetMid} />
              </div>
              <div className={styles.binding} aria-hidden="true">
                <span className={styles.fastener} />
                <span className={styles.fastener} />
              </div>
              <div className={styles.flipStage}>
                {showCarousel && incomingEvent && !reducedMotion ? (
                  <div className={`${styles.sheet} ${styles.sheetUnder}`} aria-hidden="true" inert>
                    <SheetChrome
                      weekday={weekday}
                      day={eth.day}
                      monthYear={eth.monthYear}
                      gregorian={gregorian}
                    />
                    <div className={styles.eventArea}>
                      <EventVisual event={incomingEvent} locale={locale} t={t} />
                    </div>
                    <span className={styles.curl} aria-hidden="true" />
                  </div>
                ) : null}
                <div
                  className={`${styles.sheet} ${styles.sheetFront} ${turning ? styles.sheetFlip : ''}`}
                  aria-live="off"
                >
                  <SheetChrome
                    weekday={weekday}
                    day={eth.day}
                    monthYear={eth.monthYear}
                    gregorian={gregorian}
                  />
                  <div className={styles.eventArea}>
                    {loading ? (
                      <p className={styles.eventEmpty}>{t('home.board.loading')}</p>
                    ) : error ? (
                      <p className={styles.eventEmpty}>{t('home.board.unableLoad')}</p>
                    ) : activeEvent ? (
                      <>
                        <EventVisual event={activeEvent} locale={locale} t={t} />
                        <Link
                          className={styles.eventAction}
                          to={calendarHref}
                          onPointerDown={() => prefetchRoute(calendarHref)}
                        >
                          {t('home.board.openDay')}
                        </Link>
                      </>
                    ) : (
                      <>
                        <div className={styles.eventFallback} aria-hidden="true" />
                        <p className={styles.eventEmpty}>{t('home.board.noObservances')}</p>
                        <Link
                          className={styles.eventAction}
                          to={calendarHref}
                          onPointerDown={() => prefetchRoute(calendarHref)}
                        >
                          {t('home.board.openDay')}
                        </Link>
                      </>
                    )}
                  </div>
                  {meter}
                  <span className={styles.curl} aria-hidden="true" />
                </div>
              </div>
            </article>
          </div>

          <nav className={styles.dayNav} aria-label={t('home.board.dayNavAria')}>
            <button type="button" onClick={() => shiftDate(-1)}>
              {t('home.board.previousDay')}
            </button>
            <button type="button" className={styles.todayBtn} onClick={goToday}>
              {t('home.board.today')}
            </button>
            <button type="button" onClick={() => shiftDate(1)}>
              {t('home.board.nextDay')}
            </button>
          </nav>

          <div className={styles.colRight}>
            {resources.slice(2).map((item) => (
              <Link
                key={item.key}
                to={item.to}
                className={`${styles.resource} ${item.className}`}
                onPointerEnter={() => prefetchRoute(item.to)}
                onPointerDown={() => prefetchRoute(item.to)}
                onFocus={() => prefetchRoute(item.to)}
              >
                <span className={styles.resourceIcon}>
                  <ResourceIcon name={item.key} />
                </span>
                <span className={styles.resourceCopy}>
                  <span className={styles.resourceTitle}>{item.title}</span>
                  <span className={styles.resourceDeck}>{item.deck}</span>
                </span>
                <span className={styles.resourceChevron} aria-hidden="true">
                  ›
                </span>
              </Link>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}
