import { Link } from 'react-router-dom'
import type { BibleBookRef, BibleReferenceResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import {
  flattenBibleBookFields,
  resolveBibleDetailPath,
} from '../../../lib/search/bibleRoute.ts'
import { useSearchBuddyOptional } from '../../../lib/search/searchBuddySession.tsx'
import {
  bibleLanguageLabel,
  displayText,
  verseBody,
  verseNumber,
} from './resultHelpers.ts'
import styles from './ResultCard.module.css'

function isBookRef(value: unknown): value is BibleBookRef {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

/**
 * First-class Search Buddy card for POST /api/chat `type: "bible_reference"`.
 * Renders verse text in-chat; navigation is opt-in via "Open in Bible".
 * Used for both typed and voice queries (identical renderer).
 */
export function BibleReferenceResult({ data }: { data: BibleReferenceResponse }) {
  const searchBuddy = useSearchBuddyOptional()
  const flat = flattenBibleBookFields(data)
  const bookAm =
    flat.book_name_amharic ||
    (isBookRef(data.book) ? (data.book.name_am || '').trim() : '') ||
    null
  const bookEn =
    flat.book_name ||
    (isBookRef(data.book) ? (data.book.name_en || '').trim() : '') ||
    flat.book_slug ||
    null

  const chapter =
    data.chapter !== null && data.chapter !== undefined && data.chapter !== ''
      ? String(data.chapter)
      : ''
  const verseStart =
    data.verse !== null && data.verse !== undefined && data.verse !== ''
      ? String(data.verse)
      : ''
  const verseEndRaw = data.end_verse ?? data.verse_end
  const verseEnd =
    verseEndRaw !== null && verseEndRaw !== undefined && verseEndRaw !== ''
      ? String(verseEndRaw)
      : ''

  let chapterVerse = ''
  if (chapter && verseStart) {
    chapterVerse = `${chapter}:${verseStart}`
    if (verseEnd && verseEnd !== verseStart) chapterVerse = `${chapterVerse}–${verseEnd}`
  } else if (chapter) {
    chapterVerse = chapter
  }

  const englishHeading =
    (typeof data.reference === 'string' && data.reference.trim()) ||
    [bookEn, chapterVerse].filter(Boolean).join(' ')

  const language = bibleLanguageLabel(data.language)
  const singleText = displayText(data.text, data.text_amharic, data.text_english)
  const verses = Array.isArray(data.verses) ? data.verses : []
  const route = resolveBibleDetailPath({
    book: data.book,
    book_slug: data.book_slug || flat.book_slug,
    chapter: data.chapter,
    verse: data.verse,
    end_verse: data.end_verse ?? data.verse_end,
  })

  return (
    <article className={styles.card} aria-label="Bible reference">
      <p className={styles.eyebrow}>Bible reference</p>

      {bookAm ? (
        <h3 className={styles.titleAm} lang="am">
          {bookAm}
          {chapterVerse ? ` ${chapterVerse}` : ''}
        </h3>
      ) : null}

      {englishHeading ? (
        bookAm ? (
          <p className={styles.subtitle}>{englishHeading}</p>
        ) : (
          <h3 className={styles.title}>{englishHeading}</h3>
        )
      ) : null}

      {language ? <p className={styles.meta}>{language}</p> : null}

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
