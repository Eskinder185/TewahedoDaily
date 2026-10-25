import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { useAsync } from '../../lib/cms/useAsync'
import {
  createBibleEdition,
  editableVerses,
  finishBibleImport,
  listBibleImportJobs,
  loadBibleAdminCatalog,
  loadBibleChapterWorkspace,
  publishBibleChapter,
  restoreBibleRevision,
  saveBibleChapterDraft,
  saveBibleEditionMetadata,
  stageBibleImportChapter,
  startBibleImport,
  type BibleAdminCatalog,
  type BibleEditionMetadataInput,
} from '../../lib/cms/bibleAdminService'
import { parseBibleImport, type BibleImportFormat, type BibleImportPreview } from '../../lib/bible/bibleImport'
import type { BibleDraftVerse, BibleEdition } from '../../lib/bible/bibleTypes'
import styles from './BibleManager.module.css'

type Tab = 'edit' | 'import' | 'reports'
type Notice = { kind: 'success' | 'error'; text: string } | null

const EMPTY_TRANSLATION: Omit<BibleEditionMetadataInput, 'id'> & { code: string } = {
  code: '', name: '', language_code: 'gez', source_edition: '', attribution: '',
  rights_status: 'unknown', canon_code: 'eotc-81', numbering_scheme: 'source',
}

function message(cause: unknown) {
  return cause instanceof Error ? cause.message : 'An unexpected error occurred.'
}

function translationLabel(edition: BibleEdition) {
  const language = edition.language_code === 'am' ? 'Amharic' : edition.language_code === 'en' ? 'English' : edition.language_code === 'gez' ? 'Geʽez' : edition.language_code
  return `${edition.name} · ${language}`
}

function EditionPanel({ edition, onSaved }: { edition: BibleEdition; onSaved: () => void }) {
  const [form, setForm] = useState<BibleEditionMetadataInput>(() => ({ ...edition }))
  const [busy, setBusy] = useState(false)
  const [notice, setNotice] = useState<Notice>(null)
  useEffect(() => setForm({ ...edition }), [edition])
  const set = (key: keyof BibleEditionMetadataInput, value: string) => setForm((current) => ({ ...current, [key]: value }))
  async function save() {
    setBusy(true); setNotice(null)
    try { await saveBibleEditionMetadata(form); setNotice({ kind: 'success', text: 'Translation details saved.' }); onSaved() }
    catch (cause) { setNotice({ kind: 'error', text: message(cause) }) }
    finally { setBusy(false) }
  }
  return <details className={styles.metadata}>
    <summary>Translation details and publication rights</summary>
    <div className={styles.formGrid}>
      <label>Name<input value={form.name} onChange={(event) => set('name', event.target.value)} /></label>
      <label>Language code<input value={form.language_code} onChange={(event) => set('language_code', event.target.value)} placeholder="am, en, or gez" /></label>
      <label>Source edition<input value={form.source_edition || ''} onChange={(event) => set('source_edition', event.target.value)} /></label>
      <label>Canon<select value={form.canon_code} onChange={(event) => set('canon_code', event.target.value)}><option value="eotc-81">Ethiopian Orthodox 81-book canon</option><option value="eotc-custom">EOTC source-specific canon</option></select></label>
      <label>Numbering scheme<input value={form.numbering_scheme} onChange={(event) => set('numbering_scheme', event.target.value)} /></label>
      <label>Rights basis<select value={form.rights_status} onChange={(event) => set('rights_status', event.target.value)}><option value="unknown">Not verified</option><option value="owned">Owned</option><option value="licensed">Licensed</option><option value="public_domain">Public domain</option><option value="permission_granted">Permission granted</option><option value="restricted">Restricted</option></select></label>
      <label className={styles.wide}>Attribution<textarea value={form.attribution || ''} onChange={(event) => set('attribution', event.target.value)} rows={2} /></label>
    </div>
    <p className={styles.help}>Publishing remains blocked until a truthful rights basis and attribution are recorded. “Not verified” is never converted automatically.</p>
    {notice ? <p className={notice.kind === 'error' ? styles.error : styles.success} role={notice.kind === 'error' ? 'alert' : 'status'}>{notice.text}</p> : null}
    <button className={styles.secondary} type="button" disabled={busy} onClick={() => void save()}>{busy ? 'Saving…' : 'Save translation details'}</button>
  </details>
}

