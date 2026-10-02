import { useCallback, useEffect, useRef, useState } from 'react'
import { CalendarEventCard } from './CalendarEventCard'
import type { PresentableCalendarEvent } from '../../lib/calendar/calendarPresentation'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import styles from './CalendarEventCardStrip.module.css'

export type CalendarEventCardStripProps = {
  events: PresentableCalendarEvent[]
  dateLabel?: string
  lang?: CalendarLocaleMode
  loading?: boolean
  onOpen: (event: PresentableCalendarEvent) => void
  emptyMessage?: string
  /** Horizontal scroll chevrons (not date navigation). Default false when date arrows wrap the strip. */
  showScrollArrows?: boolean
}

/** Horizontal, non-autoplay Calendar Card strip for the selected date. */
export function CalendarEventCardStrip({
  events,
  dateLabel,
  lang = 'en',
  loading = false,
  onOpen,
  emptyMessage = 'No special observances listed for this date.',
  showScrollArrows = false,
}: CalendarEventCardStripProps) {
  const scrollerRef = useRef<HTMLDivElement>(null)
  const [canPrev, setCanPrev] = useState(false)
  const [canNext, setCanNext] = useState(false)

  const syncArrows = useCallback(() => {
    const el = scrollerRef.current
    if (!el) {
      setCanPrev(false)
      setCanNext(false)
      return
    }
    const max = el.scrollWidth - el.clientWidth
    setCanPrev(el.scrollLeft > 8)
    setCanNext(max > 8 && el.scrollLeft < max - 8)
  }, [])

  useEffect(() => {
    const el = scrollerRef.current
    if (!el) return
    syncArrows()
    el.addEventListener('scroll', syncArrows, { passive: true })
    const ro = typeof ResizeObserver !== 'undefined' ? new ResizeObserver(syncArrows) : null
    ro?.observe(el)
    return () => {
      el.removeEventListener('scroll', syncArrows)
      ro?.disconnect()
    }
  }, [events, syncArrows])

  useEffect(() => {
    const el = scrollerRef.current
    if (el) el.scrollLeft = 0
    syncArrows()
  }, [events, syncArrows])

  const scrollByDir = (dir: -1 | 1) => {
    const el = scrollerRef.current
    if (!el) return
    const amount = Math.max(240, Math.round(el.clientWidth * 0.75))
    el.scrollBy({ left: dir * amount, behavior: 'smooth' })
  }

  if (loading) {
    return (
      <div className={styles.empty} role="status">
        Loading observances…
      </div>
    )
  }

  if (events.length === 0) {
    return (
      <div className={styles.empty} role="status">
        {emptyMessage}
      </div>
    )
  }

  return (
    <div className={styles.root}>
      {showScrollArrows && canPrev ? (
        <button
          type="button"
          className={`${styles.arrow} ${styles.arrowPrev}`}
          aria-label="Scroll cards left"
          onClick={() => scrollByDir(-1)}
        >
          ←
        </button>
      ) : null}
      <div
        ref={scrollerRef}
        className={`${styles.scroller} ${showScrollArrows ? styles.scrollerPadded : ''}`.trim()}
        role="list"
        aria-label="Calendar events for selected date"
      >
        {events.map((event) => (
          <div key={`${event.kind}-${event.id}`} className={styles.item} role="listitem">
            <CalendarEventCard
              event={event}
              dateLabel={dateLabel || event.ethiopianDateLabel}
              lang={lang}
              onOpen={onOpen}
            />
          </div>
        ))}
      </div>
      {showScrollArrows && canNext ? (
        <button
          type="button"
          className={`${styles.arrow} ${styles.arrowNext}`}
          aria-label="Scroll cards right"
          onClick={() => scrollByDir(1)}
        >
          →
        </button>
      ) : null}
    </div>
  )
}
