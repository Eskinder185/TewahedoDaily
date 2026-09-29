const ID = '([a-zA-Z0-9_-]{11})'

/** Extract 11-char id from watch URL, Shorts, live, youtu.be, embed, music.youtube, or raw id string. */
export function parseYoutubeVideoId(input: string | undefined | null): string | null {
  if (!input || typeof input !== 'string') return null
  const u = input.trim()
  if (!u) return null
  const fromQuery = u.match(new RegExp(`[?&]v=${ID}(?:&|$)`))
  if (fromQuery) return fromQuery[1]
  const fromShort = u.match(new RegExp(`youtu\\.be\\/${ID}(?:\\?|$)`))
  if (fromShort) return fromShort[1]
  const fromEmbed = u.match(new RegExp(`youtube\\.com\\/embed\\/${ID}(?:\\?|$|\\/)`))
  if (fromEmbed) return fromEmbed[1]
  const fromShorts = u.match(new RegExp(`youtube\\.com\\/shorts\\/${ID}(?:\\?|$|\\/)`))
  if (fromShorts) return fromShorts[1]
  const fromLive = u.match(new RegExp(`youtube\\.com\\/live\\/${ID}(?:\\?|$|\\/)`))
  if (fromLive) return fromLive[1]
  if (/^[a-zA-Z0-9_-]{11}$/.test(u)) return u
  return null
}

export function isValidYoutubeVideoId(id: string | undefined | null): id is string {
  return typeof id === 'string' && /^[a-zA-Z0-9_-]{11}$/.test(id.trim())
}

const warnedMalformed = new Set<string>()

/**
 * Development-only: log once when a non-empty URL cannot be parsed.
 * Empty / missing YouTube is intentional for many legacy mezmur — never warn for that.
 */
export function warnMalformedYoutubeUrlOnce(
  context: string,
  youtubeUrl: string | undefined | null,
): void {
  if (!import.meta.env.DEV) return
  const raw = typeof youtubeUrl === 'string' ? youtubeUrl.trim() : ''
  if (!raw) return
  if (parseYoutubeVideoId(raw)) return
  if (warnedMalformed.has(context)) return
  warnedMalformed.add(context)
  console.warn(`[TewahedoDaily] Unusable YouTube URL for ${context}`, { youtubeUrl: raw })
}

export function youtubeThumbnailUrl(
  videoId: string,
  quality: 'hq' | 'maxres' = 'hq',
): string | undefined {
  if (!isValidYoutubeVideoId(videoId)) return undefined
  const slug = quality === 'maxres' ? 'maxresdefault' : 'hqdefault'
  return `https://img.youtube.com/vi/${videoId.trim()}/${slug}.jpg`
}

export function youtubeWatchUrl(videoId: string): string | undefined {
  if (!isValidYoutubeVideoId(videoId)) return undefined
  return `https://www.youtube.com/watch?v=${videoId.trim()}`
}
