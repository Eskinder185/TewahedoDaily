import type {
  SynaxariumRow,
  SynaxariumSearchResponse,
} from '../../../lib/searchBuddy/apiTypes.ts'
import {
  displayText,
  formatCommemorationType,
  looksLikeInternalSlug,
  textOrNull,
} from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function SynaxariumCard({ row }: { row: SynaxariumRow }) {
  const title = textOrNull(row.title)
  const titleAm = textOrNull(row.title_amharic)
  const preview = textOrNull(row.preview)
  const typeLabel = formatCommemorationType(row.commemoration_type)
  // Never surface day_slug (e.g. tikimt-06) as visible meta.
  const dayContext = displayText(row.display_date_english, row.display_date_amharic)
  const safeTitle =
    title && !looksLikeInternalSlug(title) ? title : null
  const headingFallback = safeTitle || titleAm ? null : 'Commemoration'

  return (
    <article className={styles.card}>
      <p className={styles.eyebrow}>Synaxarium</p>
      {typeLabel ? <span className={styles.label}>{typeLabel}</span> : null}
      {titleAm ? (
        <h3 className={styles.titleAm} lang="am">
          {titleAm}
        </h3>
      ) : null}
      {safeTitle && safeTitle !== titleAm ? (
        <p className={titleAm ? styles.subtitle : styles.title}>{safeTitle}</p>
      ) : headingFallback ? (
        <h3 className={styles.title}>{headingFallback}</h3>
      ) : null}
      {dayContext ? <p className={styles.meta}>{dayContext}</p> : null}
      {preview ? <p className={styles.preview}>{preview}</p> : null}
    </article>
  )
}

export function SynaxariumSearchResults({ data }: { data: SynaxariumSearchResponse }) {
  const results = Array.isArray(data.results) ? data.results : []
  if (!results.length) {
    return <p className={styles.emptyNote}>No Synaxarium commemorations matched that search.</p>
  }
  return (
    <div className={styles.stack} aria-label="Synaxarium search results">
      {results.map((row, index) => (
        <SynaxariumCard key={String(row.id || row.slug || index)} row={row} />
      ))}
    </div>
  )
}
