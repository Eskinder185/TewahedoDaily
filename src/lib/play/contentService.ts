import { supabase } from '../supabase/client'
import type { PlayQuestion } from './types'

type PublishedRow = { payload: unknown }
type PlayQuery = {
  select: (columns: string) => PlayQuery
  eq: (column: string, value: string) => PlayQuery
  order: (column: string, options: { ascending: boolean }) => Promise<{ data: PublishedRow[] | null; error: { message: string } | null }>
}

function isQuestion(value: unknown): value is PlayQuestion {
  if (!value || typeof value !== 'object') return false
  const row = value as Partial<PlayQuestion>
  return typeof row.id === 'string' && typeof row.prompt === 'object' && Array.isArray(row.options) && row.options.length === 4 && typeof row.correctKey === 'string'
}

export async function loadPublishedPlayQuestions(game: PlayQuestion['game']): Promise<PlayQuestion[]> {
  if (!supabase) return []
  const client = supabase as unknown as { from: (table: string) => PlayQuery }
  const { data, error } = await client.from('play_content_items').select('payload').eq('game_type', game).eq('status', 'published').order('published_at', { ascending: true })
  if (error) return []
  return (data || []).map((row) => row.payload).filter(isQuestion)
}