function ChapterEditor({ catalog, reloadCatalog }: { catalog: BibleAdminCatalog; reloadCatalog: () => void }) {
  const { profile } = useAuth()
  const [editionId, setEditionId] = useState(catalog.editions[0]?.id || '')
  const [bookId, setBookId] = useState('')
  const [sourceId, setSourceId] = useState('')
  const [chapterId, setChapterId] = useState('')
  const [verses, setVerses] = useState<BibleDraftVerse[]>([])
  const [note, setNote] = useState('')
  const [notice, setNotice] = useState<Notice>(null)
  const [busy, setBusy] = useState('')
  const sourcesForEdition = useMemo(() => catalog.sources.filter((row) => row.edition_id === editionId), [catalog.sources, editionId])
  const bookIds = useMemo(() => new Set(sourcesForEdition.map((row) => row.canonical_book_id)), [sourcesForEdition])
  const books = catalog.books.filter((row) => bookIds.has(row.id))
  const sources = sourcesForEdition.filter((row) => row.canonical_book_id === bookId)
  const chapters = catalog.chapters.filter((row) => row.source_book_id === sourceId)
  const edition = catalog.editions.find((row) => row.id === editionId)
  useEffect(() => { if (!books.some((row) => row.id === bookId)) setBookId(books[0]?.id || '') }, [bookId, books])
  useEffect(() => { if (!sources.some((row) => row.id === sourceId)) setSourceId(sources[0]?.id || '') }, [sourceId, sources])
  useEffect(() => { if (!chapters.some((row) => row.id === chapterId)) setChapterId(chapters[0]?.id || '') }, [chapterId, chapters])
  const load = useAsync(useCallback(() => chapterId ? loadBibleChapterWorkspace(chapterId) : Promise.resolve(null), [chapterId]))
  useEffect(() => { if (load.data) setVerses(editableVerses(load.data)) }, [load.data])
  const updateVerse = (index: number, patch: Partial<BibleDraftVerse>) => setVerses((current) => current.map((verse, row) => row === index ? { ...verse, ...patch } : verse))
  const addVerse = () => setVerses((current) => [...current, { section_id: null, source_order: current.length + 1, verse_number: (current.at(-1)?.verse_number || 0) + 1, text: '' }])
  const normalized = verses.map((verse, index) => ({ ...verse, source_order: index + 1, text: verse.text.trim() }))
  const invalid = !chapterId || normalized.length === 0 || normalized.some((verse) => verse.verse_number < 0 || !verse.text)
  async function saveDraft() {
    setBusy('save'); setNotice(null)
    try { await saveBibleChapterDraft(chapterId, normalized, load.data?.draft?.updated_at); setNotice({ kind: 'success', text: 'Draft saved. Public Scripture was not changed.' }); load.reload() }
    catch (cause) { setNotice({ kind: 'error', text: message(cause) }) }
    finally { setBusy('') }
  }
  async function publish() {
    setBusy('publish'); setNotice(null)
    try {
      await saveBibleChapterDraft(chapterId, normalized, load.data?.draft?.updated_at)
      await publishBibleChapter(chapterId, note)
      setNotice({ kind: 'success', text: 'Chapter published. The public reader now uses this revision.' }); setNote(''); load.reload(); reloadCatalog()
    } catch (cause) { setNotice({ kind: 'error', text: message(cause) }) }
    finally { setBusy('') }
  }
  async function restore(revisionId: string) {
    if (!window.confirm('Restore this revision into the draft editor? Published Scripture will not change until you publish.')) return
    setBusy(revisionId); setNotice(null)
    try { await restoreBibleRevision(revisionId); setNotice({ kind: 'success', text: 'Revision restored as a draft.' }); load.reload() }
    catch (cause) { setNotice({ kind: 'error', text: message(cause) }) }
    finally { setBusy('') }
  }
  return <div className={styles.stack}>
    <section className={styles.card}>
      <div className={styles.selectorGrid}>
        <label>Translation<select value={editionId} onChange={(event) => setEditionId(event.target.value)}>{catalog.editions.map((row) => <option key={row.id} value={row.id}>{translationLabel(row)}</option>)}</select></label>
        <label>Book<select value={bookId} onChange={(event) => setBookId(event.target.value)}>{books.map((row) => <option key={row.id} value={row.id}>{row.name_en || row.name_am || row.slug}</option>)}</select></label>
        {sources.length > 1 ? <label>Source volume<select value={sourceId} onChange={(event) => setSourceId(event.target.value)}>{sources.map((row) => <option key={row.id} value={row.id}>{row.source_name_en || row.source_name_am || `Volume ${row.source_part || row.source_book_number}`}</option>)}</select></label> : null}
        <label>Chapter<select value={chapterId} onChange={(event) => setChapterId(event.target.value)}>{chapters.map((row) => <option key={row.id} value={row.id}>{row.chapter_number}</option>)}</select></label>
      </div>
      {edition ? <EditionPanel edition={edition} onSaved={reloadCatalog} /> : null}
    </section>
    {load.loading ? <p role="status">Loading chapter…</p> : null}
    {load.error ? <p className={styles.error} role="alert">{load.error} <button type="button" onClick={load.reload}>Try again</button></p> : null}
    {load.data ? <>
      <section className={styles.card}>
        <div className={styles.heading}><div><p className={styles.eyebrow}>{load.data.draft ? 'Draft in progress' : 'Published text'}</p><h2>Chapter editor</h2></div><Link to={`/bible/${catalog.books.find((row) => row.id === bookId)?.slug || ''}/${chapters.findIndex((row) => row.id === chapterId) + 1}`} target="_blank">Open public reader ↗</Link></div>
        <div className={styles.verseHeader}><span>Verse</span><span>Text</span><span /></div>
        <div className={styles.verseList}>{verses.map((verse, index) => <div className={styles.verseRow} key={`${verse.section_id || 'direct'}:${index}`}>
          <input aria-label={`Verse number ${index + 1}`} type="number" min="0" value={verse.verse_number} onChange={(event) => updateVerse(index, { verse_number: Number(event.target.value) })} />
          <textarea aria-label={`Verse text ${verse.verse_number}`} lang={edition?.language_code === 'en' ? 'en' : edition?.language_code || undefined} rows={2} value={verse.text} onChange={(event) => updateVerse(index, { text: event.target.value })} />
          <button type="button" aria-label={`Remove verse ${verse.verse_number}`} onClick={() => setVerses((current) => current.filter((_, row) => row !== index))}>Remove</button>
        </div>)}</div>
        <button className={styles.secondary} type="button" onClick={addVerse}>+ Add verse</button>
        <label className={styles.note}>Revision note (optional)<input value={note} onChange={(event) => setNote(event.target.value)} /></label>
        {notice ? <p className={notice.kind === 'error' ? styles.error : styles.success} role={notice.kind === 'error' ? 'alert' : 'status'}>{notice.text}</p> : null}
        <div className={styles.actions}><button className={styles.secondary} type="button" disabled={Boolean(busy) || invalid} onClick={() => void saveDraft()}>{busy === 'save' ? 'Saving…' : 'Save Draft'}</button><button className={styles.primary} type="button" disabled={Boolean(busy) || invalid} onClick={() => void publish()}>{busy === 'publish' ? 'Publishing…' : 'Publish'}</button></div>
      </section>
      <section className={styles.card}><h2>Preview</h2><ol className={styles.preview}>{normalized.map((verse) => <li key={`${verse.source_order}:${verse.verse_number}`}><sup>{verse.verse_number}</sup><span>{verse.text || '—'}</span></li>)}</ol></section>
      <section className={styles.card}><h2>Revision history</h2>{!load.data.revisions.length ? <p className={styles.help}>No published revisions have been recorded yet.</p> : <ul className={styles.history}>{load.data.revisions.map((revision) => <li key={revision.id}><div><strong>Revision {revision.revision_number}</strong><span>{new Date(revision.created_at).toLocaleString()} · {revision.verses.length} verses</span>{revision.note ? <small>{revision.note}</small> : null}</div>{profile?.role === 'admin' || profile?.role === 'super_admin' ? <button type="button" disabled={Boolean(busy)} onClick={() => void restore(revision.id)}>{busy === revision.id ? 'Restoring…' : 'Restore to Draft'}</button> : null}</li>)}</ul>}</section>
    </> : chapterId ? null : <section className={styles.card}><p>No chapter exists for this selection. Use Bulk Import to stage a new chapter safely.</p></section>}
  </div>
}

