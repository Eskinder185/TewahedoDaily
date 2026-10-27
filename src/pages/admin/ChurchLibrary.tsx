import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  DOCUMENT_ACCEPT,
  churchLibraryStatus,
  createChurchLibraryBook,
  fetchChurchLibraryDocumentBlob,
  getChurchLibraryDocumentSignedUrl,
  listChurchLibraryBooks,
  listChurchLibraryPassages,
  listChurchLibraryVersions,
  listPassageRevisions,
  previewChurchLibraryPassages,
  processChurchLibraryBook,
  removeChurchLibraryBook,
  retryChurchLibraryBook,
  rollbackChurchLibraryPassage,
  updateChurchLibraryBook,
  updateChurchLibraryPassage,
  uploadChurchLibraryCover,
  uploadChurchLibraryVersion,
  type ChurchLibraryBook,
  type ChurchLibraryPassage,
  type ChurchLibraryPassageRevision,
  type ChurchLibraryUploadProgress,
  type ChurchLibraryVersion,
} from '../../lib/cms/churchLibraryService'
import { errorMessage } from '../../lib/cms/mezmurService'
import { formatProcessingStatus } from '../../lib/cms/churchLibraryValidation'
import { parseDocx, parseEpub, parseTxt, type ParsedDocx, type ParsedEpub } from '../../lib/cms/documentReader'
import s from './Admin.module.css'
import c from './ChurchLibrary.module.css'
import { BuiltInDocumentReader } from '../../components/library/BuiltInDocumentReader'

const EMPTY_NEW = { title: '', author: '', language: 'en' as const, category: '', description: '' }
const VERIFIED_RIGHTS = new Set(['owned', 'licensed', 'public_domain', 'permission_granted'])

