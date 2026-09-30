import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams, useSearchParams } from 'react-router-dom'
import { MediaPicker } from '../../components/admin/MediaPicker'
import {
  archiveCalendarCard,
  cardImagePreview,
  CARD_CATEGORIES,
  CARD_TYPES,
  categoryLabel,
  CMS_ETHIOPIAN_MONTHS,
  daysInEthiopianMonth,
  deleteCalendarCard,
  errorMessage,
  getCalendarCard,
  IMAGE_POSITIONS,
  listCalendarCards,
  lookupSynaxariumDay,
  monthLabel,
  saveCalendarCard,
  slugify,
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
          <p className={s.eyebrow}>EDITING: CALENDAR</p>
          <h1>Calendar cards</h1>
          <p className={s.muted}>
            Curated visual cards for the public Calendar strip. Synaxarium content is managed under
            the Synaxarium tab — not listed here.
          </p>
        </div>
        <Link className={s.primary} to="/admin/calendar/cards/new">
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
          <input name="q" defaultValue={q} placeholder="Title, Amharic, category" />
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
            <option value="">All</option>
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
            <option value="">All</option>
            {CARD_TYPES.map((value) => (
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
                      {monthLabel(row.ethiopian_month_number)} {row.ethiopian_day}
                      {row.is_monthly ? ' · monthly' : ''}
                    </span>
                    <span className={s.muted}>
                      {categoryLabel(row.category, row.card_type)}
                      {row.card_type ? ` · ${typeLabel(row.card_type)}` : ''}
                    </span>
                    <span className={s.muted}>
                      {row.featured ? '★ Featured' : 'Not featured'} · sort {row.sort_order}
                    </span>
                    <Status value={row.status} />
                    <div className={s.actions}>
                      <Link to={`/admin/calendar/cards/${row.id}/edit`}>Edit</Link>
                      <Link to="/calendar" target="_blank" rel="noreferrer">
                        Preview
                      </Link>
                    </div>
                  </div>
                </article>
              )
            })}
          </div>
          {!result.data.items.length ? (
            <p className={s.muted}>
              No calendar cards yet. Create a curated card to show on the public Calendar.
            </p>
          ) : null}
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
            <span>
              Page {page} · {result.data.total} card{result.data.total === 1 ? '' : 's'}
            </span>
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

function emptyInput(existing: CalendarCardRow | null): CalendarCardInput {
  return {
    title: existing?.title || '',
    title_amharic: existing?.title_amharic || '',
    slug: existing?.slug || '',
    category: existing?.category || categoryLabel(null, existing?.card_type || 'saint'),
    card_type: existing?.card_type || 'saint',
    description: existing?.description || '',
    summary: existing?.summary || '',
    summary_amharic: existing?.summary_amharic || '',
    what_is_it: existing?.what_is_it || '',
    what_is_it_amharic: existing?.what_is_it_amharic || '',
    why_celebrated: existing?.why_celebrated || '',
    why_celebrated_amharic: existing?.why_celebrated_amharic || '',
    important_information: existing?.important_information || '',
    important_information_amharic: existing?.important_information_amharic || '',
    scripture_references: existing?.scripture_references || '',
    fasting_notes: existing?.fasting_notes || '',
    fasting_notes_amharic: existing?.fasting_notes_amharic || '',
    season_notes: existing?.season_notes || '',
    season_notes_amharic: existing?.season_notes_amharic || '',
    short_label: existing?.short_label || '',
    learn_more_label: existing?.learn_more_label || '',
    sort_order: existing?.sort_order ?? 0,
    status: existing?.status || 'published',
    image_path: existing?.image_path || '',
    image_alt: existing?.image_alt || '',
    image_caption: existing?.image_caption || '',
    image_caption_amharic: existing?.image_caption_amharic || '',
    featured: existing ? Boolean(existing.featured) : true,
    is_monthly: Boolean(existing?.is_monthly),
    image_position: existing?.image_position || 'center',
    ethiopian_month_number: existing?.ethiopian_month_number || 1,
    ethiopian_day: existing?.ethiopian_day || 1,
  }
}

