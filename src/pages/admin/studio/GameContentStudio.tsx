import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, Navigate, useBlocker, useSearchParams } from 'react-router-dom'
import { useAuth } from '../../../lib/auth/useAuth'
import { useLocale } from '../../../lib/i18n/locale'
import { questionLibraryApi } from '../../../lib/play/questionLibraryService'
import { loadCompleteStaffQuestionInventory } from '../../../lib/play/staffQuestionInventory'
import { fetchStudioPassage } from '../../../lib/play/studioBibleSource'
import { questionTransitionAllowed, type EditorialRole, type QuestionStatus } from '../../../lib/play/questionLibrary'
import { duplicateStudioRecord, isHistoryTimeline, isQuizStudioGame, isServerStudioDraft, isStudioGame, newHistoryTimelineRecord, newStudioRecord, STUDIO_GAMES,
  studioStorage, toQuestionDraft, validateStudioDraft, verifyStudioVerse, type StudioGame, type StudioRecord } from '../../../lib/play/contentStudio'
import { Modal, Status } from '../AdminUi'
import { GameEditor } from './GameEditors'
import { StudioPreview } from './StudioPreview'
import { TextField } from './StudioFields'
import { StudioGameplayPreview } from './StudioGameplayPreview'
import { cardQuestionDraft } from '../../../lib/play/cardContent'
import { fromLibraryRow as fromQuestionRow, toStudioActivityDraft } from '../../../lib/play/studioActivity'
import { databasePlayEnabled } from '../../../lib/play/publishedContent'
import { GAME_MODES, GAME_MODE_IDS, gameInMode } from '../../../lib/play/gameModes'
import { recordFromBuiltIn, builtInContent } from '../../../lib/play/staticContent'
import { BuiltInSection, CampaignPanel, CoveragePanel, GameOverview, GameSettingsPanel, StudioTabs } from './StudioPanels'
import { STUDIO_VIEWS, type SavedCounts, type StudioView } from './studioViews'
import s from './Studio.module.css'

