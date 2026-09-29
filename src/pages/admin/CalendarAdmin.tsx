import { useCallback, useMemo, useState } from 'react'
import { Link, useNavigate, useParams, useSearchParams } from 'react-router-dom'
import { MediaPicker } from '../../components/admin/MediaPicker'
import {
  archiveCalendarCard,
  cardImagePreview,
  CMS_ETHIOPIAN_MONTHS,
  COMMEMORATION_TYPES,
  daysInEthiopianMonth,
  deleteCalendarCard,
  errorMessage,
  formatKeywordsForInput,
  getCalendarCard,
  IMAGE_POSITIONS,
  listCalendarCards,
  monthLabel,
  normalizeKeywords,
  saveCalendarCard,
  statuses,
  typeLabel,
  type CalendarCardInput,
  type CalendarCardRow,
  type ContentStatus,
} from '../../lib/cms/calendarAdminService'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'

export function CalendarAdmin() {
  const [params, setParams] = useSearchParams()
  const q = params.get('q') || ''
  const status = params.get('status') || ''
  const month = Number(params.get('month')) || 0
  const type = params.get('type') || ''
  const featured = (params.get('featured') || '') as '' | 'yes' | 'no'
  const page = Math.max(1, Number(params.get('page')) || 1)

  const result = useAsync(
    useCallback(
      () =>
        listCalendarCards({
          search: q,
          status: status || undefined,
          monthNumber: month || undefined,
          type: type || undefined,
          featured,
          page,
          pageSize: 48,
        }),
      [q, status, month, type, featured, page],
    ),
  )

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>CALENDAR / SYNAXARIUM</p>
          <h1>Calendar cards</h1>
          <p className={s.muted}>
            Visual cards for the public Calendar strip. Same records as Synaxarium commemorations —
            edit title, Ethiopian date, image, featured, and publish state.
          </p>
        </div>
        <Link className={s.primary} to="/admin/calendar/new">
          + New Calendar Card
        </Link>
      </div>

      <form
        className={s.filters}
        onSubmit={(event) => {
          event.preventDefault()
          const data = new FormData(event.currentTarget)
          setParams({
            q: String(data.get('q') || ''),
            status: String(data.get('status') || ''),
            month: String(data.get('month') || ''),
            type: String(data.get('type') || ''),
            featured: String(data.get('featured') || ''),
          })
        }}
      >
        <label>
          Search
          <input name="q" defaultValue={q} placeholder="Title, Amharic, keywords" />
        </label>
        <label>
          Status
          <select name="status" defaultValue={status}>
            <option value="">All</option>
            {statuses.map((value) => (
              <option key={value} value={value}>
                {value}
              </option>
            ))}
          </select>
        </label>
        <label>
          Month
          <select name="month" defaultValue={month || ''}>
            <option value="">All months</option>
            {CMS_ETHIOPIAN_MONTHS.map((item) => (
              <option key={item.number} value={item.number}>
                {item.label}
              </option>
            ))}
          </select>
        </label>
        <label>
          Type
          <select name="type" defaultValue={type}>
            <option value="">All types</option>
            {COMMEMORATION_TYPES.map((value) => (
              <option key={value} value={value}>
                {typeLabel(value)}
              </option>
            ))}
          </select>
        </label>
        <label>
          Featured
          <select name="featured" defaultValue={featured}>
            <option value="">All</option>
            <option value="yes">Featured</option>
            <option value="no">Not featured</option>
          </select>
        </label>
        <button type="submit">Apply</button>
      </form>

      <AsyncNotice {...result} retry={result.reload} />

      {result.data ? (
        <>
          <div className={s.mediaGrid}>
            {result.data.items.map((row) => {
              const image = cardImagePreview(row)
              const day = row.day
              return (
                <article key={row.id} className={`${s.card} ${s.mediaCard}`}>
                  <div className={s.mediaThumbWrap}>
                    {image.url ? (
                      <img className={s.mediaThumb} src={image.url} alt={image.alt} />
                    ) : (
                      <div className={s.mediaThumbEmpty}>No image</div>
                    )}
                  </div>
                  <div className={s.mediaMeta}>
                    <strong>{row.title}</strong>
                    {row.title_amharic ? (
                      <span lang="am" className={s.muted}>
                        {row.title_amharic}
                      </span>
                    ) : null}
                    <span className={s.muted}>
                      {day
                        ? `${monthLabel(day.ethiopian_month_number)} ${day.ethiopian_day}`
                        : 'No date'}
                      {row.is_monthly ? ' · monthly' : ''}
                    </span>
                    <span className={s.muted}>{typeLabel(row.commemoration_type)}</span>
                    <span className={s.muted}>
                      {row.featured ? '★ Featured' : 'Not featured'} · sort {row.sort_order}
                    </span>
                    <Status value={row.status} />
                    {row._warning ? (
                      <span className={s.muted} role="status">
                        Warning: {row._warning}
                      </span>
                    ) : null}
                    <div className={s.actions}>
                      <Link to={`/admin/calendar/${row.id}/edit`}>Edit</Link>
                      <Link to={`/calendar`} target="_blank" rel="noreferrer">
                        Preview
                      </Link>
                    </div>
                  </div>
                </article>
              )
            })}
          </div>
          {!result.data.items.length ? <p className={s.muted}>No calendar cards match.</p> : null}
          <div className={s.actions}>
            <button
              type="button"
              disabled={page <= 1}
              onClick={() => {
                const next = new URLSearchParams(params)
                next.set('page', String(page - 1))
                setParams(next)
              }}
            >
              Previous
            </button>
            <span>Page {page}</span>
            <button
              type="button"
              disabled={page * 48 >= result.data.total}
              onClick={() => {
                const next = new URLSearchParams(params)
                next.set('page', String(page + 1))
                setParams(next)
              }}
            >
              Next
            </button>
          </div>
        </>
      ) : null}
    </>
  )
}

