import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom'
import { useAsync } from '../lib/cms/useAsync'
import { useLocale } from '../lib/i18n/locale'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { loadBibleBook, loadBibleCatalog, loadChapterText } from '../lib/bible/bibleQueries'
import {
  buildCatalogMeta,
  displayBookName,
  displaySourceName,
  hasBilingualBookNames,
  uniqueCanonicalBooks,
} from '../lib/bible/bibleCatalogPresentation'
import type { BibleBookDetail, BibleLanguage, CanonicalBook, ChapterText, ReaderChapter, SourceBook } from '../lib/bible/bibleTypes'
import { recordGuestRecentViewed } from '../lib/userContent/guestStorage'
import { BibleSearchBar } from '../components/bible/BibleSearchBar'
import s from './BiblePage.module.css'

const WORDS = {
  en: {
    bible: 'Bible', subtitle: 'Read the Holy Scriptures in Amharic and English.',
    old: 'Old Testament', newer: 'New Testament', books: 'books',
    chapters: 'Chapters', chapter: 'Chapter', available: 'Available',
    notPublic: 'Reading text is being prepared for publication.',
    noSource: 'Source text has not yet been added for this book.',
    unavailable: 'Not yet available', backBible: 'All Bible books', backBook: 'Back to book',
    notFound: 'This Bible book was not found.', invalidChapter: 'This chapter was not found.',
    empty: 'This chapter has no published verses yet.', retry: 'Try again', loading: 'Loading Bible…',
    previous: 'Previous chapter', next: 'Next chapter',
    choose: 'Reading language', am: 'Amharic', en: 'English', both: 'Both',
    languageFallback: 'Your preferred language is not available for this book. Showing an available edition.',
    independent: 'The editions are shown separately in their original order. Verse alignment has not been reviewed.',
    review: 'Bilingual alignment for this book is under review.',
    published: 'Published editions', noBooks: 'The Bible catalog is not available yet.',
    sourcePart: 'Source volume', selectChapter: 'Choose a chapter',
    sequences: 'Chapter sequences can differ between editions. Check the source volume and chapter shown above.',
    volumes: '{count} volumes',
    volumesOne: '1 volume',
    volumesHeading: 'Volumes in this book',
  },
  am: {
    bible: 'መጽሐፍ ቅዱስ', subtitle: 'ቅዱሳት መጻሕፍትን በአማርኛ እና በእንግሊዝኛ ያንብቡ።',
    old: 'ብሉይ ኪዳን', newer: 'አዲስ ኪዳን', books: 'መጻሕፍት',
    chapters: 'ምዕራፎች', chapter: 'ምዕራፍ', available: 'ይገኛል',
    notPublic: 'የንባብ ጽሑፉ ለሕትመት እየተዘጋጀ ነው።',
    noSource: 'ለዚህ መጽሐፍ ምንጭ ጽሑፍ ገና አልተጨመረም።',
    unavailable: 'ገና አይገኝም', backBible: 'ሁሉም መጻሕፍት', backBook: 'ወደ መጽሐፉ ተመለስ',
    notFound: 'ይህ መጽሐፍ አልተገኘም።', invalidChapter: 'ይህ ምዕራፍ አልተገኘም።',
    empty: 'ለዚህ ምዕራፍ የታተሙ ቁጥሮች ገና የሉም።', retry: 'እንደገና ሞክር', loading: 'መጽሐፍ ቅዱስ እየተጫነ ነው…',
    previous: 'ያለፈው ምዕራፍ', next: 'ቀጣዩ ምዕራፍ',
    choose: 'የንባብ ቋንቋ', am: 'አማርኛ', en: 'English', both: 'ሁለቱም',
    languageFallback: 'የመረጡት ቋንቋ ለዚህ መጽሐፍ አይገኝም። የሚገኝ እትም እየታየ ነው።',
    independent: 'እትሞቹ በየራሳቸው የምንጭ ቅደም ተከተል ተለይተው ቀርበዋል። የቁጥር ማዛመድ አልተገመገመም።',
    review: 'የዚህ መጽሐፍ የሁለት ቋንቋ ማዛመድ በግምገማ ላይ ነው።',
    published: 'የታተሙ እትሞች', noBooks: 'የመጽሐፍ ቅዱስ ዝርዝር ገና አይገኝም።',
    sourcePart: 'የምንጭ ክፍል', selectChapter: 'ምዕራፍ ይምረጡ',
    sequences: 'የምዕራፍ ቅደም ተከተል በእትሞች መካከል ሊለያይ ይችላል። የሚታየውን የምንጭ ክፍል እና ምዕራፍ ያረጋግጡ።',
    volumes: '{count} ክፍሎች',
    volumesOne: '1 ክፍል',
    volumesHeading: 'በዚህ መጽሐፍ ውስጥ ያሉ ክፍሎች',
  },
} as const

