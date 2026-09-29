import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { PageSection } from '../components/ui/PageSection'
import { MiniMonthCalendar } from '../components/todayInChurch/MiniMonthCalendar'
import { LiturgyContextCard } from '../components/calendar/LiturgyContextCard'
import { useHomeToday } from '../hooks/useHomeToday'
import {
  buildChurchDaySnapshot,
  computeCalendarDayMarksAsync,
  type CalendarDayCellMark,
} from '../lib/churchCalendar'
import {
  buildSelectedDayObservanceModel,
  collectEotcMatchesForLocalDay,
} from '../lib/eotcCalendar'
import type { CalendarDayDetail, CalendarExpandedContent } from '../lib/calendarDayDetails/types'
import { resolveCalendarDayDetail } from '../lib/calendarDayDetails'
import { gregorianToEthiopian } from '../lib/ethiopianDate'
import {
  getCalendarCards,
  getSynaxariumDayWithCommemorations,
  type CalendarCard,
} from '../lib/synaxarium/synaxariumService'
import type { SynaxariumDayBundle } from '../lib/prayers/prayerLibraryTypes'
import { parseGregorianAnchorIso } from '../lib/churchCalendar/upcomingObservanceDisplay'
import { CalendarImage } from '../components/calendar/CalendarImage'
import {
  calendarImageManifest,
  resolveEventImageById,
  resolveEventImagePresentation,
} from '../content/calendarImageManifest'
import styles from './CalendarPage.module.css'

function ExpandedContentSections({
  content,
}: {
  content: CalendarExpandedContent
}) {
  const t = useTranslation()
  const source = content.source
  return (
    <div className={styles.expandedContent}>
      {content.whyCelebrated?.trim() ? (
        <section className={styles.expandedBlock}>
          <h3 className={styles.expandedHeading}>{t('calendar.detail.whyCelebrated')}</h3>
          <p>{content.whyCelebrated.trim()}</p>
        </section>
      ) : null}
      {content.whatHappened?.length ? (
        <section className={styles.expandedBlock}>
          <h3 className={styles.expandedHeading}>{t('calendar.detail.whatHappened')}</h3>
          <ul className={styles.expandedList}>
            {content.whatHappened.map((line, index) => (
              <li key={`${line}-${index}`}>{line}</li>
            ))}
          </ul>
        </section>
      ) : null}
      {content.significance?.trim() ? (
        <section className={styles.expandedBlock}>
          <h3 className={styles.expandedHeading}>{t('calendar.detail.whyMatters')}</h3>
          <p>{content.significance.trim()}</p>
        </section>
      ) : null}
      {source?.title ? (
        <p className={styles.expandedSource}>
          {t('calendar.detail.source', { title: source.title })}
          {source.entryLabel ? ` (${source.entryLabel})` : ''}
          {source.provenanceNote ? ` - ${source.provenanceNote}` : ''}
          {source.originalReference
            ? ` - ${t('calendar.detail.originalReference', { reference: source.originalReference })}`
            : ''}
        </p>
      ) : null}
    </div>
  )
}

function NormalizedDaySections({ detail }: { detail: CalendarDayDetail }) {
  const t = useTranslation()
  return (
    <>
      {detail.commemorations.length > 0 ? (
        <div className={styles.synaxariumBlock}>
          <h3 className={styles.synaxariumBlockTitle}>{t('calendar.detail.commemorations')}</h3>
          <ul className={styles.synaxariumList}>
            {detail.commemorations.map((item, index) => (
              <li key={`${detail.id}-commemoration-${index}`}>
                <strong>{item.title}</strong>
                {item.titleAmharic ? (
                  <>
                    {' '}
                    <span lang="am">({item.titleAmharic})</span>
                  </>
                ) : null}
                {item.category && item.category !== 'other' ? (
                  <span> · {item.category.replace(/[-_]+/g, ' ')}</span>
                ) : null}
                {item.summary ? <div>{item.summary}</div> : null}
                {item.expandedContent ? (
                  <details className={styles.synaxariumMore}>
                    <summary>{t('calendar.detail.readMore')}</summary>
                    <ExpandedContentSections content={item.expandedContent} />
                  </details>
                ) : null}
              </li>
            ))}
          </ul>
        </div>
      ) : null}
      {detail.expandedContent && detail.commemorations.every((item) => !item.expandedContent) ? (
        <details className={styles.synaxariumMore}>
          <summary>{t('calendar.detail.readMore')}</summary>
          <ExpandedContentSections content={detail.expandedContent} />
        </details>
      ) : null}
    </>
  )
}

function visualKindFromType(type: string): 'feast' | 'fast' | 'commemoration' {
  const t = type.toLowerCase()
  if (t.includes('feast') || t.includes('season')) return 'feast'
  if (t.includes('fast')) return 'fast'
  return 'commemoration'
}

