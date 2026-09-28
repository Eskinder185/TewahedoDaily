import { useCallback, useState, type FormEvent } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { db, errorMessage, getTaxonomy, slugify, type Category, type Singer, type Tag } from '../../lib/cms/mezmurService'
import { useAsync } from '../../lib/cms/useAsync'
import type { ContentType } from '../../lib/supabase/cms.types'
import { AsyncNotice, Modal } from './AdminUi'
import s from './Admin.module.css'
type Kind = 'categories' | 'singers' | 'tags'
type Item = Category | Singer | Tag
export function TaxonomyPage() {
  const { pathname } = useLocation()
  const kind = pathname.split('/')[2] as Kind
  return <TaxonomyManager key={kind} kind={kind} />
}
function TaxonomyManager({ kind }: { kind: Kind }) {
  const result = useAsync(useCallback(() => getTaxonomy(), []))
  const { profile } = useAuth()
  const canManage =
    profile?.role === 'admin' ||
    profile?.role === 'super_admin' ||
    profile?.role === 'editor'
  const [editing, setEditing] = useState<Item | 'new' | null>(null)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const [busy, setBusy] = useState(false)
  const [search, setSearch] = useState('')
  async function mutate(item: Item, remove: boolean) {
    if (!window.confirm(remove ? `Delete “${item.name}”? Items in use cannot be deleted.` : `${'is_archived' in item && item.is_archived ? 'Unarchive' : 'Archive'} “${item.name}”?`)) return
    setBusy(true); setError('')
    try {
      const request = remove ? db().from(kind).delete().eq('id', item.id).select('id')
        : db().from(kind === 'singers' ? 'singers' : 'categories').update({ is_archived: !('is_archived' in item && item.is_archived) }).eq('id', item.id).select('id')
      const { data, error: issue } = await request
      if (issue) throw issue
      if (!data.length) throw new Error('No change was made. Check your permissions and refresh.')
      setMessage(remove ? 'Item deleted.' : 'Archive status updated.'); result.reload()
    } catch (cause) { setError(errorMessage(cause)) }
    finally { setBusy(false) }
  }
  const rows = result.data?.[kind].filter(row => row.name.toLocaleLowerCase().includes(search.toLocaleLowerCase())) || []
  return <>
    <div className={s.heading}><div><h1 className={s.capitalize}>{kind}</h1><p className={s.muted}>Maintain the library’s names and classifications.</p></div>{canManage && <button className={s.primary} onClick={() => setEditing('new')}>Add {kind === 'categories' ? 'category' : kind === 'singers' ? 'singer' : 'tag'}</button>}</div>
    <div className={s.actions}><Link to="/admin/categories">Categories</Link><Link to="/admin/singers">Singers</Link><Link to="/admin/tags">Tags</Link></div>
    {!canManage && <p className={s.notice}>Only editors and administrators can manage these items.</p>}
    <label style={{ maxWidth: 380, marginBlock: 20 }}>Search {kind}<input value={search} onChange={e => setSearch(e.target.value)} /></label>
    {error && <p role="alert" className={s.error}>{error}</p>}{message && <p role="status" className={s.success}>{message}</p>}
    <AsyncNotice {...result} retry={result.reload} />
    {result.data && <div className={s.tableWrap}><table><thead><tr><th>Name</th><th>Details</th><th>Status</th><th>Actions</th></tr></thead><tbody>
      {rows.map(item => <tr key={item.id}><td><strong>{item.name}</strong>{'name_amharic' in item && <div lang="am">{item.name_amharic}</div>}</td><td>{'slug' in item ? item.slug : 'description' in item ? item.description : '—'}</td><td>{'is_archived' in item && item.is_archived ? 'Archived' : 'Active'}</td><td>{canManage && <div className={s.actions}>
        <button disabled={busy} onClick={() => setEditing(item)}>Edit</button>{'is_archived' in item && <button disabled={busy} onClick={() => void mutate(item, false)}>{item.is_archived ? 'Unarchive' : 'Archive'}</button>}<button className={s.danger} disabled={busy} onClick={() => void mutate(item, true)}>Delete</button>
      </div>}</td></tr>)}{!rows.length && <tr><td colSpan={4}>No items found.</td></tr>}
    </tbody></table></div>}
    {editing && <TaxonomyForm kind={kind} item={editing === 'new' ? undefined : editing} close={() => setEditing(null)} saved={() => { setEditing(null); setMessage('Item saved.'); result.reload() }} />}
  </>
}
function TaxonomyForm({ kind, item, close, saved }: { kind: Kind; item?: Item; close: () => void; saved: () => void }) {
  const initial = { name: item?.name || '', name_amharic: item && 'name_amharic' in item ? item.name_amharic || '' : '', slug: item && 'slug' in item ? item.slug : '', description: item && 'description' in item ? item.description || '' : '', type: item && 'type' in item ? item.type : 'mezmur', image_url: item && 'image_url' in item ? item.image_url || '' : '' }
  const [values, setValues] = useState(initial)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  function cancel() { if (!busy && (JSON.stringify(values) === JSON.stringify(initial) || window.confirm('Discard unsaved changes?'))) close() }
  async function submit(event: FormEvent) {
    event.preventDefault(); setError('')
    if (!values.name.trim()) { setError('Name is required.'); return }
    if (kind !== 'singers' && !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(values.slug)) { setError('Use a lowercase slug with letters, numbers, and hyphens.'); return }
    if (values.image_url) { try { if (new URL(values.image_url).protocol !== 'https:') throw new Error() } catch { setError('Image URL must be a valid HTTPS URL.'); return } }
    setBusy(true)
    try {
      let response
      if (kind === 'categories') {
        const payload = { name: values.name.trim(), name_amharic: values.name_amharic, slug: values.slug, description: values.description, type: values.type as ContentType }
        response = await (item ? db().from('categories').update(payload).eq('id', item.id) : db().from('categories').insert(payload)).select('id').single()
      } else if (kind === 'singers') {
        const payload = { name: values.name.trim(), name_amharic: values.name_amharic, description: values.description, image_url: values.image_url }
        response = await (item ? db().from('singers').update(payload).eq('id', item.id) : db().from('singers').insert(payload)).select('id').single()
      } else {
        const payload = { name: values.name.trim(), slug: values.slug }
        response = await (item ? db().from('tags').update(payload).eq('id', item.id) : db().from('tags').insert(payload)).select('id').single()
      }
      if (response.error) throw response.error
      saved()
    } catch (cause) { setError(errorMessage(cause)) }
    finally { setBusy(false) }
  }
  return <Modal title={item ? 'Edit item' : 'Add item'} close={cancel}><div className={s.root} style={{ minHeight: 0, display: 'block' }}><form onSubmit={submit}><fieldset disabled={busy} className={s.fields}>
    <label>Name *<input value={values.name} onChange={e => setValues({ ...values, name: e.target.value })} /></label>
    {kind !== 'tags' && <><label>Amharic name<input lang="am" value={values.name_amharic} onChange={e => setValues({ ...values, name_amharic: e.target.value })} /></label><label>Description<textarea value={values.description} onChange={e => setValues({ ...values, description: e.target.value })} /></label></>}
    {kind !== 'singers' && <><label>Slug *<input value={values.slug} onChange={e => setValues({ ...values, slug: e.target.value })} /></label><button type="button" onClick={() => setValues({ ...values, slug: slugify(values.name) })}>Generate slug</button></>}
    {kind === 'categories' && <label>Content type<select value={values.type} onChange={e => setValues({ ...values, type: e.target.value as ContentType })}>{['mezmur', 'saints', 'feasts', 'prayers', 'articles'].map(type => <option key={type}>{type}</option>)}</select></label>}
    {kind === 'singers' && <label>Image URL<input value={values.image_url} onChange={e => setValues({ ...values, image_url: e.target.value })} /></label>}
    {error && <p role="alert" className={s.error}>{error}</p>}<button type="submit" className={s.primary}>{busy ? 'Saving…' : 'Save item'}</button>
  </fieldset></form></div></Modal>
}

