import type { SynaxariumDayResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { displayText, looksLikeInternalSlug, textOrNull } from './resultHelpers.ts'
import { SynaxariumCard } from './SynaxariumSearchResults.tsx'
import styles from './ResultCard.module.css'

export function SynaxariumDayResults({ data }: { data: SynaxariumDayResponse }) {
  const titleRaw = textOrNull(data.title)
  const title = titleRaw && !looksLikeInternalSlug(titleRaw) ? titleRaw : null
  const titleAm = textOrNull(data.title_amharic)
  const dateLine = displayText(data.display_date_english, data.display_date_amharic)
  // Preserve API order — do not reorder by guessed importance.
  const commemorations = Array.isArray(data.commemorations) ? data.commemorations : []

  return (
    <div className={styles.stack} aria-label="Synaxarium day">
      <div className={`${styles.card} ${styles.cardQuiet}`}>
        <p className={styles.eyebrow}>Synaxarium day</p>
        {titleAm ? (
          <h3 className={styles.titleAm} lang="am">
            {titleAm}
          </h3>
        ) : null}
        {title && title !== titleAm ? (
          <p className={titleAm ? styles.subtitle : styles.title}>{title}</p>
        ) : !titleAm && dateLine ? (
          <h3 className={styles.title}>{dateLine}</h3>
        ) : !titleAm ? (
          <h3 className={styles.title}>Synaxarium</h3>
        ) : null}
        {dateLine && (title || titleAm) ? <p className={styles.meta}>{dateLine}</p> : null}
      </div>
      {commemorations.length ? (
        commemorations.map((row, index) => (
          <SynaxariumCard key={String(row.id || row.slug || index)} row={row} />
        ))
      ) : (
        <p className={styles.emptyNote}>No commemorations were returned for this day.</p>
      )}
    </div>
  )
}
