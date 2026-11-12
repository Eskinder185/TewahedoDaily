/**
 * Live rooms: host-authoritative multiplayer for Trivia, Finish the Verse, Holy Emoji and Who Am I?.
 *
 * Trust model (read before relying on this): the host's browser is the referee. Players receive each question
 * WITHOUT its correct key or explanation; those are broadcast only at reveal, after answers are locked. The host
 * validates every answer (round open, one answer per player, valid option key, known player) and computes all
 * scores, so a player cannot award themselves points or see future answers. It is NOT tamper-proof against a
 * malicious host or against someone spoofing broadcast messages to other players; the server-validated version is
 * Game Night (needs its SQL installed). This engine is pure: no network, clock or randomness is hidden.
 */
import { seededRandom, shuffled, type Rng } from './sessionRandom'
import type { MatchPair, PlayQuestion, WhoAmICard } from './types'

export const LIVE_GAMES = ['trivia', 'finish-the-verse', 'emoji', 'who-am-i'] as const
export type LiveGame = (typeof LIVE_GAMES)[number]
export const isLiveGame = (value: string): value is LiveGame => (LIVE_GAMES as readonly string[]).includes(value)
export const MAX_PLAYERS = 12
export const ROOM_TTL_MS = 4 * 60 * 60 * 1000
export const ROUND_MS = 30_000
export const ROUND_OPTIONS = [5, 10, 15] as const

/** What a player may see before the reveal. */
export type PublicOption = { key: string; text: { en: string; am?: string } }
export type PublicQuestion = { prompt: { en: string; am?: string }; options: PublicOption[]; emoji?: string; excerpt?: { en: string; am?: string }; kind: LiveGame }
export type PreparedRound = {
  id: string
  question: PublicQuestion
  correctKey: string
  explanation: { en: string; am?: string }
  source: { label: string; route: string }
}
export type Score = { id: string; name: string; score: number; correct: number; connected: boolean }

// ---------------------------------------------------------------- code, link, names
const CODE_CHARS = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789' // no 0/O/1/I
export function newRoomCode(random: Rng = Math.random): string {
  return Array.from({ length: 5 }, () => CODE_CHARS[Math.floor(random() * CODE_CHARS.length)]).join('')
}
export const normalizeCode = (value: string) => value.toUpperCase().replace(/[^A-Z0-9]/g, '').replace(/O/g, '0').replace(/[IL]/g, '1').slice(0, 5)
export const validCode = (value: string) => /^[A-HJ-NP-Z2-9]{5}$/.test(value)
export const cleanName = (value: string) => value.replace(/\p{Cc}|[<>]/gu, '').replace(/\s+/g, ' ').trim().slice(0, 20)
export const joinLink = (origin: string, code: string) => `${origin}/play/live/${code}`

// ---------------------------------------------------------------- building rounds (unbiased, no repeats, seeded)
export function questionRounds(game: Exclude<LiveGame, 'who-am-i'>, bank: readonly PlayQuestion[], count: number, seed: number, difficulty?: string, avoid: ReadonlySet<string> = new Set()): PreparedRound[] {
  const random = seededRandom(seed)
  const eligible = bank.filter(q => q.game === game && q.options.length >= 2 && q.options.some(o => o.key === q.correctKey) && (!difficulty || difficulty === 'all' || q.difficulty === difficulty))
  const fresh = shuffled(eligible.filter(q => !avoid.has(q.id)), random)
  const stale = shuffled(eligible.filter(q => avoid.has(q.id)), random)
  return [...fresh, ...stale].slice(0, count).map(q => ({
    id: q.id,
    question: { kind: game, prompt: q.prompt, emoji: q.emoji, excerpt: q.excerpt, options: shuffled(q.options, random).map(o => ({ key: o.key, text: o.text })) },
    correctKey: q.correctKey, explanation: q.explanation, source: { label: q.source.label, route: q.source.route },
  }))
}

