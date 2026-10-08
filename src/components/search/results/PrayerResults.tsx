import type { PrayerRow, PrayerSearchResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { textOrNull } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function PrayerCard({ prayer }: { prayer: PrayerRow }) {
  const title = textOrNull(prayer.title)
  const titleAm = textOrNull(prayer.title_amharic)
  const preview = textOrNull(prayer.preview)
  const collection = textOrNull(prayer.collection_slug)
  const section = textOrNull(prayer.section_slug)
  const context = [collection, section].filter(Boolean).join(' / ')

  return (
    <article className={styles.card}>
      <p className={styles.eyebrow}>Prayer</p>
      {titleAm ? (
        <h3 className={styles.titleAm} lang="am">
          {titleAm}
        </h3>
      ) : null}
      {title && title !== titleAm ? (
        <p className={titleAm ? styles.subtitle : styles.title}>{title}</p>
      ) : !titleAm ? (
        <h3 className={styles.title}>Prayer</h3>
      ) : null}
      {context ? <p className={styles.meta}>{context}</p> : null}
      {preview ? <p className={styles.preview}>{preview}</p> : null}
    </article>
  )
}

export function PrayerResults({ data }: { data: PrayerSearchResponse }) {
  const results = Array.isArray(data.results) ? data.results : []
  if (!results.length) {
    return <p className={styles.emptyNote}>No prayers matched that search.</p>
  }
  return (
    <div className={styles.stack} aria-label="Prayer search results">
      {results.map((prayer, index) => (
        <PrayerCard key={String(prayer.id || prayer.slug || index)} prayer={prayer} />
      ))}
    </div>
  )
}
