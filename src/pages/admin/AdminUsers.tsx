import { useEffect, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { getAdminUser, listAdminUsers, type AdminUserProfile } from '../../lib/cms/adminUsersService'
import s from './Admin.module.css'
import styles from './AdminUsers.module.css'

const roles = ['all', 'user', 'contributor', 'editor', 'admin', 'super_admin']
const errorText = (cause: unknown) => cause instanceof Error ? cause.message : 'Could not load profiles.'
const date = (value: string) => value ? new Date(value).toLocaleDateString() : 'Unavailable'

export function AdminUsers() {
  const [params, setParams] = useSearchParams()
  const search = params.get('q') || ''
  const role = roles.includes(params.get('role') || '') ? params.get('role')! : 'all'
  const page = Math.max(1, Number.parseInt(params.get('page') || '1', 10) || 1)
  const selectedId = params.get('user')
  const [items, setItems] = useState<AdminUserProfile[]>([])
  const [total, setTotal] = useState<number | null>(null)
  const [selected, setSelected] = useState<AdminUserProfile | null>(null)
  const [loading, setLoading] = useState(true)
  const [detailLoading, setDetailLoading] = useState(false)
  const [error, setError] = useState('')
  const [detailError, setDetailError] = useState('')
  const [refresh, setRefresh] = useState(0)
  const detailPending = !!selectedId && (detailLoading || (!detailError && selected?.id !== selectedId))
  function query(patch: Record<string, string | null>) {
    const next = new URLSearchParams(params)
    for (const [key, value] of Object.entries(patch)) {
      if (value) next.set(key, value)
      else next.delete(key)
    }
    setParams(next)
  }
  useEffect(() => {
    let active = true
    void listAdminUsers({ search, role, page }).then(result => {
      if (!active) return
      setItems(result.items); setTotal(result.total); setError(''); setLoading(false)
    }).catch(cause => { if (active) { setError(errorText(cause)); setLoading(false); setTotal(null); setItems([]) } })
    return () => { active = false }
  }, [search, role, page, refresh])
  useEffect(() => {
    let active = true
    if (!selectedId) return
    void getAdminUser(selectedId).then(profile => {
      if (active) { setSelected(profile); setDetailError(''); setDetailLoading(false) }
    }).catch(cause => { if (active) { setSelected(null); setDetailError(errorText(cause)); setDetailLoading(false) } })
    return () => { active = false }
  }, [selectedId, refresh])
  return <div className={styles.users}>
    <header className={s.heading}><div><p className={s.eyebrow}>ACCOUNT DIRECTORY</p><h1>Users</h1><p className={s.muted}>Profiles visible to your administrator role. Account activity and suspension status are not available from this source.</p></div>
      <button type="button" onClick={() => { setLoading(true); setRefresh(value => value + 1) }}>Refresh</button></header>
    <div className={styles.filters}>
      <label>Search name or email<input value={search} onChange={event => { setLoading(true); query({ q: event.target.value, page: null }) }} /></label>
      <label>Role<select value={role} onChange={event => { setLoading(true); query({ role: event.target.value === 'all' ? null : event.target.value, page: null }) }}>{roles.map(value => <option key={value} value={value}>{value === 'all' ? 'All visible roles' : value.replaceAll('_', ' ')}</option>)}</select></label>
    </div>
    {loading && <p role="status">Loading authorized profiles…</p>}
    {error && <p role="alert" className={s.error}>{error}</p>}
    {!loading && !error && <p role="status">{total} visible profiles</p>}
    {!loading && !error && !items.length && <p className={s.muted}>No visible profiles match these filters.</p>}
    {!loading && !error && (!!items.length || !!selectedId) && <div className={styles.layout}>
      <div><p className={styles.mobileHint}>Swipe the table to see role, date, and details.</p><div className={s.tableWrap}><table><thead><tr><th scope="col">Name</th><th scope="col">Email</th><th scope="col">Role</th><th scope="col">Profile created</th><th scope="col">Details</th></tr></thead><tbody>{items.map(item => <tr key={item.id}>
        <th scope="row">{item.display_name || 'Unnamed profile'}</th><td>{item.email || 'Unavailable'}</td><td>{item.role || 'Unassigned'}</td><td>{date(item.created_at)}</td><td><button type="button" onClick={() => { setDetailLoading(true); query({ user: item.id }) }}>View</button></td>
      </tr>)}</tbody></table></div></div>
      {selectedId && <aside className={`${s.card} ${styles.detail}`} aria-label="User details">
        <button type="button" onClick={() => query({ user: null })}>Close details</button>
        {detailPending && <p role="status">Loading profile…</p>}{!detailPending && detailError && <p role="alert">{detailError}</p>}
        {!detailPending && selected?.id === selectedId && <><h2>{selected.display_name || 'Unnamed profile'}</h2><dl><dt>Email</dt><dd>{selected.email || 'Unavailable'}</dd><dt>Role</dt><dd>{selected.role || 'Unassigned'}</dd><dt>Profile created</dt><dd>{date(selected.created_at)}</dd><dt>Profile updated</dt><dd>{date(selected.updated_at)}</dd></dl><p className={s.muted}>Role changes, suspension, and deletion are disabled pending authorization and audit review.</p></>}
      </aside>}
    </div>}
    {!loading && !error && total !== null && total > 25 && <nav className={s.pagination} aria-label="User pages"><button type="button" disabled={page <= 1} onClick={() => { setLoading(true); query({ page: String(page - 1) }) }}>Previous</button><span>Page {page} of {Math.ceil(total / 25)}</span><button type="button" disabled={page * 25 >= total} onClick={() => { setLoading(true); query({ page: String(page + 1) }) }}>Next</button></nav>}
  </div>
}
