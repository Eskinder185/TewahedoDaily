import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { supabase } from '../lib/supabase/client'
import { useTranslation } from '../i18n'
import type { PublicBook } from './PublicChurchLibrary'
import { BuiltInDocumentReader } from '../components/library/BuiltInDocumentReader'
import styles from './ChurchLibraryReader.module.css'

export type ReaderSection = {
  id: string
  section_order: number
  title: string | null
  chapter_reference: string | null
}

export type ReaderPassage = {
  id: string
  section_id: string | null
  passage_order: number
  content: string
  locator_label: string | null
  page_start: number | null
  page_end: number | null
}

export function ChurchLibraryReader() {
  const { bookId } = useParams<{ bookId: string }>()
  const t = useTranslation()

  const [book, setBook] = useState<PublicBook | null>(null)
  const [sections, setSections] = useState<ReaderSection[]>([])
  const [passages, setPassages] = useState<ReaderPassage[]>([])
  const [docPath, setDocPath] = useState<string | null>(null)
  const [docName, setDocName] = useState<string>('')
  const [docType, setDocType] = useState<string | undefined>(undefined)
  const [readerMode, setReaderMode] = useState<'document' | 'passages'>('document')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  // Reader Settings
  const [fontFamily, setFontFamily] = useState<'serif' | 'sans'>('serif')
  const [fontSizePercent, setFontSizePercent] = useState<number>(100)
  const [theme, setTheme] = useState<'light' | 'sepia' | 'dark'>('light')
  const [mobileTocOpen, setMobileTocOpen] = useState(false)
  const [inBookSearch, setInBookSearch] = useState('')
  const [activeSectionId, setActiveSectionId] = useState<string | null>(null)

  const contentRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    if (!bookId) return
    let cancelled = false
    setLoading(true)
    setError(null)

    async function fetchBookData() {
      if (!supabase) {
        setError('Database connection unavailable.')
        setLoading(false)
        return
      }

      const client = supabase

      try {
        // 1. Fetch book metadata
        let bookResult = await client
          .from('church_library_books')
          .select('id, title, title_amharic, author, language, category, description, cover_storage_path, storage_path, current_version_id, processing_status, public_retrieval_enabled')
          .eq('id', bookId as string)
          .single()

        if (bookResult.error?.code === '42703' || bookResult.error?.code === 'PGRST204') {
          bookResult = await client
            .from('church_library_books')
            .select('id, title, author, language, category, description, cover_storage_path, storage_path, current_version_id, processing_status, public_retrieval_enabled')
            .eq('id', bookId as string)
            .single()
        }
        const { data: bookData, error: bookErr } = bookResult

        if (bookErr || !bookData) {
          throw new Error('Book not found or not published for public reading.')
        }

        // 2. Fetch sections
        const { data: sectionData } = await client
          .from('church_library_sections')
          .select('id, section_order, title, chapter_reference')
          .eq('book_id', bookId as string)
          .order('section_order', { ascending: true })

        // 3. Fetch passages
        const { data: passageData } = await client
          .from('church_library_passages')
          .select('id, section_id, passage_order, content, locator_label, page_start, page_end')
          .eq('book_id', bookId as string)
          .order('passage_order', { ascending: true })

        // 4. Resolve original document path
        let resolvedPath: string | null = (bookData as any).storage_path || null
        let resolvedName = bookData.title || 'document'
        let resolvedType: string | undefined = undefined

        if ((bookData as any).current_version_id) {
          try {
            const { data: versionData } = await client
              .from('church_library_book_versions')
              .select('source_storage_path, original_file_name, mime_type')
              .eq('id', (bookData as any).current_version_id)
              .maybeSingle()

            if (versionData?.source_storage_path) {
              resolvedPath = versionData.source_storage_path
              resolvedName = versionData.original_file_name || resolvedName
              resolvedType = versionData.mime_type || undefined
            }
          } catch {
            // Version lookup fallback to storage_path
          }
        }

        if (!cancelled) {
          setBook(bookData as unknown as PublicBook)
          setSections((sectionData || []) as ReaderSection[])
          setPassages((passageData || []) as ReaderPassage[])
          setDocPath(resolvedPath)
          setDocName(resolvedName)
          setDocType(resolvedType)

          // If original document exists, default to document mode, otherwise passages
          if (resolvedPath) {
            setReaderMode('document')
          } else {
            setReaderMode('passages')
          }

          if (sectionData && sectionData.length > 0) {
            setActiveSectionId(sectionData[0].id)
          }
        }
      } catch (err) {
        if (!cancelled) {
          setError(err instanceof Error ? err.message : 'Failed to load book content.')
        }
      } finally {
        if (!cancelled) setLoading(false)
      }
    }

    void fetchBookData()
    return () => {
      cancelled = true
    }
  }, [bookId])

  // Group passages by section
  const sectionPassageMap = useMemo(() => {
    const map = new Map<string, ReaderPassage[]>()
    for (const p of passages) {
      const key = p.section_id || 'unassigned'
      if (!map.has(key)) map.set(key, [])
      map.get(key)!.push(p)
    }
    return map
  }, [passages])

  // In-book search matches
  const matchPassageIds = useMemo(() => {
    const q = inBookSearch.trim().toLowerCase()
    if (!q) return new Set<string>()
    const matched = new Set<string>()
    for (const p of passages) {
      if (p.content.toLowerCase().includes(q) || (p.locator_label && p.locator_label.toLowerCase().includes(q))) {
        matched.add(p.id)
      }
    }
    return matched
  }, [passages, inBookSearch])

  const themeClass =
    theme === 'sepia'
      ? styles.themeSepia
      : theme === 'dark'
        ? styles.themeDark
        : styles.themeLight

  const fontClass = fontFamily === 'serif' ? styles.fontSerif : styles.fontSans

  const scrollToSection = (id: string) => {
    setActiveSectionId(id)
    setMobileTocOpen(false)
    const el = document.getElementById(`section-${id}`)
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }
  }

  if (loading) {
    return (
      <div className={`${styles.readerLayout} ${themeClass}`}>
        <div style={{ display: 'flex', justifyContent: 'center', padding: '6rem' }}>
          <p>{t('library.loadingBook')}</p>
        </div>
      </div>
    )
  }

  if (error || !book) {
    return (
      <div className={`${styles.readerLayout} ${themeClass}`}>
        <div style={{ maxWidth: '600px', margin: '4rem auto', textAlign: 'center', padding: '1rem' }}>
          <h2>{t('library.errorOpening')}</h2>
          <p style={{ color: 'var(--reader-muted)', margin: '1rem 0' }}>{error}</p>
          <Link to="/library" className={styles.btnControl}>
            ← {t('library.backToList')}
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className={`${styles.readerLayout} ${themeClass}`}>
      {/* Top Sticky Bar */}
      <header className={styles.topBar}>
        <div className={styles.navLeft}>
          <Link to="/library" className={styles.backLink}>
            ← {t('library.back') || 'Back'}
          </Link>
          <h1 className={styles.bookHeaderTitle} title={book.title}>
            {book.title}
          </h1>
          {book.title_amharic ? <span className={styles.bookHeaderTitle}>{book.title_amharic}</span> : null}
        </div>

        <div className={styles.controlsGroup}>
          {/* View Mode Switcher when both original document and passages exist */}
          {docPath && passages.length > 0 && (
            <div className={styles.modeSwitcher}>
              <button
                type="button"
                className={`${styles.modeBtn} ${readerMode === 'document' ? styles.modeBtnActive : ''}`}
                onClick={() => setReaderMode('document')}
              >
                📄 Original File
              </button>
              <button
                type="button"
                className={`${styles.modeBtn} ${readerMode === 'passages' ? styles.modeBtnActive : ''}`}
                onClick={() => setReaderMode('passages')}
              >
                📑 Passages
              </button>
            </div>
          )}

          {/* Passages Reader Controls */}
          {readerMode === 'passages' && (
            <>
              {/* Mobile TOC Button */}
              <button
                type="button"
                className={styles.btnControl}
                onClick={() => setMobileTocOpen(!mobileTocOpen)}
                aria-label="Toggle Table of Contents"
              >
                {t('library.toc')} ({sections.length})
              </button>

              {/* In-Book Search Input */}
              <div className={styles.inBookSearch}>
                <span aria-hidden>🔍</span>
                <input
                  type="search"
                  placeholder={t('library.findInBook')}
                  value={inBookSearch}
                  onChange={(e) => setInBookSearch(e.target.value)}
                  aria-label="Find in book"
                />
                {inBookSearch.trim() && (
                  <span style={{ fontSize: '0.75rem', opacity: 0.8 }}>
                    {matchPassageIds.size} {matchPassageIds.size === 1 ? 'hit' : 'hits'}
                  </span>
                )}
              </div>

              {/* Typography: Serif vs Sans */}
              <button
                type="button"
                className={`${styles.btnControl} ${fontFamily === 'serif' ? styles.btnControlActive : ''}`}
                onClick={() => setFontFamily('serif')}
                title="Serif font"
              >
                Serif
              </button>
              <button
                type="button"
                className={`${styles.btnControl} ${fontFamily === 'sans' ? styles.btnControlActive : ''}`}
                onClick={() => setFontFamily('sans')}
                title="Sans-serif font"
              >
                Sans
              </button>

              {/* Font Size Adjustments */}
              <button
                type="button"
                className={styles.btnControl}
                onClick={() => setFontSizePercent((s) => Math.max(85, s - 10))}
                title="Decrease font size"
                aria-label="Decrease font size"
              >
                A-
              </button>
              <button
                type="button"
                className={styles.btnControl}
                onClick={() => setFontSizePercent((s) => Math.min(150, s + 10))}
                title="Increase font size"
                aria-label="Increase font size"
              >
                A+
              </button>
            </>
          )}

          {/* Theme toggles */}
          <button
            type="button"
            className={`${styles.btnControl} ${theme === 'light' ? styles.btnControlActive : ''}`}
            onClick={() => setTheme('light')}
            title="Light theme"
          >
            ☀️
          </button>
          <button
            type="button"
            className={`${styles.btnControl} ${theme === 'sepia' ? styles.btnControlActive : ''}`}
            onClick={() => setTheme('sepia')}
            title="Sepia theme"
          >
            📜
          </button>
          <button
            type="button"
            className={`${styles.btnControl} ${theme === 'dark' ? styles.btnControlActive : ''}`}
            onClick={() => setTheme('dark')}
            title="Dark theme"
          >
            🌙
          </button>
        </div>
      </header>

      {/* Main Content Area */}
      {readerMode === 'document' && docPath ? (
        <div style={{ flex: 1, display: 'flex', minHeight: 'calc(100vh - 65px)' }}>
          <BuiltInDocumentReader
            storagePath={docPath}
            fileName={docName}
            fileType={docType}
            bookTitle={book.title}
            bookAuthor={book.author}
            mode="embedded"
          />
        </div>
      ) : (
        /* Structured Passages Reader View */
        <div className={styles.mainSplit}>
          {/* Table of Contents Sidebar */}
          <aside
            className={`${styles.sidebar} ${mobileTocOpen ? styles.sidebarOpen : ''}`}
            aria-label="Table of Contents"
          >
            <h2 className={styles.sidebarTitle}>{t('library.tableOfContents')}</h2>
            <ul className={styles.tocList}>
              {sections.length === 0 ? (
                <li className={styles.tocItem}>{book.title}</li>
              ) : (
                sections.map((sec) => (
                  <li key={sec.id}>
                    <button
                      type="button"
                      className={`${styles.tocItem} ${activeSectionId === sec.id ? styles.tocItemActive : ''}`}
                      onClick={() => scrollToSection(sec.id)}
                    >
                      {sec.title || `Section ${sec.section_order + 1}`}
                    </button>
                  </li>
                ))
              )}
            </ul>
          </aside>

          {/* Reading Pane */}
          <main className={styles.readingPane}>
            <div
              ref={contentRef}
              className={`${styles.readingContent} ${fontClass}`}
              style={{ fontSize: `${fontSizePercent}%` }}
            >
              <div style={{ textAlign: 'center', marginBottom: '3rem' }}>
                <h1 style={{ fontFamily: 'var(--font-heading, serif)', fontSize: '2.4rem', margin: '0 0 0.5rem' }}>
                  {book.title}
                </h1>
                {book.author && (
                  <p style={{ color: 'var(--reader-muted)', fontSize: '1.1rem', margin: '0 0 1rem' }}>
                    {book.author}
                  </p>
                )}
                {book.description && (
                  <p style={{ color: 'var(--reader-muted)', fontSize: '0.95rem', maxWidth: '600px', margin: '0 auto', fontStyle: 'italic' }}>
                    {book.description}
                  </p>
                )}
              </div>

              {passages.length === 0 ? (
                <div style={{ textAlign: 'center', padding: '3rem 1rem' }}>
                  <p style={{ color: 'var(--reader-muted)' }}>
                    No extracted passages available for this book yet.
                  </p>
                  {docPath && (
                    <button
                      type="button"
                      className={styles.btnControl}
                      style={{ marginTop: '1rem' }}
                      onClick={() => setReaderMode('document')}
                    >
                      📄 Open Original Document
                    </button>
                  )}
                </div>
              ) : sections.length === 0 ? (
                // Flat passages if no sections
                <div>
                  {passages.map((p) => {
                    const isMatch = inBookSearch.trim() && matchPassageIds.has(p.id)
                    return (
                      <article key={p.id} className={styles.passageBlock}>
                        <p className={`${styles.passageText} ${isMatch ? styles.highlight : ''}`}>
                          {p.content}
                        </p>
                        {p.locator_label && (
                          <div className={styles.passageMeta}>
                            <span className={styles.passageBadge}>{p.locator_label}</span>
                          </div>
                        )}
                      </article>
                    )
                  })}
                </div>
              ) : (
                // Structured sections with passages
                sections.map((sec) => {
                  const secPassages = sectionPassageMap.get(sec.id) || []
                  return (
                    <section key={sec.id} id={`section-${sec.id}`} style={{ scrollMarginTop: '80px' }}>
                      <header className={styles.sectionHeader}>
                        <h2 className={styles.sectionTitle}>{sec.title}</h2>
                      </header>

                      <div>
                        {secPassages.length === 0 ? (
                          <p style={{ color: 'var(--reader-muted)', fontStyle: 'italic' }}>
                            {t('library.sectionEmpty')}
                          </p>
                        ) : (
                          secPassages.map((p) => {
                            const isMatch = inBookSearch.trim() && matchPassageIds.has(p.id)
                            return (
                              <article key={p.id} className={styles.passageBlock}>
                                <p className={`${styles.passageText} ${isMatch ? styles.highlight : ''}`}>
                                  {p.content}
                                </p>
                                {p.locator_label && (
                                  <div className={styles.passageMeta}>
                                    <span className={styles.passageBadge}>{p.locator_label}</span>
                                  </div>
                                )}
                              </article>
                            )
                          })
                        )}
                      </div>
                    </section>
                  )
                })
              )}
            </div>
          </main>
        </div>
      )}
    </div>
  )
}
