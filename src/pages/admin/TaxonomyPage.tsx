import { useCallback, useState, type FormEvent } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import {
  db,
  errorMessage,
  getTaxonomy,
  slugify,
  type Category,
  type Singer,
  type Tag,
} from '../../lib/cms/mezmurService'
import { useAsync } from '../../lib/cms/useAsync'
import type { ContentType } from '../../lib/supabase/cms.types'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { AsyncNotice, Modal } from './AdminUi'
import s from './Admin.module.css'

type Kind = 'categories' | 'singers' | 'tags' | 'occasions'

type OccasionRow = {
  id: string
  slug: string
  name: string
  name_amharic: string | null
  description: string | null
  image_path: string | null
  image_alt: string | null
  sort_order: number
  is_featured: boolean
  status: string
}

type Item = Category | Singer | Tag | OccasionRow

export function TaxonomyPage({ kind: kindProp }: { kind?: Kind }) {
  const { pathname } = useLocation()
  const segment = pathname.split('/').filter(Boolean).pop() as Kind
  const kind = kindProp || segment
  return <TaxonomyManager key={kind} kind={kind} />
}

async function loadOccasions(): Promise<OccasionRow[]> {
  const { data, error } = await db()
    .from('mezmur_occasions' as never)
    .select(
      'id,slug,name,name_amharic,description,image_path,image_alt,sort_order,is_featured,status',
    )
    .order('sort_order', { ascending: true })
    .order('name', { ascending: true })
  if (error) throw error
  return (data || []) as OccasionRow[]
}

