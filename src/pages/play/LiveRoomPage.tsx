import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { useLocale } from '../../lib/i18n/locale'
import { questionsFor, WHO_AM_I_CARDS } from '../../lib/play/approvedContent'
import { loadGeneratedCards, loadGeneratedQuestions, mergeById } from '../../lib/play/generatedBank'
import {
  HostEngine, LIVE_GAMES, MAX_PLAYERS, ROUND_OPTIONS, cleanName, isLiveGame, joinLink, newRoomCode, normalizeCode, questionRounds, reduceView, validCode, whoAmIRounds,
  type HostMsg, type LiveGame, type PlayerView, type PreparedRound, type PublicQuestion, type Score,
} from '../../lib/play/liveRoom'
import { createRealtimeTransport, type Transport } from '../../lib/play/liveTransport'
import { newSeed } from '../../lib/play/sessionRandom'
import type { WhoAmICard, PlayQuestion } from '../../lib/play/types'
import { RoomQrCode } from '../../components/play/RoomQrCode'
import s from './LiveRoom.module.css'

const GAME_TITLES: Record<LiveGame, { en: string; am: string }> = {
  trivia: { en: 'Bible & Tewahedo Trivia', am: 'የመጽሐፍ ቅዱስና ተዋሕዶ ጥያቄ' },
  'finish-the-verse': { en: 'Finish the Verse', am: 'ጥቅሱን ይጨርሱ' },
  emoji: { en: 'Holy Emoji Challenge', am: 'የቅዱስ ኢሞጂ ፈተና' },
  'who-am-i': { en: 'Who Am I?', am: 'እኔ ማን ነኝ?' },
}
type Pick = (text: { en: string; am?: string }) => { text: string; lang?: string }

const storeGet = (key: string) => { try { return window.localStorage.getItem(key) } catch { return null } }
const storeSet = (key: string, value: string | null) => { try { if (value === null) window.localStorage.removeItem(key); else window.localStorage.setItem(key, value) } catch { /* in-memory only */ } }
const RECENT = (game: string) => `td.live.recent.${game}`
const recentIds = (game: string): Set<string> => { try { return new Set(JSON.parse(storeGet(RECENT(game)) || '[]') as string[]) } catch { return new Set() } }
const rememberRecent = (game: string, ids: string[]) => storeSet(RECENT(game), JSON.stringify([...new Set([...recentIds(game), ...ids])].slice(-300)))

async function buildRounds(game: LiveGame, count: number, difficulty: string, seed: number): Promise<PreparedRound[]> {
  const avoid = recentIds(game)
  if (game === 'who-am-i') {
    const generated = await loadGeneratedCards('who-am-i').catch(() => [] as WhoAmICard[])
    return whoAmIRounds(mergeById(WHO_AM_I_CARDS, generated as WhoAmICard[]), count, seed, avoid)
  }
  const generated = await loadGeneratedQuestions(game).catch(() => [] as PlayQuestion[])
  return questionRounds(game, mergeById(questionsFor(game), generated), count, seed, difficulty, avoid)
}

function useSecondsLeft(deadline: number | null) {
  const [now, setNow] = useState(() => Date.now())
  useEffect(() => {
    if (!deadline) return
    const timer = window.setInterval(() => setNow(Date.now()), 250)
    return () => window.clearInterval(timer)
  }, [deadline])
  return deadline ? Math.max(0, Math.ceil((deadline - now) / 1000)) : 0
}

function Leaderboard({ scores, me, am }: { scores: Score[]; me?: string; am: boolean }) {
  return (
    <ol className={s.board} aria-label={am ? 'የውጤት ሰንጠረዥ' : 'Leaderboard'}>
      {scores.map((row, i) => (
        <li key={row.id} className={row.id === me ? s.me : undefined}>
          <span className={s.rank} aria-hidden="true">{i + 1}</span>
          <span className={s.who}>{row.name}{row.id === me ? (am ? ' (እርስዎ)' : ' (you)') : ''}{row.connected ? '' : (am ? ' · ተቋርጧል' : ' · offline')}</span>
          <span className={s.points}>{row.score}<small> {am ? 'ነጥብ' : 'pts'}</small></span>
        </li>
      ))}
    </ol>
  )
}

