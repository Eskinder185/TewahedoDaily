const ID = '([a-zA-Z0-9_-]{11})'

/** Extract 11-char id from watch URL, Shorts, live, youtu.be, embed, music.youtube, or raw id string. */
export function parseYoutubeVideoId(input: string | undefined | null): string | null {
  if (!input || typeof input !== 'string') return null
  const u = input.trim()
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

export function youtubeThumbnailUrl(
  videoId: string,
  quality: 'hq' | 'maxres' = 'hq',
): string {
  const slug = quality === 'maxres' ? 'maxresdefault' : 'hqdefault'
  return `https://img.youtube.com/vi/${videoId}/${slug}.jpg`
}

export function youtubeWatchUrl(videoId: string): string {
  return `https://www.youtube.com/watch?v=${videoId}`
}
