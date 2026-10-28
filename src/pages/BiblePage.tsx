import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
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
import type { BibleBookDetail, BibleEdition, CanonicalBook, ChapterText, ReaderChapter, SourceBook } from '../lib/bible/bibleTypes'
import { recordGuestRecentViewed } from '../lib/userContent/guestStorage'
import { BibleSearchBar } from '../components/bible/BibleSearchBar'
import { ParallelVerseView } from '../components/bible/ParallelVerseView'
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
    choose: 'Reading translation', am: 'Amharic', en: 'English', gez: 'Geʽez', both: 'Both',
    languageFallback: 'Your preferred language is not available for this book. Showing an available edition.',
    independent: 'The editions are shown separately in their original order. Verse alignment has not been reviewed.',
    review: 'Bilingual alignment for this book is under review.',
    published: 'Published editions', noBooks: 'The Bible catalog is not available yet.',
    sourcePart: 'Source volume', selectChapter: 'Choose a chapter',
    sequences: 'Chapter sequences can differ between editions. Check the source volume and chapter shown above.',
    volumes: '{count} volumes',
    volumesOne: '1 volume',
    volumesHeading: 'Volumes in this book',
    textSmaller: 'Smaller text',
    textReset: 'Default text size',
    textLarger: 'Larger text',
    textSize: 'Text size',
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
    choose: 'የንባብ ትርጉም', am: 'አማርኛ', en: 'English', gez: 'ግዕዝ', both: 'ሁለቱም',
    languageFallback: 'የመረጡት ቋንቋ ለዚህ መጽሐፍ አይገኝም። የሚገኝ እትም እየታየ ነው።',
    independent: 'እትሞቹ በየራሳቸው የምንጭ ቅደም ተከተል ተለይተው ቀርበዋል። የቁጥር ማዛመድ አልተገመገመም።',
    review: 'የዚህ መጽሐፍ የሁለት ቋንቋ ማዛመድ በግምገማ ላይ ነው።',
    published: 'የታተሙ እትሞች', noBooks: 'የመጽሐፍ ቅዱስ ዝርዝር ገና አይገኝም።',
    sourcePart: 'የምንጭ ክፍል', selectChapter: 'ምዕራፍ ይምረጡ',
    sequences: 'የምዕራፍ ቅደም ተከተል በእትሞች መካከል ሊለያይ ይችላል። የሚታየውን የምንጭ ክፍል እና ምዕራፍ ያረጋግጡ።',
    volumes: '{count} ክፍሎች',
    volumesOne: '1 ክፍል',
    volumesHeading: 'በዚህ መጽሐፍ ውስጥ ያሉ ክፍሎች',
    textSmaller: 'አነስ ያለ ፊደል',
    textReset: 'መደበኛ የፊደል መጠን',
    textLarger: 'ትልቅ ፊደል',
    textSize: 'የፊደል መጠን',
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
  return { am: detail.chapters.am.length > 0, en: detail.chapters.web.length > 0, editionCodes: Object.keys(detail.byEdition) }
}

function Status({ loading, error, onRetry }: { loading: boolean; error?: string; onRetry: () => void }) {
  const w = useWords()
  if (loading) return <p className={s.status} role="status">{w.loading}</p>
  if (error) return <div className={s.status} role="alert"><p>{error}</p><button type="button" onClick={onRetry}>{w.retry}</button></div>
  return null
}

function editionLabel(edition: BibleEdition | undefined, w: { am: string; en: string; gez: string }) {
  if (!edition) return ''
  if (edition.code === 'am') return w.am
  if (edition.code === 'web') return w.en
  if (edition.language_code === 'gez') return w.gez
  return edition.name
}

