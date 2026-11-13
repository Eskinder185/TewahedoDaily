import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { GameCard } from '../../../components/play/GameCard'
import { GAME_ART } from '../../../lib/play/imageCatalog'
import { GAME_MODES, gameInMode } from '../../../lib/play/gameModes'
import { HUB_GAMES, HUB_SECTIONS, studioIdForHubGame } from '../../../lib/play/gameCatalog'
import { STUDIO_GAMES, isQuizStudioGame, type StudioGame } from '../../../lib/play/contentStudio'
import { builtInContent, builtInCounts, builtInOrigin } from '../../../lib/play/staticContent'
import { GAME_LEVELS, THUMBNAIL_KEYS, exportSettings, settingsStorage, validateSettings, type GameSettingsDraft } from '../../../lib/play/gameSettings'
import { coverageRows, type Capability } from '../../../lib/play/coverage'
import { bundledStatusRows, loadGeneratedPreview, type GeneratedPreviewItem } from '../../../lib/play/bundledInventory'
import { databasePlayEnabled } from '../../../lib/play/publishedContent'
import { importCandidates, parseCampaignFile, reviewStorage, type CampaignItem, type ParsedCampaign, type ReviewRecord, type ReviewState } from '../../../lib/play/campaignDrafts'
import { BilingualField, TextField } from './StudioFields'
import { STUDIO_VIEWS, matchesBuiltIn, type BuiltInFilters, type SavedCounts, type StudioView } from './studioViews'
import s from './Studio.module.css'

const message = (cause: unknown) => (cause instanceof Error ? cause.message : 'Operation failed.')
const gameName = (id: string, am: boolean) => { const entry = STUDIO_GAMES.find(item => item.id === id); return entry ? (am ? entry.am : entry.en) : id }
const capabilityLabel: Record<Capability, string> = { yes: 'Yes', partial: 'Partly', no: 'No' }

export function StudioTabs({ view, am, onChange }: { view: StudioView; am: boolean; onChange: (view: StudioView) => void }) {
  return <div role="tablist" aria-label={am ? 'የስቱዲዮ ክፍሎች' : 'Studio sections'} className={s.tabs}>
    {STUDIO_VIEWS.map(tab => <button key={tab.id} role="tab" type="button" aria-selected={view === tab.id} data-studio-tab={tab.id} onClick={() => onChange(tab.id)}>{am ? tab.am : tab.en}</button>)}
  </div>
}

/* ------------------------------------------------------------------ Library mirror */
/** One compact row per public game: what is built in, what is saved, and how it can be published. */
export function GameOverview({ am, saved, mode, onOpen }: { am: boolean; saved: SavedCounts; mode: string; onOpen: (game: StudioGame) => void }) {
  const counts = useMemo(() => builtInCounts(), [])
  return <section className={s.group} aria-label={am ? 'የህዝብ ገጽ ጨዋታዎች' : 'Public page games'}>
    <h2>{am ? 'በህዝብ ገጹ ላይ ያሉ ጨዋታዎች' : 'Games on the public page'}</h2>
    <p className={s.hint}>{am ? 'አምስት ምድቦች፣ 12 ጨዋታዎች። ጨዋታ ይምረጡ።' : 'Five categories, twelve games. Built-in content is what visitors play today; it is read-only here and opens as a draft copy.'}</p>
    <div className={s.tableWrap}><table className={s.table}>
      <caption className={s.srOnly}>Faith Challenges games and their content</caption>
      <thead><tr><th scope="col">Game</th><th scope="col">Category</th><th scope="col">Built-in</th><th scope="col">Saved (server / local)</th><th scope="col">Source</th><th scope="col">Publishing</th></tr></thead>
      <tbody>{HUB_GAMES.filter(hub => gameInMode(hub.id, mode)).map(hub => {
        const id = studioIdForHubGame(hub.id)
        const origin = builtInOrigin(id)
        const count = saved[id] || { server: 0, local: 0 }
        return <tr key={hub.id}>
          <th scope="row"><button type="button" data-open-game={id} onClick={() => onOpen(id)}>{gameName(id, am)}</button></th>
          <td>{hub.category[am ? 'am' : 'en']}</td>
          <td>{id === 'finish-the-mezmur' ? (am ? 'ከመዝሙር መዝገብ' : 'From Mezmur records') : counts[id]}</td>
          <td>{count.server} / {count.local}</td>
          <td><span className={s.badge}>{origin.kind === 'supabase' ? 'Supabase' : 'Built-in TypeScript'}</span></td>
          <td>{isQuizStudioGame(id) && id !== 'history' ? 'Server workflow' : id === 'history' ? 'Quiz: server · chronology: local' : id === 'who-am-i' || id === 'match' ? 'Reader ready · publish blocked' : id === 'finish-the-mezmur' ? 'Via Hymn CMS' : 'Local drafts only'}</td>
        </tr>
      })}</tbody>
    </table></div>
    <details><summary>{am ? 'ምድቦችና ሁነታዎች' : 'Categories and modes shown on the public page'}</summary>
      <p><strong>Categories:</strong> {HUB_SECTIONS.filter(section => section.id !== 'all').map(section => `${section.label.en} / ${section.label.am}`).join(' · ')}</p>
      <p><strong>Modes:</strong> {GAME_MODES.map(mode => `${mode.en} (${mode.games.length})`).join(' · ')}</p>
    </details>
  </section>
}

