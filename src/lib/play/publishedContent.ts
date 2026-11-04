import { supabase } from '../supabase/client'
import { fromLibraryRow, isStudioActivity, publicActivityDraft, activitySources, validateLibraryDraft } from './studioActivity'
import type { StudioDraft, StudioGame } from './contentStudio'
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

export function createPublishedContentLoader(client: PublicContentClient | null,
  checkSources: (items: { source: SourceReference }[]) => Promise<{ source: SourceReference }[]> = withPublicSources, timeoutMs = 12000) {
  // In-flight only. A new session always rechecks publication; no stale content TTL.
  const inFlight = new Map<StudioGame, Promise<StudioDraft[]>>()
  async function read(game: StudioGame, signal: AbortSignal): Promise<StudioDraft[]> {
    if (!client) throw new Error('Published challenges are temporarily unavailable.')
    const drafts: { draft: StudioDraft; order: number }[] = [], ids = new Set<string>()
    for (let start = 0; start < MAX; start += PAGE) {
      const result = await client.from('play_content_items').select(SELECT).eq('game_type', game)
        .eq('status', 'published').not('published_at', 'is', null)
        .order('published_at', { ascending: true }).order('question_id', { ascending: true }).abortSignal(signal).range(start, start + PAGE - 1)
      if (result.error || !Array.isArray(result.data)) throw new Error('Published challenges could not be loaded. Please retry.')
      for (const value of result.data) {
        const row = value as QuestionRow
        if (!row || row.game_type !== game || row.status !== 'published' || typeof row.published_at !== 'string'
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
        const keys = ordered.flatMap(draft => {
          if (Array.isArray(draft.content)) return draft.content.map(item => item.id)
          return ['id' in draft.content ? draft.content.id : draft.content.slug]
        })
        if (new Set(keys).size !== keys.length) throw new Error('Published activities contain conflicting content identities.')
        return ordered
      }
    }
    throw new Error('Published challenge limit exceeded. Refine the configured bank before release.')
  }
  return (game: StudioGame) => {
    const existing = inFlight.get(game)
    if (existing) return existing
    const controller = new AbortController()
    let timer: ReturnType<typeof setTimeout> | undefined
    const expired = new Promise<never>((_, reject) => { timer = setTimeout(() => { controller.abort(); reject(new Error('Published challenges timed out. Please retry.')) }, timeoutMs) })
    const pending = Promise.race([read(game, controller.signal), expired]).finally(() => { clearTimeout(timer); inFlight.delete(game) })
    inFlight.set(game, pending)
    return pending
  }
}
export const loadPublishedContent = createPublishedContentLoader(supabase as unknown as PublicContentClient | null)