const statuses: QuestionStatus[] = ['draft', 'review', 'approved', 'rejected', 'published', 'archived']
const statusAm: Record<QuestionStatus, string> = { draft: 'ረቂቅ', review: 'በግምገማ ላይ', approved: 'ጸድቋል', rejected: 'ውድቅ ተደርጓል', published: 'ታትሟል', archived: 'በማህደር የተቀመጠ' }
const actionLabels: Record<QuestionStatus, string> = { draft: 'Return to draft / ወደ ረቂቅ መልስ', review: 'Submit for review / ለግምገማ አቅርብ', approved: 'Approve / አጽድቅ', rejected: 'Reject / ውድቅ አድርግ', published: 'Publish / አትም', archived: 'Archive / ማህደር አስገባ' }
const message = (cause: unknown) => cause instanceof Error ? cause.message : 'Studio operation failed.'
function sourceText(value: unknown): string {
  if (Array.isArray(value)) return value.map(sourceText).join(' ')
  if (!value || typeof value !== 'object') return ''
  const item = value as Record<string, unknown>
  const own = typeof item.route === 'string' && typeof item.label === 'string' ? `${item.route} ${item.label}` : ''
  return [own, ...Object.values(item).filter(child => child && typeof child === 'object').map(sourceText)].join(' ')
}
function download(record: StudioRecord) {
  const copy = structuredClone(record)
  delete copy.remoteId; copy.status = 'draft'; copy.owner = 'export'
  const url = URL.createObjectURL(new Blob([JSON.stringify({ version: 1, records: [copy] }, null, 2)], { type: 'application/json' }))
  const anchor = document.createElement('a'); anchor.href = url; anchor.download = `faith-challenges-${record.draft.game}-${record.id}.json`; anchor.click()
  window.setTimeout(() => URL.revokeObjectURL(url), 1000)
}
export function GameContentStudio() {
  const { profile, user } = useAuth()
  const [params] = useSearchParams()
  if (!profile || !user || !['editor', 'admin', 'super_admin'].includes(profile.role || '')) return <p role="alert">Staff access required / የሠራተኛ ፈቃድ ያስፈልጋል።</p>
  if (params.get('tab') === 'import') return <Navigate to="/admin/play/import" replace />
  return <StudioLibrary key={user.id} owner={user.id} role={profile.role as EditorialRole} />
}
function StudioLibrary({ owner, role }: { owner: string; role: EditorialRole }) {
  const { uiLocale } = useLocale()
  const am = uiLocale === 'am'
  const [params, setParams] = useSearchParams()
  const game = params.get('game')
  const mode = params.get('mode') || 'all'
  const validMode = mode === 'all' || GAME_MODE_IDS.some(id => id === mode)
  const itemId = params.get('item')
  const [records, setRecords] = useState<StudioRecord[]>([])
  const [deleted, setDeleted] = useState<StudioRecord[]>([])
  const [scratch, setScratch] = useState<StudioRecord | null>(null)
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(true)
  const [notice, setNotice] = useState('')
  const [refresh, setRefresh] = useState(0)
  const [creating, setCreating] = useState(false)
  const [creationGame, setCreationGame] = useState<StudioGame>('trivia')
  const [importItems, setImportItems] = useState<StudioRecord[]>([])
  const [importReviewed, setImportReviewed] = useState(false)
  const search = params.get('q') || ''
  const viewParam = params.get('view')
  const view: StudioView = STUDIO_VIEWS.some(tab => tab.id === viewParam) ? (viewParam as StudioView) : 'library'
  const filterStatus = params.get('status') || 'all'
  const sort = params.get('sort') || 'updated'
  const category = params.get('category') || 'all'
  const difficulty = params.get('difficulty') || 'all'
  const language = params.get('language') || 'all'
  const sourceFilter = params.get('source') || ''
  const page = Math.max(1, Number.parseInt(params.get('page') || '1', 10) || 1)
  const [selectedIds, setSelectedIds] = useState<string[]>([])
  const [bulkStatus, setBulkStatus] = useState<QuestionStatus>('review')
  const [bulkBusy, setBulkBusy] = useState(false)
  const contents = (record: StudioRecord) => Array.isArray(record.draft.content) ? record.draft.content : [record.draft.content]
  const savedCounts = useMemo<SavedCounts>(() => {
    const counts: SavedCounts = {}
    for (const record of records) { const entry = (counts[record.draft.game] ||= { server: 0, local: 0 }); if (record.remoteId) entry.server++; else entry.local++ }
    return counts
  }, [records])
  const categories = [...new Set([
    ...records.flatMap(record => contents(record).flatMap(content => 'category' in content ? [String(content.category)] : [])),
    ...(isStudioGame(game) ? builtInContent(game).flatMap(entry => entry.category ? [entry.category] : []) : []),
  ])].sort()
  useEffect(() => {
    let active = true
    async function load() {
      let local: StudioRecord[] = []
      try { const store = studioStorage(localStorage, owner, role); local = store.load(); if (active) setDeleted(store.deleted()) }
      catch (cause) { if (active) setError(message(cause)) }
      try {
        const remote: StudioRecord[] = []
        let incompatible = 0
        for (const row of (await loadCompleteStaffQuestionInventory()).rows) {
          try { const record = fromQuestionRow(row, owner); if (record) remote.push(record); else incompatible++ }
          catch { incompatible++ }
        }
        if (active) {
          setRecords([...local, ...remote])
          if (incompatible) setError(`${incompatible} server records need compatibility review in Advanced import & data tools. Nothing was changed.`)
        }
      } catch (cause) {
        if (active) { setRecords(local); setError(`Server library unavailable: ${message(cause)} Local copies are not server records.`) }
      } finally { if (active) setLoading(false) }
    }
    void load()
    return () => { active = false }
  }, [owner, role, refresh])
  function query(changes: Record<string, string | null>) {
    setSelectedIds([])
    const next = new URLSearchParams(params)
    for (const [key, value] of Object.entries(changes)) { if (value === null || value === '') next.delete(key); else next.set(key, value) }
    setParams(next)
  }
  function create(selected: StudioGame, copy?: StudioRecord) {
    setScratch(copy || newStudioRecord(selected, owner))
    query({ view: null, game: selected, item: 'new', seed: crypto.randomUUID(), format: copy && isHistoryTimeline(copy.draft) ? 'timeline' : null })
  }
  function saved(record: StudioRecord) {
    setNotice(`${record.remoteId ? 'Server content' : 'Local draft'} confirmed: ${record.status}. / ተረጋግጧል።`)
    setRecords(current => [...current.filter(item => item.id !== record.id), record])
    if (itemId !== record.id) query({ game: record.draft.game, item: record.id, seed: null })
  }
  function remove(record: StudioRecord): boolean {
    if (record.remoteId) { setError('Permanent server deletion is unavailable. Use authorized Archive or Unpublish in the editor.'); return false }
    if (!window.confirm('Delete this local draft? Saved drafts can be restored from Deleted local drafts. Unsaved edits will be discarded. Shared content and images are unchanged. / ይህ የአካባቢ ረቂቅ ይሰረዝ?')) return false
    try {
      const store = studioStorage(localStorage, owner, role)
      if (itemId !== 'new') store.remove(record.id)
      setDeleted(store.deleted()); setRecords(current => current.filter(item => item.id !== record.id)); setScratch(null)
      setNotice('Local draft deleted. Restore saved drafts below. / ረቂቁ ተሰርዟል፤ መመለስ ይቻላል።'); setError('')
      query({ item: null, seed: null, format: null }); return true
    } catch (cause) { setError(message(cause)); return false }
  }
  const initial = useMemo(() => {
    if (!isStudioGame(game)) return null
    if (itemId === 'new') {
      const chronology = game === 'history' && params.get('format') === 'timeline'
      return scratch?.draft.game === game && isHistoryTimeline(scratch.draft) === chronology ? scratch : chronology ? newHistoryTimelineRecord(owner) : newStudioRecord(game, owner)
    }
    return records.find(record => record.id === itemId && record.draft.game === game) || null
  }, [game, itemId, owner, records, scratch, params])
  const visible = records.filter(record => gameInMode(record.draft.game, mode) && (!game || record.draft.game === game) && (filterStatus === 'all' || record.status === filterStatus)
    && (category === 'all' || contents(record).some(content => 'category' in content && content.category === category))
    && (difficulty === 'all' || contents(record).some(content => 'difficulty' in content && content.difficulty === difficulty))
    && (language === 'all' || contents(record).every(content => 'verifiedLocales' in content && Array.isArray(content.verifiedLocales) && content.verifiedLocales.some(locale => locale === language)))
    && (!sourceFilter.trim() || sourceText(record.draft.content).toLocaleLowerCase().includes(sourceFilter.trim().toLocaleLowerCase()))
    && `${record.name} ${record.draft.game} ${JSON.stringify(record.draft.content)}`.toLocaleLowerCase().includes(search.toLocaleLowerCase()))
    .sort((a, b) => sort === 'name' ? a.name.localeCompare(b.name) : b.updatedAt.localeCompare(a.updatedAt))
  const pageCount = Math.max(1, Math.ceil(visible.length / 25))
  const currentPage = Math.min(page, pageCount)
  const pageRecords = visible.slice((currentPage - 1) * 25, currentPage * 25)
  const selectedRows = records.filter(record => record.remoteId && selectedIds.includes(record.remoteId))
  async function applyBulkReview() {
    if (bulkBusy || !selectedRows.length || selectedRows.some(record => !questionTransitionAllowed(record.status as QuestionStatus, bulkStatus, role))) return
    if (!window.confirm(`Apply ${bulkStatus} to ${selectedRows.length} selected server record(s)?`)) return
    setBulkBusy(true); setError(''); setNotice('')
    let completed = 0
    try {
      for (const record of selectedRows) {
        await questionLibraryApi.review(record.remoteId!, bulkStatus, '')
        const reopened = await questionLibraryApi.get(record.remoteId!)
        if (reopened.status !== bulkStatus) throw new Error(`${record.name}: server did not confirm ${bulkStatus}.`)
        completed++
      }
      setSelectedIds([]); setNotice(`${completed} server records confirmed as ${bulkStatus}.`); setRefresh(value => value + 1)
    } catch (cause) { setError(`${completed} of ${selectedRows.length} changed. ${message(cause)}`); setRefresh(value => value + 1) }
    finally { setBulkBusy(false) }
  }
  return <div className={s.studio} data-game-content-studio>
    <header className={s.header}><h1>{am ? 'የጨዋታ ይዘት ስቱዲዮ' : 'Game Content Studio'}</h1>
      {!itemId && <button type="button" className={s.createAction} onClick={() => { if (isStudioGame(game)) create(game); else { setCreationGame('trivia'); setCreating(true) } }}>{am ? 'ይዘት ፍጠር' : 'Create content'}</button>}
      <div className={s.actions}><Link to="/admin/play/import">{am ? 'የማስገቢያ መሣሪያዎች' : 'Advanced import & data tools'}</Link>
        {!itemId && <button type="button" disabled={loading} onClick={() => { setError(''); setLoading(true); setRefresh(value => value + 1) }}>{am ? 'አድስ' : 'Refresh'}</button>}</div></header>
    <div className={s.toolbar} aria-label={am ? 'የስቱዲዮ መቆጣጠሪያዎች' : 'Studio controls'}>
      {!itemId && <div className={s.searchField}><TextField label={am ? 'ይዘት ፈልግ' : 'Search content'} value={search} onChange={q => query({ q })} /></div>}
      <label className={s.field}>{am ? 'ጨዋታ' : 'Game'}<select data-game-selector value={game || 'all'} onChange={event => {
        const next = event.target.value
        query({ game: next === 'all' ? null : next, item: null, seed: null, format: null, mode: gameInMode(next, mode) ? mode : null })
      }}><option value="all">{am ? 'ሁሉም 12 ጨዋታዎች' : 'All 12 games'}</option>{STUDIO_GAMES.map(entry => <option key={entry.id} value={entry.id}>{am ? entry.am : entry.en}</option>)}</select></label>
      <label className={s.field}>{am ? 'ሁነታ' : 'Mode'}<select data-mode-selector value={mode} onChange={event => query({ mode: event.target.value === 'all' ? null : event.target.value, game: null, item: null, seed: null, format: null })}>
        <option value="all">{am ? 'ሁሉም ሁነታዎች' : 'All modes'}</option>{GAME_MODES.map(entry => <option key={entry.id} value={entry.id}>{am ? entry.am : entry.en}</option>)}
      </select></label>
      {!itemId && <label className={`${s.field} ${s.statusField}`}>{am ? 'ሁኔታ' : 'Status'}<select value={filterStatus} onChange={event => query({ status: event.target.value === 'all' ? null : event.target.value })}>
        <option value="all">{am ? 'ሁሉም ሁኔታዎች' : 'All statuses'}</option>{statuses.map(status => <option key={status} value={status}>{am ? statusAm[status] : status}{!loading ? ` (${records.filter(record => record.status === status && gameInMode(record.draft.game, mode)).length})` : ''}</option>)}
      </select></label>}
    </div>
    {!itemId && <StudioTabs view={view} am={am} onChange={next => query({ view: next === 'library' ? null : next, item: null, seed: null, format: null })} />}
    {!validMode && <p role="alert">Unknown mode. Choose a mode above. / ሁነታው አልተገኘም።</p>}
    {error && <p role="alert" className={s.error}>{error}</p>}
    {notice && <p role="status">{notice}</p>}
    {game && !isStudioGame(game) && <p role="alert">Unknown game. Select one of the twelve libraries. / ጨዋታው አልተገኘም።</p>}
    {view === 'library' && isStudioGame(game) && <div className={s.actions}>
      {!itemId && game === 'history' && <button type="button" onClick={() => create('history', newHistoryTimelineRecord(owner))}>New local chronology / አዲስ የክስተት ቅደም ተከተል</button>}
      {itemId ? <button type="button" onClick={() => query({ item: null, seed: null })}>Library / ቤተ-መጻሕፍት</button>
        : <small>{isQuizStudioGame(game) ? (am ? 'የአገልጋይ ግምገማ ሂደት' : 'Server editorial workflow') : (am ? 'የአካባቢ ረቂቅ · ህትመት ታግዷል' : 'Local drafts · publication blocked')}</small>}</div>}
    {itemId && initial ? <StudioEditor key={`${game}:${itemId}:${params.get('seed') || ''}:${params.get('format') || ''}`} initial={initial} isSaved={itemId !== 'new'} role={role} onSaved={saved} onDelete={remove} onDuplicate={copy => create(copy.draft.game, copy)} /> : itemId && !loading ? <p role="alert">Draft not found in your authorized library. Unsaved new drafts do not survive refresh. / ረቂቁ አልተገኘም።</p> : null}
    {!itemId && view === 'settings' && <GameSettingsPanel key={`settings:${game || ''}`} owner={owner} role={role} am={am} initialGame={game} onOpenGame={next => query({ view: null, game: next })} />}
    {!itemId && view === 'coverage' && <CoveragePanel am={am} onOpen={target => query({ view: target.view && target.view !== 'library' ? target.view : null, game: target.game ?? null })} />}
    {!itemId && view === 'campaign' && <CampaignPanel owner={owner} am={am} />}
    {!itemId && view === 'library' && <section className={s.librarySection} aria-label="Content library">
      {!game && <details><summary>{am ? 'ነባር ጨዋታዎችና ምንጮች' : 'Browse existing games and their sources'}</summary><GameOverview am={am} saved={savedCounts} mode={mode} onOpen={next => query({ game: next })} /></details>}
      <details open={category !== 'all' || difficulty !== 'all' || language !== 'all' || !!sourceFilter}><summary>More filters / ተጨማሪ ማጣሪያዎች</summary><div className={s.columns}>
        <label className={s.field}>Sort / ደርድር<select value={sort} onChange={event => query({ sort: event.target.value })}><option value="updated">Updated / የተሻሻለ</option><option value="name">Name / ስም</option></select></label>
        <label className={s.field}>Category / ምድብ<select value={category} onChange={event => query({ category: event.target.value })}><option value="all">All / ሁሉም</option>{categories.map(item => <option key={item}>{item}</option>)}</select></label>
        <label className={s.field}>Difficulty / ደረጃ<select value={difficulty} onChange={event => query({ difficulty: event.target.value })}><option value="all">All / ሁሉም</option>{['beginner', 'growing', 'challenge'].map(item => <option key={item}>{item}</option>)}</select></label>
        <label className={s.field}>Language / ቋንቋ<select value={language} onChange={event => query({ language: event.target.value })}><option value="all">All / ሁሉም</option><option value="en">English</option><option value="am">አማርኛ</option></select></label>
        <TextField label="Source reference" value={sourceFilter} onChange={value => query({ source: value, page: null })} />
      </div></details>
      {!loading && <p className={s.libraryCount} role="status">{visible.length} {am ? 'የሚታዩ መዝገቦች' : 'records shown'} · {error ? (am ? 'ከፊል ዝርዝር' : 'partial library') : (am ? 'የተጫኑ መዝገቦች ብቻ' : 'loaded records only')}</p>}
      {!!pageRecords.some(record => record.remoteId) && <div className={s.actions} aria-label="Bulk editorial review">
        <label><input type="checkbox" disabled={bulkBusy} checked={pageRecords.filter(record => record.remoteId).every(record => selectedIds.includes(record.remoteId!))} onChange={event => setSelectedIds(event.target.checked ? [...new Set([...selectedIds, ...pageRecords.flatMap(record => record.remoteId ? [record.remoteId] : [])])] : selectedIds.filter(id => !pageRecords.some(record => record.remoteId === id)))} /> Select server records on this page</label>
        <label className={s.field}>Review action<select value={bulkStatus} onChange={event => setBulkStatus(event.target.value as QuestionStatus)}>{statuses.map(status => <option key={status} value={status}>{status}</option>)}</select></label>
        <button type="button" disabled={bulkBusy || !selectedRows.length || selectedRows.some(record => !questionTransitionAllowed(record.status as QuestionStatus, bulkStatus, role))} onClick={() => void applyBulkReview()}>Apply to {selectedRows.length} selected</button>
      </div>}
      {loading ? <p role="status">Loading authorized library… / በመጫን ላይ…</p> : !visible.length ? <p>No saved content matches. Choose a game to create a draft. / ረቂቅ የለም።</p> : <ul className={s.library}>{pageRecords.map(record => <li key={`${record.remoteId ? 'server' : 'local'}:${record.id}`}>
        {record.remoteId && <label><input type="checkbox" aria-label={`Select ${record.name}`} disabled={bulkBusy} checked={selectedIds.includes(record.remoteId)} onChange={event => setSelectedIds(current => event.target.checked ? [...new Set([...current, record.remoteId!])] : current.filter(id => id !== record.remoteId))} /> Select</label>}
        <Link to={`?game=${record.draft.game}&item=${record.id}`}>{record.name}</Link>
        <Status value={record.status} /><small>{record.remoteId ? 'Supabase' : 'Local browser'} · {record.draft.game}</small>
        {record.remoteId ? <Link to={`?game=${record.draft.game}&item=${record.id}`}>Archive / Unpublish · ማህደር</Link>
          : <button type="button" onClick={() => remove(record)}>Delete / ሰርዝ</button>}</li>)}</ul>}
      {visible.length > 25 && <nav className={s.actions} aria-label="Question Library pages"><button type="button" disabled={currentPage <= 1} onClick={() => query({ page: String(currentPage - 1) })}>Previous</button><span role="status">Page {currentPage} of {pageCount}</span><button type="button" disabled={currentPage >= pageCount} onClick={() => query({ page: String(currentPage + 1) })}>Next</button></nav>}
      {!!deleted.length && <details><summary>Deleted local drafts / የተሰረዙ ረቂቆች ({deleted.length})</summary>
        <p>Recovery copies stay in this browser only. Clearing browser data removes them. / ቅጂዎቹ በዚህ አሳሽ ብቻ ይቀመጣሉ።</p>
        <ul className={s.library}>{deleted.map(record => <li key={record.id}>{record.name}<button type="button" onClick={() => {
          try { const store = studioStorage(localStorage, owner, role); const restored = store.restore(record.id); setDeleted(store.deleted()); setRecords(current => [...current, restored]); setError(''); setNotice('Local draft restored. / ረቂቁ ተመልሷል።') }
          catch (cause) { setError(message(cause)) }
        }}>Restore deleted draft / ረቂቅ መልስ</button></li>)}</ul>
      </details>}
      {isStudioGame(game) && <BuiltInSection game={game} am={am} filters={{ search, category, difficulty, language }} onOpen={itemKey => {
        const copy = recordFromBuiltIn(game, itemKey, owner)
        if (!copy) { setError('This item cannot be opened as an editable copy.'); return }
        setError(''); create(game, copy)
      }} />}
      <details><summary>Import local draft exports / የአካባቢ ረቂቆችን አስገባ</summary><p>Validated preview only until you confirm. Imports always create new local drafts; never approve or publish. / ማስገባት አያትምም።</p>
        <label className={s.field}>Studio export file / ፋይል<input type="file" accept="application/json,.json" onChange={event => {
          const file = event.target.files?.[0]; setImportItems([]); setImportReviewed(false)
          if (!file) return
          if (file.size > 1000000) { setError('Import exceeds 1 MB.'); return }
          void file.text().then(raw => {
            const envelope: unknown = JSON.parse(raw)
            if (!envelope || typeof envelope !== 'object' || !('version' in envelope) || envelope.version !== 1 || !('records' in envelope) || !Array.isArray(envelope.records) || !envelope.records.length || envelope.records.length > 20) throw new Error('Use a version 1 studio export containing 1–20 drafts.')
            const next: StudioRecord[] = []
            for (const record of envelope.records) {
              const issues = validateStudioDraft(record?.draft, { allowMissingImages: true })
              if (issues.length || typeof record.name !== 'string' || !record.name.trim()) throw new Error(issues.join(' ') || 'Draft label required.')
              const copy = duplicateStudioRecord({ ...record, owner }, crypto.randomUUID()); copy.version = 1; next.push(copy)
            }
            setImportItems(next); setError('')
          }).catch(cause => setError(message(cause)))
        }} /></label>
        {!!importItems.length && <><ul>{importItems.map(record => <li key={record.id}>{record.name} · {record.draft.game} · draft</li>)}</ul>
          <label><input type="checkbox" checked={importReviewed} onChange={event => setImportReviewed(event.target.checked)} /> I reviewed these sources and drafts / ምንጮቹን ገምግሜአለሁ</label>
          <button type="button" disabled={!importReviewed} onClick={() => {
            try {
              const store = studioStorage(localStorage, owner, role)
              let count = 0
              try { for (const record of importItems) { store.save(record); count++ } }
              catch (cause) { throw new Error(`Imported ${count} of ${importItems.length} local drafts. ${message(cause)}`) }
              setRecords(current => [...current, ...importItems]); setImportItems([]); setImportReviewed(false); setError('')
            } catch (cause) { setError(message(cause)) }
          }}>Import as local drafts / እንደ ረቂቅ አስገባ</button></>}
      </details>
      <details><summary>Storage &amp; publication help / የማከማቻና ህትመት እገዛ</summary><p>Four quiz formats use the existing server editorial workflow. Other formats have an opt-in database-only adapter prepared for staging; shared activity drafts require approved schema support and publication remains blocked. Local browser drafts are not a secure vault or cross-device backup; export before clearing browser data. / የጋራ ረቂቆች የአገልጋይ ድጋፍ ያስፈልጋቸዋል፤ ህትመት ታግዷል።</p></details>
    </section>}
    {creating && <Modal title={am ? 'ጨዋታ ይምረጡ' : 'Choose a game'} close={() => setCreating(false)}>
      <p>Choose a game, edit its content, try the preview, then save for review. / ጨዋታ ይምረጡ፣ ያርትዑ፣ ቅድመ እይታውን ይመልከቱ።</p>
      <div className={s.field}><label htmlFor="studio-create-game">Game to create / ጨዋታ</label><select id="studio-create-game" value={creationGame} onChange={event => { if (isStudioGame(event.target.value)) setCreationGame(event.target.value) }}>{STUDIO_GAMES.map(entry => <option key={entry.id} value={entry.id}>{am ? entry.am : entry.en}</option>)}</select></div>
      <button type="button" onClick={() => { setCreating(false); create(creationGame) }}>{am ? 'አርትዖት ጀምር' : 'Start editing'}</button>
    </Modal>}
  </div>
}
function StudioEditor({ initial, isSaved, role, onSaved, onDelete, onDuplicate }: { initial: StudioRecord; isSaved: boolean; role: EditorialRole; onSaved: (record: StudioRecord) => void; onDelete: (record: StudioRecord) => boolean; onDuplicate: (record: StudioRecord) => void }) {
  const { uiLocale } = useLocale()
  const [record, setRecord] = useState(() => structuredClone(initial))
  const [baseline, setBaseline] = useState(() => JSON.stringify(initial))
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [busy, setBusy] = useState(false)
  const [preview, setPreview] = useState(true)
  const [mobilePanel, setMobilePanel] = useState<'edit' | 'preview'>('edit')
  const [gameplay, setGameplay] = useState<StudioRecord | null>(null)
  const [locale, setLocale] = useState<'en' | 'am'>(uiLocale === 'am' ? 'am' : 'en')
  const bypass = useRef(false)
  const heading = useRef<HTMLHeadingElement>(null)
  const dirty = JSON.stringify(record) !== baseline
  const blocked = useBlocker(() => !bypass.current && (dirty || busy))
  const issues = useMemo(() => [...validateStudioDraft(record.draft), ...(record.remoteId && !record.stableId && record.draft.game === 'match' && record.draft.content.length !== 1 ? ['A server Match row stores one pair. Save collections locally; do not overwrite a row with an array.'] : [])], [record.draft, record.remoteId, record.stableId])
  const saveIssues = record.remoteId ? issues : validateStudioDraft(record.draft, { allowMissingImages: true })
  const connected = !!record.remoteId || isServerStudioDraft(record.draft)
  const cardAdapter = record.draft.game === 'who-am-i' || record.draft.game === 'match'
  const locked = record.status !== 'draft'
  useEffect(() => { heading.current?.focus() }, [])
  useEffect(() => {
    const prevent = (event: BeforeUnloadEvent) => { if (dirty || busy) { event.preventDefault(); event.returnValue = '' } }
    window.addEventListener('beforeunload', prevent); return () => window.removeEventListener('beforeunload', prevent)
  }, [dirty, busy])
  async function save() {
    if (busy || locked || saveIssues.length) return
    setBusy(true); setError(''); setSuccess('')
    try {
      let next: StudioRecord
      if (connected) {
        const draft = record.stableId ? toStudioActivityDraft(record) : record.draft.game === 'who-am-i' ? cardQuestionDraft('who-am-i', record.draft.content)
          : record.draft.game === 'match' ? cardQuestionDraft('match', record.draft.content[0]) : toQuestionDraft(record.draft)
        const saved = await questionLibraryApi.save(draft, record.remoteId)
        const reopened = await questionLibraryApi.get(saved.id)
        if (reopened.status !== 'draft' || reopened.stable_id !== draft.stable_id || JSON.stringify(reopened.payload) !== JSON.stringify(saved.payload)) throw new Error('Saved content did not match the reopened server draft.')
        next = fromQuestionRow(reopened, record.owner)!
      } else {
        next = { ...record, updatedAt: new Date().toISOString() }
        const store = studioStorage(localStorage, record.owner, role); store.save(next)
        const reopened = store.load().find(item => item.id === next.id)
        if (!reopened || JSON.stringify(reopened) !== JSON.stringify(next)) throw new Error('The local draft could not be reopened.')
      }
      setRecord(next); setBaseline(JSON.stringify(next)); bypass.current = true
      onSaved(next); setSuccess(connected ? 'Server draft saved and reopened. / ረቂቁ ተቀምጧል።' : 'Local draft saved and reopened. Publication remains blocked. / የአካባቢ ረቂቅ ተቀምጧል።')
    } catch (cause) { setError(message(cause)) }
    finally { bypass.current = false; setBusy(false) }
  }
  async function testSavedGameplay() {
    if (busy || dirty || !isSaved || !cardAdapter) return
    setBusy(true); setError('')
    try {
      const reopened = record.remoteId ? fromQuestionRow(await questionLibraryApi.get(record.remoteId), record.owner)
        : studioStorage(localStorage, record.owner, role).load().find(item => item.id === record.id)
      if (!reopened || validateStudioDraft(reopened.draft).length || JSON.stringify(reopened.draft) !== JSON.stringify(record.draft)) throw new Error('Save and reload the validated draft before testing gameplay.')
      setPreview(false); setGameplay(reopened)
    } catch (cause) { setError(message(cause)) }
    finally { setBusy(false) }
  }
  async function saveSharedDraft() {
    if (busy || dirty || !isSaved || record.remoteId || issues.length || !databasePlayEnabled()) return
    setBusy(true); setError(''); setSuccess('')
    try {
      const draft = toStudioActivityDraft(record)
      const saved = await questionLibraryApi.save(draft)
      const reopened = await questionLibraryApi.get(saved.id)
      if (reopened.status !== 'draft' || reopened.stable_id !== draft.stable_id || JSON.stringify(reopened.payload) !== JSON.stringify(draft.payload)) throw new Error('The shared activity draft could not be verified.')
      const next = fromQuestionRow(reopened, record.owner)
      if (!next) throw new Error('The saved activity format is unsupported.')
      setRecord(next); setBaseline(JSON.stringify(next)); bypass.current = true; onSaved(next)
    } catch (cause) { setError(message(cause)) }
    finally { bypass.current = false; setBusy(false) }
  }
  async function transition(status: QuestionStatus) {
    if (busy || dirty) { setError('Save or discard edits before changing status.'); return }
    if (['review', 'approved', 'published'].includes(status) && issues.length) { setError(issues.join(' ')); return }
    if (!window.confirm(`${status === 'draft' && record.status === 'published' ? 'Unpublish and return to draft' : `Move to ${status}`}? / ሁኔታውን ይቀይሩ?`)) return
    setBusy(true); setError(''); setSuccess('')
    try {
      let next: StudioRecord
      if (record.remoteId) {
        if (status === 'published') await verifyStudioVerse(record.draft, fetchStudioPassage)
        await questionLibraryApi.review(record.remoteId, status, '')
        const reopened = await questionLibraryApi.get(record.remoteId)
        if (reopened.status !== status || (status === 'published' && !reopened.published_at)) throw new Error('The server did not confirm the requested status.')
        next = fromQuestionRow(reopened, record.owner)!
      } else {
        if (!['draft', 'archived'].includes(status)) throw new Error('Local formats cannot be reviewed or published.')
        next = { ...record, status, updatedAt: new Date().toISOString() }; studioStorage(localStorage, record.owner, role).save(next)
      }
      setRecord(next); setBaseline(JSON.stringify(next)); onSaved(next); setSuccess(`Status confirmed: ${status}`)
    } catch (cause) { setError(message(cause)) }
    finally { setBusy(false) }
  }
  return <section className={s.editor} aria-label="Dedicated game editor">
    <p className={s.hint}>{connected ? 'Shared library / የጋራ ቤተ-መጻሕፍት' : 'Storage: this browser only / በዚህ አሳሽ ብቻ'} · {record.status === 'draft' ? 'Draft · not published / ረቂቅ · አልታተመም' : record.status}</p>
    <header className={s.header}><div><h2 ref={heading} tabIndex={-1}>{record.name}</h2><Status value={record.status} /> {dirty && <span>● Unsaved changes / ያልተቀመጡ ለውጦች</span>}</div>
      <div className={s.actions}><button type="button" disabled={busy || locked || !!saveIssues.length} onClick={() => void save()}>Save draft / ረቂቅ አስቀምጥ</button>
        <button type="button" disabled={busy} onClick={() => { if (!dirty || window.confirm('Duplicate these unsaved edits as a new draft?')) { bypass.current = true; onDuplicate(duplicateStudioRecord(record)) } }}>Duplicate draft / ረቂቅ ቅዳ</button>
        <button type="button" disabled={!!saveIssues.length} onClick={() => download(record)}>Export draft / ረቂቅ ላክ</button>
        <button type="button" disabled={!!issues.length} onClick={() => { setGameplay(null); setPreview(true); setMobilePanel('preview') }}>Playable preview / ቅድመ እይታ</button>
        {cardAdapter && <button type="button" disabled={!isSaved || dirty || busy || !!issues.length} onClick={() => void testSavedGameplay()}>Test saved gameplay / የተቀመጠውን ጨዋታ ሞክር</button>}
        <button type="button" disabled={busy || !!record.remoteId} onClick={() => { bypass.current = true; if (!onDelete(record)) bypass.current = false }}>Delete / ሰርዝ</button></div></header>
    {!connected && <div className={s.actions}><button type="button" disabled={busy || dirty || !isSaved || !!issues.length || !databasePlayEnabled()} onClick={() => void saveSharedDraft()}>Save shared activity draft / የጋራ ረቂቅ አስቀምጥ</button>
      <small>Requires the separately approved activity schema and database-only staging configuration. Always Draft; publication is blocked. The local copy is retained. / የአገልጋይ ድጋፍ ያስፈልጋል፤ ህትመት ታግዷል።</small></div>}
    {dirty && !busy && <button type="button" onClick={() => {
      if (window.confirm('Undo all unsaved changes? / ያልተቀመጡ ለውጦችን ይመልሱ?')) { setRecord(JSON.parse(baseline) as StudioRecord); setError(''); setSuccess('') }
    }}>Undo unsaved changes / ያልተቀመጡ ለውጦችን መልስ</button>}
    {record.remoteId && <p className={s.hint}>Permanent server deletion is unavailable. Use Archive or Unpublish below; shared images and questions are preserved. / ከአገልጋዩ መሰረዝ አይቻልም፤ የማህደር ወይም የህትመት ማስወገጃ እርምጃ ይጠቀሙ።</p>}
    {record.stableId && <p className={s.notice}>Shared activity draft. Publishing is blocked until the activity database validators and permissions pass staging verification. / ህትመት በማረጋገጥ ላይ ነው።</p>}
    {(!connected || cardAdapter) && <p className={s.notice}>{cardAdapter ? 'Gameplay reader/test ready. New copies save locally; existing server card drafts can be edited here. Publication remains blocked pending verified database support. / የጨዋታ ሙከራ ዝግጁ ነው፤ ህትመት ታግዷል።' : 'Local draft. The database-only reader is prepared for staging; shared draft saving needs approved schema support. Publication remains blocked for every role. / የአካባቢ ረቂቅ፤ የአገልጋይ ድጋፍ ያስፈልጋል፤ ህትመት ታግዷል።'}</p>}
    {locked && <p className={s.notice}>Content is locked outside Draft. Duplicate to prepare a new version without replacing published content. Returning a published record to Draft explicitly unpublishes it. / ከረቂቅ ውጭ አርትዖት ታግዷል።</p>}
    {error && <p role="alert" className={s.error}>{error}</p>}{success && <p role="status">{success}</p>}
    {!!issues.length && <section className={s.error} aria-label="Validation errors"><strong>{saveIssues.length ? 'Fix before saving / ከማስቀመጥ በፊት ያስተካክሉ' : 'Draft can be saved. Replace missing images before gameplay or publication. / ረቂቁን ማስቀመጥ ይቻላል።'}</strong><ul>{issues.map((issue, index) => <li key={index}>{issue}</li>)}</ul></section>}
    <p className={s.hint}>{uiLocale === 'am' ? 'ይዘቱን ያርትዑ፣ ቅድመ እይታውን ይመልከቱ፣ ከዚያ እንደ ረቂቅ ያስቀምጡ። ማስቀመጥ አያትምም።' : 'Edit your content, try the preview, then save. Saving keeps a draft; it does not publish your changes.'}</p>
    <div className={s.mobileTabs} role="tablist" aria-label="Editing workspace">
      {(['edit', 'preview'] as const).map(panel => <button key={panel} type="button" role="tab" id={`studio-${panel}-tab`} aria-controls={`studio-${panel}-panel`} aria-selected={mobilePanel === panel} tabIndex={mobilePanel === panel ? 0 : -1} onClick={() => { setPreview(true); setMobilePanel(panel) }} onKeyDown={event => {
        if (['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) {
          event.preventDefault(); const next = event.key === 'Home' ? 'edit' : event.key === 'End' ? 'preview' : panel === 'edit' ? 'preview' : 'edit'
          setPreview(true); setMobilePanel(next); document.getElementById(`studio-${next}-tab`)?.focus()
        }
      }}>{panel === 'edit' ? (uiLocale === 'am' ? 'አርትዕ' : 'Edit') : (uiLocale === 'am' ? 'ቅድመ እይታ' : 'Preview')}</button>)}
    </div>
    <div className={preview ? s.workspace : ''} data-mobile-panel={mobilePanel}><fieldset id="studio-edit-panel" aria-labelledby="studio-edit-tab" disabled={locked || busy} className={s.form}>
      {(!connected || record.stableId) && <>
        <TextField label="Activity category / የፈተና ምድብ" value={record.category ?? record.draft.game} onChange={category => setRecord({ ...record, category })} required />
        <TextField label="Activity display order / ቅደም ተከተል" type="number" value={String(record.sortOrder ?? 0)} onChange={value => setRecord({ ...record, sortOrder: Number(value) })} />
        <label className={s.field}>Activity difficulty / ደረጃ<select value={record.difficulty || 'beginner'} onChange={event => setRecord({ ...record, difficulty: event.target.value as StudioRecord['difficulty'] })}>{['beginner', 'growing', 'challenge'].map(level => <option key={level}>{level}</option>)}</select></label>
        <label><input type="checkbox" checked={!!record.reviewedAmharic} onChange={event => setRecord({ ...record, reviewedAmharic: event.target.checked })} /> All activity Amharic fields reviewed / የአማርኛ ጽሑፎች ተገምግመዋል</label>
      </>}
      {!connected && <TextField label="Local draft label / የረቂቅ ስም" value={record.name} onChange={name => setRecord({ ...record, name })} />}
      <GameEditor draft={record.draft} onChange={draft => { setRecord({ ...record, draft }); setSuccess('') }} />
    </fieldset>{preview && <aside id="studio-preview-panel" aria-labelledby="studio-preview-tab"><label className={s.field}>Preview language / ቋንቋ<select value={locale} onChange={event => setLocale(event.target.value as 'en' | 'am')}><option value="en">English</option><option value="am">አማርኛ</option></select></label>
      {saveIssues.length > 0 ? <p role="status">Complete the fields listed above to try this preview. / ቅድመ እይታውን ለማየት የተጠቆሙትን መስኮች ያስተካክሉ።</p> :
      <StudioPreview key={`${JSON.stringify(record.draft)}:${locale}`} draft={record.draft} locale={locale} />}</aside>}</div>
    {gameplay && !dirty && <div className={s.group}><label className={s.field}>Gameplay test language / የሙከራ ቋንቋ<select value={locale} onChange={event => setLocale(event.target.value as 'en' | 'am')}><option value="en">English</option><option value="am">አማርኛ</option></select></label><StudioGameplayPreview key={`${gameplay.id}:${locale}`} draft={gameplay.draft} locale={locale} /><button type="button" onClick={() => setGameplay(null)}>Close gameplay test / ሙከራውን ዝጋ</button></div>}
    <section className={s.group} aria-label="Editorial workflow"><h3>Editorial workflow / የግምገማ ሂደት</h3><p>Draft → Review → Approved → Published · Review → Rejected → Draft · Published → Archived/Draft · Archived → Draft</p>
      <div className={s.actions}>{record.remoteId ? statuses.filter(status => (!(cardAdapter || record.stableId) || status !== 'published') && questionTransitionAllowed(record.status, status, role)).map(status => <button type="button" key={status} disabled={busy || dirty || (['review', 'approved', 'published'].includes(status) && !!issues.length)} onClick={() => void transition(status)}>{status === 'draft' && record.status === 'published' ? 'Unpublish to draft / ህትመት አስወግድ' : actionLabels[status]}</button>)
        : <button type="button" disabled={busy || dirty || !isSaved || !!saveIssues.length} onClick={() => void transition(record.status === 'archived' ? 'draft' : 'archived')}>{record.status === 'archived' ? 'Restore local draft' : 'Archive local draft'} / የአካባቢ ረቂቅ</button>}</div>
      <details><summary>Publishing availability / የህትመት መረጃ</summary><p>Server authorization and six-state constraints still require verified staging evidence. UI tests are not proof of deployed RLS. / የአገልጋይ ፈቃዶች በማረጋገጥ ላይ ናቸው።</p></details>
    </section>
    {blocked.state === 'blocked' && <Modal title="Leave without saving? / ሳያስቀምጡ ይውጡ?" close={() => blocked.reset()}><p>Unsaved edits will be lost. / ያልተቀመጡ ለውጦች ይጠፋሉ።</p><div className={s.actions}>
      <button type="button" onClick={() => blocked.reset()}>Keep editing / አርትዖቱን ቀጥል</button><button type="button" disabled={busy} onClick={() => blocked.proceed()}>Discard changes / ለውጦችን አስወግድ</button></div></Modal>}
  </section>
}
