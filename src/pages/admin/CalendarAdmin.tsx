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
  saveCalendarCard,
  slugify,
  sourceTypeBadge,
  statuses,
  typeLabel,
  CALENDAR_CARD_SOURCE_TYPES,
  type CalendarCardInput,
  type CalendarCardRow,
  type CalendarCardSourceType,
  type ContentStatus,
} from '../../lib/cms/calendarAdminService'
import {
  searchCalendarSources,
  fetchLinkedSource,
  loadLinkedSourcesForCards,
  lookupLinkedInMap,
  type CalendarSourceSearchHit,
} from '../../lib/calendar/calendarCardSources'
import { formatCardDateRuleDisplay } from '../../lib/calendar/formatCalendarSourceRule'
import {
  isLinkedSourceType,
  normalizeSourceType,
  resolveCalendarCard,
  type LinkedCalendarSource,
} from '../../lib/calendar/resolveCalendarCard'
import {
  applyCalendarCardReconciliation,
  buildCalendarCardReconciliationPlan,
  type ReconciliationApplyResult,
  type ReconciliationPlan,
} from '../../lib/calendar/calendarCardReconciliation'
import { CalendarEventImage } from '../../components/calendar/CalendarEventImage'
import {
  calendarMediaFolderPrefix,
  getSuggestedCalendarImagePath,
  suggestCalendarImageAlt,
} from '../../lib/calendar/calendarImagePaths'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'

