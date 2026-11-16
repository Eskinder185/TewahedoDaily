import { supabase } from '../supabase/client'
import { fromLibraryRow, isStudioActivity, publicActivityDraft, activitySources, validateLibraryDraft } from './studioActivity'
import { STUDIO_GAMES, type StudioDraft, type StudioGame } from './contentStudio'
import type { ContentUnit, GameCounts } from './contentRegistry'
import type { QuestionRow } from './questionLibrary'
import { withPublicSources } from './sourceAvailability'
import type { SourceReference } from './types'

type Result = { data: unknown[] | null; error: unknown }
type Query = { select: (s: string) => Query; eq: (k: string, v: string) => Query; not: (k: string, op: string, v: null) => Query;
  order: (k: string, o: { ascending: boolean }) => Query; abortSignal: (signal: AbortSignal) => Query; range: (start: number, end: number) => PromiseLike<Result> }
export type PublicContentClient = { from: (name: string) => Query }
const SELECT = 'id,question_id,stable_id,game_type,category,difficulty,status,published_at,updated_at,payload,source_references'
const PAGE = 100, MAX = 1000
/** Explicit rollout switch: production cutover requires separately verified content/RLS. */
export const databasePlayEnabled = () => import.meta.env.VITE_PLAY_DATABASE_ONLY === 'true'

const UNIT_BY_GAME: Record<StudioGame, ContentUnit> = {
  trivia: 'questions',
  emoji: 'questions',
  'finish-the-verse': 'excerpts',
  'finish-the-mezmur': 'excerpts',
  history: 'cards',
  'who-am-i': 'clues',
  match: 'pairs',
  'bible-timeline': 'chains',
  feasts: 'cards',
  saints: 'cards',
  'icon-memory': 'images',
  adventures: 'stories',
}

function emptyCounts(game: StudioGame): GameCounts {
  const unit = UNIT_BY_GAME[game]
  return {
    unit,
    builtIn: 0,
    generated: 0,
    total: 0,
    ...(game === 'bible-timeline' ? { events: 0 } : {}),
    ...(game === 'adventures' ? { scenes: 0 } : {}),
    ...(game === 'history' ? { timelineEvents: 0 } : {}),
  }
}

function addLevel(counts: GameCounts, item: unknown) {
  if (!item || typeof item !== 'object' || !('difficulty' in item)) return
  const level = (item as { difficulty?: unknown }).difficulty
  if (level === 'beginner' || level === 'growing' || level === 'challenge') {
    counts.levels = counts.levels ?? {}
    counts.levels[level] = (counts.levels[level] ?? 0) + 1
  }
}

/** Aggregate published database drafts into per-game unit counts without falling back to static content. */
export function summarizePublishedDrafts(drafts: readonly StudioDraft[]): Record<StudioGame, GameCounts> {
  const summary = Object.fromEntries(STUDIO_GAMES.map(entry => [entry.id, emptyCounts(entry.id)])) as Record<StudioGame, GameCounts>
  for (const draft of drafts) {
    const counts = summary[draft.game]
    if (!counts) continue
    if (draft.game === 'history') {
      if (Array.isArray(draft.content)) counts.timelineEvents = (counts.timelineEvents ?? 0) + draft.content.length
      else { counts.total += 1; addLevel(counts, draft.content) }
    } else if (draft.game === 'bible-timeline') {
      counts.total += 1
      counts.events = (counts.events ?? 0) + draft.content.events.length
    } else if (draft.game === 'adventures') {
      counts.total += 1
      counts.scenes = (counts.scenes ?? 0) + draft.content.scenes.length
    } else if (Array.isArray(draft.content)) {
      counts.total += draft.content.length
      for (const item of draft.content) addLevel(counts, item)
    } else {
      counts.total += 1
      addLevel(counts, draft.content)
    }
  }
  return summary
}

function runWithTimeout<T>(timeoutMs: number, task: (signal: AbortSignal) => Promise<T>): Promise<T> {
  const controller = new AbortController()
  let timer: ReturnType<typeof setTimeout> | undefined
  const expired = new Promise<never>((_, reject) => {
    timer = setTimeout(() => { controller.abort(); reject(new Error('Published challenges timed out. Please retry.')) }, timeoutMs)
  })
  return Promise.race([task(controller.signal), expired]).finally(() => { clearTimeout(timer) })
}

