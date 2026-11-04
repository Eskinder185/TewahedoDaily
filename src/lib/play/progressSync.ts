import type { User } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import type { PlayProgress } from './progress'

type ProgressClient = {
  from: (table: string) => {
    select: (columns: string) => {
      eq: (column: string, value: string) => {
        maybeSingle: () => Promise<{ data: { snapshot: PlayProgress | null } | null; error: { message: string } | null }>
      }
    }
  }
}

export async function syncPlayCompletion(user: User | null, _input: { game: string; score: number; maxScore: number; category: string; progress: PlayProgress }) {
  if (!user || !supabase) return
  // Browser scores/snapshots are not completion evidence. Preserve local play,
  // but never submit them to the legacy XP-awarding RPC. Verified Game Night
  // rewards use claimVerifiedRoomReward; other games need trusted verifiers.
  return { status: 'local-only' as const }
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
