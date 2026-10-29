import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../lib/auth/useAuth'
import {
  buildSectionTree,
  chapterOf,
  descendantIds,
  getOriginalDownloadUrl,
  getPassagesForSections,
  getStructuredBook,
  listBookmarks,
  readProgress,
  saveProgress,
  sectionHref,
  toggleBookmark,
  type Bookmark,
  type Edition,
  type SectionNode,
  type StructuredBook,
  type StructuredPassage,
  type StructuredSection,
} from '../lib/churchLibrary/libraryService'
import { highlightFolded } from '../lib/churchLibrary/amharicFold'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './ChurchLibraryStructuredReader.module.css'

type Theme = 'light' | 'sepia' | 'dark'
const PREFS_KEY = 'td.churchLibrary.readerPrefs.v1'
const LANG_LABEL: Record<string, string> = { am: 'አማርኛ', en: 'English', gez: 'ግዕዝ', mixed: 'Mixed', other: 'Other' }

const COPY = {
  am: {
    contents: 'ማውጫ', bookmarks: 'ምልክቶች', noBookmarks: 'ገና ምንም ምልክት የለም።', prev: 'የቀደመው ምዕራፍ', next: 'ቀጣይ ምዕራፍ',
    smaller: 'ፊደል አሳንስ', larger: 'ፊደል አስፋ', theme: 'ገጽታ', download: 'ዋናውን ሰነድ አውርድ', copyLink: 'ማገናኛ ቅዳ', copied: 'ማገናኛው ተቀድቷል',
    bookmark: 'ምልክት አድርግ', unbookmark: 'ምልክቱን አንሳ', progress: 'የንባብ ሂደት', notFound: 'ይህ መጽሐፍ አልተገኘም ወይም ገና አልታተመም።', back: 'ወደ ቤተ መጻሕፍት',
    loading: 'በመጫን ላይ…', source: 'ምንጭ', resume: 'ካቆሙበት ይቀጥሉ', edition: 'ቋንቋ', close: 'ዝጋ',
  },
  en: {
    contents: 'Contents', bookmarks: 'Bookmarks', noBookmarks: 'No bookmarks yet.', prev: 'Previous chapter', next: 'Next chapter',
    smaller: 'Smaller text', larger: 'Larger text', theme: 'Theme', download: 'Download original document', copyLink: 'Copy link', copied: 'Link copied',
    bookmark: 'Bookmark', unbookmark: 'Remove bookmark', progress: 'Reading progress', notFound: 'This book was not found or is not published yet.', back: 'Back to the library',
    loading: 'Loading…', source: 'Source', resume: 'Resume where you left off', edition: 'Language', close: 'Close',
  },
} as const

function readPrefs(): { size: number; theme: Theme } {
  try {
    const p = JSON.parse(window.localStorage.getItem(PREFS_KEY) || '{}') as { size?: number; theme?: Theme }
    return { size: Math.min(160, Math.max(85, Number(p.size) || 100)), theme: p.theme === 'sepia' || p.theme === 'dark' ? p.theme : 'light' }
  } catch {
    return { size: 100, theme: 'light' }
  }
}