function SyncCalendarCardsPanel({ onDone }: { onDone: () => void }) {
  const [busy, setBusy] = useState(false)
  const [plan, setPlan] = useState<ReconciliationPlan | null>(null)
  const [result, setResult] = useState<ReconciliationApplyResult | null>(null)
  const [error, setError] = useState<string | null>(null)

  async function runDry() {
    setBusy(true)
    setError(null)
    setResult(null)
    try {
      const next = await buildCalendarCardReconciliationPlan()
      setPlan(next)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  async function runApply() {
    if (!plan) return
    setBusy(true)
    setError(null)
    try {
      const next = await applyCalendarCardReconciliation(plan)
      setResult(next)
      onDone()
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }

  return (
    <section className={s.card} style={{ marginBottom: '1rem' }}>
      <div className={s.heading} style={{ marginBottom: '0.75rem' }}>
        <div>
          <p className={s.eyebrow}>RECONCILIATION</p>
          <h2 style={{ margin: 0, fontSize: '1.15rem' }}>Sync Calendar Cards</h2>
          <p className={s.muted} style={{ marginTop: '0.35rem' }}>
            Idempotent sync: repair links, create missing placeholders, merge duplicates. Images and
            homepage settings are never cleared.
          </p>
        </div>
        <div className={s.actions}>
          <button type="button" disabled={busy} onClick={() => void runDry()}>
            {busy && !result ? 'Analyzing…' : 'Dry run'}
          </button>
          <button
            type="button"
            className={s.primary}
            disabled={busy || !plan}
            onClick={() => void runApply()}
          >
            Apply safe fixes
          </button>
        </div>
      </div>

      {error ? <p className={s.error}>{error}</p> : null}

      {plan ? (
        <div className={s.muted} style={{ display: 'grid', gap: '0.25rem', fontSize: '0.92rem' }}>
          <strong>Dry-run analysis</strong>
          <span>Sources checked: {plan.summary.sourcesChecked}</span>
          <span>Cards linked: {plan.summary.cardsLinked}</span>
          <span>Links to repair: {plan.summary.linksToRepair}</span>
          <span>Missing cards to create: {plan.summary.missingCardsToCreate}</span>
          <span>Duplicates found: {plan.summary.duplicatesFound}</span>
          <span>Orphans found: {plan.summary.orphansFound}</span>
          <span>Cards with images preserved: {plan.summary.cardsWithImages}</span>
          <span>Placeholder fields to clear: {plan.summary.placeholderFieldsToClear}</span>
          <span>Needs manual review: {plan.summary.needsManualReview}</span>
          <div style={{ marginTop: '0.5rem' }}>
            {plan.coverage.map((row) => (
              <div key={row.sourceType}>
                {sourceTypeBadge(row.sourceType)}: {row.linkedCards}/{row.sources} linked
                {row.missing ? ` · ${row.missing} missing` : ''}
              </div>
            ))}
          </div>
        </div>
      ) : null}

      {result ? (
        <div style={{ marginTop: '0.85rem' }}>
          <strong>Calendar Card Sync Complete</strong>
          <div className={s.muted} style={{ display: 'grid', gap: '0.2rem', marginTop: '0.35rem' }}>
            <span>Links repaired: {result.linksRepaired}</span>
            <span>Missing cards created: {result.missingCardsCreated}</span>
            <span>Duplicates merged: {result.duplicatesMerged}</span>
            <span>Placeholder fields cleared: {result.placeholdersCleared}</span>
            <span>Images preserved: {result.imagesPreserved}</span>
            {result.errors.length ? (
              <span className={s.error}>Errors: {result.errors.slice(0, 5).join(' · ')}</span>
            ) : (
              <span>No apply errors.</span>
            )}
          </div>
        </div>
      ) : null}
    </section>
  )
}

export function CalendarAdmin() {
  const [params, setParams] = useSearchParams()
  const q = params.get('q') || ''
  const status = params.get('status') || ''
  const month = Number(params.get('month')) || 0
  const type = params.get('type') || ''
  const featured = (params.get('featured') || '') as '' | 'yes' | 'no'
  const homepage = (params.get('homepage') || '') as '' | 'home' | 'home_featured'
  const image = (params.get('image') || '') as '' | 'has' | 'needs'
  const source = params.get('source') || ''
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
          homepage: homepage || undefined,
          page,
          pageSize: 48,
        }).then(async (pageResult) => {
          const linkedMap = await loadLinkedSourcesForCards(pageResult.items)
          return { ...pageResult, linkedMap }
        }),
      [q, status, month, type, featured, homepage, page],
    ),
  )

  const filteredItems = useMemo(() => {
    const items = result.data?.items || []
    return items.filter((row) => {
      if (image === 'has' && !row.image_path) return false
      if (image === 'needs' && row.image_path) return false
      if (source) {
        const normalized = normalizeSourceType(row.source_type)
        if (source === 'orphaned') {
          return isLinkedSourceType(normalized) && !row.source_id && !row.source_slug
        }
        if (source === 'needs_review') {
          // Heuristic until sync audit is applied: linked without id/slug, or non-empty title
          // that may be a legacy placeholder override.
          if (!isLinkedSourceType(normalized)) return false
          if (!row.source_id && !row.source_slug) return true
          return Boolean(row.title?.trim())
        }
        if (normalizeSourceType(source) !== normalized) return false
      }
      return true
    })
  }, [result.data?.items, image, source])

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>EDITING: CALENDAR</p>
          <h1>Calendar cards</h1>
          <p className={s.muted}>
            Presentation layer for Calendar and homepage. Structured sources remain authoritative for
            titles, dates, and educational text. Cards own images and display settings.
          </p>
        </div>
        <Link className={s.primary} to="/admin/calendar/cards/new">
          + New Calendar Card
        </Link>
      </div>

      <SyncCalendarCardsPanel onDone={() => result.reload()} />

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
            homepage: String(data.get('homepage') || ''),
            image: String(data.get('image') || ''),
            source: String(data.get('source') || ''),
          })
        }}
      >
        <label>
          Search
          <input name="q" defaultValue={q} placeholder="Title, Amharic, slug" />
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
          Source
          <select name="source" defaultValue={source}>
            <option value="">All</option>
            <option value="observance">Observances</option>
            <option value="monthly_commemoration">Monthly</option>
            <option value="fast">Fasts</option>
            <option value="season">Seasons</option>
            <option value="manual">Manual</option>
            <option value="orphaned">Orphaned link</option>
            <option value="needs_review">Needs Review</option>
          </select>
        </label>
        <label>
          Image
          <select name="image" defaultValue={image}>
            <option value="">All</option>
            <option value="has">Has Image</option>
            <option value="needs">Needs Image</option>
          </select>
        </label>
        <label>
          Homepage
          <select name="homepage" defaultValue={homepage}>
            <option value="">All</option>
            <option value="home">Homepage</option>
            <option value="home_featured">Home featured</option>
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
            {filteredItems.map((row) => {
              const imagePreview = cardImagePreview(row)
              const linked = isLinkedSourceType(normalizeSourceType(row.source_type))
              const linkedSource = result.data?.linkedMap
                ? lookupLinkedInMap(
                    result.data.linkedMap,
                    row.source_type,
                    row.source_id,
                    row.source_slug,
                  )
                : null
              const displayTitle =
                row.title?.trim() ||
                linkedSource?.title ||
                (linked ? '(title inherited from source)' : 'Untitled')
              const dateRule = formatCardDateRuleDisplay({
                sourceType: row.source_type,
                linked: linkedSource,
                cardMonth: row.ethiopian_month_number,
                cardDay: row.ethiopian_day,
                isMonthly: row.is_monthly,
              })
              return (
                <article key={row.id} className={`${s.card} ${s.mediaCard}`}>
                  <div className={s.mediaThumbWrap}>
                    {imagePreview.url ? (
                      <img className={s.mediaThumb} src={imagePreview.url} alt={imagePreview.alt} />
                    ) : (
                      <div className={s.mediaThumbEmpty}>Needs Image</div>
                    )}
                  </div>
                  <div className={s.mediaMeta}>
                    <strong>{displayTitle}</strong>
                    {(row.title_amharic || linkedSource?.titleAmharic) ? (
                      <span lang="am" className={s.muted}>
                        {row.title_amharic || linkedSource?.titleAmharic}
                      </span>
                    ) : null}
                    <span className={s.actions} style={{ gap: '0.35rem', flexWrap: 'wrap' }}>
                      <span className={s.badge} title="Content source">
                        {sourceTypeBadge(row.source_type)}
                      </span>
                      {row.source_slug || linkedSource?.sourceSlug ? (
                        <span className={s.badge} title="Source slug">
                          {row.source_slug || linkedSource?.sourceSlug}
                        </span>
                      ) : null}
                      {imagePreview.url ? (
                        <span className={s.badge}>HAS IMAGE</span>
                      ) : (
                        <span className={s.badge}>NEEDS IMAGE</span>
                      )}
                      {row.show_on_home ? (
                        <span className={s.badge} title="Shown on homepage">
                          HOME
                        </span>
                      ) : null}
                    </span>
                    <span className={s.muted}>
                      {linked
                        ? linkedSource
                          ? `Linked · ${row.source_id ? 'id+slug' : row.source_slug || 'slug'}`
                          : 'Needs review · source not found'
                        : 'Manual card'}
                    </span>
                    <span className={s.muted}>Date rule: {dateRule}</span>
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
          {!filteredItems.length ? (
            <p className={s.muted}>
              No calendar cards match these filters. Run Sync to create missing linked placeholders.
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
    show_on_home: Boolean(existing?.show_on_home),
    home_featured: Boolean(existing?.home_featured),
    home_sort_order: existing?.home_sort_order ?? null,
    home_start_date: existing?.home_start_date || '',
    home_end_date: existing?.home_end_date || '',
    is_monthly: Boolean(existing?.is_monthly),
    image_position: existing?.image_position || 'center',
    // Do not invent Meskerem 1 — null/undefined stays unset until source or manual pick.
    ethiopian_month_number: existing?.ethiopian_month_number ?? null,
    ethiopian_day: existing?.ethiopian_day ?? null,
    source_type: existing?.source_type || 'manual',
    source_id: existing?.source_id || '',
    source_slug: existing?.source_slug || '',
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
  const linkedMode = isLinkedSourceType(normalizeSourceType(input.source_type))
  const [sourceQuery, setSourceQuery] = useState('')
  const [sourceHits, setSourceHits] = useState<CalendarSourceSearchHit[]>([])
  const [sourceSearching, setSourceSearching] = useState(false)
  const [linkedPreview, setLinkedPreview] = useState<LinkedCalendarSource | null>(null)

  const maxDay = useMemo(() => {
    const month = input.ethiopian_month_number
    if (month == null || month < 1) return 30
    return daysInEthiopianMonth(month)
  }, [input.ethiopian_month_number])

  useEffect(() => {
    let active = true
    const month = input.ethiopian_month_number
    const day = input.ethiopian_day
    if (month == null || day == null || month < 1 || day < 1) {
      setDayLink(null)
      return
    }
    void lookupSynaxariumDay(month, day)
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

  useEffect(() => {
    let active = true
    if (!linkedMode || (!input.source_id && !input.source_slug)) {
      setLinkedPreview(null)
      return
    }
    void fetchLinkedSource(input.source_type, input.source_id, input.source_slug).then((linked) => {
      if (active) setLinkedPreview(linked)
    })
    return () => {
      active = false
    }
  }, [linkedMode, input.source_type, input.source_id, input.source_slug])

  useEffect(() => {
    if (!linkedMode) return
    const type = normalizeSourceType(input.source_type) as CalendarCardSourceType
    if (type === 'manual') return
    let active = true
    setSourceSearching(true)
    const timeout = window.setTimeout(() => {
      void searchCalendarSources(type, sourceQuery, 12).then((hits) => {
        if (!active) return
        setSourceHits(hits)
        setSourceSearching(false)
      })
    }, 220)
    return () => {
      active = false
      window.clearTimeout(timeout)
    }
  }, [linkedMode, input.source_type, sourceQuery])

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

  function setMode(mode: 'manual' | 'linked') {
    if (mode === 'manual') {
      set('source_type', 'manual')
      // Keep source_id/slug for non-destructive switch — clear only type for resolve
      return
    }
    const nextType =
      normalizeSourceType(input.source_type) === 'manual'
        ? 'observance'
        : normalizeSourceType(input.source_type)
    set('source_type', nextType)
  }

  function selectSource(hit: CalendarSourceSearchHit) {
    setInput((prev) => {
      const nextCategory = hit.category || prev.category
      const nextType = hit.cardType || prev.card_type
      const suggested = getSuggestedCalendarImagePath({
        sourceSlug: hit.slug,
        cardSlug: prev.slug || hit.slug,
        category: nextCategory,
        cardType: nextType,
        title: hit.title,
      })
      return {
        ...prev,
        source_type: hit.sourceType,
        source_id: hit.id,
        source_slug: hit.slug,
        // Do not copy source title/summary into the card — inherit at resolve time.
        // Clear identical legacy placeholders only via Sync; leave intentional overrides alone.
        is_monthly: hit.sourceType === 'monthly_commemoration' ? true : prev.is_monthly,
        // Suggest reusable image path only when the card has no image yet.
        image_path: prev.image_path?.trim() ? prev.image_path : suggested || prev.image_path,
        image_alt:
          prev.image_alt?.trim() ||
          suggestCalendarImageAlt(hit.title, nextCategory) ||
          prev.image_alt,
      }
    })
    setSourceQuery('')
    setSuccess('')
  }

  async function save() {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveCalendarCard(input, existing)
      // Rehydrate from DB so preview shows persisted image_path, not picker-only state.
      setInput(emptyInput(saved))
      setSuccess(
        saved.image_path
          ? `Saved. Image confirmed: ${saved.image_path}. Public pages refresh on next visit (cache cleared).`
          : 'Saved. Public Calendar/Homepage pick up card changes on next visit (cache cleared).',
      )
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

  const resolvedPreview = useMemo(
    () =>
      resolveCalendarCard(
        {
          id: existing?.id || 'preview',
          slug: input.slug || 'preview',
          title: input.title || '',
          title_amharic: input.title_amharic,
          category: input.category,
          card_type: input.card_type,
          description: input.description,
          summary: input.summary,
          summary_amharic: input.summary_amharic,
          what_is_it: input.what_is_it,
          what_is_it_amharic: input.what_is_it_amharic,
          why_celebrated: input.why_celebrated,
          why_celebrated_amharic: input.why_celebrated_amharic,
          important_information: input.important_information,
          important_information_amharic: input.important_information_amharic,
          scripture_references: input.scripture_references,
          fasting_notes: input.fasting_notes,
          fasting_notes_amharic: input.fasting_notes_amharic,
          season_notes: input.season_notes,
          season_notes_amharic: input.season_notes_amharic,
          short_label: input.short_label,
          learn_more_label: input.learn_more_label,
          image_path: input.image_path,
          image_alt: input.image_alt,
          image_position: input.image_position,
          image_caption: input.image_caption,
          image_caption_amharic: input.image_caption_amharic,
          ethiopian_month_number: input.ethiopian_month_number,
          ethiopian_day: input.ethiopian_day,
          is_monthly: input.is_monthly,
          featured: input.featured,
          show_on_home: input.show_on_home,
          home_featured: input.home_featured,
          home_sort_order: input.home_sort_order,
          sort_order: input.sort_order,
          source_type: input.source_type,
          source_id: input.source_id,
          source_slug: input.source_slug,
        },
        new Date(),
        linkedPreview,
      ),
    [input, linkedPreview, existing?.id],
  )

  const preview = cardImagePreview({
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    title: resolvedPreview.title,
  })
  const previewCategory = resolvedPreview.categoryLabel
  const objectPosition = resolvedPreview.objectPosition

  return (
    <>
      <div className={s.heading}>
        <div>
          <Link to="/admin/calendar/cards">← Calendar cards</Link>
          <h1>{existing ? 'Edit calendar card' : 'New calendar card'}</h1>
          <p className={s.muted}>
            {busy
              ? 'Saving…'
              : success ||
                'Visual card for the public Calendar strip — link structured data or write a manual card.'}
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
            <h2>Content source</h2>
            <p className={s.muted}>
              Link authoritative calendar data, or keep a fully manual card. Switching modes does not
              delete your text — blank overrides inherit from the linked source.
            </p>
            <div className={s.fields}>
              <label>
                Mode
                <select
                  value={linkedMode ? 'linked' : 'manual'}
                  onChange={(e) => setMode(e.target.value === 'linked' ? 'linked' : 'manual')}
                >
                  <option value="linked">Link existing calendar content</option>
                  <option value="manual">Manual card</option>
                </select>
              </label>
              {linkedMode ? (
                <>
                  <label>
                    Source type
                    <select
                      value={normalizeSourceType(input.source_type)}
                      onChange={(e) => {
                        set('source_type', e.target.value)
                        set('source_id', '')
                        set('source_slug', '')
                        setLinkedPreview(null)
                      }}
                    >
                      {CALENDAR_CARD_SOURCE_TYPES.filter((t) => t !== 'manual').map((value) => (
                        <option key={value} value={value}>
                          {sourceTypeBadge(value)}
                        </option>
                      ))}
                    </select>
                  </label>
                  <label>
                    Search source
                    <input
                      value={sourceQuery}
                      onChange={(e) => setSourceQuery(e.target.value)}
                      placeholder="Title, Amharic, slug…"
                    />
                  </label>
                  {sourceSearching ? <p className={s.muted}>Searching…</p> : null}
                  {sourceHits.length ? (
                    <ul className={s.stack} style={{ listStyle: 'none', padding: 0, margin: 0 }}>
                      {sourceHits.map((hit) => (
                        <li key={`${hit.sourceType}:${hit.id}`}>
                          <button
                            type="button"
                            className={s.card}
                            style={{ width: '100%', textAlign: 'left', cursor: 'pointer' }}
                            onClick={() => selectSource(hit)}
                          >
                            <strong>{hit.title}</strong>
                            {hit.titleAmharic ? (
                              <div lang="am" className={s.muted}>
                                {hit.titleAmharic}
                              </div>
                            ) : null}
                            <div className={s.muted}>{hit.meta}</div>
                          </button>
                        </li>
                      ))}
                    </ul>
                  ) : null}
                  {linkedPreview ? (
                    <div className={s.notice}>
                      <p>
                        <strong>Linked Source (read-only)</strong>
                      </p>
                      <p>
                        {sourceTypeBadge(linkedPreview.sourceType)} · {linkedPreview.title}
                      </p>
                      {linkedPreview.titleAmharic ? (
                        <p lang="am">{linkedPreview.titleAmharic}</p>
                      ) : null}
                      <p className={s.muted}>
                        slug: <code>{linkedPreview.sourceSlug}</code>
                        {linkedPreview.rangeLabel ? ` · ${linkedPreview.rangeLabel}` : ''}
                      </p>
                      {linkedPreview.summary || linkedPreview.description ? (
                        <p>{(linkedPreview.summary || linkedPreview.description).slice(0, 280)}</p>
                      ) : null}
                      <p className={s.muted}>
                        Factual text refreshes from this source automatically. Image and homepage
                        settings stay on this card.
                      </p>
                    </div>
                  ) : (
                    <p className={s.muted}>Select a source record above.</p>
                  )}
                </>
              ) : (
                <p className={s.muted}>
                  Manual mode uses this card&apos;s own fields for title, date, and educational copy.
                </p>
              )}
            </div>
          </section>

          <section className={s.card}>
            <h2>{linkedMode ? 'Optional overrides (advanced)' : '1. Basic information'}</h2>
            {linkedMode ? (
              <p className={s.muted}>
                Leave blank to inherit live source text. Only fill these when you intentionally want
                different wording than the structured source. Identical copies are cleared by Sync.
              </p>
            ) : null}
            <div className={s.fields}>
              <label>
                {linkedMode ? 'Custom title' : 'Title *'}
                <input value={input.title || ''} onChange={(e) => set('title', e.target.value)} />
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
            <h2>Homepage display</h2>
            <p className={s.muted}>
              Same card record powers Calendar and the homepage “Today in Church” carousel. No
              duplicate content fields.
            </p>
            <div className={s.fields}>
              <label className={s.check}>
                <input
                  type="checkbox"
                  checked={Boolean(input.show_on_home)}
                  onChange={(e) => set('show_on_home', e.target.checked)}
                />
                Show on homepage
              </label>
              <label className={s.check}>
                <input
                  type="checkbox"
                  checked={Boolean(input.home_featured)}
                  onChange={(e) => set('home_featured', e.target.checked)}
                  disabled={!input.show_on_home}
                />
                Homepage featured
              </label>
              <label>
                Homepage sort order
                <input
                  type="number"
                  value={input.home_sort_order ?? ''}
                  onChange={(e) =>
                    set(
                      'home_sort_order',
                      e.target.value === '' ? null : Number(e.target.value) || 0,
                    )
                  }
                  placeholder="Uses calendar sort order when empty"
                  disabled={!input.show_on_home}
                />
              </label>
              <label>
                Show from (optional)
                <input
                  type="date"
                  value={input.home_start_date || ''}
                  onChange={(e) => set('home_start_date', e.target.value || null)}
                  disabled={!input.show_on_home}
                />
              </label>
              <label>
                Show until (optional)
                <input
                  type="date"
                  value={input.home_end_date || ''}
                  onChange={(e) => set('home_end_date', e.target.value || null)}
                  disabled={!input.show_on_home}
                />
              </label>
            </div>
          </section>

          <section className={s.card}>
            <h2>2. Date</h2>
            {linkedMode ? (
              <div className={s.fields}>
                <p>
                  <strong>Date rule:</strong>{' '}
                  {formatCardDateRuleDisplay({
                    sourceType: input.source_type,
                    linked: linkedPreview,
                    cardMonth: input.ethiopian_month_number,
                    cardDay: input.ethiopian_day,
                    isMonthly: input.is_monthly,
                  })}
                </p>
                <p className={s.muted}>
                  Inherited from the linked structured source. Occurrence dates on the public Calendar
                  come from the calendar engine — this is the source rule only.
                </p>
                {linkedPreview ? (
                  <p className={s.muted}>
                    Source: {linkedPreview.title}
                    {linkedPreview.sourceSlug ? ` · ${linkedPreview.sourceSlug}` : ''}
                    {linkedPreview.ethiopianDay != null
                      ? ` · day ${linkedPreview.ethiopianDay}`
                      : ''}
                    {linkedPreview.ethiopianMonthNumber != null
                      ? ` · month ${linkedPreview.ethiopianMonthNumber}`
                      : ''}
                  </p>
                ) : (
                  <p className={s.muted}>Select a source above to load the live date rule.</p>
                )}
              </div>
            ) : (
              <div className={s.fields}>
                <label>
                  Ethiopian month
                  <select
                    value={input.ethiopian_month_number ?? ''}
                    onChange={(e) => {
                      const nextMonth = Number(e.target.value) || null
                      const nextMax = nextMonth != null ? daysInEthiopianMonth(nextMonth) : 30
                      setInput((prev) => ({
                        ...prev,
                        ethiopian_month_number: nextMonth,
                        ethiopian_day:
                          prev.ethiopian_day != null
                            ? Math.min(prev.ethiopian_day, nextMax)
                            : null,
                      }))
                      setSuccess('')
                    }}
                  >
                    <option value="">Select month</option>
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
                    value={input.ethiopian_day ?? ''}
                    onChange={(e) =>
                      set('ethiopian_day', e.target.value === '' ? null : Number(e.target.value))
                    }
                  >
                    <option value="">Select day</option>
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
            )}
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
            <p className={s.muted}>
              Store relative paths in content-media (e.g. calendar/angels/gabriel.webp). Reuse the
              same subject image across monthly commemorations whenever possible.
            </p>
            <MediaPicker
              label="Calendar card image"
              folder={calendarMediaFolderPrefix(
                linkedPreview?.category || input.category,
                linkedPreview?.cardType || input.card_type,
              )}
              suggestedPath={getSuggestedCalendarImagePath({
                sourceSlug: input.source_slug,
                cardSlug: input.slug,
                category: linkedPreview?.category || input.category,
                cardType: linkedPreview?.cardType || input.card_type,
                title: linkedPreview?.title || input.title,
              })}
              convertToWebp
              value={input.image_path}
              altText={input.image_alt}
              onChange={({ storagePath, altText }) => {
                setInput((prev) => ({
                  ...prev,
                  image_path: storagePath,
                  image_alt:
                    altText ||
                    prev.image_alt ||
                    suggestCalendarImageAlt(
                      linkedPreview?.title || prev.title,
                      linkedPreview?.category || prev.category,
                    ),
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
                <small className={s.muted}>
                  Prefer top / top-center to protect faces, halos, and crosses from crop.
                </small>
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
            <p className={s.muted}>Live form data — no save required.</p>
            <div className={s.fields}>
              <div>
                <strong className={s.muted}>Calendar strip</strong>
                <div
                  style={{
                    border: '1px solid var(--color-border)',
                    borderRadius: 12,
                    overflow: 'hidden',
                    maxWidth: 320,
                    marginTop: 8,
                    opacity: input.featured && input.status === 'published' ? 1 : 0.55,
                  }}
                >
                  {preview.url ? (
                    <CalendarEventImage
                      src={preview.url}
                      alt={preview.alt}
                      position={input.image_position || objectPosition}
                    />
                  ) : (
                    <CalendarEventImage src={null} alt="" decorativeFallback />
                  )}
                  <div style={{ padding: 12 }}>
                    <small className={s.muted}>
                      {sourceTypeBadge(input.source_type)} · {previewCategory}
                    </small>
                    <strong style={{ display: 'block' }}>{resolvedPreview.title || 'Title'}</strong>
                    {resolvedPreview.titleAmharic ? (
                      <span lang="am" className={s.muted} style={{ display: 'block' }}>
                        {resolvedPreview.titleAmharic}
                      </span>
                    ) : null}
                    <span className={s.muted}>
                      {resolvedPreview.ethiopianLabel} · {resolvedPreview.gregorianLabel}
                      {resolvedPreview.isMonthly ? ' (monthly)' : ''}
                    </span>
                    {resolvedPreview.summary ? (
                      <p className={s.muted} style={{ marginTop: 8, fontSize: 12 }}>
                        {resolvedPreview.summary}
                      </p>
                    ) : null}
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8, marginTop: 10 }}>
                      <span className={s.badge}>{resolvedPreview.learnMoreLabel || 'See more'}</span>
                      <span className={s.badge}>Open date</span>
                    </div>
                    <small className={s.muted} style={{ display: 'block', marginTop: 8 }}>
                      Position: {input.image_position || 'center'} · Alt: {preview.alt || '—'}
                    </small>
                  </div>
                </div>
                {!input.featured || input.status !== 'published' ? (
                  <small className={s.muted}>Needs Featured + Published for Calendar strip.</small>
                ) : null}
              </div>

              <div>
                <strong className={s.muted}>Homepage · Today in Church</strong>
                <div
                  style={{
                    border: '1px solid var(--color-border)',
                    borderRadius: 12,
                    overflow: 'hidden',
                    maxWidth: 360,
                    marginTop: 8,
                    opacity: input.show_on_home && input.status === 'published' ? 1 : 0.55,
                  }}
                >
                  {preview.url ? (
                    <CalendarEventImage
                      src={preview.url}
                      alt={preview.alt}
                      position={input.image_position || objectPosition}
                    />
                  ) : (
                    <CalendarEventImage src={null} alt="" decorativeFallback />
                  )}
                  <div style={{ padding: 12 }}>
                    <small className={s.muted}>
                      {sourceTypeBadge(input.source_type)} · {previewCategory}
                    </small>
                    <strong style={{ display: 'block' }}>{resolvedPreview.title || 'Title'}</strong>
                    {resolvedPreview.titleAmharic ? (
                      <span lang="am" className={s.muted} style={{ display: 'block' }}>
                        {resolvedPreview.titleAmharic}
                      </span>
                    ) : null}
                    <span className={s.muted}>
                      {resolvedPreview.ethiopianLabel} · {resolvedPreview.gregorianLabel}
                    </span>
                    {resolvedPreview.summary ? (
                      <p className={s.muted} style={{ marginTop: 8, fontSize: 12 }}>
                        {resolvedPreview.summary}
                      </p>
                    ) : null}
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8, marginTop: 10 }}>
                      <span className={s.badge}>{resolvedPreview.learnMoreLabel || 'See more'}</span>
                      <span className={s.badge}>Open date</span>
                      {input.home_featured ? <span className={s.badge}>HOME FEATURED</span> : null}
                    </div>
                    <small className={s.muted} style={{ display: 'block', marginTop: 8 }}>
                      Position: {input.image_position || 'center'} · Alt: {preview.alt || '—'}
                    </small>
                  </div>
                </div>
                {!input.show_on_home || input.status !== 'published' ? (
                  <small className={s.muted}>Needs Show on homepage + Published for Home.</small>
                ) : null}
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