function Availability({ am, en, editionCodes = [], editions = [] }: { am: boolean; en: boolean; editionCodes?: string[]; editions?: BibleEdition[] }) {
  const w = useWords()
  if (!editionCodes.length && !am && !en) return <span className={s.unavailable}>{w.unavailable}</span>
  return (
    <span className={s.badges} aria-label={w.available}>
      {am ? <span lang="am">{w.am}</span> : null}
      {en ? <span>{w.en}</span> : null}
      {editionCodes.filter((code) => code !== 'am' && code !== 'web').map((code) => <span key={code}>{editionLabel(editions.find((row) => row.code === code), w) || code}</span>)}
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
                  <Availability {...availability} editions={result.data?.editions} />
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

function ChapterGrid({ chapters, slug, editionCode, language }: { chapters: ReaderChapter[]; slug: string; editionCode: string; language: string }) {
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
                  to={`/bible/${slug}/${chapter.ordinal}?edition=${encodeURIComponent(editionCode)}`}
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
  const availableCodes = useMemo(() => detail ? Object.keys(detail.byEdition) : [], [detail])
  const preferredCode = locale === 'am' ? 'am' : 'web'
  const [selectedEdition, setSelectedEdition] = useState('')
  const gridEdition = availableCodes.includes(selectedEdition) ? selectedEdition : availableCodes.includes(preferredCode) ? preferredCode : availableCodes[0] || ''
  usePageMeta(detail?.book.name_en || w.bible, w.subtitle)

  const volumeSources = useMemo(() => {
    if (!detail) return []
    const seen = new Set<string>()
    const ordered: SourceBook[] = []
    for (const chapter of detail.byEdition[gridEdition] || []) {
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
            <Availability {...availability} editions={detail.editions} />
          </header>
          {!availableCodes.length ? (
            <p className={s.notice}>
              {detail.book.source_status === 'missing' ? w.noSource : w.notPublic}
            </p>
          ) : (
            <>
              {gridEdition !== preferredCode ? <p className={s.notice}>{w.languageFallback}</p> : null}
              {availableCodes.length > 1 ? (
                <div className={s.language} role="group" aria-label={w.choose}>
                  {availableCodes.map((code) => <button key={code} type="button" aria-pressed={gridEdition === code} onClick={() => { setSelectedEdition(code); if (code === 'am') setLocale('am'); if (code === 'web') setLocale('en') }}>{editionLabel(detail.editions.find((row) => row.code === code), w) || code}</button>)}
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
                chapters={detail.byEdition[gridEdition] || []}
                slug={detail.book.slug}
                editionCode={gridEdition}
                language={detail.editions.find((row) => row.code === gridEdition)?.language_code || 'en'}
              />
            </>
          )}
        </>
      ) : null}
    </section>
  )
}

function VerseBlock({ text, edition }: { text: ChapterText; edition?: BibleEdition }) {
  const w = useWords()
  const { uiLocale } = useLocale()
  const isEthiopic = edition?.language_code === 'am' || edition?.language_code === 'gez' || text.chapter.edition === 'am'
  const verseList = (verses: ChapterText['verses']) => (
    <ol className={s.verses} lang={edition?.language_code || (isEthiopic ? 'am' : 'en')}>
      {verses.map((verse) => (
        <li key={verse.id} id={`verse-${verse.verse_number}`}>
          <span className={s.verseNumber} aria-label={`${verse.verse_number}`}>
            {verse.verse_number}
          </span>
          <span className={isEthiopic ? s.amharicVerse : s.englishVerse}>{verse.text}</span>
        </li>
      ))}
    </ol>
  )
  const label = editionLabel(edition, w) || edition?.name || text.chapter.edition
  return <section className={s.editionBlock} aria-label={label}>
    <h2>{label} <small>{sourceName(text.chapter.source, uiLocale)} · {w.chapter} {text.chapter.chapter_number}</small></h2>
    {isEthiopic ? <>
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
  const availableCodes = useMemo(
    () => Object.keys(detail.byEdition).filter((code) => detail.byEdition[code][ordinal - 1]),
    [detail.byEdition, ordinal],
  )
  const requestedEdition = new URLSearchParams(location.search).get('edition') || ''
  const preferredEdition = locale === 'am' ? 'am' : 'web'
  const review = detail.book.slug === 'proverbs' || detail.book.slug === 'tegsats'
  // Site UI is EN/AM only; side-by-side Bible reading stays a page-local preference.
  const [chromeHidden, setChromeHidden] = useState(false)
  const lastScrollY = useRef(0)
  useEffect(() => {
    const onScroll = () => {
      const y = window.scrollY || 0
      const delta = y - lastScrollY.current
      if (y < 48) setChromeHidden(false)
      else if (delta > 8) setChromeHidden(true)
      else if (delta < -8) setChromeHidden(false)
      lastScrollY.current = y
    }
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])
  const choice = requestedEdition === 'both' && am && en && !review ? 'both' : availableCodes.includes(requestedEdition) ? requestedEdition : availableCodes.includes(preferredEdition) ? preferredEdition : availableCodes[0] || null
  const selectedChapter = choice && choice !== 'both' ? detail.byEdition[choice]?.[ordinal - 1] : null
  const chapters = useMemo(() => choice === 'both' ? [am, en].filter((chapter): chapter is ReaderChapter => Boolean(chapter)) : selectedChapter ? [selectedChapter] : [], [choice, am, en, selectedChapter])
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
  const primary = choice === 'both' ? am || en : selectedChapter
  const maxOrdinal = choice === 'both'
    ? Math.min(detail.chapters.am.length, detail.chapters.web.length)
    : (choice ? detail.byEdition[choice]?.length : 0) || 0
  const pickerChapters = choice === 'both' ? detail.chapters.am.slice(0, maxOrdinal) : (choice ? detail.byEdition[choice] || [] : []).slice(0, maxOrdinal)
  const setReading = (next: string) => {
    if (next === 'am') setLocale('am')
    if (next === 'web') setLocale('en')
    const params = new URLSearchParams(location.search)
    params.set('edition', next)
    navigate({ pathname: location.pathname, search: params.toString(), hash: location.hash }, { replace: true })
  }
  const [fontScale, setFontScale] = useState<number>(() => {
    try {
      const stored = localStorage.getItem('tewahedo_bible_font_scale')
      const val = stored ? parseFloat(stored) : 1
      return Number.isFinite(val) && val >= 0.8 && val <= 1.5 ? val : 1
    } catch {
      return 1
    }
  })

  const updateScale = (scale: number) => {
    setFontScale(scale)
    try {
      localStorage.setItem('tewahedo_bible_font_scale', String(scale))
    } catch { /* Text size remains available for this session. */ }
  }

  if (!choice) return <p className={s.status}>{w.invalidChapter}</p>
  return <>
    <header className={`${s.hero} ${chromeHidden ? s.chromeHidden : ''}`.trim()}><p className={s.eyebrow}>{detail.book.collection === 'old' ? w.old : w.newer}</p><h1>{bookName(detail.book, uiLocale)} <span>{w.chapter} {primary?.chapter_number}</span></h1>{primary && (detail.sources.length > 1) && <p>{sourceName(primary.source, uiLocale)}</p>}</header>
    <aside className={s.liturgicalBanner} aria-label="Liturgical usage">
      <span>
        <strong>{uiLocale === 'am' ? 'የመጽሐፍ ቅዱስ ንባብ' : 'Scripture Reading'}</strong>
        {': '}
        {uiLocale === 'am'
          ? 'ከቤተ ክርስቲያን ቀን መቁጠሪያ ጋር መጽሐፍ ቅዱስን ያንብቡ።'
          : 'Read Scripture alongside the Church calendar. Calendar suggestions are provided for reflection.'}
      </span>
      <Link to={(() => { const target = new URLSearchParams(location.search).get('returnTo'); return target && /^\/calendar(?:\?|$)/.test(target) ? target : '/calendar' })()} className={s.liturgicalBannerLink}>
        {uiLocale === 'am' ? 'የቤተ ክርስቲያን ቀን መቁጠሪያ' : 'View Church Calendar'} →
      </Link>
    </aside>
    <div className={`${s.readerTools} ${chromeHidden ? s.chromeHidden : ''}`.trim()}>
      {availableCodes.length > 1 ? (
        <div className={s.language} role="group" aria-label={w.choose}>
          {availableCodes.map((code) => <button key={code} type="button" aria-pressed={choice === code} onClick={() => setReading(code)}>{editionLabel(detail.editions.find((row) => row.code === code), w) || code}</button>)}
          {!review && am && en && <button type="button" aria-pressed={choice === 'both'} onClick={() => setReading('both')}>{w.both}</button>}
        </div>
      ) : <div />}
      <div className={s.fontControls} role="group" aria-label={w.textSize}>
        <button type="button" aria-label={w.textSmaller} aria-pressed={fontScale < 0.95} onClick={() => updateScale(Math.max(0.85, Math.round((fontScale - 0.15) * 100) / 100))}>A−</button>
        <button type="button" aria-label={w.textReset} aria-pressed={fontScale >= 0.95 && fontScale <= 1.05} onClick={() => updateScale(1.0)}>A</button>
        <button type="button" aria-label={w.textLarger} aria-pressed={fontScale > 1.05} onClick={() => updateScale(Math.min(1.45, Math.round((fontScale + 0.15) * 100) / 100))}>A+</button>
      </div>
    </div>
    {review && am && en && <p className={s.notice}>{w.review}</p>}
    {choice === 'both' && <p className={s.notice}>{w.independent}</p>}
    {detail.sources.length > 2 && am && en && <p className={s.notice}>{w.sequences}</p>}
    {choice !== preferredEdition && choice !== 'both' && <p className={s.notice}>{w.languageFallback}</p>}
    <label className={`${s.chapterPicker} ${chromeHidden ? s.chromeHidden : ''}`.trim()}>{w.selectChapter}
      <select value={ordinal} onChange={(event) => navigate(`/bible/${detail.book.slug}/${event.target.value}${choice && choice !== 'both' ? `?edition=${encodeURIComponent(choice)}` : ''}`)}>
        {pickerChapters.map((chapter) => (
          <option key={chapter.id} value={chapter.ordinal}>
            {(detail.sources.length > 1 ? `${sourceName(chapter.source, uiLocale)} · ` : '') +
              `${w.chapter} ${chapter.chapter_number}`}
          </option>
        ))}
      </select>
    </label>
    <Status loading={result.loading} error={result.error} onRetry={result.reload} />
    <div style={{ '--bible-scale': fontScale } as React.CSSProperties}>
      {choice === 'both' && result.data && result.data.length >= 2 ? (
        <ParallelVerseView
          amharicText={result.data[0]}
          englishText={result.data[1]}
          bookSlug={detail.book.slug}
          chapterOrdinal={ordinal}
          bookTitle={bookName(detail.book, uiLocale)}
        />
      ) : (
        result.data?.map((text) => (
          <VerseBlock
            key={text.chapter.id}
            text={text}
            edition={detail.editions.find((row) => row.code === text.chapter.edition)}
          />
        ))
      )}
    </div>
    <nav className={s.chapterNav} aria-label={w.chapters}>
      {ordinal > 1 ? (
        <Link to={`/bible/${detail.book.slug}/${ordinal - 1}${choice && choice !== 'both' ? `?edition=${encodeURIComponent(choice)}` : ''}`}>← {w.previous}</Link>
      ) : (
        <span aria-hidden="true">← {w.previous}</span>
      )}
      {ordinal < maxOrdinal ? (
        <Link to={`/bible/${detail.book.slug}/${ordinal + 1}${choice && choice !== 'both' ? `?edition=${encodeURIComponent(choice)}` : ''}`}>{w.next} →</Link>
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
