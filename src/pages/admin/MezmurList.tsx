import { useCallback, useEffect, useState, type FormEvent } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { deleteMezmur, duplicateMezmur, editable, errorMessage, getTagIds, getTaxonomy, listMezmur, mezmurStatuses, mezmurStatusLabel, PAGE_SIZE, saveMezmur, type Mezmur } from '../../lib/cms/mezmurService'
import { useAsync } from '../../lib/cms/useAsync'
import { formatRecordedDate } from '../../lib/cms/recordedTimestamp'
import { AsyncNotice, Media, MezmurPreview, Modal, Status } from './AdminUi'
import s from './Admin.module.css'
import { MEZMUR_LANGUAGES } from '../../lib/mezmur/mezmurLanguage'
import {
  fetchReviewsForContent,
  resolveReviewStatus,
  getReviewNote,
  type AdminContentReviewRecord,
} from '../../lib/cms/adminContentReviewService'
import { AdminContentReviewTag } from '../../components/admin/AdminContentReviewTag'

export function MezmurList() {
  const [params, setParams] = useSearchParams()
  const key = params.toString()
  const result = useAsync(useCallback(() => {
    const p = new URLSearchParams(key)
    return listMezmur({
      search: p.get('search') || '',
      status: p.get('status') || '',
      category: p.get('category') || '',
      singer: p.get('singer') || '',
      language: p.get('language') || '',
      featured: p.get('featured') || '',
      sort: p.get('sort') || '',
      page: Math.max(1, Number(p.get('page')) || 1),
    })
  }, [key]))

  const taxonomy = useAsync(useCallback(() => getTaxonomy(), []))
  const { profile } = useAuth()
  const admin = profile?.role === 'admin' || profile?.role === 'super_admin'
  const staff = admin || profile?.role === 'editor'
  const [preview, setPreview] = useState<Mezmur | null>(null)
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const [reviewsMap, setReviewsMap] = useState<Map<string, AdminContentReviewRecord>>(new Map())

  // Load reviews for current rows
  useEffect(() => {
    if (result.data?.rows && result.data.rows.length > 0) {
      const ids = result.data.rows.map((r) => r.id)
      fetchReviewsForContent('mezmur', ids).then(setReviewsMap)
    }
  }, [result.data?.rows])

  // Listen for review status updates
  useEffect(() => {
    const handleReviewUpdate = (e: Event) => {
      const custom = e as CustomEvent<AdminContentReviewRecord>
      if (custom.detail && custom.detail.content_type === 'mezmur') {
        setReviewsMap((prev) => {
          const next = new Map(prev)
          next.set(custom.detail.content_id, custom.detail)
          return next
        })
      }
    }
    window.addEventListener('td:admin-review-updated', handleReviewUpdate)
    return () => window.removeEventListener('td:admin-review-updated', handleReviewUpdate)
  }, [])

  const page = Math.max(1, Number(params.get('page')) || 1)
  const pages = Math.max(1, Math.ceil((result.data?.count || 0) / PAGE_SIZE))
  const reviewFilter = params.get('review') || ''

  function filters(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const values = new FormData(event.currentTarget)
    const next = new URLSearchParams()
    for (const [name, value] of values) if (value) next.set(name, String(value))
    setParams(next)
  }

  async function action(row: Mezmur, kind: 'duplicate' | 'unpublish' | 'delete') {
    if (kind === 'delete' && !window.confirm(`Move “${row.title}” to Trash? It will disappear from public and admin lists, but can be restored.`)) return
    setBusy(true); setError(''); setMessage('')
    try {
      if (kind === 'duplicate') await duplicateMezmur(row)
      else if (kind === 'delete') await deleteMezmur(row)
      else await saveMezmur({ ...editable(row), status: 'draft' }, await getTagIds(row.id), row)
      setMessage(kind === 'duplicate' ? 'Draft copy created with text and tags. Upload separate media for the copy.' : kind === 'delete' ? 'Mezmur moved to Trash.' : 'Mezmur returned to draft.')
      result.reload()
    } catch (cause) { setError(errorMessage(cause)) }
    finally { setBusy(false) }
  }

  // Filter rows by review status if selected
  const displayedRows = (result.data?.rows || []).filter((row) => {
    if (!reviewFilter) return true
    const st = resolveReviewStatus(row.id, reviewsMap)
    return st === reviewFilter
  })

  // Review counts on the loaded page
  const pageReviewedCount = (result.data?.rows || []).filter(
    (row) => resolveReviewStatus(row.id, reviewsMap) === 'reviewed'
  ).length
  const pageNeedsReviewCount = (result.data?.rows || []).length - pageReviewedCount

  return <>
    <div className={s.heading}>
      <div>
        <p className={s.eyebrow}>CONTENT LIBRARY</p>
        <h1>Mezmur</h1>
        <p className={s.muted}>Organize, audit, and publish hymns.</p>
      </div>
      <div className={s.actions}>
        <Link to="/admin/hymns/trash">Trash</Link>
        <Link to="/admin/hymns/import">Bulk CSV Import Preview</Link>
        <Link className={s.primary} to="/admin/hymns/mezmur/new">+ Add Mezmur</Link>
      </div>
    </div>

    {/* Review Metrics Banner */}
    <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: '0.75rem', padding: '0.75rem 1rem', background: '#f8fafc', border: '1px solid #e2e8f0', borderRadius: '6px', marginBottom: '1rem', fontSize: '0.875rem' }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
        <span><strong>Page Review Status:</strong></span>
        <span style={{ color: '#166534', fontWeight: 600 }}>✓ {pageReviewedCount} Reviewed</span>
        <span style={{ color: '#92400e', fontWeight: 600 }}>⚠️ {pageNeedsReviewCount} Needs Review</span>
      </div>
      <div style={{ fontSize: '0.8125rem', color: '#64748b' }}>
        Every item defaults to <em>Needs Review</em> until explicitly confirmed by staff.
      </div>
    </div>

    <form key={key} onSubmit={filters}>
      <div className={s.filters}>
        <label>Search<input name="search" defaultValue={params.get('search') || ''} placeholder="Title or Amharic title" /></label>
        <label>Review<select aria-label="Review Status" name="review" defaultValue={reviewFilter}><option value="">All review states</option><option value="needs_review">Needs Review</option><option value="reviewed">Reviewed</option></select></label>
        <label>Status<select aria-label="Status" name="status" defaultValue={params.get('status') || ''}><option value="">All statuses</option>{mezmurStatuses.map(value => <option key={value} value={value}>{mezmurStatusLabel(value)}</option>)}</select></label>
        <label>Category<select aria-label="Category" name="category" defaultValue={params.get('category') || ''}><option value="">All categories</option>{taxonomy.data?.categories.map(row => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label>
        <label>Singer<select aria-label="Singer" name="singer" defaultValue={params.get('singer') || ''}><option value="">All singers</option>{taxonomy.data?.singers.map(row => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label>
        <label>Language<select aria-label="Language" name="language" defaultValue={params.get('language') || ''}><option value="">All languages</option>{MEZMUR_LANGUAGES.map(row => <option key={row.code} value={row.code}>{row.label} / {row.nativeLabel}</option>)}</select></label>
        <label>Featured<select aria-label="Featured" name="featured" defaultValue={params.get('featured') || ''}><option value="">All</option><option value="yes">Featured</option><option value="no">Not featured</option></select></label>
        <label>Sort<select aria-label="Sort" name="sort" defaultValue={params.get('sort') || 'updated'}><option value="updated">Recently updated</option><option value="oldest">Oldest updated</option><option value="title">Title A–Z</option><option value="published">Recently published</option></select></label>
      </div>
      <div className={s.actions}>
        <button type="submit">Apply filters</button>
        <button type="button" onClick={() => setParams({})}>Reset</button>
      </div>
    </form>

    {message && <p role="status" className={s.success}>{message}</p>}
    {error && <p role="alert" className={s.error}>{error}</p>}
    <AsyncNotice {...taxonomy} retry={taxonomy.reload} />
    <AsyncNotice {...result} retry={result.reload} />

    {result.data && <>
      <p className={s.muted}>{displayedRows.length} of {result.data.count} mezmur displayed</p>
      {!displayedRows.length ? <div className={s.card}>No mezmur match these filters.</div> : <div className={s.tableWrap}><table>
        <thead>
          <tr>
            {['Thumbnail', 'Title', 'Amharic title', 'Singer', 'Category', 'Status', 'Editorial Review', 'Featured', 'Updated', 'Actions'].map(name => (
              <th key={name} scope="col">{name}</th>
            ))}
          </tr>
        </thead>
        <tbody>{displayedRows.map(row => <tr key={row.id}>
          <td><Media reference={row.thumbnail_url} /></td>
          <td><strong>{row.title}</strong></td>
          <td lang="am">{row.title_amharic || '—'}</td>
          <td>{row.singer_name || taxonomy.data?.singers.find(item => item.id === row.singer_id)?.name || '—'}</td>
          <td>{taxonomy.data?.categories.find(item => item.id === row.category_id)?.name || '—'}</td>
          <td><Status value={row.status === 'published' ? 'published' : 'draft'} /></td>
          <td>
            <AdminContentReviewTag
              contentType="mezmur"
              contentId={row.id}
              currentStatus={resolveReviewStatus(row.id, reviewsMap)}
              currentNote={getReviewNote(row.id, reviewsMap)}
              onStatusChange={(newStatus, newNote) => {
                setReviewsMap((prev) => {
                  const next = new Map(prev)
                  next.set(row.id, {
                    content_type: 'mezmur',
                    content_id: row.id,
                    review_status: newStatus,
                    review_note: newNote,
                    created_at: '',
                    updated_at: '',
                  })
                  return next
                })
              }}
            />
          </td>
          <td>{row.featured ? '★ Yes' : '—'}</td>
          <td>{formatRecordedDate(row.updated_at)}</td>
          <td><div className={s.actions}>
            {(staff || (row.created_by === profile?.id && row.status === 'draft')) && <Link to={`/admin/hymns/mezmur/${row.id}/edit`}>Edit</Link>}
            <button onClick={() => setPreview(row)}>Preview</button>
            <button disabled={busy} onClick={() => void action(row, 'duplicate')}>Duplicate</button>
            {staff && row.status === 'published' && <button disabled={busy} onClick={() => void action(row, 'unpublish')}>Return to Draft</button>}
            {admin && <button className={s.danger} disabled={busy} onClick={() => void action(row, 'delete')}>Move to Trash</button>}
          </div></td>
        </tr>)}</tbody>
      </table></div>}
      <div className={s.pagination}>
        <span>Page {page} of {pages}</span>
        <div className={s.actions}>
          <button disabled={page <= 1} onClick={() => { const next = new URLSearchParams(params); next.set('page', String(page - 1)); setParams(next) }}>Previous</button>
          <button disabled={page >= pages} onClick={() => { const next = new URLSearchParams(params); next.set('page', String(page + 1)); setParams(next) }}>Next</button>
        </div>
      </div>
    </>}
    {preview && <Modal title="Mezmur preview" close={() => setPreview(null)}><MezmurPreview item={preview} /></Modal>}
  </>
}