async function readPublishedDrafts(
  client: PublicContentClient | null,
  checkSources: (items: { source: SourceReference }[]) => Promise<{ source: SourceReference }[]>,
  signal: AbortSignal,
  game?: StudioGame,
): Promise<StudioDraft[]> {
  if (!client) throw new Error('Published challenges are temporarily unavailable.')
  const drafts: { draft: StudioDraft; order: number }[] = [], ids = new Set<string>()
  for (let start = 0; start < MAX; start += PAGE) {
    let query = client.from('play_content_items').select(SELECT)
    if (game) query = query.eq('game_type', game)
    const result = await query.eq('status', 'published').not('published_at', 'is', null)
      .order('published_at', { ascending: true }).order('question_id', { ascending: true }).abortSignal(signal).range(start, start + PAGE - 1)
    if (result.error || !Array.isArray(result.data)) throw new Error('Published challenges could not be loaded. Please retry.')
    for (const value of result.data) {
      const row = value as QuestionRow
      if (!row || (game && row.game_type !== game) || row.status !== 'published' || typeof row.published_at !== 'string'
        || !Number.isFinite(Date.parse(row.published_at)) || row.question_id !== row.stable_id || ids.has(row.stable_id)
        || validateLibraryDraft(row).length) throw new Error('Published challenges contain incompatible records. Please contact an editor.')
      ids.add(row.stable_id)
      const draft = isStudioActivity(row.payload) ? publicActivityDraft(row) : fromLibraryRow(row, 'public')?.draft
      if (!draft) throw new Error('This published format is not supported by its game.')
      const sources = activitySources(draft).map(source => ({ source }))
      if ((await checkSources(sources)).length === sources.length) drafts.push({ draft, order: Number(row.payload.sortOrder || 0) })
    }
    if (result.data.length < PAGE) {
      const ordered = drafts.sort((a, b) => a.order - b.order).map(item => item.draft)
      if (game) {
        const keys = ordered.flatMap(draft => {
          if (Array.isArray(draft.content)) return draft.content.map(item => item.id)
          return ['id' in draft.content ? draft.content.id : draft.content.slug]
        })
        if (new Set(keys).size !== keys.length) throw new Error('Published activities contain conflicting content identities.')
      }
      return ordered
    }
  }
  throw new Error('Published challenge limit exceeded. Refine the configured bank before release.')
}

export function createPublishedContentLoader(client: PublicContentClient | null,
  checkSources: (items: { source: SourceReference }[]) => Promise<{ source: SourceReference }[]> = withPublicSources, timeoutMs = 12000) {
  // In-flight only. A new session always rechecks publication; no stale content TTL.
  const inFlight = new Map<StudioGame, Promise<StudioDraft[]>>()
  return (game: StudioGame) => {
    const existing = inFlight.get(game)
    if (existing) return existing
    const pending = runWithTimeout(timeoutMs, signal => readPublishedDrafts(client, checkSources, signal, game))
      .finally(() => { inFlight.delete(game) })
    inFlight.set(game, pending)
    return pending
  }
}

export function createPublishedHubSummaryLoader(client: PublicContentClient | null,
  checkSources: (items: { source: SourceReference }[]) => Promise<{ source: SourceReference }[]> = withPublicSources, timeoutMs = 12000) {
  let inFlight: Promise<Record<StudioGame, GameCounts>> | null = null
  return () => {
    if (inFlight) return inFlight
    inFlight = runWithTimeout(timeoutMs, async signal => summarizePublishedDrafts(await readPublishedDrafts(client, checkSources, signal)))
      .finally(() => { inFlight = null })
    return inFlight
  }
}

export const loadPublishedContent = createPublishedContentLoader(supabase as unknown as PublicContentClient | null)
export const loadPublishedHubSummary = createPublishedHubSummaryLoader(supabase as unknown as PublicContentClient | null)
