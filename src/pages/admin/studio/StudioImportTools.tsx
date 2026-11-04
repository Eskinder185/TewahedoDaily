import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../../lib/auth/useAuth'
import { questionLibraryApi } from '../../../lib/play/questionLibraryService'
import { loadCompleteStaffQuestionInventory, type StaffQuestionInventory } from '../../../lib/play/staffQuestionInventory'
import { previewQuestionImport, questionTransitionAllowed, type EditorialRole, type QuestionRow, type QuestionStatus } from '../../../lib/play/questionLibrary'
import { isQuizStudioGame } from '../../../lib/play/contentStudio'
import s from './Studio.module.css'

export function StudioImportTools() {
  const { user, profile } = useAuth()
  if (!user || !profile || !['editor', 'admin', 'super_admin'].includes(profile.role || '')) return <p role="alert">Staff access required / የሠራተኛ ፈቃድ ያስፈልጋል።</p>
  return <ImportTools role={profile.role as EditorialRole} />
}
function ImportTools({ role }: { role: EditorialRole }) {
  const [rows, setRows] = useState<QuestionRow[]>([])
  const [inventory, setInventory] = useState<StaffQuestionInventory | null>(null)
  const [raw, setRaw] = useState('')
  const [confirmed, setConfirmed] = useState(false)
  const [loaded, setLoaded] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [notice, setNotice] = useState('')
  const describe = (cause: unknown) => cause instanceof Error ? cause.message : 'Data operation failed.'
  useEffect(() => { let active = true; void loadCompleteStaffQuestionInventory().then(result => {
    if (active) { setRows(result.rows); setInventory(result); setLoaded(true) }
  }).catch(cause => { if (active) setError(describe(cause)) }); return () => { active = false } }, [])
  const preview = useMemo(() => raw.trim() ? previewQuestionImport(raw, new Set(rows.flatMap(row => [row.stable_id, row.question_id]))) : { items: [], errors: [] }, [raw, rows])
  async function importDrafts() {
    if (!loaded || busy || !confirmed || !preview.items.length || preview.errors.length) return
    setBusy(true); setError(''); setNotice('')
    try {
      const count = await questionLibraryApi.importDrafts(raw, new Set(rows.flatMap(row => [row.stable_id, row.question_id])))
      const refreshed = await loadCompleteStaffQuestionInventory()
      setRows(refreshed.rows); setInventory(refreshed); setRaw(''); setConfirmed(false)
      setNotice(`Imported ${count} drafts. Nothing was approved or published. / ረቂቆች ተገብተዋል፤ አልታተሙም።`)
    } catch (cause) { setError(describe(cause)); setLoaded(false) }
    finally { setBusy(false) }
  }
  async function changeStatus(row: QuestionRow, status: QuestionStatus) {
    if (busy || !questionTransitionAllowed(row.status, status, role) || !window.confirm(`${status === 'draft' ? 'Unpublish/return to draft' : 'Archive'} ${row.stable_id}?`)) return
    setBusy(true); setError(''); setNotice('')
    try {
      await questionLibraryApi.review(row.id, status, '')
      const reopened = await questionLibraryApi.get(row.id)
      if (reopened.status !== status) throw new Error('The server did not confirm the new status.')
      setRows(current => current.map(item => item.id === row.id ? reopened : item))
      setNotice(`Status confirmed: ${status}`)
    } catch (cause) { setError(describe(cause)) }
    finally { setBusy(false) }
  }
  async function exportRecords() {
    setBusy(true); setError('')
    try {
      const current = await loadCompleteStaffQuestionInventory()
      setRows(current.rows); setInventory(current); setLoaded(true)
      const url = URL.createObjectURL(new Blob([JSON.stringify(current, null, 2)], { type: 'application/json' }))
      const link = document.createElement('a'); link.href = url; link.download = 'faith-challenges-staff-records.json'; link.click()
      window.setTimeout(() => URL.revokeObjectURL(url), 1000)
    } catch (cause) { setError(describe(cause)); setLoaded(false) }
    finally { setBusy(false) }
  }
  return <div className={s.studio}>
    <header className={s.header}><h1>Import &amp; data tools / የማስገቢያ መሣሪያዎች</h1><Link to="/admin/play">← Back to Studio / ወደ ስቱዲዮ</Link></header>
    <p>Use the Studio for visual editing. These staff tools preserve existing server imports and records; they never approve or publish imports. / ለአርትዖት ስቱዲዮውን ይጠቀሙ።</p>
    {error && <p role="alert" className={s.error}>{error} <button type="button" onClick={() => window.location.reload()}>Reload records / አድስ</button></p>}
    {notice && <p role="status">{notice}</p>}
    <section className={s.group} aria-label="Validated server draft import">
      <h2>Import question drafts / የጥያቄ ረቂቆችን አስገባ</h2>
      <div className={s.field}><label htmlFor="studio-server-import-json">Draft JSON / የረቂቅ JSON</label><textarea id="studio-server-import-json" value={raw} maxLength={1000000} disabled={busy} onChange={event => { setRaw(event.target.value); setConfirmed(false); setNotice('') }} /></div>
      <p>Existing question-array format, 1–100 items, at most 1 MB. Every ID, game payload, language and source is validated before import. / ከማስገባት በፊት ይረጋገጣል።</p>
      {!!preview.errors.length && <ul role="alert">{preview.errors.map((item, index) => <li key={index}>{item}</li>)}</ul>}
      {!!preview.items.length && <><h3>Import preview / የማስገባት ቅድመ እይታ</h3><ul>{preview.items.map(item => <li key={item.stable_id}>{item.stable_id} · {item.game_type} · {item.category}</li>)}</ul>
        <label><input type="checkbox" checked={confirmed} disabled={busy} onChange={event => setConfirmed(event.target.checked)} /> I reviewed these drafts; do not publish / ረቂቆቹን ገምግሜአለሁ፤ አታትም</label></>}
      <button type="button" disabled={!loaded || busy || !confirmed || !preview.items.length || !!preview.errors.length} onClick={() => void importDrafts()}>Import as drafts / እንደ ረቂቅ አስገባ</button>
    </section>
    <details className={s.group}><summary>Existing server records &amp; export / የአገልጋይ መዝገቦች</summary>
      <p>Includes incompatible legacy rows for inventory and recovery; unsupported content is never silently repaired. Draft import and full-record export are different formats. Counted pages must complete before export. / ነባር መዝገቦች ተጠብቀዋል።</p>
      {inventory && <p role="status">{inventory.visibleCount} RLS-visible rows across {inventory.pages} counted page(s). Live schema and policy checks still require staging verification.</p>}
      <button type="button" disabled={!loaded || busy} onClick={() => void exportRecords()}>Export complete visible inventory / መዝገቦችን ላክ</button>
      {!loaded ? <p role="status">Records are not available yet. / በመጫን ላይ…</p> : <ul className={s.library}>{rows.map(row => <li key={row.id}><strong>{row.stable_id || row.question_id}</strong><span>{row.game_type} · {row.status}</span>
        {(isQuizStudioGame(row.game_type) || row.game_type === 'who-am-i' || row.game_type === 'match') && <Link to={`/admin/play/studio?game=${row.game_type}&item=${row.id}`}>Open in Studio / በስቱዲዮ ክፈት</Link>}
        {(['draft', 'archived'] as const).filter(status => questionTransitionAllowed(row.status, status, role)).map(status => <button key={status} type="button" disabled={busy} onClick={() => void changeStatus(row, status)}>{status === 'draft' ? 'Return to draft / ወደ ረቂቅ' : 'Archive / በማህደር አስቀምጥ'}</button>)}
      </li>)}</ul>}
    </details>
  </div>
}