function AddTranslation({ onCreated }: { onCreated: () => void }) {
  const [open, setOpen] = useState(false)
  const [form, setForm] = useState(EMPTY_TRANSLATION)
  const [notice, setNotice] = useState<Notice>(null)
  const [busy, setBusy] = useState(false)
  const set = (key: keyof typeof form, value: string) => setForm((current) => ({ ...current, [key]: value }))
  async function create() {
    setBusy(true); setNotice(null)
    try { await createBibleEdition(form); setNotice({ kind: 'success', text: 'Draft translation created.' }); setForm(EMPTY_TRANSLATION); onCreated(); setOpen(false) }
    catch (cause) { setNotice({ kind: 'error', text: message(cause) }) }
    finally { setBusy(false) }
  }
  return <div>{!open ? <button type="button" className={styles.secondary} onClick={() => setOpen(true)}>+ Add translation</button> : <section className={styles.card}><div className={styles.heading}><h2>Add translation</h2><button type="button" onClick={() => setOpen(false)}>Cancel</button></div><div className={styles.formGrid}>
    <label>Short code<input value={form.code} onChange={(event) => set('code', event.target.value)} placeholder="gez-liturgical" /></label><label>Name<input value={form.name} onChange={(event) => set('name', event.target.value)} /></label><label>Language<select value={form.language_code} onChange={(event) => set('language_code', event.target.value)}><option value="am">Amharic</option><option value="en">English</option><option value="gez">Geʽez</option></select></label><label>Source edition<input value={form.source_edition || ''} onChange={(event) => set('source_edition', event.target.value)} /></label><label>Rights basis<select value={form.rights_status} onChange={(event) => set('rights_status', event.target.value)}><option value="unknown">Not verified</option><option value="owned">Owned</option><option value="licensed">Licensed</option><option value="public_domain">Public domain</option><option value="permission_granted">Permission granted</option><option value="restricted">Restricted</option></select></label><label className={styles.wide}>Attribution<textarea rows={2} value={form.attribution || ''} onChange={(event) => set('attribution', event.target.value)} /></label>
  </div>{notice ? <p className={notice.kind === 'error' ? styles.error : styles.success}>{notice.text}</p> : null}<button type="button" className={styles.primary} disabled={busy || !form.code.trim() || !form.name.trim()} onClick={() => void create()}>{busy ? 'Creating…' : 'Create Draft Translation'}</button></section>}</div>
}