function TaxonomyManager({ kind }: { kind: Kind }) {
  const result = useAsync(
    useCallback(async () => {
      if (kind === 'occasions') {
        const occasions = await loadOccasions()
        return { categories: [], singers: [], tags: [], occasions }
      }
      const tax = await getTaxonomy()
      return { ...tax, occasions: [] as OccasionRow[] }
    }, [kind]),
  )
  const { profile } = useAuth()
  const canManage =
    kind !== 'singers' &&
    (profile?.role === 'admin' ||
      profile?.role === 'super_admin' ||
      profile?.role === 'editor')
  const singersReadOnly = kind === 'singers'
  const [editing, setEditing] = useState<Item | 'new' | null>(null)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const [busy, setBusy] = useState(false)
  const [search, setSearch] = useState('')

  async function mutate(item: Item, remove: boolean) {
    if (kind === 'singers') {
      setError('Singer profiles are currently derived from imported Mezmur data.')
      return
    }
    if (
      !window.confirm(
        remove
          ? `Delete “${item.name}”? Items in use cannot be deleted.`
          : `Archive “${item.name}”?`,
      )
    ) {
      return
    }
    setBusy(true)
    setError('')
    try {
      if (kind === 'occasions') {
        const request = remove
          ? db().from('mezmur_occasions' as never).delete().eq('id', item.id).select('id')
          : db()
              .from('mezmur_occasions' as never)
              .update({ status: 'archived' } as never)
              .eq('id', item.id)
              .select('id')
        const { data, error: issue } = await request
        if (issue) throw issue
        if (!data.length) throw new Error('No change was made.')
      } else if (kind === 'tags') {
        const { data, error: issue } = await db()
          .from('tags')
          .delete()
          .eq('id', item.id)
          .select('id')
        if (issue) throw issue
        if (!data.length) throw new Error('No change was made.')
      } else if (kind === 'categories') {
        const request = remove
          ? db().from('categories').delete().eq('id', item.id).select('id')
          : db()
              .from('categories')
              .update({ is_archived: !('is_archived' in item && item.is_archived) })
              .eq('id', item.id)
              .select('id')
        const { data, error: issue } = await request
        if (issue) throw issue
        if (!data.length) throw new Error('No change was made.')
      }
      setMessage(remove ? 'Item deleted.' : 'Archive status updated.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  const rows =
    (kind === 'occasions'
      ? result.data?.occasions
      : result.data?.[kind === 'categories' ? 'categories' : kind === 'singers' ? 'singers' : 'tags']
    )?.filter((row) => row.name.toLocaleLowerCase().includes(search.toLocaleLowerCase())) || []

  const label =
    kind === 'occasions'
      ? 'Occasions'
      : kind === 'categories'
        ? 'Categories'
        : kind === 'singers'
          ? 'Singers'
          : 'Tags'

  return (
    <>
      <div className={s.heading}>
        <div>
          <h1>{label}</h1>
          <p className={s.muted}>
            {singersReadOnly
              ? 'Singer profiles are currently derived from imported Mezmur data.'
              : 'Manage browse groups and images for Hymns Practice discovery.'}
          </p>
        </div>
        {canManage && (
          <button className={s.primary} onClick={() => setEditing('new')}>
            Add {label.slice(0, -1)}
          </button>
        )}
      </div>
      <div className={s.actions}>
        <Link to="/admin/hymns/occasions">Occasions</Link>
        <Link to="/admin/hymns/categories">Categories</Link>
        <Link to="/admin/hymns/singers">Singers</Link>
        <Link to="/admin/hymns/tags">Tags</Link>
      </div>
      {singersReadOnly ? (
        <p className={s.notice}>
          Read-only list built from singer_id / singer_slug / singer_name on mezmur_data_import.
        </p>
      ) : null}
      {!canManage && !singersReadOnly && (
        <p className={s.notice}>Only editors and administrators can manage these items.</p>
      )}
      <label style={{ maxWidth: 380, marginBlock: 20 }}>
        Search {label}
        <input value={search} onChange={(e) => setSearch(e.target.value)} />
      </label>
      {error && (
        <p role="alert" className={s.error}>
          {error}
        </p>
      )}
      {message && (
        <p role="status" className={s.success}>
          {message}
        </p>
      )}
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && (
        <div className={s.tableWrap}>
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Details</th>
                <th>Image</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((item) => (
                <tr key={item.id}>
                  <td>
                    <strong>{item.name}</strong>
                    {'name_amharic' in item && item.name_amharic ? (
                      <div lang="am">{item.name_amharic}</div>
                    ) : null}
                  </td>
                  <td>
                    {singersReadOnly && 'mezmur_count' in item
                      ? `${(item as Singer).mezmur_count ?? 0} Mezmur${
                          ((item as Singer).mezmur_count ?? 0) === 1 ? '' : 's'
                        }`
                      : 'slug' in item
                        ? item.slug
                        : 'description' in item
                          ? item.description
                          : '—'}
                    {!singersReadOnly && 'sort_order' in item ? ` · sort ${item.sort_order}` : ''}
                  </td>
                  <td>
                    {(() => {
                      const path =
                        'image_path' in item
                          ? String((item as { image_path?: string | null }).image_path || '')
                          : ''
                      const url =
                        'image_url' in item
                          ? String((item as { image_url?: string | null }).image_url || '')
                          : ''
                      return path || url || '—'
                    })()}
                  </td>
                  <td>
                    {(() => {
                      if (singersReadOnly) return 'Derived'
                      if ('status' in item) {
                        return String((item as { status?: string }).status || 'published')
                      }
                      if ('is_archived' in item && Boolean((item as { is_archived?: boolean }).is_archived)) {
                        return 'Archived'
                      }
                      return 'Active'
                    })()}
                  </td>
                  <td>
                    {canManage ? (
                      <div className={s.actions}>
                        <button disabled={busy} onClick={() => setEditing(item)}>
                          Edit
                        </button>
                        {kind !== 'tags' && (
                          <button disabled={busy} onClick={() => void mutate(item, false)}>
                            Archive
                          </button>
                        )}
                        <button
                          className={s.danger}
                          disabled={busy}
                          onClick={() => void mutate(item, true)}
                        >
                          Delete
                        </button>
                      </div>
                    ) : singersReadOnly ? (
                      <span className={s.muted}>Read-only</span>
                    ) : null}
                  </td>
                </tr>
              ))}
              {!rows.length && (
                <tr>
                  <td colSpan={5}>No items found.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      )}
      {editing && (
        <TaxonomyForm
          kind={kind}
          item={editing === 'new' ? undefined : editing}
          close={() => setEditing(null)}
          saved={() => {
            setEditing(null)
            setMessage('Item saved.')
            result.reload()
          }}
        />
      )}
    </>
  )
}

function TaxonomyForm({
  kind,
  item,
  close,
  saved,
}: {
  kind: Kind
  item?: Item
  close: () => void
  saved: () => void
}) {
  const initial = {
    name: item?.name || '',
    name_amharic:
      item && 'name_amharic' in item ? (item.name_amharic as string | null) || '' : '',
    slug: item && 'slug' in item ? String((item as { slug?: string }).slug || '') : '',
    description:
      item && 'description' in item ? (item.description as string | null) || '' : '',
    type: item && 'type' in item ? (item.type as string) : 'mezmur',
    image_path:
      item && 'image_path' in item
        ? (item.image_path as string | null) || ''
        : item && 'image_url' in item
          ? (item.image_url as string | null) || ''
          : '',
    image_alt: item && 'image_alt' in item ? (item.image_alt as string | null) || '' : '',
    sort_order: item && 'sort_order' in item ? Number(item.sort_order) || 0 : 0,
    is_featured: item && 'is_featured' in item ? Boolean(item.is_featured) : false,
    status: item && 'status' in item ? String(item.status) : 'published',
  }
  const [values, setValues] = useState(initial)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')

  function cancel() {
    if (
      !busy &&
      (JSON.stringify(values) === JSON.stringify(initial) ||
        window.confirm('Discard unsaved changes?'))
    ) {
      close()
    }
  }

  async function submit(event: FormEvent) {
    event.preventDefault()
    setError('')
    if (!values.name.trim()) {
      setError('Name is required.')
      return
    }
    if (kind !== 'singers' && !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(values.slug || '')) {
      setError('Use a lowercase slug with letters, numbers, and hyphens.')
      return
    }
    setBusy(true)
    try {
      if (kind === 'occasions') {
        const payload = {
          name: values.name.trim(),
          name_amharic: values.name_amharic.trim() || null,
          slug: (values.slug || '').trim(),
          description: values.description.trim() || null,
          image_path: values.image_path.trim() || null,
          image_alt: values.image_alt.trim() || null,
          sort_order: values.sort_order,
          is_featured: values.is_featured,
          status: values.status,
        }
        const response = await (item
          ? db()
              .from('mezmur_occasions' as never)
              .update(payload as never)
              .eq('id', item.id)
          : db().from('mezmur_occasions' as never).insert(payload as never)
        )
          .select('id')
          .single()
        if (response.error) throw response.error
      } else if (kind === 'categories') {
        const payload = {
          name: values.name.trim(),
          name_amharic: values.name_amharic,
          slug: values.slug,
          description: values.description,
          type: values.type as ContentType,
          image_path: values.image_path.trim() || null,
          image_alt: values.image_alt.trim() || null,
          sort_order: values.sort_order,
          is_featured: values.is_featured,
          status: values.status,
        }
        const response = await (item
          ? db().from('categories').update(payload as never).eq('id', item.id)
          : db().from('categories').insert(payload as never)
        )
          .select('id')
          .single()
        if (response.error) throw response.error
      } else if (kind === 'singers') {
        setError('Singer profiles are currently derived from imported Mezmur data.')
        return
      } else {
        const payload = { name: values.name.trim(), slug: values.slug || slugify(values.name) }
        const response = await (item
          ? db().from('tags').update(payload).eq('id', item.id)
          : db().from('tags').insert(payload)
        )
          .select('id')
          .single()
        if (response.error) throw response.error
      }
      saved()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  const folder =
    kind === 'occasions'
      ? 'hymns/occasions'
      : kind === 'categories'
        ? 'hymns/categories'
        : 'hymns/singers'

  return (
    <Modal title={item ? 'Edit item' : 'Add item'} close={cancel}>
      <div className={s.root} style={{ minHeight: 0, display: 'block' }}>
        <form onSubmit={submit}>
          <fieldset disabled={busy} className={s.fields}>
            <label>
              Name *
              <input
                value={values.name}
                onChange={(e) => setValues({ ...values, name: e.target.value })}
              />
            </label>
            {kind !== 'tags' && (
              <>
                <label>
                  Amharic name
                  <input
                    lang="am"
                    value={values.name_amharic}
                    onChange={(e) => setValues({ ...values, name_amharic: e.target.value })}
                  />
                </label>
                <label>
                  Description
                  <textarea
                    value={values.description}
                    onChange={(e) => setValues({ ...values, description: e.target.value })}
                  />
                </label>
              </>
            )}
            {kind !== 'tags' && (
              <>
                <label>
                  Slug *
                  <input
                    value={values.slug}
                    onChange={(e) => setValues({ ...values, slug: e.target.value })}
                  />
                </label>
                <button
                  type="button"
                  onClick={() => setValues({ ...values, slug: slugify(values.name) })}
                >
                  Generate slug
                </button>
              </>
            )}
            {kind === 'categories' && (
              <label>
                Content type
                <select
                  value={values.type}
                  onChange={(e) => setValues({ ...values, type: e.target.value })}
                >
                  {['mezmur', 'saints', 'feasts', 'prayers', 'articles'].map((type) => (
                    <option key={type}>{type}</option>
                  ))}
                </select>
              </label>
            )}
            {kind !== 'tags' && (
              <>
                <MediaPicker
                  label="Browse image"
                  folder={folder}
                  value={values.image_path}
                  altText={values.image_alt}
                  suggestedPath={
                    values.slug ? `${folder}/${values.slug}.webp` : undefined
                  }
                  onChange={({ storagePath, altText }) =>
                    setValues({
                      ...values,
                      image_path: storagePath,
                      image_alt: altText || values.image_alt,
                    })
                  }
                />
                <label>
                  Sort order
                  <input
                    type="number"
                    value={values.sort_order}
                    onChange={(e) =>
                      setValues({ ...values, sort_order: Number(e.target.value) || 0 })
                    }
                  />
                </label>
                <label>
                  <input
                    type="checkbox"
                    checked={values.is_featured}
                    onChange={(e) => setValues({ ...values, is_featured: e.target.checked })}
                  />{' '}
                  Featured on Hymns Practice landing
                </label>
                <label>
                  Status
                  <select
                    value={values.status}
                    onChange={(e) => setValues({ ...values, status: e.target.value })}
                  >
                    <option value="published">published</option>
                    <option value="draft">draft</option>
                    <option value="archived">archived</option>
                  </select>
                </label>
              </>
            )}
            {error && (
              <p role="alert" className={s.error}>
                {error}
              </p>
            )}
            <button type="submit" className={s.primary}>
              {busy ? 'Saving…' : 'Save item'}
            </button>
          </fieldset>
        </form>
      </div>
    </Modal>
  )
}