function CardForm({ existing }: { existing: CalendarCardRow | null }) {
  const navigate = useNavigate()
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [dayLink, setDayLink] = useState<{ id: string; slug: string } | null>(
    existing?.synaxarium_day_id
      ? { id: existing.synaxarium_day_id, slug: existing.synaxarium_day_slug || '' }
      : null,
  )
  const [input, setInput] = useState<CalendarCardInput>(() => emptyInput(existing))

  const maxDay = useMemo(
    () => daysInEthiopianMonth(input.ethiopian_month_number),
    [input.ethiopian_month_number],
  )

  useEffect(() => {
    let active = true
    void lookupSynaxariumDay(input.ethiopian_month_number, input.ethiopian_day)
      .then((found) => {
        if (active) setDayLink(found)
      })
      .catch(() => {
        if (active) setDayLink(null)
      })
    return () => {
      active = false
    }
  }, [input.ethiopian_month_number, input.ethiopian_day])

  function set<K extends keyof CalendarCardInput>(key: K, value: CalendarCardInput[K]) {
    setInput((prev) => {
      const next = { ...prev, [key]: value }
      if (key === 'title' && !existing && !(prev.slug || '').trim()) {
        next.slug = slugify(String(value || ''))
      }
      return next
    })
    setSuccess('')
  }

  async function save() {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveCalendarCard(input, existing)
      setSuccess('Saved. Public Calendar updates after refresh.')
      if (!existing) navigate(`/admin/calendar/cards/${saved.id}/edit`, { replace: true })
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function archive() {
    if (!existing) return
    if (!window.confirm(`Archive “${existing.title}”? Synaxarium content is not deleted.`)) return
    setBusy(true)
    try {
      await archiveCalendarCard(existing.id)
      navigate('/admin/calendar/cards')
    } catch (cause) {
      setError(errorMessage(cause))
      setBusy(false)
    }
  }

  async function remove() {
    if (!existing) return
    if (
      !window.confirm(
        `Permanently delete calendar card “${existing.title}”? Synaxarium days and commemorations are kept.`,
      )
    ) {
      return
    }
    setBusy(true)
    try {
      await deleteCalendarCard(existing.id)
      navigate('/admin/calendar/cards')
    } catch (cause) {
      setError(errorMessage(cause))
      setBusy(false)
    }
  }

  const preview = cardImagePreview({
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    title: input.title,
  })
  const previewCategory = categoryLabel(input.category, input.card_type)
  const objectPosition =
    input.image_position === 'top'
      ? '50% 18%'
      : input.image_position === 'bottom'
        ? '50% 82%'
        : input.image_position === 'left'
          ? '22% 40%'
          : input.image_position === 'right'
            ? '78% 40%'
            : '50% 40%'

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to="/admin/calendar/cards">← Calendar cards</Link>
          <h1>{existing ? 'Edit calendar card' : 'New calendar card'}</h1>
          <p className={s.muted}>
            {busy ? 'Saving…' : success || 'Educational card for the public Calendar strip'}
          </p>
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
            <h2>1. Basic information</h2>
            <div className={s.fields}>
              <label>
                Title *
                <input value={input.title} onChange={(e) => set('title', e.target.value)} />
              </label>
              <label>
                Amharic title
                <input
                  lang="am"
                  value={input.title_amharic || ''}
                  onChange={(e) => set('title_amharic', e.target.value)}
                />
              </label>
              <label>
                Slug *
                <input
                  value={input.slug || ''}
                  onChange={(e) => set('slug', e.target.value)}
                  placeholder="saint-gabriel-monthly-19"
                />
              </label>
              <label>
                Category *
                <select
                  value={input.category || 'Commemoration'}
                  onChange={(e) => set('category', e.target.value)}
                >
                  {CARD_CATEGORIES.map((cat) => (
                    <option key={cat} value={cat}>
                      {cat}
                    </option>
                  ))}
                </select>
              </label>
              <label>
                Card type
                <select
                  value={input.card_type || 'other'}
                  onChange={(e) => set('card_type', e.target.value)}
                >
                  {CARD_TYPES.map((type) => (
                    <option key={type} value={type}>
                      {typeLabel(type)}
                    </option>
                  ))}
                </select>
                <small className={s.muted}>Used for visual styling on the strip.</small>
              </label>
              <label>
                Status
                <select
                  value={input.status || 'published'}
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
              <label>
                See more button label
                <input
                  value={input.learn_more_label || ''}
                  onChange={(e) => set('learn_more_label', e.target.value)}
                  placeholder="See more"
                />
              </label>
              <label className={s.check}>
                <input
                  type="checkbox"
                  checked={Boolean(input.featured)}
                  onChange={(e) => set('featured', e.target.checked)}
                />
                Featured on Calendar strip
              </label>
            </div>
          </section>

          <section className={s.card}>
            <h2>2. Date</h2>
            <div className={s.fields}>
              <label>
                Ethiopian month
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
                Ethiopian day
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
              <label className={s.check}>
                <input
                  type="checkbox"
                  checked={Boolean(input.is_monthly)}
                  onChange={(e) => set('is_monthly', e.target.checked)}
                />
                Monthly recurring (same Ethiopian day every month)
              </label>
              <p className={s.muted}>
                {dayLink ? (
                  <>
                    Linked Synaxarium day: <code>{dayLink.slug}</code> — Open date opens that day’s
                    commemorations.
                  </>
                ) : (
                  <>
                    No matching <code>synaxarium_days</code> row yet. The card still saves; Open date
                    uses month/day when available.
                  </>
                )}
              </p>
            </div>
          </section>

          <section className={s.card}>
            <h2>3. Card content</h2>
            <div className={s.fields}>
              <label>
                Short summary
                <textarea
                  value={input.summary || ''}
                  onChange={(e) => set('summary', e.target.value)}
                  rows={2}
                  placeholder="1–2 sentences shown on the card"
                />
              </label>
              <label>
                Amharic summary
                <textarea
                  lang="am"
                  value={input.summary_amharic || ''}
                  onChange={(e) => set('summary_amharic', e.target.value)}
                  rows={2}
                />
              </label>
              <label>
                What is this?
                <textarea
                  value={input.what_is_it || ''}
                  onChange={(e) => set('what_is_it', e.target.value)}
                  rows={3}
                  placeholder="Concise factual explanation of the observance"
                />
              </label>
              <label>
                Amharic “What is this?”
                <textarea
                  lang="am"
                  value={input.what_is_it_amharic || ''}
                  onChange={(e) => set('what_is_it_amharic', e.target.value)}
                  rows={3}
                />
              </label>
              <label>
                Why do we celebrate it?
                <textarea
                  value={input.why_celebrated || ''}
                  onChange={(e) => set('why_celebrated', e.target.value)}
                  rows={4}
                  placeholder="Spiritual significance and why the Church commemorates it"
                />
              </label>
              <label>
                Why do we celebrate it? (Amharic)
                <textarea
                  lang="am"
                  value={input.why_celebrated_amharic || ''}
                  onChange={(e) => set('why_celebrated_amharic', e.target.value)}
                  rows={4}
                />
              </label>
              <label>
                Important information
                <textarea
                  value={input.important_information || ''}
                  onChange={(e) => set('important_information', e.target.value)}
                  rows={4}
                  placeholder="Customs, themes, related practices (optional)"
                />
              </label>
              <label>
                Important information (Amharic)
                <textarea
                  lang="am"
                  value={input.important_information_amharic || ''}
                  onChange={(e) => set('important_information_amharic', e.target.value)}
                  rows={4}
                />
              </label>
              <label>
                Scripture references
                <textarea
                  value={input.scripture_references || ''}
                  onChange={(e) => set('scripture_references', e.target.value)}
                  rows={2}
                  placeholder="Matthew 3:13–17&#10;John 1:29–34"
                />
              </label>
              <label>
                Fasting notes
                <textarea
                  value={input.fasting_notes || ''}
                  onChange={(e) => set('fasting_notes', e.target.value)}
                  rows={2}
                  placeholder="Only explicit fasting guidance — do not invent rules"
                />
              </label>
              <label>
                Fasting notes (Amharic)
                <textarea
                  lang="am"
                  value={input.fasting_notes_amharic || ''}
                  onChange={(e) => set('fasting_notes_amharic', e.target.value)}
                  rows={2}
                />
              </label>
              <label>
                Season notes
                <textarea
                  value={input.season_notes || ''}
                  onChange={(e) => set('season_notes', e.target.value)}
                  rows={2}
                />
              </label>
              <label>
                Season notes (Amharic)
                <textarea
                  lang="am"
                  value={input.season_notes_amharic || ''}
                  onChange={(e) => set('season_notes_amharic', e.target.value)}
                  rows={2}
                />
              </label>
              <label>
                Description (internal / fallback)
                <textarea
                  value={input.description || ''}
                  onChange={(e) => set('description', e.target.value)}
                  rows={2}
                />
                <small className={s.muted}>
                  Used only if summary is empty. Prefer Summary for public cards.
                </small>
              </label>
            </div>
          </section>
        </div>

        <div className={s.stack}>
          <section className={s.card}>
            <h2>4. Image</h2>
            <MediaPicker
              folder="calendar"
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
            <div className={s.fields}>
              <label>
                Image position
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
              <label>
                Image caption
                <input
                  value={input.image_caption || ''}
                  onChange={(e) => set('image_caption', e.target.value)}
                />
              </label>
              <label>
                Amharic image caption
                <input
                  lang="am"
                  value={input.image_caption_amharic || ''}
                  onChange={(e) => set('image_caption_amharic', e.target.value)}
                />
              </label>
            </div>
          </section>

          <section className={s.card}>
            <h2>5. Public preview</h2>
            <div
              style={{
                border: '1px solid var(--color-border)',
                borderRadius: 12,
                overflow: 'hidden',
                maxWidth: 320,
              }}
            >
              {preview.url ? (
                <img
                  src={preview.url}
                  alt={preview.alt}
                  style={{
                    width: '100%',
                    aspectRatio: '4/3',
                    objectFit: 'cover',
                    objectPosition,
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
                  No image yet
                </div>
              )}
              <div style={{ padding: 12 }}>
                <small className={s.muted}>{previewCategory}</small>
                <strong style={{ display: 'block' }}>{input.title || 'Title'}</strong>
                {input.title_amharic ? (
                  <span lang="am" className={s.muted} style={{ display: 'block' }}>
                    {input.title_amharic}
                  </span>
                ) : null}
                <span className={s.muted}>
                  {monthLabel(input.ethiopian_month_number)} {input.ethiopian_day}
                  {input.is_monthly ? ' (monthly)' : ''}
                </span>
                {input.summary ? (
                  <p className={s.muted} style={{ marginTop: 8, fontSize: 12 }}>
                    {input.summary}
                  </p>
                ) : null}
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8, marginTop: 10 }}>
                  <span
                    style={{
                      display: 'inline-flex',
                      alignItems: 'center',
                      minHeight: 32,
                      padding: '0 12px',
                      borderRadius: 999,
                      border: '1px solid var(--color-border-gold, #c9a227)',
                      background:
                        'color-mix(in srgb, var(--color-gold-faint, #f5e6b8) 72%, white)',
                      fontSize: 12,
                      fontWeight: 700,
                    }}
                  >
                    {input.learn_more_label || 'See more'}
                  </span>
                  <span
                    style={{
                      display: 'inline-flex',
                      alignItems: 'center',
                      minHeight: 32,
                      padding: '0 12px',
                      borderRadius: 999,
                      border: '1px solid var(--color-border, #ccc)',
                      fontSize: 12,
                      fontWeight: 700,
                    }}
                  >
                    Open date
                  </span>
                </div>
              </div>
            </div>
          </section>

          {existing ? (
            <div className={s.actions}>
              <button type="button" disabled={busy} onClick={() => void archive()}>
                Archive card
              </button>
              <button
                type="button"
                className={s.danger}
                disabled={busy}
                onClick={() => void remove()}
              >
                Delete card
              </button>
            </div>
          ) : null}
        </div>
      </div>
    </>
  )
}
