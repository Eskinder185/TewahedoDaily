import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { CalendarEventCard } from './CalendarEventCard'
import type { CalendarDayGroup } from '../../lib/calendar/getCalendarEventsForDate'
import { filterRepeatedSeasonsForTimeline } from '../../lib/calendar/getCalendarEventsForDate'
import type { PresentableCalendarEvent } from '../../lib/calendar/calendarPresentation'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import { sameLocalCalendarDay, toIsoLocalDate } from '../../lib/churchCalendar/pascha'
import styles from './CalendarDateTimeline.module.css'

export type CalendarDateTimelineProps = {
  groups: CalendarDayGroup[]
  selectedDate: Date
  today: Date
  lang?: CalendarLocaleMode
  loading?: boolean
  onSelectDate: (date: Date) => void
  onOpenEvent: (event: PresentableCalendarEvent, date: Date) => void
  onLoadEarlier: () => void
  onLoadLater: () => void
  canLoadEarlier?: boolean
  canLoadLater?: boolean
}

export function CalendarDateTimeline({
  groups,
  selectedDate,
  today,
  lang = 'en',
  loading = false,
  onSelectDate,
  onOpenEvent,
  onLoadEarlier,
  onLoadLater,
  canLoadEarlier = true,
  canLoadLater = true,
}: CalendarDateTimelineProps) {
  const scrollerRef = useRef<HTMLDivElement>(null)
  const edgeLockRef = useRef(false)
  const selectedIso = toIsoLocalDate(selectedDate)
  const todayIso = toIsoLocalDate(today)
  const lastAnchoredIso = useRef<string | null>(null)
  const [showLeftFade, setShowLeftFade] = useState(false)
  const [showRightFade, setShowRightFade] = useState(false)

  /** Skip empty dates so the row fills with real events only. */
  const visibleGroups = useMemo(() => {
    const filtered = filterRepeatedSeasonsForTimeline(groups, selectedIso)
    return filtered.filter((group) => group.events.length > 0)
  }, [groups, selectedIso])

  const updateFades = useCallback(() => {
    const el = scrollerRef.current
    if (!el) {
      setShowLeftFade(false)
      setShowRightFade(false)
      return
    }
    const max = el.scrollWidth - el.clientWidth
    setShowLeftFade(el.scrollLeft > 8)
    setShowRightFade(max > 8 && el.scrollLeft < max - 8)
  }, [])

  /** Keep selected date near the LEFT so future cards fill available width. */
  const scrollSelectedIntoView = useCallback(
    (behavior: ScrollBehavior = 'smooth') => {
      const scroller = scrollerRef.current
      if (!scroller) return
      let target = scroller.querySelector<HTMLElement>(`[data-date-iso="${selectedIso}"]`)
      // If selected day has no events, anchor to the first later day group.
      if (!target) {
        const later = visibleGroups.find((g) => g.iso >= selectedIso)
        if (later) {
          target = scroller.querySelector<HTMLElement>(`[data-date-iso="${later.iso}"]`)
        } else if (visibleGroups.length) {
          target = scroller.querySelector<HTMLElement>(
            `[data-date-iso="${visibleGroups[visibleGroups.length - 1].iso}"]`,
          )
        }
      }
      if (!target) {
        updateFades()
        return
      }
      const scrollerRect = scroller.getBoundingClientRect()
      const targetRect = target.getBoundingClientRect()
      const leftPad = 4
      const offset = targetRect.left - scrollerRect.left - leftPad
      if (Math.abs(offset) > 2) {
        scroller.scrollBy({ left: offset, behavior })
      }
      window.requestAnimationFrame(updateFades)
    },
    [selectedIso, updateFades, visibleGroups],
  )

  useEffect(() => {
    if (visibleGroups.length === 0) return
    const behavior: ScrollBehavior = lastAnchoredIso.current == null ? 'auto' : 'smooth'
    lastAnchoredIso.current = selectedIso
    const id = window.requestAnimationFrame(() => scrollSelectedIntoView(behavior))
    return () => window.cancelAnimationFrame(id)
  }, [selectedIso, visibleGroups.length, scrollSelectedIntoView])

  useEffect(() => {
    updateFades()
  }, [visibleGroups, updateFades])

  const maybeLoadAtEdge = useCallback(() => {
    const el = scrollerRef.current
    if (!el || edgeLockRef.current) return
    updateFades()
    const max = el.scrollWidth - el.clientWidth
    if (el.scrollLeft <= 24 && canLoadEarlier) {
      edgeLockRef.current = true
      onLoadEarlier()
      window.setTimeout(() => {
        edgeLockRef.current = false
      }, 500)
    } else if (el.scrollLeft >= max - 24 && canLoadLater) {
      edgeLockRef.current = true
      onLoadLater()
      window.setTimeout(() => {
        edgeLockRef.current = false
      }, 500)
    }
  }, [onLoadEarlier, onLoadLater, canLoadEarlier, canLoadLater, updateFades])

  const scrollByPage = (dir: -1 | 1) => {
    const el = scrollerRef.current
    if (!el) return
    const amount = Math.max(300, Math.round(el.clientWidth * 0.85))
    el.scrollBy({ left: dir * amount, behavior: 'smooth' })
    window.setTimeout(() => {
      updateFades()
      maybeLoadAtEdge()
    }, 320)
  }

  if (loading && visibleGroups.length === 0) {
    return (
      <div className={styles.root} aria-busy="true">
        <div className={styles.skeletonRow} role="status">
          Loading calendar days…
        </div>
      </div>
    )
  }

  if (!loading && visibleGroups.length === 0) {
    return (
      <div className={styles.root}>
        <p className={styles.emptyTimeline}>No calendar observances in this date window.</p>
      </div>
    )
  }

  return (
    <div className={styles.root}>
      <button
        type="button"
        className={styles.arrow}
        aria-label="Show earlier calendar events"
        disabled={!canLoadEarlier}
        onClick={() => {
          onLoadEarlier()
          scrollByPage(-1)
        }}
      >
        ←
      </button>

      <div
        className={[
          styles.scrollerWrap,
          showLeftFade ? styles.showLeftFade : '',
          showRightFade ? styles.showRightFade : '',
        ]
          .filter(Boolean)
          .join(' ')}
      >
        <div
          ref={scrollerRef}
          className={styles.scroller}
          onScroll={maybeLoadAtEdge}
          role="list"
          aria-label="Calendar events timeline"
        >
          {visibleGroups.map((group) => {
            const isSelected = group.iso === selectedIso
            const isToday = group.iso === todayIso
            return (
              <section
                key={group.iso}
                data-date-iso={group.iso}
                className={[
                  styles.dayGroup,
                  isSelected ? styles.dayGroupSelected : '',
                  isToday ? styles.dayGroupToday : '',
                ]
                  .filter(Boolean)
                  .join(' ')}
                role="listitem"
              >
                <button
                  type="button"
                  className={styles.dayHeader}
                  onClick={() => onSelectDate(group.date)}
                  aria-current={isSelected ? 'date' : undefined}
                  aria-label={`${isToday ? 'Today, ' : ''}${group.gregorianAria}, ${group.ethiopianLabel}${
                    isSelected ? ', selected' : ''
                  }. Select this date.`}
                >
                  {isToday ? <span className={styles.todayBadge}>Today</span> : null}
                  {isSelected && !isToday ? (
                    <span className={styles.selectedBadge}>Selected</span>
                  ) : null}
                  <span className={styles.dayGregorian}>{group.gregorianShort}</span>
                  <span className={styles.dayEthiopian}>{group.ethiopianLabel}</span>
                </button>

                <div className={styles.dayCards}>
                  {group.events.map((event) => (
                    <CalendarEventCard
                      key={
                        event.occurrenceKey ||
                        `${group.iso}-${event.kind}-${event.sourceId || event.id}-${event.cardId || 'nocard'}`
                      }
                      event={event}
                      dateLabel={`${group.gregorianShort} · ${group.ethiopianLabel}`}
                      lang={lang}
                      variant="timeline"
                      selected={isSelected}
                      onOpen={(ev) => {
                        if (!sameLocalCalendarDay(group.date, selectedDate)) {
                          onSelectDate(group.date)
                        }
                        onOpenEvent(ev, group.date)
                      }}
                    />
                  ))}
                </div>
              </section>
            )
          })}
        </div>
      </div>

      <button
        type="button"
        className={styles.arrow}
        aria-label="Show later calendar events"
        disabled={!canLoadLater}
        onClick={() => {
          onLoadLater()
          scrollByPage(1)
        }}
      >
        →
      </button>
    </div>
  )
}
