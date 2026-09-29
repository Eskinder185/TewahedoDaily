import { parseYoutubeVideoId, youtubeWatchUrl } from '../../data/utils/youtube'

const ALLOWED_HOSTS = new Set([
  'youtube.com',
  'www.youtube.com',
  'm.youtube.com',
  'music.youtube.com',
  'youtu.be',
  'www.youtu.be',
  'youtube-nocookie.com',
  'www.youtube-nocookie.com',
])

/** Accept URL string only — never HTML/iframe markup. */
export function isAllowedYoutubeUrl(raw: string): boolean {
  const value = raw.trim()
  if (!value || /<|>|javascript:/i.test(value)) return false
  if (/^[A-Za-z0-9_-]{11}$/.test(value)) return true
  try {
    const url = new URL(value.startsWith('http') ? value : `https://${value}`)
    if (url.protocol !== 'http:' && url.protocol !== 'https:') return false
    return ALLOWED_HOSTS.has(url.hostname.toLowerCase())
  } catch {
    return false
  }
}

export function normalizeYoutubePracticeUrl(raw: string): string | null {
  if (!isAllowedYoutubeUrl(raw)) return null
  const id = parseYoutubeVideoId(raw.trim())
  if (!id) return null
  return youtubeWatchUrl(id) || null
}

export function youtubeNocookieEmbed(videoId: string): string {
  return `https://www.youtube-nocookie.com/embed/${videoId}`
}

const STORAGE_PREFIX = 'tewahedo:hymn-video:'

export function readCustomHymnVideo(slug: string): string | null {
  if (typeof localStorage === 'undefined') return null
  try {
    const raw = localStorage.getItem(STORAGE_PREFIX + slug)
    if (!raw) return null
    return normalizeYoutubePracticeUrl(raw)
  } catch {
    return null
  }
}

export function writeCustomHymnVideo(slug: string, url: string): boolean {
  const normalized = normalizeYoutubePracticeUrl(url)
  if (!normalized || typeof localStorage === 'undefined') return false
  try {
    localStorage.setItem(STORAGE_PREFIX + slug, normalized)
    return true
  } catch {
    return false
  }
}

export function clearCustomHymnVideo(slug: string): void {
  if (typeof localStorage === 'undefined') return
  try {
    localStorage.removeItem(STORAGE_PREFIX + slug)
  } catch {
    /* ignore quota / private mode */
  }
}
