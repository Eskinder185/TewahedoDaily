import { useEffect, useId, useLayoutEffect, useRef } from 'react'
import {
  displaySummary,
  type PresentableCalendarEvent,
} from '../../lib/calendar/calendarPresentation'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import { CalendarEventDetails, CalendarLangToggle } from './CalendarEventDetails'
import { CalendarEventImage } from './CalendarEventImage'
import styles from './CalendarEventDetail.module.css'

export type CalendarEventDetailProps = {
  open: boolean
  event: PresentableCalendarEvent | null
  /** Selected civil date label shown under titles. */
  dateLabel?: string
  ethiopianLabel?: string
  lang: CalendarLocaleMode
  onLangChange?: (mode: CalendarLocaleMode) => void
  onClose: () => void
}

/**
 * Enriched Calendar event detail (modal on desktop, bottom sheet on mobile).
 * Single place for what / why / important / scripture / fasting / season fields.
 */
export function CalendarEventDetail({
  open,
  event,
  dateLabel,
  ethiopianLabel,
  lang,
  onLangChange,
  onClose,
}: CalendarEventDetailProps) {
  const panelRef = useRef<HTMLDivElement>(null)
  const previouslyFocused = useRef<HTMLElement | null>(null)
  const titleId = useId()

  useEffect(() => {
    if (!open) return
    previouslyFocused.current = document.activeElement as HTMLElement | null
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [open, onClose])

  useEffect(() => {
    if (!open) return
    const panel = panelRef.current
    panel?.focus()
    return () => {
      previouslyFocused.current?.focus?.()
    }
  }, [open, event?.id])

  useLayoutEffect(() => {
    if (!open) return
    if (panelRef.current) panelRef.current.scrollTop = 0
  }, [open, event?.id])

  useEffect(() => {
    if (!open) return
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      document.body.style.overflow = prev
    }
  }, [open])

  useEffect(() => {
    if (!open) return
    const panel = panelRef.current
    if (!panel) return
    const onTab = (e: KeyboardEvent) => {
      if (e.key !== 'Tab') return
      const focusable = panel.querySelectorAll<HTMLElement>(
        'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])',
      )
      if (focusable.length === 0) return
      const first = focusable[0]
      const last = focusable[focusable.length - 1]
      if (e.shiftKey && document.activeElement === first) {
        e.preventDefault()
        last.focus()
      } else if (!e.shiftKey && document.activeElement === last) {
        e.preventDefault()
        first.focus()
      }
    }
    panel.addEventListener('keydown', onTab)
    return () => panel.removeEventListener('keydown', onTab)
  }, [open, event?.id])

  if (!open || !event) return null

  const summary = displaySummary(event, lang)

  return (
    <div className={styles.backdrop} role="presentation" onClick={onClose}>
      <div
        className={styles.panel}
        role="dialog"
        aria-modal="true"
        aria-labelledby={titleId}
        tabIndex={-1}
        ref={panelRef}
        onClick={(e) => e.stopPropagation()}
      >
        <header className={styles.head}>
          <div className={styles.headCopy}>
            <p className={styles.badge}>{event.categoryLabel}</p>
            <h2 id={titleId} className={styles.title}>
              {event.title}
            </h2>
            {event.titleAmharic ? (
              <p className={styles.titleAm} lang="am">
                {event.titleAmharic}
              </p>
            ) : null}
            {(dateLabel || ethiopianLabel || event.ethiopianDateLabel) && (
              <p className={styles.dates}>
                {dateLabel ? <span>{dateLabel}</span> : null}
                {dateLabel && (ethiopianLabel || event.ethiopianDateLabel) ? (
                  <span aria-hidden> · </span>
                ) : null}
                {ethiopianLabel || event.ethiopianDateLabel ? (
                  <span lang="am">{ethiopianLabel || event.ethiopianDateLabel}</span>
                ) : null}
              </p>
            )}
            {event.movableLabel ? <p className={styles.meta}>{event.movableLabel}</p> : null}
            {event.fastTypeLabel ? <p className={styles.meta}>{event.fastTypeLabel}</p> : null}
          </div>
          <button type="button" className={styles.close} onClick={onClose} aria-label="Close">
            Close
          </button>
        </header>

        <div className={styles.body}>
          <figure className={styles.media}>
            <CalendarEventImage
              src={event.imageUrl}
              alt={event.imageAlt || event.title}
              position={event.objectPosition}
              className={styles.imageFrame}
              sizes="(max-width: 640px) 100vw, 36rem"
            />
          </figure>

          {onLangChange ? (
            <div className={styles.langRow}>
              <CalendarLangToggle value={lang} onChange={onLangChange} />
            </div>
          ) : null}

          {summary ? <p className={styles.summary}>{summary}</p> : null}

          <CalendarEventDetails fields={event.fields} lang={lang} defaultOpenFirst />
        </div>
      </div>
    </div>
  )
}