export function ChurchLibrary() {
  const [books, setBooks] = useState<ChurchLibraryBook[]>([])
  const [selectedId, setSelectedId] = useState('')
  const [draft, setDraft] = useState<ChurchLibraryBook | null>(null)
  const [versions, setVersions] = useState<ChurchLibraryVersion[]>([])
  const [passages, setPassages] = useState<ChurchLibraryPassage[]>([])
  const [activeTab, setActiveTab] = useState<'details' | 'reader' | 'editor'>('details')
  type ActiveViewerState = {
    fileBuffer?: ArrayBuffer | null
    storagePath?: string | null
    fileName: string
    fileType?: string
    bookTitle: string
    bookAuthor?: string | null
    isLocalPreview?: boolean
  } | null
  const [activeViewer, setActiveViewer] = useState<ActiveViewerState>(null)

  const openBookFileViewer = useCallback((book: ChurchLibraryBook, version?: ChurchLibraryVersion | null) => {
    const path = version?.source_storage_path || book.storage_path
    if (!path) {
      setErrorRaw('No uploaded document file found for this book.')
      return
    }
    const name = version?.original_file_name || path.split('/').pop() || 'document'
    const mime = version?.mime_type || ''
    setActiveViewer({
      storagePath: path,
      fileName: name,
      fileType: mime,
      bookTitle: book.title,
      bookAuthor: book.author,
      isLocalPreview: false,
    })
  }, [])

  const openLocalFilePreview = useCallback(async (file: File, title: string, author?: string | null) => {
    try {
      const buffer = await file.arrayBuffer()
      setActiveViewer({
        fileBuffer: buffer,
        fileName: file.name,
        fileType: file.type,
        bookTitle: title.trim() || file.name,
        bookAuthor: author,
        isLocalPreview: true,
      })
    } catch (err) {
      setErrorRaw(`Could not read local file: ${errorMessage(err)}`)
    }
  }, [])

  // Search & Catalog Filter state
  const [searchQuery, setSearchQuery] = useState('')
  const [statusFilter, setStatusFilter] = useState<'all' | 'ready' | 'pending' | 'processing' | 'failed'>('all')
  const [langFilter, setLangFilter] = useState<string>('all')
  const [sortOrder, setSortOrder] = useState<'recent' | 'title' | 'author'>('recent')

  // Upload state
  const [newBook, setNewBook] = useState(EMPTY_NEW)
  const [newFile, setNewFile] = useState<File | null>(null)
  const [showNew, setShowNew] = useState(false)
  const [busy, setBusy] = useState(false)
  const [errorRaw, setErrorRaw] = useState('')
  const setError = useCallback((cause: unknown) => {
    if (!cause) {
      setErrorRaw('')
      return
    }
    const message = typeof cause === 'string' ? cause.trim() : errorMessage(cause).trim()
    setErrorRaw((prev) => (prev === message ? prev : message))
  }, [])
  const error = errorRaw
  const [notice, setNotice] = useState('')
  const [backend, setBackend] = useState<string>('Checking processing service…')
  const [backendConnected, setBackendConnected] = useState(false)
  const [uploadProgress, setUploadProgress] = useState<ChurchLibraryUploadProgress | null>(null)
  const [pendingRetryBookId, setPendingRetryBookId] = useState<string | null>(null)

  // Document Reader State
  const [readerLoading, setReaderLoading] = useState(false)
  const [readerError, setReaderError] = useState('')
  const [pdfSignedUrl, setPdfSignedUrl] = useState<string | null>(null)
  const [pdfPage, setPdfPage] = useState(1)
  const [parsedEpub, setParsedEpub] = useState<ParsedEpub | null>(null)
  const [epubChapterIndex, setEpubChapterIndex] = useState(0)
  const [parsedDocx, setParsedDocx] = useState<ParsedDocx | null>(null)
  const [parsedTxt, setParsedTxt] = useState<{ lines: string[]; text: string } | null>(null)

  // Side-by-Side Passage Editor State
  const [selectedPassageId, setSelectedPassageId] = useState<string | null>(null)
  const [passageSearch, setPassageSearch] = useState('')
  const [passageStatusFilter, setPassageStatusFilter] = useState<'all' | 'pending' | 'reviewed' | 'needs_attention'>('all')
  const [editedContent, setEditedContent] = useState('')
  const [editedStatus, setEditedStatus] = useState<'pending' | 'reviewed' | 'needs_attention'>('pending')
  const [reviewerNotes, setReviewerNotes] = useState('')
  const [showDiff, setShowDiff] = useState(false)
  const [revisions, setRevisions] = useState<ChurchLibraryPassageRevision[]>([])
  const [savingPassage, setSavingPassage] = useState(false)

  const selected = useMemo(() => books.find((book) => book.id === selectedId) || null, [books, selectedId])

  // Filtered & sorted book catalog
  const filteredBooks = useMemo(() => {
    return books
      .filter((book) => {
        if (searchQuery.trim()) {
          const q = searchQuery.toLowerCase()
          const matchTitle = book.title.toLowerCase().includes(q)
          const matchAuthor = (book.author || '').toLowerCase().includes(q)
          const matchCategory = (book.category || '').toLowerCase().includes(q)
          const matchDesc = (book.description || '').toLowerCase().includes(q)
          if (!matchTitle && !matchAuthor && !matchCategory && !matchDesc) return false
        }
        if (statusFilter !== 'all') {
          if (statusFilter === 'ready' && book.processing_status !== 'ready') return false
          if (statusFilter === 'pending' && !['pending', 'not_uploaded'].includes(book.processing_status)) return false
          if (statusFilter === 'processing' && book.processing_status !== 'processing') return false
          if (statusFilter === 'failed' && !['failed', 'needs_ocr'].includes(book.processing_status)) return false
        }
        if (langFilter !== 'all' && book.language !== langFilter) return false
        return true
      })
      .sort((a, b) => {
        if (sortOrder === 'title') return a.title.localeCompare(b.title)
        if (sortOrder === 'author') return (a.author || '').localeCompare(b.author || '')
        return new Date(b.updated_at || 0).getTime() - new Date(a.updated_at || 0).getTime()
      })
  }, [books, searchQuery, statusFilter, langFilter, sortOrder])

  // Active version for document reading
  const currentVersion = useMemo(() => {
    if (!selected) return null
    if (selected.current_version_id) {
      const match = versions.find((v) => v.id === selected.current_version_id)
      if (match) return match
    }
    return versions[0] || null
  }, [selected, versions])

  // Passages filtered for the side-by-side editor
  const filteredPassages = useMemo(() => {
    return passages.filter((p) => {
      if (passageStatusFilter !== 'all') {
        const status = p.review_status || 'pending'
        if (status !== passageStatusFilter) return false
      }
      if (passageSearch.trim()) {
        const q = passageSearch.toLowerCase()
        const matchContent = p.content.toLowerCase().includes(q)
        const matchLoc = (p.locator_label || '').toLowerCase().includes(q)
        if (!matchContent && !matchLoc) return false
      }
      return true
    })
  }, [passages, passageStatusFilter, passageSearch])

  // Active passage being edited
  const activePassage = useMemo(() => {
    if (!selectedPassageId) return filteredPassages[0] || passages[0] || null
    return passages.find((p) => p.id === selectedPassageId) || filteredPassages[0] || null
  }, [passages, filteredPassages, selectedPassageId])

  const load = useCallback(async (preferId?: string) => {
    const rows = await listChurchLibraryBooks()
    setBooks(rows)
    setSelectedId((current) => {
      const next = preferId || current
      return rows.some((row) => row.id === next) ? next : rows[0]?.id || ''
    })
  }, [])

  useEffect(() => {
    let cancelled = false
    void load().catch((cause) => {
      if (!cancelled) setError(cause)
    })
    void churchLibraryStatus()
      .then((status) => {
        if (cancelled) return
        setBackendConnected(status.configured)
        setBackend(
          status.configured
            ? `Processing API connected · ${status.cms_role}`
            : `Processing API connected, but dependencies are unavailable (database: ${status.database_ready ? 'ready' : 'missing'}, private bucket: ${status.private_bucket_ready ? 'ready' : 'missing'}).`,
        )
      })
      .catch((cause) => {
        if (cancelled) return
        setBackendConnected(false)
        setBackend(`Processing API unavailable: ${errorMessage(cause)}`)
      })
    return () => {
      cancelled = true
    }
  }, [load, setError])

  // Load versions and passages when selected book changes
  const selectedBookId = selected?.id
  useEffect(() => {
    setDraft(selected ? { ...selected } : null)
    setPdfSignedUrl(null)
    setParsedEpub(null)
    setParsedDocx(null)
    setParsedTxt(null)
    setReaderError('')
    if (!selectedBookId) {
      setVersions([])
      setPassages([])
      return
    }

    let cancelled = false

    void listChurchLibraryVersions(selectedBookId)
      .then((rows) => {
        if (!cancelled) setVersions(rows)
      })
      .catch((cause) => {
        if (!cancelled) setError(cause)
      })

    void listChurchLibraryPassages(selectedBookId)
      .then((rows) => {
        if (!cancelled) {
          setPassages(rows)
          setSelectedPassageId((prev) => (prev && rows.some((r) => r.id === prev) ? prev : rows[0]?.id || null))
        }
      })
      .catch((cause) => console.warn('Could not load passages:', cause))

    return () => {
      cancelled = true
    }
  }, [selectedBookId, selected, setError])

  // Unsaved changes protection
  const isDirty = (showNew && (newBook.title.trim().length > 0 || Boolean(newFile))) ||
    (Boolean(activePassage) && (editedContent !== (activePassage?.content || '') || reviewerNotes !== (activePassage?.reviewer_notes || '')))

  useEffect(() => {
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (isDirty || busy || savingPassage) {
        e.preventDefault()
        e.returnValue = ''
      }
    }
    window.addEventListener('beforeunload', handleBeforeUnload)
    return () => window.removeEventListener('beforeunload', handleBeforeUnload)
  }, [isDirty, busy, savingPassage])

  // Synchronize passage editor fields when activePassage changes
  useEffect(() => {
    if (activePassage) {
      setEditedContent(activePassage.content)
      setEditedStatus(activePassage.review_status || 'pending')
      setReviewerNotes(activePassage.reviewer_notes || '')
      void listPassageRevisions(activePassage.id)
        .then(setRevisions)
        .catch(() => setRevisions([]))

      // If document is PDF and passage has page_start, sync PDF page
      if (activePassage.page_start) {
        setPdfPage(activePassage.page_start)
      }
    } else {
      setEditedContent('')
      setReviewerNotes('')
      setRevisions([])
    }
  }, [activePassage])

  // Load document contents when entering reader or editor tab
  useEffect(() => {
    if ((activeTab === 'reader' || activeTab === 'editor') && currentVersion) {
      const storagePath = currentVersion.source_storage_path
      const mime = currentVersion.mime_type.toLowerCase()
      const fileName = currentVersion.original_file_name.toLowerCase()

      if (mime.includes('pdf') || fileName.endsWith('.pdf')) {
        setReaderLoading(true)
        setReaderError('')
        void getChurchLibraryDocumentSignedUrl(storagePath)
          .then((url) => {
            setPdfSignedUrl(url)
            setReaderLoading(false)
          })
          .catch((err) => {
            setReaderError(errorMessage(err))
            setReaderLoading(false)
          })
      } else if (mime.includes('epub') || fileName.endsWith('.epub')) {
        setReaderLoading(true)
        setReaderError('')
        void fetchChurchLibraryDocumentBlob(storagePath)
          .then((blob) => parseEpub(blob))
          .then((epub) => {
            setParsedEpub(epub)
            setEpubChapterIndex(0)
            setReaderLoading(false)
          })
          .catch((err) => {
            setReaderError(`Could not unpack EPUB: ${errorMessage(err)}`)
            setReaderLoading(false)
          })
      } else if (mime.includes('wordprocessingml') || fileName.endsWith('.docx')) {
        setReaderLoading(true)
        setReaderError('')
        void fetchChurchLibraryDocumentBlob(storagePath)
          .then((blob) => parseDocx(blob))
          .then((docx) => {
            setParsedDocx(docx)
            setReaderLoading(false)
          })
          .catch((err) => {
            setReaderError(`Could not read DOCX: ${errorMessage(err)}`)
            setReaderLoading(false)
          })
      } else if (mime.includes('plain') || fileName.endsWith('.txt')) {
        setReaderLoading(true)
        setReaderError('')
        void fetchChurchLibraryDocumentBlob(storagePath)
          .then((blob) => parseTxt(blob))
          .then((txt) => {
            setParsedTxt(txt)
            setReaderLoading(false)
          })
          .catch((err) => {
            setReaderError(`Could not read TXT: ${errorMessage(err)}`)
            setReaderLoading(false)
          })
      }
    }
  }, [activeTab, currentVersion])

  async function run(action: () => Promise<void>) {
    setBusy(true)
    setError('')
    setNotice('')
    try {
      await action()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  function updateDraft<K extends keyof ChurchLibraryBook>(key: K, value: ChurchLibraryBook[K]) {
    setDraft((current) => (current ? { ...current, [key]: value } : current))
  }

  async function saveDetails() {
    if (!draft) return
    await run(async () => {
      const saved = await updateChurchLibraryBook(draft.id, draft)
      await load(saved.id)
      setNotice('Book details saved.')
    })
  }

  async function createBook() {
    if (!newBook.title.trim()) {
      setError('Enter a book title.')
      return
    }
    if (!newFile) {
      setError('Choose an EPUB, PDF, DOCX, or UTF-8 TXT book file.')
      return
    }
    await run(async () => {
      let bookRecord: ChurchLibraryBook | undefined
      if (pendingRetryBookId) {
        bookRecord = books.find((b) => b.id === pendingRetryBookId)
      }
      if (!bookRecord) {
        bookRecord = await createChurchLibraryBook({
          title: newBook.title.trim(),
          author: newBook.author.trim() || null,
          language: newBook.language,
          category: newBook.category.trim() || null,
          description: newBook.description.trim() || null,
        })
      }
      try {
        await uploadChurchLibraryVersion(bookRecord, newFile, setUploadProgress)
        setPendingRetryBookId(null)
      } catch (cause) {
        setPendingRetryBookId(bookRecord.id)
        setShowNew(false)
        setNewBook(EMPTY_NEW)
        setNewFile(null)
        setUploadProgress(null)
        await load(bookRecord.id)
        setSelectedId(bookRecord.id)
        throw new Error(
          `The book record was saved (${bookRecord.title}) so your work is preserved, but the private file upload failed: ${errorMessage(cause)}. Retrying will reuse this existing book record without creating duplicates.`,
        )
      }
      setPendingRetryBookId(null)
      setNewBook(EMPTY_NEW)
      setNewFile(null)
      setShowNew(false)
      await load(bookRecord.id)
      if (!backendConnected) {
        setNotice('Book and private file uploaded.')
        return
      }
      try {
        const result = await processChurchLibraryBook(bookRecord.id)
        await load(bookRecord.id)
        setNotice(`Book uploaded and processed into ${result.passage_count} searchable passages.`)
      } catch (cause) {
        setError(`Book and private file were saved, but automatic processing could not start: ${errorMessage(cause)}`)
        setNotice('The upload is safe and can be processed again without re-uploading the file.')
      }
    })
  }

  async function uploadFile(file: File | undefined) {
    if (!file || !selected) return
    await run(async () => {
      await uploadChurchLibraryVersion(selected, file, setUploadProgress)
      await load(selected.id)
      setVersions(await listChurchLibraryVersions(selected.id))
      if (!backendConnected) {
        setNotice('Private original uploaded.')
        return
      }
      try {
        const result = await processChurchLibraryBook(selected.id)
        await load(selected.id)
        setVersions(await listChurchLibraryVersions(selected.id))
        setNotice(`Replacement uploaded and processed into ${result.passage_count} searchable passages.`)
      } catch (cause) {
        setError(`The replacement is safely uploaded, but processing failed: ${errorMessage(cause)}`)
        setNotice('Use Process content to retry; the uploaded file was not lost.')
      }
    })
  }

  async function uploadCover(file: File | undefined) {
    if (!file || !selected) return
    await run(async () => {
      const path = await uploadChurchLibraryCover(selected.id, file)
      await updateChurchLibraryBook(selected.id, { cover_storage_path: path } as Partial<ChurchLibraryBook>)
      await load(selected.id)
      setNotice('Cover image uploaded.')
    })
  }

  async function processBook() {
    if (!selected) return
    await run(async () => {
      const result = ['failed', 'needs_ocr'].includes(selected.processing_status)
        ? await retryChurchLibraryBook(selected.id)
        : await processChurchLibraryBook(selected.id)
      await load(selected.id)
      setVersions(await listChurchLibraryVersions(selected.id))
      const updatedPassages = await listChurchLibraryPassages(selected.id)
      setPassages(updatedPassages)
      setNotice(
        result.status === 'ready'
          ? `Extraction complete: ${result.passage_count} searchable passages.`
          : result.notes || `Processing finished with status ${result.status}.`,
      )
    })
  }

  async function preview() {
    if (!selected?.current_version_id) return
    await run(async () => {
      const p = await previewChurchLibraryPassages(selected.id)
      setPassages(p)
      setNotice('Showing up to 100 extracted passages. Verify uncertain text against the original.')
    })
  }

  async function toggleRetrieval(enabled: boolean) {
    if (!selected || !draft) return
    if (
      enabled &&
      (!draft.approved_for_ingestion ||
        !draft.allow_search_quotes ||
        !VERIFIED_RIGHTS.has(draft.rights_status) ||
        draft.processing_status !== 'ready')
    ) {
      setError(
        'Before enabling Search Buddy, finish processing, mark the book ready for indexing, select a verified rights basis, and permit short search quotations.',
      )
      return
    }
    await run(async () => {
      await updateChurchLibraryBook(selected.id, { public_retrieval_enabled: enabled } as Partial<ChurchLibraryBook>)
      await load(selected.id)
      setNotice(enabled ? 'Search Buddy access enabled for eligible excerpts.' : 'Search Buddy access disabled immediately.')
    })
  }

  async function removeBook() {
    if (!selected || !window.confirm(`Remove “${selected.title}” and all extracted passages? This cannot be undone.`)) return
    await run(async () => {
      await removeChurchLibraryBook(selected)
      await load()
      setNotice('Book removed from the Church Library.')
    })
  }

  async function handleSavePassage() {
    if (!activePassage) return
    setSavingPassage(true)
    setError('')
    try {
      const updated = await updateChurchLibraryPassage({
        passageId: activePassage.id,
        content: editedContent,
        reviewStatus: editedStatus,
        reviewerNotes,
        expectedRevision: activePassage.revision_count,
      })
      setPassages((prev) => prev.map((p) => (p.id === updated.id ? updated : p)))
      const updatedRev = await listPassageRevisions(updated.id)
      setRevisions(updatedRev)
      setNotice(`Passage ${updated.locator_label || updated.passage_order + 1} saved successfully.`)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setSavingPassage(false)
    }
  }

  async function handleRollbackPassage(targetRevision: number) {
    if (!activePassage) return
    if (!window.confirm(`Rollback passage to Revision ${targetRevision}?`)) return
    setSavingPassage(true)
    setError('')
    try {
      const updated = await rollbackChurchLibraryPassage({
        passageId: activePassage.id,
        targetRevision,
      })
      setPassages((prev) => prev.map((p) => (p.id === updated.id ? updated : p)))
      setEditedContent(updated.content)
      setEditedStatus(updated.review_status || 'pending')
      const updatedRev = await listPassageRevisions(updated.id)
      setRevisions(updatedRev)
      setNotice(`Rolled back to Revision ${targetRevision}.`)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setSavingPassage(false)
    }
  }

  return (
    <div className={c.shell}>
      <header className={s.heading}>
        <div>
          <p className={s.eyebrow}>PRIVATE DOCUMENT CMS</p>
          <h1>Church Library</h1>
          <p className={s.muted}>
            Inspect all imported books, read original documents in the CMS, verify extracted passages side-by-side, and manage Search Buddy access.
          </p>
        </div>
        <div className={s.actions}>
          <Link to="/admin/church-library/legacy-preview">Legacy five-book preview</Link>
          <button type="button" className={s.primary} onClick={() => setShowNew((value) => !value)}>
            Upload book
          </button>
        </div>
      </header>

      <div className={backendConnected ? c.serviceStatus : `${c.serviceStatus} ${c.serviceStatusWarn}`} role="status">
        {backend}
      </div>
      {error && !backend.includes(error) && <p className={s.error} role="alert">{error}</p>}
      {notice && <p className={s.success} role="status">{notice}</p>}

      {showNew && (
        <section id="upload-panel" className={s.card} aria-label="Add a book">
          <h2>Upload a book</h2>
          <div className={c.fieldGrid}>
            <label>
              Title
              <input value={newBook.title} onChange={(event) => setNewBook({ ...newBook, title: event.target.value })} />
            </label>
            <label>
              Author
              <input value={newBook.author} onChange={(event) => setNewBook({ ...newBook, author: event.target.value })} />
            </label>
            <label>
              Language
              <select
                value={newBook.language}
                onChange={(event) => setNewBook({ ...newBook, language: event.target.value as typeof newBook.language })}
              >
                <option value="en">English</option>
                <option value="am">Amharic</option>
                <option value="gez">Geʽez</option>
                <option value="mixed">Mixed</option>
                <option value="other">Other</option>
              </select>
            </label>
            <label>
              Category
              <input value={newBook.category} onChange={(event) => setNewBook({ ...newBook, category: event.target.value })} />
            </label>
            <label className={c.wide}>
              Description
              <textarea
                value={newBook.description}
                onChange={(event) => setNewBook({ ...newBook, description: event.target.value })}
              />
            </label>
            <label className={c.wide}>
              Book file
              <input
                type="file"
                accept={DOCUMENT_ACCEPT}
                disabled={busy}
                onChange={(event) => setNewFile(event.target.files?.[0] || null)}
              />
              <small>EPUB, PDF, DOCX, or UTF-8 TXT · maximum 50 MiB</small>
            </label>
          </div>
          {newFile && (
            <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center', marginTop: '0.5rem', flexWrap: 'wrap' }}>
              <p className={c.selectedFile} style={{ margin: 0, flex: 1 }}>
                <strong>{newFile.name}</strong>
                <span>{(newFile.size / 1024 / 1024).toFixed(2)} MiB</span>
              </p>
              <button
                type="button"
                className={s.secondary}
                onClick={() => void openLocalFilePreview(newFile, newBook.title || newFile.name, newBook.author)}
              >
                👁️ Preview (Not yet uploaded)
              </button>
            </div>
          )}
          {uploadProgress && (
            <div className={c.uploadProgress} role="status" aria-live="polite">
              <progress id="upload-progress" max="100" value={uploadProgress.percent}>
                {uploadProgress.percent}%
              </progress>
              <span>
                {uploadProgress.message} {uploadProgress.percent}%
              </span>
            </div>
          )}
          <div className={s.actions}>
            <button className={s.primary} disabled={busy || !newFile} onClick={() => void createBook()}>
              Upload and process
            </button>
            <button
              disabled={busy}
              onClick={() => {
                setShowNew(false)
                setNewFile(null)
                setUploadProgress(null)
              }}
            >
              Cancel
            </button>
          </div>
        </section>
      )}

      {/* Navigation Tabs when a book is selected */}
      {selected && (
        <nav className={c.tabBar} aria-label="Book sections">
          <button
            type="button"
            className={`${c.tabButton} ${activeTab === 'details' ? c.tabButtonActive : ''}`}
            onClick={() => setActiveTab('details')}
          >
            Overview & Metadata
          </button>
          <button
            type="button"
            className={`${c.tabButton} ${activeTab === 'reader' ? c.tabButtonActive : ''}`}
            onClick={() => setActiveTab('reader')}
          >
            Visual Book Reader {currentVersion ? `(${currentVersion.mime_type.split('/')[1]?.toUpperCase() || 'Doc'})` : ''}
          </button>
          <button
            type="button"
            className={`${c.tabButton} ${activeTab === 'editor' ? c.tabButtonActive : ''}`}
            onClick={() => setActiveTab('editor')}
          >
            Side-by-Side Passage Editor ({passages.length})
          </button>
        </nav>
      )}

      <div className={c.workspace}>
        {/* Catalog Sidebar */}
        <aside className={c.catalog} aria-label="Church Library books">
          <div className={c.catalogHead}>
            <h2>
              Books <span>({filteredBooks.length}/{books.length})</span>
            </h2>
          </div>

          <div className={c.searchBox}>
            <input
              type="search"
              placeholder="Search books…"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              aria-label="Search books"
            />
            <div className={c.filterRow}>
              <select value={statusFilter} onChange={(e) => setStatusFilter(e.target.value as typeof statusFilter)}>
                <option value="all">All statuses</option>
                <option value="ready">Ready</option>
                <option value="pending">Pending</option>
                <option value="processing">Processing</option>
                <option value="failed">Failed/OCR</option>
              </select>
              <select value={langFilter} onChange={(e) => setLangFilter(e.target.value)}>
                <option value="all">All languages</option>
                <option value="en">English</option>
                <option value="am">Amharic</option>
                <option value="gez">Geʽez</option>
                <option value="mixed">Mixed</option>
              </select>
            </div>
            <select value={sortOrder} onChange={(e) => setSortOrder(e.target.value as typeof sortOrder)}>
              <option value="recent">Sort by: Recently updated</option>
              <option value="title">Sort by: Title (A-Z)</option>
              <option value="author">Sort by: Author (A-Z)</option>
            </select>
          </div>

          <div className={c.bookList}>
            {filteredBooks.map((book) => {
              const isSelected = book.id === selectedId
              return (
                <div
                  key={book.id}
                  className={`${c.bookCard} ${isSelected ? c.selected : ''}`}
                  onClick={() => setSelectedId(book.id)}
                  role="button"
                  tabIndex={0}
                  onKeyDown={(e) => {
                    if (e.key === 'Enter' || e.key === ' ') setSelectedId(book.id)
                  }}
                >
                  <div className={c.bookCardHeader}>
                    <strong>{book.title}</strong>
                    <span className={book.public_retrieval_enabled ? c.publicBadge : c.privateBadge}>
                      {book.public_retrieval_enabled ? 'Search Buddy on' : 'Private'}
                    </span>
                  </div>
                  <div className={c.bookMetaRow}>
                    <span>{book.author || 'Author not recorded'}</span>
                    <span>·</span>
                    <span
                      className={`${c.statusPill} ${
                        book.processing_status === 'ready'
                          ? c.statusReady
                          : ['pending', 'not_uploaded'].includes(book.processing_status)
                          ? c.statusPending
                          : c.statusFailed
                      }`}
                    >
                      {formatProcessingStatus(book.processing_status, Boolean(book.current_version_id))}
                    </span>
                  </div>
                  {isSelected && (
                    <div className={c.cardActions}>
                      {(book.current_version_id || book.storage_path || versions.length > 0) && (
                        <button
                          type="button"
                          className={c.cardActionBtn}
                          onClick={(e) => {
                            e.stopPropagation()
                            openBookFileViewer(book, currentVersion)
                          }}
                        >
                          👁️ View File
                        </button>
                      )}
                      <button
                        type="button"
                        className={c.cardActionBtn}
                        onClick={(e) => {
                          e.stopPropagation()
                          setActiveTab('reader')
                        }}
                      >
                        Read Book
                      </button>
                      <button
                        type="button"
                        className={c.cardActionBtn}
                        onClick={(e) => {
                          e.stopPropagation()
                          setActiveTab('editor')
                        }}
                      >
                        Edit Passages
                      </button>
                    </div>
                  )}
                </div>
              )
            })}
            {!filteredBooks.length && <p className={s.muted}>No books match current filters.</p>}
          </div>
        </aside>

        {/* Main Content Area */}
        {draft ? (
          <main className={c.editor}>
            {/* TAB 1: DETAILS & METADATA */}
            {activeTab === 'details' && (
              <>
                <section className={s.card}>
                  <div className={c.sectionHead}>
                    <div>
                      <h2>Book details</h2>
                      <p>Metadata shown with grounded citations.</p>
                    </div>
                    <span>{formatProcessingStatus(draft.processing_status, Boolean(draft.current_version_id))}</span>
                  </div>
                  <div className={c.fieldGrid}>
                    <label>
                      Title
                      <input value={draft.title} onChange={(event) => updateDraft('title', event.target.value)} />
                    </label>
                    <label>
                      Author
                      <input
                        value={draft.author || ''}
                        onChange={(event) => updateDraft('author', event.target.value || null)}
                      />
                    </label>
                    <label>
                      Language
                      <select
                        value={draft.language}
                        onChange={(event) =>
                          updateDraft('language', event.target.value as ChurchLibraryBook['language'])
                        }
                      >
                        <option value="en">English</option>
                        <option value="am">Amharic</option>
                        <option value="gez">Geʽez</option>
                        <option value="mixed">Mixed</option>
                        <option value="other">Other</option>
                      </select>
                    </label>
                    <label>
                      Category
                      <input
                        value={draft.category || ''}
                        onChange={(event) => updateDraft('category', event.target.value || null)}
                      />
                    </label>
                    <label className={c.wide}>
                      Description
                      <textarea
                        value={draft.description || ''}
                        onChange={(event) => updateDraft('description', event.target.value || null)}
                      />
                    </label>
                  </div>
                  <details className={c.history}>
                    <summary>Advanced metadata</summary>
                    <div className={c.fieldGrid}>
                      <label className={c.wide}>
                        Original publication information
                        <textarea
                          value={draft.original_publication_info || ''}
                          onChange={(event) => updateDraft('original_publication_info', event.target.value || null)}
                        />
                      </label>
                      <label className={c.wide}>
                        External source link
                        <input
                          type="url"
                          value={draft.source_url || ''}
                          onChange={(event) => updateDraft('source_url', event.target.value || null)}
                        />
                      </label>
                    </div>
                  </details>
                  <div className={s.actions}>
                    <button className={s.primary} disabled={busy} onClick={() => void saveDetails()}>
                      Save details
                    </button>
                  </div>
                </section>

                <section className={s.card}>
                  <div className={c.sectionHead}>
                    <div>
                      <h2>Original document</h2>
                      <p>Private storage · PDF, DOCX, UTF-8 TXT, or EPUB · 50 MiB maximum</p>
                    </div>
                  </div>
                  <div className={c.uploadRow}>
                    <label>
                      Upload or replace file
                      <input
                        type="file"
                        accept={DOCUMENT_ACCEPT}
                        disabled={busy}
                        onChange={(event) => {
                          void uploadFile(event.target.files?.[0])
                          event.target.value = ''
                        }}
                      />
                    </label>
                    <label>
                      Optional cover image
                      <input
                        type="file"
                        accept="image/jpeg,image/png,image/webp"
                        disabled={busy}
                        onChange={(event) => {
                          void uploadCover(event.target.files?.[0])
                          event.target.value = ''
                        }}
                      />
                    </label>
                  </div>
                  {uploadProgress && (
                    <div className={c.uploadProgress} role="status" aria-live="polite">
                      <progress max="100" value={uploadProgress.percent}>
                        {uploadProgress.percent}%
                      </progress>
                      <span>
                        {uploadProgress.message} {uploadProgress.percent}%
                      </span>
                    </div>
                  )}
                  <div className={s.actions}>
                    {(currentVersion || draft.storage_path) && (
                      <button
                        type="button"
                        className={s.secondary}
                        onClick={() => openBookFileViewer(draft, currentVersion)}
                      >
                        👁️ View File
                      </button>
                    )}
                    <button
                      className={s.primary}
                      disabled={busy || !draft.current_version_id || !backendConnected}
                      onClick={() => void processBook()}
                    >
                      {draft.processing_status === 'ready' ? 'Reprocess book' : 'Process content'}
                    </button>
                    <button disabled={busy || draft.processing_status !== 'ready'} onClick={() => void preview()}>
                      Preview extracted content
                    </button>
                    {currentVersion && (
                      <>
                        <button type="button" onClick={() => setActiveTab('reader')}>
                          Open Visual Reader
                        </button>
                        <button
                          type="button"
                          onClick={async () => {
                            try {
                              const url = await getChurchLibraryDocumentSignedUrl(currentVersion.source_storage_path)
                              window.open(url, '_blank', 'noopener,noreferrer')
                            } catch (err) {
                              setError(`Could not open document: ${errorMessage(err)}`)
                            }
                          }}
                        >
                          Download original file
                        </button>
                      </>
                    )}
                  </div>
                  {draft.extraction_notes && (
                    <p className={draft.extraction_quality === 'good' ? s.notice : s.warn}>{draft.extraction_notes}</p>
                  )}
                  <details className={c.history}>
                    <summary>File history and ingestion errors ({versions.length})</summary>
                    {versions.map((version) => (
                      <div key={version.id} className={c.version}>
                        <strong>
                          Version {version.version_number}: {version.original_file_name}
                        </strong>
                        <span>
                          {version.processing_status} · {version.passage_count} passages
                          {version.page_count ? ` · ${version.page_count} pages` : ''}
                        </span>
                        <button
                          type="button"
                          className={s.textBtn}
                          style={{ marginInlineStart: 'auto', fontSize: '0.8125rem' }}
                          onClick={async () => {
                            try {
                              const url = await getChurchLibraryDocumentSignedUrl(version.source_storage_path)
                              window.open(url, '_blank', 'noopener,noreferrer')
                            } catch (err) {
                              setError(`Could not open document: ${errorMessage(err)}`)
                            }
                          }}
                        >
                          Open file ↗
                        </button>
                        {version.error_message && (
                          <p role="alert">
                            {version.error_code}: {version.error_message}
                          </p>
                        )}
                      </div>
                    ))}
                  </details>
                </section>

                <section className={s.card}>
                  <div className={c.sectionHead}>
                    <div>
                      <h2>Search Buddy access</h2>
                      <p>Processing readiness and public retrieval are separate decisions.</p>
                    </div>
                  </div>
                  <div className={c.fieldGrid}>
                    <label>
                      Document access
                      <select
                        id="access-level"
                        value={draft.access_level}
                        onChange={(event) =>
                          updateDraft('access_level', event.target.value as ChurchLibraryBook['access_level'])
                        }
                      >
                        <option value="private">Private</option>
                        <option value="staff">Staff only</option>
                        <option value="public_search">Public Search Buddy excerpts</option>
                      </select>
                    </label>
                    <label>
                      Rights basis
                      <select
                        id="rights"
                        value={draft.rights_status}
                        onChange={(event) =>
                          updateDraft('rights_status', event.target.value as ChurchLibraryBook['rights_status'])
                        }
                      >
                        <option value="unknown">Unknown — keep private</option>
                        <option value="owned">Owned</option>
                        <option value="licensed">Licensed</option>
                        <option value="public_domain">Public domain</option>
                        <option value="permission_granted">Permission granted</option>
                        <option value="restricted">Restricted</option>
                      </select>
                    </label>
                    <label className={c.wide}>
                      Rights notes
                      <textarea
                        value={draft.rights_notes || ''}
                        onChange={(event) => updateDraft('rights_notes', event.target.value || null)}
                        placeholder="Record the actual permission, license, or public-domain basis."
                      />
                    </label>
                    <label className={s.check}>
                      <input
                        id="ready"
                        type="checkbox"
                        checked={draft.approved_for_ingestion}
                        onChange={(event) => updateDraft('approved_for_ingestion', event.target.checked)}
                      />
                      Ready for indexing (not publication)
                    </label>
                    <label className={s.check}>
                      <input
                        id="quotes"
                        type="checkbox"
                        checked={draft.allow_search_quotes}
                        onChange={(event) => updateDraft('allow_search_quotes', event.target.checked)}
                      />
                      Permit short grounded excerpts in search
                    </label>
                    <label className={s.check}>
                      <input
                        id="source-link"
                        type="checkbox"
                        checked={draft.allow_source_link}
                        onChange={(event) => updateDraft('allow_source_link', event.target.checked)}
                      />
                      Show the external source link
                    </label>
                  </div>
                  <div className={s.actions}>
                    <button disabled={busy} onClick={() => void saveDetails()}>
                      Save access settings
                    </button>
                    {draft.public_retrieval_enabled ? (
                      <button className={s.danger} disabled={busy} onClick={() => void toggleRetrieval(false)}>
                        Disable Search Buddy access
                      </button>
                    ) : (
                      <button className={s.primary} disabled={busy} onClick={() => void toggleRetrieval(true)}>
                        Enable Search Buddy access
                      </button>
                    )}
                  </div>
                </section>

                <section className={`${s.card} ${c.dangerZone}`}>
                  <h2>Remove book</h2>
                  <p>This removes metadata and extracted indexes. It does not expose or publish anything.</p>
                  <button className={s.danger} disabled={busy} onClick={() => void removeBook()}>
                    Remove book
                  </button>
                </section>
              </>
            )}

            {/* TAB 2: VISUAL BOOK READER */}
            {activeTab === 'reader' && (
              <section className={c.readerContainer} aria-label="Visual Book Reader" style={{ minHeight: '650px', padding: 0 }}>
                {currentVersion || draft.storage_path ? (
                  <BuiltInDocumentReader
                    storagePath={currentVersion?.source_storage_path || draft.storage_path}
                    fileName={currentVersion?.original_file_name || (draft.storage_path ? draft.storage_path.split('/').pop() || 'document' : 'document')}
                    fileType={currentVersion?.mime_type}
                    bookTitle={draft.title}
                    bookAuthor={draft.author}
                    mode="embedded"
                  />
                ) : (
                  <div className={c.empty} style={{ padding: '4rem 1rem' }}>
                    <p>No document uploaded yet for this book. Upload a PDF, EPUB, DOCX, or TXT file.</p>
                  </div>
                )}
              </section>
            )}

            {/* TAB 3: SIDE-BY-SIDE CONTENT EDITOR */}
            {activeTab === 'editor' && (
              <section className={c.splitView} aria-label="Compare original document with extracted passages">
                {/* Left Pane: Original Document Viewer */}
                <div className={c.splitDocPane}>
                  <div className={c.splitDocPaneHeader}>
                    <h3>Original Document</h3>
                    {pdfSignedUrl && (
                      <div className={c.readerControls}>
                        <button type="button" disabled={pdfPage <= 1} onClick={() => setPdfPage((p) => Math.max(1, p - 1))}>
                          ◀
                        </button>
                        <span>p. {pdfPage}</span>
                        <button
                          type="button"
                          disabled={Boolean(currentVersion?.page_count && pdfPage >= currentVersion.page_count)}
                          onClick={() => setPdfPage((p) => p + 1)}
                        >
                          ▶
                        </button>
                      </div>
                    )}
                  </div>

                  <div className={c.splitDocBody}>
                    {readerLoading && <p className={s.notice}>Loading original…</p>}
                    {readerError && <p className={s.error}>{readerError}</p>}

                    {pdfSignedUrl && (
                      <iframe
                        src={`${pdfSignedUrl}#page=${pdfPage}&zoom=90`}
                        className={c.docIframe}
                        style={{ height: '100%', minHeight: '400px' }}
                        title="Original document viewer"
                      />
                    )}

                    {parsedEpub && parsedEpub.chapters[epubChapterIndex] && (
                      <div
                        className={c.chapterContent}
                        style={{ fontSize: '90%', padding: '16px' }}
                        dangerouslySetInnerHTML={{ __html: parsedEpub.chapters[epubChapterIndex].html }}
                      />
                    )}

                    {parsedDocx && (
                      <div className={c.chapterContent} style={{ fontSize: '90%', padding: '16px' }}>
                        {parsedDocx.paragraphs.map((p, idx) => (
                          <p key={idx} className={c.docxParagraph}>{p.text}</p>
                        ))}
                      </div>
                    )}

                    {parsedTxt && (
                      <pre className={c.txtContent} style={{ fontSize: '85%', padding: '14px' }}>
                        {parsedTxt.text}
                      </pre>
                    )}

                    {!currentVersion && <p className={s.muted}>No original document uploaded.</p>}
                  </div>
                </div>

                {/* Right Pane: Extracted Passage Editor & Verifier */}
                <div className={c.splitEditorPane}>
                  {/* Passage Navigation & Filter Card */}
                  <div className={c.passageNavCard}>
                    <div className={c.passageNavHeader}>
                      <strong>Passages ({filteredPassages.length})</strong>
                      <div className={c.passageFilterChips}>
                        <button
                          type="button"
                          className={`${c.filterChip} ${passageStatusFilter === 'all' ? c.filterChipActive : ''}`}
                          onClick={() => setPassageStatusFilter('all')}
                        >
                          All
                        </button>
                        <button
                          type="button"
                          className={`${c.filterChip} ${passageStatusFilter === 'pending' ? c.filterChipActive : ''}`}
                          onClick={() => setPassageStatusFilter('pending')}
                        >
                          Pending
                        </button>
                        <button
                          type="button"
                          className={`${c.filterChip} ${passageStatusFilter === 'reviewed' ? c.filterChipActive : ''}`}
                          onClick={() => setPassageStatusFilter('reviewed')}
                        >
                          Reviewed
                        </button>
                        <button
                          type="button"
                          className={`${c.filterChip} ${passageStatusFilter === 'needs_attention' ? c.filterChipActive : ''}`}
                          onClick={() => setPassageStatusFilter('needs_attention')}
                        >
                          Needs Attention
                        </button>
                      </div>
                    </div>

                    <input
                      type="search"
                      placeholder="Search within extracted passages…"
                      value={passageSearch}
                      onChange={(e) => setPassageSearch(e.target.value)}
                    />

                    {/* Quick passage scroll row */}
                    <div className={c.passageScrollList}>
                      {filteredPassages.map((p) => {
                        const isCurrent = p.id === activePassage?.id
                        const status = p.review_status || 'pending'
                        return (
                          <button
                            key={p.id}
                            type="button"
                            className={`${c.passageChip} ${isCurrent ? c.passageChipSelected : ''}`}
                            onClick={() => setSelectedPassageId(p.id)}
                          >
                            <span
                              className={
                                status === 'reviewed'
                                  ? c.reviewBadgeReviewed
                                  : status === 'needs_attention'
                                  ? c.reviewBadgeAttention
                                  : c.reviewBadgePending
                              }
                            />
                            {p.locator_label || `P${p.passage_order + 1}`}
                          </button>
                        )
                      })}
                    </div>
                  </div>

                  {/* Active Passage Editor Form */}
                  {activePassage ? (
                    <div className={c.passageEditorCard}>
                      <div className={c.editorMetaBar}>
                        <div>
                          <h3>{activePassage.locator_label || `Passage #${activePassage.passage_order + 1}`}</h3>
                          <div className={c.metaPills}>
                            <span className={c.metaPill}>Lang: {activePassage.language}</span>
                            <span className={c.metaPill}>
                              Confidence: {activePassage.extraction_confidence != null ? `${Math.round(activePassage.extraction_confidence * 100)}%` : 'N/A'}
                            </span>
                            <span className={c.metaPill}>Rev #{activePassage.revision_count ?? 1}</span>
                          </div>
                        </div>

                        <div className={c.readerControls}>
                          <button
                            type="button"
                            onClick={() => setShowDiff((d) => !d)}
                            title="Toggle visual diff against original extraction"
                          >
                            {showDiff ? 'Hide Diff' : 'Compare vs Original'}
                          </button>
                        </div>
                      </div>

                      {showDiff && (
                        <div className={c.diffContainer}>
                          <small><strong>Original extracted text:</strong></small>
                          <p className={c.diffOriginal}>{activePassage.original_content || activePassage.content}</p>
                          <small><strong>Edited text:</strong></small>
                          <p className={c.diffCurrent}>{editedContent}</p>
                        </div>
                      )}

                      <label>
                        Passage Text (Editable)
                        <textarea
                          value={editedContent}
                          onChange={(e) => setEditedContent(e.target.value)}
                          className={c.contentEditorArea}
                        />
                      </label>
                      <div className={c.charCount}>
                        {editedContent.length} characters · {editedContent.split(/\s+/).filter(Boolean).length} words
                      </div>

                      <div className={c.fieldGrid}>
                        <label>
                          Review status
                          <select
                            value={editedStatus}
                            onChange={(e) => setEditedStatus(e.target.value as typeof editedStatus)}
                          >
                            <option value="pending">Pending Review</option>
                            <option value="reviewed">Approved & Verified</option>
                            <option value="needs_attention">Needs Attention / Unclear OCR</option>
                          </select>
                        </label>
                        <label>
                          Reviewer notes
                          <input
                            type="text"
                            placeholder="e.g. Corrected OCR typo in sentence 2"
                            value={reviewerNotes}
                            onChange={(e) => setReviewerNotes(e.target.value)}
                          />
                        </label>
                      </div>

                      <div className={s.actions}>
                        <button
                          type="button"
                          className={s.primary}
                          disabled={savingPassage}
                          onClick={() => void handleSavePassage()}
                        >
                          {savingPassage ? 'Saving…' : 'Save passage corrections'}
                        </button>
                      </div>

                      {/* Revision Audit Trail */}
                      <details className={c.history}>
                        <summary>Revision history ({revisions.length})</summary>
                        <div className={c.revisionList}>
                          {revisions.map((rev) => (
                            <div key={rev.id} className={c.revisionItem}>
                              <div>
                                <strong>Rev #{rev.revision_number}</strong> · {rev.review_status}
                                {rev.reviewer_notes ? ` · “${rev.reviewer_notes}”` : ''}
                                <span> · {new Date(rev.created_at).toLocaleString()}</span>
                              </div>
                              <button
                                type="button"
                                className={c.rollbackBtn}
                                disabled={savingPassage || rev.revision_number === activePassage.revision_count}
                                onClick={() => void handleRollbackPassage(rev.revision_number)}
                              >
                                Rollback
                              </button>
                            </div>
                          ))}
                          {!revisions.length && <p className={s.muted}>No previous revisions recorded yet.</p>}
                        </div>
                      </details>
                    </div>
                  ) : (
                    <div className={c.empty}>
                      <p>No passages match current filter or none extracted yet.</p>
                      {draft.current_version_id && (
                        <button
                          type="button"
                          className={s.primary}
                          onClick={() => void preview()}
                        >
                          Preview extracted content
                        </button>
                      )}
                    </div>
                  )}
                </div>
              </section>
            )}
          </main>
        ) : (
          <main className={c.empty}>
            <h2>Select a book</h2>
            <p>Choose a book from the catalog or upload a new one.</p>
          </main>
        )}
      </div>
      {activeViewer && (
        <BuiltInDocumentReader
          {...activeViewer}
          mode="modal"
          onClose={() => setActiveViewer(null)}
        />
      )}
    </div>
  )
}