function QuestionCard({ q, pick, am, children }: { q: PublicQuestion; pick: Pick; am: boolean; children: React.ReactNode }) {
  const prompt = pick(q.prompt)
  return (
    <article className={s.question}>
      {q.kind === 'who-am-i' ? <p className={s.kicker}>{am ? 'እኔ ማን ነኝ?' : 'Who am I?'}</p> : null}
      {q.emoji ? <div className={s.emoji} aria-label={am ? 'የኢሞጂ ፍንጮች' : 'Emoji clues'}>{q.emoji}</div> : null}
      {q.excerpt ? <p className={s.excerpt} lang={pick(q.excerpt).lang}>{pick(q.excerpt).text}</p> : null}
      <h2 className={s.prompt} lang={prompt.lang} tabIndex={-1}>{prompt.text}</h2>
      {children}
    </article>
  )
}

/* ------------------------------------------------------------------ entry */
export function LiveRoomEntry() {
  const { locale } = useLocale()
  const am = locale === 'am'
  const navigate = useNavigate()
  const [game, setGame] = useState<LiveGame>('trivia')
  const [count, setCount] = useState<number>(10)
  const [difficulty, setDifficulty] = useState('all')
  const [name, setName] = useState(() => storeGet('td.live.name') || '')
  const [code, setCode] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const hostingDisabled = !isLiveGame(game)

  const create = async () => {
    const hostName = cleanName(name) || (am ? 'አስተናጋጅ' : 'Host')
    setBusy(true); setError('')
    try {
      const rounds = await buildRounds(game, count, difficulty, newSeed())
      if (rounds.length < 3) throw new Error(am ? 'ለዚህ ምርጫ በቂ ጥያቄ የለም። ሌላ ደረጃ ይምረጡ።' : 'Not enough questions for these settings. Try another difficulty.')
      const roomCode = newRoomCode()
      const engine = new HostEngine(roomCode, game, hostName, rounds)
      storeSet('td.live.name', hostName)
      storeSet(`td.live.host.${roomCode}`, JSON.stringify(engine.serialize()))
      navigate(`/play/live/${roomCode}?host=1`)
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Could not create the room.') }
    finally { setBusy(false) }
  }
  const join = (event: React.FormEvent) => {
    event.preventDefault()
    const clean = normalizeCode(code)
    if (!validCode(clean)) { setError(am ? 'የክፍል ኮድ 5 ፊደላት ወይም ቁጥሮች ነው።' : 'A room code is 5 letters or numbers.'); return }
    navigate(`/play/live/${clean}`)
  }
  return (
    <div className={s.page} lang={locale}>
      <header className={s.header}>
        <Link to="/play" className={s.back}>← {am ? 'ወደ ጨዋታ' : 'All games'}</Link>
        <h1>{am ? 'ከጓደኞች ጋር ይጫወቱ' : 'Play together'}</h1>
        <p>{am ? 'ክፍል ይክፈቱ፣ ኮዱን ወይም አገናኙን ያጋሩ፣ ሁሉም ከራሱ ስልክ ይመልሳል።' : 'Host a room, share the code or link, and everyone answers from their own device.'}</p>
      </header>
      <div className={s.twoCol}>
        <section className={s.card} aria-labelledby="host-title">
          <h2 id="host-title">{am ? 'ክፍል ይክፈቱ' : 'Host a game'}</h2>
          <label className={s.field}>{am ? 'የእርስዎ ስም' : 'Your name'}<input value={name} maxLength={20} onChange={(e) => setName(e.target.value)} autoComplete="nickname" /></label>
          <fieldset className={s.field}><legend>{am ? 'ጨዋታ' : 'Game'}</legend>
            <div className={s.choices}>{LIVE_GAMES.map((id) => <button key={id} type="button" aria-pressed={game === id} onClick={() => setGame(id)}>{GAME_TITLES[id][am ? 'am' : 'en']}</button>)}</div>
          </fieldset>
          <fieldset className={s.field}><legend>{am ? 'የጥያቄ ብዛት' : 'Questions'}</legend>
            <div className={s.choices}>{ROUND_OPTIONS.map((n) => <button key={n} type="button" aria-pressed={count === n} onClick={() => setCount(n)}>{n}</button>)}</div>
          </fieldset>
          {game !== 'who-am-i' ? (
            <fieldset className={s.field}><legend>{am ? 'ደረጃ' : 'Difficulty'}</legend>
              <div className={s.choices}>{['all', 'beginner', 'growing', 'challenge'].map((id) => <button key={id} type="button" aria-pressed={difficulty === id} onClick={() => setDifficulty(id)}>{id === 'all' ? (am ? 'ሁሉም' : 'Mixed') : id}</button>)}</div>
            </fieldset>
          ) : null}
          <button type="button" className={s.primary} disabled={busy || hostingDisabled} onClick={() => void create()}>{busy ? (am ? 'በመፍጠር ላይ…' : 'Creating…') : (am ? 'ክፍል ፍጠር' : 'Create room')}</button>
          <p className={s.hint}>{am ? `እስከ ${MAX_PLAYERS} ተጫዋቾች። ክፍሉ ለ4 ሰዓት ክፍት ነው። እርስዎ የሚጫወቱት ከዚህ መሣሪያ ነው — መሣሪያው ክፍት ሆኖ መቆየት አለበት።` : `Up to ${MAX_PLAYERS} players. The room stays open for 4 hours. You are the referee, so keep this tab open.`}</p>
        </section>
        <section className={s.card} aria-labelledby="join-title">
          <h2 id="join-title">{am ? 'ክፍል ይቀላቀሉ' : 'Join a game'}</h2>
          <form onSubmit={join}>
            <label className={s.field}>{am ? 'የክፍል ኮድ' : 'Room code'}<input className={s.code} value={code} maxLength={8} autoCapitalize="characters" autoComplete="off" inputMode="text" aria-describedby="code-help" onChange={(e) => setCode(e.target.value.toUpperCase())} /></label>
            <p id="code-help" className={s.hint}>{am ? 'ከአስተናጋጁ የተሰጠዎትን 5 ፊደል ኮድ ያስገቡ።' : 'Enter the 5-character code from the host.'}</p>
            <button type="submit" className={s.primary}>{am ? 'ቀጥል' : 'Continue'}</button>
          </form>
        </section>
      </div>
      {error ? <p role="alert" className={s.error}>{error}</p> : null}
    </div>
  )
}

/* ------------------------------------------------------------------ host */
function HostRoom({ code, initial }: { code: string; initial: HostEngine }) {
  const { locale } = useLocale()
  const am = locale === 'am'
  const pick: Pick = (t) => (am && t.am ? { text: t.am, lang: 'am' } : { text: t.en, lang: am ? 'en' : undefined })
  // The engine is one mutable referee object for the life of the page; state keeps it stable, a counter re-renders.
  const [engine] = useState(() => initial)
  const transportRef = useRef<Transport | null>(null)
  const [, rerender] = useState(0)
  const [now, setNow] = useState(() => Date.now())
  const [status, setStatus] = useState<'connecting' | 'online' | 'error'>('connecting')
  const [error, setError] = useState('')
  const [copied, setCopied] = useState(false)
  const link = joinLink(window.location.origin, code)

  const publish = useCallback((messages: HostMsg[]) => {
    for (const body of messages) transportRef.current?.send({ from: 'host', body })
    storeSet(`td.live.host.${code}`, JSON.stringify(engine.serialize()))
    rerender((n) => n + 1)
  }, [code, engine])

  useEffect(() => {
    const transport = createRealtimeTransport(code, 'host')
    if (!transport) { queueMicrotask(() => { setStatus('error'); setError(am ? 'የቀጥታ ክፍሎች ከዚህ ጣቢያ ጋር አልተገናኙም።' : 'Live rooms are not available on this site right now.') }); return }
    transportRef.current = transport
    transport.onMessage((envelope) => { if (envelope.from === 'player') publish(engine.handle(envelope.body)) })
    transport.onPresence((ids) => {
      const present = new Set(ids)
      for (const player of engine.players.values()) if (player.connected !== present.has(player.id)) engine.setConnected(player.id, present.has(player.id))
      publish(engine.lobbyMessage() ? [engine.lobbyMessage()] : [])
    })
    transport.ready.then(() => { setStatus('online'); publish([engine.lobbyMessage()]) }, (cause: Error) => { setStatus('error'); setError(cause.message) })
    return () => { transport.close(); transportRef.current = null }
  }, [code, publish, am, engine])

  // Round clock and room expiry. The host is the only place a round is closed.
  useEffect(() => {
    const timer = window.setInterval(() => {
      const e = engine
      if (e.expired && e.phase !== 'closed') publish(e.close('ended').map((m) => (m.t === 'closed' ? { ...m, reason: 'expired' as const } : m)))
      else if (e.phase === 'round' && Date.now() - e.openedAt >= 30_000) publish(e.reveal())
      else { setNow(Date.now()); rerender((n) => n + 1) }
    }, 500)
    return () => window.clearInterval(timer)
  }, [publish, engine])

  const secondsLeft = engine.phase === 'round' ? Math.max(0, Math.ceil((30_000 - (now - engine.openedAt)) / 1000)) : 0
  const round = engine.rounds[engine.index]
  const roster = engine.roster()
  const answeredCount = 0
  void answeredCount
  const rematch = async () => {
    const used = engine.rounds.map((r) => r.id)
    rememberRecent(engine.game, used)
    const rounds = await buildRounds(engine.game, engine.rounds.length, 'all', newSeed())
    publish(engine.rematch(rounds))
  }
  const copy = async () => {
    try { await navigator.clipboard.writeText(link); setCopied(true); window.setTimeout(() => setCopied(false), 1800) } catch { setError(am ? 'ማገናኛውን መቅዳት አልተቻለም — ይምረጡና ይቅዱት።' : 'Could not copy automatically. Select the link and copy it.') }
  }
  const share = async () => { try { await navigator.share({ title: GAME_TITLES[engine.game].en, url: link }) } catch { /* cancelled */ } }

  return (
    <div className={s.page} lang={locale} data-live-role="host">
      <header className={s.header}>
        <p className={s.kicker}>{am ? 'አስተናጋጅ' : 'Host'} · {GAME_TITLES[engine.game][am ? 'am' : 'en']}</p>
        <h1>{am ? 'የክፍል ኮድ' : 'Room code'} <span className={s.bigCode} data-room-code>{code}</span></h1>
        <p role="status" className={s.status}>{status === 'online' ? (am ? '● በመስመር ላይ' : '● Online') : status === 'connecting' ? (am ? 'በመገናኘት ላይ…' : 'Connecting…') : (am ? 'ግንኙነት የለም' : 'Offline')}</p>
      </header>
      {error ? <p role="alert" className={s.error}>{error}</p> : null}

      {engine.phase === 'lobby' ? (
        <section className={s.card} aria-label="Lobby">
          <h2>{am ? 'ተጫዋቾችን ይጋብዙ' : 'Invite players'}</h2>
          <div className={s.linkRow}><input readOnly value={link} aria-label={am ? 'የመቀላቀያ አገናኝ' : 'Join link'} onFocus={(e) => e.currentTarget.select()} />
            <button type="button" onClick={() => void copy()}>{copied ? (am ? 'ተቀድቷል' : 'Copied') : (am ? 'ቅዳ' : 'Copy link')}</button>
            {typeof navigator.share === 'function' ? <button type="button" onClick={() => void share()}>{am ? 'አጋራ' : 'Share'}</button> : null}</div>
          <RoomQrCode link={link} code={code} am={am} />
          <h3>{am ? 'ተጫዋቾች' : 'Players'} ({roster.length}/{MAX_PLAYERS})</h3>
          {roster.length ? <ul className={s.roster} data-roster>{roster.map((p) => <li key={p.id}><span aria-hidden="true">{p.connected ? '●' : '○'}</span> {p.name}<span className={s.fs}> {p.connected ? '' : (am ? '(ተቋርጧል)' : '(offline)')}</span></li>)}</ul> : <p className={s.hint}>{am ? 'ተጫዋቾችን በመጠበቅ ላይ…' : 'Waiting for players to join…'}</p>}
          <button type="button" className={s.primary} disabled={!roster.length || status !== 'online'} onClick={() => publish(engine.start())} data-start>{am ? 'ጨዋታ ጀምር' : 'Start game'} ({engine.rounds.length} {am ? 'ጥያቄዎች' : 'questions'})</button>
        </section>
      ) : null}

      {(engine.phase === 'round' || engine.phase === 'reveal') && round ? (
        <section aria-label="Round">
          <p className={s.progress}>{am ? `ጥያቄ ${engine.index + 1} ከ ${engine.rounds.length}` : `Question ${engine.index + 1} of ${engine.rounds.length}`}{engine.phase === 'round' ? <strong className={s.timer}> · {secondsLeft}s</strong> : null}</p>
          <QuestionCard q={round.question} pick={pick} am={am}>
            <ul className={s.options}>{round.question.options.map((o) => {
              const right = engine.phase === 'reveal' && o.key === round.correctKey
              return <li key={o.key} className={right ? s.right : undefined}><span lang={pick(o.text).lang}>{pick(o.text).text}</span>{right ? <b> ✓ {am ? 'ትክክል' : 'Correct'}</b> : null}</li>
            })}</ul>
            {engine.phase === 'reveal' ? <p className={s.explain} lang={pick(round.explanation).lang}>{pick(round.explanation).text}</p> : null}
          </QuestionCard>
          <div className={s.actions}>
            {engine.phase === 'round' ? <button key="reveal" type="button" className={s.primary} onClick={() => publish(engine.reveal())} data-reveal>{am ? 'መልሱን አሳይ' : 'Reveal answers'}</button>
              : <button key="next" type="button" className={s.primary} onClick={() => publish(engine.next())} data-next>{engine.index + 1 >= engine.rounds.length ? (am ? 'ውጤቱን አሳይ' : 'Show final results') : (am ? 'ቀጣይ ጥያቄ' : 'Next question')}</button>}
          </div>
          <Leaderboard scores={engine.scores()} am={am} />
        </section>
      ) : null}

      {engine.phase === 'final' ? (
        <section className={s.card} aria-label="Final results">
          <h2>{am ? 'የመጨረሻ ውጤት' : 'Final leaderboard'}</h2>
          <Leaderboard scores={engine.scores()} am={am} />
          <div className={s.actions}>
            <button type="button" className={s.primary} onClick={() => void rematch()} data-rematch>{am ? 'እንደገና (አዲስ ጥያቄዎች)' : 'Rematch with fresh questions'}</button>
            <button type="button" onClick={() => { publish(engine.close('ended')); storeSet(`td.live.host.${code}`, null); window.location.assign('/play') }}>{am ? 'ክፍሉን ዝጋ' : 'Close room'}</button>
          </div>
        </section>
      ) : null}
      {engine.phase === 'closed' ? <section className={s.card}><h2>{am ? 'ክፍሉ ተዘግቷል' : 'This room is closed'}</h2><Link className={s.primary} to="/play/live">{am ? 'አዲስ ክፍል' : 'Start a new room'}</Link></section> : null}
      <p className={s.hint}>{am ? 'ማስታወሻ፦ አስተናጋጁ ዳኛ ነው። ይህ ገጽ ክፍት መሆን አለበት።' : 'You are the referee: keep this page open. Answers stay hidden from players until you reveal them.'}</p>
    </div>
  )
}

/* ------------------------------------------------------------------ player */
function PlayerRoom({ code }: { code: string }) {
  const { locale } = useLocale()
  const am = locale === 'am'
  const pick: Pick = (t) => (am && t.am ? { text: t.am, lang: 'am' } : { text: t.en, lang: am ? 'en' : undefined })
  const idKey = `td.live.pid.${code}`
  const [id] = useState(() => { const saved = storeGet(idKey); if (saved) return saved; const fresh = `p${crypto.randomUUID().replace(/-/g, '').slice(0, 20)}`; storeSet(idKey, fresh); return fresh })
  const [name, setName] = useState(() => storeGet('td.live.name') || '')
  const [joined, setJoined] = useState(() => storeGet(`td.live.joined.${code}`) === '1')
  const [view, setView] = useState<PlayerView>({ phase: 'connecting' })
  const [hostHere, setHostHere] = useState(true)
  const [connected, setConnected] = useState(false)
  const [error, setError] = useState('')
  const transportRef = useRef<Transport | null>(null)
  const seenHost = useRef(false)
  const joinedRef = useRef(joined)
  const send = useCallback((body: Parameters<Transport['send']>[0]['body']) => transportRef.current?.send({ from: 'player', body } as never), [])

  useEffect(() => {
    const transport = createRealtimeTransport(code, id)
    if (!transport) { queueMicrotask(() => setError(am ? 'የቀጥታ ክፍሎች አልተገናኙም።' : 'Live rooms are not available right now.')); return }
    transportRef.current = transport
    transport.onMessage((envelope) => { if (envelope.from === 'host') setView((v) => reduceView(v, envelope.body, id, Date.now())) })
    transport.onPresence((ids) => { const here = ids.includes('host'); if (here) seenHost.current = true; setHostHere(here || !seenHost.current) })
    transport.ready.then(() => { setConnected(true); if (joinedRef.current) transport.send({ from: 'player', body: { t: 'hello', id } }) }, (cause: Error) => setError(cause.message))
    // If nobody answers a reconnect, the room is gone; say so instead of waiting forever.
    const giveUp = window.setTimeout(() => setView((v) => (v.phase === 'connecting' && joinedRef.current ? { phase: 'closed', reason: 'ended' } : v)), 12000)
    return () => { window.clearTimeout(giveUp); transport.send({ from: 'player', body: { t: 'leave', id } }); transport.close(); transportRef.current = null }
  }, [code, id, am])

  const doJoin = (event: React.FormEvent) => {
    event.preventDefault()
    const clean = cleanName(name)
    if (clean.length < 2) { setError(am ? 'ስምዎ ቢያንስ ሁለት ፊደል ይሁን።' : 'Choose a name with at least two characters.'); return }
    setError(''); storeSet('td.live.name', clean); storeSet(`td.live.joined.${code}`, '1'); joinedRef.current = true; setJoined(true)
    send({ t: 'join', id, name: clean })
    window.setTimeout(() => setView((v) => (v.phase === 'connecting' ? { phase: 'rejected', reason: 'unknown-room' } : v)), 10000)
  }
  const answer = (key: string) => {
    if (view.phase !== 'round' || view.mine) return
    setView({ ...view, mine: key })
    send({ t: 'answer', id, n: view.n, key })
  }
  const deadline = view.phase === 'round' ? view.deadline : null
  const seconds = useSecondsLeft(deadline)
  const reasons: Record<string, string> = am
    ? { full: 'ክፍሉ ሞልቷል።', 'name-taken': 'ይህ ስም ተወስዷል፤ ሌላ ይምረጡ።', started: 'ጨዋታው ተጀምሯል።', 'invalid-name': 'ስሙ ትክክል አይደለም።', 'unknown-room': 'ክፍሉ አልተገኘም ወይም አስተናጋጁ ከመስመር ውጭ ነው።' }
    : { full: 'This room is full.', 'name-taken': 'That name is taken. Choose another.', started: 'This game has already started.', 'invalid-name': 'That name is not allowed.', 'unknown-room': 'Room not found, or the host is offline.' }

  return (
    <div className={s.page} lang={locale} data-live-role="player">
      <header className={s.header}>
        <Link to="/play/live" className={s.back}>← {am ? 'ውጣ' : 'Leave'}</Link>
        <h1>{am ? 'ክፍል' : 'Room'} <span className={s.bigCode}>{code}</span></h1>
        {joined && !hostHere && view.phase !== 'closed' ? <p role="status" className={s.warn}>{am ? 'አስተናጋጁ ተቋርጧል። እስኪመለስ በመጠበቅ ላይ…' : 'The host disconnected. Waiting for them to return…'}</p> : null}
      </header>
      {error ? <p role="alert" className={s.error}>{error}</p> : null}

      {!joined ? (
        <form className={s.card} onSubmit={doJoin}>
          <h2>{am ? 'ስምዎን ያስገቡ' : 'Choose a display name'}</h2>
          <label className={s.field}>{am ? 'ስም' : 'Name'}<input value={name} maxLength={20} autoComplete="nickname" onChange={(e) => setName(e.target.value)} /></label>
          <button type="submit" className={s.primary} disabled={!connected && !error}>{am ? 'ተቀላቀል' : 'Join'}</button>
        </form>
      ) : null}

      {joined && view.phase === 'connecting' ? <p role="status" className={s.hint}>{am ? 'በመገናኘት ላይ…' : 'Connecting to the room…'}</p> : null}
      {view.phase === 'rejected' ? <div className={s.card} role="alert"><h2>{am ? 'መቀላቀል አልተቻለም' : 'Could not join'}</h2><p>{reasons[view.reason]}</p>
        <button type="button" className={s.primary} onClick={() => { storeSet(`td.live.joined.${code}`, null); joinedRef.current = false; setJoined(false); setView({ phase: 'connecting' }) }}>{am ? 'እንደገና ሞክር' : 'Try again'}</button></div> : null}
      {view.phase === 'lobby' ? (
        <section className={s.card} aria-label="Lobby" data-player-lobby>
          <h2>{GAME_TITLES[view.game][am ? 'am' : 'en']}</h2>
          <p>{am ? `አስተናጋጅ፦ ${view.hostName}። ${view.total} ጥያቄዎች።` : `Hosted by ${view.hostName} · ${view.total} questions. Waiting for the host to start…`}</p>
          <ul className={s.roster}>{view.roster.map((p) => <li key={p.id}><span aria-hidden="true">{p.connected ? '●' : '○'}</span> {p.name}{p.id === id ? (am ? ' (እርስዎ)' : ' (you)') : ''}</li>)}</ul>
        </section>
      ) : null}
      {view.phase === 'round' ? (
        <section aria-label="Question">
          <p className={s.progress}>{am ? `ጥያቄ ${view.n} ከ ${view.total}` : `Question ${view.n} of ${view.total}`} <strong className={s.timer}>· {seconds}s</strong> · {view.answered} {am ? 'መልሰዋል' : 'answered'}</p>
          <QuestionCard q={view.question} pick={pick} am={am}>
            <div className={s.options} role="group" aria-label={am ? 'የመልስ አማራጮች' : 'Answer choices'}>{view.question.options.map((o) => (
              <button key={o.key} type="button" className={s.option} aria-pressed={view.mine === o.key} disabled={Boolean(view.mine) || seconds === 0} onClick={() => answer(o.key)} data-option={o.key}>
                <span lang={pick(o.text).lang}>{pick(o.text).text}</span>{view.mine === o.key ? <b> ✓ {am ? 'ተመርጧል' : 'Locked in'}</b> : null}
              </button>))}</div>
            {view.mine ? <p role="status" className={s.hint}>{am ? 'መልስዎ ተቀምጧል። ሌሎችን በመጠበቅ ላይ…' : 'Answer locked in. Waiting for the others…'}</p> : null}
          </QuestionCard>
        </section>
      ) : null}
      {view.phase === 'reveal' ? (
        <section aria-label="Result" data-player-reveal>
          <p className={s.progress}>{am ? `ጥያቄ ${view.n}` : `Question ${view.n}`}</p>
          <article className={s.question}>
            <h2 className={s.prompt} tabIndex={-1}>{view.mine ? (view.mine.points > 0 ? (am ? `ትክክል! +${view.mine.points}` : `Correct! +${view.mine.points}`) : (am ? 'ትክክል አይደለም' : 'Not quite')) : (am ? 'መልስ አልሰጡም' : 'No answer')}</h2>
            <p className={s.explain} lang={pick(view.explanation).lang}>{pick(view.explanation).text}</p>
            <Link className={s.src} to={view.source.route}>{view.source.label}</Link>
          </article>
          <Leaderboard scores={view.scores} me={id} am={am} />
          <p className={s.hint}>{am ? 'አስተናጋጁ ቀጣዩን ጥያቄ እስኪጀምር ይጠብቁ…' : 'Waiting for the host to continue…'}</p>
        </section>
      ) : null}
      {view.phase === 'final' ? (
        <section className={s.card} aria-label="Final results" data-player-final>
          <h2>{am ? 'የመጨረሻ ውጤት' : 'Final leaderboard'}</h2>
          <Leaderboard scores={view.scores} me={id} am={am} />
          <p className={s.hint}>{am ? 'አስተናጋጁ እንደገና ሊጀምር ይችላል።' : 'The host can start a rematch with fresh questions.'}</p>
          <Link to="/play" className={s.primary}>{am ? 'ወደ ጨዋታዎች' : 'Back to games'}</Link>
        </section>
      ) : null}
      {view.phase === 'closed' ? <div className={s.card} role="status"><h2>{am ? 'ክፍሉ ተዘግቷል' : 'This room has closed'}</h2>
        <p>{view.reason === 'expired' ? (am ? 'ክፍሉ ጊዜው አልፎበታል።' : 'The room expired.') : (am ? 'ክፍሉ አልተገኘም ወይም ተጠናቅቋል።' : 'The room ended or could not be found.')}</p>
        <Link className={s.primary} to="/play/live">{am ? 'ሌላ ክፍል' : 'Join another room'}</Link></div> : null}
    </div>
  )
}

/* ------------------------------------------------------------------ route */
export function LiveRoomPage() {
  const { code: raw = '' } = useParams()
  const code = normalizeCode(raw)
  const hostRecord = useMemo(() => (validCode(code) ? storeGet(`td.live.host.${code}`) : null), [code])
  const engine = useMemo(() => {
    if (!hostRecord) return null
    try { return HostEngine.restore(JSON.parse(hostRecord)) } catch { return null }
  }, [hostRecord])
  const { locale } = useLocale()
  if (!validCode(code)) return <div className={s.page}><div className={s.card} role="alert"><h2>{locale === 'am' ? 'የክፍል ኮዱ ትክክል አይደለም' : 'That room code is not valid'}</h2><Link className={s.primary} to="/play/live">{locale === 'am' ? 'ወደ ኋላ' : 'Back'}</Link></div></div>
  return engine ? <HostRoom key={code} code={code} initial={engine} /> : <PlayerRoom key={code} code={code} />
}
