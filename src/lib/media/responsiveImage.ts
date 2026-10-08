/**
 * Responsive image helpers for public Mezmur / hymn browse cards.
 *
 * Inventory (2026-10-08):
 * - Hymn collection art: Supabase Storage `content-media` public URLs (webp/jpeg).
 * - Mezmur card thumbs: same Storage bucket, or YouTube thumbnails as fallback.
 * - Local fallbacks: `/images/calendar-web/*.webp` (already sized ~40–350 KB).
 *
 * Transforms unavailable on this project:
 * - Supabase `/storage/v1/render/image/...` → HTTP 403 (plan feature off).
 * - Cloudflare `/cdn-cgi/image/...` on pages.dev → HTTP 404 (Image Resizing off).
 *
 * When ops enable either transform, set VITE_IMAGE_RESIZE_MODE=supabase|cloudflare
 * and rebuild — srcset will start requesting resized URLs without changing callers.
 */

export type ResponsiveImageAttrs = {
  src: string
  srcSet?: string
  sizes: string
  width: number
  height: number
  loading: 'eager' | 'lazy'
  decoding: 'async'
  fetchPriority?: 'high' | 'low' | 'auto'
}

const DEFAULT_WIDTHS = [320, 480, 640, 960] as const

function trimUrl(value: string | null | undefined): string {
  return (value || '').trim()
}

function youtubeVideoId(url: string): string | null {
  try {
    const u = new URL(url)
    if (u.hostname.includes('ytimg.com')) {
      const m = u.pathname.match(/\/vi\/([^/]+)\//)
      return m?.[1] || null
    }
    if (u.hostname.includes('youtube.com') || u.hostname.includes('youtu.be')) {
      if (u.hostname.includes('youtu.be')) return u.pathname.slice(1) || null
      return u.searchParams.get('v')
    }
  } catch {
    /* ignore */
  }
  return null
}

/** YouTube thumbnail ladder — never invents larger than available. */
function youtubeSrcSet(videoId: string): { src: string; srcSet: string; width: number; height: number } {
  // mqdefault 320×180, hqdefault 480×360, sddefault 640×480
  const mq = `https://i.ytimg.com/vi/${videoId}/mqdefault.jpg`
  const hq = `https://i.ytimg.com/vi/${videoId}/hqdefault.jpg`
  const sd = `https://i.ytimg.com/vi/${videoId}/sddefault.jpg`
  return {
    src: hq,
    srcSet: `${mq} 320w, ${hq} 480w, ${sd} 640w`,
    width: 480,
    height: 360,
  }
}

function isSupabasePublicObject(url: string): boolean {
  return /\/storage\/v1\/object\/public\//i.test(url)
}

function supabaseRenderUrl(objectPublicUrl: string, width: number): string | null {
  // /object/public/{bucket}/{path} → /render/image/public/{bucket}/{path}?width=
  const replaced = objectPublicUrl.replace(
    /\/storage\/v1\/object\/public\//i,
    '/storage/v1/render/image/public/',
  )
  if (replaced === objectPublicUrl) return null
  const joiner = replaced.includes('?') ? '&' : '?'
  return `${replaced}${joiner}width=${width}&resize=contain&quality=75`
}

function cloudflareResizeUrl(absoluteUrl: string, width: number): string | null {
  if (typeof window === 'undefined') return null
  // Same-origin Pages host must have Image Resizing enabled.
  const origin = window.location.origin
  if (!/^https?:\/\//i.test(absoluteUrl)) return null
  return `${origin}/cdn-cgi/image/width=${width},quality=75,format=auto/${absoluteUrl}`
}

function resizeMode(): 'off' | 'supabase' | 'cloudflare' {
  const raw = (import.meta.env.VITE_IMAGE_RESIZE_MODE || '').trim().toLowerCase()
  if (raw === 'supabase' || raw === 'cloudflare') return raw
  return 'off'
}

function buildTransformedSrcSet(src: string, widths: readonly number[]): string | undefined {
  const mode = resizeMode()
  if (mode === 'off') return undefined
  const parts: string[] = []
  for (const w of widths) {
    const next =
      mode === 'supabase' && isSupabasePublicObject(src)
        ? supabaseRenderUrl(src, w)
        : mode === 'cloudflare'
          ? cloudflareResizeUrl(src, w)
          : null
    if (next) parts.push(`${next} ${w}w`)
  }
  return parts.length ? parts.join(', ') : undefined
}

/**
 * Build img attributes for browse/card art. Does not upscale: when transforms
 * are off, srcSet is omitted for Storage URLs (browser loads `src` once).
 */
export function responsiveImageAttrs(
  source: string | null | undefined,
  options: {
    sizes: string
    width?: number
    height?: number
    priority?: boolean
    widths?: readonly number[]
  },
): ResponsiveImageAttrs | null {
  const src = trimUrl(source)
  if (!src) return null

  const width = options.width ?? 640
  const height = options.height ?? 480
  const widths = options.widths ?? DEFAULT_WIDTHS
  const loading = options.priority ? 'eager' : 'lazy'
  const fetchPriority = options.priority ? 'high' : 'low'

  const yt = youtubeVideoId(src)
  if (yt) {
    const tuned = youtubeSrcSet(yt)
    return {
      src: tuned.src,
      srcSet: tuned.srcSet,
      sizes: options.sizes,
      width: tuned.width,
      height: tuned.height,
      loading,
      decoding: 'async',
      fetchPriority,
    }
  }

  const srcSet = buildTransformedSrcSet(src, widths)
  return {
    src,
    srcSet,
    sizes: options.sizes,
    width,
    height,
    loading,
    decoding: 'async',
    fetchPriority,
  }
}

/** True when resized delivery is configured (ops must enable the backend). */
export function imageResizeConfigured(): boolean {
  return resizeMode() !== 'off'
}