function useWords() {
  const { uiLocale } = useLocale()
  return WORDS[uiLocale]
}

function bookName(book: CanonicalBook, language: 'en' | 'am') {
  return displayBookName(book, language)
}

function sourceName(source: SourceBook, language: 'en' | 'am') {
  return displaySourceName(source, language, source.source_book_number)
}

function volumeLabel(count: number, w: { volumes: string }) {
  if (count <= 1) return null
  return w.volumes.replace('{count}', String(count))
}

function editionAvailability(detail: BibleBookDetail) {
  return { am: detail.chapters.am.length > 0, en: detail.chapters.web.length > 0 }
}

function chooseLanguage(preferred: BibleLanguage, am: boolean, en: boolean, allowBoth = true): BibleLanguage | null {
  if (preferred === 'both' && am && en && allowBoth) return 'both'
  if (preferred === 'en' && en) return 'en'
  if (preferred === 'am' && am) return 'am'
  if (am) return 'am'
  if (en) return 'en'
  return null
}

function Status({ loading, error, onRetry }: { loading: boolean; error?: string; onRetry: () => void }) {
  const w = useWords()
  if (loading) return <p className={s.status} role="status">{w.loading}</p>
  if (error) return <div className={s.status} role="alert"><p>{error}</p><button type="button" onClick={onRetry}>{w.retry}</button></div>
  return null
}

function Availability({ am, en }: { am: boolean; en: boolean }) {
  const w = useWords()
  if (!am && !en) return <span className={s.unavailable}>{w.unavailable}</span>
  return (
    <span className={s.badges} aria-label={w.available}>
      {am ? <span lang="am">{w.am}</span> : null}
      {en ? <span>{w.en}</span> : null}
    </span>
  )
}

