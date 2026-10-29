import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  buildImportPreview,
  hasBlockingIssues,
  type ImportPayload,
  type ImportPreview,
  type SourceFile,
} from '../../lib/churchLibrary/structuredImport'
import {
  existingImportFingerprints,
  importStructured,
  listStructuredBooksForReview,
  sectionHref,
  setPublicationStatus,
  type PublicationStatus,
  type ReviewBook,
} from '../../lib/churchLibrary/libraryService'
import s from './Admin.module.css'
import c from './ChurchLibraryImport.module.css'

const STATUS_LABEL: Record<string, string> = { draft: 'Draft', reviewed: 'Reviewed', published: 'Published' }

function errorText(e: unknown) {
  return e instanceof Error ? e.message : String(e)
}

export function ChurchLibraryImport() {
  const [files, setFiles] = useState<SourceFile[]>([])
  const [preview, setPreview] = useState<ImportPreview | null>(null)
  const [checking, setChecking] = useState(false)
  const [importing, setImporting] = useState(false)
  const [message, setMessage] = useState<{ kind: 'ok' | 'error'; text: string } | null>(null)
  const [openPayload, setOpenPayload] = useState<string | null>(null)
  const [books, setBooks] = useState<ReviewBook[]>([])
  const [booksError, setBooksError] = useState('')
  const [busyBook, setBusyBook] = useState<string | null>(null)

  const loadBooks = useCallback(async () => {
    try {
      setBooks(await listStructuredBooksForReview())
      setBooksError('')
    } catch (e) {
      setBooksError(errorText(e))
    }
  }, [])

  useEffect(() => {
    void loadBooks()
  }, [loadBooks])

  const runPreview = useCallback(async (sources: SourceFile[]) => {
    if (!sources.length) {
      setPreview(null)
      return
    }
    setChecking(true)
    setMessage(null)
    try {
      let fingerprints: { slugs: Set<string>; hashes: Set<string> } = { slugs: new Set(), hashes: new Set() }
      try {
        fingerprints = await existingImportFingerprints()
      } catch {
        /* preview still works offline; the database repeats the duplicate check on import */
      }
      setPreview(buildImportPreview(sources, { existingHashes: fingerprints.hashes, existingSlugs: fingerprints.slugs }))
    } finally {
      setChecking(false)
    }
  }, [])

  const onFiles = async (list: FileList | null) => {
    if (!list) return
    const read = await Promise.all(
      [...list]
        .filter((f) => /\.(md|markdown|json)$/i.test(f.name))
        .map(async (f) => ({ name: (f as File & { webkitRelativePath?: string }).webkitRelativePath || f.name, text: await f.text() })),
    )
    const merged = [...files.filter((f) => !read.some((r) => r.name === f.name)), ...read].sort((a, b) => a.name.localeCompare(b.name))
    setFiles(merged)
    await runPreview(merged)
  }

  const blocking = preview ? hasBlockingIssues(preview) : true

  const doImport = async () => {
    if (!preview || blocking) return
    setImporting(true)
    setMessage(null)
    const done: string[] = []
    try {
      for (const payload of preview.payloads) {
        const res = await importStructured(payload)
        done.push(`${res.slug} (${res.sections} sections, ${res.passages} paragraphs)`)
      }
      setMessage({ kind: 'ok', text: `Imported as draft: ${done.join('; ')}. Nothing is public until it is reviewed and published.` })
      setFiles([])
      setPreview(null)
      await loadBooks()
    } catch (e) {
      setMessage({
        kind: 'error',
        text: `${done.length ? `Imported ${done.join('; ')} before the error. ` : ''}Import stopped: ${errorText(e)}`,
      })
      await loadBooks()
    } finally {
      setImporting(false)
    }
  }

  const changeStatus = async (book: ReviewBook, next: PublicationStatus) => {
    const verb = next === 'published' ? 'Publish' : next === 'reviewed' ? 'Mark as reviewed' : 'Return to draft'
    const note = window.prompt(`${verb}: “${book.title}”. Optional review note:`, '')
    if (note === null) return
    setBusyBook(book.id)
    setMessage(null)
    try {
      await setPublicationStatus(book.id, next, note || undefined)
      setMessage({ kind: 'ok', text: `${book.title}: ${STATUS_LABEL[next]}.` })
      await loadBooks()
    } catch (e) {
      setMessage({ kind: 'error', text: `${book.title}: ${errorText(e)}` })
    } finally {
      setBusyBook(null)
    }
  }

  const collections = useMemo(() => {
    const map = new Map<string, ReviewBook[]>()
    for (const b of books) {
      const k = b.collection_key || b.slug
      map.set(k, [...(map.get(k) || []), b])
    }
    return [...map.entries()]
  }, [books])

  return (
    <div className={c.shell}>
      <header className={s.heading}>
        <div>
          <p className={s.eyebrow}>CHURCH LIBRARY · STRUCTURED CONTENT</p>
          <h1>Import &amp; review</h1>
          <p className={s.muted}>
            Bulk-import Markdown or JSON as <strong>drafts</strong>. Text is stored exactly as written; editorial markers are kept as reviewer notes.
            Existing books are never overwritten. Publishing still requires the book’s rights and approval settings.
          </p>
        </div>
        <div className={s.actions}>
          <Link to="/admin/church-library">← Church Library CMS</Link>
        </div>
      </header>

      {message ? (
        <p className={message.kind === 'ok' ? s.success : s.error} role={message.kind === 'ok' ? 'status' : 'alert'}>
          {message.text}
        </p>
      ) : null}

      <section className={s.card} aria-labelledby="cl-import-h">
        <h2 id="cl-import-h">1. Choose files</h2>
        <p className={s.muted}>
          Markdown chapters with frontmatter (<code>id</code>, <code>subject</code>, <code>language</code>, <code>title</code>), an optional{' '}
          <code>manifest.json</code>, or ready JSON payloads. Files marked <code>not_publishable</code> are skipped.
        </p>
        <div className={c.pickers}>
          <label className={c.picker}>
            <span>Select files</span>
            <input type="file" multiple accept=".md,.markdown,.json" onChange={(e) => void onFiles(e.target.files)} />
          </label>
          <label className={c.picker}>
            <span>Select a folder</span>
            <input
              type="file"
              multiple
              onChange={(e) => void onFiles(e.target.files)}
              {...({ webkitdirectory: '', directory: '' } as Record<string, string>)}
            />
          </label>
          {files.length ? (
            <button type="button" className={s.secondary} onClick={() => (setFiles([]), setPreview(null))}>
              Clear ({files.length})
            </button>
          ) : null}
        </div>
        {checking ? <p role="status">Validating…</p> : null}
      </section>

      {preview ? (
        <section className={s.card} aria-labelledby="cl-preview-h">
          <h2 id="cl-preview-h">2. Preview</h2>
          <dl className={c.stats}>
            {(
              [
                ['Files', preview.stats.files],
                ['Books', preview.stats.books],
                ['Chapters', preview.stats.chapters],
                ['Sections', preview.stats.sections],
                ['Paragraphs', preview.stats.paragraphs],
                ['Reviewer notes', preview.stats.reviewNotes],
                ['Repeated within import', preview.stats.duplicateParagraphsWithinImport],
                ['Already in library', preview.stats.duplicateParagraphsExisting],
              ] as const
            ).map(([k, v]) => (
              <div key={k}>
                <dt>{k}</dt>
                <dd>{v}</dd>
              </div>
            ))}
          </dl>

          {preview.issues.length ? (
            <ul className={c.issues}>
              {preview.issues.map((i, n) => (
                <li key={n} className={c[`issue_${i.level}`]}>
                  <strong>{i.level}</strong> {i.file ? <code>{i.file}</code> : null} {i.key ? <code>{i.key}</code> : null} {i.message}
                </li>
              ))}
            </ul>
          ) : (
            <p className={s.muted}>No issues found.</p>
          )}

          {preview.payloads.map((p) => (
            <PayloadPreview key={p.book.slug} payload={p} open={openPayload === p.book.slug} onToggle={() => setOpenPayload(openPayload === p.book.slug ? null : p.book.slug)} />
          ))}

          <div className={c.importBar}>
            <button type="button" className={s.primary} disabled={blocking || importing || !preview.payloads.length} onClick={() => void doImport()}>
              {importing ? 'Importing…' : `Import ${preview.payloads.length} book${preview.payloads.length === 1 ? '' : 's'} as draft`}
            </button>
            {blocking ? <span className={c.blockNote}>Resolve the errors above before importing.</span> : null}
          </div>
        </section>
      ) : null}

      <section className={s.card} aria-labelledby="cl-review-h">
        <h2 id="cl-review-h">3. Review &amp; publish</h2>
        <p className={s.muted}>
          Draft → Reviewed (all paragraphs checked; none flagged “needs attention”) → Published (requires approval for ingestion, search quotes,
          public access and cleared rights — set these in the Church Library CMS).
        </p>
        {booksError ? <p className={s.error} role="alert">{booksError}</p> : null}
        {!books.length && !booksError ? <p className={s.muted}>No structured books yet.</p> : null}
        {collections.map(([key, list]) => (
          <div key={key} className={c.collection}>
            <h3>{key}</h3>
            <table className={c.table}>
              <thead>
                <tr>
                  <th scope="col">Edition</th>
                  <th scope="col">Status</th>
                  <th scope="col">Gates</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                {list.map((b) => {
                  const status = b.publication_status || 'published'
                  const gatesOk =
                    b.approved_for_ingestion && b.allow_search_quotes && ['public', 'public_search'].includes(b.access_level) && ['owned', 'licensed', 'public_domain', 'permission_granted'].includes(b.rights_status)
                  return (
                    <tr key={b.id}>
                      <td>
                        <Link to={sectionHref(b.slug)} lang={b.language}>{b.title}</Link>
                        <div className={c.sub}>
                          {b.slug} · {b.language}
                        </div>
                      </td>
                      <td>
                        <span className={`${c.badge} ${c[`badge_${status}`]}`}>{STATUS_LABEL[status] || status}</span>
                      </td>
                      <td className={c.sub}>
                        access: {b.access_level} · rights: {b.rights_status}
                        <br />
                        ingestion {b.approved_for_ingestion ? '✓' : '✗'} · quotes {b.allow_search_quotes ? '✓' : '✗'}
                        {!gatesOk && status === 'reviewed' ? <div className={c.warn}>Publishing will be refused until these gates pass.</div> : null}
                      </td>
                      <td>
                        <div className={s.actions}>
                          {status === 'draft' ? (
                            <button type="button" disabled={busyBook === b.id} onClick={() => void changeStatus(b, 'reviewed')}>
                              Mark reviewed
                            </button>
                          ) : null}
                          {status === 'reviewed' ? (
                            <button type="button" className={s.primary} disabled={busyBook === b.id} onClick={() => void changeStatus(b, 'published')}>
                              Publish
                            </button>
                          ) : null}
                          {status !== 'draft' ? (
                            <button type="button" disabled={busyBook === b.id} onClick={() => void changeStatus(b, 'draft')}>
                              Back to draft
                            </button>
                          ) : null}
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        ))}
      </section>
    </div>
  )
}

function PayloadPreview({ payload, open, onToggle }: { payload: ImportPayload; open: boolean; onToggle: () => void }) {
  const chapters = payload.sections.filter((x) => x.level === 1)
  const countBySection = useMemo(() => {
    const m = new Map<string | null, number>()
    for (const p of payload.passages) m.set(p.section_key, (m.get(p.section_key) || 0) + 1)
    return m
  }, [payload])
  const firstOf = (key: string) => payload.passages.find((p) => p.section_key === key)
  return (
    <div className={c.payload}>
      <button type="button" className={c.payloadHead} onClick={onToggle} aria-expanded={open}>
        <span lang={payload.book.language}>{payload.book.title}</span>
        <span className={c.sub}>
          {payload.book.slug} · {payload.book.language} · {chapters.length} chapters · {payload.sections.length} sections · {payload.passages.length} paragraphs
        </span>
      </button>
      {open ? (
        <ol className={c.tree} lang={payload.book.language}>
          {chapters.map((ch) => {
            const children = payload.sections.filter((x) => x.parent_key === ch.key)
            return (
              <li key={ch.key}>
                <strong>{ch.title}</strong> <code>{ch.key}</code>
                <ul>
                  {[ch, ...children].map((sec) => {
                    const n = countBySection.get(sec.key) || 0
                    if (!n && sec === ch) return null
                    const first = firstOf(sec.key)
                    return (
                      <li key={sec.key}>
                        {sec.title || <em>(untitled)</em>} <code>{sec.key}</code> · {n} ¶
                        {first ? <div className={c.excerpt}>{first.content.slice(0, 160)}{first.content.length > 160 ? '…' : ''}</div> : null}
                      </li>
                    )
                  })}
                </ul>
              </li>
            )
          })}
        </ol>
      ) : null}
    </div>
  )
}