/** The content the public game ships with: visible, searchable, never editable in place. */
export function BuiltInSection({ game, am, filters, onOpen }: { game: StudioGame; am: boolean; filters: BuiltInFilters; onOpen: (itemId: string) => void }) {
  const [limit, setLimit] = useState(12)
  const origin = builtInOrigin(game)
  const all = useMemo(() => builtInContent(game), [game])
  const shown = all.filter(item => matchesBuiltIn(item, filters))
  const language = am ? 'am' : 'en'
  return <section className={s.group} aria-label={am ? 'አብሮ የተሰራ ይዘት' : 'Built-in content'} data-built-in-section>
    <h3>{am ? 'አሁን በህዝብ ጨዋታው ላይ ያለ ይዘት' : 'Built-in content in the public game'} <span className={s.badge}>{origin.kind === 'supabase' ? 'Supabase' : 'Built-in · read-only'}</span></h3>
    <p className={s.hint}>{origin.note}. Source: <code>{origin.file}</code>. {am ? 'ለአርትዖት ቅጂ ይክፈቱ፤ ዋናው አይቀየርም።' : 'Open an item to edit a draft COPY; the built-in original and the live site are not changed.'}</p>
    {game === 'finish-the-mezmur'
      ? <p className={s.notice}>This game builds its rounds from published Mezmur records. Manage the lyrics in the <Link to="/admin/hymns/mezmur">Hymn CMS</Link>.</p>
      : <p className={s.libraryCount} role="status" data-built-in-count>{shown.length} of {all.length} {am ? 'አብሮ የተሰሩ ንጥሎች' : 'built-in items shown'}</p>}
    <ul className={s.library}>{shown.slice(0, limit).map(item => <li key={item.key} data-built-in-item={item.id}>
      <div className={s.itemMain}>
        <strong lang={language}>{item.title[language] || item.title.en}</strong>
        <small lang={language}>{(item.detail[language] || item.detail.en).slice(0, 140)}</small>
        <small>{[item.category, item.difficulty, item.reference].filter(Boolean).join(' · ')}</small>
      </div>
      <span className={s.badge}>{item.locales.map(locale => (locale === 'en' ? 'EN' : 'አማ')).join(' + ')}</span>
      <span className={s.badge}>{am ? 'ይፋዊ · አብሮ የተሰራ' : 'Live · built-in'}</span>
      <button type="button" onClick={() => onOpen(item.id)}>{am ? 'ቅጂ ክፈት' : 'Open editable copy'}</button>
    </li>)}</ul>
    {shown.length > limit && <button type="button" onClick={() => setLimit(limit + 12)}>{am ? 'ተጨማሪ አሳይ' : 'Show more'}</button>}
  </section>
}

