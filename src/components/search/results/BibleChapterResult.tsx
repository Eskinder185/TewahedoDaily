import { Link } from 'react-router-dom'
import type { BibleChapterResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { resolveBibleDetailPath } from '../../../lib/search/bibleRoute.ts'
import { useSearchBuddyOptional } from '../../../lib/search/searchBuddySession.tsx'
import { bibleLanguageLabel, bookChapterLabel, verseBody, verseNumber } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function BibleChapterResult({ data }: { data: BibleChapterResponse }) {
  const searchBuddy = useSearchBuddyOptional()
  const heading = bookChapterLabel({
    book: data.book,
    book_name: data.book_name,
    chapter: data.chapter,
  })
  const language = bibleLanguageLabel(data.language)
  const verses = Array.isArray(data.verses) ? data.verses : []
  const route = resolveBibleDetailPath(data)

  return (
    <article className={styles.card} aria-label="Bible chapter">
      <div className={styles.headingBlock}>
        <p className={styles.eyebrow}>Bible chapter</p>
        {heading ? <h3 className={styles.title}>{heading}</h3> : null}
        {language ? <p className={styles.meta}>{language}</p> : null}
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
      {route ? (
        <div className={styles.actions}>
          <Link
            className={styles.actionPrimary}
            to={route}
            state={{ fromSearchBuddy: true }}
            onClick={() => searchBuddy?.setOpen(false)}
          >
            Open in Bible
          </Link>
        </div>
      ) : null}
    </article>
  )
}
