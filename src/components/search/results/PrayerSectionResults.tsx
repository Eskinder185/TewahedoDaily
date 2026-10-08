import type { PrayerSectionResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { textOrNull } from './resultHelpers.ts'
import { PrayerCard } from './PrayerResults.tsx'
import styles from './ResultCard.module.css'

export function PrayerSectionResults({ data }: { data: PrayerSectionResponse }) {
  const title = textOrNull(data.title)
  const titleAm = textOrNull(data.title_amharic)
  const collection = textOrNull(data.collection_slug)
  const section = textOrNull(data.section_slug)
  // Preserve API order (backend already applies sort_order).
  const prayers = Array.isArray(data.prayers) ? data.prayers : []

  return (
    <div className={styles.stack} aria-label="Prayer section">
      <div className={styles.headingBlock}>
        <p className={styles.eyebrow}>Prayer section</p>
        {titleAm ? (
          <h3 className={styles.titleAm} lang="am">
            {titleAm}
          </h3>
        ) : null}
        {title && title !== titleAm ? (
          <p className={titleAm ? styles.subtitle : styles.title}>{title}</p>
        ) : !titleAm && section ? (
          <h3 className={styles.title}>{section}</h3>
        ) : null}
        {collection || section ? (
          <p className={styles.meta}>
            {[collection, section].filter(Boolean).join(' / ')}
          </p>
        ) : null}
      </div>
      {prayers.length ? (
        prayers.map((prayer, index) => (
          <PrayerCard key={String(prayer.id || prayer.slug || index)} prayer={prayer} />
        ))
      ) : (
        <p className={styles.emptyNote}>No prayers were returned for this section.</p>
      )}
    </div>
  )
}
