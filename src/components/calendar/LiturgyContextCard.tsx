import type { CalendarLiturgyContext } from '../../lib/calendarDayDetails'
import styles from './LiturgyContextCard.module.css'

type Props = {
  context: CalendarLiturgyContext
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

export function LiturgyContextCard({ context }: Props) {
  const anaphora = context.anaphora
  const confidence = anaphora.confidence?.trim()
  const readingRows = context.readings.items?.length
    ? context.readings.items
    : context.readings.pattern
  const mezmurTitle = context.mezmur.title || 'No specific mezmur linked yet'

  return (
    <aside className={styles.card} aria-label="Liturgy context">
      <div className={styles.head}>
        <p className={styles.kicker}>Liturgy Context</p>
        <h3 className={styles.title}>Service shape for this day</h3>
      </div>

      <ol className={styles.structure} aria-label="Standard liturgy structure">
        {context.structure.map((part, index) => (
          <li key={`${part}-${index}`}>
            <span>{part}</span>
          </li>
        ))}
      </ol>

      <div className={styles.grid}>
        <section className={styles.item}>
          <h4>Anaphora</h4>
          <p className={styles.itemMain}>{anaphora.title || 'Unresolved'}</p>
          {anaphora.summary ? <p className={styles.itemMeta}>{anaphora.summary}</p> : null}
          {confidence && confidence !== 'unresolved' ? (
            <p className={styles.itemMeta}>Confidence: {statusLabel(confidence)}</p>
          ) : null}
        </section>
        <section className={styles.item}>
          <h4>Readings</h4>
          <p className={styles.itemMain}>{context.readings.title || statusLabel(context.readings.status)}</p>
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
          <p className={styles.itemMeta}>{context.readings.note}</p>
        </section>
        <section className={styles.item}>
          <h4>Mezmur</h4>
          <p className={styles.itemMain}>{mezmurTitle}</p>
          <p className={styles.itemMeta}>{context.mezmur.note}</p>
        </section>
      </div>

      <details className={styles.why}>
        <summary>Why today</summary>
        <p>{context.whyToday || anaphora.reason}</p>
      </details>
    </aside>
  )
}
