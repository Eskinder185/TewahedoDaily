import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { PageSection } from '../components/ui/PageSection'
import { MiniMonthCalendar } from '../components/todayInChurch/MiniMonthCalendar'
import { TodayInChurchPanel } from '../components/calendar/TodayInChurchPanel'
import { CalendarCardWhyModal } from '../components/calendar/CalendarCardWhyModal'
import { useHomeToday } from '../hooks/useHomeToday'
import {
  computeCalendarDayMarksAsync,
  type CalendarDayCellMark,
} from '../lib/churchCalendar'
import {
  cardCategoryBadge,
  getCalendarCards,
  resolveCardSummary,
  type CalendarCard,
} from '../lib/synaxarium/synaxariumService'
import { parseGregorianAnchorIso } from '../lib/churchCalendar/upcomingObservanceDisplay'
import { CalendarImage } from '../components/calendar/CalendarImage'
import { calendarImageManifest } from '../content/calendarImageManifest'
import {
  loadDayChurchContext,
  type DayChurchContext,
} from '../services/dayChurchContext'
import styles from './CalendarPage.module.css'

function visualKindFromType(type: string): 'feast' | 'fast' | 'commemoration' {
  const t = type.toLowerCase()
  if (t.includes('feast') || t.includes('season')) return 'feast'
  if (t.includes('fast')) return 'fast'
  return 'commemoration'
}