function ImportPanel({ catalog, onComplete }: { catalog: BibleAdminCatalog; onComplete: () => void }) {
  const [file, setFile] = useState<File | null>(null)
  const [format, setFormat] = useState<BibleImportFormat>('csv')
  const [mode, setMode] = useState<'create_only' | 'update_existing'>('create_only')
  const [editionCode, setEditionCode] = useState(catalog.editions[0]?.code || '')
  const [bookSlug, setBookSlug] = useState('')
  const [preview, setPreview] = useState<BibleImportPreview | null>(null)
  const [progress, setProgress] = useState('')
  const [notice, setNotice] = useState<Notice>(null)
  async function inspect(nextFile: File | null) {
    setFile(nextFile); setPreview(null); setNotice(null)
    if (!nextFile) return
    if (nextFile.size > 15 * 1024 * 1024) { setNotice({ kind: 'error', text: 'Files larger than 15 MB must be split into smaller batches.' }); return }
    const ext = nextFile.name.split('.').pop()?.toLowerCase()
    const detected: BibleImportFormat = ext === 'json' ? 'json' : ext === 'usfm' || ext === 'sfm' ? 'usfm' : 'csv'
    setFormat(detected)
    const parsed = parseBibleImport(await nextFile.text(), detected, { editionCode, bookSlug })
    const issues = [...parsed.issues]
    const editionByCode = new Map(catalog.editions.map((row) => [row.code, row]))
    const bookBySlug = new Map(catalog.books.map((row) => [row.slug, row]))
    parsed.chapters.forEach((chapter) => {
      const edition = editionByCode.get(chapter.editionCode)
      const book = bookBySlug.get(chapter.bookSlug)
      if (!edition) issues.push({ severity: 'error', message: `Translation code “${chapter.editionCode}” does not exist. Add or map the translation first.` })
      if (!book) issues.push({ severity: 'error', message: `Book slug “${chapter.bookSlug}” is not in the canonical EOTC book map.` })
      if (!edition || !book) return
      const sourceIds = catalog.sources.filter((row) => row.edition_id === edition.id && row.canonical_book_id === book.id).map((row) => row.id)
      const exists = catalog.chapters.some((row) => sourceIds.includes(row.source_book_id) && row.chapter_number === chapter.chapterNumber)
      if (exists) issues.push({ severity: 'warning', message: `${chapter.bookSlug} ${chapter.chapterNumber} already exists and will be ${mode === 'create_only' ? 'skipped' : 'replaced in the draft only'}.` })
    })
    setPreview({ ...parsed, issues })
  }
  async function run() {
    if (!file || !preview || preview.issues.some((issue) => issue.severity === 'error')) return
    setNotice(null); const errors: Array<{ chapter: string; message: string }> = []
    let created = 0; let updated = 0; let skipped = 0; let processed = 0
    try {
      const jobId = await startBibleImport({ fileName: file.name, format, mode, totalChapters: preview.chapters.length })
      for (const chapter of preview.chapters) {
        setProgress(`Staging ${processed + 1} of ${preview.chapters.length}: ${chapter.bookSlug} ${chapter.chapterNumber}`)
        try { const result = await stageBibleImportChapter(jobId, chapter); if (result.status === 'created') created += 1; else if (result.status === 'updated') updated += 1; else skipped += 1 }
        catch (cause) { errors.push({ chapter: `${chapter.bookSlug} ${chapter.chapterNumber}`, message: message(cause) }) }
        processed += 1
      }
      await finishBibleImport({ jobId, processed, created, updated, skipped, errors })
      setNotice({ kind: errors.length ? 'error' : 'success', text: `Import staged ${created} new and ${updated} updated chapter drafts; ${skipped} skipped; ${errors.length} failed. Nothing was published.` })
      onComplete()
    } catch (cause) { setNotice({ kind: 'error', text: message(cause) }) }
    finally { setProgress('') }
  }
  return <section className={styles.card}><h2>Bulk import</h2><p className={styles.help}>Accepted formats: CSV, JSON, and USFM. Every import is previewed and saved as drafts; it never publishes automatically.</p><div className={styles.formGrid}><label>File<input type="file" accept=".csv,.json,.usfm,.sfm,text/csv,application/json,text/plain" onChange={(event) => void inspect(event.target.files?.[0] || null)} /></label><label>Conflict behavior<select value={mode} onChange={(event) => setMode(event.target.value as typeof mode)}><option value="create_only">Create only — skip existing chapters</option><option value="update_existing">Update existing — replace the chapter draft</option></select></label>{format === 'usfm' ? <><label>Translation mapping<select value={editionCode} onChange={(event) => setEditionCode(event.target.value)}>{catalog.editions.map((row) => <option key={row.id} value={row.code}>{translationLabel(row)}</option>)}</select></label><label>Book mapping (if \id is not a canonical slug)<select value={bookSlug} onChange={(event) => setBookSlug(event.target.value)}><option value="">Use USFM \id</option>{catalog.books.map((row) => <option key={row.id} value={row.slug}>{row.name_en || row.name_am || row.slug}</option>)}</select></label></> : null}</div>
    {preview ? <div className={styles.previewBox}><strong>{preview.chapters.length} chapters · {preview.verseCount} verses</strong><ul>{preview.issues.map((issue, index) => <li key={index} data-severity={issue.severity}>{issue.row ? `Row ${issue.row}: ` : ''}{issue.message}</li>)}</ul><div className={styles.importTable}>{preview.chapters.slice(0, 30).map((chapter) => <div key={`${chapter.editionCode}:${chapter.bookSlug}:${chapter.chapterNumber}`}><span>{chapter.editionCode}</span><strong>{chapter.bookSlug} {chapter.chapterNumber}</strong><span>{chapter.verses.length} verses</span></div>)}</div>{preview.chapters.length > 30 ? <p>Plus {preview.chapters.length - 30} more chapters.</p> : null}</div> : null}
    {progress ? <p role="status">{progress}</p> : null}{notice ? <p className={notice.kind === 'error' ? styles.error : styles.success} role={notice.kind === 'error' ? 'alert' : 'status'}>{notice.text}</p> : null}<button type="button" className={styles.primary} disabled={!preview || Boolean(progress) || preview.issues.some((issue) => issue.severity === 'error')} onClick={() => void run()}>{progress ? 'Importing…' : 'Stage Import as Drafts'}</button>
  </section>
}

