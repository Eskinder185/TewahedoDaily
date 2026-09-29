import type { CalendarLiturgyContext } from '../../lib/calendarDayDetails'
import styles from './LiturgyContextCard.module.css'

type Props = {
  context?: CalendarLiturgyContext | null
}

function statusLabel(status: string): string {
  if (status === 'not-linked') return 'Not linked yet'
  if (status === 'standard-order') return 'Standard order'
  if (status === 'metadata-match') return 'Matched from chant metadata'
  return status
    .split(/[-_]/)
    .filter(Boolean)
    .map((part) => `${part[0]?.toLocaleUpperCase() ?? ''}${part.slice(1)}`)
    .join(' ')
}

function hasMeaningfulContext(context: CalendarLiturgyContext): boolean {
  const hasStructure = Array.isArray(context.structure) && context.structure.length > 0
  const hasAnaphora = Boolean(context.anaphora?.title?.trim())
  const hasReadings = Boolean(
    context.readings?.title ||
      context.readings?.note ||
      context.readings?.items?.length ||
      context.readings?.pattern?.length,
  )
  const hasMezmur = Boolean(context.mezmur?.title || context.mezmur?.note)
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

  const showAnaphora = Boolean(anaphora?.title?.trim())
  const confidence = anaphora?.confidence?.trim()
  const readingRows = readings?.items?.length ? readings.items : readings?.pattern
  const mezmurTitle = mezmur?.title?.trim() || 'No specific mezmur linked yet'

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
            <p className={styles.itemMain}>{anaphora.title}</p>
            {anaphora.summary ? <p className={styles.itemMeta}>{anaphora.summary}</p> : null}
            {confidence && confidence !== 'unresolved' ? (
              <p className={styles.itemMeta}>Confidence: {statusLabel(confidence)}</p>
            ) : null}
          </section>
        ) : null}

        {readings ? (
          <section className={styles.item}>
            <h4>Readings</h4>
            <p className={styles.itemMain}>
              {readings.title || statusLabel(readings.status || 'not-linked')}
            </p>
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
            {readings.note ? <p className={styles.itemMeta}>{readings.note}</p> : null}
          </section>
        ) : null}

        {mezmur ? (
          <section className={styles.item}>
            <h4>Mezmur</h4>
            <p className={styles.itemMain}>{mezmurTitle}</p>
            {mezmur.note ? <p className={styles.itemMeta}>{mezmur.note}</p> : null}
          </section>
        ) : null}
      </div>

      {context.whyToday || anaphora?.reason ? (
        <details className={styles.why}>
          <summary>Why today</summary>
          <p>{context.whyToday || anaphora?.reason}</p>
        </details>
      ) : null}
    </aside>
  )
}
