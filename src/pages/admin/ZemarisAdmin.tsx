import { useCallback, useMemo, useState, type CSSProperties } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  assignMezmurToZemari,
  getZemari,
  listMezmursForZemari,
  listZemaris,
  removeMezmurFromZemari,
  saveZemari,
  searchMezmursToLink,
  slugifyZemari,
  zemariImagePreviewUrl,
  type ZemariListFilters,
  type ZemariMezmurLink,
  type ZemariRow,
} from '../../lib/cms/zemariAdminService'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { useAsync } from '../../lib/cms/useAsync'
import { ADMIN_PATHS } from './adminPaths'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

const thumbStyle: CSSProperties = {
  width: '100%',
  maxWidth: 280,
  aspectRatio: '4 / 3',
  objectFit: 'cover',
  borderRadius: 12,
  background: 'var(--color-bg-soft, #f3eee4)',
  display: 'block',
}

function Thumb({ path, alt }: { path?: string | null; alt?: string | null }) {
  const url = zemariImagePreviewUrl(path)
  if (!url) return <div style={thumbStyle} aria-hidden />
  return <img src={url} alt={alt || ''} style={thumbStyle} loading="lazy" />
}

export function ZemarisList() {
  const [search, setSearch] = useState('')
  const [status, setStatus] = useState<ZemariListFilters['status']>('all')
  const [featured, setFeatured] = useState(false)
  const [hasMezmurs, setHasMezmurs] = useState<ZemariListFilters['hasMezmurs']>('all')

  const filters = useMemo(
    () => ({ search, status, featured: featured || undefined, hasMezmurs }),
    [search, status, featured, hasMezmurs],
  )

  const result = useAsync(useCallback(() => listZemaris(filters), [filters]))

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>HYMNS PRACTICE</p>
          <h1>Zemari Library</h1>
          <p className={s.muted}>Manage singers and the Mezmurs associated with them.</p>
        </div>
        <Link className={s.primary} to={`${ADMIN_PATHS.hymnsZemaris}/new`}>
          + Add Zemari
        </Link>
      </div>

      <div className={s.fields} style={{ marginBottom: '1rem' }}>
        <label>
          Search
          <input
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Name, Amharic, or slug"
          />
        </label>
        <label>
          Status
          <select
            value={status}
            onChange={(e) => setStatus(e.target.value as ZemariListFilters['status'])}
          >
            <option value="all">All statuses</option>
            <option value="published">Published</option>
            <option value="draft">Draft</option>
            <option value="archived">Archived</option>
          </select>
        </label>
        <label>
          Mezmurs
          <select
            value={hasMezmurs}
            onChange={(e) => setHasMezmurs(e.target.value as ZemariListFilters['hasMezmurs'])}
          >
            <option value="all">All</option>
            <option value="yes">Has Mezmurs</option>
            <option value="no">No Mezmurs</option>
          </select>
        </label>
        <label className={s.check}>
          <input
            type="checkbox"
            checked={featured}
            onChange={(e) => setFeatured(e.target.checked)}
          />
          Featured only
        </label>
      </div>

      <AsyncNotice {...result} retry={result.reload} />

      {result.data && !result.data.length ? (
        <div className={s.card}>
          <p>No Zemaris yet.</p>
          <p className={s.muted}>Add your first Zemari to begin organizing hymns.</p>
          <Link className={s.primary} to={`${ADMIN_PATHS.hymnsZemaris}/new`}>
            + Add Zemari
          </Link>
        </div>
      ) : null}

      {result.data?.length ? (
        <div className={s.stack}>
          {result.data.map((row) => (
            <article key={row.id} className={s.card}>
              <div
                style={{
                  display: 'grid',
                  gridTemplateColumns: 'minmax(100px, 160px) minmax(0, 1fr)',
                  gap: '1rem',
                  alignItems: 'start',
                }}
              >
                <Thumb path={row.image_path} alt={row.image_alt || row.name} />
                <div>
                  <strong>{row.name}</strong>
                  {row.name_amharic ? (
                    <div lang="am" className={s.muted}>
                      {row.name_amharic}
                    </div>
                  ) : null}
                  <div className={s.muted}>
                    <code>{row.slug}</code> · {row.mezmur_count ?? 0} Mezmurs · {row.status}
                    {row.is_featured ? ' · Featured' : ''}
                    {row.updated_at
                      ? ` · Updated ${new Date(row.updated_at).toLocaleDateString()}`
                      : ''}
                  </div>
                  <div className={s.actions} style={{ marginTop: '0.75rem' }}>
                    <Link to={`${ADMIN_PATHS.hymnsZemaris}/${row.id}/edit`}>Edit</Link>
                    <Link to={`${ADMIN_PATHS.hymnsZemaris}/${row.id}/edit#mezmurs`}>
                      View Mezmurs
                    </Link>
                    <Link to={`/practice/zemari/${row.slug}`} target="_blank" rel="noreferrer">
                      Public
                    </Link>
                  </div>
                </div>
              </div>
            </article>
          ))}
        </div>
      ) : null}
    </>
  )
}

