import type { CalendarLiturgyContext } from '../../lib/calendarDayDetails'
import {
  isInternalPlaceholderCopy,
  sanitizePublicLiturgyCopy,
} from '../../lib/calendarDayDetails/publicLiturgyCopy'
import styles from './LiturgyContextCard.module.css'

type Props = {
  context?: CalendarLiturgyContext | null
}

function statusLabel(status: string): string {
  if (status === 'not-linked') return ''
  if (status === 'standard-order') return 'Standard order'
  if (status === 'metadata-match') return ''
  return status
    .split(/[-_]/)
    .filter(Boolean)
    .map((part) => `${part[0]?.toLocaleUpperCase() ?? ''}${part.slice(1)}`)
    .join(' ')
}

function hasMeaningfulContext(context: CalendarLiturgyContext): boolean {
  const hasStructure = Array.isArray(context.structure) && context.structure.length > 0
  const anaphoraTitle = sanitizePublicLiturgyCopy(context.anaphora?.title)
  const hasAnaphora =
    Boolean(anaphoraTitle) &&
    context.anaphora?.confidence !== 'unresolved' &&
    context.anaphora?.id !== 'unresolved'
  const readingTitle = sanitizePublicLiturgyCopy(context.readings?.title)
  const readingNote = sanitizePublicLiturgyCopy(context.readings?.note)
  const hasReadings = Boolean(
    readingTitle ||
      readingNote ||
      context.readings?.items?.length ||
      context.readings?.pattern?.length,
  )
  const mezmurTitle = sanitizePublicLiturgyCopy(context.mezmur?.title)
  const hasMezmur = Boolean(mezmurTitle) && context.mezmur?.status !== 'not-linked'
  return hasStructure || hasAnaphora || hasReadings || hasMezmur
}

/**
 * Calendar-day liturgy summary card.
 * Preparatory / non-anaphora sections must not require anaphora to exist.
 */
export function LiturgyContextCard({ context }: Props) {
  if (!context || !hasMeaningfulContext(context)) return null

  const anaphora = context.anaphora
  const readings = context.readings
  const mezmur = context.mezmur
  const structure = Array.isArray(context.structure) ? context.structure : []

  const anaphoraTitle = sanitizePublicLiturgyCopy(anaphora?.title)
  const showAnaphora =
    Boolean(anaphoraTitle) &&
    anaphora?.confidence !== 'unresolved' &&
    anaphora?.id !== 'unresolved'
  const anaphoraSummary = sanitizePublicLiturgyCopy(anaphora?.summary)
  const readingRows = readings?.items?.length ? readings.items : readings?.pattern
  const readingTitle = sanitizePublicLiturgyCopy(readings?.title)
  const readingNote = sanitizePublicLiturgyCopy(readings?.note)
  const readingStatus = sanitizePublicLiturgyCopy(statusLabel(readings?.status || ''))
  const mezmurTitle = sanitizePublicLiturgyCopy(mezmur?.title)
  const mezmurNote = sanitizePublicLiturgyCopy(mezmur?.note)
  const showMezmur = Boolean(mezmurTitle) && mezmur?.status !== 'not-linked'
  const whyText = sanitizePublicLiturgyCopy(context.whyToday || anaphora?.reason)

  const showReadings =
    Boolean(readings) &&
    Boolean(readingTitle || readingNote || readingRows?.length || readingStatus)

  return (
    <aside className={styles.card} aria-label="Liturgy context">
      <div className={styles.head}>
        <p className={styles.kicker}>Liturgy Context</p>
        <h3 className={styles.title}>Service shape for this day</h3>
      </div>

      {structure.length ? (
        <ol className={styles.structure} aria-label="Standard liturgy structure">
          {structure.map((part, index) => (
            <li key={`${part}-${index}`}>
              <span>{part}</span>
            </li>
          ))}
        </ol>
      ) : null}

      <div className={styles.grid}>
        {showAnaphora && anaphora ? (
          <section className={styles.item}>
            <h4>Anaphora</h4>
            <p className={styles.itemMain}>{anaphoraTitle}</p>
            {anaphoraSummary && !isInternalPlaceholderCopy(anaphoraSummary) ? (
              <p className={styles.itemMeta}>{anaphoraSummary}</p>
            ) : null}
          </section>
        ) : null}

        {showReadings ? (
          <section className={styles.item}>
            <h4>Readings</h4>
            {readingTitle || readingStatus ? (
              <p className={styles.itemMain}>{readingTitle || readingStatus}</p>
            ) : null}
            {readingRows?.length ? (
              <ol className={styles.readingList}>
                {readingRows.map((item, index) => (
                  <li key={`${item.title}-${index}`}>
                    {item.title}
                    {'reference' in item && item.reference ? ` - ${item.reference}` : ''}
                  </li>
                ))}
              </ol>
            ) : null}
            {readingNote && !isInternalPlaceholderCopy(readingNote) ? (
              <p className={styles.itemMeta}>{readingNote}</p>
            ) : null}
          </section>
        ) : null}

        {showMezmur ? (
          <section className={styles.item}>
            <h4>Mezmur</h4>
            <p className={styles.itemMain}>{mezmurTitle}</p>
            {mezmurNote && !isInternalPlaceholderCopy(mezmurNote) ? (
              <p className={styles.itemMeta}>{mezmurNote}</p>
            ) : null}
          </section>
        ) : null}
      </div>

      {whyText && !isInternalPlaceholderCopy(whyText) ? (
        <details className={styles.why}>
          <summary>Why today</summary>
          <p>{whyText}</p>
        </details>
      ) : null}
    </aside>
  )
}
