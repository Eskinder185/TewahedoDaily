export type ZemariSocialPlatform = 'instagram' | 'facebook' | 'youtube'

export type ZemariSocialLinks = Partial<Record<ZemariSocialPlatform, string | null>>

export type ValidZemariSocialLink = {
  platform: ZemariSocialPlatform
  url: string
}

const ALLOWED_HOSTS: Record<ZemariSocialPlatform, ReadonlySet<string>> = {
  instagram: new Set(['instagram.com', 'www.instagram.com']),
  facebook: new Set(['facebook.com', 'www.facebook.com', 'm.facebook.com']),
  youtube: new Set(['youtube.com', 'www.youtube.com', 'm.youtube.com', 'music.youtube.com']),
}

const RESERVED_INSTAGRAM_PATHS = new Set([
  'accounts',
  'direct',
  'explore',
  'p',
  'reel',
  'reels',
  'stories',
])

const RESERVED_FACEBOOK_PATHS = new Set([
  'events',
  'groups',
  'help',
  'login',
  'marketplace',
  'reel',
  'share',
  'sharer',
  'watch',
])

function pathSegments(url: URL): string[] {
  return url.pathname.split('/').filter(Boolean).map((part) => decodeURIComponent(part))
}

function isInstagramProfile(url: URL): boolean {
  const segments = pathSegments(url)
  return (
    segments.length === 1 &&
    !RESERVED_INSTAGRAM_PATHS.has(segments[0].toLowerCase()) &&
    /^[a-z0-9._]+$/i.test(segments[0])
  )
}

function isFacebookProfile(url: URL): boolean {
  const segments = pathSegments(url)
  if (url.pathname.toLowerCase() === '/profile.php') {
    return Boolean(url.searchParams.get('id')?.trim())
  }
  return (
    segments.length === 1 &&
    !RESERVED_FACEBOOK_PATHS.has(segments[0].toLowerCase()) &&
    /^[a-z0-9._-]+$/i.test(segments[0])
  )
}

function isYoutubeProfile(url: URL): boolean {
  const segments = pathSegments(url)
  if (segments.length === 1 && /^@[a-z0-9._-]+$/i.test(segments[0])) return true
  if (segments.length !== 2 || !segments[1].trim()) return false
  const kind = segments[0].toLowerCase()
  return kind === 'channel' || kind === 'c' || kind === 'user'
}

export function validateZemariSocialUrl(
  platform: ZemariSocialPlatform,
  value: string | null | undefined,
): { url: string | null; error: string | null } {
  const input = value?.trim() || ''
  if (!input) return { url: null, error: null }

  let parsed: URL
  try {
    parsed = new URL(input)
  } catch {
    return { url: null, error: 'Enter a complete, valid URL.' }
  }

  if (parsed.protocol !== 'https:') {
    return { url: null, error: 'Use a full HTTPS URL beginning with https://.' }
  }
  if (parsed.username || parsed.password) {
    return { url: null, error: 'Links containing a username or password are not allowed.' }
  }
  if (parsed.port) {
    return { url: null, error: 'Custom ports are not allowed.' }
  }

  const hostname = parsed.hostname.toLowerCase()
  if (!ALLOWED_HOSTS[platform].has(hostname)) {
    const expected =
      platform === 'instagram'
        ? 'instagram.com'
        : platform === 'facebook'
          ? 'facebook.com'
          : 'youtube.com'
    return { url: null, error: `Use an official ${expected} profile URL.` }
  }

  let isProfile = false
  try {
    isProfile =
      platform === 'instagram'
        ? isInstagramProfile(parsed)
        : platform === 'facebook'
          ? isFacebookProfile(parsed)
          : isYoutubeProfile(parsed)
  } catch {
    return { url: null, error: 'Enter a complete, valid profile URL.' }
  }

  if (!isProfile) {
    return {
      url: null,
      error:
        platform === 'youtube'
          ? 'Use a YouTube channel or profile URL, not a video, Short, playlist, or live URL.'
          : `Use a ${platform === 'instagram' ? 'Instagram' : 'Facebook'} profile or page URL.`,
    }
  }

  return { url: parsed.href, error: null }
}

export function getValidZemariSocialLinks(links: ZemariSocialLinks): ValidZemariSocialLink[] {
  const platforms: ZemariSocialPlatform[] = ['instagram', 'facebook', 'youtube']
  return platforms.flatMap((platform) => {
    const result = validateZemariSocialUrl(platform, links[platform])
    return result.url ? [{ platform, url: result.url }] : []
  })
}
