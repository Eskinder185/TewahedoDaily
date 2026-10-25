import { useCallback, useEffect, useState } from 'react'
import { useAuth } from '../../lib/auth/useAuth'
import {
  contentKindLabel,
  getBookToc,
  getEditorialStatus,
  getIngestionPlan,
  getReadingPage,
  getRetrievalDiagnostics,
  listEditorialBooks,
  recordEditorialApproval,
  searchEditorialBooks,
  type BookToc,
  type EditorialBookSummary,
  type ReadingPage,
  type ReadingParagraph,
  type SearchHit,
} from '../../lib/editorial/editorialBooksApi'
import s from './Admin.module.css'
import e from './EditorialBooksPreview.module.css'

/**
 * Legacy private five-book package preview within Church Library.
 * Auth: CMS session JWT → backend verifies profiles.role (editor/admin/super_admin).
 * Not a public library page — unapproved content stays behind API gates.
 */
export function EditorialBooksPreview() {
  const { profile, isStaff, session } = useAuth()
  const signedInStaff = Boolean(session && isStaff)

  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [notice, setNotice] = useState<string | null>(null)

  const [books, setBooks] = useState<EditorialBookSummary[]>([])
  const [documentId, setDocumentId] = useState('')
  const [toc, setToc] = useState<BookToc | null>(null)
  const [sectionId, setSectionId] = useState<string | undefined>()
  const [page, setPage] = useState<ReadingPage | null>(null)
  const [cursorAfter, setCursorAfter] = useState<string | undefined>()

  const [query, setQuery] = useState('')
  const [filterKind, setFilterKind] = useState('')
  const [filterAmharic, setFilterAmharic] = useState<'any' | 'yes' | 'no'>('any')
  const [hits, setHits] = useState<SearchHit[]>([])
  const [plan, setPlan] = useState<Record<string, unknown> | null>(null)
  const [status, setStatus] = useState<Record<string, unknown> | null>(null)
  const [diagnostics, setDiagnostics] = useState<Record<string, unknown> | null>(
    null,
  )

  const loadCatalog = useCallback(async () => {
    setLoading(true)
    setError(null)
    try {
      const [list, st, diag] = await Promise.all([
        listEditorialBooks(),
        getEditorialStatus(),
        getRetrievalDiagnostics(),
      ])
      setBooks(list.books)
      setStatus(st)
      setDiagnostics(diag)
      if (!documentId && list.books[0]) {
        setDocumentId(list.books[0].document_id)
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    } finally {
      setLoading(false)
    }
  }, [documentId])

  useEffect(() => {
    if (signedInStaff) void loadCatalog()
  }, [signedInStaff, loadCatalog])

  useEffect(() => {
    if (!signedInStaff || !documentId) return
    let cancelled = false
    ;(async () => {
      setLoading(true)
      setError(null)
      try {
        const [tocData, ingest] = await Promise.all([
          getBookToc(documentId),
          getIngestionPlan(documentId),
        ])
        if (cancelled) return
        setToc(tocData)
        setPlan(ingest)
        const firstSection = tocData.sections[0]?.section_id
        setSectionId((prev) =>
          prev && tocData.sections.some((sec) => sec.section_id === prev)
            ? prev
            : firstSection,
        )
        setCursorAfter(undefined)
      } catch (err) {
        if (!cancelled) setError(err instanceof Error ? err.message : String(err))
      } finally {
        if (!cancelled) setLoading(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [signedInStaff, documentId])

  useEffect(() => {
    if (!signedInStaff || !documentId || !sectionId) return
    let cancelled = false
    ;(async () => {
      setLoading(true)
      setError(null)
      try {
        const data = await getReadingPage(documentId, {
          sectionId,
          after: cursorAfter,
          limit: 12,
        })
        if (!cancelled) setPage(data)
      } catch (err) {
        if (!cancelled) setError(err instanceof Error ? err.message : String(err))
      } finally {
        if (!cancelled) setLoading(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [signedInStaff, documentId, sectionId, cursorAfter])

  async function onSearch(event: React.FormEvent) {
    event.preventDefault()
    if (!query.trim()) return
    setLoading(true)
    setError(null)
    try {
      const data = await searchEditorialBooks(query.trim(), {
        document_id: documentId || undefined,
        content_kind: filterKind || undefined,
        has_amharic_source:
          filterAmharic === 'any' ? undefined : filterAmharic === 'yes',
        limit: 25,
      })
      setHits(data.hits)
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    } finally {
      setLoading(false)
    }
  }

  async function approveSection() {
    if (!documentId || !sectionId) return
    const reviewer = profile?.email || profile?.id || 'cms-reviewer'
    setLoading(true)
    setNotice(null)
    setError(null)
    try {
      await recordEditorialApproval({
        target_type: 'section',
        target_id: sectionId,
        document_id: documentId,
        approved_for_ingestion: true,
        reviewer: String(reviewer),
        notes: 'Overlay intent only; package flags unchanged',
        section_id: sectionId,
      })
      setNotice(
        `Overlay approval recorded for ${sectionId}. Package approved_for_ingestion stays false; public Search Buddy still excludes these records.`,
      )
      setPlan(await getIngestionPlan(documentId))
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    } finally {
      setLoading(false)
    }
  }

  function openHit(hit: SearchHit) {
    setDocumentId(hit.document_id)
    setSectionId(hit.section_id)
    setCursorAfter(undefined)
  }

  const authInfo =
    status && typeof status.auth === 'object' && status.auth
      ? (status.auth as Record<string, unknown>)
      : null

  return (
    <div className={e.wrap}>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>CHURCH LIBRARY · LEGACY PACKAGE</p>
          <h1>Legacy five-book package preview</h1>
          <p className={s.muted}>
            Authenticated via your CMS Supabase session. Backend checks{' '}
            <code>profiles.role</code> (editor / admin / super_admin) — not a
            browser-pasted secret.
          </p>
        </div>
      </div>

      <div className={e.banner}>
        <strong>Not published</strong>
        Public visitors cannot load these books via direct URLs or public APIs.
        Empty Search Buddy book retrieval is expected while{' '}
        <code>approved_for_ingestion</code> remains false.
      </div>

      {!signedInStaff && (
        <div className={e.errorBox} role="alert">
          Sign in with an editor, admin, or super_admin CMS account to preview
          editorial books.
        </div>
      )}

      {error && (
        <div className={e.errorBox} role="alert">
          {error}
        </div>
      )}
      {notice && <p className={s.notice}>{notice}</p>}
      {loading && <p className={e.statusLine}>Loading…</p>}

      {signedInStaff && status && (
        <div className={s.card}>
          <h2>Access status</h2>
          <p className={e.statusLine}>
            Auth method: {String(authInfo?.method || 'cms_jwt')} · CMS role:{' '}
            {String(authInfo?.cms_role || profile?.role || '—')} · integrity:{' '}
            {String(status.integrity_ok)} · package ingest:{' '}
            {String(status.package_approved_for_ingestion)} · published:{' '}
            {String(status.published)}
          </p>
          {diagnostics && (
            <p className={e.statusLine}>
              Retrieval diagnosis: {String(diagnostics.empty_public_retrieval_cause)}{' '}
              · Search Buddy hits: {String(diagnostics.search_buddy_hit_count)} ·
              private EN hits: {String(diagnostics.private_lexical_english_hits)} ·
              private AM hits: {String(diagnostics.private_lexical_amharic_hits)}
            </p>
          )}
        </div>
      )}

      {signedInStaff && (
        <>
          <section className={s.card}>
            <h2>Books</h2>
            <div className={e.bookGrid}>
              {books.map((book) => (
                <button
                  key={book.document_id}
                  type="button"
                  className={`${e.bookCard} ${
                    book.document_id === documentId ? e.bookCardActive : ''
                  }`}
                  onClick={() => {
                    setDocumentId(book.document_id)
                    setSectionId(undefined)
                    setCursorAfter(undefined)
                    setHits([])
                  }}
                >
                  <strong>
                    {book.document_id}: {book.title}
                  </strong>
                  <small>
                    {book.section_count} chapters · {book.paragraph_count}{' '}
                    paragraphs · languages:{' '}
                    {book.languages_available.join(', ') || 'en'} · package
                    ingest: {String(book.package_approved_for_ingestion)}
                  </small>
                </button>
              ))}
            </div>
          </section>

          <form className={`${s.card} ${e.searchPanel}`} onSubmit={onSearch}>
            <h2>Search (private staff lexical)</h2>
            <label>
              Query
              <input
                value={query}
                onChange={(ev) => setQuery(ev.target.value)}
                placeholder="English or Ethiopic source terms"
              />
            </label>
            <div className={e.searchFilters}>
              <label>
                Content kind
                <select
                  value={filterKind}
                  onChange={(ev) => setFilterKind(ev.target.value)}
                >
                  <option value="">Any</option>
                  <option value="english_reading">English reading</option>
                  <option value="reference_supplement">
                    Reference supplement
                  </option>
                  <option value="added_explanation">Added explanation</option>
                </select>
              </label>
              <label>
                Ethiopic source
                <select
                  value={filterAmharic}
                  onChange={(ev) =>
                    setFilterAmharic(ev.target.value as 'any' | 'yes' | 'no')
                  }
                >
                  <option value="any">Any</option>
                  <option value="yes">Has Amharic/Geʽez source</option>
                  <option value="no">English-only attribution</option>
                </select>
              </label>
            </div>
            <button type="submit">Search in current book scope</button>
            {hits.length > 0 && (
              <ul className={e.hitList}>
                {hits.map((hit) => (
                  <li key={hit.paragraph_id}>
                    <button type="button" onClick={() => openHit(hit)}>
                      <strong>
                        {hit.document_id} / {hit.paragraph_id}
                      </strong>
                      <br />
                      <small>
                        {contentKindLabel(hit.content_kind)} · score{' '}
                        {hit.score.toFixed(2)}
                        {hit.has_amharic_source ? ' · has source AM' : ''}
                      </small>
                      <br />
                      {hit.snippet_en}
                    </button>
                  </li>
                ))}
              </ul>
            )}
          </form>

          {plan && (
            <div className={s.card}>
              <h2>Qdrant ingestion plan (dry-run)</h2>
              <p className={e.statusLine}>
                Would upsert {String(plan.approved_count)} /{' '}
                {String(plan.candidate_count)} · production Qdrant touched:{' '}
                {String(plan.production_qdrant_touched)}
              </p>
            </div>
          )}

          {toc && sectionId && (
            <div className={e.layout}>
              <nav className={e.toc} aria-label="Chapters">
                <h2>Chapters / sections</h2>
                <ul className={e.tocList}>
                  {toc.sections.map((sec) => (
                    <li key={sec.section_id}>
                      <button
                        type="button"
                        className={
                          sec.section_id === sectionId ? e.tocActive : undefined
                        }
                        onClick={() => {
                          setSectionId(sec.section_id)
                          setCursorAfter(undefined)
                        }}
                      >
                        {sec.title_en || sec.section_id}
                        <br />
                        <small>
                          {sec.section_id} · {sec.paragraph_count} paras
                        </small>
                      </button>
                    </li>
                  ))}
                </ul>
              </nav>

              <article className={e.reader}>
                <header className={e.readerHeader}>
                  <h2>
                    {toc.title}
                    <br />
                    <small className={s.muted}>
                      {toc.sections.find((x) => x.section_id === sectionId)
                        ?.title_en || sectionId}
                    </small>
                  </h2>
                  <div className={e.navRow}>
                    <button
                      type="button"
                      disabled={!page?.page.has_previous}
                      onClick={() =>
                        setCursorAfter(page?.page.previous_after || undefined)
                      }
                    >
                      Previous page
                    </button>
                    <button
                      type="button"
                      disabled={!page?.page.has_next}
                      onClick={() =>
                        setCursorAfter(page?.page.next_after || undefined)
                      }
                    >
                      Next page
                    </button>
                    <button type="button" onClick={() => void approveSection()}>
                      Overlay-approve section
                    </button>
                  </div>
                  {page && (
                    <p className={e.statusLine}>
                      Showing {page.items.length} of {page.page.total_paragraphs}{' '}
                      · visibility {page.visibility} · published{' '}
                      {String(page.published)}
                    </p>
                  )}
                </header>

                {page?.items.map((para) => (
                  <ParagraphBlock key={para.id} para={para} />
                ))}
              </article>
            </div>
          )}
        </>
      )}
    </div>
  )
}

function ParagraphBlock({ para }: { para: ReadingParagraph }) {
  const kind = contentKindLabel(para.content_kind)
  const isSupplement =
    para.content_kind === 'reference_supplement' ||
    para.content_kind === 'added_explanation' ||
    para.role === 'reference_supplement'
  const english = para.text_en || para.text || ''
  const hasAm = Boolean(para.amharic_source_text)

  return (
    <section className={e.para} id={para.id}>
      <div className={e.meta}>
        <span className={e.badge}>{para.id}</span>
        <span className={`${e.badge} ${isSupplement ? e.badgeWarn : ''}`}>
          {kind}
        </span>
        <span className={e.badge}>order {para.order}</span>
        <span className={e.badge}>
          ingest {String(para.approved_for_ingestion)}
        </span>
        {(para.source_unit_ids || []).length > 0 && (
          <span className={e.badge}>
            sources: {(para.source_unit_ids || []).join(', ')}
          </span>
        )}
      </div>
      <div className={e.body}>{english}</div>
      {hasAm ? (
        <div className={e.amharic}>
          <strong>Ethiopic source (attribution)</strong>
          <div>{para.amharic_source_text}</div>
        </div>
      ) : (
        <p className={e.note}>
          No Ethiopic source text is attached to this reading record. Do not
          present the English as a completed Amharic translation.
        </p>
      )}
      {para.content_segments && para.content_segments.length > 0 && (
        <details className={e.segments}>
          <summary>Content segments (origin labels)</summary>
          <ul>
            {para.content_segments.map((seg, idx) => (
              <li key={`${para.id}-seg-${idx}`}>
                <em>{seg.kind}</em>: {seg.text}
              </li>
            ))}
          </ul>
        </details>
      )}
    </section>
  )
}
