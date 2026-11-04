import { supabase } from '../supabase/client'
import type { PlayQuestion } from './types'
import { publishedCard, type CardGame, type CardFor } from './cardContent'

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
  if (error) throw error
  return (data || []).map((row) => row.payload).filter(isQuestion)
}

type CardQuery = {
  select: (columns: string) => CardQuery
  eq: (column: string, value: string) => CardQuery
  not: (column: string, operator: string, value: null) => CardQuery
  order: (column: string, options: { ascending: boolean }) => CardQuery
  limit: (count: number) => Promise<{ data: unknown[] | null; error: unknown }>
}
export type PublishedCardClient = { from: (table: string) => CardQuery }
/** No localStorage, staff API or unpublished rows are read by public gameplay. */
export async function loadPublishedGameCards<G extends CardGame>(game: G, client: PublishedCardClient | null = supabase as unknown as PublishedCardClient | null): Promise<CardFor<G>[]> {
  if (!client) return []
  const { data, error } = await client.from('play_content_items')
    .select('question_id,stable_id,game_type,category,difficulty,status,published_at,payload,source_references')
    .eq('game_type', game).eq('status', 'published').not('published_at', 'is', null)
    .order('published_at', { ascending: true }).limit(1000)
  if (error) throw new Error('Published game cards could not be loaded.')
  if (!Array.isArray(data)) throw new Error('Published game cards returned an invalid response.')
  const cards = data.map(row => publishedCard(game, row))
  if (cards.some(card => card === null) || new Set(cards.map(card => card?.id)).size !== cards.length) throw new Error('Published game cards contain incompatible content or identifiers. Static content is preserved.')
  return cards as CardFor<G>[]
}
