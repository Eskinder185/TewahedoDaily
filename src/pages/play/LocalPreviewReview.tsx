import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { LocalPreviewBanner } from '../../components/play/LocalPreviewBanner'
import { TAG_LABEL, type ReviewInventory, type ReviewRow, type ReviewTag } from '../../lib/play/localReviewTypes'
import s from './LocalPreviewReview.module.css'

/**
 * LOCAL REVIEW ONLY screen for the 834 consolidated Faith Challenges draft records (route registered only when LOCAL_PREVIEW is true).
 * Read-only: it shows what the repository can prove, never approves, edits, plays-for-XP or publishes anything.
 */
const GAME_LABEL: Record<string, string> = {
  trivia: 'Bible & Tewahedo Trivia', 'finish-the-verse': 'Finish the Verse', emoji: 'Holy Emoji Challenge', history: 'History Quest', 'who-am-i': 'Who Am I?',
  match: 'Match & Discover', 'bible-timeline': 'Bible Timeline Challenge', adventures: 'Bible Adventure', feasts: 'Church Feast Challenge',
  saints: 'Guess the Saint', 'icon-memory': 'Icon Memory',
}
const GAME_ROUTE: Record<string, string> = { adventures: '/play/adventures' }
const PAGE = 40
const REVIEW_ONLY: ReviewTag[] = ['source-blocked', 'editorial-review', 'translation-review']

type Load = { state: 'loading' } | { state: 'error'; message: string } | { state: 'ready'; inventory: ReviewInventory }

export function LocalPreviewReview() {
  const [load, setLoad] = useState<Load>({ state: 'loading' })
  const [game, setGame] = useState('all')
  const [tag, setTag] = useState<'all' | ReviewTag>('all')
  const [query, setQuery] = useState('')
  const [page, setPage] = useState(0)

  useEffect(() => {
    let active = true
    fetch('/__local-preview/inventory.json').then(async (response) => {
      if (!response.ok) throw new Error(response.status === 404 ? 'Inventory not built yet. Run: npm run preview:local (it builds the inventory first).' : `Inventory request failed (${response.status})`)
      const inventory = await response.json() as ReviewInventory
      if (active) setLoad({ state: 'ready', inventory })
    }).catch((error: Error) => { if (active) setLoad({ state: 'error', message: error.message }) })
    return () => { active = false }
  }, [])

  const rows = useMemo(() => (load.state === 'ready' ? load.inventory.rows : []), [load])
  const summary = useMemo(() => {
    const table = new Map<string, { rows: number; blocked: number; review: number; translation: number; generated: number; bundled: number }>()
    for (const row of rows) {
      const entry = table.get(row.game) ?? { rows: 0, blocked: 0, review: 0, translation: 0, generated: 0, bundled: 0 }
      entry.rows += 1
      if (row.tags.includes('source-blocked')) entry.blocked += 1
      if (row.tags.includes('editorial-review')) entry.review += 1
      if (row.tags.includes('translation-review')) entry.translation += 1
      if (row.tags.includes('generated-draft')) entry.generated += 1
      if (row.tags.includes('existing-bundled')) entry.bundled += 1
      table.set(row.game, entry)
    }
    return [...table.entries()]
  }, [rows])
  const filtered = useMemo(() => {
    const needle = query.trim().toLowerCase()
    return rows.filter((row) => (game === 'all' || row.game === game) && (tag === 'all' || row.tags.includes(tag))
      && (!needle || row.id.toLowerCase().includes(needle) || row.title.toLowerCase().includes(needle) || row.fields.some((f) => f.en.toLowerCase().includes(needle) || f.am.includes(query.trim()))))
  }, [rows, game, tag, query])
  const pages = Math.max(1, Math.ceil(filtered.length / PAGE))
  const current = Math.min(page, pages - 1)
  const shown = filtered.slice(current * PAGE, current * PAGE + PAGE)

  return (
    <div className={s.page} data-local-review>
      <LocalPreviewBanner showReviewLink={false} />
      <header className={s.header}>
        <p className={s.watermark} data-review-only-note>REVIEW ONLY: nothing on this screen is approved, published or counted toward XP.</p>
        <h1>Faith Challenges: local draft review</h1>
        <p className={s.lede}>All records the PR #15 consolidation would import as drafts, shown exactly as the repository holds them. Held, blocked and unreviewed items stay labelled and are never promoted to the playable bank from here.</p>
      </header>

      {load.state === 'loading' && <p role="status">Loading the local inventory…</p>}
      {load.state === 'error' && <p role="alert" className={s.error}>{load.message}</p>}

      {load.state === 'ready' && (
        <>
          <section aria-labelledby="rv-summary">
            <h2 id="rv-summary">Per-game status ({rows.length} records)</h2>
            <div className={s.tableWrap}>
              <table className={s.table} data-review-summary>
                <thead><tr><th scope="col">Game</th><th scope="col">Records</th><th scope="col">Bundled</th><th scope="col">Generated</th><th scope="col">Source blocked</th><th scope="col">Editorial review</th><th scope="col">Translation review</th><th scope="col">Local play</th></tr></thead>
                <tbody>
                  {summary.map(([id, entry]) => (
                    <tr key={id} data-summary-game={id}>
                      <th scope="row">{GAME_LABEL[id] ?? id}</th><td>{entry.rows}</td><td>{entry.bundled}</td><td>{entry.generated}</td>
                      <td>{entry.blocked}</td><td>{entry.review}</td><td>{entry.translation}</td>
                      <td><Link to={GAME_ROUTE[id] ?? `/play/${id}`}>Open</Link></td>
                    </tr>
                  ))}
                  <tr><th scope="row">Finish the Mezmur</th><td colSpan={6}>Not in this inventory: it is built at play time from published hymn lyrics (read-only); no lyrics are copied into drafts.</td><td><Link to="/play/finish-the-mezmur">Open</Link></td></tr>
                </tbody>
              </table>
            </div>
            <p className={s.note}>“Local play” opens the real game on this computer. In the local preview every valid record is playable for evaluation; <strong>source blocked</strong> records could not be published yet.</p>
            {(load.inventory.excluded.length > 0 || load.inventory.downgraded.length > 0) && (
              <details className={s.extra}>
                <summary>Not imported or downgraded ({load.inventory.excluded.length + load.inventory.downgraded.length})</summary>
                <ul>
                  {load.inventory.excluded.map((item) => <li key={`${item.game}-${item.id}-x`}><strong>{item.game}</strong>: {item.reason}</li>)}
                  {load.inventory.downgraded.map((item) => <li key={`${item.id}-d`}><strong>{item.id}</strong> (Amharic claim removed): {item.reason}</li>)}
                </ul>
              </details>
            )}
          </section>

          <section aria-labelledby="rv-list" className={s.list}>
            <h2 id="rv-list">Records</h2>
            <div className={s.filters}>
              <label>Game
                <select value={game} onChange={(event) => { setGame(event.target.value); setPage(0) }} data-review-game>
                  <option value="all">All games</option>
                  {summary.map(([id]) => <option key={id} value={id}>{GAME_LABEL[id] ?? id}</option>)}
                </select>
              </label>
              <label>Label
                <select value={tag} onChange={(event) => { setTag(event.target.value as 'all' | ReviewTag); setPage(0) }} data-review-tag>
                  <option value="all">All labels</option>
                  {(Object.keys(TAG_LABEL) as ReviewTag[]).map((id) => <option key={id} value={id}>{TAG_LABEL[id]}</option>)}
                </select>
              </label>
              <label>Search
                <input type="search" value={query} placeholder="ID, title or text" onChange={(event) => { setQuery(event.target.value); setPage(0) }} data-review-search />
              </label>
            </div>
            <p role="status" aria-live="polite" data-review-count>{filtered.length} of {rows.length} records</p>
            <ol className={s.cards} start={current * PAGE + 1}>
              {shown.map((row) => <ReviewCard key={row.id} row={row} />)}
            </ol>
            <nav className={s.pager} aria-label="Pages">
              <button type="button" onClick={() => setPage(Math.max(0, current - 1))} disabled={current === 0}>Previous</button>
              <span>Page {current + 1} of {pages}</span>
              <button type="button" onClick={() => setPage(Math.min(pages - 1, current + 1))} disabled={current >= pages - 1}>Next</button>
            </nav>
          </section>
        </>
      )}
    </div>
  )
}

