import { useCallback, useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase/client'
import { Status } from './AdminUi'
import s from './Admin.module.css'

type ReviewRow = {
  id: string
  stable_id: string
  game_type: string
  category: string
  difficulty: string
  status: 'draft' | 'approved' | 'rejected' | 'published'
  payload: { prompt?: { en?: string; am?: string } }
  source_references: unknown[]
  review_notes: string | null
  updated_at: string
}
type Query = {
  select: (columns: string) => Query
  order: (column: string, options: { ascending: boolean }) => Promise<{ data: ReviewRow[] | null; error: { message: string } | null }>
}
type Client = {
  from: (table: string) => Query
  rpc: (name: string, args: Record<string, unknown>) => Promise<{ error: { message: string } | null }>
}

export function PlayContentReview() {
  const [rows, setRows] = useState<ReviewRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [filter, setFilter] = useState('all')
  const client = supabase as unknown as Client | null

  const load = useCallback(async () => {
    if (!client) { setError('Supabase is not configured.'); setLoading(false); return }
    setLoading(true); setError('')
    const { data, error: queryError } = await client.from('play_content_items').select('id,stable_id,game_type,category,difficulty,status,payload,source_references,review_notes,updated_at').order('updated_at', { ascending: false })
    if (queryError) setError(queryError.message); else setRows(data || [])
    setLoading(false)
  }, [client])

  useEffect(() => {
    const timer = window.setTimeout(() => void load(), 0)
    return () => window.clearTimeout(timer)
  }, [load])

  const review = async (row: ReviewRow, status: ReviewRow['status']) => {
    if (!client) return
    if (status === 'published' && (!row.source_references || row.source_references.length === 0)) { setError('A source reference is required before publication.'); return }
    const notes = window.prompt('Editorial notes (optional)', row.review_notes || '')
    if (notes === null) return
    const { error: reviewError } = await client.rpc('review_play_content', { p_id: row.id, p_status: status, p_notes: notes || null })
    if (reviewError) setError(reviewError.message); else void load()
  }

  const visible = rows.filter((row) => filter === 'all' || row.status === filter)
  return <div>
    <div className={s.heading}><div><h1>Play content review</h1><p>Only sourced, reviewed items may be published to Tewahedo Play.</p></div><button type="button" onClick={() => void load()}>Refresh</button></div>
    <div className={s.actions} role="group" aria-label="Filter by editorial status">{['all','draft','approved','rejected','published'].map((item) => <button type="button" key={item} aria-pressed={filter === item} onClick={() => setFilter(item)}>{item}</button>)}</div>
    {loading ? <p role="status">Loading…</p> : null}{error ? <p className={s.error} role="alert">{error}</p> : null}
    {!loading && !visible.length ? <p>No Play content matches this filter. Drafts can be created by the controlled content pipeline after the migration is applied.</p> : null}
    {visible.length ? <div className={s.tableWrap}><table><thead><tr><th>Item</th><th>Game</th><th>Source</th><th>Status</th><th>Review</th></tr></thead><tbody>{visible.map((row) => <tr key={row.id}><td><strong>{row.payload?.prompt?.en || row.stable_id}</strong><br/><small>{row.payload?.prompt?.am || row.category} · {row.difficulty}</small></td><td>{row.game_type}</td><td>{row.source_references.length} reference(s)</td><td><Status value={row.status} /></td><td><div className={s.actions}><button type="button" onClick={() => void review(row, 'approved')}>Approve</button><button type="button" onClick={() => void review(row, 'rejected')}>Reject</button><button type="button" disabled={row.status !== 'approved'} onClick={() => void review(row, 'published')}>Publish</button></div></td></tr>)}</tbody></table></div> : null}
  </div>
}
