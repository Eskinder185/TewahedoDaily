/**
 * Source of verified Mezmur lyrics for Finish the Mezmur (spec Phase 2).
 *
 * Reads directly from the published projection `mezmur_public` through the same
 * RLS-protected client the rest of the site uses, so only published, reviewed
 * lyrics are ever read; restricted lyrics are redacted by the view. Lyric text
 * is never modified here.
 */
import { supabase } from '../supabase/client'
import { usableLines, type MezmurSong } from './finishMezmur'

const SELECT = 'slug, title, title_amharic, title_english, primary_language, lyrics_amharic, lyrics_english, lyrics_transliteration, youtube_url'

type Row = MezmurSong
const DEFAULT_TIMEOUT_MS = 8_000
export const MAX_PAGES = 16
/** Learned from the first short or empty page, so later rounds only pick pages that exist. */
let knownPages = MAX_PAGES

async function bounded<T>(promise: Promise<T>, timeoutMs: number): Promise<T> {
  let timer: ReturnType<typeof setTimeout> | undefined
  try {
    return await Promise.race([
      promise,
      new Promise<T>((_, reject) => { timer = setTimeout(() => reject(new Error('Mezmur lyrics request timed out')), timeoutMs) }),
    ])
  } finally {
    if (timer) clearTimeout(timer)
  }
}

/**
 * Fetch a batch of published Mezmurs that have enough usable lyric lines to
 * make questions. `sample` rows are pulled from a random offset so repeat
 * visits draw from different songs; only rows with >= minUsable usable lines
 * are kept. Returns [] when Supabase is unavailable (the game then shows a
 * clear "content loading" state rather than inventing questions).
 */
export async function fetchMezmurLyrics(options: { sample?: number; minUsable?: number; timeoutMs?: number } = {}): Promise<MezmurSong[]> {
  const client = supabase as unknown as {
    from: (t: string) => {
      select: (c: string) => {
        eq: (k: string, v: string) => {
          not: (k: string, op: string, v: null) => {
            order: (k: string, o: { ascending: boolean }) => {
              range: (a: number, b: number) => Promise<{ data: Row[] | null; error: { message: string } | null }>
            }
          }
        }
      }
    }
  } | null
  if (!client) return []
  const sample = Math.min(600, Math.max(60, options.sample ?? 240))
  const minUsable = options.minUsable ?? 5
  const timeoutMs = Math.max(250, options.timeoutMs ?? DEFAULT_TIMEOUT_MS)
  // A stable, cheap source of variety: order by slug and start at a random page. The page range covers the whole
  // catalog (16 pages of 240 is 3,840 hymns); an empty page falls back to the first one below. Six pages used to cap
  // this at the first 1,440 hymns, so later hymns could never appear in a round.
  const pageIndex = Math.floor(Math.random() * knownPages)
  const start = pageIndex * sample
  try {
    const { data, error } = await bounded(client
      .from('mezmur_public')
      .select(SELECT)
      .eq('status', 'published')
      .not('lyrics_amharic', 'is', null)
      .order('slug', { ascending: true })
      .range(start, start + sample - 1), timeoutMs)
    if (error || !data) return []
    if (data.length < sample) knownPages = Math.max(1, data.length === 0 ? pageIndex : pageIndex + 1)
    const songs = (data.length ? data : []).filter((row) => usableLines(row).length >= minUsable)
    // If the random page was thin, fall back to the first page.
    if (songs.length >= 12 || start === 0) return songs
    const first = await bounded(client
      .from('mezmur_public')
      .select(SELECT)
      .eq('status', 'published')
      .not('lyrics_amharic', 'is', null)
      .order('slug', { ascending: true })
      .range(0, sample - 1), timeoutMs)
    if (first.error || !first.data) return songs
    return first.data.filter((row) => usableLines(row).length >= minUsable)
  } catch {
    return []
  }
}
