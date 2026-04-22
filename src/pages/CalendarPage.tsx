import { useMemo, useState } from 'react'
import { PageSection } from '../components/ui/PageSection'
import { MiniMonthCalendar } from '../components/todayInChurch/MiniMonthCalendar'
import { useHomeToday } from '../hooks/useHomeToday'
import type { UpcomingObservance } from '../lib/churchCalendar'
import { buildChurchDaySnapshot, computeCalendarDayMarks } from '../lib/churchCalendar'
import { buildSelectedDayObservanceModel, getEntriesForDate } from '../lib/eotcCalendar'
import {
  buildObservanceCardDates,
  parseGregorianAnchorIso,
  simpleObservanceKindLabel,
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

export function CalendarPage() {
  const { now, snapshot } = useHomeToday()
  const [viewYear, setViewYear] = useState(now.getFullYear())
  const [viewMonth, setViewMonth] = useState(now.getMonth())
  const [selectedDay, setSelectedDay] = useState<number | null>(now.getDate())

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
  const selectedModel = useMemo(
    () =>
      selectedDate
        ? buildSelectedDayObservanceModel(selectedEntries)
        : null,
    [selectedDate, selectedEntries],
  )
  const selectedPrimary = selectedModel?.primary ?? null
  const selectedStory = selectedModel?.primaryStory ?? null
  const selectedType = selectedPrimary
    ? selectedPrimary.entry.category.primary.replace(/-/g, ' ')
    : null
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

  const openObservanceInCalendar = (item: UpcomingObservance) => {
    if (!item.gregorianAnchorIso) return
    const d = parseGregorianAnchorIso(item.gregorianAnchorIso)
    if (!d) return
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(d.getDate())
  }

  return (
    <PageSection id="calendar" variant="tint" className={styles.page}>
      <section className={styles.observances} aria-label="Next observances">
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
                    alt=""
                    className={styles.observanceImage}
                    objectFit={imagePresentation.objectFit}
                    objectPosition={imagePresentation.objectPosition}
                    fetchPriority="low"
                    sizes="(max-width: 820px) 76vw, 18rem"
                  />
                </figure>
                <div className={styles.observanceBody}>
                  <p className={styles.observanceType}>
                    {simpleObservanceKindLabel(item.kind)}
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
                    Open date
                  </button>
                </div>
              </article>
            )
          })}
        </div>
      </section>

      <section className={styles.calendarOnly} aria-label="Calendar grid">
        <div className={styles.calendarActionsWrap}>
          <div className={styles.calendarActions}>
            <button type="button" className={styles.jumpTodayBtn} onClick={jumpToday}>
              Jump to today
            </button>
          </div>
        </div>
        <MiniMonthCalendar
          anchor={now}
          displayYear={viewYear}
          displayMonthIndex={viewMonth}
          dayMarks={marks}
          selectedDay={selectedDay}
          onSelectDay={setSelectedDay}
          onPrevMonth={goPrevMonth}
          onNextMonth={goNextMonth}
        />
        <section className={styles.dayDetail} aria-live="polite">
          {!selectedDate || !selectedSnapshot ? (
            <p className={styles.emptyDetail}>Select a day to view observance details.</p>
          ) : selectedPrimary ? (
            <>
              <figure className={styles.dayDetailMedia} aria-hidden>
                <CalendarImage
                  src={
                    resolveEventImageById(selectedPrimary.entry.id) ??
                    calendarImageManifest.anchors.todayInChurch
                  }
                  fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                  alt=""
                  className={styles.dayDetailImage}
                  objectFit={selectedImagePresentation.objectFit}
                  objectPosition={selectedImagePresentation.objectPosition}
                  fetchPriority="low"
                  sizes="(max-width: 820px) 92vw, 20rem"
                />
              </figure>
              <div className={styles.dayDetailHead}>
                <p className={styles.dayDetailType}>{selectedType ?? 'Observance'}</p>
                <h2 className={styles.dayDetailTitle}>
                  {selectedPrimary.entry.englishTitle?.trim() || selectedPrimary.entry.title}
                </h2>
                <p className={styles.dayDetailDates}>
                  <span>{selectedSnapshot.gregorian.labelLong}</span>
                  <span aria-hidden> · </span>
                  <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
                </p>
              </div>
              <p className={styles.dayDetailSummary}>
                {selectedStory?.short ||
                  selectedPrimary.entry.summary.short ||
                  selectedPrimary.entry.summary.panel ||
                  'Liturgical observance for this day.'}
              </p>
              {(selectedStory?.why || selectedStory?.connection) ? (
                <details className={styles.dayDetailMore}>
                  <summary>Read more</summary>
                  <div>
                    {selectedStory?.why ? <p>{selectedStory.why}</p> : null}
                    {selectedStory?.connection ? <p>{selectedStory.connection}</p> : null}
                  </div>
                </details>
              ) : null}
            </>
          ) : (
            <div className={styles.dayDetailHead}>
              <p className={styles.dayDetailType}>Regular Day</p>
              <h2 className={styles.dayDetailTitle}>No major observance listed</h2>
              <p className={styles.dayDetailDates}>
                <span>{selectedSnapshot.gregorian.labelLong}</span>
                <span aria-hidden> · </span>
                <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
              </p>
              <p className={styles.dayDetailSummary}>
                Regular day in the liturgical calendar. Continue with daily prayer and remembrance.
              </p>
            </div>
          )}
        </section>
      </section>
    </PageSection>
  )
}
