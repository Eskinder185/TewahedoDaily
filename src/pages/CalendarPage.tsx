import { useMemo, useRef, useState } from 'react'
import { useTranslation } from '../i18n'
import { PageSection } from '../components/ui/PageSection'
import { MiniMonthCalendar } from '../components/todayInChurch/MiniMonthCalendar'
import { LiturgyContextCard } from '../components/calendar/LiturgyContextCard'
import { useHomeToday } from '../hooks/useHomeToday'
import type { UpcomingObservance } from '../lib/churchCalendar'
import { buildChurchDaySnapshot, computeCalendarDayMarks } from '../lib/churchCalendar'
import {
  buildSelectedDayObservanceModel,
  getEntriesForDate,
} from '../lib/eotcCalendar'
import type { CalendarDayDetail, CalendarExpandedContent } from '../lib/calendarDayDetails/types'
import { resolveCalendarDayDetail } from '../lib/calendarDayDetails'
import {
  buildObservanceCardDates,
  parseGregorianAnchorIso,
  upcomingObservanceSortKey,
  upcomingObservanceVisualBucket,
} from '../lib/churchCalendar/upcomingObservanceDisplay'
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
  const commemorations = detail.commemorations
    .map((item) => item.title.trim())
    .filter(Boolean)
  return (
    <>
      {commemorations.length > 0 ? (
        <div className={styles.synaxariumBlock}>
          <h3 className={styles.synaxariumBlockTitle}>{t('calendar.detail.commemorations')}</h3>
          <ul className={styles.synaxariumList}>
            {commemorations.slice(0, 8).map((line, index) => (
              <li key={`${detail.id}-commemoration-${index}`}>{line}</li>
            ))}
          </ul>
        </div>
      ) : null}
      {detail.expandedContent ? (
        <details className={styles.synaxariumMore}>
          <summary>{t('calendar.detail.readMore')}</summary>
          <ExpandedContentSections content={detail.expandedContent} />
        </details>
      ) : null}
    </>
  )
}