/* ------------------------------------------------------------------ Game settings (local proposals) */
export function GameSettingsPanel({ owner, role, am, initialGame, onOpenGame }: { owner: string; role: string; am: boolean; initialGame: string | null; onOpenGame: (game: StudioGame) => void }) {
  const store = useMemo(() => settingsStorage(localStorage, owner, role), [owner, role])
  const [state, setState] = useState(() => store.load())
  const initial = HUB_GAMES.find(game => studioIdForHubGame(game.id) === initialGame)?.id || HUB_GAMES[0].id
  const [selected, setSelected] = useState(initial)
  const [draft, setDraft] = useState<GameSettingsDraft>(() => structuredClone(state.games.find(game => game.id === initial)!))
  const [locale, setLocale] = useState<'en' | 'am'>(am ? 'am' : 'en')
  const [error, setError] = useState(state.corrupt ? 'Saved game settings were unreadable and were not changed.' : '')
  const [notice, setNotice] = useState('')
  const hub = HUB_GAMES.find(game => game.id === selected)!
  const others = state.games.map(game => (game.id === draft.id ? draft : game))
  const issues = validateSettings(draft, others)
  const blockingIssues = issues.filter(issue => !issue.startsWith('Amharic title'))
  const dirty = JSON.stringify(draft) !== JSON.stringify(state.games.find(game => game.id === selected))
  const choose = (id: string) => { setSelected(id); setDraft(structuredClone(state.games.find(game => game.id === id)!)); setNotice(''); setError('') }
  const save = () => {
    try { store.save(draft); const next = store.load(); setState(next); setNotice('Saved as a LOCAL proposal and reopened. The public hub still shows the built-in settings. / በአካባቢ ረቂቅ ተቀምጧል።'); setError('') }
    catch (cause) { setError(message(cause)) }
  }
  const reset = () => {
    try {
      store.reset(selected); const next = store.load(); setState(next); setDraft(structuredClone(next.games.find(game => game.id === selected)!)); setNotice('Restored the values the public hub shows today.'); setError('') }
    catch (cause) { setError(message(cause)) }
  }
  const art = GAME_ART[draft.thumbnail]
  const previewGame = { ...hub, title: draft.title, description: draft.description, meta: draft.meta.en || draft.meta.am ? draft.meta : undefined,
    art: art || { ...hub.art, src: '', fallbackSrc: '' }, levels: draft.levels.length > 0 }
  return <section className={s.group} aria-label="Game settings" data-game-settings>
    <h2>{am ? 'የጨዋታ ቅንብር' : 'Game settings'}</h2>
    <p className={s.notice} role="note" data-settings-limitation>{am ? 'እነዚህ በአካባቢዎ የሚቀመጡ ረቂቆች ናቸው፤ ህዝባዊውን ገጽ አይቀይሩም።' : 'These are LOCAL proposals stored in this browser. They do not change the public hub: it still reads built-in settings. A reviewed settings table and public reader are required first.'}</p>
    {error && <p role="alert" className={s.error}>{error}</p>}{notice && <p role="status">{notice}</p>}
    <div className={s.columns}>
      <label className={s.field}>{am ? 'ጨዋታ' : 'Game'}<select data-settings-game value={selected} onChange={event => choose(event.target.value)}>
        {[...state.games].sort((a, b) => a.order - b.order).map(game => <option key={game.id} value={game.id}>{String(game.order).padStart(2, '0')} · {game.title.en}{state.saved.has(game.id) ? ' ●' : ''}{game.enabled ? '' : ' (disabled)'}</option>)}
      </select></label>
      <label className={s.field}>{am ? 'የቅድመ እይታ ቋንቋ' : 'Preview language'}<select value={locale} onChange={event => setLocale(event.target.value as 'en' | 'am')}><option value="en">English</option><option value="am">አማርኛ</option></select></label>
    </div>
    <div className={s.workspace}>
      <fieldset className={s.form}>
        <legend className={s.srOnly}>{hub.title.en}</legend>
        <BilingualField label="Title / ርዕስ" value={draft.title} onChange={title => setDraft({ ...draft, title: { en: title.en, am: title.am || '' } })} />
        <BilingualField label="Description / መግለጫ" value={draft.description} multiline onChange={description => setDraft({ ...draft, description: { en: description.en, am: description.am || '' } })} />
        <BilingualField label="Short facts / አጭር መረጃ" value={draft.meta} onChange={meta => setDraft({ ...draft, meta: { en: meta.en, am: meta.am || '' } })} />
        <BilingualField label="Instructions / መመሪያ (proposal only)" value={draft.instructions} multiline onChange={instructions => setDraft({ ...draft, instructions: { en: instructions.en, am: instructions.am || '' } })} />
        <div className={s.columns}>
          <label className={s.field}>Change Image / ምስል ቀይር<select data-settings-thumbnail value={draft.thumbnail} onChange={event => setDraft({ ...draft, thumbnail: event.target.value })}><option value="">No image / ምስል የለም</option>{THUMBNAIL_KEYS.map(key => <option key={key} value={key}>{key}</option>)}</select></label>
          <button type="button" disabled={!draft.thumbnail} onClick={() => setDraft({ ...draft, thumbnail: '' })}>Remove Image / ምስል አስወግድ</button>
          <TextField label="Display order / ቅደም ተከተል" type="number" value={String(draft.order)} onChange={value => setDraft({ ...draft, order: Number.parseInt(value, 10) || 0 })} />
        </div>
        <div className={s.actions}>
          <label><input type="checkbox" checked={draft.featured} onChange={event => setDraft({ ...draft, featured: event.target.checked })} /> Featured / ተመራጭ</label>
          <label><input type="checkbox" checked={draft.enabled} onChange={event => setDraft({ ...draft, enabled: event.target.checked })} /> Enabled / ክፍት</label>
        </div>
        {hub.levels
          ? <fieldset className={s.group}><legend>Difficulty available / ደረጃዎች</legend><div className={s.actions}>{GAME_LEVELS.map(level => <label key={level}><input type="checkbox" checked={draft.levels.includes(level)}
              onChange={event => setDraft({ ...draft, levels: event.target.checked ? [...draft.levels, level] : draft.levels.filter(item => item !== level) })} /> {level}</label>)}</div></fieldset>
          : <p className={s.hint}>This game has no difficulty levels in gameplay.</p>}
      </fieldset>
      <aside aria-label="Accurate hub card preview">
        <h3>{am ? 'የካርድ ቅድመ እይታ' : 'Hub card preview'}</h3>
        <div style={{ pointerEvents: 'none' }} aria-hidden="true"><GameCard game={previewGame} locale={locale} /></div>
        <p className={s.hint}>{draft.featured ? 'Featured: ' : ''}{draft.enabled ? 'Enabled' : 'Disabled (would be hidden)'} · order {draft.order}</p>
        <button type="button" onClick={() => onOpenGame(studioIdForHubGame(selected))}>{am ? 'የዚህን ጨዋታ ይዘት ክፈት' : 'Open this game’s content'}</button>
      </aside>
    </div>
    {!!issues.length && <section className={s.error} aria-label="Validation"><strong>Check before saving</strong><ul>{issues.map((issue, index) => <li key={index}>{issue}</li>)}</ul></section>}
    <div className={s.actions}>
      <button type="button" disabled={!dirty || !!blockingIssues.length} onClick={save}>Save local proposal / ረቂቅ አስቀምጥ</button>
      <button type="button" disabled={!dirty} onClick={() => {
        if (window.confirm('Undo unsaved game card changes? / ያልተቀመጡ ለውጦችን ይመልሱ?')) { setDraft(structuredClone(state.games.find(game => game.id === selected)!)); setError(''); setNotice('') }
      }}>Undo unsaved changes / ያልተቀመጡ ለውጦችን መልስ</button>
      <button type="button" disabled={!state.saved.has(selected)} onClick={reset}>Restore public values</button>
      <button type="button" onClick={() => {
        const url = URL.createObjectURL(new Blob([exportSettings(state.games)], { type: 'application/json' }))
        const anchor = document.createElement('a'); anchor.href = url; anchor.download = 'faith-challenges-game-settings-proposal.json'; anchor.click(); window.setTimeout(() => URL.revokeObjectURL(url), 1000)
      }}>Export proposals</button>
    </div>
  </section>
}