export function ChurchLibraryStructuredReader() {
  const { bookSlug = '', sectionKey } = useParams()
  const location = useLocation()
  const navigate = useNavigate()
  const { session } = useAuth()
  const userId = session?.user.id ?? null

  const [book, setBook] = useState<StructuredBook | null>(null)
  const [sections, setSections] = useState<StructuredSection[]>([])
  const [editions, setEditions] = useState<Edition[]>([])
  const [passages, setPassages] = useState<StructuredPassage[]>([])
  const [loadState, setState] = useState<'loading' | 'ready' | 'missing' | 'error'>('loading')
  const [loadedSlug, setLoadedSlug] = useState<string | null>(null)
  const state = loadedSlug === bookSlug ? loadState : 'loading'
  const [errorText, setErrorText] = useState('')
  const [prefs, setPrefs] = useState(readPrefs)
  const [panel, setPanel] = useState<'toc' | 'bookmarks' | null>(null)
  const [bookmarks, setBookmarks] = useState<Bookmark[]>([])
  const [percent, setPercent] = useState(0)
  const [toast, setToast] = useState('')
  const [activeBlock, setActiveBlock] = useState<string | null>(null)
  const [downloadUrl, setDownloadUrl] = useState<string | null>(null)
  const [resumeKey, setResumeKey] = useState<string | null>(null)
  const articleRef = useRef<HTMLElement>(null)

  const highlight = new URLSearchParams(location.search).get('q')?.trim() || ''
  const t = COPY[book?.language === 'am' ? 'am' : 'en']
  const isEthiopic = book?.language === 'am' || book?.language === 'gez'

  // ---------------------------------------------------------------- load --
  useEffect(() => {
    let alive = true
    getStructuredBook(bookSlug)
      .then((res) => {
        if (!alive) return
        setLoadedSlug(bookSlug)
        if (!res) {
          setState('missing')
          return
        }
        setBook(res.book)
        setSections(res.sections)
        setEditions(res.editions)
        setState('ready')
      })
      .catch((e: Error) => {
        if (!alive) return
        setLoadedSlug(bookSlug)
        setErrorText(e.message)
        setState('error')
      })
    return () => {
      alive = false
    }
  }, [bookSlug])

  const chapters = useMemo(() => sections.filter((s) => s.level === 1).sort((a, b) => a.section_order - b.section_order), [sections])
  const chapter = useMemo(() => chapterOf(sections, sectionKey), [sections, sectionKey])
  const chapterIndex = chapter ? chapters.findIndex((c) => c.id === chapter.id) : -1
  const tree = useMemo(() => buildSectionTree(sections), [sections])
  const sectionById = useMemo(() => new Map(sections.map((s) => [s.id, s])), [sections])

  useEffect(() => {
    if (!book || !chapter) return
    let alive = true
    getPassagesForSections(book.id, descendantIds(sections, chapter.id))
      .then((rows) => alive && setPassages(rows))
      .catch((e: Error) => alive && (setErrorText(e.message), setState('error')))
    return () => {
      alive = false
    }
  }, [book, chapter, sections])

  useEffect(() => {
    if (!book) return
    void listBookmarks(book.id, userId).then(setBookmarks)
    void getOriginalDownloadUrl(book).then(setDownloadUrl)
    if (!sectionKey) {
      void readProgress(book.id, userId).then((p) => {
        if (p?.section_key && p.section_key !== chapters[0]?.stable_key) setResumeKey(p.section_key)
      })
    }
  }, [book, userId, sectionKey, chapters])

  usePageMeta(
    chapter?.title ? `${chapter.title} · ${book?.title ?? ''}` : book?.title || 'Church Library',
    book?.description || book?.title || 'Church Library',
    undefined,
    book ? `${window.location.origin}${sectionHref(book.slug, sectionKey)}` : undefined,
  )

  // ------------------------------------------- scroll to section / paragraph --
  useEffect(() => {
    if (!passages.length) return
    const target = decodeURIComponent(location.hash.replace(/^#/, '')) || (sectionKey && sectionKey !== chapter?.stable_key ? sectionKey : '')
    if (!target) {
      window.scrollTo({ top: 0, behavior: 'instant' as ScrollBehavior })
      return
    }
    const el = document.getElementById(target)
    if (el) {
      // Instant jump: the site sets `scroll-behavior: smooth`, which would animate across a long chapter.
      el.scrollIntoView({ block: 'start', behavior: 'instant' as ScrollBehavior })
      el.classList.add(styles.flash)
      window.setTimeout(() => el.classList.remove(styles.flash), 2200)
    }
  }, [passages, location.hash, sectionKey, chapter])

  // ------------------------------------------------------- reading progress --
  const saveTimer = useRef<number | null>(null)
  const onScroll = useCallback(() => {
    const art = articleRef.current
    if (!art || !book || chapterIndex < 0 || !chapters.length) return
    const rect = art.getBoundingClientRect()
    const within = Math.min(1, Math.max(0, -rect.top / Math.max(1, rect.height - window.innerHeight)))
    const pct = Math.round(((chapterIndex + within) / chapters.length) * 1000) / 10
    setPercent(pct)
    // the section heading nearest above the top of the screen
    let current = chapter?.stable_key ?? null
    for (const h of art.querySelectorAll<HTMLElement>('[data-section-key]')) {
      if (h.getBoundingClientRect().top < 120) current = h.dataset.sectionKey || current
    }
    if (saveTimer.current) window.clearTimeout(saveTimer.current)
    saveTimer.current = window.setTimeout(() => {
      void saveProgress(book.id, userId, { section_key: current, passage_key: null, percent: pct })
    }, 800)
  }, [book, chapterIndex, chapters.length, chapter, userId])

  useEffect(() => {
    window.addEventListener('scroll', onScroll, { passive: true })
    onScroll()
    return () => window.removeEventListener('scroll', onScroll)
  }, [onScroll, passages])

  // ---------------------------------------------------------------- prefs --
  const updatePrefs = (next: Partial<typeof prefs>) => {
    setPrefs((p) => {
      const merged = { ...p, ...next }
      try {
        window.localStorage.setItem(PREFS_KEY, JSON.stringify(merged))
      } catch {
        /* ignore */
      }
      return merged
    })
  }

  const flash = (msg: string) => {
    setToast(msg)
    window.setTimeout(() => setToast((m) => (m === msg ? '' : m)), 1800)
  }

  const copyLink = async (passageKey: string, secKey: string | undefined) => {
    if (!book) return
    const url = `${window.location.origin}${sectionHref(book.slug, secKey, passageKey)}`
    try {
      await navigator.clipboard.writeText(url)
      flash(t.copied)
    } catch {
      window.prompt(t.copyLink, url)
    }
  }

  const bookmarkFor = (passageKey: string) => bookmarks.some((b) => b.passage_key === passageKey)
  const onToggleBookmark = async (p: StructuredPassage, secKey: string | undefined) => {
    if (!book || !p.stable_key) return
    const label = p.content.slice(0, 80)
    setBookmarks(await toggleBookmark(book.id, userId, { section_key: secKey ?? null, passage_key: p.stable_key, label }))
  }

  // ------------------------------------------------------------- render --
  if (state === 'loading') return <p className={styles.status} role="status">{COPY.en.loading}</p>
  if (state === 'missing' || state === 'error' || !book) {
    return (
      <div className={styles.status} role={state === 'error' ? 'alert' : undefined}>
        <p>{state === 'error' ? errorText || 'The book could not be loaded.' : COPY.en.notFound}</p>
        <Link to="/library">{COPY.en.back}</Link>
      </div>
    )
  }

  const chapterSections = chapter ? descendantIds(sections, chapter.id).map((id) => sectionById.get(id)!).filter(Boolean) : []
  const passagesBySection = new Map<string, StructuredPassage[]>()
  for (const p of passages) {
    const k = p.section_id || ''
    passagesBySection.set(k, [...(passagesBySection.get(k) || []), p])
  }
  const prev = chapterIndex > 0 ? chapters[chapterIndex - 1] : null
  const next = chapterIndex >= 0 && chapterIndex < chapters.length - 1 ? chapters[chapterIndex + 1] : null
  const otherEditions = editions.filter((e) => e.slug !== book.slug)

  const renderToc = (nodes: SectionNode[], depth = 0) => (
    <ul className={depth ? styles.tocSub : styles.tocList}>
      {nodes.map((n) => {
        const active = n.id === chapter?.id || n.stable_key === sectionKey
        const title = n.title || (n.level === 1 ? n.stable_key : null)
        if (!title) return null
        return (
          <li key={n.id}>
            <Link
              to={sectionHref(book.slug, n.stable_key)}
              className={`${styles.tocLink} ${active ? styles.tocActive : ''}`}
              aria-current={n.stable_key === sectionKey ? 'location' : undefined}
              onClick={() => setPanel(null)}
              lang={isEthiopic ? book.language : undefined}
            >
              {title}
            </Link>
            {n.level === 1 && n.id === chapter?.id && n.children.length ? renderToc(n.children, depth + 1) : null}
          </li>
        )
      })}
    </ul>
  )

  return (
    <div className={`${styles.page} ${styles[`theme_${prefs.theme}`]}`} style={{ ['--reader-scale' as string]: `${prefs.size / 100}` }}>
      <div className={styles.progressTrack} role="progressbar" aria-label={t.progress} aria-valuemin={0} aria-valuemax={100} aria-valuenow={Math.round(percent)}>
        <span style={{ width: `${percent}%` }} />
      </div>

      <header className={styles.header}>
        <div className={styles.headerMain}>
          <Link to="/library" className={styles.backLink}>← {t.back}</Link>
          <p className={styles.bookTitle} lang={isEthiopic ? book.language : undefined}>{book.title}</p>
        </div>
        <div className={styles.tools} role="toolbar" aria-label="Reader tools">
          {otherEditions.length ? (
            <div className={styles.editions} role="group" aria-label={t.edition}>
              <span className={styles.editionActive} aria-current="true">{LANG_LABEL[book.language] || book.language}</span>
              {otherEditions.map((e) => (
                <Link key={e.slug} to={sectionHref(e.slug, chapter?.stable_key)} className={styles.editionLink} lang={e.language}>
                  {LANG_LABEL[e.language] || e.language}
                </Link>
              ))}
            </div>
          ) : null}
          <button type="button" className={styles.toolBtn} onClick={() => setPanel(panel === 'toc' ? null : 'toc')} aria-expanded={panel === 'toc'} aria-controls="cl-panel">
            ☰ <span className={styles.toolLabel}>{t.contents}</span>
          </button>
          <button type="button" className={styles.toolBtn} onClick={() => setPanel(panel === 'bookmarks' ? null : 'bookmarks')} aria-expanded={panel === 'bookmarks'} aria-controls="cl-panel">
            ★ <span className={styles.toolLabel}>{t.bookmarks}</span>
          </button>
          <button type="button" className={styles.toolBtn} onClick={() => updatePrefs({ size: Math.max(85, prefs.size - 10) })} aria-label={t.smaller} disabled={prefs.size <= 85}>A−</button>
          <button type="button" className={styles.toolBtn} onClick={() => updatePrefs({ size: Math.min(160, prefs.size + 10) })} aria-label={t.larger} disabled={prefs.size >= 160}>A+</button>
          <button
            type="button"
            className={styles.toolBtn}
            onClick={() => updatePrefs({ theme: prefs.theme === 'light' ? 'sepia' : prefs.theme === 'sepia' ? 'dark' : 'light' })}
            aria-label={`${t.theme}: ${prefs.theme}`}
          >
            <svg width="18" height="18" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
              <circle cx="12" cy="12" r="8.5" fill="none" stroke="currentColor" strokeWidth="1.8" />
              <path d="M12 3.5a8.5 8.5 0 0 1 0 17z" fill="currentColor" />
            </svg>
          </button>
          {downloadUrl ? (
            <a className={styles.toolBtn} href={downloadUrl} download>
              ⬇ <span className={styles.toolLabel}>{t.download}</span>
            </a>
          ) : null}
        </div>
      </header>

      {resumeKey ? (
        <p className={styles.resume}>
          <Link to={sectionHref(book.slug, resumeKey)} onClick={() => setResumeKey(null)}>{t.resume} →</Link>
        </p>
      ) : null}

      <div className={styles.layout}>
        <nav className={`${styles.sidebar} ${panel === 'toc' ? styles.sidebarOpen : ''}`} aria-label={t.contents} id={panel === 'toc' ? 'cl-panel' : undefined}>
          <div className={styles.panelHead}>
            <h2>{t.contents}</h2>
            <button type="button" className={styles.closeBtn} onClick={() => setPanel(null)} aria-label={t.close}>✕</button>
          </div>
          {renderToc(tree)}
        </nav>

        {panel === 'bookmarks' ? (
          <aside className={`${styles.sidebar} ${styles.sidebarOpen} ${styles.bookmarkPanel}`} id="cl-panel" aria-label={t.bookmarks}>
            <div className={styles.panelHead}>
              <h2>{t.bookmarks}</h2>
              <button type="button" className={styles.closeBtn} onClick={() => setPanel(null)} aria-label={t.close}>✕</button>
            </div>
            {bookmarks.length ? (
              <ul className={styles.tocList}>
                {bookmarks.map((b) => (
                  <li key={`${b.section_key}-${b.passage_key}`}>
                    <Link to={sectionHref(book.slug, b.section_key, b.passage_key)} className={styles.tocLink} onClick={() => setPanel(null)} lang={isEthiopic ? book.language : undefined}>
                      {b.label || b.passage_key}
                    </Link>
                  </li>
                ))}
              </ul>
            ) : (
              <p className={styles.muted}>{t.noBookmarks}</p>
            )}
          </aside>
        ) : null}

        <main className={styles.main}>
          <article ref={articleRef} className={`${styles.article} ${isEthiopic ? styles.ethiopic : ''}`} lang={isEthiopic ? book.language : 'en'}>
            {chapter ? <h1 id={chapter.stable_key} data-section-key={chapter.stable_key} className={styles.chapterTitle}>{chapter.title}</h1> : null}
            {chapterSections.map((s) => {
              const list = passagesBySection.get(s.id) || []
              return (
                <section key={s.id} aria-labelledby={s.title && s.level > 1 ? `h-${s.stable_key}` : undefined}>
                  {s.title && s.level > 1 ? (
                    s.level === 2 ? (
                      <h2 id={s.stable_key} data-section-key={s.stable_key} className={styles.sectionTitle}>
                        <span id={`h-${s.stable_key}`}>{s.title}</span>
                      </h2>
                    ) : (
                      <h3 id={s.stable_key} data-section-key={s.stable_key} className={styles.subTitle}>
                        <span id={`h-${s.stable_key}`}>{s.title}</span>
                      </h3>
                    )
                  ) : null}
                  {list.map((p) => {
                    const pk = p.stable_key || p.id
                    const marked = bookmarkFor(pk)
                    const Tag = p.block_type === 'quotation' ? 'blockquote' : 'p'
                    return (
                      <div
                        key={p.id}
                        id={pk}
                        className={`${styles.block} ${activeBlock === pk ? styles.blockActive : ''} ${marked ? styles.blockMarked : ''}`}
                        onClick={(e) => {
                          if ((e.target as HTMLElement).closest('button')) return
                          setActiveBlock((cur) => (cur === pk ? null : pk))
                        }}
                      >
                        <Tag className={p.block_type === 'list_item' ? styles.listItem : p.block_type === 'quotation' ? styles.quote : styles.para}>
                          {highlight
                            ? highlightFolded(p.content, highlight).map((part, i) => (part.match ? <mark key={i}>{part.text}</mark> : part.text))
                            : p.content}
                        </Tag>
                        <div className={styles.blockActions}>
                          <button type="button" className={`${styles.miniBtn} ${marked ? styles.miniOn : ''}`} aria-pressed={marked}
                            aria-label={marked ? t.unbookmark : t.bookmark} title={marked ? t.unbookmark : t.bookmark}
                            onClick={() => void onToggleBookmark(p, s.stable_key)}>
                            {marked ? '★' : '☆'}
                          </button>
                          <button type="button" className={styles.miniBtn} aria-label={`${t.copyLink} ${pk}`} title={`${t.copyLink} · ${pk}`}
                            onClick={() => void copyLink(pk, s.stable_key)}>
                            🔗
                          </button>
                        </div>
                      </div>
                    )
                  })}
                </section>
              )
            })}
            <p className={styles.citation}>
              {t.source}: {book.title}
              {book.source_document_name ? ` · ${book.source_document_name}` : ''}
              {chapter?.title ? ` · ${chapter.title}` : ''}
            </p>
          </article>

          <nav className={styles.chapterNav} aria-label="Chapters">
            {prev ? <button type="button" onClick={() => navigate(sectionHref(book.slug, prev.stable_key))}>← {prev.title || t.prev}</button> : <span />}
            {next ? <button type="button" onClick={() => navigate(sectionHref(book.slug, next.stable_key))}>{next.title || t.next} →</button> : <span />}
          </nav>
        </main>
      </div>
      <p className={styles.toast} role="status" aria-live="polite">{toast}</p>
    </div>
  )
}
