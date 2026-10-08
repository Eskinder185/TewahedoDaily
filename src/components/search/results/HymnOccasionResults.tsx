import type { HymnOccasionResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { textOrNull } from './resultHelpers.ts'
import { HymnCard } from './HymnResults.tsx'
import styles from './ResultCard.module.css'

export function HymnOccasionResults({ data }: { data: HymnOccasionResponse }) {
  const results = Array.isArray(data.results) ? data.results : []
  const occasion =
    textOrNull(data.occasion_label) || textOrNull(data.occasion)

  return (
    <div className={styles.stack} aria-label="Hymns for occasion">
      {occasion ? (
        <div className={styles.headingBlock}>
          <p className={styles.eyebrow}>Occasion</p>
          <h3 className={styles.title}>{occasion}</h3>
        </div>
      ) : null}
      {results.length ? (
        results.map((hymn, index) => (
          <HymnCard
            key={String(hymn.id || hymn.slug || index)}
            hymn={hymn}
            occasion={occasion}
          />
        ))
      ) : (
        <p className={styles.emptyNote}>No hymns were returned for this occasion.</p>
      )}
    </div>
  )
}
