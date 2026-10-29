import type { User } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import type { PlayProgress } from './progress'

type RpcClient = { rpc: (name: string, args: Record<string, unknown>) => Promise<{ error: { message: string } | null }> }
type ProgressClient = {
  from: (table: string) => {
    select: (columns: string) => {
      eq: (column: string, value: string) => {
        maybeSingle: () => Promise<{ data: { snapshot: PlayProgress | null } | null; error: { message: string } | null }>
      }
    }
  }
}

export async function syncPlayCompletion(user: User | null, input: { game: string; score: number; maxScore: number; category: string; progress: PlayProgress }) {
  if (!user || !supabase) return
  const client = supabase as unknown as RpcClient
  const { error } = await client.rpc('record_play_completion', {
    p_game_type: input.game,
    p_score: input.score,
    p_max_score: input.maxScore,
    p_category: input.category,
    p_snapshot: input.progress,
  })
  if (error && !/not find|schema cache/i.test(error.message)) throw new Error(error.message)
}

export async function loadSavedPlayProgress(user: User | null): Promise<PlayProgress | null> {
  if (!user || !supabase) return null
  const client = supabase as unknown as ProgressClient
  const { data, error } = await client.from('play_user_progress').select('snapshot').eq('user_id', user.id).maybeSingle()
  if (error) {
    if (/not find|schema cache|does not exist/i.test(error.message)) return null
    throw new Error(error.message)
  }
  return data?.snapshot || null
}