export function BibleCatalogPage() {
  const w = useWords()
  const { uiLocale } = useLocale()
  const [testament, setTestament] = useState<'old' | 'new'>('old')
  const load = useCallback(() => loadBibleCatalog(), [])
  const result = useAsync(load)
  usePageMeta(w.bible, w.subtitle)

  const catalogMeta = useMemo(() => {
    if (!result.data) return []
    return buildCatalogMeta(result.data.books, result.data.sources, result.data.editions)
  }, [result.data])

  const oldCount = catalogMeta.filter((row) => row.book.collection === 'old').length
  const newCount = catalogMeta.filter((row) => row.book.collection === 'new').length
  const books = catalogMeta.filter((row) => row.book.collection === testament)
  const catalogBooks = useMemo(
    () => uniqueCanonicalBooks(result.data?.books || []),
    [result.data?.books],
  )

  return (
    <section className={s.shell}>
      <header className={s.hero}>
        <p className={s.eyebrow}>Tewahedo Daily</p>
        <h1>{w.bible}</h1>
        <p>{w.subtitle}</p>
      </header>

      <BibleSearchBar catalogBooks={catalogBooks} />

      <div className={s.catalogChrome}>
        <div className={s.testaments} role="group" aria-label={w.bible}>
          <button type="button" aria-pressed={testament === 'old'} onClick={() => setTestament('old')}>
            {w.old} <span>{oldCount || 46}</span>
          </button>
          <button type="button" aria-pressed={testament === 'new'} onClick={() => setTestament('new')}>
            {w.newer} <span>{newCount || 35}</span>
          </button>
        </div>
      </div>

      <Status loading={result.loading} error={result.error} onRetry={result.reload} />

      {result.data ? (
        <div>
          <h2 className={s.sectionTitle}>
            {testament === 'old' ? w.old : w.newer}{' '}
            <small>
              {books.length} {w.books}
            </small>
          </h2>
          {!books.length ? <p className={s.status}>{w.noBooks}</p> : null}
          <ol className={s.bookList}>
            {books.map(({ book, availability, volumeCount }) => {
              const primary = bookName(book, uiLocale)
              const secondaryLang = uiLocale === 'am' ? 'en' : 'am'
              const secondary = bookName(book, secondaryLang)
              const showSecondary =
                hasBilingualBookNames(book) &&
                secondary !== primary &&
                secondary !== book.slug
              const volumes = volumeLabel(volumeCount, w)
              const available = availability.am || availability.en
              const content = (
                <>
                  <span className={s.bookNumber}>{String(book.canonical_number).padStart(2, '0')}</span>
                  <span className={s.bookNames}>
                    <strong lang={uiLocale}>{primary}</strong>
                    {showSecondary ? <small lang={secondaryLang}>{secondary}</small> : null}
                    {volumes ? (
                      <span className={s.volumeHint}>{volumes}</span>
                    ) : null}
                  </span>
                  <Availability {...availability} />
                </>
              )
              return (
                <li key={book.id}>
                  {available ? (
                    <Link className={s.bookCard} to={`/bible/${book.slug}`}>
                      {content}
                    </Link>
                  ) : (
                    <div
                      className={`${s.bookCard} ${s.bookCardDisabled}`}
                      role="group"
                      aria-label={`${primary}. ${w.unavailable}`}
                    >
                      {content}
                    </div>
                  )}
                </li>
              )
            })}
          </ol>
          {!result.data.sources.length ? <p className={s.notice}>{w.notPublic}</p> : null}
        </div>
      ) : null}
    </section>
  )
}

function ChapterGrid({ chapters, slug, language }: { chapters: ReaderChapter[]; slug: string; language: 'am' | 'en' }) {
  const w = useWords()
  const { uiLocale } = useLocale()
  const groups = useMemo(() => {
    const map = new Map<string, ReaderChapter[]>()
    for (const chapter of chapters) {
      const list = map.get(chapter.source.id) || []
      list.push(chapter)
      map.set(chapter.source.id, list)
    }
    return [...map.values()]
  }, [chapters])
  const multi = groups.length > 1
  return (
    <div className={s.chapterGroups}>
      {groups.map((group) => {
        const title = sourceName(group[0].source, uiLocale)
        return (
          <section key={group[0].source.id} className={multi ? s.volumeSection : undefined}>
            {multi ? (
              <h3 className={s.sourceTitle} lang={uiLocale === 'am' ? 'am' : 'en'}>
                {title}
              </h3>
            ) : null}
            <div
              className={s.chapterGrid}
              aria-label={`${w.chapters}${multi ? ` — ${title}` : ''}`}
            >
              {group.map((chapter) => (
                <Link
                  key={chapter.id}
                  to={`/bible/${slug}/${chapter.ordinal}`}
                  aria-label={`${multi ? `${title}, ` : ''}${w.chapter} ${chapter.chapter_number}`}
                  lang={language === 'am' ? 'am' : 'en'}
                >
                  {chapter.chapter_number}
                </Link>
              ))}
            </div>
          </section>
        )
      })}
    </div>
  )
}