export function CalendarPage() {
  const t = useTranslation()
  const { now, snapshot } = useHomeToday()
  const [viewYear, setViewYear] = useState(now.getFullYear())
  const [viewMonth, setViewMonth] = useState(now.getMonth())
  const [selectedDay, setSelectedDay] = useState<number | null>(now.getDate())
  const detailRef = useRef<HTMLElement | null>(null)

  const upcoming = useMemo(() => {
    const rows = snapshot.upcoming.filter((item) => Boolean(item.gregorianAnchorIso))
    return [...rows]
      .sort((a, b) => upcomingObservanceSortKey(a, false) - upcomingObservanceSortKey(b, false))
      .slice(0, 10)
  }, [snapshot.upcoming])

  const marks = useMemo(
    () => computeCalendarDayMarks(viewYear, viewMonth),
    [viewYear, viewMonth],
  )
  const selectedDate = useMemo(() => {
    if (selectedDay == null) return null
    return new Date(viewYear, viewMonth, selectedDay)
  }, [viewYear, viewMonth, selectedDay])

  const selectedSnapshot = useMemo(
    () => (selectedDate ? buildChurchDaySnapshot(selectedDate) : null),
    [selectedDate],
  )
  const selectedEntries = useMemo(
    () => (selectedDate ? getEntriesForDate(selectedDate) : []),
    [selectedDate],
  )
  const selectedDayDetail = useMemo(
    () => (selectedDate ? resolveCalendarDayDetail(selectedDate, selectedEntries) : null),
    [selectedDate, selectedEntries],
  )
  const selectedModel = useMemo(
    () =>
      selectedDate
        ? buildSelectedDayObservanceModel(selectedEntries)
        : null,
    [selectedDate, selectedEntries],
  )
  const selectedPrimary = selectedModel?.primary ?? null
  const selectedImagePresentation = resolveEventImagePresentation(
    selectedPrimary?.entry.id,
    {
      objectFit: 'cover',
      objectPosition: '50% 32%',
    },
  )

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

  const openObservanceInCalendar = (item: UpcomingObservance) => {
    if (!item.gregorianAnchorIso) return
    const d = parseGregorianAnchorIso(item.gregorianAnchorIso)
    if (!d) return
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(d.getDate())
  }
  const upcomingKindLabel = (kind: UpcomingObservance['kind']) => {
    switch (kind) {
      case 'feast':
        return t('calendar.upcoming.labelFeast')
      case 'season':
        return t('calendar.upcoming.labelSeason')
      case 'marian':
        return t('calendar.upcoming.labelMary')
      case 'fast':
      case 'weekly':
        return t('calendar.upcoming.labelFast')
      case 'angel':
        return t('calendar.upcoming.labelAngel')
      case 'saint':
      case 'commemoration':
      default:
        return t('calendar.upcoming.labelSaint')
    }
  }

  return (
    <PageSection id="calendar" variant="tint" className={styles.page}>
      <section className={styles.observances} aria-label={t('calendar.page.nextObservances')}>
        <div className={styles.observanceTrack}>
          {upcoming.map((item) => {
            const dates = buildObservanceCardDates(item)
            const visualKind = upcomingObservanceVisualBucket(item.kind)
            const imagePresentation = resolveEventImagePresentation(item.id, {
              objectFit: 'cover',
              objectPosition: '50% 28%',
            })
            return (
              <article
                key={item.id}
                className={`${styles.observanceCard} ${styles[`kind_${visualKind}`]}`}
              >
                <figure className={styles.observanceMedia} aria-hidden>
                  <CalendarImage
                    src={resolveEventImageById(item.id) ?? calendarImageManifest.anchors.todayInChurch}
                    fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                    alt={t('calendar.page.observanceImage', { title: item.title })}
                    className={styles.observanceImage}
                    objectFit={imagePresentation.objectFit}
                    objectPosition={imagePresentation.objectPosition}
                    fetchPriority="low"
                    sizes="(max-width: 820px) 76vw, 18rem"
                  />
                </figure>
                <div className={styles.observanceBody}>
                  <p className={styles.observanceType}>
                    {upcomingKindLabel(item.kind)}
                  </p>
                  <h2 className={styles.observanceTitle}>{item.title}</h2>
                  <p className={styles.observanceDate}>{dates.primary}</p>
                  {dates.secondary ? (
                    <p className={styles.observanceDateSecondary}>{dates.secondary}</p>
                  ) : null}
                  <button
                    type="button"
                    className={styles.openDayBtn}
                    onClick={() => openObservanceInCalendar(item)}
                  >
                    {t('calendar.page.openDate')}
                  </button>
                </div>
              </article>
            )
          })}
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
          ) : selectedDayDetail ? (
            <>
              {selectedPrimary ? (
                <figure className={styles.dayDetailMedia} aria-hidden>
                  <CalendarImage
                    src={
                      resolveEventImageById(selectedPrimary.entry.id) ??
                      calendarImageManifest.anchors.todayInChurch
                    }
                    fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                    alt={t('calendar.page.observanceImage', { title: selectedDayDetail.title })}
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
                  <p className={styles.synaxariumSummary}>
                    {selectedDayDetail.shortDescription}
                  </p>
                ) : null}
                <NormalizedDaySections detail={selectedDayDetail} />
              </article>
              {selectedDayDetail.liturgyContext ? (
                <LiturgyContextCard context={selectedDayDetail.liturgyContext} />
              ) : null}
              {selectedDayDetail.commemorations.length === 0 ? (
                <div className={styles.dayDetailHead}>
                  <p className={styles.dayDetailType}>Regular Day</p>
                  <h2 className={styles.dayDetailTitle}>{t('calendar.today.noMajorObservance')}</h2>
                  <p className={styles.dayDetailDates}>
                    <span>{selectedSnapshot.gregorian.labelLong}</span>
                    <span aria-hidden> / </span>
                    <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
                  </p>
                  <p className={styles.dayDetailSummary}>
                    {t('calendar.today.regularDaySummary')}
                  </p>
                </div>
              ) : null}
            </>
          ) : null}
        </section>
      </section>
    </PageSection>
  )
}
