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
  'fasting-seasons': 'calendar/general/great-lent-6feda2f3-1792558641939.webp',
  'church-life-sacraments': 'hymns/collections/sacraments-church-life-1793162624070.webp',
  'sacraments-church-life': 'hymns/collections/sacraments-church-life-1793162624070.webp',
  'anytime-mezmurs': 'hymns/collections/praise-general.webp',
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
  repentance: `${CALENDAR}/AbiyTsom.webp`,
  'repentance-fasting': `${CALENDAR}/AbiyTsom.webp`,
  'occasion-holidays-feasts': `${CALENDAR}/JoyfulFeastSeason.webp`,
  'holidays-feasts': `${CALENDAR}/JoyfulFeastSeason.webp`,
  'fasting-seasons': `${CALENDAR}/FastingSeasonAtmosphere.webp`,
  'church-life-sacraments': `${CALENDAR}/TodayInChurch.webp`,
  'sacraments-church-life': `${CALENDAR}/TodayInChurch.webp`,
  'anytime-mezmurs': '/images/chants/chants-hero.jpg',
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
