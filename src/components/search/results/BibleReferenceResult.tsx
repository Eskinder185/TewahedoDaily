import type { BibleReferenceResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import {
  bookChapterLabel,
  displayText,
  verseBody,
  verseNumber,
} from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function BibleReferenceResult({ data }: { data: BibleReferenceResponse }) {
  const heading = bookChapterLabel(data)
  const singleText = displayText(data.text, data.text_amharic, data.text_english)
  const verses = Array.isArray(data.verses) ? data.verses : []

  return (
    <article className={styles.card} aria-label="Bible reference">
      <p className={styles.eyebrow}>Bible reference</p>
      {heading ? <h3 className={styles.title}>{heading}</h3> : null}
      {data.language ? <p className={styles.meta}>{String(data.language)}</p> : null}

      {verses.length > 0 ? (
        <div className={styles.verseList}>
          {verses.map((row, index) => {
            const num = verseNumber(row)
            const body = verseBody(row)
            if (!body && !num) return null
            return (
              <div key={`${num ?? 'v'}-${index}`} className={styles.verseRow}>
                {num ? <span className={styles.verseNum}>{num}</span> : <span />}
                {body ? <p className={styles.verseText}>{body}</p> : null}
              </div>
            )
          })}
        </div>
      ) : singleText ? (
        <p className={styles.verseText}>{singleText}</p>
      ) : (
        <p className={styles.emptyNote}>No verse text was returned for this reference.</p>
      )}
    </article>
  )
}
