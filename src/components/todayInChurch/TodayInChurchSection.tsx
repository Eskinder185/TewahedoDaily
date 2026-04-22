import { useCallback, useLayoutEffect, useMemo, useRef, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../ui/PageSection'
import { TabPanel } from '../ui/TabPanel'
import { CalendarDayDetailModal } from '../calendar/CalendarDayDetailModal'
import { SelectedChurchDayPanel } from '../calendar/SelectedChurchDayPanel'
import { CalendarImage } from '../calendar/CalendarImage'
import { useHomeToday } from '../../hooks/useHomeToday'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { buildChurchDaySnapshot, computeCalendarDayMarks } from '../../lib/churchCalendar'
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
import { scrollElementNodeIntoView } from '../../lib/scrollUtils'
import { parseGregorianAnchorIso } from '../../lib/churchCalendar/upcomingObservanceDisplay'
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
  const selectedDayAnchorRef = useRef<HTMLDivElement>(null)
  const [searchParams, setSearchParams] = useSearchParams()

  /** Deep link from observance gallery: `?calDay=YYYY-MM-DD&calFocus=entry-id` */
  useLayoutEffect(() => {
    if (!embeddedOnCalendarPage) return
    const calDay = searchParams.get('calDay')
    if (!calDay) return
    const parsed = parseGregorianAnchorIso(calDay)
    if (!parsed) return
    const y = parsed.getFullYear()
    const m = parsed.getMonth()
    const d = parsed.getDate()
    setViewYear(y)
    setViewMonth(m)
    setSelectedDay(d)
    setDetailDate(new Date(y, m, d))
    const calFocus = searchParams.get('calFocus')
    setObservanceFocusId(calFocus)
    const next = new URLSearchParams(searchParams)
    next.delete('calDay')
    next.delete('calFocus')
    setSearchParams(next, { replace: true })
  }, [embeddedOnCalendarPage, searchParams, setSearchParams])

  const dayMarkMap = useMemo(
    () => computeCalendarDayMarks(viewYear, viewMonth),
    [viewYear, viewMonth],
  )

  const openDay = useCallback(
    (day: number) => {
      setSelectedDay(day)
      setDetailDate(new Date(viewYear, viewMonth, day))
      setObservanceFocusId(null)
    },
    [viewYear, viewMonth],
  )

  useLayoutEffect(() => {
    if (!embeddedOnCalendarPage || !detailDate) return
    scrollElementNodeIntoView(selectedDayAnchorRef.current, {
      smooth: false,
      block: 'start',
      flush: true,
    })
  }, [detailDate, embeddedOnCalendarPage, selectedDay, viewMonth, viewYear])

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

  const selectionLiveMessage = useMemo(() => {
    if (!detailDate) return ''
    const snap = buildChurchDaySnapshot(detailDate)
    return `${t('calendarSelectionAnnounce')}: ${snap.gregorian.labelLong}. ${snap.commemoration.title}.`
  }, [detailDate, t])

  const reflectionImage = resolveSeasonSupportImage(
    coachSnapshot.season.id,
    coachSnapshot.fasting.seasonalFast,
  )
  const monthImage = resolveMonthlyImage(snapshot.ethiopian.month)

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
                width={1600}
                height={880}
                sizes="(max-width: 720px) 100vw, 40vw"
                loading="lazy"
                decoding="async"
                fetchPriority="low"
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
                width={880}
                height={550}
                sizes="(max-width: 600px) 44vw, 220px"
                loading="lazy"
                decoding="async"
                fetchPriority="low"
              />
            </figure>
          ) : null}
        </div>
      </header>

      <div
        className={`${styles.shell} ${embeddedOnCalendarPage ? styles.shellCalendarMobile : ''}`.trim()}
      >
        <div className={styles.calendarColumn}>
          <div className={styles.calendarFrame}>
            <MiniMonthCalendar
              anchor={now}
              displayYear={viewYear}
              displayMonthIndex={viewMonth}
              dayMarks={dayMarkMap}
              selectedDay={selectedDay}
              onSelectDay={openDay}
              onPrevMonth={goPrevMonth}
              onNextMonth={goNextMonth}
            />
          </div>
          {detailDate ? (
            <p className={styles.srOnly} aria-live="polite" aria-atomic="true">
              {selectionLiveMessage}
            </p>
          ) : null}
        </div>

        <div className={styles.mainColumn}>
          {embeddedOnCalendarPage && detailDate ? (
            <>
              <div
                ref={selectedDayAnchorRef}
                id="calendar-selected-day"
                className={styles.selectedDayAnchor}
              >
                <SelectedChurchDayPanel
                  key={detailDate.toDateString()}
                  calendarPageLayout
                  date={detailDate}
                  today={now}
                  onPrevDay={() => shiftDetailDay(-1)}
                  onNextDay={() => shiftDetailDay(1)}
                />
              </div>
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
                      fetchPriority="low"
                      sizes="(max-width: 720px) 100vw, min(40rem, 75vw)"
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
    return (
      <div
        className={`${styles.embedded} ${embeddedOnCalendarPage ? styles.embeddedCalendarPage : ''}`.trim()}
      >
        {body}
      </div>
    )
  }

  return <PageSection id="today">{body}</PageSection>
}
