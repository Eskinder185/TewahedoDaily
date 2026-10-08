import type { HymnRow, HymnSearchResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { displayText, safeExternalUrl, textOrNull } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

function HymnCard({ hymn, occasion }: { hymn: HymnRow; occasion?: string | null }) {
  const titleAm = textOrNull(hymn.title_amharic)
  const titleSecondary = displayText(
    hymn.title_english,
    hymn.title_transliteration,
    hymn.title,
  )
  const form = textOrNull(hymn.form)
  const preview = textOrNull(hymn.preview)
  const youtube = safeExternalUrl(hymn.youtube_url)
  const audio = safeExternalUrl(hymn.audio_url)
  const zemari = textOrNull(hymn.zemari) || textOrNull(hymn.singer_name)
  const occasionLabel =
    textOrNull(occasion) || textOrNull(hymn.occasion_label) || textOrNull(hymn.occasion)

  return (
    <article className={styles.card}>
      <p className={styles.eyebrow}>{form || 'Hymn'}</p>
      {occasionLabel ? <span className={styles.label}>{occasionLabel}</span> : null}
      {titleAm ? (
        <h3 className={styles.titleAm} lang="am">
          {titleAm}
        </h3>
      ) : null}
      {titleSecondary && titleSecondary !== titleAm ? (
        <p className={titleAm ? styles.subtitle : styles.title}>{titleSecondary}</p>
      ) : !titleAm ? (
        <h3 className={styles.title}>Hymn</h3>
      ) : null}
      {zemari ? <p className={styles.meta}>{zemari}</p> : null}
      {preview ? <p className={styles.preview}>{preview}</p> : null}
      {(youtube || audio) && (
        <div className={styles.actions}>
          {youtube ? (
            <a
              className={styles.actionLink}
              href={youtube}
              target="_blank"
              rel="noopener noreferrer"
              aria-label="Open YouTube recording"
            >
              YouTube
            </a>
          ) : null}
          {audio ? (
            <a
              className={styles.actionLink}
              href={audio}
              target="_blank"
              rel="noopener noreferrer"
              aria-label="Open audio recording"
            >
              Audio
            </a>
          ) : null}
        </div>
      )}
    </article>
  )
}

export function HymnResults({ data }: { data: HymnSearchResponse }) {
  const results = Array.isArray(data.results) ? data.results : []
  if (!results.length) {
    return <p className={styles.emptyNote}>No hymns matched that search.</p>
  }
  return (
    <div className={styles.stack} aria-label="Hymn search results">
      {results.map((hymn, index) => (
        <HymnCard key={String(hymn.id || hymn.slug || index)} hymn={hymn} />
      ))}
    </div>
  )
}

export { HymnCard }