function ImportReports() {
  const load = useAsync(useCallback(() => listBibleImportJobs(), []))
  return <section className={styles.card}><div className={styles.heading}><h2>Import reports</h2><button type="button" onClick={load.reload}>Refresh</button></div>{load.loading ? <p>Loading…</p> : null}{load.error ? <p className={styles.error}>{load.error}</p> : null}<ul className={styles.history}>{load.data?.map((job) => <li key={job.id}><div><strong>{job.file_name}</strong><span>{new Date(job.created_at).toLocaleString()} · {job.status.replaceAll('_', ' ')}</span><small>{job.processed_chapters}/{job.total_chapters} processed · {job.created_chapters} created · {job.updated_chapters} updated · {job.skipped_chapters} skipped</small>{job.errors.length ? <small>{job.errors.length} errors — open the database report for details.</small> : null}</div></li>)}</ul></section>
}

export function BibleManager() {
  const [tab, setTab] = useState<Tab>('edit')
  const load = useAsync(useCallback(() => loadBibleAdminCatalog(), []))
  return <div className={styles.page}><header className={styles.pageHeader}><div><p className={styles.eyebrow}>SCRIPTURE CONTENT</p><h1>Bible Manager</h1><p>Edit translations and chapters without exposing drafts or replacing another translation.</p></div><Link to="/bible" target="_blank">Open Bible reader ↗</Link></header><nav className={styles.tabs} aria-label="Bible Manager sections"><button type="button" aria-pressed={tab === 'edit'} onClick={() => setTab('edit')}>Chapters</button><button type="button" aria-pressed={tab === 'import'} onClick={() => setTab('import')}>Bulk Import</button><button type="button" aria-pressed={tab === 'reports'} onClick={() => setTab('reports')}>Import Reports</button></nav>{load.loading ? <p role="status">Loading Bible Manager…</p> : null}{load.error ? <p className={styles.error} role="alert">{load.error} <button type="button" onClick={load.reload}>Try again</button></p> : null}{load.data ? <>{tab === 'edit' ? <><AddTranslation onCreated={load.reload} /><ChapterEditor catalog={load.data} reloadCatalog={load.reload} /></> : null}{tab === 'import' ? <ImportPanel catalog={load.data} onComplete={load.reload} /> : null}{tab === 'reports' ? <ImportReports /> : null}</> : null}</div>
}