export function BibleBookPage() {
  const { bookSlug = '' } = useParams()
  const { locale, uiLocale, setLocale } = useLocale()
  const w = useWords()
  const load = useCallback(() => loadBibleBook(bookSlug), [bookSlug])
  const result = useAsync(load)
  const detail = result.data
  const availability = detail ? editionAvailability(detail) : { am: false, en: false }
  const choice = chooseLanguage(locale, availability.am, availability.en)
  const gridEdition = choice === 'en' ? 'web' : availability.am ? 'am' : 'web'
  usePageMeta(detail?.book.name_en || w.bible, w.subtitle)

  const volumeSources = useMemo(() => {
    if (!detail) return []
    const seen = new Set<string>()
    const ordered: SourceBook[] = []
    for (const chapter of detail.chapters[gridEdition]) {
      if (seen.has(chapter.source.id)) continue
      seen.add(chapter.source.id)
      ordered.push(chapter.source)
    }
    return ordered
  }, [detail, gridEdition])

  return (
    <section className={s.shell}>
      <nav className={s.crumbs} aria-label="Breadcrumb">
        <Link to="/bible">← {w.backBible}</Link>
      </nav>
      <Status loading={result.loading} error={result.error} onRetry={result.reload} />
      {result.data === null ? <p className={s.status}>{w.notFound}</p> : null}
      {detail ? (
        <>
          <header className={s.hero}>
            <p className={s.eyebrow}>
              {detail.book.collection === 'old' ? w.old : w.newer} · {detail.book.canonical_number}
            </p>
            <h1 lang={uiLocale}>{bookName(detail.book, uiLocale)}</h1>
            {hasBilingualBookNames(detail.book) ? (
              <p lang={uiLocale === 'am' ? 'en' : 'am'}>
                {bookName(detail.book, uiLocale === 'am' ? 'en' : 'am')}
              </p>
            ) : null}
            <Availability {...availability} />
          </header>
          {!choice ? (
            <p className={s.notice}>
              {detail.book.source_status === 'missing' ? w.noSource : w.notPublic}
            </p>
          ) : (
            <>
              {locale !== choice ? <p className={s.notice}>{w.languageFallback}</p> : null}
              {availability.am && availability.en ? (
                <div className={s.language} role="group" aria-label={w.choose}>
                  <button
                    type="button"
                    aria-pressed={gridEdition === 'am'}
                    onClick={() => setLocale('am')}
                  >
                    {w.am}
                  </button>
                  <button
                    type="button"
                    aria-pressed={gridEdition === 'web'}
                    onClick={() => setLocale('en')}
                  >
                    {w.en}
                  </button>
                </div>
              ) : null}
              {volumeSources.length > 1 ? (
                <div className={s.volumeList}>
                  <h2 className={s.volumeListTitle}>{w.volumesHeading}</h2>
                  <ol>
                    {volumeSources.map((source) => (
                      <li key={source.id} lang={uiLocale === 'am' ? 'am' : 'en'}>
                        {sourceName(source, uiLocale)}
                      </li>
                    ))}
                  </ol>
                </div>
              ) : null}
              <h2 className={s.sectionTitle}>{w.chapters}</h2>
              <ChapterGrid
                chapters={detail.chapters[gridEdition]}
                slug={detail.book.slug}
                language={gridEdition === 'am' ? 'am' : 'en'}
              />
            </>
          )}
        </>
      ) : null}
    </section>
  )
}

