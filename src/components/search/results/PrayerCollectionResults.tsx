import type { PrayerCollectionResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { textOrNull } from './resultHelpers.ts'
import { PrayerCard } from './PrayerResults.tsx'
import styles from './ResultCard.module.css'

export function PrayerCollectionResults({ data }: { data: PrayerCollectionResponse }) {
  const title = textOrNull(data.title)
  const titleAm = textOrNull(data.title_amharic)
  const slug = textOrNull(data.collection_slug)
  // Preserve API order (backend already applies sort_order).
  const prayers = Array.isArray(data.prayers) ? data.prayers : []

  return (
    <div className={styles.stack} aria-label="Prayer collection">
      <div className={styles.headingBlock}>
        <p className={styles.eyebrow}>Prayer collection</p>
        {titleAm ? (
          <h3 className={styles.titleAm} lang="am">
            {titleAm}
          </h3>
        ) : null}
        {title && title !== titleAm ? (
          <p className={titleAm ? styles.subtitle : styles.title}>{title}</p>
        ) : !titleAm && slug ? (
          <h3 className={styles.title}>{slug}</h3>
        ) : null}
        {slug && (title || titleAm) ? <p className={styles.meta}>{slug}</p> : null}
      </div>
      {prayers.length ? (
        prayers.map((prayer, index) => (
          <PrayerCard key={String(prayer.id || prayer.slug || index)} prayer={prayer} />
        ))
      ) : (
        <p className={styles.emptyNote}>No prayers were returned for this collection.</p>
      )}
    </div>
  )
}