export function CalendarPage() {
  const t = useTranslation()
  const { locale } = useLocale()
  const preferAmharic = locale === 'am'
  const { now } = useHomeToday()
  const [viewYear, setViewYear] = useState(now.getFullYear())
  const [viewMonth, setViewMonth] = useState(now.getMonth())
  const [selectedDay, setSelectedDay] = useState<number | null>(now.getDate())
  const [marks, setMarks] = useState<ReadonlyMap<number, CalendarDayCellMark>>(new Map())
  const [synaxariumBundle, setSynaxariumBundle] = useState<SynaxariumDayBundle | null>()
  const [synaxariumError, setSynaxariumError] = useState<string>()
  const [synaxReloadTick, setSynaxReloadTick] = useState(0)
  const [calendarCards, setCalendarCards] = useState<CalendarCard[]>([])
  const [cardsError, setCardsError] = useState<string>()
  const [cardsLoading, setCardsLoading] = useState(true)
  const detailRef = useRef<HTMLElement | null>(null)
  const trackRef = useRef<HTMLDivElement | null>(null)

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
    setSynaxariumBundle(undefined)
    setSynaxariumError(undefined)
    if (!selectedDate) {
      setSynaxariumBundle(null)
      return
    }
    const eth = gregorianToEthiopian(selectedDate)
    void getSynaxariumDayWithCommemorations(eth.month, eth.day)
      .then((bundle) => {
        if (!active) return
        setSynaxariumBundle(bundle)
      })
      .catch((cause) => {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : t('calendar.detail.synaxariumLoadError')
        if (import.meta.env.DEV) console.error('[calendar] synaxarium day', cause)
        setSynaxariumError(import.meta.env.DEV ? message : t('calendar.detail.synaxariumLoadError'))
        setSynaxariumBundle(null)
      })
    return () => {
      active = false
    }
  }, [selectedDate, synaxReloadTick, t])

  const selectedSnapshot = useMemo(
    () => (selectedDate ? buildChurchDaySnapshot(selectedDate) : null),
    [selectedDate],
  )
  const selectedEntries = useMemo(
    () => (selectedDate ? collectEotcMatchesForLocalDay(selectedDate) : []),
    [selectedDate],
  )
  const selectedDayDetail = useMemo(() => {
    if (!selectedDate || synaxariumBundle === undefined) return null
    return resolveCalendarDayDetail(selectedDate, selectedEntries, {
      synaxariumBundle,
      preferAmharic,
    })
  }, [selectedDate, selectedEntries, synaxariumBundle, preferAmharic])
  const selectedModel = useMemo(
    () => (selectedDate ? buildSelectedDayObservanceModel(selectedEntries) : null),
    [selectedDate, selectedEntries],
  )
  const selectedPrimary = selectedModel?.primary ?? null
  const selectedImagePresentation = resolveEventImagePresentation(selectedPrimary?.entry.id, {
    objectFit: 'cover',
    objectPosition: '50% 32%',
  })

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
                No featured calendar cards yet. Mark commemorations as Featured in the CMS.
              </p>
            ) : (
              calendarCards.map((card) => {
                const visualKind = visualKindFromType(card.type)
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
                      <p className={styles.observanceType}>{card.typeLabel}</p>
                      <h2 className={styles.observanceTitle}>{card.title}</h2>
                      <p className={styles.observanceDate}>{card.gregorianLabel}</p>
                      <p className={styles.observanceDateSecondary}>{card.ethiopianLabel}</p>
                      <button
                        type="button"
                        className={styles.openDayBtn}
                        onClick={() => openCalendarCard(card)}
                      >
                        {t('calendar.page.openDate')}
                      </button>
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
          {!selectedDate || !selectedSnapshot ? (
            <p className={styles.emptyDetail}>{t('calendar.page.selectDay')}</p>
          ) : synaxariumError ? (
            <div className={styles.dayDetailHead}>
              <h2 className={styles.dayDetailTitle}>{synaxariumError}</h2>
              <button
                type="button"
                className={styles.openDayBtn}
                onClick={() => setSynaxReloadTick((n) => n + 1)}
              >
                {t('calendar.detail.tryAgain')}
              </button>
            </div>
          ) : synaxariumBundle === undefined || !selectedDayDetail ? (
            <p className={styles.emptyDetail} role="status">
              …
            </p>
          ) : (
            <>
              {selectedDayDetail.imageUrl || selectedPrimary ? (
                <figure className={styles.dayDetailMedia} aria-hidden>
                  <CalendarImage
                    src={
                      selectedDayDetail.imageUrl ||
                      (selectedPrimary
                        ? resolveEventImageById(selectedPrimary.entry.id)
                        : null) ||
                      calendarImageManifest.anchors.todayInChurch
                    }
                    fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                    alt={
                      selectedDayDetail.imageAlt ||
                      t('calendar.page.observanceImage', { title: selectedDayDetail.title })
                    }
                    className={styles.dayDetailImage}
                    objectFit={selectedImagePresentation.objectFit}
                    objectPosition={selectedImagePresentation.objectPosition}
                    fetchPriority="low"
                    sizes="(max-width: 820px) 92vw, 20rem"
                  />
                </figure>
              ) : null}
              <article className={styles.synaxariumCard}>
                <div className={styles.synaxariumHead}>
                  <p className={styles.synaxariumDate}>
                    <span>{selectedSnapshot.gregorian.labelLong}</span>
                    <span aria-hidden> / </span>
                    <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
                  </p>
                  {selectedPrimary?.entry.display.calendarBadge?.trim() ? (
                    <span className={styles.synaxariumBadge}>
                      {selectedPrimary.entry.display.calendarBadge.trim()}
                    </span>
                  ) : null}
                </div>
                <h2 className={styles.synaxariumTitle}>{selectedDayDetail.title}</h2>
                {selectedDayDetail.shortDescription ? (
                  <p className={styles.synaxariumSummary}>{selectedDayDetail.shortDescription}</p>
                ) : null}
                <NormalizedDaySections detail={selectedDayDetail} />
                {selectedDayDetail.liturgyContext ? (
                  <LiturgyContextCard context={selectedDayDetail.liturgyContext} />
                ) : null}
              </article>
            </>
          )}
        </section>
      </section>
    </PageSection>
  )
}
