import { supabase } from '../supabase/client'
import { usableLines, type MezmurSong } from './finishMezmur'

type Query = { select: (s: string) => Query; eq: (k: string, v: string) => Query; not: (k: string, op: string, v: null) => Query;
  in: (k: string, values: string[]) => Query; abortSignal: (signal: AbortSignal) => Query; limit: (n: number) => PromiseLike<{ data: unknown[] | null; error: unknown }> }
export type SelectedMezmurClient = { from: (name: string) => Query }
/** CMS selects sources; public lyrics are always re-read from the rights-filtered projection. */
export async function fetchSelectedMezmurLyrics(slugs: string[], client: SelectedMezmurClient | null = supabase as unknown as SelectedMezmurClient | null): Promise<MezmurSong[]> {
  if (!slugs.length) return []
  if (!client || slugs.length > 100 || slugs.some(slug => !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(slug))) throw new Error('Selected lyric sources are unavailable.')
  const controller = new AbortController()
  let timer: ReturnType<typeof setTimeout> | undefined
  const expired = new Promise<never>((_, reject) => { timer = setTimeout(() => { controller.abort(); reject(new Error('Published lyric sources timed out.')) }, 12000) })
  try {
    const { data, error } = await Promise.race([client.from('mezmur_public')
      .select('slug,title,title_amharic,title_english,primary_language,lyrics_amharic,lyrics_english,lyrics_transliteration,youtube_url')
      .eq('status', 'published').not('lyrics_amharic', 'is', null).in('slug', [...new Set(slugs)]).abortSignal(controller.signal).limit(100), expired])
    if (error || !Array.isArray(data)) throw new Error('Published lyric sources could not be loaded.')
    const ids = new Set<string>()
    return data.filter((row): row is MezmurSong => {
      if (!row || typeof row !== 'object') throw new Error('Published lyric sources returned an invalid format.')
      const song = row as MezmurSong
      if (!slugs.includes(song.slug) || ids.has(song.slug) || typeof song.title !== 'string'
        || !['title_amharic', 'title_english', 'primary_language', 'lyrics_amharic', 'lyrics_english', 'lyrics_transliteration', 'youtube_url'].every(key => {
          const value = song[key as keyof MezmurSong]; return value === null || typeof value === 'string'
        }) || (song.youtube_url && !/^https:\/\/(www\.)?(youtube\.com\/watch\?|youtu\.be\/)/.test(song.youtube_url))) throw new Error('Published lyric sources returned an invalid format.')
      ids.add(song.slug)
      return typeof song.lyrics_amharic === 'string' && usableLines(song).length >= 5
    })
  } finally { clearTimeout(timer) }
}
