import { useCallback, useState, type FormEvent } from 'react'
import { Link, Navigate, useLocation } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import {
  db,
  errorMessage,
  getTaxonomy,
  listTaxonomyOccasions,
  slugify,
  type Category,
  type Tag,
} from '../../lib/cms/mezmurService'
import type { DerivedTaxonomyItem } from '../../lib/cms/hymnTaxonomyImport'
import { useAsync } from '../../lib/cms/useAsync'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice, Modal } from './AdminUi'
import s from './Admin.module.css'

type Kind = 'categories' | 'singers' | 'tags' | 'occasions'

type Item = Category | Tag | DerivedTaxonomyItem

export function TaxonomyPage({ kind: kindProp }: { kind?: Kind }) {
  const { pathname } = useLocation()
  const segment = pathname.split('/').filter(Boolean).pop() as Kind
  const kind = kindProp || segment
  if (kind === 'singers') {
    return <Navigate to={ADMIN_PATHS.hymnsZemaris} replace />
  }
  return <TaxonomyManager key={kind} kind={kind} />
}

function TaxonomyManager({ kind }: { kind: Exclude<Kind, 'singers'> }) {
  const derivedReadOnly = kind === 'occasions' || kind === 'categories'
  const result = useAsync(
    useCallback(async () => {
      if (kind === 'occasions') {
        const occasions = await listTaxonomyOccasions()
        return { categories: [] as Category[], tags: [] as Tag[], occasions }
      }
      if (kind === 'categories') {
        const tax = await getTaxonomy()
        return {
          categories: tax.categories,
          tags: [] as Tag[],
          occasions: [] as DerivedTaxonomyItem[],
        }
      }
      const tax = await getTaxonomy()
      return {
        categories: [] as Category[],
        tags: tax.tags,
        occasions: [] as DerivedTaxonomyItem[],
      }
    }, [kind]),
  )
  const { profile } = useAuth()
  const canManage =
    !derivedReadOnly &&
    (profile?.role === 'admin' ||
      profile?.role === 'super_admin' ||
      profile?.role === 'editor')
  const [editing, setEditing] = useState<Item | 'new' | null>(null)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const [busy, setBusy] = useState(false)
  const [search, setSearch] = useState('')

  async function mutate(item: Item, remove: boolean) {
    if (derivedReadOnly) {
      setError(
        kind === 'occasions'
          ? 'Occasions are derived from mezmur_occasion_links_import and cannot be edited here.'
          : 'Categories are derived from mezmur_category_links_import and cannot be edited here.',
      )
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
      if (kind === 'tags') {
        const { data, error: issue } = await db()
          .from('tags')
          .delete()
          .eq('id', item.id)
          .select('id')
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

  const rows: Item[] =
    ((kind === 'occasions'
      ? result.data?.occasions
      : kind === 'categories'
        ? result.data?.categories
        : result.data?.tags) as Item[] | undefined)?.filter((row) =>
      row.name.toLocaleLowerCase().includes(search.toLocaleLowerCase()),
    ) || []

  const label = kind === 'occasions' ? 'Occasions' : kind === 'categories' ? 'Categories' : 'Tags'

  return (
    <>
      <div className={s.heading}>
        <div>
          <h1>{label}</h1>
          <p className={s.muted}>
            {kind === 'occasions'
              ? 'Derived from mezmur_occasion_links_import.occasion_slug (read-only).'
              : kind === 'categories'
                ? 'Derived from mezmur_category_links_import.category_slug (read-only).'
                : 'Manage tags for Hymns Practice discovery.'}
          </p>
        </div>
        {canManage ? (
          <button className={s.primary} onClick={() => setEditing('new')}>
            Add {label.slice(0, -1)}
          </button>
        ) : null}
      </div>
      <div className={s.actions}>
        <Link to="/admin/hymns/occasions">Occasions</Link>
        <Link to="/admin/hymns/categories">Categories</Link>
        <Link to={ADMIN_PATHS.hymnsZemaris}>Zemaris</Link>
        <Link to="/admin/hymns/tags">Tags</Link>
      </div>
      {derivedReadOnly ? (
        <p className={s.notice}>
          Read-only taxonomy from import link tables. Assign Mezmurs via the Mezmur editor or CSV
          import. Zemari profiles live under{' '}
          <Link to={ADMIN_PATHS.hymnsZemaris}>Zemari Library</Link>.
        </p>
      ) : null}
      {!canManage && !derivedReadOnly ? (
        <p className={s.notice}>Only editors and administrators can manage these items.</p>
      ) : null}
      <label style={{ maxWidth: 380, marginBlock: 20 }}>
        Search {label}
        <input value={search} onChange={(e) => setSearch(e.target.value)} />
      </label>
      {error ? (
        <p role="alert" className={s.error}>
          {error}
        </p>
      ) : null}
      {message ? (
        <p role="status" className={s.success}>
          {message}
        </p>
      ) : null}
      <AsyncNotice {...result} retry={result.reload} />
      {result.data ? (
        <div className={s.tableWrap}>
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Slug</th>
                <th>Info</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((item) => (
                <tr key={item.id}>
                  <td>{item.name}</td>
                  <td>
                    <code>{'slug' in item && item.slug ? item.slug : item.id}</code>
                  </td>
                  <td>
                    {'mezmur_count' in item
                      ? `${item.mezmur_count} Mezmur${item.mezmur_count === 1 ? '' : 's'}`
                      : '—'}
                  </td>
                  <td>
                    <div className={s.actions}>
                      {derivedReadOnly ? (
                        <span className={s.muted}>Derived</span>
                      ) : (
                        <>
                          <button type="button" onClick={() => setEditing(item)}>
                            Edit
                          </button>
                          <button type="button" disabled={busy} onClick={() => void mutate(item, true)}>
                            Delete
                          </button>
                        </>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
              {!rows.length ? (
                <tr>
                  <td colSpan={4} className={s.muted}>
                    No {label.toLowerCase()} found.
                  </td>
                </tr>
              ) : null}
            </tbody>
          </table>
        </div>
      ) : null}
      {editing && !derivedReadOnly ? (
        <TaxonomyForm
          kind={kind}
          item={editing === 'new' ? null : editing}
          close={() => setEditing(null)}
          saved={() => {
            setEditing(null)
            setMessage('Saved.')
            result.reload()
          }}
        />
      ) : null}
    </>
  )
}

function TaxonomyForm({
  item,
  close,
  saved,
}: {
  kind: 'tags'
  item: Item | null
  close: () => void
  saved: () => void
}) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [values, setValues] = useState({
    name: item?.name || '',
    slug: ('slug' in (item || {}) ? (item as Tag).slug : '') || '',
  })

  async function submit(event: FormEvent) {
    event.preventDefault()
    setError('')
    if (!values.name.trim()) {
      setError('Name is required.')
      return
    }
    const slug = values.slug.trim() || slugify(values.name)
    if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(slug)) {
      setError('Use a lowercase slug with letters, numbers, and hyphens.')
      return
    }
    setBusy(true)
    try {
      const payload = { name: values.name.trim(), slug }
      const response = await (item
        ? db().from('tags').update(payload).eq('id', item.id)
        : db().from('tags').insert(payload)
      )
        .select('id')
        .single()
      if (response.error) throw response.error
      saved()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <Modal title={item ? 'Edit tag' : 'Add tag'} close={close}>
      <form onSubmit={(e) => void submit(e)}>
        <fieldset disabled={busy} className={s.fields}>
          <label>
            Name *
            <input
              value={values.name}
              onChange={(e) => setValues({ ...values, name: e.target.value })}
            />
          </label>
          <label>
            Slug *
            <input
              value={values.slug}
              onChange={(e) => setValues({ ...values, slug: slugify(e.target.value) })}
            />
          </label>
        </fieldset>
        {error ? (
          <p role="alert" className={s.error}>
            {error}
          </p>
        ) : null}
        <div className={s.actions}>
          <button type="button" onClick={close}>
            Cancel
          </button>
          <button type="submit" className={s.primary} disabled={busy}>
            Save
          </button>
        </div>
      </form>
    </Modal>
  )
}