export function ZemariEditor() {
  const { id } = useParams()
  const isNew = !id || id === 'new'
  const navigate = useNavigate()
  const result = useAsync(
    useCallback(async () => {
      if (isNew) return { zemari: null as ZemariRow | null, mezmurs: [] as ZemariMezmurLink[] }
      const zemari = await getZemari(id!)
      const mezmurs = await listMezmursForZemari(zemari.id)
      return { zemari, mezmurs }
    }, [id, isNew]),
  )

  if (!isNew && result.loading && !result.data) {
    return <AsyncNotice {...result} retry={result.reload} />
  }

  return (
    <ZemariEditorForm
      key={result.data?.zemari?.id || 'new'}
      existing={result.data?.zemari || null}
      initialMezmurs={result.data?.mezmurs || []}
      loadError={result.error}
      onReload={result.reload}
      onCreated={(saved) => navigate(`${ADMIN_PATHS.hymnsZemaris}/${saved.id}/edit`, { replace: true })}
    />
  )
}

function ZemariEditorForm({
  existing,
  initialMezmurs,
  loadError,
  onReload,
  onCreated,
}: {
  existing: ZemariRow | null
  initialMezmurs: ZemariMezmurLink[]
  loadError?: string | null
  onReload: () => void
  onCreated: (row: ZemariRow) => void
}) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [mezmurs, setMezmurs] = useState(initialMezmurs)
  const [linkQuery, setLinkQuery] = useState('')
  const [linkResults, setLinkResults] = useState<ZemariMezmurLink[]>([])
  const [form, setForm] = useState({
    name: existing?.name || '',
    name_amharic: existing?.name_amharic || '',
    slug: existing?.slug || '',
    bio: existing?.bio || '',
    bio_amharic: existing?.bio_amharic || '',
    image_path: existing?.image_path || '',
    image_alt: existing?.image_alt || '',
    youtube_url: existing?.youtube_url || '',
    website_url: existing?.website_url || '',
    sort_order: existing?.sort_order ?? 0,
    is_featured: existing?.is_featured ?? false,
    status: (existing?.status || 'published') as ZemariRow['status'],
  })

  async function save() {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const slug = form.slug.trim() || slugifyZemari(form.name)
      if (!form.name.trim()) throw new Error('Name is required.')
      if (!slug) throw new Error('Slug is required.')
      const saved = await saveZemari(
        {
          ...form,
          slug,
          image_path: form.image_path || null,
          image_alt: form.image_alt || null,
          name_amharic: form.name_amharic || null,
          bio: form.bio || null,
          bio_amharic: form.bio_amharic || null,
          youtube_url: form.youtube_url || null,
          website_url: form.website_url || null,
        },
        existing?.id,
      )
      setForm({
        name: saved.name,
        name_amharic: saved.name_amharic || '',
        slug: saved.slug,
        bio: saved.bio || '',
        bio_amharic: saved.bio_amharic || '',
        image_path: saved.image_path || '',
        image_alt: saved.image_alt || '',
        youtube_url: saved.youtube_url || '',
        website_url: saved.website_url || '',
        sort_order: saved.sort_order ?? 0,
        is_featured: saved.is_featured ?? false,
        status: saved.status || 'published',
      })
      setSuccess(`Saved “${saved.name}”.`)
      if (!existing) onCreated(saved)
      else onReload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not save Zemari.')
    } finally {
      setBusy(false)
    }
  }

  async function runLinkSearch() {
    try {
      const rows = await searchMezmursToLink(linkQuery, 25)
      setLinkResults(rows.filter((r) => r.zemari_id !== existing?.id))
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Search failed.')
    }
  }

  async function linkMezmur(row: ZemariMezmurLink) {
    if (!existing) {
      setError('Save the Zemari first, then assign Mezmurs.')
      return
    }
    setBusy(true)
    setError('')
    try {
      await assignMezmurToZemari(existing, { mezmur_id: row.mezmur_id, slug: row.slug })
      const next = await listMezmursForZemari(existing.id)
      await getZemari(existing.id)
      setMezmurs(next)
      setSuccess(`Linked “${row.title}”.`)
      setLinkResults((prev) => prev.filter((r) => r.slug !== row.slug))
      onReload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not link Mezmur.')
    } finally {
      setBusy(false)
    }
  }

  async function unlinkMezmur(row: ZemariMezmurLink) {
    if (!existing) return
    setBusy(true)
    setError('')
    try {
      await removeMezmurFromZemari({ mezmur_id: row.mezmur_id, slug: row.slug })
      const next = await listMezmursForZemari(existing.id)
      setMezmurs(next)
      setSuccess(`Removed “${row.title}”.`)
      onReload()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not remove Mezmur.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to={ADMIN_PATHS.hymnsZemaris}>← Zemari Library</Link>
          <h1>{existing ? 'Edit Zemari' : 'Add Zemari'}</h1>
        </div>
        <button type="button" className={s.primary} disabled={busy} onClick={() => void save()}>
          {busy ? 'Saving…' : 'Save'}
        </button>
      </div>
      {loadError ? (
        <p role="alert" className={s.error}>
          {loadError}
        </p>
      ) : null}
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
          <h2>Profile</h2>
          <div className={s.fields}>
            <label>
              Name *
              <input
                value={form.name}
                onChange={(e) => {
                  const name = e.target.value
                  setForm((prev) => ({
                    ...prev,
                    name,
                    slug: existing ? prev.slug : slugifyZemari(name),
                  }))
                }}
              />
            </label>
            <label>
              Amharic name
              <input
                lang="am"
                value={form.name_amharic}
                onChange={(e) => setForm((prev) => ({ ...prev, name_amharic: e.target.value }))}
              />
            </label>
            <label>
              Slug *
              <input
                value={form.slug}
                onChange={(e) => setForm((prev) => ({ ...prev, slug: slugifyZemari(e.target.value) }))}
              />
            </label>
            <label>
              Bio
              <textarea
                rows={4}
                value={form.bio}
                onChange={(e) => setForm((prev) => ({ ...prev, bio: e.target.value }))}
              />
            </label>
            <label>
              Amharic bio
              <textarea
                lang="am"
                rows={4}
                value={form.bio_amharic}
                onChange={(e) => setForm((prev) => ({ ...prev, bio_amharic: e.target.value }))}
              />
            </label>
            <label>
              YouTube URL
              <input
                value={form.youtube_url}
                onChange={(e) => setForm((prev) => ({ ...prev, youtube_url: e.target.value }))}
              />
            </label>
            <label>
              Website URL
              <input
                value={form.website_url}
                onChange={(e) => setForm((prev) => ({ ...prev, website_url: e.target.value }))}
              />
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
            <label>
              Status
              <select
                value={form.status}
                onChange={(e) =>
                  setForm((prev) => ({ ...prev, status: e.target.value as ZemariRow['status'] }))
                }
              >
                <option value="published">published</option>
                <option value="draft">draft</option>
                <option value="archived">archived</option>
              </select>
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
          <p className={s.muted}>4:3 preview matches public Zemari cards.</p>
          <div style={{ marginBottom: '0.75rem' }}>
            <Thumb path={form.image_path} alt={form.image_alt || form.name} />
          </div>
          <MediaPicker
            label="Change image"
            folder="hymns/zemaris"
            value={form.image_path || ''}
            altText={form.image_alt}
            previewAspect="4/3"
            suggestedPath={form.slug ? `hymns/zemaris/${form.slug}.webp` : undefined}
            onChange={(next) =>
              setForm((prev) => ({
                ...prev,
                image_path: next.storagePath,
                image_alt: next.altText || prev.image_alt,
              }))
            }
          />
          <label style={{ display: 'block', marginTop: '0.75rem' }}>
            Image alt text
            <input
              value={form.image_alt}
              onChange={(e) => setForm((prev) => ({ ...prev, image_alt: e.target.value }))}
            />
          </label>
        </section>
      </div>

      <section className={s.card} style={{ marginTop: '1.5rem' }} id="mezmurs">
        <h2>Associated Mezmurs</h2>
        <p className={s.muted}>
          Sets <code>mezmur_data_import.zemari_id</code>. Does not duplicate hymn rows. Published
          Zemaris with at least one visible Mezmur appear under Hymn Practice → Zemari / Singers.
        </p>
        {!existing ? (
          <p className={s.muted}>Save the Zemari first, then assign Mezmurs.</p>
        ) : (
          <>
            <div className={s.actions} style={{ marginBottom: '0.75rem' }}>
              <input
                value={linkQuery}
                onChange={(e) => setLinkQuery(e.target.value)}
                placeholder="Search Mezmurs to add"
                style={{ minWidth: 220 }}
              />
              <button type="button" disabled={busy} onClick={() => void runLinkSearch()}>
                + Add existing Mezmur
              </button>
            </div>
            {linkResults.length ? (
              <ul className={s.stack}>
                {linkResults.map((row) => (
                  <li key={row.slug} className={s.card}>
                    <strong>{row.title}</strong>
                    {row.title_amharic ? (
                      <div lang="am" className={s.muted}>
                        {row.title_amharic}
                      </div>
                    ) : null}
                    <div className={s.muted}>
                      <code>{row.slug}</code>
                      {row.zemari_id ? ' · already linked to another Zemari' : ''}
                    </div>
                    <button type="button" disabled={busy} onClick={() => void linkMezmur(row)}>
                      Assign
                    </button>
                  </li>
                ))}
              </ul>
            ) : null}
            <div className={s.stack} style={{ marginTop: '1rem' }}>
              {mezmurs.map((row) => (
                <article key={row.slug} className={s.card}>
                  <strong>{row.title}</strong>
                  {row.title_amharic ? (
                    <div lang="am" className={s.muted}>
                      {row.title_amharic}
                    </div>
                  ) : null}
                  <div className={s.muted}>
                    <code>{row.slug}</code> · {row.status || '—'}
                  </div>
                  <div className={s.actions}>
                    <Link to={`${ADMIN_PATHS.hymnsMezmur}/${row.mezmur_id || row.slug}/edit`}>
                      Edit Mezmur
                    </Link>
                    <button type="button" disabled={busy} onClick={() => void unlinkMezmur(row)}>
                      Remove relationship
                    </button>
                  </div>
                </article>
              ))}
              {!mezmurs.length ? <p className={s.muted}>No Mezmurs linked yet.</p> : null}
            </div>
          </>
        )}
      </section>
    </>
  )
}
