import { useCallback, useEffect, useRef, useState } from 'react'
import * as pdfjsLib from 'pdfjs-dist'
import pdfWorkerUrl from './pdfWorker?worker&url'
import mammoth from 'mammoth'
import { parseEpub, parseTxt, type ParsedEpub } from '../../lib/cms/documentReader'
import { fetchChurchLibraryDocumentBlob } from '../../lib/cms/churchLibraryService'
import styles from './BuiltInDocumentReader.module.css'

// Polyfill Uint8Array.prototype.toHex on main thread
if (typeof Uint8Array !== 'undefined' && !(Uint8Array.prototype as any).toHex) {
  ;(Uint8Array.prototype as any).toHex = function () {
    let hex = ''
    for (let i = 0; i < this.length; i++) {
      hex += this[i].toString(16).padStart(2, '0')
    }
    return hex
  }
}

// Polyfill Map.prototype.getOrInsertComputed on main thread
if (typeof Map !== 'undefined' && !(Map.prototype as any).getOrInsertComputed) {
  ;(Map.prototype as any).getOrInsertComputed = function (key: any, computeFn: any) {
    if (this.has(key)) return this.get(key)
    const val = computeFn(key)
    this.set(key, val)
    return val
  }
}

// Configure PDF.js worker
if (typeof window !== 'undefined') {
  pdfjsLib.GlobalWorkerOptions.workerSrc = pdfWorkerUrl
}

export type SupportedFormat = 'pdf' | 'epub' | 'docx' | 'txt' | 'unknown'

export type BuiltInDocumentReaderProps = {
  /** In-memory buffer (for local preview of files before upload) */
  fileBuffer?: ArrayBuffer | null
  /** Private Supabase Storage path */
  storagePath?: string | null
  fileName: string
  fileType?: string
  bookTitle: string
  bookAuthor?: string | null
  isLocalPreview?: boolean
  mode?: 'modal' | 'embedded'
  onClose?: () => void
}

export function detectFormat(fileName: string, mime?: string): SupportedFormat {
  const name = (fileName || '').toLowerCase()
  const type = (mime || '').toLowerCase()
  if (name.endsWith('.pdf') || type.includes('pdf')) return 'pdf'
  if (name.endsWith('.epub') || type.includes('epub')) return 'epub'
  if (name.endsWith('.docx') || type.includes('wordprocessingml')) return 'docx'
  if (name.endsWith('.txt') || type.includes('text/plain')) return 'txt'
  return 'unknown'
}

