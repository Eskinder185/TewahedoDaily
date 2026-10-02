import { CalendarEventImage } from './CalendarEventImage'
import {
  displaySummary,
  type PresentableCalendarEvent,
} from '../../lib/calendar/calendarPresentation'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import styles from './CalendarEventCard.module.css'

export type CalendarEventCardProps = {
  event: PresentableCalendarEvent
  /** Gregorian / Ethiopian short label for the selected date. */
  dateLabel?: string
  lang?: CalendarLocaleMode
  onOpen: (event: PresentableCalendarEvent) => void
  className?: string
  /** Compact width for homepage / timeline subsets. */
  variant?: 'strip' | 'home' | 'timeline'
  /** Subtle emphasis when the card belongs to the selected civil date. */
  selected?: boolean
}

/**
 * Shared public Calendar / Homepage event card (observance, fast, season, monthly).
 * Collapsed face only — enriched copy lives in CalendarEventDetail.
 */
export function CalendarEventCard({
  event,
  dateLabel,
  lang = 'en',
  onOpen,
  className = '',
  variant = 'strip',
  selected = false,
}: CalendarEventCardProps) {
  const summary = displaySummary(event, lang)
  const shortSummary =
    summary.length > 110 ? `${summary.slice(0, 107).trimEnd()}…` : summary
  const label = dateLabel || event.ethiopianDateLabel || event.movableLabel || ''

  return (
    <button
      type="button"
      className={`${styles.card} ${styles[variant]} ${styles[`tone_${event.tone}`] || ''} ${
        selected ? styles.selected : ''
      } ${className}`.trim()}
      onClick={() => onOpen(event)}
      aria-label={`${event.categoryLabel}: ${event.title}${label ? `, ${label}` : ''}. Open details.`}
    >
      <CalendarEventImage
        src={event.imageUrl}
        alt={event.imageAlt || event.title}
        position={event.objectPosition}
        className={styles.media}
        sizes={
          variant === 'home'
            ? '(max-width: 767px) 86vw, 280px'
            : variant === 'timeline'
              ? '(max-width: 767px) 240px, (max-width: 1280px) 280px, 300px'
              : '(max-width: 767px) 240px, (max-width: 1024px) 260px, 300px'
        }
      />
      <span className={styles.body}>
        <span className={styles.type}>{event.categoryLabel}</span>
        <span className={styles.title}>{event.title}</span>
        {event.titleAmharic ? (
          <span className={styles.titleAm} lang="am">
            {event.titleAmharic}
          </span>
        ) : null}
        {label ? <span className={styles.date}>{label}</span> : null}
        {shortSummary ? <span className={styles.summary}>{shortSummary}</span> : null}
      </span>
    </button>
  )
}
