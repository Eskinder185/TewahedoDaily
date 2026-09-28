import { useCallback, useEffect, useState, useRef } from 'react'
import {
  Link,
  useBlocker,
  useNavigate,
  useParams,
  useSearchParams,
} from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { useAsync } from '../../lib/cms/useAsync'
import {
  contentHistory,
  emptyContent,
  getContent,
  listContent,
  lookupContent,
  saveContent,
  teachingCategories,
  type EditorialContent,
  type EditorialKind,
  type Related,
} from '../../lib/cms/contentService'
import { errorMessage, statuses } from '../../lib/cms/mezmurService'
import type { ContentStatus, ContentType } from '../../lib/supabase/cms.types'
import { AsyncNotice, Modal, Status } from './AdminUi'
import { ContentBody } from '../../components/publicContent/ContentBody'
import { ContentUpload } from './MediaLibrary'
import s from './Admin.module.css'
export function ContentList({ kind }: { kind: EditorialKind }) {
  const [params, setParams] = useSearchParams()
  const q = params.get('q') || ''
  const status = params.get('status') || ''
  const page = Math.max(1, Number(params.get('page')) || 1)
  const result = useAsync(
    useCallback(
      () => listContent(kind, q, status, page),
      [kind, q, status, page],
    ),
  )
  return (
    <>
      <div className={s.heading}>
        <h1 className={s.capitalize}>{kind}</h1>
        <Link to={`/admin/${kind}/new`}>+ Create {kind}</Link>
      </div>
      <form
        key={params.toString()}
        className={s.filters}
        onSubmit={(event) => {
          event.preventDefault()
          const data = new FormData(event.currentTarget)
          setParams({
            q: String(data.get('q')),
            status: String(data.get('status')),
          })
        }}
      >
        <label>
          Search
          <input name="q" defaultValue={q} />
        </label>
        <label>
          Status
          <select name="status" defaultValue={status}>
            <option value="">All</option>
            {statuses.map((x) => (
              <option key={x}>{x}</option>
            ))}
          </select>
        </label>
        <button>Search</button>
      </form>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && (
        <>
          <div className={s.tableWrap}>
            <table>
              <thead>
                <tr>
                  <th>Title</th>
                  <th>Status</th>
                  <th>Updated</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {result.data.items.map((row) => (
                  <tr key={row.id}>
                    <td>{row.title}</td>
                    <td>
                      <Status value={row.status} />
                    </td>
                    <td>{new Date(row.updated_at).toLocaleDateString()}</td>
                    <td>
                      <Link to={`/admin/${kind}/${row.id}/edit`}>
                        Edit / review
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {!result.data.items.length && <p>No content matches.</p>}
          <div className={s.actions}>
            <button
              disabled={page <= 1}
              onClick={() => setParams({ q, status, page: String(page - 1) })}
            >
              Previous
            </button>
            <span>Page {page}</span>
            <button
              disabled={page * 24 >= result.data.total}
              onClick={() => setParams({ q, status, page: String(page + 1) })}
            >
              Next
            </button>
          </div>
        </>
      )}
    </>
  )
}
export function ContentEditor({ kind }: { kind: EditorialKind }) {
  const { id } = useParams()
  const result = useAsync(
    useCallback(
      () => (id ? getContent(kind, id) : Promise.resolve(emptyContent())),
      [kind, id],
    ),
  )
  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && (
        <Editor
          key={kind + (id || 'new')}
          kind={kind}
          initial={result.data}
          existing={!!id}
        />
      )}
    </>
  )
}
function Editor({
  kind,
  initial,
  existing,
}: {
  kind: EditorialKind
  initial: EditorialContent
  existing: boolean
}) {
  const navigate = useNavigate()
  const savedNavigation = useRef(false)
  const [uploading, setUploading] = useState(false)
  const { profile } = useAuth()
  const staff = profile?.role !== 'contributor'
  const admin = ['admin', 'super_admin'].includes(profile?.role || '')
  const [row, setRow] = useState(existing ? initial : undefined)
  const [input, setInput] = useState(initial)
  const [baseline, setBaseline] = useState(JSON.stringify(initial))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [preview, setPreview] = useState(false)
  const dirty = JSON.stringify(input) !== baseline
  const blocker = useBlocker(
    () => !savedNavigation.current && (dirty || busy || uploading),
  )
  const canEdit =
    staff || !row || (row.created_by === profile?.id && row.status === 'draft')
  const history = useAsync(
    useCallback(
      () =>
        row
          ? contentHistory(kind, row.id)
          : Promise.resolve({ versions: [], authors: [] }),
      [kind, row],
    ),
  )
  useEffect(() => {
    const guard = (e: BeforeUnloadEvent) => {
      if (dirty || busy || uploading) {
        e.preventDefault()
        e.returnValue = ''
      }
    }
    window.addEventListener('beforeunload', guard)
    return () => window.removeEventListener('beforeunload', guard)
  }, [dirty, busy, uploading])
  function set(key: keyof EditorialContent, value: unknown) {
    setInput((old) => ({ ...old, [key]: value }))
    setSuccess('')
  }
  async function save(status: ContentStatus) {
    if (!input.title.trim() || !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(input.slug)) {
      setError('Enter a title and a lowercase, hyphenated slug.')
      return
    }
    for (const ref of [input.thumbnail_url, input.audio_url])
      if (ref && !ref.startsWith('storage://') && !/^https:\/\//.test(ref)) {
        setError('Media must use an HTTPS URL or a Storage reference.')
        return
      }
    if (
      (['rejected', 'archived'].includes(status) ||
        (row?.status === 'published' && status !== 'published')) &&
      !window.confirm(`Change content to ${status}?`)
    )
      return
    setBusy(true)
    setError('')
    try {
      const saved = await saveContent(kind, { ...input, status }, row)
      setRow(saved)
      setInput(saved)
      setBaseline(JSON.stringify(saved))
      setSuccess(`Saved as ${status}.`)
      if (!row) {
        savedNavigation.current = true
        navigate(`/admin/${kind}/${saved.id}/edit`, { replace: true })
      }
    } catch (e) {
      setError(errorMessage(e))
    } finally {
      setBusy(false)
    }
  }
  const text = (key: keyof EditorialContent, label: string, area = false) => (
    <label key={key}>
      {label}
      {area ? (
        <textarea
          value={String(input[key] || '')}
          maxLength={100000}
          onChange={(e) => set(key, e.target.value)}
        />
      ) : (
        <input
          value={String(input[key] || '')}
          maxLength={key === 'title' ? 200 : 2000}
          onChange={(e) => set(key, e.target.value)}
        />
      )}
    </label>
  )
  return (
    <>
      <Link to={`/admin/${kind}`}>← Back to {kind}</Link>
      <div className={s.heading}>
        <h1>
          {row ? 'Edit' : 'Create'} {kind}
        </h1>
        <Status value={input.status} />
      </div>
      {error && (
        <p role="alert" className={s.error}>
          {error}
        </p>
      )}
      {success && (
        <p role="status" className={s.success}>
          {success}
        </p>
      )}
      <p>{dirty ? 'Unsaved changes' : 'All changes saved'}</p>
      <form
        onSubmit={(e) => {
          e.preventDefault()
          void save(input.status)
        }}
      >
        <fieldset disabled={!canEdit || busy || uploading} className={s.fields}>
          {text('title', 'Title / name')}
          {text('title_amharic', 'Amharic title / name')}
          {text('title_oromo', 'Oromo title / name')}
          {text('slug', 'Slug')}
          {text('description', 'Description', true)}
          {text('body_amharic', 'Amharic text', true)}
          {text('body', 'English text', true)}
          {text('body_oromo', 'Oromo text', true)}
          {kind === 'prayers' &&
            text('transliteration', 'Transliteration', true)}
          {(kind === 'saints' || kind === 'feasts') && (
            <>
              {text('date_notes', 'Date information')}
              {(['month', 'day'] as const).map((part) => {
                const key = (
                  kind === 'saints'
                    ? `commemoration_${part}`
                    : `ethiopian_${part}`
                ) as keyof EditorialContent
                return (
                  <label key={key}>
                    Ethiopian {part}
                    <input
                      type="number"
                      min={1}
                      max={part === 'month' ? 13 : 30}
                      value={String(input[key] ?? '')}
                      onChange={(e) =>
                        set(key, e.target.value ? Number(e.target.value) : null)
                      }
                    />
                  </label>
                )
              })}
            </>
          )}
          {kind === 'feasts' && (
            <>
              <label className={s.check}>
                <input
                  type="checkbox"
                  checked={!!input.is_movable}
                  onChange={(e) => set('is_movable', e.target.checked)}
                />
                Movable feast
              </label>
              {text('fasting_info', 'Fasting information', true)}
            </>
          )}
          {kind === 'articles' && (
            <label>
              Teaching category
              <select
                value={input.teaching_category || ''}
                onChange={(e) =>
                  set('teaching_category', e.target.value || null)
                }
              >
                <option value="">Choose category</option>
                {teachingCategories.map((x) => (
                  <option key={x}>{x}</option>
                ))}
              </select>
            </label>
          )}
          {text('thumbnail_url', 'Image URL / Storage reference')}
          {text('audio_url', 'Audio URL / Storage reference')}
          {row ? (
            <ContentUpload
              onBusy={setUploading}
              kind={kind}
              id={row.id}
              onUploaded={(ref, type) =>
                set(type === 'image' ? 'thumbnail_url' : 'audio_url', ref)
              }
            />
          ) : (
            <p>Save a draft before uploading files.</p>
          )}
          <RelatedPicker
            value={input.related_content || []}
            onChange={(value) => set('related_content', value)}
          />
          <div className={s.actions}>
            <button type="button" onClick={() => void save('draft')}>
              Save Draft
            </button>
            <button type="button" onClick={() => void save('pending_review')}>
              Submit for Review
            </button>
            {staff && (
              <>
                <button type="button" onClick={() => void save('rejected')}>
                  Reject
                </button>
                <button type="button" onClick={() => void save('archived')}>
                  Archive
                </button>
                {(admin ||
                  row?.status === 'pending_review' ||
                  row?.status === 'published') && (
                  <button type="button" onClick={() => void save('published')}>
                    Publish
                  </button>
                )}
              </>
            )}
            <button type="submit">Save changes</button>
          </div>
        </fieldset>
      </form>
      <button onClick={() => setPreview(true)}>Preview</button>
      <section className={s.card}>
        <h2>Version history</h2>
        <AsyncNotice {...history} retry={history.reload} />
        {history.data?.versions.map((v) => (
          <details key={v.id}>
            <summary>
              {new Date(v.created_at).toLocaleString()} ·{' '}
              {history.data?.authors.find((a) => a.id === v.changed_by)
                ?.display_name || 'CMS member'}
            </summary>
            <pre className={s.lyrics}>
              {JSON.stringify(v.snapshot, null, 2)}
            </pre>
            {admin && (
              <button
                onClick={() => {
                  const snapshot = v.snapshot as { record?: EditorialContent }
                  if (
                    snapshot.record &&
                    window.confirm(
                      'Load this previous version as a draft? Review and save to restore.',
                    )
                  ) {
                    setInput({
                      ...emptyContent(),
                      ...snapshot.record,
                      id: input.id,
                      status: 'draft',
                    })
                    setSuccess('Version loaded; review and save.')
                  }
                }}
              >
                Restore as draft
              </button>
            )}
          </details>
        ))}
        {!history.data?.versions.length && <p>No versions yet.</p>}
      </section>
      {preview && (
        <Modal title="Content preview" close={() => setPreview(false)}>
          <ContentBody item={input} kind={kind} preview />
        </Modal>
      )}
      {blocker.state === 'blocked' && (
        <Modal title="Discard unsaved changes?" close={() => blocker.reset()}>
          <button onClick={() => blocker.reset()}>Keep editing</button>
          <button onClick={() => blocker.proceed()}>Discard changes</button>
        </Modal>
      )}
    </>
  )
}
export function RelatedPicker({
  value,
  onChange,
}: {
  value: Related[]
  onChange: (value: Related[]) => void
}) {
  const [kind, setKind] = useState<ContentType>('mezmur')
  const [q, setQ] = useState('')
  const result = useAsync(useCallback(() => lookupContent(kind, q), [kind, q]))
  return (
    <section>
      <h2>Related content</h2>
      <label>
        Content type
        <select
          value={kind}
          onChange={(e) => setKind(e.target.value as ContentType)}
        >
          {['mezmur', 'saints', 'feasts', 'prayers', 'articles'].map((x) => (
            <option key={x}>{x}</option>
          ))}
        </select>
      </label>
      <label>
        Find published content
        <input
          value={q}
          maxLength={100}
          onChange={(e) => setQ(e.target.value)}
        />
      </label>
      <AsyncNotice {...result} retry={result.reload} />
      <label>
        Add relation
        <select
          value=""
          onChange={(e) => {
            const row = result.data?.find((x) => x.id === e.target.value)
            if (
              row &&
              value.length < 30 &&
              !value.some((x) => x.type === kind && x.id === row.id)
            )
              onChange([...value, { type: kind, id: row.id, title: row.title }])
          }}
        >
          <option value="">Select content</option>
          {result.data?.map((x) => (
            <option key={x.id} value={x.id}>
              {x.title}
            </option>
          ))}
        </select>
      </label>
      <ul>
        {value.map((x) => (
          <li key={x.type + x.id}>
            {x.title || x.type}{' '}
            <button
              type="button"
              onClick={() => onChange(value.filter((y) => y !== x))}
            >
              Remove
            </button>
          </li>
        ))}
      </ul>
    </section>
  )
}