/* ------------------------------------------------------------------ Coverage matrix */
export function CoveragePanel({ am, onOpen }: { am: boolean; onOpen: (target: { view?: StudioView; game?: StudioGame }) => void }) {
  const rows = useMemo(() => coverageRows(), [])
  const [filter, setFilter] = useState('')
  const shown = rows.filter(row => !filter.trim() || `${row.feature} ${row.source} ${row.blocker} ${row.game}`.toLocaleLowerCase().includes(filter.trim().toLocaleLowerCase()))
  return <section className={s.group} aria-label="Coverage matrix" data-coverage-matrix>
    <h2>{am ? 'የህዝብ ገጽ ሽፋን' : 'Public page → CMS coverage'}</h2>
    <p className={s.hint}>Every content-driven feature visitors see, with where it really comes from. Anything that cannot be edited or published yet is still listed, with its limitation.</p>
    <TextField label="Filter features / አጣራ" value={filter} onChange={setFilter} />
    <p className={s.libraryCount} role="status">{shown.length} of {rows.length} features</p>
    <div className={s.tableWrap}><table className={s.table}>
      <thead><tr><th scope="col">Public feature</th><th scope="col">Source file / data</th><th scope="col">CMS view</th><th scope="col">Editable?</th><th scope="col">Public adapter?</th><th scope="col">Blocker</th></tr></thead>
      <tbody>{shown.map(row => <tr key={row.id} data-coverage-row={row.id}>
        <th scope="row">{row.feature}</th><td>{row.source}</td>
        <td><button type="button" onClick={() => onOpen({ view: row.cms.view, game: row.cms.game })}>{row.cms.label}</button></td>
        <td><strong>{capabilityLabel[row.editable.level]}</strong> — {row.editable.text}</td>
        <td><strong>{capabilityLabel[row.adapter.level]}</strong> — {row.adapter.text}</td>
        <td>{row.blocker || '—'}</td>
      </tr>)}</tbody>
    </table></div>
  </section>
}

