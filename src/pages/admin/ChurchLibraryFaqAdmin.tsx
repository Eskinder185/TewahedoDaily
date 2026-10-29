import { useEffect, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../../lib/supabase/client'
import styles from './ChurchLibraryFaqAdmin.module.css'

type FaqRow = {
  stable_id: string; question_en: string; question_am: string; answer_en: string; answer_am: string
  alternative_phrasings: string[]; topic: string; source_references: unknown[]
  review_status: 'pending' | 'approved' | 'needs_changes'; publication_status: 'draft' | 'published'
}
const EMPTY: FaqRow = { stable_id: '', question_en: '', question_am: '', answer_en: '', answer_am: '',
  alternative_phrasings: [], topic: '', source_references: [], review_status: 'pending', publication_status: 'draft' }

export function ChurchLibraryFaqAdmin() {
  const [items, setItems] = useState<FaqRow[]>([])
  const [draft, setDraft] = useState<FaqRow>(EMPTY)
  const [aliases, setAliases] = useState('')
  const [sources, setSources] = useState('[]')
  const [notice, setNotice] = useState('')

  async function load() {
    if (!supabase) return
    const { data, error } = await supabase.from('church_library_faqs' as never).select('*').order('updated_at' as never, { ascending: false })
    if (error) { setNotice(error.message); return }
    setItems((data || []) as unknown as FaqRow[])
  }
  useEffect(() => {
    const timer = window.setTimeout(() => { void load() }, 0)
    return () => window.clearTimeout(timer)
  }, [])
  function edit(item: FaqRow) {
    setDraft(item); setAliases(item.alternative_phrasings.join('\n')); setSources(JSON.stringify(item.source_references, null, 2)); setNotice('')
  }
  async function save(event: FormEvent) {
    event.preventDefault()
    if (!supabase) return
    let parsedSources: unknown
    try { parsedSources = JSON.parse(sources) } catch { setNotice('Source references must be valid JSON.'); return }
    if (!Array.isArray(parsedSources)) { setNotice('Source references must be a JSON array.'); return }
    const payload = { ...draft, alternative_phrasings: aliases.split('\n').map((value) => value.trim()).filter(Boolean), source_references: parsedSources }
    const { error } = await supabase.from('church_library_faqs' as never).upsert(payload as never, { onConflict: 'stable_id' })
    if (error) { setNotice(error.message); return }
    setNotice('FAQ saved. Draft answers remain private until approved and published.'); await load()
  }
  return (
    <main className={styles.page}>
      <header><div><p><Link to="/admin/church-library">← Church Library</Link></p><h1>Approved FAQ Answers</h1><p>Manage bilingual, source-grounded Search Buddy answers. AI output is never approved automatically.</p></div><button type="button" onClick={() => edit(EMPTY)}>New FAQ</button></header>
      {notice && <p role="status">{notice}</p>}
      <section className={styles.grid}>
        <div>{items.map((item) => <button type="button" key={item.stable_id} onClick={() => edit(item)}><strong>{item.question_en}</strong><br /><small>{item.review_status} · {item.publication_status}</small></button>)}</div>
        <form onSubmit={save}>
          <label>Stable ID<input required pattern="[a-z0-9-]+" value={draft.stable_id} onChange={(e) => setDraft({ ...draft, stable_id: e.target.value })} /></label>
          <label>Topic<input required value={draft.topic} onChange={(e) => setDraft({ ...draft, topic: e.target.value })} /></label>
          <label>English question<input required value={draft.question_en} onChange={(e) => setDraft({ ...draft, question_en: e.target.value })} /></label>
          <label>Amharic question<input required lang="am" value={draft.question_am} onChange={(e) => setDraft({ ...draft, question_am: e.target.value })} /></label>
          <label>Approved English answer<textarea required rows={5} value={draft.answer_en} onChange={(e) => setDraft({ ...draft, answer_en: e.target.value })} /></label>
          <label>Approved Amharic answer<textarea required rows={5} lang="am" value={draft.answer_am} onChange={(e) => setDraft({ ...draft, answer_am: e.target.value })} /></label>
          <label>Alternative questions (one per line)<textarea rows={5} value={aliases} onChange={(e) => setAliases(e.target.value)} /></label>
          <label>Verified source references (JSON array)<textarea rows={8} value={sources} onChange={(e) => setSources(e.target.value)} /></label>
          <label>Review status<select value={draft.review_status} onChange={(e) => setDraft({ ...draft, review_status: e.target.value as FaqRow['review_status'] })}><option value="pending">Pending</option><option value="needs_changes">Needs changes</option><option value="approved">Approved</option></select></label>
          <label>Publication<select value={draft.publication_status} onChange={(e) => setDraft({ ...draft, publication_status: e.target.value as FaqRow['publication_status'] })}><option value="draft">Draft</option><option value="published">Published</option></select></label>
          <button type="submit">Save FAQ</button>
        </form>
      </section>
    </main>
  )
}
