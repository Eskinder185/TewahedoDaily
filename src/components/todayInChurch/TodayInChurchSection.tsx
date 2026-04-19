import { useCallback, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../ui/PageSection'
import { TabPanel } from '../ui/TabPanel'
import { CalendarDayDetailModal } from '../calendar/CalendarDayDetailModal'
import { SelectedChurchDayPanel } from '../calendar/SelectedChurchDayPanel'
import { CalendarImage } from '../calendar/CalendarImage'
import { useHomeToday } from '../../hooks/useHomeToday'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { buildChurchDaySnapshot } from '../../lib/churchCalendar'
import type { UpcomingObservance } from '../../lib/churchCalendar'
import {
  calendarImageManifest,
  resolveMonthlyImage,
  resolveSeasonSupportImage,
} from '../../content/calendarImageManifest'
import { ChurchDateCluster } from './ChurchDateCluster'
import { ChurchCommemorationCard } from './ChurchCommemorationCard'
import { ChurchSeasonFastingPanel } from './ChurchSeasonFastingPanel'
import { MiniMonthCalendar } from './MiniMonthCalendar'
import { UpcomingObservancesStrip } from './UpcomingObservancesStrip'
import styles from './TodayInChurchSection.module.css'

type Props = {
  /** When true, omit outer PageSection (e.g. Calendar route wraps its own). */
  embedded?: boolean
  /** Rich “Today in the Church” layout for `/calendar` — selected day is primary. */
  embeddedOnCalendarPage?: boolean
}

export function TodayInChurchSection({
  embedded = false,
  embeddedOnCalendarPage = false,
}: Props) {
  const t = useUiLabel()
  const { now, snapshot } = useHomeToday()
  const { commemoration, season, fasting, upcoming, miniCalendar } = snapshot

  const [viewYear, setViewYear] = useState(miniCalendar.year)
  const [viewMonth, setViewMonth] = useState(miniCalendar.monthIndex)
  const [selectedDay, setSelectedDay] = useState<number | null>(() =>
    embeddedOnCalendarPage ? now.getDate() : null,
  )
  const [detailDate, setDetailDate] = useState<Date | null>(() =>
    embeddedOnCalendarPage
      ? new Date(now.getFullYear(), now.getMonth(), now.getDate())
      : null,
  )
  const [observanceFocusId, setObservanceFocusId] = useState<string | null>(null)

  const markedForView = useMemo(() => {
    if (viewYear !== miniCalendar.year || viewMonth !== miniCalendar.monthIndex) {
      return []
    }
    return miniCalendar.markedDays
  }, [viewYear, viewMonth, miniCalendar])

  const openDay = useCallback(
    (day: number) => {
      setSelectedDay(day)
      setDetailDate(new Date(viewYear, viewMonth, day))
      setObservanceFocusId(null)
    },
    [viewYear, viewMonth],
  )

  const goPrevMonth = useCallback(() => {
    const d = new Date(viewYear, viewMonth - 1, 1)
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    if (embeddedOnCalendarPage) {
      setSelectedDay(1)
      setDetailDate(new Date(d.getFullYear(), d.getMonth(), 1))
    } else {
      setSelectedDay(null)
      setDetailDate(null)
    }
    setObservanceFocusId(null)
  }, [viewYear, viewMonth, embeddedOnCalendarPage])

  const goNextMonth = useCallback(() => {
    const d = new Date(viewYear, viewMonth + 1, 1)
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    if (embeddedOnCalendarPage) {
      setSelectedDay(1)
      setDetailDate(new Date(d.getFullYear(), d.getMonth(), 1))
    } else {
      setSelectedDay(null)
      setDetailDate(null)
    }
    setObservanceFocusId(null)
  }, [viewYear, viewMonth, embeddedOnCalendarPage])

  const jumpToday = useCallback(() => {
    const y = now.getFullYear()
    const m = now.getMonth()
    const d = now.getDate()
    setViewYear(y)
    setViewMonth(m)
    setSelectedDay(d)
    setDetailDate(new Date(y, m, d))
    setObservanceFocusId(null)
  }, [now])

  const shiftDetailDay = useCallback(
    (delta: number) => {
      if (!detailDate) return
      const next = new Date(detailDate)
      next.setDate(next.getDate() + delta)
      setDetailDate(next)
      setViewYear(next.getFullYear())
      setViewMonth(next.getMonth())
      setSelectedDay(next.getDate())
      setObservanceFocusId(null)
    },
    [detailDate],
  )

  const onPickObservance = useCallback((item: UpcomingObservance) => {
    if (!item.gregorianAnchorIso) return
    const parts = item.gregorianAnchorIso.split('-').map(Number)
    if (parts.length !== 3 || parts.some((n) => Number.isNaN(n))) return
    const [y, m, d] = parts
    const dt = new Date(y, m - 1, d)
    setViewYear(y)
    setViewMonth(m - 1)
    setSelectedDay(d)
    setDetailDate(dt)
    setObservanceFocusId(item.id)
  }, [])

  const coachSnapshot = useMemo(
    () =>
      embeddedOnCalendarPage && detailDate
        ? buildChurchDaySnapshot(detailDate)
        : snapshot,
    [embeddedOnCalendarPage, detailDate, snapshot],
  )

  const reflectionImage = resolveSeasonSupportImage(
    coachSnapshot.season.id,
    coachSnapshot.fasting.seasonalFast,
  )
  const monthImage = resolveMonthlyImage(snapshot.ethiopian.month)

  const monthRhythmImage = useMemo(() => {
    const probe = new Date(viewYear, viewMonth, 12)
    const ethMonth = buildChurchDaySnapshot(probe).ethiopian.month
    return resolveMonthlyImage(ethMonth)
  }, [viewYear, viewMonth])

  const dashboardTabs = useMemo(
    () => [
      {
        id: 'today',
        label: t('todayTabAtAGlance'),
        content: (
          <div className={styles.todayTab}>
            <ChurchDateCluster snapshot={snapshot} />
            <ChurchCommemorationCard commemoration={commemoration} />
          </div>
        ),
      },
      {
        id: 'season',
        label: t('todayTabSeason'),
        content: (
          <ChurchSeasonFastingPanel season={season} fasting={fasting} />
        ),
      },
      {
        id: 'reflection',
        label: t('todayTabPastoral'),
        content: (
          <div className={styles.expanded}>
            <figure className={styles.reflectionImageWrap}>
              <img
                src={reflectionImage}
                alt=""
                className={styles.reflectionImage}
                loading="lazy"
                decoding="async"
              />
            </figure>
            <p className={styles.expandedP}>{commemoration.whyTodayLong}</p>
          </div>
        ),
      },
    ],
    [t, snapshot, commemoration, season, fasting, reflectionImage],
  )

  const body = (
    <>
      <header
        className={
          embeddedOnCalendarPage ? styles.introCompact : styles.intro
        }
      >
        <div className={styles.introText}>
          {embeddedOnCalendarPage ? (
            null
          ) : (
            <>
              <p className={styles.eyebrow}>Today in church</p>
              <h2 className={styles.title}>The day the Church is keeping</h2>
              <p className={styles.deck}>
                Calendar snapshot — tap a date in the mini month to explore that
                day, or open a section below.
              </p>
              <div className={styles.introLinks}>
                <Link to="/calendar" className={styles.pathJump}>
                  Open full calendar page →
                </Link>
                <Link to="/about" className={styles.pathJump}>
                  New here? Read about the site →
                </Link>
              </div>
            </>
          )}
        </div>
        <div className={styles.introActions}>
          {!embeddedOnCalendarPage ? (
            <button type="button" className={styles.todayBtn} onClick={jumpToday}>
              Jump to today
            </button>
          ) : null}
          {!embeddedOnCalendarPage ? (
            <figure className={styles.introFigure}>
              <img
                src={monthImage}
                alt=""
                className={styles.introFigureImg}
                loading="lazy"
                decoding="async"
              />
            </figure>
          ) : null}
        </div>
      </header>

      <div className={styles.shell}>
        <div className={styles.calendarColumn}>
          <div className={styles.calendarFrame}>
            <MiniMonthCalendar
              anchor={now}
              displayYear={viewYear}
              displayMonthIndex={viewMonth}
              markedDays={markedForView}
              selectedDay={selectedDay}
              onSelectDay={openDay}
              onPrevMonth={goPrevMonth}
              onNextMonth={goNextMonth}
            />
            {embeddedOnCalendarPage ? (
              <div className={styles.monthRhythm}>
                <p className={styles.monthRhythmLabel}>Month in the Ethiopian year</p>
                <figure className={styles.monthRhythmFigure}>
                  <CalendarImage
                    src={monthRhythmImage}
                    fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                    alt=""
                    className={styles.monthRhythmImg}
                  />
                </figure>
              </div>
            ) : null}
          </div>
        </div>

        <div className={styles.mainColumn}>
          {embeddedOnCalendarPage && detailDate ? (
            <>
              <SelectedChurchDayPanel
                date={detailDate}
                today={now}
                onPrevDay={() => shiftDetailDay(-1)}
                onNextDay={() => shiftDetailDay(1)}
              />
              <details className={styles.contextFold}>
                <summary className={styles.contextSummary}>Liturgical season &amp; fasting</summary>
                <div className={styles.contextBody}>
                  <ChurchSeasonFastingPanel
                    season={coachSnapshot.season}
                    fasting={coachSnapshot.fasting}
                  />
                </div>
              </details>
              <details className={styles.contextFold}>
                <summary className={styles.contextSummary}>Pastoral reflection</summary>
                <div className={styles.contextBody}>
                  <figure className={styles.reflectionImageWrap}>
                    <CalendarImage
                      src={reflectionImage}
                      fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                      alt=""
                      className={styles.reflectionImage}
                    />
                  </figure>
                  <p className={styles.expandedP}>{coachSnapshot.commemoration.whyTodayLong}</p>
                </div>
              </details>
            </>
          ) : (
            <TabPanel
              variant="compact"
              tablistAriaLabel={t('todayDashboardTabsAria')}
              tabs={dashboardTabs}
              initialId="today"
            />
          )}
        </div>
      </div>

      <UpcomingObservancesStrip
        items={upcoming}
        onActivate={onPickObservance}
        highlightedId={observanceFocusId}
      />

      <CalendarDayDetailModal
        open={detailDate !== null && !embeddedOnCalendarPage}
        onClose={() => setDetailDate(null)}
        date={detailDate}
        today={now}
      />
    </>
  )

  if (embedded) {
    return <div className={styles.embedded}>{body}</div>
  }

  return <PageSection id="today">{body}</PageSection>
}