/* ------------------------------------------------------------------ Campaign drafts */
const reviewLabel: Record<ReviewState, string> = { unreviewed: 'Unreviewed', ready: 'Ready for draft import', rejected: 'Rejected' }
export function CampaignPanel({ owner, am }: { owner: string; am: boolean }) {
  const store = useMemo(() => reviewStorage(localStorage, owner), [owner])
  const [parsed, setParsed] = useState<ParsedCampaign | null>(null)
  const [reviews, setReviews] = useState<Record<string, ReviewRecord>>(() => store.load())
  const [error, setError] = useState('')
  const [limit, setLimit] = useState(25)
  const [filters, setFilters] = useState({ search: '', batch: 'all', game: 'all', difficulty: 'all', validity: 'all', review: 'all', book: 'all' })
  const items = parsed?.items || []
  const unique = (pick: (item: CampaignItem) => string) => [...new Set(items.map(pick).filter(Boolean))].sort()
  const shown = items.filter(item => (filters.batch === 'all' || item.batch === filters.batch) && (filters.game === 'all' || item.game === filters.game)
    && (filters.difficulty === 'all' || item.difficulty === filters.difficulty) && (filters.book === 'all' || item.bookSlug === filters.book)
    && (filters.validity === 'all' || (filters.validity === 'valid' ? !item.errors.length : !!item.errors.length))
    && (filters.review === 'all' || (reviews[item.id]?.state || 'unreviewed') === filters.review)
    && (!filters.search.trim() || JSON.stringify(item.question).toLocaleLowerCase().includes(filters.search.trim().toLocaleLowerCase())))
  const candidates = importCandidates(items, reviews)
  const set = (key: keyof typeof filters, value: string) => { setFilters({ ...filters, [key]: value }); setLimit(25) }
  const select = (key: keyof typeof filters, label: string, options: string[]) => <label className={s.field}>{label}<select value={filters[key]} onChange={event => set(key, event.target.value)}><option value="all">All</option>{options.map(option => <option key={option}>{option}</option>)}</select></label>
  return <section className={s.group} aria-label="Campaign drafts" data-campaign-panel>
    <h2>{am ? 'የዘመቻ ረቂቆች' : 'Generated question campaign'}</h2>
    <p className={s.notice} role="note">{am ? 'እነዚህ በማሽን የተፈጠሩ ረቂቆች ናቸው፤ ሰው እስኪገመግማቸው አልጸደቁም ወይም አልታተሙም።' : 'Generated drafts are NOT approved and NOT published. Your review decisions stay in this browser; the only output is a file of validated draft candidates for the existing import tool. Generated Amharic stays unverified until a person reviews it.'}</p>
    {error && <p role="alert" className={s.error}>{error}</p>}
    <label className={s.field}>Open a drafts file (batch-00N/drafts.json or library/all-drafts.json) / ፋይል ክፈት<input type="file" accept="application/json,.json" data-campaign-file onChange={event => {
      const file = event.target.files?.[0]; setParsed(null); setError('')
      if (!file) return
      void file.text().then(raw => { setParsed(parseCampaignFile(raw, file.name)); setLimit(25) }).catch(cause => setError(message(cause)))
    }} /></label>
    {parsed && <>
      <p className={s.libraryCount} role="status" data-campaign-summary>{items.length} drafts · {items.filter(item => !item.errors.length).length} valid · {items.filter(item => reviews[item.id]?.state === 'ready').length} marked ready ({candidates.length} exportable) · {parsed.skipped} skipped · {parsed.campaignId || 'campaign file'}</p>
      <div className={s.columns}>
        <TextField label="Search / ፈልግ" value={filters.search} onChange={value => set('search', value)} />
        {select('batch', 'Batch', unique(item => item.batch))}{select('book', 'Book', unique(item => item.bookSlug))}
        {select('game', 'Question type', unique(item => item.game))}{select('difficulty', 'Difficulty', unique(item => item.difficulty))}
        <label className={s.field}>Validation<select value={filters.validity} onChange={event => set('validity', event.target.value)}><option value="all">All</option><option value="valid">Valid</option><option value="invalid">Has errors</option></select></label>
        <label className={s.field}>Human review<select value={filters.review} onChange={event => set('review', event.target.value)}><option value="all">All</option>{(Object.keys(reviewLabel) as ReviewState[]).map(state => <option key={state} value={state}>{reviewLabel[state]}</option>)}</select></label>
      </div>
      <p className={s.libraryCount} role="status" data-campaign-shown>{shown.length} shown</p>
      <ul className={s.library}>{shown.slice(0, limit).map(item => {
        const state = reviews[item.id]?.state || 'unreviewed'
        const correct = item.question.options.find(option => option.key === item.question.correctKey)
        return <li key={item.id} data-campaign-item={item.id}><details className={s.itemMain}>
          <summary><strong>{item.question.prompt.en || item.question.prompt.am}</strong>
            <small> {item.batch} · {item.bookSlug} {item.chapter}:{item.verse} · {item.game} · {item.difficulty}</small></summary>
          <p lang="am">{item.question.prompt.am || '—'}</p>
          <ol>{item.question.options.map(option => <li key={option.key}>{option.key.toUpperCase()}. {option.text.en} / <span lang="am">{option.text.am || '—'}</span>{option.key === item.question.correctKey ? ' ✓' : ''}</li>)}</ol>
          <p><strong>Answer:</strong> {correct?.text.en}</p>
          <p>{item.question.explanation.en}</p><p lang="am">{item.question.explanation.am}</p>
          <p><strong>Source evidence:</strong> <Link to={item.question.source.route}>{item.question.source.label}</Link> · passage {item.evidence.passageId || '—'} · verse {item.evidence.evidenceVerseId.slice(0, 8) || '—'} · edition {item.evidence.edition || '—'} · model {item.evidence.modelId || '—'} · source hash {item.evidence.sourceHash.slice(0, 8) || '—'}</p>
          {!!item.errors.length && <ul className={s.error}>{item.errors.map((err, index) => <li key={index}>{err}</li>)}</ul>}
        </details>
          <span className={s.badge}>Generated draft</span>
          <span className={s.badge}>{item.errors.length ? `${item.errors.length} validation error(s)` : 'Valid'}</span>
          <span className={s.badge}>{item.amharic === 'present' ? 'Amharic unverified' : 'No Amharic'}</span>
          <label className={s.field}>Human review<select aria-label={`Human review for ${item.id}`} value={state} onChange={event => {
            try { store.set(item.id, event.target.value as ReviewState); setReviews(store.load()) } catch (cause) { setError(message(cause)) }
          }}>{(Object.keys(reviewLabel) as ReviewState[]).map(option => <option key={option} value={option}>{reviewLabel[option]}</option>)}</select></label>
        </li>
      })}</ul>
      {shown.length > limit && <button type="button" onClick={() => setLimit(limit + 25)}>Show more</button>}
      <div className={s.actions}>
        <button type="button" disabled={!candidates.length} data-campaign-download onClick={() => {
          const url = URL.createObjectURL(new Blob([`${JSON.stringify(candidates, null, 2)}\n`], { type: 'application/json' }))
          const anchor = document.createElement('a'); anchor.href = url; anchor.download = 'faith-challenges-reviewed-draft-candidates.json'; anchor.click(); window.setTimeout(() => URL.revokeObjectURL(url), 1000)
        }}>Download {candidates.length} reviewed draft candidates</button>
        <Link to="/admin/play/import">Open Advanced import &amp; data tools</Link>
      </div>
      <p className={s.hint}>The file contains drafts only (no status or publish field). The import tool still shows its own preview and asks for confirmation; approval and publication remain separate editorial steps.</p>
    </>}
  </section>
}