/** Who Am I? as a live round: the clue is the card's first-person description; options are the card plus 3 other answers. */
export function whoAmIRounds(cards: readonly WhoAmICard[], count: number, seed: number, avoid: ReadonlySet<string> = new Set()): PreparedRound[] {
  const random = seededRandom(seed)
  const pool = cards.filter(c => c.answer.en && c.explanation.en)
  const order = [...shuffled(pool.filter(c => !avoid.has(c.id)), random), ...shuffled(pool.filter(c => avoid.has(c.id)), random)].slice(0, count)
  return order.flatMap(card => {
    const others = shuffled(pool.filter(c => c.id !== card.id && c.answer.en.toLowerCase() !== card.answer.en.toLowerCase() && c.category === card.category), random)
    const distractors = [...others, ...shuffled(pool.filter(c => c.id !== card.id && c.answer.en.toLowerCase() !== card.answer.en.toLowerCase() && c.category !== card.category), random)]
    const unique = [...new Map(distractors.map(c => [c.answer.en.toLowerCase(), c])).values()].slice(0, 3)
    if (unique.length < 3) return []
    const options = shuffled([card, ...unique], random).map((c, i) => ({ key: `k${i}`, id: c.id, text: c.answer }))
    return [{
      id: card.id,
      question: { kind: 'who-am-i' as const, prompt: card.explanation, options: options.map(o => ({ key: o.key, text: o.text })) },
      correctKey: options.find(o => o.id === card.id)!.key,
      explanation: { en: `The answer is ${card.answer.en}.`, am: card.answer.am ? `መልሱ ${card.answer.am} ነው።` : undefined },
      source: { label: card.source.label, route: card.source.route },
    }]
  })
}
export const matchPairIds = (pairs: readonly MatchPair[]) => pairs.map(p => p.id) // match is solo only; kept for tests that assert that

// ---------------------------------------------------------------- protocol
export type HostMsg =
  | { t: 'lobby'; fresh?: boolean; game: LiveGame; total: number; roster: Array<{ id: string; name: string; connected: boolean }>; hostName: string; expiresAt: number }
  | { t: 'round'; to?: string; n: number; total: number; durationMs: number; question: PublicQuestion; answered: string[] }
  | { t: 'reveal'; to?: string; n: number; correctKey: string; explanation: { en: string; am?: string }; source: { label: string; route: string }; picks: Record<string, { key: string; points: number }>; scores: Score[] }
  | { t: 'final'; to?: string; scores: Score[]; total: number }
  | { t: 'closed'; reason: 'expired' | 'ended' | 'host-left' }
  | { t: 'reject'; to: string; reason: 'full' | 'name-taken' | 'started' | 'invalid-name' | 'unknown-room' }
  | { t: 'welcome'; to: string; id: string }
export type PlayerMsg =
  | { t: 'join'; id: string; name: string }
  | { t: 'hello'; id: string }
  | { t: 'answer'; id: string; n: number; key: string }
  | { t: 'leave'; id: string }

type Player = { id: string; name: string; score: number; correct: number; connected: boolean }
type Phase = 'lobby' | 'round' | 'reveal' | 'final' | 'closed'
export type EngineOptions = { now?: () => number; roundMs?: number }

/** The referee. `handle` is the only way a player message can change state. */
export class HostEngine {
  phase: Phase = 'lobby'
  readonly players = new Map<string, Player>()
  readonly created: number
  rounds: PreparedRound[] = []
  index = -1
  openedAt = 0
  private answers = new Map<string, { key: string; at: number }>()
  private last: Extract<HostMsg, { t: 'reveal' }> | null = null
  private readonly now: () => number
  private readonly roundMs: number
  readonly code: string
  readonly game: LiveGame
  readonly hostName: string
  constructor(code: string, game: LiveGame, hostName: string, rounds: PreparedRound[], options: EngineOptions = {}) {
    this.code = code; this.game = game; this.hostName = hostName
    this.now = options.now ?? Date.now; this.roundMs = options.roundMs ?? ROUND_MS; this.rounds = rounds; this.created = this.now()
  }
  get expiresAt() { return this.created + ROOM_TTL_MS }
  get expired() { return this.now() > this.expiresAt }

  roster() { return [...this.players.values()].map(p => ({ id: p.id, name: p.name, connected: p.connected })) }
  scores(): Score[] { return [...this.players.values()].map(p => ({ id: p.id, name: p.name, score: p.score, correct: p.correct, connected: p.connected })).sort((a, b) => b.score - a.score || a.name.localeCompare(b.name)) }
  lobbyMessage(): HostMsg { return { t: 'lobby', game: this.game, total: this.rounds.length, roster: this.roster(), hostName: this.hostName, expiresAt: this.expiresAt } }
  private roundMessage(to?: string): HostMsg {
    const round = this.rounds[this.index]
    const remaining = Math.max(0, this.roundMs - (this.now() - this.openedAt))
    return { t: 'round', to, n: this.index + 1, total: this.rounds.length, durationMs: remaining, question: round.question, answered: [...this.answers.keys()] }
  }
  /** Full current view for one player (join, reconnect, late subscribe). Never includes an unrevealed answer. */
  snapshot(to: string): HostMsg[] {
    if (this.phase === 'lobby') return [this.lobbyMessage()]
    if (this.phase === 'round') return [this.lobbyMessage(), this.roundMessage(to)]
    if (this.phase === 'reveal' && this.last) return [this.lobbyMessage(), { ...this.last, to }]
    if (this.phase === 'final') return [{ t: 'final', to, scores: this.scores(), total: this.rounds.length }]
    return [{ t: 'closed', reason: 'ended' }]
  }

