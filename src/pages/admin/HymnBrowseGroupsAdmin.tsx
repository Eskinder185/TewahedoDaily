import { useCallback, useState, type CSSProperties } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  getHymnCollection,
  hymnImagePreviewUrl,
  listHymnCollections,
  listHymnSectionsForCollection,
  removeHymnSection,
  saveHymnCollection,
  saveHymnSection,
  updateCollectionImage,
  updateSectionImage,
  type HymnCollectionRow,
  type HymnSectionRow,
} from '../../lib/cms/hymnBrowseAdminService'
import { useAsync } from '../../lib/cms/useAsync'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

function slugify(value: string) {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
    .slice(0, 80)
}

const COLLECTION_TYPES: HymnCollectionRow['collection_type'][] = [
  'occasion_group',
  'subject_group',
  'language_group',
  'singer_group',
  'general_group',
]

const SECTION_TYPES = [
  'occasion',
  'saint',
  'angel',
  'subject',
  'language',
  'sacrament',
  'general',
  'singer_collection',
]

const thumbStyle: CSSProperties = {
  width: '100%',
  maxWidth: 280,
  aspectRatio: '4 / 3',
  objectFit: 'cover',
  borderRadius: 12,
  background: 'var(--color-bg-soft, #f3eee4)',
  display: 'block',
}

function Thumb({
  path,
  alt,
}: {
  path: string | null | undefined
  alt?: string | null
}) {
  const url = hymnImagePreviewUrl(path)
  if (!url) {
    return <div style={thumbStyle} aria-hidden />
  }
  return <img src={url} alt={alt || ''} style={thumbStyle} loading="lazy" />
}

export function HymnBrowseGroupsList() {
  const result = useAsync(useCallback(() => listHymnCollections(true), []))
  const [busyId, setBusyId] = useState<string | null>(null)
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')

  async function quickImage(
    row: HymnCollectionRow,
    next: { storagePath: string; altText: string },
  ) {
    setBusyId(row.id)
    setError('')
    setMessage('')
    try {
      await updateCollectionImage(row, {
        image_path: next.storagePath || null,
        image_alt: next.altText || row.image_alt,
      })
      setMessage(`Image updated for “${row.title}”.`)
      result.reload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Image update failed.')
    } finally {
      setBusyId(null)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>HYMNS PRACTICE</p>
          <h1>Collections</h1>
          <p className={s.muted}>
            Level-1 cards from <code>mezmur_collections_import</code>. Change images here; the
            public /hymns page reads the same <code>image_path</code>.
          </p>
        </div>
        <Link className={s.primary} to="/admin/hymns/browse-groups/new">
          + New collection
        </Link>
      </div>
      {message ? (
        <p role="status" className={s.success}>
          {message}
        </p>
      ) : null}
      {error ? (
        <p role="alert" className={s.error}>
          {error}
        </p>
      ) : null}
      <AsyncNotice {...result} retry={result.reload} />
      {result.data ? (
        <div className={s.stack}>
          {result.data.map((row) => (
            <article key={row.id} className={s.card}>
              <div
                style={{
                  display: 'grid',
                  gridTemplateColumns: 'minmax(120px, 200px) minmax(0, 1fr)',
                  gap: '1rem',
                  alignItems: 'start',
                }}
              >
                <Thumb path={row.image_path} alt={row.image_alt || row.title} />
                <div>
                  <strong>{row.title}</strong>
                  {row.title_amharic ? (
                    <div lang="am" className={s.muted}>
                      {row.title_amharic}
                    </div>
                  ) : null}
                  <div className={s.muted}>
                    <code>{row.slug}</code> · {row.collection_type} · {row.status}
                    {row.is_featured ? ' · Featured' : ''}
                  </div>
                  <div className={s.actions} style={{ marginTop: '0.75rem' }}>
                    <Link to={`/admin/hymns/browse-groups/${row.id}/edit`}>Edit</Link>
                    <Link to={`/practice/browse/${row.slug}`} target="_blank" rel="noreferrer">
                      Public preview
                    </Link>
                  </div>
                  <div style={{ marginTop: '0.75rem' }}>
                    <MediaPicker
                      label={busyId === row.id ? 'Saving image…' : 'Change image'}
                      folder={`hymns/collections`}
                      value={row.image_path || ''}
                      altText={row.image_alt}
                      suggestedPath={
                        row.slug ? `hymns/collections/${row.slug}.webp` : undefined
                      }
                      onChange={(next) => void quickImage(row, next)}
                    />
                  </div>
                </div>
              </div>
            </article>
          ))}
          {!result.data.length ? (
            <p className={s.muted}>
              No collections yet. Import from the Mezmur CSV pipeline or create one here.
            </p>
          ) : null}
        </div>
      ) : null}
    </>
  )
}

export function HymnBrowseGroupEditor() {
  const { id } = useParams()
  const isNew = !id || id === 'new'
  const navigate = useNavigate()
  const result = useAsync(
    useCallback(async () => {
      if (isNew) {
        return {
          collection: null as HymnCollectionRow | null,
          sections: [] as HymnSectionRow[],
        }
      }
      const [collection, sections] = await Promise.all([
        getHymnCollection(id!),
        listHymnSectionsForCollection(id!),
      ])
      return { collection, sections }
    }, [id, isNew]),
  )

  if (!isNew && !result.data && !result.error) {
    return <AsyncNotice {...result} retry={result.reload} />
  }

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      {(isNew || result.data) && (
        <CollectionForm
          key={id || 'new'}
          existing={result.data?.collection || null}
          initialSections={result.data?.sections || []}
          onSaved={(savedId) => {
            if (isNew) navigate(`/admin/hymns/browse-groups/${savedId}/edit`, { replace: true })
            else result.reload()
          }}
        />
      )}
    </>
  )
}

