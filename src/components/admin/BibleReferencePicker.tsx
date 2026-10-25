import { useCallback, useMemo, useState } from 'react'
import { loadBibleBook, loadBibleCatalog } from '../../lib/bible/bibleQueries'
import { displayBookName } from '../../lib/bible/bibleCatalogPresentation'
import { useAsync } from '../../lib/cms/useAsync'
import styles from './BibleReferencePicker.module.css'

export function BibleReferencePicker({ value, onChange }: { value: string; onChange: (next: string) => void }) {
  const catalog = useAsync(useCallback(() => loadBibleCatalog(), []))
  const [slug, setSlug] = useState('')
  const [chapter, setChapter] = useState('1')
  const [verseStart, setVerseStart] = useState('')
  const [verseEnd, setVerseEnd] = useState('')
  const selected = catalog.data?.books.find((book) => book.slug === slug)
  const detail = useAsync(useCallback(() => slug ? loadBibleBook(slug) : Promise.resolve(null), [slug]))
  const chapterNumbers = useMemo(() => {
    const rows = detail.data ? Object.values(detail.data.byEdition).flat() : []
    return [...new Set(rows.map((row) => row.chapter_number))].sort((a, b) => a - b)
  }, [detail.data])
  function append() {
    if (!selected || !chapter || !chapterNumbers.includes(Number(chapter))) return
    let reference = `${displayBookName(selected, 'en')} ${chapter}`
    if (verseStart) reference += `:${verseStart}${verseEnd && verseEnd !== verseStart ? `–${verseEnd}` : ''}`
    onChange([value.trim(), reference].filter(Boolean).join('\n'))
  }
  return <div className={styles.picker}>
    <strong>Passage picker</strong>
    <div className={styles.fields}>
      <label>Book<select value={slug} onChange={(event) => setSlug(event.target.value)}><option value="">Choose book</option>{catalog.data?.books.map((book) => <option key={book.id} value={book.slug}>{displayBookName(book, 'en')} · {displayBookName(book, 'am')}</option>)}</select></label>
      <label>Chapter<select value={chapter} onChange={(event) => setChapter(event.target.value)} disabled={!slug}><option value="">Choose</option>{chapterNumbers.map((number) => <option key={number} value={number}>{number}</option>)}</select></label>
      <label>First verse<input type="number" min="0" value={verseStart} onChange={(event) => setVerseStart(event.target.value)} placeholder="Optional" /></label>
      <label>Last verse<input type="number" min="0" value={verseEnd} onChange={(event) => setVerseEnd(event.target.value)} placeholder="Optional" /></label>
      <button type="button" onClick={append} disabled={!selected || !chapterNumbers.includes(Number(chapter))}>Add reference</button>
    </div>
    {catalog.error || detail.error ? <small role="alert">Bible passage picker is unavailable. You can still enter a reference manually.</small> : <small>References stay as familiar book, chapter, and verse labels; the public resolver links them to the canonical Bible reader.</small>}
  </div>
}
