import { useCallback, useEffect, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { MediaPicker } from '../../components/admin/MediaPicker'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import {
  deleteHomepageSlide,
  emptyHomepageSlide,
  errorMessage,
  getHomepageSlide,
  listHomepageSlides,
  reorderHomepageSlides,
  saveHomepageSlide,
  type HomepageSlide,
  type HomepageSlideInput,
} from '../../lib/cms/homepageService'
import { slugify } from '../../lib/cms/mezmurService'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

export function HomepageAdmin() {
  const result = useAsync(useCallback(() => listHomepageSlides(true), []))
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)

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
    setMessage('')
    try {
      await reorderHomepageSlides(ordered)
      setMessage('Order saved.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function toggleActive(row: HomepageSlide) {
    setBusy(true)
    setError('')
    setMessage('')
    try {
      await saveHomepageSlide({ ...row, active: !row.active }, row)
      setMessage(row.active ? 'Slide deactivated.' : 'Slide activated.')
      result.reload()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function remove(row: HomepageSlide) {
    if (!window.confirm(`Delete slide “${row.title}”?`)) return
    setBusy(true)
    setError('')
    try {
      await deleteHomepageSlide(row.id)
      setMessage('Slide deleted.')
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
          <p className={s.eyebrow}>PUBLIC HOME</p>
          <h1>Homepage slides</h1>
          <p className={s.muted}>
            Manage hero slides, images, and buttons. Active slides rotate on the public homepage.
          </p>
        </div>
        <Link className={s.primary} to="/admin/home/slides/new">
          + Add slide
        </Link>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {message ? <p role="status">{message}</p> : null}
      {error ? (
        <p role="alert" className={s.muted}>
          {error}
        </p>
      ) : null}
      {result.data ? (
        <div className={s.tableWrap}>
          <table>
            <thead>
              <tr>
                <th>Preview</th>
                <th>Title</th>
                <th>Order</th>
                <th>Active</th>
                <th>Animation</th>
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
                  <td>{row.sort_order}</td>
                  <td>{row.active ? 'Yes' : 'No'}</td>
                  <td>
                    {row.animation_style} · {Math.round(row.display_duration / 1000)}s
                  </td>
                  <td>
                    <div className={s.actions}>
                      <Link to={`/admin/home/slides/${row.id}/edit`}>Edit</Link>
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
                      <button type="button" disabled={busy} onClick={() => void toggleActive(row)}>
                        {row.active ? 'Deactivate' : 'Activate'}
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
              No slides yet. Create one to drive the public homepage hero.
            </p>
          ) : null}
        </div>
      ) : null}
    </>
  )
}

export function HomepageSlideEditor() {
  const { id } = useParams()
  const isNew = !id || id === 'new'
  const result = useAsync(
    useCallback(async () => {
      if (isNew) {
        const slides = await listHomepageSlides(true)
        return { row: null as HomepageSlide | null, input: emptyHomepageSlide(slides.length) }
      }
      const row = await getHomepageSlide(id!)
      return { row, input: { ...row } as HomepageSlideInput }
    }, [id, isNew]),
  )

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data ? (
        <SlideForm key={id || 'new'} initial={result.data.input} existing={result.data.row} />
      ) : null}
    </>
  )
}

