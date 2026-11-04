import { requireCmsStaffSession } from '../cms/cmsStaffAuth'
import { supabase } from '../supabase/client'
import { loadCompleteStaffQuestionInventory } from './staffQuestionInventory'
import { previewQuestionImport, validateQuestionDraft, questionTransitionAllowed, type EditorialRole, type QuestionDraft, type QuestionRow, type QuestionStatus } from './questionLibrary'

const isStudioActivity = (payload: Record<string, unknown>) => payload?.format === 'studio-activity-v1'
async function validateLibraryInput(draft: QuestionDraft): Promise<string[]> {
  // Legacy question APIs must not eagerly initialize image/story catalogs or require media configuration.
  return isStudioActivity(draft.payload) ? (await import('./studioActivity')).validateLibraryDraft(draft) : validateQuestionDraft(draft)
}

type DbError = { message: string; code?: string } | null
type Result = { data: unknown; error: DbError }
type Query = {
  select: (columns: string) => Query
  order: (column: string, options: { ascending: boolean }) => Promise<Result>
  eq: (column: string, value: string) => Query
  single: () => Promise<Result>
  insert: (value: Record<string, unknown>) => Query
  update: (value: Record<string, unknown>) => Query
}
export type QuestionLibraryClient = {
  from: (table: string) => Query
  rpc: (name: string, args: Record<string, unknown>) => Promise<Result>
}

function dataOrThrow(result: Result, operation: string) {
  if (result.error) throw new Error(`${operation}: ${result.error.message}`)
  return result.data
}

export function createQuestionLibraryApi(
  client: QuestionLibraryClient | null,
  authorize: () => Promise<{ profileRole?: string } | void>,
  completeInventory?: () => Promise<QuestionRow[]>,
) {
  const table = () => {
    if (!client) throw new Error('Supabase is not configured.')
    return client.from('play_content_items')
  }
  const list = async (): Promise<QuestionRow[]> => {
    await authorize()
    const data = dataOrThrow(await table()
      .select('id,question_id,stable_id,game_type,category,difficulty,status,payload,source_references,review_notes,updated_at,published_at')
      .order('updated_at', { ascending: false }), 'Load Faith Challenges')
    return (data || []) as QuestionRow[]
  }
  const get = async (id: string): Promise<QuestionRow> => {
    await authorize()
    const data = dataOrThrow(await table()
      .select('id,question_id,stable_id,game_type,category,difficulty,status,payload,source_references,review_notes,updated_at,published_at')
      .eq('id', id).single(), 'Load question')
    if (!data) throw new Error('Question not found.')
    return data as QuestionRow
  }
  const save = async (draft: QuestionDraft, id?: string): Promise<QuestionRow> => {
    await authorize()
    const errors = await validateLibraryInput(draft)
    if (errors.length) throw new Error(errors.join(' '))
    if (id) {
      const current = await get(id)
      if (current.status !== 'draft') {
        throw new Error('Return this question to draft before editing it.')
      }
      if (draft.stable_id !== current.stable_id) {
        throw new Error('The stable ID cannot change after creation. Duplicate this question to create a new ID.')
      }
    }
    const payload = { stable_id: draft.stable_id, game_type: draft.game_type,
      category: draft.category, difficulty: draft.difficulty, payload: draft.payload,
      source_references: draft.source_references,
      ...(!id ? { question_id: draft.stable_id } : {}), status: 'draft' }
    const query = id ? table().update(payload).eq('id', id) : table().insert(payload)
    const data = dataOrThrow(await query.select('id,question_id,stable_id,game_type,category,difficulty,status,payload,source_references,review_notes,updated_at,published_at').single(),
      id ? 'Save question' : 'Create question')
    if (!data) throw new Error('The database did not return a saved question.')
    return data as QuestionRow
  }
  const review = async (id: string, status: QuestionStatus, notes: string): Promise<void> => {
    const session = await authorize()
    const current = await get(id)
    const role = (session && session.profileRole) as EditorialRole | undefined
    if (!role || !questionTransitionAllowed(current.status, status, role)) {
      throw new Error('This editorial status transition is not allowed.')
    }
    if (status === 'published' && isStudioActivity(current.payload)) {
      throw new Error('Activity publication is blocked until database validation, effective RLS and the published reader are verified in isolated staging.')
    }
    if (status === 'published' && (current.game_type === 'who-am-i' || current.game_type === 'match' || current.game_type === 'finish-the-mezmur')) {
      throw new Error('This format has no verified public question reader publication workflow. A local card bank or published hymn lyrics remains the fallback; verified database support is required before publishing CMS cards.')
    }
    if (status === 'review' || status === 'approved' || status === 'published') {
      const errors = await validateLibraryInput(current)
      if (errors.length) throw new Error(errors.join(' '))
    }
    if (!client) throw new Error('Supabase is not configured.')
    dataOrThrow(await client.rpc('review_play_content', { p_id: id, p_status: status, p_notes: notes.trim() || null }),
      'Review question')
  }
  const importDrafts = async (raw: string, existingIds: ReadonlySet<string>): Promise<number> => {
    await authorize()
    const known = new Set(existingIds)
    for (const row of await (completeInventory ? completeInventory() : list())) {
      known.add(row.stable_id)
      known.add(row.question_id)
    }
    const preview = previewQuestionImport(raw, known)
    if (preview.errors.length) throw new Error(preview.errors.join(' '))
    let saved = 0
    for (const draft of preview.items) {
      try { await save(draft); saved += 1 } catch (error) {
        throw new Error(`Imported ${saved} of ${preview.items.length} drafts. ${error instanceof Error ? error.message : 'Save failed.'}`)
      }
    }
    return saved
  }
  return { list, get, save, review, importDrafts }
}

export const questionLibraryApi = createQuestionLibraryApi(
  supabase as unknown as QuestionLibraryClient | null,
  () => requireCmsStaffSession('Faith Challenges question library'),
  async () => (await loadCompleteStaffQuestionInventory()).rows,
)