function VerseBlock({ text }: { text: ChapterText }) {
  const w = useWords()
  const { uiLocale } = useLocale()
  const isAm = text.chapter.edition === 'am'
  const verseList = (verses: ChapterText['verses']) => (
    <ol className={s.verses} lang={isAm ? 'am' : 'en'}>
      {verses.map((verse) => (
        <li key={verse.id} id={`verse-${verse.verse_number}`}>
          <span className={s.verseNumber} aria-label={`${verse.verse_number}`}>
            {verse.verse_number}
          </span>
          <span className={isAm ? s.amharicVerse : s.englishVerse}>{verse.text}</span>
        </li>
      ))}
    </ol>
  )
  return <section className={s.editionBlock} aria-label={isAm ? w.am : w.en}>
    <h2>{isAm ? w.am : w.en} <small>{sourceName(text.chapter.source, uiLocale)} · {w.chapter} {text.chapter.chapter_number}</small></h2>
    {isAm ? <>
      {text.sections.map((section) => {
        const verses = text.verses.filter((verse) => verse.section_id === section.id).sort((a, b) => a.source_order - b.source_order)
        return <div key={section.id} className={s.section}>{section.title && <h3 lang="am">{section.title}</h3>}{verseList(verses)}</div>
      })}
      {text.verses.some((verse) => verse.section_id === null) && verseList(text.verses.filter((verse) => verse.section_id === null).sort((a, b) => a.source_order - b.source_order))}
    </> : verseList([...text.verses].sort((a, b) => a.source_order - b.source_order))}
    {!text.verses.length && <p className={s.notice}>{w.empty}</p>}
  </section>
}

