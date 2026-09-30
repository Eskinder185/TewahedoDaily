import { useCallback, useMemo, useState } from 'react'
import { Link, useNavigate, useParams, useSearchParams } from 'react-router-dom'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import {
  deleteCollection,
  deleteCommemoration,
  deleteEntry,
  deleteSection,
  errorMessage,
  getCollection,
  getSynaxariumDay,
  listCollections,
  listCommemorations,
  listEntries,
  listSections,
  listSynaxariumDays,
  reorderRows,
  saveCollection,
  saveCommemoration,
  saveEntry,
  saveSection,
  saveSynaxariumDay,
  statuses,
  type CollectionRow,
  type ContentStatus,
  type EntryRow,
  type SectionRow,
  type SynaxariumCommemorationRow,
  type SynaxariumDayRow,
} from '../../lib/cms/structureAdminService'
import { parseKeywordsFromDb } from '../../lib/synaxarium/keywords'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'

type Kind = 'prayers' | 'liturgy'

const LABELS: Record<Kind, { title: string; folder: 'prayers' | 'liturgy'; entry: string }> = {
  prayers: { title: 'Prayers', folder: 'prayers', entry: 'Prayer' },
  liturgy: { title: 'Liturgy', folder: 'liturgy', entry: 'Entry' },
}