function ReviewCard({ row }: { row: ReviewRow }) {
  const reviewOnly = row.tags.some((id) => REVIEW_ONLY.includes(id))
  return (
    <li className={`${s.card} ${row.tags.includes('source-blocked') ? s.blocked : ''}`} data-review-row={row.id}>
      <details>
        <summary>
          <span className={s.cardTitle}>{row.title}</span>
          <span className={s.meta}>{GAME_LABEL[row.game] ?? row.game} · {row.contentType} · {row.difficulty} · {row.category}</span>
          <span className={s.chips}>
            {reviewOnly && <span className={`${s.chip} ${s.reviewOnly}`}>REVIEW ONLY</span>}
            {row.tags.map((id) => <span key={id} className={`${s.chip} ${s[id] ?? ''}`}>{TAG_LABEL[id]}</span>)}
          </span>
        </summary>
        <dl className={s.fields}>
          {row.fields.map((field, index) => (
            <div key={`${field.label}-${index}`} className={s.field}>
              <dt>{field.label}</dt>
              <dd lang="en">{field.en || <em>(none)</em>}</dd>
              <dd lang="am">{field.am || <em>(no Amharic)</em>}</dd>
            </div>
          ))}
        </dl>
        <h3>Sources</h3>
        <ul className={s.sources}>
          {row.sources.map((source, index) => (
            <li key={`${source.route}-${index}`}>
              {source.label} <code>{source.route}</code> <span className={s.kind}>{source.kind}</span>
              {source.blocked && <strong className={s.blockedNote}> SOURCE BLOCKED: {source.note}</strong>}
            </li>
          ))}
        </ul>
        <h3>Artwork</h3>
        <p>{row.artwork.status}</p>
        {row.artwork.items.length > 0 && <ul className={s.artwork}>{row.artwork.items.map((item) => <li key={item.id}>{item.name} <code>{item.id}</code></li>)}</ul>}
        <dl className={s.status}>
          <div><dt>Provenance</dt><dd><code>{row.provenance.origin}</code> ({row.provenance.kind})</dd></div>
          <div><dt>Editorial review</dt><dd>{row.reviewState}</dd></div>
          <div><dt>Rights</dt><dd>{row.rights}</dd></div>
          <div><dt>Validation</dt><dd>{row.problems.length ? row.problems.join(' ') : 'Passed the app validator (no problems).'}</dd></div>
          <div><dt>Stable ID</dt><dd><code>{row.id}</code></dd></div>
        </dl>
      </details>
    </li>
  )
}
