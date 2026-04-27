import { useMemo, useRef, useState } from 'react'
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
  getSynaxariumEntryForGregorianDate,
  hasDetailedSynaxariumEntry,
} from '../lib/synaxarium'
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
  const selectedSynaxarium = useMemo(
    () => (selectedDate ? getSynaxariumEntryForGregorianDate(selectedDate) : null),
    [selectedDate],
  )
  const hasDetailedSynaxarium = hasDetailedSynaxariumEntry(selectedSynaxarium)
  const selectedModel = useMemo(
    () =>
      selectedDate
        ? buildSelectedDayObservanceModel(selectedEntries)
        : null,
    [selectedDate, selectedEntries],
  )
  const selectedPrimary = selectedModel?.primary ?? null
  const selectedStory = selectedModel?.primaryStory ?? null
  const selectedMonthlyRows = selectedModel
    ? selectedModel.sortedRows.filter((row) => row.entry.date.kind === 'monthly-recurring')
    : []
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
                    alt={`${item.title} observance image`}
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
          onSelectDay={selectCalendarDay}
          onPrevMonth={goPrevMonth}
          onNextMonth={goNextMonth}
        />
        <section ref={detailRef} className={styles.dayDetail} aria-live="polite">
          {!selectedDate || !selectedSnapshot ? (
            <p className={styles.emptyDetail}>Select a day to view observance details.</p>
          ) : selectedPrimary ? (
            <>
              {selectedSynaxarium ? (
                <article className={styles.synaxariumCard}>
                  <div className={styles.synaxariumHead}>
                    <p className={styles.synaxariumDate}>
                      <span>{selectedSnapshot.gregorian.labelLong}</span>
                      <span aria-hidden> / </span>
                      <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
                    </p>
                    <span className={styles.synaxariumBadge}>
                      {selectedSynaxarium.importanceLevel} {selectedSynaxarium.type}
                    </span>
                  </div>
                  <h2 className={styles.synaxariumTitle}>
                    {hasDetailedSynaxarium
                      ? selectedSynaxarium.title
                      : `Synaxarium Reading for ${selectedSynaxarium.ethiopianMonth} ${selectedSynaxarium.ethiopianDay}`}
                  </h2>
                  <p className={styles.synaxariumSummary}>
                    {hasDetailedSynaxarium
                      ? selectedSynaxarium.shortSummary
                      : 'Synaxarium details for this date are being prepared.'}
                  </p>
                  {hasDetailedSynaxarium && selectedSynaxarium.mainCommemorations.length > 0 ? (
                    <div className={styles.synaxariumBlock}>
                      <h3 className={styles.synaxariumBlockTitle}>Commemorations</h3>
                      <ul className={styles.synaxariumList}>
                        {selectedSynaxarium.mainCommemorations.slice(0, 5).map((line, index) => (
                          <li key={`${selectedSynaxarium.id}-commemoration-${index}`}>
                            {line}
                          </li>
                        ))}
                      </ul>
                    </div>
                  ) : null}
                  {hasDetailedSynaxarium ? (
                    <details className={styles.synaxariumMore}>
                      <summary>Read more</summary>
                      {selectedSynaxarium.readMore ? <p>{selectedSynaxarium.readMore}</p> : null}
                      {selectedSynaxarium.scriptureReferences.length > 0 ? (
                        <p>
                          <span className={styles.synaxariumMetaLabel}>Scripture: </span>
                          {selectedSynaxarium.scriptureReferences.join(', ')}
                        </p>
                      ) : null}
                    </details>
                  ) : null}
                  {hasDetailedSynaxarium ? (
                    <p className={styles.synaxariumSource}>
                      Source: {selectedSynaxarium.sourceTitle}
                      {selectedSynaxarium.sourcePage
                        ? `, PDF page ${selectedSynaxarium.sourcePage}`
                        : ''}
                      {` (${selectedSynaxarium.sourceDateHeading})`}
                    </p>
                  ) : null}
                </article>
              ) : null}
              <figure className={styles.dayDetailMedia} aria-hidden>
                <CalendarImage
                  src={
                    resolveEventImageById(selectedPrimary.entry.id) ??
                    calendarImageManifest.anchors.todayInChurch
                  }
                  fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                  alt={`${selectedPrimary.entry.englishTitle?.trim() || selectedPrimary.entry.title} observance image`}
                  className={styles.dayDetailImage}
                  objectFit={selectedImagePresentation.objectFit}
                  objectPosition={selectedImagePresentation.objectPosition}
                  fetchPriority="low"
                  sizes="(max-width: 820px) 92vw, 20rem"
                />
              </figure>
              <div className={styles.dayDetailHead}>
                <p className={styles.dayDetailType}>Today's Feast or Commemoration</p>
                <h2 className={styles.dayDetailTitle}>
                  {selectedPrimary.entry.englishTitle?.trim() || selectedPrimary.entry.title}
                </h2>
                <p className={styles.dayDetailDates}>
                  <span>{selectedSnapshot.gregorian.labelLong}</span>
                  <span aria-hidden> / </span>
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
              {selectedMonthlyRows.length > 0 ? (
                <section className={styles.dayDetailSection}>
                  <h3 className={styles.dayDetailSectionTitle}>Monthly Commemorations</h3>
                  <ul className={styles.dayDetailList}>
                    {selectedMonthlyRows.map((row) => (
                      <li key={row.entry.id}>
                        <span>{row.entry.englishTitle?.trim() || row.entry.title}</span>
                        <small>{row.entry.summary.short}</small>
                      </li>
                    ))}
                  </ul>
                </section>
              ) : null}
            </>
          ) : (
            <>
              {selectedSynaxarium ? (
                <article className={styles.synaxariumCard}>
                  <div className={styles.synaxariumHead}>
                    <p className={styles.synaxariumDate}>
                      <span>{selectedSnapshot.gregorian.labelLong}</span>
                      <span aria-hidden> / </span>
                      <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
                    </p>
                    <span className={styles.synaxariumBadge}>
                      {selectedSynaxarium.importanceLevel} {selectedSynaxarium.type}
                    </span>
                  </div>
                  <h2 className={styles.synaxariumTitle}>
                    {hasDetailedSynaxarium
                      ? selectedSynaxarium.title
                      : `Synaxarium Reading for ${selectedSynaxarium.ethiopianMonth} ${selectedSynaxarium.ethiopianDay}`}
                  </h2>
                  <p className={styles.synaxariumSummary}>
                    {hasDetailedSynaxarium
                      ? selectedSynaxarium.shortSummary
                      : 'Synaxarium details for this date are being prepared.'}
                  </p>
                  {hasDetailedSynaxarium && selectedSynaxarium.mainCommemorations.length > 0 ? (
                    <div className={styles.synaxariumBlock}>
                      <h3 className={styles.synaxariumBlockTitle}>Commemorations</h3>
                      <ul className={styles.synaxariumList}>
                        {selectedSynaxarium.mainCommemorations.slice(0, 5).map((line, index) => (
                          <li key={`${selectedSynaxarium.id}-commemoration-${index}`}>
                            {line}
                          </li>
                        ))}
                      </ul>
                    </div>
                  ) : null}
                  {hasDetailedSynaxarium ? (
                    <details className={styles.synaxariumMore}>
                      <summary>Read more</summary>
                      {selectedSynaxarium.readMore ? <p>{selectedSynaxarium.readMore}</p> : null}
                      {selectedSynaxarium.scriptureReferences.length > 0 ? (
                        <p>
                          <span className={styles.synaxariumMetaLabel}>Scripture: </span>
                          {selectedSynaxarium.scriptureReferences.join(', ')}
                        </p>
                      ) : null}
                    </details>
                  ) : null}
                  {hasDetailedSynaxarium ? (
                    <p className={styles.synaxariumSource}>
                      Source: {selectedSynaxarium.sourceTitle}
                      {selectedSynaxarium.sourcePage
                        ? `, PDF page ${selectedSynaxarium.sourcePage}`
                        : ''}
                      {` (${selectedSynaxarium.sourceDateHeading})`}
                    </p>
                  ) : null}
                </article>
              ) : null}
              {!hasDetailedSynaxarium ? (
                <div className={styles.dayDetailHead}>
              <p className={styles.dayDetailType}>Regular Day</p>
              <h2 className={styles.dayDetailTitle}>No major observance listed</h2>
              <p className={styles.dayDetailDates}>
                <span>{selectedSnapshot.gregorian.labelLong}</span>
                <span aria-hidden> / </span>
                <span lang="am">{selectedSnapshot.ethiopian.labelLong}</span>
              </p>
              <p className={styles.dayDetailSummary}>
                Regular day in the liturgical calendar. Continue with daily prayer and remembrance.
              </p>
                </div>
              ) : null}
            </>
          )}
        </section>
      </section>
    </PageSection>
  )
}
