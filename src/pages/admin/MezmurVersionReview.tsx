import { useState, type ChangeEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { normalizeForSearch } from '../../lib/language/index.ts'
import type { VersionInput, VersionRelationship, VersionProposal } from '../../lib/mezmur/versionDetection.ts'
import s from './MezmurVersionReview.module.css'

type AuditPair = VersionProposal & { id: string; left: VersionInput; right: VersionInput }
type AuditBatch = {
  schema: 'mezmur-version-batch-v1'
  sourceSha256: string
  detectorRevision: string
  start: number
  end: number
  proposals: AuditPair[]
}
type ReviewDecision = { decision: 'confirm' | 'reject' | 'defer'; relationship: VersionRelationship; note: string; reviewerId: string; reviewedAt: string }
const RELATIONSHIPS: VersionRelationship[] = [
  'exact-duplicate', 'normalized-duplicate', 'alternate-spelling', 'alternate-stanza-structure',
  'extended-or-shortened', 'different-rendition', 'possible-related-hymn', 'distinct-hymn',
]

function validBatch(value: unknown): value is AuditBatch {
  if (!value || typeof value !== 'object') return false
  const batch = value as Partial<AuditBatch>
  return batch.schema === 'mezmur-version-batch-v1'
    && typeof batch.sourceSha256 === 'string' && /^[0-9a-f]{64}$/.test(batch.sourceSha256)
    && typeof batch.detectorRevision === 'string'
    && Number.isInteger(batch.start) && Number.isInteger(batch.end)
    && Array.isArray(batch.proposals) && batch.proposals.length <= 500
    && batch.proposals.every((pair) => typeof pair.id === 'string' && typeof pair.left?.import_id === 'string'
      && typeof pair.left?.slug === 'string' && typeof pair.left?.title === 'string'
      && typeof pair.right?.import_id === 'string' && typeof pair.right?.slug === 'string'
      && typeof pair.right?.title === 'string' && RELATIONSHIPS.includes(pair.relationship)
      && Number.isFinite(pair.confidence) && typeof pair.evidence?.explanation === 'string')
}

function storageKey(reviewerId: string, sourceSha256: string) {
  return `td_mezmur_version_decisions_v1:${reviewerId}:${sourceSha256}`
}

function loadDecisions(key: string): Record<string, ReviewDecision> {
  try {
    const value = JSON.parse(localStorage.getItem(key) || '{}') as Record<string, ReviewDecision>
    return value && typeof value === 'object' && !Array.isArray(value) ? value : {}
  } catch { return {} }
}

function download(name: string, value: unknown) {
  const blob = new Blob([JSON.stringify(value, null, 2) + '\n'], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.href = url
  link.download = name
  link.click()
  window.setTimeout(() => URL.revokeObjectURL(url), 1000)
}

function LyricColumn({ title, row, other }: { title: string; row: VersionInput; other: VersionInput }) {
  const field = (['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_transliteration', 'lyrics_oromo'] as const)
    .find((key) => row[key]?.trim())
  const lyrics = field ? row[field] || '' : ''
  const otherField = (['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_transliteration', 'lyrics_oromo'] as const)
    .find((key) => other[key]?.trim())
  const otherLines = (otherField ? other[otherField] || '' : '').split(/\r?\n/u)
  const lines = lyrics.split(/\r?\n/u)
  return <section className={s.lyricColumn}>
    <h3>{title}</h3>
    <p><strong>{row.title_amharic || row.title}</strong> {row.title_english ? `· ${row.title_english}` : ''}</p>
    <p className={s.meta}>Import ID: <code>{row.import_id}</code><br />Mezmur ID: <code>{row.mezmur_id || '—'}</code><br />Slug: {row.slug}<br />Category: {row.category || '—'} · Occasion: {row.primary_occasion || '—'}<br />Singer: {row.singer_name || '—'} · Status: {row.status || '—'} · Rights: {row.rights_status || '—'}</p>
    <p className={s.meta}>Original field: {field || 'No lyrics'}</p>
    <pre lang={field === 'lyrics_amharic' || field === 'lyrics_geez' ? 'am' : undefined} className={s.lyrics}>{lines.map((line, index) => {
      const different = normalizeForSearch(line) !== normalizeForSearch(otherLines[index] || '')
      return <span key={index} className={different ? s.changed : undefined}>{line || ' '}{index < lines.length - 1 ? '\n' : ''}</span>
    })}</pre>
  </section>
}

export function MezmurVersionReview() {
  const { profile } = useAuth()
  const staff = profile?.role === 'editor' || profile?.role === 'admin' || profile?.role === 'super_admin'
  const [batch, setBatch] = useState<AuditBatch | null>(null)
  const [decisions, setDecisions] = useState<Record<string, ReviewDecision>>({})
  const [selected, setSelected] = useState(0)
  const [relationship, setRelationship] = useState<VersionRelationship>('possible-related-hymn')
  const [note, setNote] = useState('')
  const [error, setError] = useState('')
  const proposal = batch?.proposals[selected]
  const key = batch && profile?.id ? storageKey(profile.id, batch.sourceSha256) : ''

  async function onFile(event: ChangeEvent<HTMLInputElement>) {
    setError('')
    const file = event.target.files?.[0]
    if (!file) return
    if (file.size > 12 * 1024 * 1024) { setError('Batch file is too large. Select one generated batch JSON.'); return }
    try {
      const value: unknown = JSON.parse(await file.text())
      if (!validBatch(value)) throw new Error('Invalid version audit batch.')
      setBatch(value)
      setSelected(0)
      setRelationship(value.proposals[0]?.relationship ?? 'possible-related-hymn')
      setDecisions(loadDecisions(storageKey(profile?.id || '', value.sourceSha256)))
      setNote('')
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Could not read batch.') }
  }

  function select(index: number) {
    if (!batch || index < 0 || index >= batch.proposals.length) return
    setSelected(index)
    const item = batch.proposals[index]
    setRelationship(decisions[item.id]?.relationship ?? item.relationship)
    setNote(decisions[item.id]?.note ?? '')
  }

  function decide(decision: ReviewDecision['decision']) {
    if (!proposal || !key || !profile?.id) return
    const next = { ...decisions, [proposal.id]: {
      decision, relationship, note: note.trim().slice(0, 2000), reviewerId: profile.id,
      reviewedAt: new Date().toISOString(),
    } }
    try {
      localStorage.setItem(key, JSON.stringify(next))
      setDecisions(next)
      setError('')
    } catch { setError('Local decision storage is unavailable. Export before leaving this page.') }
  }

  if (!staff) return <p role="alert">Editor access is required for version review.</p>
  return <div className={s.page}>
    <div className={s.heading}><div><p className={s.eyebrow}>MEZMUR CMS</p><h1>Version Review</h1><p>Compare offline proposals. Decisions stay in this browser until exported.</p></div><Link to="/admin/hymns/mezmur">Back to Mezmur</Link></div>
    <div className={s.toolbar}>
      <label>Audit batch JSON <input type="file" accept="application/json,.json" onChange={(event) => void onFile(event)} /></label>
      {batch ? <button type="button" onClick={() => download(`mezmur-version-decisions-${batch.sourceSha256.slice(0, 12)}-${batch.start}.json`, {
        schema: 'mezmur-version-decisions-v1', sourceSha256: batch.sourceSha256,
        batchStart: batch.start, batchEnd: batch.end, reviewerId: profile?.id, decisions,
      })}>Export decisions</button> : null}
    </div>
    {error ? <p role="alert" className={s.error}>{error}</p> : null}
    {!batch ? <p>Load a generated <code>batch-*.json</code> from the offline audit. Original lyrics remain in that local file; this page does not send them to Supabase.</p> : null}
    {batch && !proposal ? <p>No proposed relationships in this batch.</p> : null}
    {proposal ? <>
      <div className={s.toolbar}>
        <button type="button" disabled={selected === 0} onClick={() => select(selected - 1)}>Previous</button>
        <label>Proposal <select value={selected} onChange={(event) => select(Number(event.target.value))}>{batch!.proposals.map((item, index) => <option key={item.id} value={index}>{index + 1}. {item.left.title} ↔ {item.right.title} ({item.relationship})</option>)}</select></label>
        <button type="button" disabled={selected === batch!.proposals.length - 1} onClick={() => select(selected + 1)}>Next</button>
        <span>{Object.keys(decisions).length} decisions in this source snapshot</span>
      </div>
      <section className={s.evidence}>
        <strong>Proposed: {proposal.relationship.replaceAll('-', ' ')}</strong> · Confidence {Math.round(proposal.confidence * 100)}%
        <p>{proposal.evidence.explanation}</p>
        <small>{proposal.evidence.sharedDistinctiveLines} distinctive lines · {proposal.evidence.sharedLines} shared lines · {Math.round(proposal.evidence.lineCoverage * 100)}% longer-body coverage · {Math.round(proposal.evidence.shorterContainment * 100)}% shorter-body containment</small>
      </section>
      <div className={s.columns}><LyricColumn title="Original A" row={proposal.left} other={proposal.right} /><LyricColumn title="Original B" row={proposal.right} other={proposal.left} /></div>
      <section className={s.review} aria-label="Reviewer decision">
        <label>Reviewed relationship <select value={relationship} onChange={(event) => setRelationship(event.target.value as VersionRelationship)}>{RELATIONSHIPS.map((value) => <option key={value} value={value}>{value.replaceAll('-', ' ')}</option>)}</select></label>
        <label>Review note <textarea value={note} onChange={(event) => setNote(event.target.value)} maxLength={2000} rows={2} /></label>
        <div className={s.toolbar}><button type="button" onClick={() => decide('confirm')}>Confirm offline</button><button type="button" onClick={() => decide('reject')}>Reject</button><button type="button" onClick={() => decide('defer')}>Defer</button></div>
        <p role="status">{decisions[proposal.id] ? `Saved locally: ${decisions[proposal.id].decision}` : 'Awaiting review'} · Proposal ID <code>{proposal.id}</code></p>
      </section>
    </> : null}
  </div>
}