  handle(msg: PlayerMsg): HostMsg[] {
    if (this.expired && this.phase !== 'closed') { this.phase = 'closed'; return [{ t: 'closed', reason: 'expired' }] }
    if (this.phase === 'closed') return []
    switch (msg.t) {
      case 'join': {
        const name = cleanName(msg.name)
        if (!msg.id || msg.id.length > 64 || name.length < 2) return [{ t: 'reject', to: msg.id, reason: 'invalid-name' }]
        const existing = this.players.get(msg.id)
        if (existing) { existing.connected = true; return [{ t: 'welcome', to: msg.id, id: msg.id }, ...this.snapshot(msg.id), this.lobbyMessage()] }
        if (this.phase !== 'lobby') return [{ t: 'reject', to: msg.id, reason: 'started' }]
        if (this.players.size >= MAX_PLAYERS) return [{ t: 'reject', to: msg.id, reason: 'full' }]
        if ([...this.players.values()].some(p => p.name.toLowerCase() === name.toLowerCase())) return [{ t: 'reject', to: msg.id, reason: 'name-taken' }]
        this.players.set(msg.id, { id: msg.id, name, score: 0, correct: 0, connected: true })
        return [{ t: 'welcome', to: msg.id, id: msg.id }, this.lobbyMessage()]
      }
      case 'hello': {
        const player = this.players.get(msg.id)
        if (!player) return [{ t: 'reject', to: msg.id, reason: 'unknown-room' }]
        player.connected = true
        return [...this.snapshot(msg.id), this.lobbyMessage()]
      }
      case 'leave': {
        const player = this.players.get(msg.id)
        if (player) player.connected = false
        return [this.lobbyMessage()]
      }
      case 'answer': {
        const player = this.players.get(msg.id)
        const round = this.rounds[this.index]
        // Round must be open, the sender known, the round number current, the key a real option, and only the first answer counts.
        if (!player || this.phase !== 'round' || !round || msg.n !== this.index + 1) return []
        if (!round.question.options.some(o => o.key === msg.key) || this.answers.has(msg.id)) return []
        this.answers.set(msg.id, { key: msg.key, at: this.now() })
        const everyone = [...this.players.values()].filter(p => p.connected)
        if (everyone.length && everyone.every(p => this.answers.has(p.id))) return [this.roundMessage(), ...this.reveal()]
        return [this.roundMessage()]
      }
    }
  }