export function CalendarCardEditor() {
  const { id } = useParams()
  const isNew = !id || id === 'new'
  const result = useAsync(
    useCallback(async () => {
      if (isNew) return null as CalendarCardRow | null
      return getCalendarCard(id!)
    }, [id, isNew]),
  )

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      {(isNew || result.data) && (
        <CardForm key={id || 'new'} existing={result.data || null} />
      )}
    </>
  )
}

function CardForm({ existing }: { existing: CalendarCardRow | null }) {
  const navigate = useNavigate()
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [input, setInput] = useState<CalendarCardInput>(() => ({
    title: existing?.title || '',
    title_amharic: existing?.title_amharic || '',
    slug: existing?.slug || '',
    commemoration_type: existing?.commemoration_type || 'saint',
    summary: existing?.summary || '',
    body_amharic: existing?.body_amharic || '',
    body_english: existing?.body_english || '',
    scripture_references: existing?.scripture_references || '',
    keywords: normalizeKeywords(existing?.keywords),
    sort_order: existing?.sort_order ?? 0,
    status: existing?.status || 'draft',
    image_path: existing?.image_path || '',
    image_alt: existing?.image_alt || '',
    featured: Boolean(existing?.featured),
    is_monthly: Boolean(existing?.is_monthly),
    image_position: existing?.image_position || 'center',
    ethiopian_month_number: existing?.day?.ethiopian_month_number || 1,
    ethiopian_day: existing?.day?.ethiopian_day || 1,
  }))

  const maxDay = useMemo(
    () => daysInEthiopianMonth(input.ethiopian_month_number),
    [input.ethiopian_month_number],
  )

  function set<K extends keyof CalendarCardInput>(key: K, value: CalendarCardInput[K]) {
    setInput((prev) => ({ ...prev, [key]: value }))
    setSuccess('')
  }

  async function save() {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveCalendarCard(input, existing)
      setSuccess('Saved. Public Calendar updates immediately after refresh.')
      if (!existing) navigate(`/admin/calendar/${saved.id}/edit`, { replace: true })
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function archive() {
    if (!existing) return
    if (!window.confirm(`Archive “${existing.title}”? The Synaxarium day is kept.`)) return
    setBusy(true)
    try {
      await archiveCalendarCard(existing.id)
      navigate('/admin/calendar')
    } catch (cause) {
      setError(errorMessage(cause))
      setBusy(false)
    }
  }

  async function remove() {
    if (!existing) return
    if (
      !window.confirm(
        `Permanently delete “${existing.title}”? Prefer Archive when possible. The day and other commemorations are kept.`,
      )
    ) {
      return
    }
    setBusy(true)
    try {
      await deleteCalendarCard(existing.id)
      navigate('/admin/calendar')
    } catch (cause) {
      setError(errorMessage(cause))
      setBusy(false)
    }
  }

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to="/admin/calendar">← Calendar cards</Link>
          <h1>{existing ? 'Edit calendar card' : 'New calendar card'}</h1>
          <p className={s.muted}>{busy ? 'Saving…' : success || 'Title, date, image, and story'}</p>
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
        <section className={s.card}>
          <h2>Content</h2>
          <div className={s.fields}>
            <label>
              Title *
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
              Type
              <select
                value={input.commemoration_type || ''}
                onChange={(e) => set('commemoration_type', e.target.value)}
              >
                {COMMEMORATION_TYPES.map((type) => (
                  <option key={type} value={type}>
                    {typeLabel(type)}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Summary
              <textarea
                value={input.summary || ''}
                onChange={(e) => set('summary', e.target.value)}
              />
            </label>
            <label>
              Body (English)
              <textarea
                value={input.body_english || ''}
                onChange={(e) => set('body_english', e.target.value)}
              />
            </label>
            <label>
              Body (Amharic)
              <textarea
                lang="am"
                value={input.body_amharic || ''}
                onChange={(e) => set('body_amharic', e.target.value)}
              />
            </label>
            <label>
              Scripture references
              <input
                value={input.scripture_references || ''}
                onChange={(e) => set('scripture_references', e.target.value)}
              />
            </label>
            <label>
              Keywords (comma separated)
              <input
                value={formatKeywordsForInput(input.keywords)}
                onChange={(e) => set('keywords', normalizeKeywords(e.target.value))}
              />
            </label>
            <label>
              Status
              <select
                value={input.status || 'draft'}
                onChange={(e) => set('status', e.target.value as ContentStatus)}
              >
                {statuses.map((value) => (
                  <option key={value} value={value}>
                    {value}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Sort order
              <input
                type="number"
                value={input.sort_order ?? 0}
                onChange={(e) => set('sort_order', Number(e.target.value) || 0)}
              />
            </label>
            <label className={s.check}>
              <input
                type="checkbox"
                checked={Boolean(input.featured)}
                onChange={(e) => set('featured', e.target.checked)}
              />
              Featured on Calendar (shows in the public card strip)
            </label>
            <label className={s.check}>
              <input
                type="checkbox"
                checked={Boolean(input.is_monthly)}
                onChange={(e) => set('is_monthly', e.target.checked)}
              />
              Monthly recurring (same Ethiopian day every month)
            </label>
          </div>
        </section>

        <div className={s.stack}>
          <section className={s.card}>
            <h2>Ethiopian date</h2>
            <div className={s.fields}>
              <label>
                Month
                <select
                  value={input.ethiopian_month_number}
                  onChange={(e) => {
                    const nextMonth = Number(e.target.value) || 1
                    const nextMax = daysInEthiopianMonth(nextMonth)
                    setInput((prev) => ({
                      ...prev,
                      ethiopian_month_number: nextMonth,
                      ethiopian_day: Math.min(prev.ethiopian_day, nextMax),
                    }))
                    setSuccess('')
                  }}
                >
                  {CMS_ETHIOPIAN_MONTHS.map((item) => (
                    <option key={item.number} value={item.number}>
                      {item.label}
                    </option>
                  ))}
                </select>
              </label>
              <label>
                Day
                <select
                  value={input.ethiopian_day}
                  onChange={(e) => set('ethiopian_day', Number(e.target.value) || 1)}
                >
                  {Array.from({ length: maxDay }, (_, i) => i + 1).map((day) => (
                    <option key={day} value={day}>
                      {day}
                    </option>
                  ))}
                </select>
              </label>
              <p className={s.muted}>
                Saving finds or creates the matching <code>synaxarium_days</code> row and assigns{' '}
                <code>day_id</code> / <code>day_slug</code>. No UUIDs to paste.
              </p>
            </div>
          </section>

          <section className={s.card}>
            <h2>Card image</h2>
            <MediaPicker
              folder="synaxarium"
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
              Image focus
              <select
                value={input.image_position || 'center'}
                onChange={(e) => set('image_position', e.target.value)}
              >
                {IMAGE_POSITIONS.map((pos) => (
                  <option key={pos} value={pos}>
                    {pos}
                  </option>
                ))}
              </select>
            </label>
          </section>

          <section className={s.card}>
            <h2>Public preview</h2>
            <div
              style={{
                border: '1px solid var(--color-border)',
                borderRadius: 12,
                overflow: 'hidden',
                maxWidth: 320,
              }}
            >
              {input.image_path ? (
                <img
                  src={cardImagePreview({
                    ...((existing || {}) as CalendarCardRow),
                    image_path: input.image_path,
                    image_alt: input.image_alt || null,
                    title: input.title,
                    day: null,
                  } as CalendarCardRow).url}
                  alt={input.image_alt || ''}
                  style={{
                    width: '100%',
                    aspectRatio: '4/3',
                    objectFit: 'cover',
                    objectPosition:
                      input.image_position === 'top'
                        ? '50% 18%'
                        : input.image_position === 'bottom'
                          ? '50% 82%'
                          : '50% 40%',
                  }}
                />
              ) : (
                <div
                  style={{
                    aspectRatio: '4/3',
                    display: 'grid',
                    placeItems: 'center',
                    background: 'var(--color-bg-muted)',
                    color: 'var(--color-text-muted)',
                  }}
                >
                  No image yet — Upload or Choose from Media
                </div>
              )}
              <div style={{ padding: 12 }}>
                <small className={s.muted}>{typeLabel(input.commemoration_type)}</small>
                <strong style={{ display: 'block' }}>{input.title || 'Title'}</strong>
                <span className={s.muted}>
                  {monthLabel(input.ethiopian_month_number)} {input.ethiopian_day}
                  {input.is_monthly ? ' (monthly)' : ''}
                </span>
              </div>
            </div>
          </section>

          {existing ? (
            <div className={s.actions}>
              <button type="button" disabled={busy} onClick={() => void archive()}>
                Archive card
              </button>
              <button type="button" className={s.danger} disabled={busy} onClick={() => void remove()}>
                Delete card
              </button>
            </div>
          ) : null}
        </div>
      </div>
    </>
  )
}