export function StructureCollectionList({
  kind,
  basePath,
}: {
  kind: Kind
  basePath?: string
}) {
  const label = LABELS[kind]
  const root = basePath || (kind === 'prayers' ? '/admin/pray/collections' : '/admin/pray/liturgy')
  const result = useAsync(useCallback(() => listCollections(kind), [kind]))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')

  async function move(id: string, direction: -1 | 1) {
    if (!result.data) return
    const ids = result.data.map((row) => row.id)
    const index = ids.indexOf(id)
    const next = index + direction
    if (index < 0 || next < 0 || next >= ids.length) return
    const ordered = [...ids]
    ;[ordered[index], ordered[next]] = [ordered[next], ordered[index]]
    setBusy(true)
    setError('')
    try {
      const table = kind === 'prayers' ? 'prayer_collections' : 'liturgy_collections'
      await reorderRows(table, ordered)
      setMessage('Order saved.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function remove(row: CollectionRow) {
    if (!window.confirm(`Delete “${row.title}” and its nested content?`)) return
    setBusy(true)
    try {
      await deleteCollection(kind, row.id)
      setMessage('Deleted.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>CONTENT LIBRARY</p>
          <h1>{label.title}</h1>
          <p className={s.muted}>Collections → sections → {label.entry.toLowerCase()}s</p>
        </div>
        <Link className={s.primary} to={`${root}/new`}>
          + Add collection
        </Link>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {message ? <p role="status">{message}</p> : null}
      {error ? (
        <p role="alert">{error}</p>
      ) : null}
      {result.data ? (
        <div className={s.tableWrap}>
          <table>
            <thead>
              <tr>
                <th>Image</th>
                <th>Title</th>
                <th>Status</th>
                <th>Order</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {result.data.map((row, index) => (
                <tr key={row.id}>
                  <td>
                    {row.image_path ? (
                      <img
                        className={s.thumbnail}
                        src={resolveContentMediaUrl(row.image_path)}
                        alt={row.image_alt || ''}
                      />
                    ) : (
                      <span className={s.noImage}>—</span>
                    )}
                  </td>
                  <td>
                    <strong>{row.title}</strong>
                    {row.title_amharic ? (
                      <div lang="am" className={s.muted}>
                        {row.title_amharic}
                      </div>
                    ) : null}
                  </td>
                  <td>
                    <Status value={row.status} />
                  </td>
                  <td>{row.sort_order}</td>
                  <td>
                    <div className={s.actions}>
                      <Link to={`${root}/${row.id}/edit`}>Edit</Link>
                      <button
                        type="button"
                        disabled={busy || index === 0}
                        onClick={() => void move(row.id, -1)}
                      >
                        Up
                      </button>
                      <button
                        type="button"
                        disabled={busy || index === result.data!.length - 1}
                        onClick={() => void move(row.id, 1)}
                      >
                        Down
                      </button>
                      <button
                        type="button"
                        className={s.danger}
                        disabled={busy}
                        onClick={() => void remove(row)}
                      >
                        Delete
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          {!result.data.length ? (
            <p className={s.muted} style={{ padding: 16 }}>
              No collections yet.
            </p>
          ) : null}
        </div>
      ) : null}
    </>
  )
}

export function StructureCollectionEditor({
  kind,
  basePath,
}: {
  kind: Kind
  basePath?: string
}) {
  const { id } = useParams()
  const isNew = !id || id === 'new'
  const label = LABELS[kind]
  const root = basePath || (kind === 'prayers' ? '/admin/pray/collections' : '/admin/pray/liturgy')
  const navigate = useNavigate()
  const [params, setParams] = useSearchParams()
  const sectionId = params.get('section') || ''
  const entryId = params.get('entry') || ''

  const result = useAsync(
    useCallback(async () => {
      if (isNew) {
        return {
          collection: null as CollectionRow | null,
          sections: [] as SectionRow[],
        }
      }
      const collection = await getCollection(kind, id!)
      const sections = await listSections(kind, collection.id)
      return { collection, sections }
    }, [kind, id, isNew]),
  )

  const [form, setForm] = useState<Partial<CollectionRow> | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const collection = result.data?.collection
  const working = form ||
    collection || {
      title: '',
      title_amharic: '',
      description: '',
      slug: '',
      sort_order: 0,
      status: 'draft' as ContentStatus,
      image_path: '',
      image_alt: '',
      featured: false,
      card_label: '',
    }

  async function save() {
    if (!working.title?.trim()) {
      setError('Title is required.')
      return
    }
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveCollection(
        kind,
        {
          title: working.title!,
          slug: working.slug || undefined,
          title_amharic: working.title_amharic,
          description: working.description,
          sort_order: working.sort_order ?? 0,
          status: working.status || 'draft',
          image_path: working.image_path,
          image_alt: working.image_alt,
          featured: working.featured,
          card_label: working.card_label,
        },
        collection,
      )
      setForm(null)
      setSuccess('Saved.')
      if (isNew) navigate(`${root}/${saved.id}/edit`, { replace: true })
      else result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to={root}>← {label.title}</Link>
          <h1>{isNew ? `New ${label.title.slice(0, -1).toLowerCase()} collection` : 'Edit collection'}</h1>
          <p className={s.muted}>{busy ? 'Saving…' : success || 'Collection details and nested content.'}</p>
        </div>
        <button type="button" className={s.primary} disabled={busy} onClick={() => void save()}>
          {busy ? 'Saving…' : 'Save collection'}
        </button>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {error ? (
        <p role="alert" className={s.notice}>
          {error}
        </p>
      ) : null}
      {success ? <p role="status">{success}</p> : null}

      <div className={s.formGrid}>
        <section className={s.card}>
          <h2>Collection</h2>
          <div className={s.fields}>
            <label>
              Title *
              <input
                value={working.title || ''}
                onChange={(e) => setForm({ ...working, title: e.target.value })}
              />
            </label>
            <label>
              Title (Amharic)
              <input
                lang="am"
                value={working.title_amharic || ''}
                onChange={(e) => setForm({ ...working, title_amharic: e.target.value })}
              />
            </label>
            <label>
              Description
              <textarea
                value={working.description || ''}
                onChange={(e) => setForm({ ...working, description: e.target.value })}
              />
            </label>
            <label>
              Slug
              <input
                value={working.slug || ''}
                onChange={(e) => setForm({ ...working, slug: e.target.value })}
              />
            </label>
            <label>
              Status
              <select
                value={working.status || 'draft'}
                onChange={(e) =>
                  setForm({ ...working, status: e.target.value as ContentStatus })
                }
              >
                {statuses.map((status) => (
                  <option key={status} value={status}>
                    {status}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Sort order
              <input
                type="number"
                value={working.sort_order ?? 0}
                onChange={(e) =>
                  setForm({ ...working, sort_order: Number(e.target.value) || 0 })
                }
              />
            </label>
            <label className={s.check}>
              <input
                type="checkbox"
                checked={Boolean(working.featured)}
                onChange={(e) => setForm({ ...working, featured: e.target.checked })}
              />
              Featured
            </label>
          </div>
        </section>

        <section className={s.card}>
          <h2>Collection image</h2>
          <MediaPicker
            folder={label.folder}
            value={working.image_path}
            altText={working.image_alt}
            onChange={({ storagePath, altText }) =>
              setForm({ ...working, image_path: storagePath, image_alt: altText })
            }
          />
          {working.image_path ? (
            <div style={{ marginTop: 16 }}>
              <p className={s.muted}>Card preview</p>
              <div
                style={{
                  border: '1px solid var(--color-border)',
                  borderRadius: 12,
                  overflow: 'hidden',
                  maxWidth: 280,
                }}
              >
                <img
                  src={resolveContentMediaUrl(working.image_path)}
                  alt={working.image_alt || ''}
                  style={{ width: '100%', aspectRatio: '16/10', objectFit: 'cover' }}
                />
                <div style={{ padding: 12 }}>
                  <strong>{working.title || 'Collection'}</strong>
                  {working.title_amharic ? (
                    <div lang="am" className={s.muted}>
                      {working.title_amharic}
                    </div>
                  ) : null}
                </div>
              </div>
            </div>
          ) : null}
        </section>
      </div>

      {!isNew && collection ? (
        <NestedEditor
          kind={kind}
          collection={collection}
          sections={result.data?.sections || []}
          sectionId={sectionId}
          entryId={entryId}
          onSelectSection={(next) => {
            const nextParams = new URLSearchParams(params)
            if (next) nextParams.set('section', next)
            else nextParams.delete('section')
            nextParams.delete('entry')
            setParams(nextParams)
          }}
          onSelectEntry={(next) => {
            const nextParams = new URLSearchParams(params)
            if (next) nextParams.set('entry', next)
            else nextParams.delete('entry')
            setParams(nextParams)
          }}
          onReload={() => result.reload()}
        />
      ) : null}
    </>
  )
}

function NestedEditor({
  kind,
  collection,
  sections,
  sectionId,
  entryId,
  onSelectSection,
  onSelectEntry,
  onReload,
}: {
  kind: Kind
  collection: CollectionRow
  sections: SectionRow[]
  sectionId: string
  entryId: string
  onSelectSection: (id: string) => void
  onSelectEntry: (id: string) => void
  onReload: () => void
}) {
  const label = LABELS[kind]
  const activeSection = sections.find((row) => row.id === sectionId) || null
  const entriesResult = useAsync(
    useCallback(async () => {
      if (!activeSection) return [] as EntryRow[]
      return listEntries(kind, activeSection.id)
    }, [kind, activeSection]),
  )
  const [sectionForm, setSectionForm] = useState<Partial<SectionRow> | null>(null)
  const [entryForm, setEntryForm] = useState<Partial<EntryRow> | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')

  const sectionWorking =
    sectionForm ||
    activeSection || {
      collection_id: collection.id,
      title: '',
      title_amharic: '',
      description: '',
      slug: '',
      sort_order: sections.length,
      status: 'draft' as ContentStatus,
    }

  const activeEntry =
    entriesResult.data?.find((row) => row.id === entryId) || null
  const entryWorking =
    entryForm ||
    activeEntry || {
      section_id: activeSection?.id || '',
      collection_id: collection.id,
      title: '',
      title_amharic: '',
      text_amharic: '',
      text_english: '',
      text_oromo: '',
      transliteration: '',
      speaker: '',
      content_type: '',
      slug: '',
      sort_order: entriesResult.data?.length || 0,
      status: 'draft' as ContentStatus,
      source_page_start: null,
      source_page_end: null,
    }

  async function saveSectionForm(asNew = false) {
    if (!sectionWorking.title?.trim()) {
      setError('Section title is required.')
      return
    }
    setBusy(true)
    setError('')
    try {
      const saved = await saveSection(
        kind,
        {
          collection_id: collection.id,
          title: sectionWorking.title!,
          slug: sectionWorking.slug,
          title_amharic: sectionWorking.title_amharic,
          description: sectionWorking.description,
          sort_order: sectionWorking.sort_order ?? 0,
          status: sectionWorking.status || 'draft',
        },
        asNew ? null : activeSection,
      )
      setSectionForm(null)
      setMessage('Section saved.')
      onReload()
      onSelectSection(saved.id)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function saveEntryForm(asNew = false) {
    if (!activeSection) {
      setError('Select a section first.')
      return
    }
    setBusy(true)
    setError('')
    try {
      const saved = await saveEntry(
        kind,
        {
          section_id: activeSection.id,
          collection_id: collection.id,
          title: entryWorking.title,
          slug: entryWorking.slug,
          title_amharic: entryWorking.title_amharic,
          text_amharic: entryWorking.text_amharic,
          text_english: entryWorking.text_english,
          text_oromo: entryWorking.text_oromo,
          transliteration: entryWorking.transliteration,
          speaker: entryWorking.speaker,
          content_type: entryWorking.content_type,
          sort_order: entryWorking.sort_order ?? 0,
          status: entryWorking.status || 'draft',
          source_page_start: entryWorking.source_page_start,
          source_page_end: entryWorking.source_page_end,
        },
        asNew ? null : activeEntry,
      )
      setEntryForm(null)
      setMessage(`${label.entry} saved.`)
      entriesResult.reload()
      onSelectEntry(saved.id)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className={s.stack} style={{ marginTop: 28 }}>
      {error ? (
        <p role="alert" className={s.notice}>
          {error}
        </p>
      ) : null}
      {message ? <p role="status">{message}</p> : null}

      <section className={s.card}>
        <div className={s.heading}>
          <h2>Sections</h2>
          <button
            type="button"
            onClick={() => {
              setSectionForm({
                collection_id: collection.id,
                title: '',
                title_amharic: '',
                description: '',
                slug: '',
                sort_order: sections.length,
                status: 'draft',
              })
              onSelectSection('')
            }}
          >
            + New section
          </button>
        </div>
        <div className={s.actions} style={{ marginBottom: 16 }}>
          {sections.map((row) => (
            <button
              key={row.id}
              type="button"
              className={row.id === sectionId ? s.primary : undefined}
              onClick={() => {
                setSectionForm(null)
                onSelectSection(row.id)
              }}
            >
              {row.title}
            </button>
          ))}
        </div>
        {(activeSection || sectionForm) && (
          <div className={s.fields}>
            <label>
              Section title *
              <input
                value={sectionWorking.title || ''}
                onChange={(e) => setSectionForm({ ...sectionWorking, title: e.target.value })}
              />
            </label>
            <label>
              Title (Amharic)
              <input
                lang="am"
                value={sectionWorking.title_amharic || ''}
                onChange={(e) =>
                  setSectionForm({ ...sectionWorking, title_amharic: e.target.value })
                }
              />
            </label>
            <label>
              Description
              <textarea
                value={sectionWorking.description || ''}
                onChange={(e) =>
                  setSectionForm({ ...sectionWorking, description: e.target.value })
                }
              />
            </label>
            <label>
              Status
              <select
                value={sectionWorking.status || 'draft'}
                onChange={(e) =>
                  setSectionForm({
                    ...sectionWorking,
                    status: e.target.value as ContentStatus,
                  })
                }
              >
                {statuses.map((status) => (
                  <option key={status} value={status}>
                    {status}
                  </option>
                ))}
              </select>
            </label>
            <div className={s.actions}>
              <button type="button" className={s.primary} disabled={busy} onClick={() => void saveSectionForm(!activeSection || Boolean(sectionForm && !activeSection))}>
                Save section
              </button>
              {activeSection ? (
                <button
                  type="button"
                  className={s.danger}
                  disabled={busy}
                  onClick={() => {
                    if (!window.confirm('Delete this section?')) return
                    void deleteSection(kind, activeSection.id)
                      .then(() => {
                        onSelectSection('')
                        onReload()
                      })
                      .catch((cause) => setError(errorMessage(cause)))
                  }}
                >
                  Delete section
                </button>
              ) : null}
            </div>
          </div>
        )}
      </section>

      {activeSection ? (
        <section className={s.card}>
          <div className={s.heading}>
            <h2>
              {label.entry}s in {activeSection.title}
            </h2>
            <button
              type="button"
              onClick={() => {
                setEntryForm({
                  section_id: activeSection.id,
                  collection_id: collection.id,
                  title: '',
                  title_amharic: '',
                  text_amharic: '',
                  text_english: '',
                  text_oromo: '',
                  transliteration: '',
                  speaker: '',
                  content_type: '',
                  slug: '',
                  sort_order: entriesResult.data?.length || 0,
                  status: 'draft',
                })
                onSelectEntry('')
              }}
            >
              + New {label.entry.toLowerCase()}
            </button>
          </div>
          <AsyncNotice {...entriesResult} retry={entriesResult.reload} />
          {kind === 'liturgy' ? (
            <p className={s.muted}>Showing the first 200 entries for editing performance.</p>
          ) : null}
          <div className={s.tableWrap}>
            <table>
              <thead>
                <tr>
                  <th>Title</th>
                  {kind === 'liturgy' ? <th>Speaker</th> : null}
                  <th>Status</th>
                  <th>Order</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {(entriesResult.data || []).map((row) => (
                  <tr key={row.id}>
                    <td>{row.title || '—'}</td>
                    {kind === 'liturgy' ? <td>{row.speaker || '—'}</td> : null}
                    <td>
                      <Status value={row.status} />
                    </td>
                    <td>{row.sort_order}</td>
                    <td>
                      <button
                        type="button"
                        onClick={() => {
                          setEntryForm(null)
                          onSelectEntry(row.id)
                        }}
                      >
                        Edit
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {(activeEntry || entryForm) && (
            <div className={s.fields} style={{ marginTop: 18 }}>
              <label>
                Title
                <input
                  value={entryWorking.title || ''}
                  onChange={(e) => setEntryForm({ ...entryWorking, title: e.target.value })}
                />
              </label>
              <label>
                Title (Amharic)
                <input
                  lang="am"
                  value={entryWorking.title_amharic || ''}
                  onChange={(e) =>
                    setEntryForm({ ...entryWorking, title_amharic: e.target.value })
                  }
                />
              </label>
              {kind === 'liturgy' ? (
                <>
                  <label>
                    Speaker
                    <select
                      value={entryWorking.speaker || ''}
                      onChange={(e) => setEntryForm({ ...entryWorking, speaker: e.target.value })}
                    >
                      <option value="">—</option>
                      {['Priest', 'Deacon', 'People', 'Choir', 'Reader'].map((speaker) => (
                        <option key={speaker} value={speaker}>
                          {speaker}
                        </option>
                      ))}
                    </select>
                  </label>
                  <label>
                    Content type
                    <select
                      value={entryWorking.content_type || ''}
                      onChange={(e) =>
                        setEntryForm({ ...entryWorking, content_type: e.target.value })
                      }
                    >
                      <option value="">—</option>
                      {[
                        'prayer',
                        'proclamation',
                        'response',
                        'rubric',
                        'instruction',
                        'hymn',
                        'front_matter',
                      ].map((type) => (
                        <option key={type} value={type}>
                          {type}
                        </option>
                      ))}
                    </select>
                  </label>
                </>
              ) : null}
              <label>
                Text (Amharic)
                <textarea
                  lang="am"
                  value={entryWorking.text_amharic || ''}
                  onChange={(e) =>
                    setEntryForm({ ...entryWorking, text_amharic: e.target.value })
                  }
                />
              </label>
              <label>
                Text (English)
                <textarea
                  value={entryWorking.text_english || ''}
                  onChange={(e) =>
                    setEntryForm({ ...entryWorking, text_english: e.target.value })
                  }
                />
              </label>
              <label>
                Text (Oromo)
                <textarea
                  value={entryWorking.text_oromo || ''}
                  onChange={(e) => setEntryForm({ ...entryWorking, text_oromo: e.target.value })}
                />
              </label>
              <label>
                Transliteration
                <textarea
                  value={entryWorking.transliteration || ''}
                  onChange={(e) =>
                    setEntryForm({ ...entryWorking, transliteration: e.target.value })
                  }
                />
              </label>
              <label>
                Status
                <select
                  value={entryWorking.status || 'draft'}
                  onChange={(e) =>
                    setEntryForm({
                      ...entryWorking,
                      status: e.target.value as ContentStatus,
                    })
                  }
                >
                  {statuses.map((status) => (
                    <option key={status} value={status}>
                      {status}
                    </option>
                  ))}
                </select>
              </label>
              <div className={s.actions}>
                <button
                  type="button"
                  className={s.primary}
                  disabled={busy}
                  onClick={() => void saveEntryForm(!activeEntry || Boolean(entryForm && !activeEntry))}
                >
                  Save {label.entry.toLowerCase()}
                </button>
                {activeEntry ? (
                  <button
                    type="button"
                    className={s.danger}
                    disabled={busy}
                    onClick={() => {
                      if (!window.confirm('Delete this item?')) return
                      void deleteEntry(kind, activeEntry.id)
                        .then(() => {
                          onSelectEntry('')
                          entriesResult.reload()
                        })
                        .catch((cause) => setError(errorMessage(cause)))
                    }}
                  >
                    Delete
                  </button>
                ) : null}
              </div>
            </div>
          )}
        </section>
      ) : null}
    </div>
  )
}

export function SynaxariumAdmin() {
  const result = useAsync(useCallback(() => listSynaxariumDays(), []))
  const [q, setQ] = useState('')
  const filtered = useMemo(() => {
    const query = q.trim().toLowerCase()
    if (!query || !result.data) return result.data || []
    return result.data.filter((row) =>
      [
        row.display_date_english,
        row.display_date_amharic,
        row.ethiopian_month,
        row.summary,
        String(row.ethiopian_day),
      ]
        .filter(Boolean)
        .some((value) => String(value).toLowerCase().includes(query)),
    )
  }, [q, result.data])

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>CALENDAR</p>
          <h1>Synaxarium</h1>
          <p className={s.muted}>Edit days and commemorations that power the Calendar page.</p>
        </div>
      </div>
      <form
        className={s.filters}
        onSubmit={(e) => {
          e.preventDefault()
        }}
      >
        <label>
          Search days
          <input value={q} onChange={(e) => setQ(e.target.value)} placeholder="Month, day, summary" />
        </label>
      </form>
      <AsyncNotice {...result} retry={result.reload} />
      <div className={s.tableWrap}>
        <table>
          <thead>
            <tr>
              <th>Date</th>
              <th>Summary</th>
              <th>Status</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {filtered.map((row) => (
              <tr key={row.id}>
                <td>
                  <strong>
                    {row.display_date_english ||
                      `${row.ethiopian_month} ${row.ethiopian_day}`}
                  </strong>
                  {row.display_date_amharic ? (
                    <div lang="am" className={s.muted}>
                      {row.display_date_amharic}
                    </div>
                  ) : null}
                </td>
                <td>{row.summary || '—'}</td>
                <td>
                  <Status value={row.status} />
                </td>
                <td>
                  <Link to={`/admin/calendar/synaxarium/${row.id}/edit`}>Edit</Link>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </>
  )
}

export function SynaxariumDayEditor() {
  const { id } = useParams()
  const result = useAsync(
    useCallback(async () => {
      const day = await getSynaxariumDay(id!)
      const commemorations = await listCommemorations(day.id)
      return { day, commemorations }
    }, [id]),
  )
  const [dayForm, setDayForm] = useState<Partial<SynaxariumDayRow> | null>(null)
  const [commForm, setCommForm] = useState<Partial<SynaxariumCommemorationRow> | null>(null)
  const [selectedCommId, setSelectedCommId] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const day = result.data?.day
  const working = dayForm || day
  const selected =
    result.data?.commemorations.find((row) => row.id === selectedCommId) || null
  const commWorking =
    commForm ||
    selected || {
      day_id: day?.id || '',
      title: '',
      title_amharic: '',
      commemoration_type: '',
      summary: '',
      body_amharic: '',
      body_english: '',
      scripture_references: '',
      keywords: [],
      image_path: '',
      image_alt: '',
      featured: false,
      sort_order: result.data?.commemorations.length || 0,
      status: 'draft' as ContentStatus,
      slug: '',
    }

  async function saveDay() {
    if (!working || !day) return
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      await saveSynaxariumDay(
        {
          ethiopian_month: working.ethiopian_month!,
          ethiopian_month_number: working.ethiopian_month_number!,
          ethiopian_day: working.ethiopian_day!,
          slug: working.slug,
          display_date_amharic: working.display_date_amharic,
          display_date_english: working.display_date_english,
          summary: working.summary,
          image_path: working.image_path,
          image_alt: working.image_alt,
          status: working.status || 'draft',
        },
        day,
      )
      setDayForm(null)
      setSuccess('Day saved.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function saveComm(asNew = false) {
    if (!day || !commWorking.title?.trim()) {
      setError('Commemoration title is required.')
      return
    }
    setBusy(true)
    setError('')
    try {
      const saved = await saveCommemoration(
        {
          day_id: day.id,
          day_slug: day.slug,
          title: commWorking.title!,
          slug: commWorking.slug,
          title_amharic: commWorking.title_amharic,
          commemoration_type: commWorking.commemoration_type,
          summary: commWorking.summary,
          body_amharic: commWorking.body_amharic,
          body_english: commWorking.body_english,
          scripture_references: commWorking.scripture_references,
          keywords: parseKeywordsFromDb(commWorking.keywords),
          image_path: commWorking.image_path,
          image_alt: commWorking.image_alt,
          featured: Boolean(commWorking.featured),
          sort_order: commWorking.sort_order ?? 0,
          status: commWorking.status || 'draft',
        },
        asNew ? null : selected,
      )
      setCommForm(null)
      setSelectedCommId(saved.id)
      setSuccess('Commemoration saved.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to="/admin/calendar/synaxarium">← Synaxarium</Link>
          <h1>Edit Synaxarium day</h1>
          <p className={s.muted}>{busy ? 'Saving…' : success || 'Day and commemorations'}</p>
        </div>
        <button type="button" className={s.primary} disabled={busy || !working} onClick={() => void saveDay()}>
          {busy ? 'Saving…' : 'Save day'}
        </button>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {error ? (
        <p role="alert" className={s.notice}>
          {error}
        </p>
      ) : null}
      {success ? <p role="status">{success}</p> : null}
      {working ? (
        <div className={s.formGrid}>
          <section className={s.card}>
            <h2>Day</h2>
            <div className={s.fields}>
              <label>
                Display date (English)
                <input
                  value={working.display_date_english || ''}
                  onChange={(e) =>
                    setDayForm({ ...working, display_date_english: e.target.value })
                  }
                />
              </label>
              <label>
                Display date (Amharic)
                <input
                  lang="am"
                  value={working.display_date_amharic || ''}
                  onChange={(e) =>
                    setDayForm({ ...working, display_date_amharic: e.target.value })
                  }
                />
              </label>
              <label>
                Ethiopian month
                <input
                  value={working.ethiopian_month || ''}
                  onChange={(e) => setDayForm({ ...working, ethiopian_month: e.target.value })}
                />
              </label>
              <label>
                Month number
                <input
                  type="number"
                  value={working.ethiopian_month_number ?? 1}
                  onChange={(e) =>
                    setDayForm({
                      ...working,
                      ethiopian_month_number: Number(e.target.value) || 1,
                    })
                  }
                />
              </label>
              <label>
                Day
                <input
                  type="number"
                  value={working.ethiopian_day ?? 1}
                  onChange={(e) =>
                    setDayForm({ ...working, ethiopian_day: Number(e.target.value) || 1 })
                  }
                />
              </label>
              <label>
                Summary
                <textarea
                  value={working.summary || ''}
                  onChange={(e) => setDayForm({ ...working, summary: e.target.value })}
                />
              </label>
              <label>
                Status
                <select
                  value={working.status || 'draft'}
                  onChange={(e) =>
                    setDayForm({ ...working, status: e.target.value as ContentStatus })
                  }
                >
                  {statuses.map((status) => (
                    <option key={status} value={status}>
                      {status}
                    </option>
                  ))}
                </select>
              </label>
              <MediaPicker
                folder="synaxarium"
                value={working.image_path}
                altText={working.image_alt}
                onChange={({ storagePath, altText }) =>
                  setDayForm({ ...working, image_path: storagePath, image_alt: altText })
                }
              />
            </div>
          </section>

          <section className={s.card}>
            <div className={s.heading}>
              <h2>Commemorations</h2>
              <button
                type="button"
                onClick={() => {
                  setSelectedCommId('')
                  setCommForm({
                    day_id: day!.id,
                    title: '',
                    title_amharic: '',
                    commemoration_type: '',
                    summary: '',
                    body_amharic: '',
                    body_english: '',
                    scripture_references: '',
                    keywords: [],
                    image_path: '',
                    image_alt: '',
                    featured: false,
                    sort_order: result.data?.commemorations.length || 0,
                    status: 'draft',
                    slug: '',
                  })
                }}
              >
                + Add
              </button>
            </div>
            <ul className={s.activityList}>
              {(result.data?.commemorations || []).map((row) => (
                <li key={row.id}>
                  <button
                    type="button"
                    onClick={() => {
                      setCommForm(null)
                      setSelectedCommId(row.id)
                    }}
                  >
                    {row.title}
                  </button>
                  <Status value={row.status} />
                </li>
              ))}
            </ul>

            {(selected || commForm) && (
              <div className={s.fields} style={{ marginTop: 16 }}>
                <label>
                  Title *
                  <input
                    value={commWorking.title || ''}
                    onChange={(e) => setCommForm({ ...commWorking, title: e.target.value })}
                  />
                </label>
                <label>
                  Title (Amharic)
                  <input
                    lang="am"
                    value={commWorking.title_amharic || ''}
                    onChange={(e) =>
                      setCommForm({ ...commWorking, title_amharic: e.target.value })
                    }
                  />
                </label>
                <label>
                  Type
                  <input
                    value={commWorking.commemoration_type || ''}
                    onChange={(e) =>
                      setCommForm({ ...commWorking, commemoration_type: e.target.value })
                    }
                  />
                </label>
                <label>
                  Summary
                  <textarea
                    value={commWorking.summary || ''}
                    onChange={(e) => setCommForm({ ...commWorking, summary: e.target.value })}
                  />
                </label>
                <label>
                  Body (English)
                  <textarea
                    value={commWorking.body_english || ''}
                    onChange={(e) =>
                      setCommForm({ ...commWorking, body_english: e.target.value })
                    }
                  />
                </label>
                <label>
                  Body (Amharic)
                  <textarea
                    lang="am"
                    value={commWorking.body_amharic || ''}
                    onChange={(e) =>
                      setCommForm({ ...commWorking, body_amharic: e.target.value })
                    }
                  />
                </label>
                <label>
                  Scripture references
                  <input
                    value={commWorking.scripture_references || ''}
                    onChange={(e) =>
                      setCommForm({ ...commWorking, scripture_references: e.target.value })
                    }
                  />
                </label>
                <label>
                  Status
                  <select
                    value={commWorking.status || 'draft'}
                    onChange={(e) =>
                      setCommForm({
                        ...commWorking,
                        status: e.target.value as ContentStatus,
                      })
                    }
                  >
                    {statuses.map((status) => (
                      <option key={status} value={status}>
                        {status}
                      </option>
                    ))}
                  </select>
                </label>
                <MediaPicker
                  folder="synaxarium"
                  value={commWorking.image_path}
                  altText={commWorking.image_alt}
                  onChange={({ storagePath, altText }) =>
                    setCommForm({
                      ...commWorking,
                      image_path: storagePath,
                      image_alt: altText,
                    })
                  }
                />
                <div className={s.actions}>
                  <button
                    type="button"
                    className={s.primary}
                    disabled={busy}
                    onClick={() => void saveComm(!selected || Boolean(commForm && !selected))}
                  >
                    Save commemoration
                  </button>
                  {selected ? (
                    <button
                      type="button"
                      className={s.danger}
                      disabled={busy}
                      onClick={() => {
                        if (!window.confirm('Delete this commemoration?')) return
                        void deleteCommemoration(selected.id)
                          .then(() => {
                            setSelectedCommId('')
                            result.reload()
                          })
                          .catch((cause) => setError(errorMessage(cause)))
                      }}
                    >
                      Delete
                    </button>
                  ) : null}
                </div>
              </div>
            )}
          </section>
        </div>
      ) : null}
    </>
  )
}