  setConnected(id: string, connected: boolean): HostMsg[] {
    const player = this.players.get(id)
    if (player) player.connected = connected
    return [this.lobbyMessage()]
  }
  start(): HostMsg[] {
    if (this.phase !== 'lobby' || !this.players.size || !this.rounds.length) return []
    return this.open(0)
  }
  private open(index: number): HostMsg[] {
    this.index = index; this.phase = 'round'; this.answers = new Map(); this.openedAt = this.now(); this.last = null
    return [this.roundMessage()]
  }
  /** Close the round: score every recorded answer once, then reveal the key. Idempotent. */
  reveal(): HostMsg[] {
    if (this.phase !== 'round') return this.last ? [this.last] : []
    const round = this.rounds[this.index]
    const picks: Record<string, { key: string; points: number }> = {}
    for (const [id, answer] of this.answers) {
      const player = this.players.get(id)!
      const correct = answer.key === round.correctKey
      const left = Math.max(0, this.roundMs - (answer.at - this.openedAt))
      const points = correct ? 100 + Math.round((left / this.roundMs) * 50) : 0
      if (correct) { player.score += points; player.correct += 1 }
      picks[id] = { key: answer.key, points }
    }
    this.phase = 'reveal'
    this.last = { t: 'reveal', n: this.index + 1, correctKey: round.correctKey, explanation: round.explanation, source: round.source, picks, scores: this.scores() }
    return [this.last]
  }
  next(): HostMsg[] {
    if (this.phase === 'round') return this.reveal()
    if (this.phase !== 'reveal') return []
    if (this.index + 1 >= this.rounds.length) { this.phase = 'final'; return [{ t: 'final', scores: this.scores(), total: this.rounds.length }] }
    return this.open(this.index + 1)
  }
  /** Fresh content, same players, scores reset. */
  rematch(rounds: PreparedRound[]): HostMsg[] {
    if (this.phase !== 'final') return []
    this.rounds = rounds; this.index = -1; this.phase = 'lobby'; this.answers = new Map(); this.last = null
    for (const player of this.players.values()) { player.score = 0; player.correct = 0 }
    return [{ ...this.lobbyMessage(), fresh: true } as HostMsg]
  }
  /** Plain data for the host's own browser storage so a refresh does not end the room. */
  serialize() {
    return { code: this.code, game: this.game, hostName: this.hostName, created: this.created, phase: this.phase, index: this.index, rounds: this.rounds,
      players: [...this.players.values()].map(p => ({ ...p, connected: false })), roundMs: this.roundMs }
  }
  static restore(data: ReturnType<HostEngine['serialize']>, options: EngineOptions = {}): HostEngine {
    const engine = new HostEngine(data.code, data.game, data.hostName, data.rounds, { ...options, roundMs: data.roundMs })
    ;(engine as { created: number }).created = data.created
    for (const p of data.players) engine.players.set(p.id, { ...p })
    engine.index = data.index
    // A round that was open restarts its clock with no recorded answers; a reveal/final becomes the next safe step.
    engine.phase = data.phase === 'closed' ? 'closed' : data.phase === 'reveal' && data.index >= 0 ? 'reveal' : data.phase
    if (engine.phase === 'round') engine.openedAt = engine.now()
    if (engine.phase === 'reveal') engine.last = { t: 'reveal', n: data.index + 1, correctKey: data.rounds[data.index].correctKey, explanation: data.rounds[data.index].explanation, source: data.rounds[data.index].source, picks: {}, scores: engine.scores() }
    return engine
  }
  close(reason: 'ended' | 'host-left' = 'ended'): HostMsg[] { this.phase = 'closed'; return [{ t: 'closed', reason }] }
}

/** Client-side view reducer: what a player's screen shows, rebuilt only from host messages addressed to them. */
export type PlayerView =
  | { phase: 'connecting' }
  | { phase: 'rejected'; reason: Extract<HostMsg, { t: 'reject' }>['reason'] }
  | { phase: 'lobby'; roster: Array<{ id: string; name: string; connected: boolean }>; game: LiveGame; total: number; hostName: string }
  | { phase: 'round'; n: number; total: number; question: PublicQuestion; deadline: number; mine: string | null; answered: number }
  | { phase: 'reveal'; n: number; correctKey: string; explanation: { en: string; am?: string }; source: { label: string; route: string }; mine: { key: string; points: number } | null; scores: Score[] }
  | { phase: 'final'; scores: Score[]; total: number }
  | { phase: 'closed'; reason: Extract<HostMsg, { t: 'closed' }>['reason'] }
export function reduceView(view: PlayerView, msg: HostMsg, me: string, now: number): PlayerView {
  if ('to' in msg && msg.to && msg.to !== me) return view
  switch (msg.t) {
    case 'reject': return { phase: 'rejected', reason: msg.reason }
    case 'welcome': return view.phase === 'connecting' ? { phase: 'lobby', roster: [], game: 'trivia', total: 0, hostName: '' } : view
    case 'lobby':
      // Roster refreshes must not reset a game in progress; only a rematch (fresh) returns finished players to the lobby.
      if (view.phase === 'round' || view.phase === 'reveal' || (view.phase === 'final' && !msg.fresh)) return view
      return { phase: 'lobby', roster: msg.roster, game: msg.game, total: msg.total, hostName: msg.hostName }
    case 'round': return { phase: 'round', n: msg.n, total: msg.total, question: msg.question, deadline: now + msg.durationMs, mine: view.phase === 'round' && view.n === msg.n ? view.mine : null, answered: msg.answered.length }
    case 'reveal': return { phase: 'reveal', n: msg.n, correctKey: msg.correctKey, explanation: msg.explanation, source: msg.source, mine: msg.picks[me] ?? null, scores: msg.scores }
    case 'final': return { phase: 'final', scores: msg.scores, total: msg.total }
    case 'closed': return { phase: 'closed', reason: msg.reason }
  }
}