/* ------------------------------------------------------------------ Content status (bundled vs database vs held back) */
const unitWord = (unit: string) => unit === 'records' ? 'records' : unit
/**
 * What each public game actually plays, by origin. Bundled = shipped in the website build (built-in + generated items that
 * passed automated checks, NOT human-reviewed). Database = Studio rows, which a website deploy never publishes.
 */
export function ContentStatusPanel({ am, saved, onOpen }: { am: boolean; saved: SavedCounts; onOpen: (game: StudioGame) => void }) {
  const rows = useMemo(() => bundledStatusRows(), [])
  const [previewGame, setPreviewGame] = useState<StudioGame | null>(null)
  const [items, setItems] = useState<GeneratedPreviewItem[] | null>(null)
  const [search, setSearch] = useState('')
  const [limit, setLimit] = useState(25)
  const databaseOnly = databasePlayEnabled()
  const totals = rows.reduce((sum, row) => ({ builtIn: sum.builtIn + row.builtIn, generated: sum.generated + row.generatedBundled, held: sum.held + row.heldBack, dup: sum.dup + row.duplicates }), { builtIn: 0, generated: 0, held: 0, dup: 0 })
  const open = (game: StudioGame) => {
    setPreviewGame(game); setItems(null); setSearch(''); setLimit(25)
    void loadGeneratedPreview(game).then(setItems, () => setItems([]))
  }
  const shown = (items ?? []).filter(item => !search.trim() || `${item.id} ${item.title} ${item.detail} ${item.reference}`.toLocaleLowerCase().includes(search.trim().toLocaleLowerCase()))
  return <section className={s.group} aria-label="Content status" data-content-status>
    <h2>{am ? 'የይዘት ሁኔታ' : 'Content status'}</h2>
    <p className={s.hint}>What visitors can play today, split by where it lives and whether a person has reviewed it. Deploying the website never creates, changes or publishes database records.</p>
    <p role="status" data-content-source>
      <strong>{databaseOnly ? 'This build plays database-published content only.' : 'This build plays the bundled content below.'}</strong>{' '}
      {databaseOnly ? 'The bundled counts here are NOT what visitors get; only published database rows play.' : 'Published database rows, when present, are added on top of it.'}
    </p>
    <p role="note" data-content-legend>
      <span className={s.badge}>Built-in</span> written in the source code and hand-approved · <span className={s.badge}>Generated</span> machine-validated (sources, answers, duplicates) and bundled, <strong>awaiting human review</strong> — Amharic text unreviewed ·{' '}
      <span className={s.badge}>Held back</span> kept out of public play until reviewed · <span className={s.badge}>Database</span> Studio rows: drafts or published through the review workflow.
    </p>
    <div className={s.tableWrap}><table className={s.table}>
      <caption className={s.srOnly}>Content by origin and review state for each Faith Challenge game</caption>
      <thead><tr><th scope="col">Game</th><th scope="col">Unit</th><th scope="col">Built-in</th><th scope="col">Generated (bundled, awaiting review)</th><th scope="col">Playable now</th><th scope="col">Held back</th><th scope="col">Duplicates removed</th><th scope="col">Database (server / local drafts)</th><th scope="col">Inspect</th></tr></thead>
      <tbody>{rows.map(row => {
        const count = saved[row.game] || { server: 0, local: 0 }
        return <tr key={row.game} data-status-row={row.game}>
          <th scope="row"><button type="button" onClick={() => onOpen(row.game)}>{gameName(row.game, am)}</button></th>
          <td>{unitWord(row.unit)}</td>
          <td>{row.fromDatabase ? '—' : row.builtIn}</td>
          <td>{row.fromDatabase ? '—' : row.generatedBundled}</td>
          <td>{row.fromDatabase ? (am ? 'ከታተሙ መዝሙሮች' : 'from published hymns') : row.playable}</td>
          <td title={Object.entries(row.heldReasons).filter(([reason]) => !reason.startsWith('substantially') && !reason.startsWith('exact')).map(([reason, n]) => `${n} · ${reason}`).join('\n')}>{row.heldBack}</td>
          <td>{row.duplicates}</td>
          <td>{count.server} / {count.local}</td>
          <td>{row.generatedBundled ? <button type="button" data-preview-generated={row.game} onClick={() => open(row.game)}>View generated</button> : '—'}</td>
        </tr>
      })}</tbody>
      <tfoot><tr><th scope="row">All games</th><td>—</td><td>{totals.builtIn}</td><td>{totals.generated}</td><td colSpan={1}>—</td><td>{totals.held}</td><td>{totals.dup}</td><td colSpan={2}>—</td></tr></tfoot>
    </table></div>
    <p className={s.hint}>Units differ between games and are not added together: History&apos;s 3 timeline events, Timeline&apos;s events inside its chains, and the picture games&apos; images are separate from question counts. Held-back items stay out of public play: they cite sources that could not be verified, or make claims that need doctrinal review. Their reasons appear when you hover the number, and the full audit is in docs/ai/faith-challenges-publication-ledger.json.</p>
    {previewGame && <div className={s.group} data-generated-preview={previewGame}>
      <h3>{gameName(previewGame, am)} — generated items (read-only)</h3>
      <p className={s.hint}>Machine-validated and awaiting human review. Not database rows; nothing here is marked reviewed or published. Edit or promote an item through its Library draft copy.</p>
      <TextField label="Search generated items" value={search} onChange={value => { setSearch(value); setLimit(25) }} />
      {items === null ? <p role="status">Loading…</p> : <>
        <p className={s.libraryCount} role="status">{shown.length} of {items.length} generated items</p>
        <ul>{shown.slice(0, limit).map(item => <li key={item.id}><strong>{item.title}</strong> — {item.detail} <small>({item.reference || 'no source'} · {item.id})</small></li>)}</ul>
        {shown.length > limit && <button type="button" onClick={() => setLimit(limit + 50)}>Show more</button>}
      </>}
      <button type="button" onClick={() => setPreviewGame(null)}>Close</button>
    </div>}
  </section>
}
