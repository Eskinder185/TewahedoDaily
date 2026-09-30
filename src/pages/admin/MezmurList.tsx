import { useCallback, useState, type FormEvent } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { deleteMezmur, duplicateMezmur, editable, errorMessage, getTagIds, getTaxonomy, label, listMezmur, PAGE_SIZE, saveMezmur, statuses, type Mezmur } from '../../lib/cms/mezmurService'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice, Media, MezmurPreview, Modal, Status } from './AdminUi'
import s from './Admin.module.css'
export function MezmurList() {
  const [params, setParams] = useSearchParams()
  const key = params.toString()
  const result = useAsync(useCallback(() => {
    const p = new URLSearchParams(key)
    return listMezmur({ search: p.get('search') || '', status: p.get('status') || '', category: p.get('category') || '', singer: p.get('singer') || '', featured: p.get('featured') || '', sort: p.get('sort') || '', page: Math.max(1, Number(p.get('page')) || 1) })
  }, [key]))
  const taxonomy = useAsync(useCallback(() => getTaxonomy(), []))
  const { profile } = useAuth()
  const admin = profile?.role === 'admin' || profile?.role === 'super_admin'
  const staff = admin || profile?.role === 'editor'
  const [preview, setPreview] = useState<Mezmur | null>(null)
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const page = Math.max(1, Number(params.get('page')) || 1)
  const pages = Math.max(1, Math.ceil((result.data?.count || 0) / PAGE_SIZE))
  function filters(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const values = new FormData(event.currentTarget)
    const next = new URLSearchParams()
    for (const [name, value] of values) if (value) next.set(name, String(value))
    setParams(next)
  }
  async function action(row: Mezmur, kind: 'duplicate' | 'archive' | 'delete') {
    if (kind !== 'duplicate' && !window.confirm(`${kind === 'delete' ? 'Permanently delete' : 'Archive'} “${row.title}”? ${kind === 'delete' ? 'Revision history is retained, but this record will be removed.' : 'It will no longer be publicly available.'}`)) return
    setBusy(true); setError(''); setMessage('')
    try {
      if (kind === 'duplicate') await duplicateMezmur(row)
      else if (kind === 'delete') await deleteMezmur(row)
      else await saveMezmur({ ...editable(row), status: 'archived' }, await getTagIds(row.id), row)
      setMessage(kind === 'duplicate' ? 'Draft copy created with text and tags. Upload separate media for the copy.' : kind === 'delete' ? 'Mezmur deleted.' : 'Mezmur archived.')
      result.reload()
    } catch (cause) { setError(errorMessage(cause)) }
    finally { setBusy(false) }
  }
  return <>
    <div className={s.heading}><div><p className={s.eyebrow}>CONTENT LIBRARY</p><h1>Mezmur</h1><p className={s.muted}>Organize, review, and publish hymns.</p></div><Link className={s.primary} to="/admin/hymns/mezmur/new">+ Add Mezmur</Link></div>
    <form key={key} onSubmit={filters}>
      <div className={s.filters}>
        <label>Search<input name="search" defaultValue={params.get('search') || ''} placeholder="Title or Amharic title" /></label>
        <label>Status<select aria-label="Status" name="status" defaultValue={params.get('status') || ''}><option value="">All statuses</option>{statuses.map(value => <option key={value} value={value}>{label(value)}</option>)}</select></label>
        <label>Category<select aria-label="Category" name="category" defaultValue={params.get('category') || ''}><option value="">All categories</option>{taxonomy.data?.categories.map(row => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label>
        <label>Singer<select aria-label="Singer" name="singer" defaultValue={params.get('singer') || ''}><option value="">All singers</option>{taxonomy.data?.singers.map(row => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label>
        <label>Featured<select aria-label="Featured" name="featured" defaultValue={params.get('featured') || ''}><option value="">All</option><option value="yes">Featured</option><option value="no">Not featured</option></select></label>
        <label>Sort<select aria-label="Sort" name="sort" defaultValue={params.get('sort') || 'updated'}><option value="updated">Recently updated</option><option value="oldest">Oldest updated</option><option value="title">Title A–Z</option><option value="published">Recently published</option></select></label>
      </div><div className={s.actions}><button type="submit">Apply filters</button><button type="button" onClick={() => setParams({})}>Reset</button></div>
    </form>
    {message && <p role="status" className={s.success}>{message}</p>}{error && <p role="alert" className={s.error}>{error}</p>}
    <AsyncNotice {...taxonomy} retry={taxonomy.reload} /><AsyncNotice {...result} retry={result.reload} />
    {result.data && <>
      <p className={s.muted}>{result.data.count} mezmur found</p>
      {!result.data.rows.length ? <div className={s.card}>No mezmur match these filters.</div> : <div className={s.tableWrap}><table>
        <thead><tr>{['Thumbnail', 'Title', 'Amharic title', 'Singer', 'Category', 'Status', 'Featured', 'Updated', 'Actions'].map(name => <th key={name} scope="col">{name}</th>)}</tr></thead>
        <tbody>{result.data.rows.map(row => <tr key={row.id}>
          <td><Media reference={row.thumbnail_url} /></td><td><strong>{row.title}</strong></td><td lang="am">{row.title_amharic || '—'}</td>
          <td>{taxonomy.data?.singers.find(item => item.id === row.singer_id)?.name || '—'}</td><td>{taxonomy.data?.categories.find(item => item.id === row.category_id)?.name || '—'}</td>
          <td><Status value={row.status} /></td><td>{row.featured ? '★ Yes' : '—'}</td><td>{new Date(row.updated_at).toLocaleDateString()}</td>
          <td><div className={s.actions}>
            {(staff || (row.created_by === profile?.id && row.status === 'draft')) && <Link to={`/admin/hymns/mezmur/${row.id}/edit`}>Edit</Link>}
            <button onClick={() => setPreview(row)}>Preview</button><button disabled={busy} onClick={() => void action(row, 'duplicate')}>Duplicate</button>
            {staff && row.status !== 'archived' && <button disabled={busy} onClick={() => void action(row, 'archive')}>Archive</button>}
            {admin && <button className={s.danger} disabled={busy} onClick={() => void action(row, 'delete')}>Delete</button>}
          </div></td>
        </tr>)}</tbody>
      </table></div>}
      <div className={s.pagination}><span>Page {page} of {pages}</span><div className={s.actions}>
        <button disabled={page <= 1} onClick={() => { const next = new URLSearchParams(params); next.set('page', String(page - 1)); setParams(next) }}>Previous</button>
        <button disabled={page >= pages} onClick={() => { const next = new URLSearchParams(params); next.set('page', String(page + 1)); setParams(next) }}>Next</button>
      </div></div>
    </>}
    {preview && <Modal title="Mezmur preview" close={() => setPreview(null)}><MezmurPreview item={preview} /></Modal>}
  </>
}


