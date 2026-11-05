import { useDeferredValue, useMemo, useState, type ChangeEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../../lib/mezmur/taxonomyAliases.ts'
import {
  activeEvents, canReview, catalogSummary, createEditorialSearchIndex, makeReviewEvent, previewBulkCategory, reviewStatus,
  rollbackGroup, searchEditorialRows, validateAudit, validateCatalog,
  type EditorialCatalog, type ReviewDecision, type ReviewEvent, type ReviewKind,
} from '../../lib/mezmur/editorialReview.ts'
import s from './MezmurEditorialStudio.module.css'

function download(name: string, value: unknown) {
  const url = URL.createObjectURL(new Blob([JSON.stringify(value, null, 2) + '\n'], { type: 'application/json' }))
  const anchor = document.createElement('a')
  anchor.href = url; anchor.download = name; anchor.click()
  window.setTimeout(() => URL.revokeObjectURL(url), 1000)
}
function storageKey(id: string, sha: string) { return `td_mezmur_editorial_v1:${id}:${sha}` }
function readEvents(key: string, catalog: EditorialCatalog): ReviewEvent[] {
  try { const events: unknown = JSON.parse(localStorage.getItem(key) || '[]')
    return validateAudit({ schema: 'mezmur-editorial-audit-v1', sourceSha256: catalog.sourceSha256, events }, catalog) }
  catch { return [] }
}
function highlightedLyrics(text: string, excerpts: string[]) {
  const selected = excerpts.filter(Boolean).sort((a, b) => b.length - a.length)
  if (!selected.length) return text
  const parts: (string | { text: string; start: number })[] = []
  let index = 0
  while (index < text.length) {
    const match = selected.map(value => ({ value, at: text.indexOf(value, index) })).filter(item => item.at >= 0)
      .sort((a, b) => a.at - b.at || b.value.length - a.value.length)[0]
    if (!match) { parts.push(text.slice(index)); break }
    if (match.at > index) parts.push(text.slice(index, match.at))
    parts.push({ text: match.value, start: match.at })
    index = match.at + match.value.length
  }
  return parts.map((part, i) => typeof part === 'string' ? part : <mark key={`${part.start}-${i}`}>{part.text}</mark>)
}

export function MezmurEditorialStudio() {
  const { profile } = useAuth()
  const authorized = canReview(profile?.role)
  const [catalog, setCatalog] = useState<EditorialCatalog | null>(null)
  const [events, setEvents] = useState<ReviewEvent[]>([])
  const [selectedId, setSelectedId] = useState('')
  const [query, setQuery] = useState('')
  const [status, setStatus] = useState('all')
  const [kind, setKind] = useState<ReviewKind>('category')
  const [choice, setChoice] = useState('')
  const [note, setNote] = useState('')
  const [selectedIds, setSelectedIds] = useState<string[]>([])
  const [bulkPreview, setBulkPreview] = useState(false)
  const [lastGroup, setLastGroup] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const deferredQuery = useDeferredValue(query)
  const latest = useMemo(() => activeEvents(events), [events])
  const summary = useMemo(() => catalog ? catalogSummary(catalog, events) : null, [catalog, events])
  const searchIndex = useMemo(() => catalog ? createEditorialSearchIndex(catalog.rows) : undefined, [catalog])
  const filtered = useMemo(() => {
    if (!catalog) return []
    return searchEditorialRows(catalog.rows, deferredQuery, searchIndex).filter(row => status === 'all' ||
      (status === 'semantic' && row.semanticReviewed && reviewStatus(row, latest, kind) === 'unresolved') ||
      (status === 'model' && Boolean(row.modelCategorySlug)) ||
      (status === 'conflict' && row.conflict) ||
      (status === 'duplicates' && row.possibleDuplicate) ||
      reviewStatus(row, latest, kind) === status)
  }, [catalog, deferredQuery, searchIndex, status, kind, latest])
  const row = filtered.find(item => item.importId === selectedId) || filtered[0]
  const current = row && latest.get(`${row.importId}:${kind}`)
  const preview = catalog ? previewBulkCategory(catalog, selectedIds, events) : null

  function save(next: ReviewEvent[]) {
    if (!catalog || !profile?.id) return
    try { localStorage.setItem(storageKey(profile.id, catalog.sourceSha256), JSON.stringify(next)); setEvents(next); setError('') }
    catch { setError('Browser storage is full. Export the current review log before continuing.') }
  }
  async function loadFile(event: ChangeEvent<HTMLInputElement>) {
    const file = event.target.files?.[0]
    if (!file) return
    setBusy(true); setError('')
    try {
      if (file.size > 20 * 1024 * 1024) throw new Error('Catalog is too large.')
      const input: unknown = JSON.parse(await file.text())
      const value = validateCatalog(input)
      setCatalog(value); setEvents(readEvents(storageKey(profile?.id || '', value.sourceSha256), value))
      setSelectedId(value.rows.find(item => item.semanticReviewed)?.importId || value.rows[0].importId)
      setSelectedIds([]); setBulkPreview(false)
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Could not load the catalog.') }
    finally { setBusy(false) }
  }
  async function restoreAudit(event: ChangeEvent<HTMLInputElement>) {
    const file = event.target.files?.[0]
    if (!file || !catalog || !profile?.id) return
    try {
      const input: unknown = JSON.parse(await file.text())
      const recovered = validateAudit(input, catalog)
      if (events.length && !window.confirm('Replace this browser’s current local review log with the selected audit export?')) return
      save(recovered)
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Could not restore audit log.') }
  }
  function decide(decision: Exclude<ReviewDecision, 'rollback'>) {
    if (!catalog || !row || !profile?.id) return
    try {
      const event = makeReviewEvent({ catalog, row, events, role: profile.role, reviewerId: profile.id,
        kind, decision, selectedValue: choice, note })
      save([...events, event]); setNote(''); setChoice('')
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Review could not be recorded.') }
  }
  function nextUnresolved() {
    if (!catalog) return
    const start = catalog.rows.findIndex(item => item.importId === row?.importId)
    const next = [...catalog.rows.slice(start + 1), ...catalog.rows.slice(0, start + 1)]
      .find(item => !latest.has(`${item.importId}:${kind}`) && (item.semanticReviewed || item.modelCategorySlug))
    if (next) { setSelectedId(next.importId); setChoice(''); setNote('') }
    else setError('No unresolved proposal remains in this catalog.')
  }
  function applyBulk() {
    if (!catalog || !preview?.eligible || !profile?.id || !bulkPreview) return
    try {
      const groupId = crypto.randomUUID()
      const additions: ReviewEvent[] = []
      for (const item of preview.rows) additions.push(makeReviewEvent({ catalog, row: item, events: [...events, ...additions],
        role: profile.role, reviewerId: profile.id, kind: 'category', decision: 'approve', note: 'Explicitly selected bulk approval', groupId }))
      save([...events, ...additions]); setLastGroup(groupId); setSelectedIds([]); setBulkPreview(false)
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Bulk review failed.') }
  }
  function undoBulk() {
    if (!catalog || !profile?.id || !lastGroup) return
    try { save([...events, ...rollbackGroup(catalog, events, lastGroup, profile.id, profile.role)]); setLastGroup('') }
    catch (cause) { setError(cause instanceof Error ? cause.message : 'Rollback failed.') }
  }
  function toggle(id: string) { setSelectedIds(ids => ids.includes(id) ? ids.filter(item => item !== id) : [...ids, id]); setBulkPreview(false) }
  const options = kind === 'category' ? CATEGORY_ENTRIES : OCCASION_ENTRIES
  if (!authorized) return <p role="alert">Editor access is required.</p>
  return <main className={s.page}>
    <header className={s.heading}><div><p className={s.eyebrow}>MEZMUR CMS · OFFLINE REVIEW</p><h1>Editorial Review Studio</h1>
      <p>Review proposals against original lyrics. Decisions stay in this browser until exported; published records are unchanged.</p></div>
      <Link to="/admin/hymns/mezmur">Mezmur list</Link></header>
    <section className={s.loader} aria-label="Offline catalog">
      <label>Load generated catalog <input type="file" accept=".json,application/json" onChange={event => void loadFile(event)} disabled={busy} /></label>
      <small>Run <code>python scripts/build-mezmur-editorial-catalog.py</code>, then select <code>artifacts/mezmur-editorial-studio/catalog.json</code>.</small>
      {busy && <p role="status">Loading and validating the catalog…</p>}
      {catalog && <><span>{catalog.rows.length.toLocaleString()} original records · {catalog.semanticCompleted} completed semantic reviews · source {catalog.sourceSha256.slice(0, 12)}</span>
        <button type="button" onClick={() => download('mezmur-editorial-audit.json', { schema: 'mezmur-editorial-audit-v1', sourceSha256: catalog.sourceSha256, events })}>Export audit log</button>
        <label>Restore audit log <input type="file" accept=".json,application/json" onChange={event => void restoreAudit(event)} /></label>
        <button type="button" onClick={() => download('mezmur-editorial-report.json', { sourceSha256: catalog.sourceSha256, summary, decisions: [...latest.values()].map(({ reviewerId: _reviewerId, ...rest }) => rest) })}>Export report</button></>}
    </section>
    {error && <p role="alert" className={s.error}>{error}</p>}
    {!catalog && !busy && <p className={s.empty}>Load the offline catalog to see actual counts and begin reviewing.</p>}
    {catalog && summary && <>
      <section className={s.dashboard} aria-label="Review dashboard">
        {[
          ['Total hymns', summary.total], ['Classified now', summary.classified], ['Unclassified', summary.unclassified],
          ['Semantic proposals', summary.semanticProposals], ['AI proposals', summary.modelProposals],
          ['Editorial approvals', summary.approved], ['Category conflicts', summary.conflicts],
          ['Unresolved occasions', summary.unresolvedOccasions], ['Possible duplicate rows', summary.possibleDuplicates],
          ['Review progress', `${summary.reviewed} / ${summary.total}`],
        ].map(([label, value]) => <div className={s.metric} key={label}><span>{label}</span><strong>{value}</strong></div>)}
      </section>
      <div className={s.toolbar}>
        <label>Search ID, title, lyric or category <input type="search" value={query} onChange={event => setQuery(event.target.value)} /></label>
        <label>Review area <select value={kind} onChange={event => { setKind(event.target.value as ReviewKind); setChoice('') }}><option value="category">Category</option><option value="occasion">Occasion</option></select></label>
        <label>Status <select value={status} onChange={event => setStatus(event.target.value)}><option value="all">All</option><option value="semantic">Semantic proposals to review</option><option value="model">AI proposals</option><option value="unresolved">Unresolved</option><option value="approve">Approved</option><option value="select">Changed category</option><option value="reject">Rejected</option><option value="defer">Deferred</option><option value="conflict">Conflicts</option><option value="duplicates">Possible duplicates</option></select></label>
        <button type="button" onClick={nextUnresolved}>Next unresolved</button>
      </div>
      <div className={s.workspace}>
        <aside className={s.list} aria-label="Hymns"><p>{filtered.length.toLocaleString()} results</p>
          {filtered.slice(0, 200).map(item => <div className={`${s.listItem} ${row?.importId === item.importId ? s.active : ''}`} key={item.importId}>
            <input type="checkbox" aria-label={`Select ${item.titleAmharic || item.title} for bulk review`} checked={selectedIds.includes(item.importId)} onChange={() => toggle(item.importId)} />
            <button type="button" onClick={() => { setSelectedId(item.importId); setChoice(''); setNote('') }}><strong>{item.titleAmharic || item.title}</strong><small>{item.currentCategory || 'Unclassified'} · {reviewStatus(item, latest, kind)}</small></button>
          </div>)}
          {filtered.length > 200 && <p>Showing first 200. Search to narrow the list.</p>}
          {!filtered.length && <p>No hymns match this filter.</p>}
        </aside>
        {row && <article className={s.detail} aria-label="Editorial workspace">
          <div className={s.recordHead}><div><h2>{row.titleAmharic || row.title}</h2><p>{row.titleEnglish || row.title}</p>
            <small>Import ID: <code>{row.importId}</code> · Original ID: <code>{row.sourceId || '—'}</code></small></div>
            <Link to={`/admin/hymns/mezmur/${row.slug}/edit`}>Open existing editor</Link></div>
          <div className={s.columns}>
            <section className={s.lyricPanel}><h3>Original lyrics</h3>
              {Object.entries(row.lyrics).map(([field, text]) => <div key={field}><h4>{field.replace('lyrics_', '').replace('_', ' ')}</h4>
                <pre lang={field.includes('amharic') || field.includes('geez') ? 'am' : undefined}>{highlightedLyrics(text, row.evidence.filter(item => item.field === field).map(item => item.text))}</pre></div>)}
            </section>
            <div className={s.reviewPanel}>
              <section><h3>Current record</h3><p>Category: <strong>{row.currentCategory || 'Unclassified'}</strong></p><p>Occasion: <strong>{row.currentOccasion || 'Unresolved'}</strong></p><p>CMS review tag: {row.reviewStatus || 'None'} <small>(separate from this editorial decision)</small></p></section>
              <section><h3>Category proposal</h3><p><strong>{row.proposedCategory || 'No full-lyric proposal'}</strong>{row.semanticReviewed ? ' · human semantic analysis completed' : ''}</p>
                {row.broadCategory && <p>Hierarchy: {row.broadCategory} → {row.subcategory || '—'} → {row.proposedCategory}</p>}
                {row.specificSubject && <p>Specific subject: {row.specificSubject}</p>}
                <p>Confidence: {row.confidence || 'Unrated'} · {row.conflict ? 'Conflicting prior suggestion' : 'No documented conflict'}</p>
                {(row.confidence === 'medium' || row.confidence === 'low' || row.conflict || (row.modelUncertain && row.modelUncertain !== 'false')) &&
                  <p>Uncertainty: {row.conflict ? 'Earlier suggestion conflicts with full-lyric review. ' : ''}{row.modelQualityFlags || row.competingCategories || 'Requires individual theological judgment.'}</p>}
                {row.reason && <p>Reason: {row.reason}</p>}
                {row.competingCategories && <p>Alternative candidates: {row.competingCategories}</p>}
                {row.evidence.length > 0 && <><h4>Supporting excerpts</h4><ul>{row.evidence.map((item, i) => <li key={i} lang="am">{item.text}</li>)}</ul></>}
                {row.modelCategorySlug && <p>Unverified AI suggestion: {CATEGORY_ENTRIES.find(item => item.slug === row.modelCategorySlug)?.canonical || row.modelCategorySlug}. Review the full lyrics before deciding.</p>}
                {!row.semanticReviewed && <p>No completed semantic review. Automated suggestions cannot be approved as reviewed proposals.</p>}
              </section>
              <section className={s.actions}><h3>{kind === 'category' ? 'Category decision' : 'Occasion decision'}</h3>
                {current && <p>Latest local decision: <strong>{current.decision}</strong> · {new Date(current.reviewedAt).toLocaleString()}<br />{current.selectedValue || current.note}</p>}
                <label>Choose a supported {kind}<select value={choice} onChange={event => setChoice(event.target.value)}><option value="">Select…</option>{options.map(item => <option key={item.slug} value={item.slug}>{item.canonical}</option>)}</select></label>
                <label>Editorial note<textarea value={note} onChange={event => setNote(event.target.value)} rows={3} placeholder="Reason for selection, rejection, or theological review" /></label>
                <div className={s.buttons}><button type="button" onClick={() => decide('approve')} disabled={kind !== 'category' || !row.semanticReviewed || !row.evidence.length}>Approve proposal</button>
                  <button type="button" onClick={() => decide('select')}>Choose selected {kind}</button>
                  <button type="button" onClick={() => decide('reject')}>Reject</button>
                  <button type="button" onClick={() => decide('defer')}>Defer</button></div>
                <small>Occasions are reviewed independently. No occasion proposals are in the current 25 semantic reviews.</small>
              </section>
            </div>
          </div>
        </article>}
      </div>
      <section className={s.bulk}><h2>Selected records · {selectedIds.length}</h2><p>Bulk approval requires a shared category, high confidence, complete literal evidence, and no conflicts or prior decisions.</p>
        <button type="button" onClick={() => setBulkPreview(true)} disabled={!selectedIds.length}>Preview bulk approval</button>
        {bulkPreview && preview && <div role="status"><p>Proposed category: {preview.category || 'None'} · {preview.rows.length} records</p>
          <ul>{preview.rows.map(item => <li key={item.importId}>{item.titleAmharic || item.title} · <code>{item.importId}</code></li>)}</ul>
          {preview.warnings.length ? <ul>{preview.warnings.map(warning => <li key={warning}>{warning}</li>)}</ul> : <p>All selected records passed validation. This records local decisions only.</p>}
          <button type="button" disabled={!preview.eligible} onClick={applyBulk}>Confirm local bulk approval</button></div>}
        {lastGroup && <button type="button" onClick={undoBulk}>Undo last bulk approval</button>}
      </section>
    </>}
  </main>
}
