/**
 * TEWAHEDODAILY — PARALLEL VERSE ALIGNED VIEW
 *
 * Aligns Amharic and English verses side-by-side on desktop
 * and vertically paired per verse on mobile.
 */

import { useMemo } from 'react'
import type { ChapterText } from '../../lib/bible/bibleTypes'
import { BibleVerseItem } from './BibleVerseItem'
import s from '../../pages/BiblePage.module.css'

interface Props {
  amharicText: ChapterText
  englishText: ChapterText
  bookSlug: string
  chapterOrdinal: number
  bookTitle: string
}

export function ParallelVerseView({
  amharicText,
  englishText,
  bookSlug,
  chapterOrdinal,
  bookTitle,
}: Props) {
  const alignedRows = useMemo(() => {
    const amMap = new Map(amharicText.verses.map((v) => [v.verse_number, v.text]))
    const enMap = new Map(englishText.verses.map((v) => [v.verse_number, v.text]))

    const allNums = Array.from(new Set([...amMap.keys(), ...enMap.keys()])).sort(
      (a, b) => a - b
    )

    return allNums.map((num) => ({
      verseNumber: num,
      amText: amMap.get(num) || '',
      enText: enMap.get(num) || '',
    }))
  }, [amharicText.verses, englishText.verses])

  return (
    <section className={s.editionBlock} aria-label="Parallel Amharic and English Chapter">
      <div className={s.parallelGrid} style={{ marginBottom: '1rem', borderBottom: '1px solid var(--color-border-subtle, #e6ded0)', paddingBottom: '0.5rem' }}>
        <h2 style={{ fontSize: '1rem', margin: 0, color: 'var(--color-burgundy, #6a1a24)' }}>
          አማርኛ (Amharic)
        </h2>
        <h2 style={{ fontSize: '1rem', margin: 0, color: 'var(--color-navy, #152238)' }}>
          English (WEB)
        </h2>
      </div>

      <ol className={s.verses} style={{ listStyle: 'none', padding: 0 }}>
        {alignedRows.map((row) => (
          <BibleVerseItem
            key={row.verseNumber}
            bookSlug={bookSlug}
            chapterNumber={chapterOrdinal}
            verseNumber={row.verseNumber}
            primaryText={row.amText || '—'}
            secondaryText={row.enText || '—'}
            primaryLang="am"
            secondaryLang="en"
            bookTitle={bookTitle}
          />
        ))}
      </ol>
    </section>
  )
}
