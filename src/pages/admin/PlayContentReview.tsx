import { useCallback, useEffect, useId, useMemo, useRef, useState, type KeyboardEvent, type ReactNode } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { useUrlChoice, useUrlSearchInput } from '../../hooks/useUrlState'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale } from '../../lib/i18n/locale'
import { questionLibraryApi } from '../../lib/play/questionLibraryService'
import { duplicateQuestionDraft, makeQuestionDraft, previewQuestionImport, QUESTION_DIFFICULTIES, QUESTION_GAME_TYPES,
  validateQuestionDraft, type QuestionDraft, type QuestionGameType, type QuestionRow, type QuestionStatus, type EditorialRole, questionTransitionAllowed } from '../../lib/play/questionLibrary'
import { Status } from './AdminUi'
import { FaithChallengePreview } from './FaithChallengePreview'
import { GameModeNavigation } from '../../components/play/GameModeNavigation'
import s from './Admin.module.css'
import q from './PlayContentReview.module.css'

const text = (value: unknown) => typeof value === 'string' ? value : ''
const obj = (value: unknown): Record<string, unknown> => value && typeof value === 'object' && !Array.isArray(value) ? value as Record<string, unknown> : {}
const canonical = (value: unknown): unknown => Array.isArray(value) ? value.map(canonical)
  : value && typeof value === 'object' ? Object.fromEntries(Object.entries(value).sort(([a], [b]) => a.localeCompare(b)).map(([key, item]) => [key, canonical(item)])) : value
const questionLabel = (row: QuestionRow, locale: string) => {
  const payload = obj(row.payload)
  return text(obj(payload.prompt)[locale]) || text(obj(payload.prompt).en) ||
    text(obj(payload.answer)[locale]) || text(obj(payload.answer).en) ||
    text(obj(payload.left)[locale]) || text(obj(payload.left).en) || row.stable_id
}
const STATUSES = ['draft', 'review', 'approved', 'published', 'rejected', 'archived'] as const
const LOCAL_CARD_GAMES: readonly string[] = ['who-am-i', 'match']
const UNCONNECTED_PUBLIC_GAMES: readonly string[] = [...LOCAL_CARD_GAMES, 'finish-the-mezmur']
const WHO_AM_I_CATEGORIES = ['biblical-people', 'biblical-locations', 'saints', 'holy-objects']

const GAME_INFO: Record<QuestionGameType, { icon: string; en: string; am: string; descEn: string; descAm: string }> = {
  trivia: { icon: '❓', en: 'Trivia', am: 'ጥያቄና መልስ', descEn: 'Four-choice faith questions.', descAm: 'ባለአራት አማራጭ የእምነት ጥያቄዎች።' },
  emoji: { icon: '😇', en: 'Emoji Quiz', am: 'የኢሞጂ ጥያቄ', descEn: 'Guess the story or person from emoji clues.', descAm: 'ከኢሞጂ ፍንጮች ታሪኩን ወይም ሰውን ይገምቱ።' },
  'finish-the-verse': { icon: '📖', en: 'Finish the Verse', am: 'ጥቅሱን ጨርስ', descEn: 'Complete a Scripture verse.', descAm: 'የመጽሐፍ ቅዱስ ጥቅስ ያሟሉ።' },
  'finish-the-mezmur': { icon: '🎶', en: 'Finish the Mezmur', am: 'መዝሙሩን ጨርስ', descEn: 'Lyrics, missing words, and occasions.', descAm: 'ግጥም፣ የጎደለ ቃል እና ወቅቶች።' },
  history: { icon: '⛪', en: 'Church History', am: 'የቤተ ክርስቲያን ታሪክ', descEn: 'Events, councils, and saints through time.', descAm: 'ክስተቶች፣ ጉባኤዎች እና ቅዱሳን።' },
  'who-am-i': { icon: '🕊️', en: 'Who Am I?', am: 'እኔ ማን ነኝ?', descEn: 'Name the person, place, or holy object.', descAm: 'ሰውን፣ ቦታን ወይም ቅዱስ ነገርን ይጥሩ።' },
  match: { icon: '🔗', en: 'Match', am: 'አዛምድ', descEn: 'Pair each prompt with its answer.', descAm: 'እያንዳንዱን ጥያቄ ከመልሱ ጋር ያጣምሩ።' },
}
const gameName = (game: string, am: boolean) => {
  const info = GAME_INFO[game as QuestionGameType]
  return info ? (am ? info.am : info.en) : game
}

type Translate = (en: string, am: string) => string

/** Labelled control with a visible hint and error wired through aria-describedby. */
function Field({ label, required, optional, hint, error, t, children }: {
  label: string; required?: boolean; optional?: boolean; hint?: string; error?: string; t: Translate
  children: (props: { id: string; 'aria-describedby'?: string; 'aria-invalid'?: boolean; 'aria-required'?: boolean }) => ReactNode
}) {
  const id = useId()
  const hintId = `${id}-hint`
  const errorId = `${id}-error`
  const describedBy = [hint ? hintId : '', error ? errorId : ''].filter(Boolean).join(' ') || undefined
  return <div className={q.field}>
    <label htmlFor={id}>{label}{required && <span className={q.req} aria-hidden="true" />}
      {optional && <span className={q.opt}>{t('(optional)', '(አማራጭ)')}</span>}</label>
    {children({ id, 'aria-describedby': describedBy, 'aria-invalid': error ? true : undefined, 'aria-required': required || undefined })}
    {hint && <small id={hintId}>{hint}</small>}
    {error && <span id={errorId} className={q.fieldError}>{error}</span>}
  </div>
}

