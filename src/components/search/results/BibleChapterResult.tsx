import type { BibleChapterResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { bookChapterLabel, verseBody, verseNumber } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function BibleChapterResult({ data }: { data: BibleChapterResponse }) {
  const heading = bookChapterLabel({
    book: data.book,
    book_name: data.book_name,
    chapter: data.chapter,
  })
  const verses = Array.isArray(data.verses) ? data.verses : []

  return (
    <article className={styles.card} aria-label="Bible chapter">
      <div className={styles.headingBlock}>
        <p className={styles.eyebrow}>Bible chapter</p>
        {heading ? <h3 className={styles.title}>{heading}</h3> : null}
        {data.language ? <p className={styles.meta}>{String(data.language)}</p> : null}
      </div>

      {verses.length ? (
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
      ) : (
        <p className={styles.emptyNote}>No verses were returned for this chapter.</p>
      )}
    </article>
  )
}