export function BuiltInDocumentReader({
  fileBuffer,
  storagePath,
  fileName,
  fileType,
  bookTitle,
  bookAuthor,
  isLocalPreview = false,
  mode = 'modal',
  onClose,
}: BuiltInDocumentReaderProps) {
  const format = detectFormat(fileName, fileType)

  // Loading & State
  const [loading, setLoading] = useState(true)
  const [loadingMessage, setLoadingMessage] = useState('Loading document…')
  const [error, setError] = useState<string | null>(null)
  const [dataBuffer, setDataBuffer] = useState<ArrayBuffer | null>(fileBuffer || null)

  // Reader Settings
  const [theme, setTheme] = useState<'light' | 'sepia' | 'dark'>('light')
  const [fontSize, setFontSize] = useState<number>(100) // percent
  const [isFullscreen, setIsFullscreen] = useState(false)
  const [tocOpen, setTocOpen] = useState(false)
  const [searchQuery, setSearchQuery] = useState('')

  // Format Specific Parsed Data
  // 1. PDF
  const [pdfDoc, setPdfDoc] = useState<pdfjsLib.PDFDocumentProxy | null>(null)
  const [pdfPage, setPdfPage] = useState<number>(1)
  const [pdfTotalPages, setPdfTotalPages] = useState<number>(0)
  const [pdfScale, setPdfScale] = useState<number>(1.2)
  const canvasRef = useRef<HTMLCanvasElement | null>(null)
  const renderTaskRef = useRef<any>(null)

  // 2. EPUB
  const [epubData, setEpubData] = useState<ParsedEpub | null>(null)
  const [activeChapterIndex, setActiveChapterIndex] = useState<number>(0)
  const [bookmarks, setBookmarks] = useState<number[]>([])

  // 3. DOCX
  const [docxHtml, setDocxHtml] = useState<string>('')
  const [docxWarnings, setDocxWarnings] = useState<string[]>([])

  // 4. TXT
  const [txtContent, setTxtContent] = useState<string>('')

  const containerRef = useRef<HTMLDivElement>(null)

  // ---------------------------------------------------------------------------
  // 1. Fetch / Load Buffer
  // ---------------------------------------------------------------------------
  useEffect(() => {
    let active = true

    async function loadData() {
      setLoading(true)
      setError(null)
      try {
        let buffer = fileBuffer || null
        if (!buffer && storagePath) {
          setLoadingMessage('Downloading private original from secure storage…')
          buffer = await fetchChurchLibraryDocumentBlob(storagePath)
        }
        if (!buffer) {
          throw new Error('No document data available to view.')
        }
        if (active) {
          setDataBuffer(buffer)
        }
      } catch (err) {
        if (active) {
          setError(err instanceof Error ? err.message : 'Could not open document.')
        }
      } finally {
        if (active) setLoading(false)
      }
    }

    void loadData()
    return () => {
      active = false
    }
  }, [fileBuffer, storagePath])

  // ---------------------------------------------------------------------------
  // 2. Parse Document According to Format
  // ---------------------------------------------------------------------------
  useEffect(() => {
    if (!dataBuffer) return
    let active = true

    async function parseDocument() {
      const currentBuf = dataBuffer
      if (!currentBuf) return

      setLoading(true)
      setError(null)

      try {
        const copy = currentBuf.slice(0)
        if (format === 'pdf') {
          setLoadingMessage('Parsing PDF pages…')
          const doc = await pdfjsLib.getDocument({
            data: new Uint8Array(copy),
          }).promise
          if (!active) return
          setPdfDoc(doc)
          setPdfTotalPages(doc.numPages)
          setPdfPage(1)
        } else if (format === 'epub') {
          setLoadingMessage('Unpacking EPUB chapters…')
          const parsed = await parseEpub(copy)
          if (!active) return
          setEpubData(parsed)
          setActiveChapterIndex(0)
        } else if (format === 'docx') {
          setLoadingMessage('Rendering DOCX document…')
          const converted = await mammoth.convertToHtml({ arrayBuffer: copy })
          if (!active) return
          setDocxHtml(converted.value)
          setDocxWarnings(converted.messages.map((m) => m.message))
        } else if (format === 'txt') {
          setLoadingMessage('Decoding text…')
          const { text } = parseTxt(currentBuf)
          if (!active) return
          setTxtContent(text)
        } else {
          throw new Error(`Unsupported document format: ${fileName}`)
        }
      } catch (err) {
        if (active) {
          setError(err instanceof Error ? err.message : 'Failed to parse document.')
        }
      } finally {
        if (active) setLoading(false)
      }
    }

    void parseDocument()
    return () => {
      active = false
    }
  }, [dataBuffer, format, fileName])

  // ---------------------------------------------------------------------------
  // 3. PDF Canvas Rendering
  // ---------------------------------------------------------------------------
  const renderPdfPage = useCallback(
    async (pageNumber: number) => {
      if (!pdfDoc || !canvasRef.current) return
      try {
        if (renderTaskRef.current) {
          renderTaskRef.current.cancel()
        }

        const page = await pdfDoc.getPage(pageNumber)
        const viewport = page.getViewport({ scale: pdfScale })
        const canvas = canvasRef.current
        const ctx = canvas.getContext('2d')
        if (!ctx) return

        canvas.height = viewport.height
        canvas.width = viewport.width

        const renderContext = {
          canvasContext: ctx,
          viewport,
          canvas,
        }

        const task = page.render(renderContext)
        renderTaskRef.current = task
        await task.promise
      } catch (err: any) {
        if (err?.name !== 'RenderingCancelledException') {
          console.error('PDF rendering error:', err)
        }
      }
    },
    [pdfDoc, pdfScale],
  )

  useEffect(() => {
    if (format === 'pdf' && pdfDoc) {
      void renderPdfPage(pdfPage)
    }
  }, [format, pdfDoc, pdfPage, pdfScale, renderPdfPage])

  // ---------------------------------------------------------------------------
  // Controls Handlers
  // ---------------------------------------------------------------------------
  const toggleFullscreen = () => {
    if (!document.fullscreenElement) {
      containerRef.current?.requestFullscreen?.().catch(() => {})
      setIsFullscreen(true)
    } else {
      document.exitFullscreen?.().catch(() => {})
      setIsFullscreen(false)
    }
  }

  const handleZoom = (delta: number) => {
    if (format === 'pdf') {
      setPdfScale((prev) => Math.max(0.6, Math.min(3.0, prev + delta)))
    } else {
      setFontSize((prev) => Math.max(75, Math.min(160, prev + delta * 20)))
    }
  }

  const fitToWidth = () => {
    if (format === 'pdf' && canvasRef.current && containerRef.current) {
      const containerWidth = containerRef.current.clientWidth - 48
      if (pdfDoc && containerWidth > 300) {
        void pdfDoc.getPage(pdfPage).then((page) => {
          const unscaled = page.getViewport({ scale: 1.0 })
          setPdfScale(Math.min(2.5, Math.max(0.7, containerWidth / unscaled.width)))
        })
      }
    }
  }

  // Bookmarks for EPUB
  const toggleBookmark = (chapterIdx: number) => {
    setBookmarks((prev) =>
      prev.includes(chapterIdx) ? prev.filter((i) => i !== chapterIdx) : [...prev, chapterIdx],
    )
  }

  const themeClass =
    theme === 'sepia' ? styles.themeSepia : theme === 'dark' ? styles.themeDark : styles.themeLight

  // ---------------------------------------------------------------------------
  // Renderers by format
  // ---------------------------------------------------------------------------
  const renderPdfViewer = () => (
    <div className={`${styles.paperContainer} ${styles.pdfPaper}`}>
      <canvas ref={canvasRef} className={styles.pdfCanvas} />
    </div>
  )

  const renderEpubViewer = () => {
    if (!epubData || epubData.chapters.length === 0) {
      return <div className={styles.loadingBox}>No readable chapters found in this EPUB.</div>
    }
    const currentChapter = epubData.chapters[activeChapterIndex] || epubData.chapters[0]
    return (
      <div className={styles.paperContainer} style={{ fontSize: `${fontSize}%` }}>
        <h2 style={{ marginBottom: '1.5rem', color: 'inherit' }}>{currentChapter.title}</h2>
        <div
          className={styles.formattedHtml}
          dangerouslySetInnerHTML={{ __html: currentChapter.html }}
        />
        <div
          style={{
            marginTop: '3rem',
            paddingTop: '1.5rem',
            borderTop: '1px solid var(--reader-border)',
            display: 'flex',
            justifyContent: 'space-between',
          }}
        >
          <button
            type="button"
            className={styles.toolBtn}
            disabled={activeChapterIndex <= 0}
            onClick={() => setActiveChapterIndex((i) => Math.max(0, i - 1))}
          >
            ← Previous Chapter
          </button>
          <span>
            {activeChapterIndex + 1} of {epubData.chapters.length}
          </span>
          <button
            type="button"
            className={styles.toolBtn}
            disabled={activeChapterIndex >= epubData.chapters.length - 1}
            onClick={() => setActiveChapterIndex((i) => Math.min(epubData.chapters.length - 1, i + 1))}
          >
            Next Chapter →
          </button>
        </div>
      </div>
    )
  }

  const renderDocxViewer = () => (
    <div className={styles.paperContainer} style={{ fontSize: `${fontSize}%` }}>
      <div className={styles.formatNotice}>
        <strong>Microsoft Word Preview:</strong> Layout is rendered to clean semantic HTML.
        Exact page breaks, proprietary Word shapes, and desktop margins may differ slightly from MS Word print layouts.
        {docxWarnings.length > 0 && (
          <small style={{ display: 'block', marginTop: '0.25rem', opacity: 0.85 }}>
            {docxWarnings.slice(0, 3).join(' · ')}
          </small>
        )}
      </div>
      <div className={styles.formattedHtml} dangerouslySetInnerHTML={{ __html: docxHtml }} />
    </div>
  )

  const renderTxtViewer = () => {
    const q = searchQuery.trim().toLowerCase()
    return (
      <div className={styles.paperContainer} style={{ fontSize: `${fontSize}%` }}>
        <div className={styles.formatNotice}>
          <strong>Plain Text Reader:</strong> UTF-8 Unicode encoded. Preserves authentic Geʽez, Amharic, and English paragraph boundaries.
        </div>
        <pre className={styles.plainTextContent}>
          {q ? (
            txtContent.split(new RegExp(`(${q})`, 'gi')).map((part, i) =>
              part.toLowerCase() === q ? (
                <mark key={i} className={styles.highlight}>
                  {part}
                </mark>
              ) : (
                part
              ),
            )
          ) : (
            txtContent
          )}
        </pre>
      </div>
    )
  }

  // ---------------------------------------------------------------------------
  // Component Return
  // ---------------------------------------------------------------------------
  const rootClass = mode === 'modal' ? styles.overlay : styles.embeddedContainer

  return (
    <div
      ref={containerRef}
      className={`${rootClass} ${themeClass}`}
      role={mode === 'modal' ? 'dialog' : undefined}
      aria-modal={mode === 'modal' ? 'true' : undefined}
      aria-label={bookTitle || 'Document Reader'}
    >
      {/* Local Preview Warning Banner */}
      {isLocalPreview && (
        <div className={styles.previewBanner}>
          <span>
            ⚠️ <strong>Local Preview</strong> — You are viewing a newly selected file from your device. It is not yet uploaded to the server.
          </span>
        </div>
      )}

      {/* Toolbar */}
      <header className={styles.toolbar}>
        <div className={styles.titleArea}>
          <span className={`${styles.formatBadge} ${styles[format] || ''}`}>
            {format.toUpperCase()}
          </span>
          <div className={styles.titleText}>
            <span className={styles.docTitle} title={bookTitle}>
              {bookTitle}
            </span>
            <span className={styles.docSubtitle}>
              {bookAuthor ? `${bookAuthor} · ` : ''}
              {fileName}
            </span>
          </div>
        </div>

        <div className={styles.controls}>
          {/* Table of contents toggle for EPUB */}
          {format === 'epub' && epubData && epubData.chapters.length > 0 && (
            <button
              type="button"
              className={`${styles.toolBtn} ${tocOpen ? styles.active : ''}`}
              onClick={() => setTocOpen(!tocOpen)}
              title="Table of Contents"
            >
              📖 Chapters ({epubData.chapters.length})
            </button>
          )}

          {/* PDF Page Navigation */}
          {format === 'pdf' && pdfTotalPages > 0 && (
            <div className={styles.btnGroup}>
              <button
                type="button"
                className={styles.toolBtn}
                disabled={pdfPage <= 1}
                onClick={() => setPdfPage((p) => Math.max(1, p - 1))}
                title="Previous Page"
              >
                ◀
              </button>
              <span className={styles.pageIndicator}>
                <input
                  type="number"
                  min={1}
                  max={pdfTotalPages}
                  value={pdfPage}
                  onChange={(e) => {
                    const n = parseInt(e.target.value, 10)
                    if (!isNaN(n) && n >= 1 && n <= pdfTotalPages) setPdfPage(n)
                  }}
                  className={styles.pageInput}
                />{' '}
                / {pdfTotalPages}
              </span>
              <button
                type="button"
                className={styles.toolBtn}
                disabled={pdfPage >= pdfTotalPages}
                onClick={() => setPdfPage((p) => Math.min(pdfTotalPages, p + 1))}
                title="Next Page"
              >
                ▶
              </button>
            </div>
          )}

          {/* Zoom & Fit Controls */}
          <div className={styles.btnGroup}>
            <button
              type="button"
              className={styles.toolBtn}
              onClick={() => handleZoom(-0.2)}
              title="Zoom out / Smaller text"
            >
              A-
            </button>
            <button
              type="button"
              className={styles.toolBtn}
              onClick={() => handleZoom(0.2)}
              title="Zoom in / Larger text"
            >
              A+
            </button>
            {format === 'pdf' && (
              <button
                type="button"
                className={styles.toolBtn}
                onClick={fitToWidth}
                title="Fit to page width"
              >
                ↔ Fit
              </button>
            )}
          </div>

          {/* Theme Switcher */}
          <div className={styles.btnGroup}>
            <button
              type="button"
              className={`${styles.toolBtn} ${theme === 'light' ? styles.active : ''}`}
              onClick={() => setTheme('light')}
              title="Day theme"
            >
              ☀️ Day
            </button>
            <button
              type="button"
              className={`${styles.toolBtn} ${theme === 'sepia' ? styles.active : ''}`}
              onClick={() => setTheme('sepia')}
              title="Sepia theme"
            >
              📜 Sepia
            </button>
            <button
              type="button"
              className={`${styles.toolBtn} ${theme === 'dark' ? styles.active : ''}`}
              onClick={() => setTheme('dark')}
              title="Night theme"
            >
              🌙 Night
            </button>
          </div>

          {/* In-text search box for TXT */}
          {format === 'txt' && (
            <div className={styles.searchBox}>
              <span aria-hidden>🔍</span>
              <input
                type="search"
                className={styles.searchInput}
                placeholder="Find in text…"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
              />
            </div>
          )}

          {/* Bookmark toggle for EPUB */}
          {format === 'epub' && (
            <button
              type="button"
              className={`${styles.toolBtn} ${bookmarks.includes(activeChapterIndex) ? styles.active : ''}`}
              onClick={() => toggleBookmark(activeChapterIndex)}
              title="Bookmark Chapter"
            >
              🔖
            </button>
          )}

          {/* Fullscreen Button */}
          <button
            type="button"
            className={styles.toolBtn}
            onClick={toggleFullscreen}
            title={isFullscreen ? 'Exit Fullscreen' : 'Fullscreen'}
          >
            {isFullscreen ? '⤢ Exit' : '⤡ Expand'}
          </button>

          {/* Close Modal Button */}
          {onClose && (
            <button type="button" className={styles.closeBtn} onClick={onClose} title="Close Reader">
              ✕ Close
            </button>
          )}
        </div>
      </header>

      {/* Main Body */}
      <div className={styles.readerBody}>
        {/* EPUB Table of Contents Sidebar */}
        {format === 'epub' && epubData && (
          <aside className={`${styles.sidebar} ${tocOpen ? styles.open : ''}`}>
            <div className={styles.sidebarHeader}>Table of Contents</div>
            <ul className={styles.tocList}>
              {epubData.chapters.map((ch, idx) => (
                <li
                  key={ch.id || idx}
                  className={`${styles.tocItem} ${idx === activeChapterIndex ? styles.active : ''}`}
                  onClick={() => {
                    setActiveChapterIndex(idx)
                    setTocOpen(false)
                  }}
                >
                  {bookmarks.includes(idx) ? '🔖 ' : ''}
                  {ch.title}
                </li>
              ))}
            </ul>
          </aside>
        )}

        {/* Viewport Content */}
        <main className={styles.viewport}>
          {loading ? (
            <div className={styles.loadingBox}>
              <div className={styles.spinner} />
              <p>{loadingMessage}</p>
            </div>
          ) : error ? (
            <div className={styles.errorBox}>
              <span style={{ fontSize: '2rem' }}>⚠️</span>
              <h3>Unable to display document</h3>
              <p>{error}</p>
              {onClose && (
                <button type="button" className={styles.closeBtn} onClick={onClose}>
                  Return to Church Library
                </button>
              )}
            </div>
          ) : format === 'pdf' ? (
            renderPdfViewer()
          ) : format === 'epub' ? (
            renderEpubViewer()
          ) : format === 'docx' ? (
            renderDocxViewer()
          ) : format === 'txt' ? (
            renderTxtViewer()
          ) : (
            <div className={styles.errorBox}>
              <p>Unsupported document format ({fileName}).</p>
            </div>
          )}
        </main>
      </div>
    </div>
  )
}
