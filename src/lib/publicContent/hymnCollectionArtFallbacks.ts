/**
 * Approved repository artwork used only when a browse collection has no CMS
 * image. `mezmur_collections_import.image_path` always takes precedence.
 */
const CALENDAR = '/images/calendar-web'

const BY_COLLECTION: Record<string, string> = {
  'jesus-christ-salvation': `${CALENDAR}/MedhaneAlem.webp`,
  'category-virgin-mary': `${CALENDAR}/MarianFeast.webp`,
  'holy-trinity-holy-spirit': `${CALENDAR}/HolyTrinityCommemoration.webp`,
  'category-angels-saints': `${CALENDAR}/EthiopianSaintsRemembrance.webp`,
  'prayer-worship': '/images/chants/chants-mezmur-learning.jpg',
  repentance: `${CALENDAR}/AbiyTsom.webp`,
  'occasion-holidays-feasts': `${CALENDAR}/JoyfulFeastSeason.webp`,
  'fasting-seasons': `${CALENDAR}/FastingSeasonAtmosphere.webp`,
  'church-life-sacraments': `${CALENDAR}/TodayInChurch.webp`,
  'anytime-mezmurs': '/images/chants/chants-hero.jpg',
}

export function hymnCollectionArtFallback(slug: string | null | undefined): string {
  return BY_COLLECTION[String(slug || '').trim().toLowerCase()] || ''
}

