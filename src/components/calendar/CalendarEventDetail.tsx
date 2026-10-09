import { useEffect, useId, useLayoutEffect, useRef } from 'react'
import { createPortal } from 'react-dom'
import {
  displaySummary,
  type PresentableCalendarEvent,
} from '../../lib/calendar/calendarPresentation'
import { useLocale } from '../../lib/i18n/locale'
import { CalendarEventDetails } from './CalendarEventDetails'
import { CalendarEventImage } from './CalendarEventImage'
import styles from './CalendarEventDetail.module.css'

export type CalendarEventDetailProps = {
  open: boolean
  event: PresentableCalendarEvent | null
  /** Selected civil date label shown under titles. */
  dateLabel?: string
  ethiopianLabel?: string
  onClose: () => void
}

const DETAIL_HISTORY_KEY = 'td-calendar-detail'

/**
 * Enriched Calendar event detail (modal on desktop, bottom sheet on mobile).
 * CAL-01 sheet height · CAL-02 history Back · CAL-03 focus trap / restore.
 * Portaled to document.body so AppShell route transforms cannot break position:fixed.
 */
export function CalendarEventDetail({
  open,
  event,
  dateLabel,
  ethiopianLabel,
  onClose,
}: CalendarEventDetailProps) {
  const { contentLocale: lang } = useLocale()
  const panelRef = useRef<HTMLDivElement>(null)
  const previouslyFocused = useRef<HTMLElement | null>(null)
  const pushedHistory = useRef(false)
  const titleId = useId()

  // CAL-02: Browser Back closes the sheet instead of leaving Calendar.
  useEffect(() => {
    if (!open || !event) return

    const state = { [DETAIL_HISTORY_KEY]: event.id }
    try {
      const current = window.history.state
      if (!current || current[DETAIL_HISTORY_KEY] !== event.id) {
        window.history.pushState(state, '')
        pushedHistory.current = true
      }
    } catch {
      pushedHistory.current = false
    }

    const onPop = () => {
      pushedHistory.current = false
      onClose()
    }
    window.addEventListener('popstate', onPop)
    return () => {
      window.removeEventListener('popstate', onPop)
    }
  }, [open, event?.id, onClose])

  const handleClose = () => {
    if (pushedHistory.current) {
      pushedHistory.current = false
      try {
        window.history.back()
        return
      } catch {
        /* fall through */
      }
    }
    onClose()
  }

  useEffect(() => {
    if (!open) return
    previouslyFocused.current = document.activeElement as HTMLElement | null
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        e.preventDefault()
        handleClose()
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
    // handleClose closes via history when we pushed; intentional
    // eslint-disable-next-line react-hooks/exhaustive-deps -- stable open/close cycle
  }, [open, event?.id])

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
    const body = panelRef.current?.querySelector<HTMLElement>(`.${styles.body}`)
    if (body) body.scrollTop = 0
  }, [open, event?.id])

  useEffect(() => {
    if (!open) return
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    const mainEl = document.getElementById('main')
    const footerEl = document.querySelector('footer')
    const headerEl = document.querySelector('[data-header]')
    const inertTargets = [mainEl, footerEl, headerEl].filter(Boolean) as HTMLElement[]
    for (const el of inertTargets) el.setAttribute('inert', '')
    return () => {
      document.body.style.overflow = prev
      for (const el of inertTargets) el.removeAttribute('inert')
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

  return createPortal(
    <div className={styles.backdrop} role="presentation" onClick={handleClose}>
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
                  <span>{ethiopianLabel || event.ethiopianDateLabel}</span>
                ) : null}
              </p>
            )}
            {event.movableLabel ? <p className={styles.meta}>{event.movableLabel}</p> : null}
            {event.fastTypeLabel ? <p className={styles.meta}>{event.fastTypeLabel}</p> : null}
          </div>
          <button type="button" className={styles.close} onClick={handleClose} aria-label="Close">
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

          {summary ? <p className={styles.summary}>{summary}</p> : null}

          <CalendarEventDetails fields={event.fields} lang={lang} defaultOpenFirst />
        </div>
      </div>
    </div>,
    document.body,
  )
}