function ChapterBody({ detail, ordinal }: { detail: BibleBookDetail; ordinal: number }) {
  const navigate = useNavigate()
  const location = useLocation()
  const { locale, uiLocale, setLocale } = useLocale()
  const w = useWords()
  const am = detail.chapters.am[ordinal - 1]
  const en = detail.chapters.web[ordinal - 1]
  const review = detail.book.slug === 'proverbs' || detail.book.slug === 'tegsats'
  // Site UI is EN/AM only; side-by-side Bible reading stays a page-local preference.
  const [readingLang, setReadingLang] = useState<BibleLanguage>(() => locale)
  useEffect(() => {
    setReadingLang((prev) => (prev === 'both' ? prev : locale))
  }, [locale])
  const choice = chooseLanguage(readingLang, Boolean(am), Boolean(en), !review)
  const chapters = useMemo(() => choice === 'both' ? [am, en].filter((chapter): chapter is ReaderChapter => Boolean(chapter)) : [choice === 'en' ? en : am].filter((chapter): chapter is ReaderChapter => Boolean(chapter)), [choice, am, en])
  const load = useCallback(() => Promise.all(chapters.map(loadChapterText)), [chapters])
  const result = useAsync(load)
  const title = `${bookName(detail.book, uiLocale)} ${w.chapter} ${ordinal}`
  useEffect(() => {
    recordGuestRecentViewed({
      contentType: 'bible',
      contentSlug: `${detail.book.slug}:${ordinal}`,
      title,
      route: `/bible/${detail.book.slug}/${ordinal}`,
    })
  }, [detail.book.slug, ordinal, title])

  // Honor #verse-N from Search Buddy "Open in Bible" after chapter text loads.
  useEffect(() => {
    if (result.loading || !result.data) return
    const hash = location.hash.replace(/^#/, '')
    const match = /^verse-(\d+)$/.exec(hash)
    if (!match) return
    const el = document.getElementById(`verse-${match[1]}`)
    if (!el) return
    el.scrollIntoView({ block: 'center', behavior: 'smooth' })
  }, [result.loading, result.data, location.hash, ordinal, detail.book.slug])
  if (!choice) return <p className={s.status}>{w.invalidChapter}</p>
  const primary = choice === 'en' ? en : am || en
  const maxOrdinal = choice === 'both'
    ? Math.min(detail.chapters.am.length, detail.chapters.web.length)
    : detail.chapters[choice === 'en' ? 'web' : 'am'].length
  const pickerChapters = detail.chapters[choice === 'en' ? 'web' : 'am'].slice(0, maxOrdinal)
  const setReading = (next: BibleLanguage) => {
    setReadingLang(next)
    if (next === 'am' || next === 'en') setLocale(next)
  }
  return <>
    <header className={s.hero}><p className={s.eyebrow}>{detail.book.collection === 'old' ? w.old : w.newer}</p><h1>{bookName(detail.book, uiLocale)} <span>{w.chapter} {primary?.chapter_number}</span></h1>{primary && (detail.sources.length > 1) && <p>{sourceName(primary.source, uiLocale)}</p>}</header>
    {am && en && <div className={s.language} role="group" aria-label={w.choose}>
      <button type="button" aria-pressed={choice === 'am'} onClick={() => setReading('am')}>{w.am}</button>
      <button type="button" aria-pressed={choice === 'en'} onClick={() => setReading('en')}>{w.en}</button>
      {!review && <button type="button" aria-pressed={choice === 'both'} onClick={() => setReading('both')}>{w.both}</button>}
    </div>}
    {review && am && en && <p className={s.notice}>{w.review}</p>}
    {choice === 'both' && <p className={s.notice}>{w.independent}</p>}
    {detail.sources.length > 2 && am && en && <p className={s.notice}>{w.sequences}</p>}
    {locale !== choice && choice !== 'both' && <p className={s.notice}>{w.languageFallback}</p>}
    <label className={s.chapterPicker}>{w.selectChapter}
      <select value={ordinal} onChange={(event) => navigate(`/bible/${detail.book.slug}/${event.target.value}`)}>
        {pickerChapters.map((chapter) => (
          <option key={chapter.id} value={chapter.ordinal}>
            {(detail.sources.length > 1 ? `${sourceName(chapter.source, uiLocale)} · ` : '') +
              `${w.chapter} ${chapter.chapter_number}`}
          </option>
        ))}
      </select>
    </label>
    <Status loading={result.loading} error={result.error} onRetry={result.reload} />
    {result.data?.map((text) => <VerseBlock key={text.chapter.id} text={text} />)}
    <nav className={s.chapterNav} aria-label={w.chapters}>
      {ordinal > 1 ? (
        <Link to={`/bible/${detail.book.slug}/${ordinal - 1}`}>← {w.previous}</Link>
      ) : (
        <span aria-hidden="true">← {w.previous}</span>
      )}
      {ordinal < maxOrdinal ? (
        <Link to={`/bible/${detail.book.slug}/${ordinal + 1}`}>{w.next} →</Link>
      ) : (
        <span aria-hidden="true">{w.next} →</span>
      )}
    </nav>
  </>
}

export function BibleChapterPage() {
  const { bookSlug = '', chapter = '' } = useParams()
  const w = useWords()
  const load = useCallback(() => loadBibleBook(bookSlug), [bookSlug])
  const result = useAsync(load)
  const ordinal = Number(chapter)
  const validOrdinal = Number.isSafeInteger(ordinal) && ordinal > 0
  usePageMeta(result.data?.book.name_en ? `${result.data.book.name_en} ${chapter}` : w.bible, w.subtitle)
  return <article className={`${s.shell} ${s.reader}`}>
    <nav className={s.crumbs} aria-label="Breadcrumb"><Link to="/bible">{w.backBible}</Link><span aria-hidden> / </span><Link to={`/bible/${bookSlug}`}>{w.backBook}</Link></nav>
    <Status loading={result.loading} error={result.error} onRetry={result.reload} />
    {result.data === null && <p className={s.status}>{w.notFound}</p>}
    {result.data && (!validOrdinal || (ordinal > Math.max(result.data.chapters.am.length, result.data.chapters.web.length))) && <p className={s.status}>{w.invalidChapter}</p>}
    {result.data && validOrdinal && ordinal <= Math.max(result.data.chapters.am.length, result.data.chapters.web.length) && <ChapterBody key={`${bookSlug}:${ordinal}`} detail={result.data} ordinal={ordinal} />}
    {result.data && <p className={s.backLink}><Link to={`/bible/${bookSlug}`}>{w.selectChapter}</Link></p>}
  </article>
}