function SlideForm({
  initial,
  existing,
}: {
  initial: HomepageSlideInput
  existing: HomepageSlide | null
}) {
  const navigate = useNavigate()
  const [input, setInput] = useState(initial)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  function set<K extends keyof HomepageSlideInput>(key: K, value: HomepageSlideInput[K]) {
    setInput((prev) => ({ ...prev, [key]: value }))
    setSuccess('')
  }

  useEffect(() => {
    if (!input.slug && input.title) set('slug', slugify(input.title))
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [input.title])

  async function save() {
    if (!input.title.trim()) {
      setError('Title is required.')
      return
    }
    if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(input.slug)) {
      setError('Slug must be lowercase letters, numbers, and hyphens.')
      return
    }
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveHomepageSlide(input, existing)
      setSuccess('Saved.')
      if (!existing) {
        navigate(`/admin/home/slides/${saved.id}/edit`, { replace: true })
      }
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  const previewUrl = resolveContentMediaUrl(input.image_path)

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to="/admin/home/slides">← Homepage slides</Link>
          <h1>{existing ? 'Edit slide' : 'New slide'}</h1>
          <p className={s.muted}>{busy ? 'Saving…' : success || 'Edit hero content and image.'}</p>
        </div>
        <button type="button" className={s.primary} disabled={busy} onClick={() => void save()}>
          {busy ? 'Saving…' : 'Save'}
        </button>
      </div>
      {error ? (
        <p role="alert" className={s.notice}>
          {error}
        </p>
      ) : null}
      {success ? <p role="status">{success}</p> : null}

      <div className={s.formGrid}>
        <div className={s.stack}>
          <section className={s.card}>
            <h2>Content</h2>
            <div className={s.fields}>
              <label>
                Eyebrow
                <input value={input.eyebrow || ''} onChange={(e) => set('eyebrow', e.target.value)} />
              </label>
              <label>
                Title (English) *
                <input value={input.title} onChange={(e) => set('title', e.target.value)} />
              </label>
              <label>
                Title (Amharic)
                <input
                  lang="am"
                  value={input.title_amharic || ''}
                  onChange={(e) => set('title_amharic', e.target.value)}
                />
              </label>
              <label>
                Subtitle (English)
                <textarea
                  value={input.subtitle || ''}
                  onChange={(e) => set('subtitle', e.target.value)}
                />
              </label>
              <label>
                Subtitle (Amharic)
                <textarea
                  lang="am"
                  value={input.subtitle_amharic || ''}
                  onChange={(e) => set('subtitle_amharic', e.target.value)}
                />
              </label>
              <label>
                Slug *
                <input value={input.slug} onChange={(e) => set('slug', e.target.value)} />
              </label>
            </div>
          </section>

          <section className={s.card}>
            <h2>Buttons</h2>
            <div className={s.fields}>
              <label>
                Primary label
                <input
                  value={input.primary_button_label || ''}
                  onChange={(e) => set('primary_button_label', e.target.value)}
                />
              </label>
              <label>
                Primary URL
                <input
                  value={input.primary_button_url || ''}
                  onChange={(e) => set('primary_button_url', e.target.value)}
                />
              </label>
              <label>
                Secondary label
                <input
                  value={input.secondary_button_label || ''}
                  onChange={(e) => set('secondary_button_label', e.target.value)}
                />
              </label>
              <label>
                Secondary URL
                <input
                  value={input.secondary_button_url || ''}
                  onChange={(e) => set('secondary_button_url', e.target.value)}
                />
              </label>
            </div>
          </section>
        </div>

        <div className={s.stack}>
          <section className={s.card}>
            <h2>Image & display</h2>
            <div className={s.fields}>
              <MediaPicker
                label="Hero image"
                folder="homepage"
                value={input.image_path}
                altText={input.image_alt}
                onChange={({ storagePath, altText }) => {
                  setInput((prev) => ({
                    ...prev,
                    image_path: storagePath,
                    image_alt: altText,
                  }))
                  setSuccess('')
                }}
              />
              <label>
                Animation
                <select
                  value={input.animation_style}
                  onChange={(e) =>
                    set('animation_style', e.target.value as HomepageSlideInput['animation_style'])
                  }
                >
                  <option value="fade">Fade</option>
                  <option value="crossfade">Crossfade</option>
                  <option value="slide">Slide</option>
                </select>
              </label>
              <label>
                Display duration (ms)
                <input
                  type="number"
                  min={2000}
                  max={60000}
                  step={500}
                  value={input.display_duration}
                  onChange={(e) => set('display_duration', Number(e.target.value) || 7000)}
                />
              </label>
              <label>
                Sort order
                <input
                  type="number"
                  value={input.sort_order}
                  onChange={(e) => set('sort_order', Number(e.target.value) || 0)}
                />
              </label>
              <label className={s.check}>
                <input
                  type="checkbox"
                  checked={input.active}
                  onChange={(e) => set('active', e.target.checked)}
                />
                Active on homepage
              </label>
            </div>
          </section>

          <section className={s.card}>
            <h2>Public preview</h2>
            <div
              style={{
                position: 'relative',
                borderRadius: 12,
                overflow: 'hidden',
                minHeight: 180,
                background: 'var(--color-navy)',
                color: '#fff8f0',
                padding: 20,
              }}
            >
              {previewUrl ? (
                <img
                  src={previewUrl}
                  alt=""
                  style={{
                    position: 'absolute',
                    inset: 0,
                    width: '100%',
                    height: '100%',
                    objectFit: 'cover',
                    opacity: 0.45,
                  }}
                />
              ) : null}
              <div style={{ position: 'relative', zIndex: 1 }}>
                {input.eyebrow ? (
                  <p style={{ margin: '0 0 8px', fontSize: 12, letterSpacing: '0.12em' }}>
                    {input.eyebrow}
                  </p>
                ) : null}
                <h3 style={{ margin: '0 0 8px', fontFamily: 'var(--font-display)' }}>
                  {input.title || 'Slide title'}
                </h3>
                {input.subtitle ? <p style={{ margin: 0, opacity: 0.9 }}>{input.subtitle}</p> : null}
              </div>
            </div>
          </section>
        </div>
      </div>
    </>
  )
}