export function PlayContentReview() {
  const { uiLocale } = useLocale()
  const am = uiLocale === 'am'
  const t: Translate = (en, amharic) => am ? amharic : en
  const [rows, setRows] = useState<QuestionRow[]>([])
  const [loading, setLoading] = useState(true)
  const [loadError, setLoadError] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [params, setParams] = useSearchParams()
  const [tab, setTab] = useUrlChoice<'library' | 'import'>('tab', 'library', ['library', 'import'])
  const { profile } = useAuth()
  const role = profile?.role as EditorialRole | undefined
  const can = (to: QuestionStatus) => Boolean(editing && role && questionTransitionAllowed(editing.status, to, role))
  const [pickerOpen, setPickerOpen] = useState(false)
  const [filtersOpen, setFiltersOpen] = useState(false)
  const [search, setSearch] = useUrlSearchInput()
  const [gameFilter, setGameFilter] = useUrlChoice<string>('game', 'all', ['all', ...QUESTION_GAME_TYPES])
  const [categoryFilter, setCategoryFilter] = useUrlChoice<string>('category', 'all', undefined)
  const [difficultyFilter, setDifficultyFilter] = useUrlChoice<string>('difficulty', 'all', ['all', ...QUESTION_DIFFICULTIES])
  const [languageFilter, setLanguageFilter] = useUrlChoice<string>('language', 'all', ['all', 'en', 'am'])
  const [statusFilter, setStatusFilter] = useUrlChoice<string>('status', 'all', ['all', ...STATUSES])
  const [draft, setDraft] = useState<QuestionDraft | null>(null)
  const [editing, setEditing] = useState<QuestionRow | null>(null)
  const [savedForm, setSavedForm] = useState('')
  const [notes, setNotes] = useState('')
  const [importText, setImportText] = useState('')
  const [importConfirmed, setImportConfirmed] = useState(false)
  const [showPreview, setShowPreview] = useState(false)
  const [showErrors, setShowErrors] = useState(false)
  const [previewLocale, setPreviewLocale] = useState<'en' | 'am'>(am ? 'am' : 'en')
  const editorHeading = useRef<HTMLHeadingElement>(null)
  const tabRefs = useRef<Record<string, HTMLButtonElement | null>>({})
  const datalistId = useId()

  const load = useCallback(async () => {
    setLoading(true); setLoadError('')
    try { setRows(await questionLibraryApi.list()); return true }
    catch (cause) { setLoadError(cause instanceof Error ? cause.message : 'Could not load questions.'); return false }
    finally { setLoading(false) }
  }, [])
  useEffect(() => { void load() }, [load])

  const editorKey = draft ? (editing?.id ?? 'new') : null
  useEffect(() => { if (editorKey) editorHeading.current?.focus() }, [editorKey])

  const categories = useMemo(() => [...new Set(rows.map((row) => row.category).filter(Boolean))].sort(), [rows])
  const counts = useMemo(() => Object.fromEntries(STATUSES.map((status) =>
    [status, rows.filter((row) => row.status === status).length])) as Record<(typeof STATUSES)[number], number>, [rows])
  const gameCounts = useMemo(() => Object.fromEntries(QUESTION_GAME_TYPES.map((game) =>
    [game, rows.filter((row) => row.game_type === game).length])) as Record<QuestionGameType, number>, [rows])
  const visible = rows.filter((row) => {
    const itemPayload = obj(row.payload)
    const haystack = [row.question_id, row.stable_id, row.category,
      ...['prompt', 'answer', 'left', 'right', 'explanation', 'excerpt'].flatMap((key) =>
        [text(obj(itemPayload[key]).en), text(obj(itemPayload[key]).am)]),
      ...(Array.isArray(itemPayload.options) ? itemPayload.options.flatMap((option) =>
        [text(obj(obj(option).text).en), text(obj(obj(option).text).am)]) : []),
      text(obj(itemPayload.source).label)].join(' ').toLocaleLowerCase()
    const locales = Array.isArray(itemPayload.verifiedLocales) ? itemPayload.verifiedLocales : []
    return haystack.includes(search.trim().toLocaleLowerCase()) &&
      (gameFilter === 'all' || row.game_type === gameFilter) &&
      (categoryFilter === 'all' || row.category === categoryFilter) &&
      (difficultyFilter === 'all' || row.difficulty === difficultyFilter) &&
      (languageFilter === 'all' || locales.includes(languageFilter)) &&
      (statusFilter === 'all' || row.status === statusFilter)
  })
  const advancedActive = [gameFilter, categoryFilter, difficultyFilter, languageFilter].filter((value) => value !== 'all').length
  const filtersActive = advancedActive + (statusFilter !== 'all' ? 1 : 0) + (search.trim() ? 1 : 0)
  function clearFilters() {
    const next = new URLSearchParams(params)
    for (const key of ['q', 'game', 'category', 'difficulty', 'language', 'status', 'page']) next.delete(key)
    setParams(next)
  }
  const preview = useMemo(() => importText.trim()
    ? previewQuestionImport(importText, new Set(rows.flatMap((row) => [row.stable_id, row.question_id])))
    : { items: [] as QuestionDraft[], errors: [] as string[] }, [importText, rows])
  const dirty = draft !== null && JSON.stringify(draft) !== savedForm
  const issues = useMemo(() => draft ? validateQuestionDraft(draft) : [], [draft])
  const fieldError = (...prefixes: string[]) => showErrors
    ? issues.find((issue) => prefixes.some((prefix) => issue.startsWith(prefix))) : undefined

  function confirmDiscard() {
    return !dirty || window.confirm(t('Discard unsaved question changes?', 'ያልተቀመጡ የጥያቄ ለውጦችን ይጣሉ?'))
  }
  function open(row: QuestionRow, force = false) {
    if (!force && !confirmDiscard()) return
    const game = QUESTION_GAME_TYPES.find(game => game === row.game_type)
    if (!game || row.payload.format === 'studio-activity-v1') { setError('Open this activity in the Visual Studio. This legacy question form cannot edit its format.'); return }
    const base = makeQuestionDraft(game)
    const next = { stable_id: row.stable_id, game_type: game, category: row.category || '',
      difficulty: QUESTION_DIFFICULTIES.includes(row.difficulty) ? row.difficulty : 'beginner',
      payload: { ...base.payload, ...structuredClone(obj(row.payload)) },
      source_references: Array.isArray(row.source_references) ? structuredClone(row.source_references) : [] }
    setDraft(next); setEditing(row); setSavedForm(JSON.stringify(next)); setNotes(row.review_notes || '')
    setError(''); setSuccess(''); setShowErrors(false); setTab('library')
  }
  function create(game: QuestionGameType = 'trivia') {
    if (!confirmDiscard()) return
    const next = makeQuestionDraft(game)
    setDraft(next); setEditing(null); setSavedForm(JSON.stringify(next)); setNotes('')
    setError(''); setSuccess(''); setShowErrors(false); setPickerOpen(false); setTab('library')
  }
  function changeGame(game: QuestionGameType) {
    if (dirty && !window.confirm(t('Switching game type discards this unsaved draft. Continue?', 'የጨዋታ አይነት መቀየር ያልተቀመጠውን ረቂቅ ያጠፋል። ይቀጥሉ?'))) return
    const next = makeQuestionDraft(game)
    setDraft(next); setSavedForm(JSON.stringify(next)); setError(''); setSuccess(''); setShowErrors(false)
  }
  function metadata(key: 'stable_id' | 'category' | 'difficulty', next: string) {
    setDraft((current) => {
      if (!current) return current
      const payload = { ...current.payload }
      if (key === 'stable_id') payload.id = next
      if (key === 'category') payload.category = next
      if (key === 'difficulty' && !['who-am-i', 'match'].includes(current.game_type)) payload.difficulty = next
      return { ...current, [key]: next, payload } as QuestionDraft
    })
  }
  function payload(key: string, next: unknown) {
    setDraft((current) => current ? { ...current, payload: { ...current.payload, [key]: next } } : current)
  }
  function localized(key: string, lang: 'en' | 'am', next: string) {
    if (draft) payload(key, { ...obj(draft.payload[key]), [lang]: next })
  }
  function option(index: number, lang: 'en' | 'am', next: string) {
    if (!draft || !Array.isArray(draft.payload.options)) return
    const options = structuredClone(draft.payload.options) as Array<Record<string, unknown>>
    options[index].text = { ...obj(options[index].text), [lang]: next }
    payload('options', options)
  }
  function source(key: string, next: string) {
    setDraft((current) => {
      if (!current) return current
      const updated = { ...obj(current.payload.source), [key]: next }
      return { ...current, payload: { ...current.payload, source: updated },
        source_references: [updated, ...current.source_references.slice(1)] as QuestionDraft['source_references'] }
    })
  }
  function duplicate() {
    if (!draft) return
    const next = duplicateQuestionDraft(draft, crypto.randomUUID().slice(0, 8))
    setDraft(next); setEditing(null); setSavedForm(JSON.stringify(next)); setNotes('')
    setSuccess(t('Draft copy prepared. Save to create it.', 'የረቂቅ ቅጂ ተዘጋጅቷል። ለመፍጠር ያስቀምጡ።'))
  }
  async function save() {
    if (!draft || busy) return
    if (issues.length) { setShowErrors(true); setError(issues.join(' ')); return }
    setBusy(true); setError(''); setSuccess('')
    try {
      const saved = await questionLibraryApi.save(draft, editing?.id)
      const reopened = await questionLibraryApi.get(saved.id)
      if (reopened.status !== 'draft' || reopened.stable_id !== draft.stable_id ||
          (!editing && reopened.question_id !== draft.stable_id) ||
          JSON.stringify(canonical(reopened.payload)) !== JSON.stringify(canonical(draft.payload)) ||
          JSON.stringify(canonical(reopened.source_references)) !== JSON.stringify(canonical(draft.source_references))) {
        throw new Error('The saved draft did not match the reopened database record.')
      }
      const refreshed = await load()
      if (!refreshed) return
      open(reopened, true)
      setSuccess(t('Draft saved.', 'ረቂቅ ተቀምጧል።'))
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Save failed.') }
    finally { setBusy(false) }
  }
  async function review(status: QuestionStatus) {
    if (!editing || busy || dirty) { setError(t('Save changes before reviewing.', 'ከግምገማ በፊት ለውጦችን ያስቀምጡ።')); return }
    if (status === 'published' &&
        !window.confirm(t('Publish this approved question to public games?', 'ይህን የጸደቀ ጥያቄ ለሕዝብ ጨዋታዎች ያትሙ?'))) return
    if (editing.status === 'published' && status === 'draft' &&
        !window.confirm(t('Unpublish this question? It will stop appearing in public games and return to draft.', 'ይህን ጥያቄ ከህትመት ይመልሱ? በሕዝብ ጨዋታዎች አይታይም፤ ወደ ረቂቅ ይመለሳል።'))) return
    setBusy(true); setError(''); setSuccess('')
    try {
      await questionLibraryApi.review(editing.id, status, notes)
      const updated = await questionLibraryApi.get(editing.id)
      if (updated.status !== status) throw new Error('The editorial status did not persist in the reopened record.')
      const refreshed = await load()
      if (!refreshed) return
      open(updated, true)
      setSuccess(t('Editorial status updated.', 'የአርትዖት ሁኔታ ተዘምኗል።'))
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Review failed.') }
    finally { setBusy(false) }
  }
  async function importDrafts() {
    if (!importConfirmed || !preview.items.length || preview.errors.length || busy) return
    setBusy(true); setError(''); setSuccess('')
    try {
      const count = await questionLibraryApi.importDrafts(importText, new Set(rows.flatMap((row) => [row.stable_id, row.question_id])))
      setImportText(''); setImportConfirmed(false)
      if (!await load()) return
      setSuccess(t(`${count} drafts imported for review.`, `${count} ረቂቆች ለግምገማ ገብተዋል።`))
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Import failed.') }
    finally { setBusy(false) }
  }
  function onTabKey(event: KeyboardEvent, current: 'library' | 'import') {
    const order = ['library', 'import'] as const
    const index = order.indexOf(current)
    const next = event.key === 'ArrowRight' ? order[(index + 1) % 2] : event.key === 'ArrowLeft' ? order[(index + 1) % 2]
      : event.key === 'Home' ? order[0] : event.key === 'End' ? order[1] : null
    if (!next) return
    event.preventDefault(); setTab(next); tabRefs.current[next]?.focus()
  }

  const statusLabel = (status: string) => status === 'draft' ? t('Drafts', 'ረቂቆች') : status === 'review' ? t('In review', 'በግምገማ ላይ')
    : status === 'approved' ? t('Approved', 'የጸደቁ') : status === 'published' ? t('Published', 'የታተሙ')
      : status === 'archived' ? t('Archived', 'በማህደር') : t('Rejected', 'ውድቅ የተደረጉ')
  const statusHelp = (status: string) => status === 'draft' ? t('Being written', 'በመጻፍ ላይ') : status === 'review' ? t('Awaiting an admin', 'አስተዳዳሪን በመጠበቅ ላይ')
    : status === 'approved' ? t('Ready to publish', 'ለህትመት ዝግጁ') : status === 'published' ? t('Live in games', 'በጨዋታ ላይ')
      : status === 'archived' ? t('Retired, kept for records', 'ጡረታ የወጣ') : t('Needs rework', 'ማሻሻል ይፈልጋል')

  const bilingual = (key: string, en: string, amLabel: string, opts: { multiline?: boolean; required?: boolean; hint?: string; errorPrefix?: string } = {}) => {
    const value = obj(draft?.payload[key])
    const amReviewed = Array.isArray(draft?.payload.verifiedLocales) && draft.payload.verifiedLocales.includes('am')
    const errorFor = fieldError(opts.errorPrefix ?? en)
    const common = (lang: 'en' | 'am') => ({ lang, value: text(value[lang]), onChange: (event: { target: { value: string } }) => localized(key, lang, event.target.value) })
    return <div className={q.languages} key={key}>
      <Field t={t} label={t(`${en} · English`, `${amLabel} · እንግሊዝኛ`)} required hint={opts.hint} error={errorFor?.includes('English') ? errorFor : undefined}>
        {(a) => opts.multiline === false ? <input {...a} {...common('en')} /> : <textarea {...a} {...common('en')} />}
      </Field>
      <Field t={t} label={t(`${en} · Amharic`, `${amLabel} · አማርኛ`)} required={amReviewed} optional={!amReviewed}
        hint={amReviewed ? undefined : t('Add Amharic, then tick “Amharic content reviewed”.', 'አማርኛ ያክሉ፣ ከዚያ “የአማርኛ ይዘት ተገምግሟል” ይምረጡ።')}
        error={errorFor?.includes('Amharic') ? errorFor : undefined}>
        {(a) => opts.multiline === false ? <input {...a} {...common('am')} /> : <textarea {...a} {...common('am')} />}
      </Field>
    </div>
  }

  const isLocalCard = draft ? LOCAL_CARD_GAMES.includes(draft.game_type) : false
  const optionList = draft && Array.isArray(draft.payload.options) ? draft.payload.options : []
  const emptyLibrary = !loading && !loadError && rows.length === 0
  const pickerVisible = pickerOpen || (emptyLibrary && !draft)
  const locked = Boolean(editing && editing.status !== 'draft')
  const stepIndex = editing ? (editing.status === 'published' ? 3 : editing.status === 'approved' ? 2 : editing.status === 'review' ? 1 : 0) : 0
  const pickerId = `${datalistId}-picker`

  return <div className={`${q.root} ${q.page}`}>
    <header className={q.header}>
      <div>
        <h1>{t('Faith Challenges', 'የእምነት ፈተናዎች')}</h1>
        <p className={s.muted}>{t('Game Content Studio · write questions in English and Amharic, review them, then publish to public games.', 'የጨዋታ ይዘት ስቱዲዮ · ጥያቄዎችን በእንግሊዝኛና በአማርኛ ይጻፉ፣ ይገምግሙ፣ ከዚያ ለሕዝብ ጨዋታዎች ያትሙ።')}</p>
      </div>
      <div className={q.headerActions}>
        <Link to="/admin/play/studio">12-game visual studio / የጨዋታ ስቱዲዮ</Link>
        <button type="button" onClick={() => void load()} disabled={busy || loading}>{t('Refresh', 'አድስ')}</button>
        <button type="button" className={q.cta} aria-expanded={pickerVisible} aria-controls={pickerId} onClick={() => setPickerOpen(!pickerVisible)}>
          ＋ {t('Create challenge', 'ፈተና ፍጠር')}
        </button>
      </div>
    </header>
    <GameModeNavigation am={am} />
    <div aria-live="polite">
      {error && <p className={s.error} role="alert">{error}</p>}{success && <p className={s.success} role="status">{success}</p>}
    </div>

    <section className={q.dashboard} aria-label={t('Question library overview', 'የጥያቄ ቤተ-መጻሕፍት አጠቃላይ እይታ')}>
      {STATUSES.map((status) =>
        <button type="button" key={status} className={q.summaryCard} data-status={status} aria-pressed={statusFilter === status}
          aria-label={`${statusLabel(status)}: ${counts[status]}`}
          onClick={() => {
            const next = new URLSearchParams(params)
            next.delete('tab')
            if (statusFilter === status) next.delete('status')
            else next.set('status', status)
            setParams(next)
          }}>
          <strong aria-hidden="true">{counts[status]}</strong>
          <span aria-hidden="true">{statusLabel(status)}</span>
          <small aria-hidden="true">{statusHelp(status)}</small>
        </button>)}
    </section>

    {pickerVisible && <section id={pickerId} className={s.card} aria-label={t('Choose a game type', 'የጨዋታ አይነት ይምረጡ')}>
      <div className={q.pickerHead}>
        <h2>{t('What kind of challenge?', 'ምን አይነት ፈተና?')}</h2>
        <span className={s.muted}>{t('Pick a game; the editor adapts to it.', 'ጨዋታ ይምረጡ፤ አርታኢው ይስማማል።')}</span>
      </div>
      <ul className={q.games}>
        {QUESTION_GAME_TYPES.map((game) => {
          const info = GAME_INFO[game]
          return <li key={game}><button type="button" className={q.gameCard} data-game={game} onClick={() => create(game)}>
            <span className={q.gameIcon} aria-hidden="true">{info.icon}</span>
            <span className={q.gameName}>{t(info.en, info.am)}</span>
            <span className={q.gameDesc}>{t(info.descEn, info.descAm)}</span>
            <span className={q.gameMeta}>{gameCounts[game]} {t('in library', 'በቤተ-መጻሕፍት')}</span>
            {UNCONNECTED_PUBLIC_GAMES.includes(game) && <span className={q.gameNote}>{t('Drafts only until the public game is connected', 'የሕዝብ ጨዋታው እስኪገናኝ ረቂቅ ብቻ')}</span>}
          </button></li>
        })}
      </ul>
    </section>}

    {draft && <section className={`${s.card} ${q.editor}`} aria-label={t('Question editor', 'የጥያቄ አርታኢ')}>
      <div className={q.editorHead}>
        <h2 ref={editorHeading} tabIndex={-1}>{editing ? t('Edit question', 'ጥያቄ አርትዕ') : t('New draft', 'አዲስ ረቂቅ')}
          {' · '}{gameName(draft.game_type, am)}</h2>
        <div className={q.editorMeta}>
          <Status value={editing?.status || 'draft'} />
          {dirty && <span className={s.warn}>{t('● Unsaved changes', '● ያልተቀመጡ ለውጦች')}</span>}
          <button type="button" aria-pressed={showPreview} onClick={() => setShowPreview((value) => !value)}>
            {showPreview ? t('Hide preview', 'ቅድመ እይታን ደብቅ') : t('Preview question', 'ጥያቄን አስቀድሞ ይመልከቱ')}</button>
          <button type="button" onClick={() => { if (confirmDiscard()) setDraft(null) }}>{t('Close', 'ዝጋ')}</button>
        </div>
      </div>
      {locked && <p className={s.notice} role="note">{t('This question is locked while it is ' + editing?.status + '. Return it to draft to edit the content.', 'ይህ ጥያቄ ተቆልፏል። ይዘቱን ለማረም ወደ ረቂቅ ይመልሱት።')}</p>}
      <div className={q.editorLayout} data-preview={showPreview}>
        <div className={q.editor}>
          <fieldset disabled={busy || locked} className={q.editor}>
            <fieldset className={q.group}>
              <legend>{t('1 · Basics', '1 · መሠረታዊ መረጃ')}</legend>
              <div className={q.filters}>
                <Field t={t} label={t('Stable ID', 'ቋሚ መለያ')} required error={fieldError('Stable ID', 'Payload ID')}
                  hint={editing ? t('Fixed after the first save.', 'ከመጀመሪያው ማስቀመጥ በኋላ አይቀየርም።') : t('Lowercase letters, numbers, hyphens. Cannot change after saving.', 'ትናንሽ ፊደላት፣ ቁጥሮች፣ ሰረዞች። ከማስቀመጥ በኋላ አይቀየርም።')}>
                  {(a) => <input {...a} value={draft.stable_id} disabled={Boolean(editing)} placeholder="genesis-creation-1" onChange={(event) => metadata('stable_id', event.target.value)} />}
                </Field>
                <Field t={t} label={t('Game type', 'የጨዋታ አይነት')}>
                  {(a) => <select {...a} value={draft.game_type} disabled={Boolean(editing)} onChange={(event) => changeGame(event.target.value as QuestionGameType)}>
                    {QUESTION_GAME_TYPES.map((game) => <option key={game} value={game}>{gameName(game, am)}</option>)}</select>}
                </Field>
                <Field t={t} label={t('Category', 'ምድብ')} required error={fieldError('Category', 'Who Am I needs', 'Match category', 'Payload game')}
                  hint={draft.game_type === 'who-am-i' ? t('Use: biblical-people, biblical-locations, saints, holy-objects.', 'ይጠቀሙ: biblical-people, biblical-locations, saints, holy-objects።') : undefined}>
                  {(a) => <><input {...a} list={datalistId} value={draft.category} onChange={(event) => metadata('category', event.target.value)} />
                    <datalist id={datalistId}>{(draft.game_type === 'who-am-i' ? WHO_AM_I_CATEGORIES : categories).map((category) => <option key={category} value={category} />)}</datalist></>}
                </Field>
                <Field t={t} label={t('Difficulty', 'ደረጃ')}>
                  {(a) => <select {...a} value={draft.difficulty} onChange={(event) => metadata('difficulty', event.target.value)}>
                    {QUESTION_DIFFICULTIES.map((level) => <option key={level}>{level}</option>)}</select>}
                </Field>
              </div>
            </fieldset>

            <fieldset className={q.group}>
              <legend>{t('2 · Question', '2 · ጥያቄ')}</legend>
              {draft.game_type === 'who-am-i' ? bilingual('answer', 'Answer', 'መልስ', { multiline: false, hint: t('The person, place, or object players must name.', 'ተጫዋቾች የሚጠሩት ሰው፣ ቦታ ወይም ነገር።') })
                : draft.game_type === 'match' ? <>{bilingual('left', 'Prompt', 'ጥያቄ', { multiline: false, errorPrefix: 'Prompt' })}{bilingual('right', 'Answer', 'መልስ', { multiline: false })}</>
                  : <>{bilingual('prompt', 'Prompt', 'ጥያቄ', { hint: t('Write the question exactly as players will read it.', 'ጥያቄውን ተጫዋቾች እንደሚያነቡት ይጻፉ።') })}
                    {draft.game_type === 'emoji' && <Field t={t} label={t('Emoji clue', 'የኢሞጂ ፍንጭ')} required error={fieldError('Emoji')} hint={t('For example: 🌊🚢🕊️', 'ለምሳሌ: 🌊🚢🕊️')}>
                      {(a) => <input {...a} value={text(draft.payload.emoji)} onChange={(event) => payload('emoji', event.target.value)} />}</Field>}
                    {draft.game_type === 'finish-the-verse' && bilingual('excerpt', 'Verse excerpt', 'የጥቅስ ክፍል', { hint: t('The part of the verse shown before the blank.', 'ከባዶው በፊት የሚታየው የጥቅሱ ክፍል።') })}
                    {draft.game_type === 'finish-the-mezmur' && <Field t={t} label={t('Mezmur mode', 'የመዝሙር ዘዴ')}>
                      {(a) => <select {...a} value={text(draft.payload.mode)} onChange={(event) => payload('mode', event.target.value)}>
                        {['finish-lyrics', 'missing-word', 'guess-mezmur', 'guess-occasion'].map((mode) => <option key={mode}>{mode}</option>)}</select>}</Field>}</>}
            </fieldset>

            {!isLocalCard && <fieldset className={q.group}>
              <legend>{t('3 · Answer options', '3 · የመልስ አማራጮች')}</legend>
              <p className={q.groupHint}>{t('Four distinct options. Mark the correct one.', 'አራት የተለያዩ አማራጮች። ትክክለኛውን ምልክት ያድርጉ።')}</p>
              {optionList.map((item, index) => {
                const key = String(obj(item).key)
                const errorFor = fieldError(`Answer ${index + 1}`)
                return <div className={q.optionRow} key={key}>
                  <span className={q.optionKey} data-correct={text(draft.payload.correctKey) === key} aria-hidden="true">{key.toUpperCase()}</span>
                  <Field t={t} label={`${key.toUpperCase()} · English`} required error={errorFor?.includes('English') ? errorFor : undefined}>
                    {(a) => <input {...a} lang="en" value={text(obj(obj(item).text).en)} onChange={(event) => option(index, 'en', event.target.value)} />}</Field>
                  <Field t={t} label={`${key.toUpperCase()} · አማርኛ`} error={errorFor?.includes('Amharic') ? errorFor : undefined}>
                    {(a) => <input {...a} lang="am" value={text(obj(obj(item).text).am)} onChange={(event) => option(index, 'am', event.target.value)} />}</Field>
                </div>
              })}
              <Field t={t} label={t('Correct answer', 'ትክክለኛ መልስ')} required error={fieldError('Select a valid')}>
                {(a) => <select {...a} value={text(draft.payload.correctKey)} onChange={(event) => payload('correctKey', event.target.value)}>
                  {optionList.map((item) => <option key={String(obj(item).key)} value={String(obj(item).key)}>{String(obj(item).key).toUpperCase()}</option>)}</select>}
              </Field>
              {fieldError('Exactly four', 'Answer options must') && <span className={q.fieldError}>{fieldError('Exactly four', 'Answer options must')}</span>}
            </fieldset>}

            <fieldset className={q.group}>
              <legend>{isLocalCard ? t('3 · Explanation & source', '3 · ማብራሪያና ምንጭ') : t('4 · Explanation & source', '4 · ማብራሪያና ምንጭ')}</legend>
              {isLocalCard && <p className={s.notice} role="note">{t('This game currently uses local cards. You can prepare and approve CMS drafts; publication is blocked until its public reader is connected.', 'ይህ ጨዋታ አሁን የአካባቢ ካርዶችን ይጠቀማል። የCMS ረቂቆችን ማዘጋጀትና ማጽደቅ ይቻላል፤ የሕዝብ አንባቢው እስኪገናኝ ድረስ ህትመት ታግዷል።')}</p>}
              {draft.game_type === 'finish-the-mezmur' && <p className={s.notice} role="note">{t('Legacy quiz drafts are preserved. The public game reads published hymn lyrics, so these question rows cannot be published to it. Use the visual studio or hymn editor.', 'የሕዝብ ጨዋታው የታተሙ ግጥሞችን ይጠቀማል። እነዚህ ጥያቄዎች አይታተሙም።')}</p>}
              {bilingual('explanation', 'Explanation', 'ማብራሪያ', { hint: t('Shown after players answer. Explain why the answer is correct.', 'ተጫዋቹ ከመለሰ በኋላ ይታያል። መልሱ ለምን ትክክል እንደሆነ ያብራሩ።') })}
              <p className={q.groupHint}>{t('A source reference is required before a question can be saved, approved, or published.', 'ጥያቄ ከመቀመጡ፣ ከመጽደቁ ወይም ከመታተሙ በፊት የምንጭ ማጣቀሻ ያስፈልጋል።')}</p>
              <div className={q.filters}>
                <Field t={t} label={t('Source label', 'የምንጭ ስም')} required error={fieldError('An internal source')} hint={t('Shown to players, e.g. “Genesis 1:1”.', 'ለተጫዋቾች ይታያል፣ ለምሳሌ “ዘፍጥረት 1:1”።')}>
                  {(a) => <input {...a} value={text(obj(draft.payload.source).label)} onChange={(event) => source('label', event.target.value)} />}</Field>
                <Field t={t} label={t('Internal source route', 'የውስጥ ምንጭ መንገድ')} required error={fieldError('Source references')} hint={t('Starts with “/”, e.g. /bible/genesis/1', 'በ “/” ይጀምራል፣ ለምሳሌ /bible/genesis/1')}>
                  {(a) => <input {...a} value={text(obj(draft.payload.source).route)} onChange={(event) => source('route', event.target.value)} placeholder="/bible/genesis/1" />}</Field>
                <Field t={t} label={t('Source type', 'የምንጭ አይነት')}>
                  {(a) => <select {...a} value={text(obj(draft.payload.source).kind)} onChange={(event) => source('kind', event.target.value)}>
                    {['bible', 'church-library', 'mezmur', 'calendar'].map((kind) => <option key={kind}>{kind}</option>)}</select>}</Field>
              </div>
              <label className={s.check}><input type="checkbox" checked={Array.isArray(draft.payload.verifiedLocales) && draft.payload.verifiedLocales.includes('am')} onChange={(event) => payload('verifiedLocales', event.target.checked ? ['en', 'am'] : ['en'])} />{t('Amharic content reviewed', 'የአማርኛ ይዘት ተገምግሟል')}</label>
            </fieldset>

            <div className={q.group} aria-label={t('Validation', 'ማረጋገጫ')} role="group">
              <p className={q.statusLine} role="status">{issues.length
                ? t(`${issues.length} to fix before saving`, `ከማስቀመጥ በፊት ${issues.length} ማስተካከል ይቀራል`)
                : t('✓ Ready to save', '✓ ለማስቀመጥ ዝግጁ')}</p>
              {!!issues.length && <ul className={q.checklist}>{issues.map((issue) => <li key={issue}>{issue}</li>)}</ul>}
              <div className={s.actions}>
                <button type="button" className={s.primary} onClick={() => void save()}>{t('Save draft', 'ረቂቅ አስቀምጥ')}</button>
                <button type="button" disabled={!draft.stable_id} onClick={duplicate}>{t('Duplicate as draft', 'እንደ ረቂቅ ቅዳ')}</button>
              </div>
            </div>
          </fieldset>

          <section className={q.group} aria-label={t('Editorial workflow', 'የአርትዖት ሂደት')}>
            <h3 style={{ margin: 0 }}>{t('Editorial review', 'የአርትዖት ግምገማ')}</h3>
            <ol className={q.steps} aria-label={t('Workflow progress', 'የሂደት ሁኔታ')}>
              {[t('Draft', 'ረቂቅ'), t('In review', 'በግምገማ'), t('Approved', 'የጸደቀ'), t('Published', 'የታተመ')].map((label, index) =>
                <li key={label} className={q.step} data-state={editing && index < stepIndex ? 'done' : undefined}
                  aria-current={editing && index === stepIndex && editing.status !== 'rejected' && editing.status !== 'archived' ? 'step' : undefined}>{label}</li>)}
            </ol>
            {!editing && <p className={q.workflowHelp}>{t('Save this draft first. Then you can approve it and publish it to public games.', 'መጀመሪያ ይህን ረቂቅ ያስቀምጡ። ከዚያ ማጽደቅና ለሕዝብ ጨዋታዎች ማተም ይችላሉ።')}</p>}
            {editing && <>
              <p className={q.workflowHelp}>{editing.status === 'draft' ? t('Draft: only staff can see it. Submit it for review once facts and sources are checked.', 'ረቂቅ፦ ሠራተኞች ብቻ ያዩታል። እውነታዎችና ምንጮች ከተረጋገጡ በኋላ ለግምገማ ያቅርቡ።')
                : editing.status === 'review' ? t('In review: an admin approves or rejects it, or returns it to draft.', 'በግምገማ ላይ፦ አስተዳዳሪ ያጸድቀዋል፣ ውድቅ ያደርገዋል፣ ወይም ወደ ረቂቅ ይመልሰዋል።')
                : editing.status === 'archived' ? t('Archived: retired and kept for records. An admin can restore it to draft.', 'በማህደር፦ ለመዝገብ ተይዟል። አስተዳዳሪ ወደ ረቂቅ ሊመልሰው ይችላል።')
                : editing.status === 'approved' ? (UNCONNECTED_PUBLIC_GAMES.includes(editing.game_type)
                  ? t('Approved draft: publication is blocked until this format has a public reader.', 'የጸደቀ ረቂቅ፦ የሕዝብ አንባቢው እስኪገናኝ ህትመት ታግዷል።')
                  : t('Approved: checked and ready. Publish to show it in public games.', 'የጸደቀ፦ ተረጋግጧል። በሕዝብ ጨዋታዎች ለማሳየት ያትሙ።'))
                  : editing.status === 'published' ? t('Published: live in public games. Unpublish to pull it back to draft.', 'የታተመ፦ በሕዝብ ጨዋታዎች ላይ አለ። ወደ ረቂቅ ለመመለስ ከህትመት ይመልሱ።')
                    : t('Rejected: not used in games. Return it to draft to rework it.', 'ውድቅ፦ በጨዋታዎች አይጠቀምም። ለማሻሻል ወደ ረቂቅ ይመልሱ።')}</p>
              <label>{t('Review notes', 'የግምገማ ማስታወሻ')}<textarea value={notes} onChange={(event) => setNotes(event.target.value)} /></label>
              <div className={s.actions}>
                {can('review') && <button type="button" className={s.primary} disabled={dirty || busy} onClick={() => void review('review')}>{t('Submit for review', 'ለግምገማ አቅርብ')}</button>}
                {can('approved') && <button type="button" className={s.primary} disabled={dirty || busy} onClick={() => void review('approved')}>{t('Approve', 'አጽድቅ')}</button>}
                {can('rejected') && <button type="button" className={q.destructive} disabled={dirty || busy} onClick={() => void review('rejected')}>{t('Reject', 'ውድቅ አድርግ')}</button>}
                {can('published') && !UNCONNECTED_PUBLIC_GAMES.includes(editing.game_type) && <button type="button" className={s.primary} disabled={dirty || busy} onClick={() => void review('published')}>{t('Publish', 'አትም')}</button>}
                {editing.status === 'published' && can('draft') && <button type="button" className={q.destructive} disabled={dirty || busy} onClick={() => void review('draft')}>{t('Unpublish', 'ከህትመት መልስ')}</button>}
                {editing.status !== 'published' && can('draft') && <button type="button" disabled={dirty || busy} onClick={() => void review('draft')}>{t('Return to draft', 'ወደ ረቂቅ መልስ')}</button>}
                {can('archived') && <button type="button" className={q.destructive} disabled={dirty || busy} onClick={() => void review('archived')}>{t('Archive', 'በማህደር አስቀምጥ')}</button>}
              </div>
              {dirty && <p className={q.workflowHint}>{t('Save your changes to enable these actions.', 'እነዚህን ተግባራት ለማንቃት ለውጦችን ያስቀምጡ።')}</p>}
            </>}
          </section>
        </div>

        {showPreview && <aside className={q.previewCol} aria-label={t('Live preview', 'ቀጥታ ቅድመ እይታ')}>
          <div className={s.actions} role="group" aria-label={t('Preview language', 'የቅድመ እይታ ቋንቋ')}>
            <button type="button" aria-pressed={previewLocale === 'en'} onClick={() => setPreviewLocale('en')}>English</button>
            <button type="button" aria-pressed={previewLocale === 'am'} onClick={() => setPreviewLocale('am')}>አማርኛ</button>
          </div>
          <FaithChallengePreview key={`${draft.stable_id}-${draft.game_type}-${previewLocale}`} draft={draft} locale={previewLocale} />
        </aside>}
      </div>
    </section>}

    <div className={q.tabs} role="tablist" aria-label={t('Faith Challenges sections', 'የክፍል ምርጫ')}>
      {([['library', t('Question Library', 'የጥያቄ ቤተ-መጻሕፍት')], ['import', t('Bulk Import', 'ብዙ ማስገባት')]] as const).map(([id, label]) =>
        <button key={id} type="button" role="tab" id={`${pickerId}-tab-${id}`} className={q.tab} aria-selected={tab === id} aria-controls={`${pickerId}-panel-${id}`}
          tabIndex={tab === id ? 0 : -1} ref={(node) => { tabRefs.current[id] = node }} onClick={() => setTab(id)} onKeyDown={(event) => onTabKey(event, id)}>{label}</button>)}
    </div>

    {tab === 'library' && <div className={q.tabPanel} role="tabpanel" id={`${pickerId}-panel-library`} aria-labelledby={`${pickerId}-tab-library`}>
      <div className={q.toolbar} role="search" aria-label={t('Question filters', 'የጥያቄ ማጣሪያዎች')}>
        <div className={q.search}><label>{t('Search', 'ፈልግ')}<input type="search" value={search} onChange={(event) => setSearch(event.target.value)} placeholder={t('ID, prompt, answer', 'መለያ፣ ጥያቄ፣ መልስ')} /></label></div>
        <div className={q.compact}><label>{t('Publication', 'ህትመት')}<select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value)}>
          <option value="all">{t('All statuses', 'ሁሉም ሁኔታዎች')}</option>{STATUSES.map((status) => <option key={status} value={status}>{statusLabel(status)}</option>)}</select></label></div>
        <button type="button" aria-expanded={filtersOpen} aria-controls={`${pickerId}-advanced`} onClick={() => setFiltersOpen(!filtersOpen)}>
          {t('More filters', 'ተጨማሪ ማጣሪያዎች')}{advancedActive > 0 && <span className={q.chip} aria-label={t(`${advancedActive} active`, `${advancedActive} ንቁ`)}>{advancedActive}</span>}</button>
        {filtersActive > 0 && <button type="button" onClick={clearFilters}>{t('Clear filters', 'ማጣሪያዎችን አጽዳ')}</button>}
        <span className={q.toolbarCount} aria-live="polite">{visible.length} {t('questions', 'ጥያቄዎች')}</span>
      </div>
      {filtersOpen && <div id={`${pickerId}-advanced`} className={`${q.filters} ${q.advanced}`}>
        <label>{t('Game', 'ጨዋታ')}<select value={gameFilter} onChange={(event) => setGameFilter(event.target.value)}><option value="all">{t('All games', 'ሁሉም ጨዋታዎች')}</option>{QUESTION_GAME_TYPES.map((game) => <option key={game} value={game}>{gameName(game, am)}</option>)}</select></label>
        <label>{t('Category', 'ምድብ')}<select value={categoryFilter} onChange={(event) => setCategoryFilter(event.target.value)}><option value="all">{t('All categories', 'ሁሉም ምድቦች')}</option>{categories.map((category) => <option key={category}>{category}</option>)}</select></label>
        <label>{t('Difficulty', 'ደረጃ')}<select value={difficultyFilter} onChange={(event) => setDifficultyFilter(event.target.value)}><option value="all">{t('All levels', 'ሁሉም ደረጃዎች')}</option>{QUESTION_DIFFICULTIES.map((level) => <option key={level}>{level}</option>)}</select></label>
        <label>{t('Language', 'ቋንቋ')}<select value={languageFilter} onChange={(event) => setLanguageFilter(event.target.value)}><option value="all">{t('All languages', 'ሁሉም ቋንቋዎች')}</option><option value="en">English</option><option value="am">አማርኛ</option></select></label>
      </div>}

      {loading && <div className={q.skeletons} role="status" aria-busy="true"><span className={q.visuallyHidden}>{t('Loading questions…', 'ጥያቄዎች በመጫን ላይ…')}</span>
        {[0, 1, 2, 3].map((index) => <div className={q.skeleton} key={index} aria-hidden="true" />)}</div>}
      {!loading && loadError && <div className={`${q.state} ${q.stateError}`} role="alert">
        <span className={q.stateIcon} aria-hidden="true">⚠️</span><h2>{t('Could not load the question library', 'የጥያቄ ቤተ-መጻሕፍትን መጫን አልተቻለም')}</h2>
        <p>{loadError}</p><button type="button" onClick={() => void load()}>{t('Try again', 'እንደገና ሞክር')}</button></div>}
      {emptyLibrary && <div className={q.state}>
        <span className={q.stateIcon} aria-hidden="true">🌱</span><h2>{t('Your question library is empty', 'የጥያቄ ቤተ-መጻሕፍትዎ ባዶ ነው')}</h2>
        <p>{t('Create your first challenge from a game type above, or import several drafts at once from the Bulk Import tab.', 'ከላይ ካለ የጨዋታ አይነት የመጀመሪያ ፈተናዎን ይፍጠሩ፣ ወይም ከ“ብዙ ማስገባት” ትር ብዙ ረቂቆችን በአንድ ጊዜ ያስገቡ።')}</p>
        <button type="button" className={q.cta} onClick={() => setTab('import')}>{t('Go to Bulk Import', 'ወደ ብዙ ማስገባት ሂድ')}</button></div>}
      {!loading && !loadError && rows.length > 0 && !visible.length && <div className={q.state}>
        <span className={q.stateIcon} aria-hidden="true">🔍</span><h2>{t('No questions match these filters', 'ከማጣሪያዎቹ ጋር የሚዛመድ ጥያቄ የለም')}</h2>
        <p>{t('Try a different search or remove a filter.', 'ሌላ ፍለጋ ይሞክሩ ወይም ማጣሪያ ያስወግዱ።')}</p>
        <button type="button" onClick={clearFilters}>{t('Clear filters', 'ማጣሪያዎችን አጽዳ')}</button></div>}
      {!loading && !!visible.length && <div className={s.tableWrap}><table><caption className={q.visuallyHidden}>{t('Questions', 'ጥያቄዎች')}</caption>
        <thead><tr><th scope="col">{t('Question', 'ጥያቄ')}</th><th scope="col">{t('Game / category', 'ጨዋታ / ምድብ')}</th><th scope="col">{t('Level', 'ደረጃ')}</th><th scope="col">{t('Status', 'ሁኔታ')}</th><th scope="col">{t('Action', 'ተግባር')}</th></tr></thead>
        <tbody>{visible.map((row) => {
          const locales = Array.isArray(obj(row.payload).verifiedLocales) ? obj(row.payload).verifiedLocales as unknown[] : []
          return <tr key={row.id}>
            <td><div className={q.rowTitle}><strong>{questionLabel(row, uiLocale)}</strong><small>{row.stable_id}</small>
              <span className={q.langs}><span className={q.lang} data-on={locales.includes('en')}>EN</span><span className={q.lang} data-on={locales.includes('am')}>አማ</span></span></div></td>
            <td><div className={q.gameCell}><span aria-hidden="true">{GAME_INFO[row.game_type as QuestionGameType]?.icon}</span><div>{gameName(row.game_type, am)}<br /><small>{row.category}</small></div></div></td>
            <td>{row.difficulty}</td><td><Status value={row.status} /></td>
            <td><button type="button" onClick={() => open(row)} aria-label={`${t('Open', 'ክፈት')}: ${row.stable_id}`}>{t('Open', 'ክፈት')}</button></td></tr>
        })}</tbody></table></div>}
    </div>}

    {tab === 'import' && <div className={q.tabPanel} role="tabpanel" id={`${pickerId}-panel-import`} aria-labelledby={`${pickerId}-tab-import`}>
      <section className={`${s.card} ${q.editor}`} aria-label={t('Bulk import', 'ብዙ ጥያቄዎችን ማስገባት')}>
        <h2>{t('Bulk import drafts', 'ብዙ ረቂቆችን አስገባ')}</h2>
        <p className={s.muted}>{t('Paste a JSON array of question drafts. Preview all items. Import never publishes.', 'የጥያቄ ረቂቆችን JSON ዝርዝር ይለጥፉ። ሁሉንም ይመልከቱ። ማስገባት አያትምም።')}</p>
        <label>{t('Draft JSON', 'የረቂቅ JSON')}<textarea value={importText} onChange={(event) => { setImportText(event.target.value); setImportConfirmed(false) }} /></label>
        {!!preview.errors.length && <ul className={s.error} role="alert">{preview.errors.slice(0, 20).map((issue, index) => <li key={index}>{issue}</li>)}</ul>}
        {!!preview.items.length && <div className={q.editor}><h3>{t('Import preview', 'የማስገባት ቅድመ እይታ')} · {preview.items.length}</h3>
          <ul className={q.preview}>{preview.items.map((item) => <li key={item.stable_id}>{item.stable_id} · {item.game_type} · {item.category}</li>)}</ul>
          <label className={s.check}><input type="checkbox" checked={importConfirmed} onChange={(event) => setImportConfirmed(event.target.checked)} />{t('I reviewed the sources; these will remain drafts.', 'ምንጮቹን ገምግሜአለሁ፤ እነዚህ ረቂቅ ይቆያሉ።')}</label>
          <button type="button" disabled={!importConfirmed || busy} onClick={() => void importDrafts()}>{t('Import drafts', 'ረቂቆችን አስገባ')}</button></div>}
      </section>
    </div>}
  </div>
}
