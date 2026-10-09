/**
 * Shared bilingual body renderer for Learn How to Pray.
 */
import type { GuideLangMode } from '../../lib/prayers/learnHowToPrayModel'
import styles from './prayerGuideUi.module.css'

function paragraphs(text: string) {
  return text
    .split(/\n{2,}/)
    .map((part) => part.trim())
    .filter(Boolean)
}

export function GuideBilingualBody({
  amharic,
  english,
  lang,
  className = '',
}: {
  amharic: string
  english: string
  lang: GuideLangMode
  className?: string
}) {
  const amParts = paragraphs(amharic)
  const enParts = paragraphs(english)

  return (
    <div className={`${styles.bilingualBody} ${className}`.trim()}>
      {lang === 'am' ? (
        <div className={styles.bodyAm} lang="am">
          {amParts.length > 0 ? (
            amParts.map((part, index) => <p key={`am-${index}`}>{part}</p>)
          ) : enParts.length > 0 ? (
            enParts.map((part, index) => <p key={`en-fallback-${index}`}>{part}</p>)
          ) : (
            <p className={styles.missing}>Translation not available yet.</p>
          )}
        </div>
      ) : (
        <div className={styles.bodyEn} lang="en">
          {enParts.length > 0 ? (
            enParts.map((part, index) => <p key={`en-${index}`}>{part}</p>)
          ) : amParts.length > 0 ? (
            amParts.map((part, index) => <p key={`am-fallback-${index}`} lang="am">{part}</p>)
          ) : (
            <p className={styles.missing}>Translation not available yet.</p>
          )}
        </div>
      )}
    </div>
  )
}