function CollectionForm({
  existing,
  initialSections,
  onSaved,
}: {
  existing: HymnCollectionRow | null
  initialSections: HymnSectionRow[]
  onSaved: (id: string) => void
}) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [sections, setSections] = useState(initialSections)
  const [form, setForm] = useState({
    title: existing?.title || '',
    title_amharic: existing?.title_amharic || '',
    slug: existing?.slug || '',
    description: existing?.description || '',
    description_amharic: existing?.description_amharic || '',
    image_path: existing?.image_path || '',
    image_alt: existing?.image_alt || '',
    collection_type: (existing?.collection_type ||
      'general_group') as HymnCollectionRow['collection_type'],
    sort_order: existing?.sort_order ?? 0,
    is_featured: existing?.is_featured ?? false,
    status: (existing?.status || 'draft') as HymnCollectionRow['status'],
  })
  const [newSection, setNewSection] = useState({
    title: '',
    slug: '',
    section_type: 'general',
    sort_order: (sections.length + 1) * 10,
  })

  async function saveCollection() {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const slug = form.slug.trim() || slugify(form.title)
      const saved = await saveHymnCollection(
        { ...form, slug, title: form.title.trim() },
        existing?.id,
      )
      setSuccess(`Saved “${saved.title}” (${saved.status}).`)
      setForm((prev) => ({
        ...prev,
        image_path: saved.image_path || '',
        image_alt: saved.image_alt || '',
      }))
      onSaved(saved.id)
    } catch (cause) {
      if (import.meta.env.DEV) console.error('[hymn admin] collection save', cause)
      setError(cause instanceof Error ? cause.message : 'Save failed.')
    } finally {
      setBusy(false)
    }
  }

  async function saveCollectionImageOnly(next: { storagePath: string; altText: string }) {
    if (!existing) {
      setForm((prev) => ({
        ...prev,
        image_path: next.storagePath,
        image_alt: next.altText || prev.image_alt,
      }))
      return
    }
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await updateCollectionImage(existing, {
        image_path: next.storagePath || null,
        image_alt: next.altText || form.image_alt || null,
      })
      setForm((prev) => ({
        ...prev,
        image_path: saved.image_path || '',
        image_alt: saved.image_alt || '',
      }))
      setSuccess('Image updated')
      onSaved(saved.id)
    } catch (cause) {
      if (import.meta.env.DEV) console.error('[hymn admin] collection image', cause)
      setError(cause instanceof Error ? cause.message : 'Image update failed.')
    } finally {
      setBusy(false)
    }
  }

  async function addSection() {
    if (!existing?.id) {
      setError('Save the collection first, then add sections.')
      return
    }
    const title = newSection.title.trim()
    const slug = newSection.slug.trim() || slugify(title)
    if (!title || !slug) {
      setError('Section title and slug are required.')
      return
    }
    setBusy(true)
    setError('')
    try {
      const saved = await saveHymnSection({
        collection_id: existing.id,
        title,
        slug,
        section_type: newSection.section_type,
        sort_order: newSection.sort_order,
        status: 'published',
      })
      setSections((prev) => [...prev, saved].sort((a, b) => a.sort_order - b.sort_order))
      setNewSection({
        title: '',
        slug: '',
        section_type: newSection.section_type,
        sort_order: (sections.length + 2) * 10,
      })
      setSuccess('Section added.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not add section.')
    } finally {
      setBusy(false)
    }
  }

  async function removeSection(sectionId: string) {
    if (!window.confirm('Delete this section? Linked mezmur section links may remain.')) return
    setBusy(true)
    try {
      await removeHymnSection(sectionId)
      setSections((prev) => prev.filter((i) => i.id !== sectionId))
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Remove failed.')
    } finally {
      setBusy(false)
    }
  }

  async function saveSection(section: HymnSectionRow) {
    if (!existing?.id) return
    setBusy(true)
    setError('')
    try {
      const saved = await saveHymnSection(
        {
          collection_id: existing.id,
          collection_slug: existing.slug,
          title: section.title,
          slug: section.slug,
          title_amharic: section.title_amharic,
          description: section.description,
          description_amharic: section.description_amharic,
          image_path: section.image_path,
          image_alt: section.image_alt,
          section_type: section.section_type,
          sort_order: section.sort_order,
          is_featured: section.is_featured,
          status: section.status,
        },
        section.id,
      )
      setSections((prev) =>
        prev
          .map((row) => (row.id === section.id || row.id === saved.id ? saved : row))
          .sort((a, b) => a.sort_order - b.sort_order),
      )
      setSuccess(`Updated “${saved.title}”.`)
    } catch (cause) {
      if (import.meta.env.DEV) console.error('[hymn admin] section save', cause)
      setError(cause instanceof Error ? cause.message : 'Could not update section.')
    } finally {
      setBusy(false)
    }
  }

  async function saveSectionImage(section: HymnSectionRow, next: { storagePath: string; altText: string }) {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await updateSectionImage(
        {
          id: section.id,
          slug: section.slug,
          collection_slug: section.collection_slug || existing?.slug,
          collection_id: section.collection_id || existing?.id || '',
        },
        {
          image_path: next.storagePath || null,
          image_alt: next.altText || section.image_alt,
        },
      )
      setSections((prev) => prev.map((row) => (row.id === section.id ? saved : row)))
      setSuccess(`Image updated for “${saved.title}”.`)
    } catch (cause) {
      if (import.meta.env.DEV) console.error('[hymn admin] section image', cause)
      setError(cause instanceof Error ? cause.message : 'Section image update failed.')
    } finally {
      setBusy(false)
    }
  }

  function patchSection(id: string, patch: Partial<HymnSectionRow>) {
    setSections((prev) => prev.map((row) => (row.id === id ? { ...row, ...patch } : row)))
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to="/admin/hymns/browse-groups">← Collections</Link>
          <h1>{existing ? 'Edit collection' : 'New collection'}</h1>
        </div>
        <button type="button" className={s.primary} disabled={busy} onClick={() => void saveCollection()}>
          {busy ? 'Saving…' : 'Save'}
        </button>
      </div>
      {error ? (
        <p role="alert" className={s.error}>
          {error}
        </p>
      ) : null}
      {success ? (
        <p role="status" className={s.success}>
          {success}
        </p>
      ) : null}

      <div className={s.formGrid}>
        <section className={s.card}>
          <h2>Collection</h2>
          <div className={s.fields}>
            <label>
              Title *
              <input
                value={form.title}
                onChange={(e) => {
                  const title = e.target.value
                  setForm((prev) => ({
                    ...prev,
                    title,
                    slug: existing ? prev.slug : slugify(title),
                  }))
                }}
              />
            </label>
            <label>
              Amharic title
              <input
                lang="am"
                value={form.title_amharic}
                onChange={(e) => setForm((prev) => ({ ...prev, title_amharic: e.target.value }))}
              />
            </label>
            <label>
              Slug *
              <input
                value={form.slug}
                onChange={(e) => setForm((prev) => ({ ...prev, slug: slugify(e.target.value) }))}
              />
            </label>
            <label>
              Type
              <select
                value={form.collection_type}
                onChange={(e) =>
                  setForm((prev) => ({
                    ...prev,
                    collection_type: e.target.value as HymnCollectionRow['collection_type'],
                  }))
                }
              >
                {COLLECTION_TYPES.map((t) => (
                  <option key={t} value={t}>
                    {t}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Description
              <textarea
                rows={3}
                value={form.description}
                onChange={(e) => setForm((prev) => ({ ...prev, description: e.target.value }))}
              />
            </label>
            <label>
              Status
              <select
                value={form.status}
                onChange={(e) =>
                  setForm((prev) => ({
                    ...prev,
                    status: e.target.value as HymnCollectionRow['status'],
                  }))
                }
              >
                <option value="draft">draft</option>
                <option value="published">published</option>
                <option value="archived">archived</option>
              </select>
            </label>
            <label>
              Sort order
              <input
                type="number"
                value={form.sort_order}
                onChange={(e) =>
                  setForm((prev) => ({ ...prev, sort_order: Number(e.target.value) || 0 }))
                }
              />
            </label>
            <label className={s.check}>
              <input
                type="checkbox"
                checked={form.is_featured}
                onChange={(e) => setForm((prev) => ({ ...prev, is_featured: e.target.checked }))}
              />
              Featured
            </label>
          </div>
        </section>

        <section className={s.card}>
          <h2>Image</h2>
          <p className={s.muted}>4:3 preview matches public Hymns Practice cards.</p>
          <div style={{ marginBottom: '0.75rem' }}>
            <Thumb path={form.image_path} alt={form.image_alt || form.title} />
          </div>
          <MediaPicker
            label="Collection image"
            folder="hymns/collections"
            value={form.image_path || ''}
            altText={form.image_alt}
            suggestedPath={
              form.slug ? `hymns/collections/${form.slug}.webp` : undefined
            }
            onChange={(next) => void saveCollectionImageOnly(next)}
          />
          <label style={{ display: 'block', marginTop: '0.75rem' }}>
            Image alt text
            <input
              value={form.image_alt}
              onChange={(e) => setForm((prev) => ({ ...prev, image_alt: e.target.value }))}
            />
          </label>
          {existing ? (
            <button
              type="button"
              className={s.primary}
              style={{ marginTop: '0.75rem' }}
              disabled={busy}
              onClick={() =>
                void saveCollectionImageOnly({
                  storagePath: form.image_path,
                  altText: form.image_alt,
                })
              }
            >
              Save image
            </button>
          ) : null}
        </section>
      </div>

      <section className={s.card} style={{ marginTop: '1.5rem' }}>
        <h2>Sections</h2>
        <p className={s.muted}>
          Stored in <code>mezmur_sections_import</code>. Public path:{' '}
          <code>/practice/browse/{form.slug || '…'}/:sectionSlug</code>
        </p>
        {!existing ? (
          <p className={s.muted}>Save the collection before adding sections.</p>
        ) : (
          <>
            <div className={s.fields} style={{ marginBottom: '1rem' }}>
              <label>
                New section title
                <input
                  value={newSection.title}
                  onChange={(e) => {
                    const title = e.target.value
                    setNewSection((prev) => ({
                      ...prev,
                      title,
                      slug: slugify(title),
                    }))
                  }}
                />
              </label>
              <label>
                Slug
                <input
                  value={newSection.slug}
                  onChange={(e) =>
                    setNewSection((prev) => ({ ...prev, slug: slugify(e.target.value) }))
                  }
                />
              </label>
              <label>
                Type
                <select
                  value={newSection.section_type}
                  onChange={(e) =>
                    setNewSection((prev) => ({ ...prev, section_type: e.target.value }))
                  }
                >
                  {SECTION_TYPES.map((t) => (
                    <option key={t} value={t}>
                      {t}
                    </option>
                  ))}
                </select>
              </label>
              <button type="button" className={s.primary} disabled={busy} onClick={() => void addSection()}>
                Add section
              </button>
            </div>

            <div className={s.stack}>
              {sections.map((section) => (
                <article key={section.id} className={s.card}>
                  <div
                    style={{
                      display: 'grid',
                      gridTemplateColumns: 'minmax(120px, 200px) minmax(0, 1fr)',
                      gap: '1rem',
                      alignItems: 'start',
                    }}
                  >
                    <Thumb path={section.image_path} alt={section.image_alt || section.title} />
                    <div className={s.fields}>
                      <label>
                        Title
                        <input
                          value={section.title}
                          onChange={(e) => patchSection(section.id, { title: e.target.value })}
                        />
                      </label>
                      <label>
                        Amharic
                        <input
                          lang="am"
                          value={section.title_amharic || ''}
                          onChange={(e) =>
                            patchSection(section.id, { title_amharic: e.target.value })
                          }
                        />
                      </label>
                      <label>
                        Slug
                        <input
                          value={section.slug}
                          onChange={(e) =>
                            patchSection(section.id, { slug: slugify(e.target.value) })
                          }
                        />
                      </label>
                      <label>
                        Type
                        <select
                          value={section.section_type}
                          onChange={(e) =>
                            patchSection(section.id, { section_type: e.target.value })
                          }
                        >
                          {SECTION_TYPES.map((t) => (
                            <option key={t} value={t}>
                              {t}
                            </option>
                          ))}
                        </select>
                      </label>
                      <label>
                        Sort
                        <input
                          type="number"
                          value={section.sort_order}
                          onChange={(e) =>
                            patchSection(section.id, {
                              sort_order: Number(e.target.value) || 0,
                            })
                          }
                        />
                      </label>
                      <label>
                        Status
                        <select
                          value={section.status}
                          onChange={(e) =>
                            patchSection(section.id, {
                              status: e.target.value as HymnSectionRow['status'],
                            })
                          }
                        >
                          <option value="draft">draft</option>
                          <option value="published">published</option>
                          <option value="archived">archived</option>
                        </select>
                      </label>
                      <MediaPicker
                        label="Change image"
                        folder={`hymns/sections/${form.slug || 'general'}`}
                        value={section.image_path || ''}
                        altText={section.image_alt}
                        suggestedPath={
                          form.slug && section.slug
                            ? `hymns/sections/${form.slug}/${section.slug}.webp`
                            : undefined
                        }
                        onChange={(next) => void saveSectionImage(section, next)}
                      />
                      <label>
                        Image alt text
                        <input
                          value={section.image_alt || ''}
                          onChange={(e) =>
                            patchSection(section.id, { image_alt: e.target.value })
                          }
                        />
                      </label>
                    </div>
                  </div>
                  <div className={s.actions}>
                    <Link to={`/practice/browse/${form.slug}/${section.slug}`} target="_blank" rel="noreferrer">
                      Preview
                    </Link>
                    <button type="button" disabled={busy} onClick={() => void saveSection(section)}>
                      Save section
                    </button>
                    <button type="button" disabled={busy} onClick={() => void removeSection(section.id)}>
                      Delete
                    </button>
                  </div>
                </article>
              ))}
              {!sections.length ? <p className={s.muted}>No sections in this collection yet.</p> : null}
            </div>
          </>
        )}
      </section>
    </>
  )
}
