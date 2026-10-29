import { useCallback, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale } from '../../lib/i18n/locale'
import { supabase } from '../../lib/supabase/client'
import styles from './GameNightPage.module.css'

type RoomState = {
  room_id: string
  code?: string
  state: 'lobby' | 'playing' | 'finished'
  role: 'host' | 'player'
  settings: { category: string; difficulty: string; question_count: number }
  round: null | { id: string; status: 'open' | 'revealed'; position: number; question: { prompt: { en: string; am?: string }; options: { key: string; text: { en: string; am?: string } }[]; correctKey?: string; explanation?: { en: string; am?: string }; source?: { label: string; route: string } } }
  participants: { id: string; display_name: string; score: number }[]
}
type RpcResult<T> = Promise<{ data: T | null; error: { message: string } | null }>
type RpcClient = { rpc: <T>(name: string, args?: Record<string, unknown>) => RpcResult<T> }

const SESSION_KEY = 'tewahedo-play-room-session'

export function GameNightPage() {
  const { locale } = useLocale()
  const { user } = useAuth()
  const am = locale === 'am'
  const client = supabase as unknown as RpcClient | null
  const [view, setView] = useState<'choose' | 'host' | 'join'>('choose')
  const [code, setCode] = useState('')
  const [name, setName] = useState('')
  const [difficulty, setDifficulty] = useState('beginner')
  const [category, setCategory] = useState('All categories')
  const [questionCount, setQuestionCount] = useState(5)
  const [room, setRoom] = useState<RoomState | null>(null)
  const [participant, setParticipant] = useState<{ id: string; token: string } | null>(() => {
    try { return JSON.parse(window.sessionStorage.getItem(SESSION_KEY) || 'null') } catch { return null }
  })
  const [selected, setSelected] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)

  const call = useCallback(async <T,>(name: string, args: Record<string, unknown> = {}) => {
    if (!client) throw new Error('Supabase is not configured.')
    const { data, error: rpcError } = await client.rpc<T>(name, args)
    if (rpcError) throw new Error(/schema cache|not find|does not exist/i.test(rpcError.message) ? 'Game Night needs the checked-in multiplayer migration before rooms can be used.' : rpcError.message)
    return data as T
  }, [client])

  const refresh = useCallback(async () => {
    if (!room) return
    try {
      const next = await call<RoomState>('get_play_room_state', { p_room_id: room.room_id, p_participant_id: participant?.id || null, p_join_token: participant?.token || null })
      setRoom((current) => ({ ...next, code: current?.code }))
    } catch (reason) { setError(reason instanceof Error ? reason.message : 'Unable to refresh the room.') }
  }, [call, participant, room])

  useEffect(() => {
    if (!room || room.state === 'finished') return
    const timer = window.setInterval(() => void refresh(), 2000)
    return () => window.clearInterval(timer)
  }, [refresh, room])

  const run = async (action: () => Promise<void>) => {
    setBusy(true); setError('')
    try { await action() } catch (reason) { setError(reason instanceof Error ? reason.message : 'Game Night request failed.') } finally { setBusy(false) }
  }
  const createRoom = () => run(async () => {
    const created = await call<{ room_id: string; code: string }>('create_play_room', { p_category: category, p_difficulty: difficulty, p_question_count: questionCount })
    setRoom({ room_id: created.room_id, code: created.code, role: 'host', state: 'lobby', settings: { category, difficulty, question_count: questionCount }, round: null, participants: [] })
  })
  const joinRoom = () => run(async () => {
    const joined = await call<{ room_id: string; participant_id: string; join_token: string }>('join_play_room', { p_code: code.trim().toUpperCase(), p_display_name: name.trim() })
    const credentials = { id: joined.participant_id, token: joined.join_token }
    window.sessionStorage.setItem(SESSION_KEY, JSON.stringify(credentials)); setParticipant(credentials)
    const state = await call<RoomState>('get_play_room_state', { p_room_id: joined.room_id, p_participant_id: credentials.id, p_join_token: credentials.token })
    setRoom(state)
  })
  const startRound = () => run(async () => { await call('start_play_room_round', { p_room_id: room?.room_id }); setSelected(''); await refresh() })
  const reveal = () => run(async () => { await call('reveal_play_room_round', { p_room_id: room?.room_id }); await refresh() })
  const finish = () => run(async () => { await call('finish_play_room', { p_room_id: room?.room_id }); await refresh() })
  const submit = (key: string) => run(async () => {
    setSelected(key)
    await call('submit_play_room_answer', { p_round_id: room?.round?.id, p_participant_id: participant?.id, p_join_token: participant?.token, p_answer_key: key })
  })

  return <div className={styles.page} lang={locale}><header><Link to="/play">← {am ? 'ወደ ጨዋታ' : 'Tewahedo Play'}</Link><p>{am ? 'ለቤተሰብና ለሰበካ' : 'For families and parishes'}</p><h1>{am ? 'የጨዋታ ምሽት' : 'Game Night'}</h1><span>{am ? 'በግል ኮድ ከስልክ ይቀላቀሉ' : 'Private, phone-friendly rooms with server-validated scoring'}</span></header><main>
    {error ? <div className={styles.error} role="alert">{error}</div> : null}
    {!room && view === 'choose' ? <section className={styles.choose}><button type="button" onClick={() => setView('host')}><span>✦</span><strong>{am ? 'ክፍል ይፍጠሩ' : 'Host a room'}</strong><small>{am ? 'ጨዋታና ደረጃ ይምረጡ' : 'Choose the round and guide play'}</small></button><button type="button" onClick={() => setView('join')}><span>#</span><strong>{am ? 'በኮድ ይቀላቀሉ' : 'Join with a code'}</strong><small>{am ? 'ከስልክዎ ይመልሱ' : 'Answer from your phone'}</small></button></section> : null}
    {!room && view === 'host' ? <section className={styles.panel}><button className={styles.back} type="button" onClick={() => setView('choose')}>←</button><h2>{am ? 'ክፍሉን ያዘጋጁ' : 'Set up the room'}</h2>{!user ? <p className={styles.note}>{am ? 'ክፍል ለመፍጠር መግባት ያስፈልጋል።' : 'Hosts must sign in so room permissions can be verified.'} <Link to="/login">{am ? 'ይግቡ' : 'Sign in'}</Link></p> : <><label>{am ? 'ምድብ' : 'Category'}<select value={category} onChange={(event) => setCategory(event.target.value)}><option>All categories</option><option>Seven Sacraments</option><option>Church history</option></select></label><label>{am ? 'ደረጃ' : 'Difficulty'}<select value={difficulty} onChange={(event) => setDifficulty(event.target.value)}><option value="beginner">Beginner</option><option value="growing">Growing</option><option value="challenge">Challenge</option></select></label><div className={styles.count}>{[5,10,20].map((item) => <button type="button" key={item} aria-pressed={questionCount === item} onClick={() => setQuestionCount(item)}>{item}</button>)}</div><button className={styles.primary} disabled={busy} type="button" onClick={createRoom}>{am ? 'የግል ክፍል ይፍጠሩ' : 'Create private room'}</button></>}</section> : null}
    {!room && view === 'join' ? <section className={styles.panel}><button className={styles.back} type="button" onClick={() => setView('choose')}>←</button><h2>{am ? 'ክፍል ይቀላቀሉ' : 'Join a room'}</h2><label>{am ? 'የክፍል ኮድ' : 'Room code'}<input value={code} maxLength={6} autoCapitalize="characters" onChange={(event) => setCode(event.target.value.toUpperCase())}/></label><label>{am ? 'የሚታይ ስም' : 'Display name'}<input value={name} maxLength={30} onChange={(event) => setName(event.target.value)}/></label><button className={styles.primary} disabled={busy || code.length < 6 || name.trim().length < 2} type="button" onClick={joinRoom}>{am ? 'ይቀላቀሉ' : 'Join'}</button></section> : null}
    {room ? <section className={styles.room}><div className={styles.roomTop}><div><p>{am ? 'የክፍል ኮድ' : 'Room code'}</p><strong>{room.code || code}</strong></div><span>{room.state}</span></div><div className={styles.scoreboard}><h2>{am ? 'ተጫዋቾች' : 'Players'}</h2>{room.participants.length ? room.participants.map((item) => <div key={item.id}><span>{item.display_name}</span><strong>{item.score}</strong></div>) : <p>{am ? 'ተጫዋቾችን በመጠበቅ ላይ…' : 'Waiting for players…'}</p>}</div>{room.round ? <article className={styles.question}><p>{am ? `ዙር ${room.round.position}` : `Round ${room.round.position}`}</p><h2>{room.round.question.prompt[locale] || room.round.question.prompt.en}</h2><div>{room.round.question.options.map((option) => <button type="button" key={option.key} disabled={room.role === 'host' || Boolean(selected) || room.round?.status === 'revealed'} aria-pressed={selected === option.key} onClick={() => void submit(option.key)}>{option.text[locale] || option.text.en}</button>)}</div>{room.round.status === 'revealed' ? <aside><strong>{am ? 'መልስ ተገልጧል' : 'Answer revealed'}</strong><p>{room.round.question.explanation?.[locale] || room.round.question.explanation?.en}</p>{room.round.question.source ? <Link to={room.round.question.source.route}>{room.round.question.source.label}</Link> : null}</aside> : null}</article> : <div className={styles.waiting}>{am ? 'አስተናጋጁ ዙሩን ይጀምራል።' : 'The host will start the next round.'}</div>}{room.role === 'host' && room.state !== 'finished' ? <div className={styles.hostActions}>{!room.round || room.round.status === 'revealed' ? <button className={styles.primary} disabled={busy} type="button" onClick={startRound}>{am ? 'ቀጣይ ጥያቄ' : 'Start next question'}</button> : <button className={styles.primary} disabled={busy} type="button" onClick={reveal}>{am ? 'መልሱን ግለጡ' : 'Reveal answer'}</button>}<button type="button" onClick={finish}>{am ? 'ጨዋታውን ጨርሱ' : 'Finish game'}</button></div> : null}{room.state === 'finished' ? <div className={styles.finished}>🎉 <strong>{am ? 'ጨዋታው ተጠናቋል' : 'Game complete'}</strong></div> : null}</section> : null}
  </main></div>
}