export function CalendarPage() {
  const t = useTranslation()
  const { locale } = useLocale()
  const { now } = useHomeToday()
  const [viewYear, setViewYear] = useState(now.getFullYear())
  const [viewMonth, setViewMonth] = useState(now.getMonth())
  const [selectedDay, setSelectedDay] = useState<number | null>(now.getDate())
  const [marks, setMarks] = useState<ReadonlyMap<number, CalendarDayCellMark>>(new Map())
  const [dayContext, setDayContext] = useState<DayChurchContext | null>(null)
  const [dayLoading, setDayLoading] = useState(false)
  const [dayError, setDayError] = useState<string | null>(null)
  const [dayReloadTick, setDayReloadTick] = useState(0)
  const [calendarCards, setCalendarCards] = useState<CalendarCard[]>([])
  const [cardsError, setCardsError] = useState<string>()
  const [cardsLoading, setCardsLoading] = useState(true)
  const [whyCard, setWhyCard] = useState<CalendarCard | null>(null)
  const detailRef = useRef<HTMLElement | null>(null)
  const trackRef = useRef<HTMLDivElement | null>(null)
  const dayContextCacheRef = useRef<Map<string, DayChurchContext>>(new Map())
  const dayRequestIdRef = useRef(0)

  useEffect(() => {
    let active = true
    setCardsLoading(true)
    setCardsError(undefined)
    void getCalendarCards({ from: now, limit: 10 })
      .then((cards) => {
        if (!active) return
        setCalendarCards(cards)
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[calendar] cards', cause)
        setCardsError(
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : 'Unable to load calendar cards.',
        )
        setCalendarCards([])
      })
      .finally(() => {
        if (active) setCardsLoading(false)
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
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[calendar] month marks', cause)
        if (active) setMarks(new Map())
      })
    return () => {
      active = false
    }
  }, [viewYear, viewMonth])

  const selectedDate = useMemo(() => {
    if (selectedDay == null) return null
    return new Date(viewYear, viewMonth, selectedDay)
  }, [viewYear, viewMonth, selectedDay])

  useEffect(() => {
    let active = true
    if (!selectedDate) {
      setDayContext(null)
      setDayLoading(false)
      setDayError(null)
      return
    }

    const cacheKey = `${selectedDate.getFullYear()}-${String(selectedDate.getMonth() + 1).padStart(2, '0')}-${String(selectedDate.getDate()).padStart(2, '0')}`
    const cached = dayContextCacheRef.current.get(cacheKey)
    if (cached) {
      setDayContext(cached)
      setDayLoading(false)
      setDayError(null)
      return
    }

    setDayLoading(true)
    setDayError(null)
    setDayContext((prev) => (prev?.gregorianDate === cacheKey ? prev : null))
    const requestId = ++dayRequestIdRef.current
    void loadDayChurchContext(selectedDate)
      .then((context) => {
        if (!active || requestId !== dayRequestIdRef.current) return
        dayContextCacheRef.current.set(cacheKey, context)
        setDayContext(context)
      })
      .catch((cause) => {
        if (!active || requestId !== dayRequestIdRef.current) return
        if (import.meta.env.DEV) console.error('[calendar] day context', cause)
        setDayError(
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : t('calendar.detail.synaxariumLoadError'),
        )
      })
      .finally(() => {
        if (active && requestId === dayRequestIdRef.current) setDayLoading(false)
      })
    return () => {
      active = false
    }
  }, [selectedDate, dayReloadTick, t])

  const goPrevMonth = () => {
    const d = new Date(viewYear, viewMonth - 1, 1)
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(null)
  }

  const goNextMonth = () => {
    const d = new Date(viewYear, viewMonth + 1, 1)
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(null)
  }

  const jumpToday = () => {
    setViewYear(now.getFullYear())
    setViewMonth(now.getMonth())
    setSelectedDay(now.getDate())
  }

  const selectCalendarDay = (day: number) => {
    setSelectedDay(day)
    if (window.matchMedia('(max-width: 959px)').matches) {
      window.requestAnimationFrame(() => {
        detailRef.current?.scrollIntoView({ behavior: 'smooth', block: 'nearest' })
      })
    }
  }

  const openCalendarCard = useCallback((card: CalendarCard) => {
    const d = parseGregorianAnchorIso(card.gregorianIso)
    if (!d) return
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(d.getDate())
    if (window.matchMedia('(max-width: 959px)').matches) {
      window.requestAnimationFrame(() => {
        detailRef.current?.scrollIntoView({ behavior: 'smooth', block: 'nearest' })
      })
    }
  }, [])

  const scrollCards = useCallback((direction: -1 | 1) => {
    const track = trackRef.current
    if (!track) return
    const card = track.querySelector(`.${styles.observanceCard}`) as HTMLElement | null
    const delta = (card?.offsetWidth || 280) + 16
    track.scrollBy({ left: direction * delta, behavior: 'smooth' })
  }, [])

  return (
    <PageSection id="calendar" variant="tint" className={styles.page}>
      <section className={styles.observances} aria-label={t('calendar.page.nextObservances')}>
        <div className={styles.observanceCarousel}>
          <button
            type="button"
            className={styles.carouselBtn}
            aria-label="Previous calendar cards"
            onClick={() => scrollCards(-1)}
          >
            ‹
          </button>
          <div ref={trackRef} className={styles.observanceTrack} tabIndex={0}>
            {cardsLoading ? (
              <p className={styles.cardsStatus} role="status">
                …
              </p>
            ) : cardsError ? (
              <p className={styles.cardsStatus} role="alert">
                {cardsError}
              </p>
            ) : calendarCards.length === 0 ? (
              <p className={styles.cardsStatus}>
                No featured calendar cards yet. Add curated cards under Calendar → Calendar Cards.
              </p>
            ) : (
              calendarCards.map((card) => {
                const visualKind = visualKindFromType(card.type)
                const summary = resolveCardSummary(card, locale)
                const category = cardCategoryBadge(card)
                const seeMoreLabel = card.learnMoreLabel || t('calendar.page.seeMore')
                return (
                  <article
                    key={card.id}
                    className={`${styles.observanceCard} ${styles[`kind_${visualKind}`]}`}
                  >
                    <figure className={styles.observanceMedia} aria-hidden>
                      <CalendarImage
                        src={card.imageUrl || calendarImageManifest.anchors.todayInChurch}
                        fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                        alt={card.imageAlt || t('calendar.page.observanceImage', { title: card.title })}
                        className={styles.observanceImage}
                        objectFit="cover"
                        objectPosition={card.objectPosition}
                        fetchPriority="low"
                        sizes="(max-width: 820px) 86vw, 19rem"
                      />
                    </figure>
                    <div className={styles.observanceBody}>
                      <p className={styles.observanceType}>{category}</p>
                      <h2 className={styles.observanceTitle}>{card.title}</h2>
                      {card.titleAmharic ? (
                        <p className={styles.observanceTitleAm} lang="am">
                          {card.titleAmharic}
                        </p>
                      ) : null}
                      <p className={styles.observanceDate}>{card.gregorianLabel}</p>
                      <p className={styles.observanceDateSecondary}>{card.ethiopianLabel}</p>
                      {summary ? <p className={styles.observanceSummary}>{summary}</p> : null}
                      <div className={styles.cardActions}>
                        <button
                          type="button"
                          className={styles.openDayBtn}
                          onClick={() => setWhyCard(card)}
                        >
                          {seeMoreLabel}
                        </button>
                        <button
                          type="button"
                          className={styles.whyDayBtn}
                          onClick={() => openCalendarCard(card)}
                        >
                          {t('calendar.page.openDate')}
                        </button>
                      </div>
                    </div>
                  </article>
                )
              })
            )}
          </div>
          <button
            type="button"
            className={styles.carouselBtn}
            aria-label="Next calendar cards"
            onClick={() => scrollCards(1)}
          >
            ›
          </button>
        </div>
      </section>

      <CalendarCardWhyModal
        open={Boolean(whyCard)}
        card={whyCard}
        onClose={() => setWhyCard(null)}
        onOpenDate={openCalendarCard}
      />

      <section className={styles.calendarOnly} aria-label={t('calendar.page.grid')}>
        <div className={styles.calendarActionsWrap}>
          <div className={styles.calendarActions}>
            <button type="button" className={styles.jumpTodayBtn} onClick={jumpToday}>
              {t('calendar.navigation.jumpToToday')}
            </button>
          </div>
        </div>
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
        <section ref={detailRef} className={styles.dayDetail} aria-live="polite">
          {!selectedDate ? (
            <p className={styles.emptyDetail}>{t('calendar.page.selectDay')}</p>
          ) : (
            <TodayInChurchPanel
              context={dayContext}
              loading={dayLoading}
              error={dayError}
              onRetry={() => {
                if (selectedDate) {
                  const cacheKey = `${selectedDate.getFullYear()}-${String(selectedDate.getMonth() + 1).padStart(2, '0')}-${String(selectedDate.getDate()).padStart(2, '0')}`
                  dayContextCacheRef.current.delete(cacheKey)
                }
                setDayReloadTick((n) => n + 1)
              }}
            />
          )}
        </section>
      </section>
    </PageSection>
  )
}
