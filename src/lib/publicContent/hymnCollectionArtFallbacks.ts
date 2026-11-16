import { resolveContentMediaUrl } from '../cms/contentMedia'

/**
 * Approved artwork for Hymn Browse collections.
 * Prioritizes newly uploaded `content-media` collection artwork (`hymns/collections/*` / `calendar/*`),
 * falling back to local `/images/calendar-web/*.webp` only if Supabase Storage is not configured.
 */
const CALENDAR = '/images/calendar-web'

const CONTENT_MEDIA_BY_COLLECTION: Record<string, string> = {
  'jesus-christ-salvation': 'hymns/collections/jesus-christ.webp',
  'jesus-christ': 'hymns/collections/jesus-christ.webp',
  'category-virgin-mary': 'hymns/collections/virgin-mary.webp',
  'virgin-mary': 'hymns/collections/virgin-mary.webp',
  'holy-trinity-holy-spirit': 'calendar/trinity/holy-trinity-c6334d74-1790968715701.webp',
  'category-angels-saints': 'hymns/collections/angels-saints.webp',
  'angels-saints': 'hymns/collections/angels-saints.webp',
  'prayer-worship': 'hymns/collections/praise-general.webp',
  'praise-general': 'hymns/collections/praise-general.webp',
  repentance: 'hymns/collections/repentance-fasting-1793162386004.webp',
  'repentance-fasting': 'hymns/collections/repentance-fasting-1793162386004.webp',
  'occasion-holidays-feasts': 'hymns/collections/holidays-feasts-1790969755396.webp',
  'holidays-feasts': 'hymns/collections/holidays-feasts-1790969755396.webp',
  'church-life-sacraments': 'hymns/collections/sacraments-church-life-1793162624070.webp',
  'sacraments-church-life': 'hymns/collections/sacraments-church-life-1793162624070.webp',
  // 'anytime-mezmurs' intentionally has no content-media entry: it used to reuse the Prayer & Worship
  // image, so two neighbouring cards looked identical. It now resolves to its own local artwork below
  // until a dedicated image is uploaded and approved.
  'english-mezmur': 'hymns/collections/english-mezmur.webp',
  'zemari-singers': 'hymns/collections/zemari-singers-1793162587835.webp',
}

const LEGACY_BY_COLLECTION: Record<string, string> = {
  'jesus-christ-salvation': `${CALENDAR}/MedhaneAlem.webp`,
  'jesus-christ': `${CALENDAR}/MedhaneAlem.webp`,
  'category-virgin-mary': `${CALENDAR}/MarianFeast.webp`,
  'virgin-mary': `${CALENDAR}/MarianFeast.webp`,
  'holy-trinity-holy-spirit': `${CALENDAR}/HolyTrinityCommemoration.webp`,
  'category-angels-saints': `${CALENDAR}/EthiopianSaintsRemembrance.webp`,
  'angels-saints': `${CALENDAR}/EthiopianSaintsRemembrance.webp`,
  'prayer-worship': '/images/chants/chants-mezmur-learning.jpg',
  'praise-general': '/images/chants/chants-mezmur-learning.jpg',
  repentance: '/images/tselot/tselot-major-devotions.jpg',
  'repentance-fasting': '/images/tselot/tselot-major-devotions.jpg',
  'occasion-holidays-feasts': `${CALENDAR}/Fasika.webp`,
  'holidays-feasts': `${CALENDAR}/Fasika.webp`,
  'fasting-seasons': '/images/tselot/tselot-major-devotions.jpg',
  'church-life-sacraments': `${CALENDAR}/TodayInChurch.webp`,
  'sacraments-church-life': `${CALENDAR}/TodayInChurch.webp`,
  // Choir singing in white shammas: general mezmurs sung at any time. 960px WebP of chants-hero.jpg (~79 KB vs 1.2 MB).
  'anytime-mezmurs': '/images/chants/chants-hero-960.webp',
  'english-mezmur': '/images/chants/chants-hero.jpg',
  'zemari-singers': '/images/chants/chants-mezmur-learning.jpg',
}

export function hymnCollectionArtFallback(slug: string | null | undefined): string {
  const key = String(slug || '').trim().toLowerCase()
  const contentMediaPath = CONTENT_MEDIA_BY_COLLECTION[key]
  if (contentMediaPath) {
    const resolved = resolveContentMediaUrl(contentMediaPath)
    if (resolved) return resolved
  }
  return LEGACY_BY_COLLECTION[key] || ''
}
