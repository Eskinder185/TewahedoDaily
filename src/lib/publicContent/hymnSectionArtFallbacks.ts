import { resolveContentMediaUrl } from '../cms/contentMedia'
import { resolveMedia } from '../media/mediaResolver'

/**
 * Local 4:3 calendar-web and liturgical art used when a hymn section has no
 * CMS image_path, or when the stored Storage object 404s (see HymnBrowseCard onError).
 *
 * CMS `mezmur_sections_import.image_path` is the canonical source. Do not
 * preemptively override paths under hymns/sections/ — admin MediaPicker
 * writes there, and the public cards must show those updates.
 */
const CAL_WEB = '/images/calendar-web'

/** Verified HTTP-200 content-media paths for slugs without dedicated local calendar-web files. */
const VERIFIED_CONTENT_MEDIA_BY_SLUG: Record<string, string> = {
  gena: 'calendar/christ/gena-255444ca-1790968314647.webp',
  timket: 'calendar/christ/timket-436e0376-1792010746233.webp',
  'holy-week': 'calendar/general/holy-week-d4d03282-1792613342360.webp',
  repentance: 'hymns/collections/repentance-fasting-1793162386004.webp',
  'repentance-fasting': 'hymns/collections/repentance-fasting-1793162386004.webp',
  'fasting-suitable': 'hymns/collections/repentance-fasting-1793162386004.webp',
  communion: 'hymns/collections/sacraments-church-life-1793162624070.webp',
  'sacraments-church-life': 'hymns/collections/sacraments-church-life-1793162624070.webp',
  praise: 'hymns/collections/praise-general.webp',
  'praise-general': 'hymns/collections/praise-general.webp',
  'praise-worship': 'hymns/collections/praise-general.webp',
  'angels-saints': 'hymns/collections/angels-saints.webp',
  'abune-gebre-menfes-kidus': 'hymns/collections/angels-saints.webp',
  'kidist-arsema': 'hymns/collections/angels-saints.webp',
  hosanna: 'hymns/collections/holidays-feasts-1790969755396.webp',
  'debre-tabor': 'hymns/collections/holidays-feasts-1790969755396.webp',
  erget: 'hymns/collections/holidays-feasts-1790969755396.webp',
  pentecost: 'hymns/collections/holidays-feasts-1790969755396.webp',
  'annual-saint-feast': 'hymns/collections/holidays-feasts-1790969755396.webp',
  'english-mezmur': 'hymns/collections/english-mezmur.webp',
}

const BY_SLUG: Record<string, string> = {
  'holidays-meskel': `${CAL_WEB}/Meskel.webp`,
  'holidays-tinsae': `${CAL_WEB}/Fasika.webp`,
  'holidays-lideta-maryam': `${CAL_WEB}/LidetaMaryam.webp`,
  'holidays-annunciation': `${CAL_WEB}/Tsinset.webp`,
  'holidays-holy-week': `${CAL_WEB}/SemuneHimamat.webp`,
  'holidays-good-friday': `${CAL_WEB}/Siqlet.webp`,
  'holidays-siklet': `${CAL_WEB}/Siqlet.webp`,
  // Canonical fallback sections (src/lib/publicContent/browseTaxonomy.ts)
  'christ-salvation': `${CAL_WEB}/MedhaneAlem.webp`,
  'saint-john-the-baptist': `${CAL_WEB}/SaintJohntheBaptist.webp`,
  'tsome-nebiyat': `${CAL_WEB}/TsomeNebiyat.webp`,
  'tsome-hawariat': `${CAL_WEB}/TsomeHawaryat.webp`,
  // Canonical subcategories (matching CATEGORY_ENTRIES & OCCASION_ENTRIES)
  'kidus-michael': `${CAL_WEB}/SaintMichaelCommemoration.webp`,
  'saint-michael': `${CAL_WEB}/SaintMichaelCommemoration.webp`,
  angels: `${CAL_WEB}/SaintMichaelFeast.webp`,
  'kidus-gabriel': `${CAL_WEB}/SaintGabrielFeast.webp`,
  'saint-gabriel': `${CAL_WEB}/SaintGabrielFeast.webp`,
  'kidus-giorgis': `${CAL_WEB}/Saint George.webp`,
  'saint-george': `${CAL_WEB}/Saint George.webp`,
  'kidus-uriel': `${CAL_WEB}/ArchangelUriel.webp`,
  'saint-uriel': `${CAL_WEB}/ArchangelUriel.webp`,
  'kidus-raphael': `${CAL_WEB}/ArchangelRaphael.webp`,
  'saint-raphael': `${CAL_WEB}/ArchangelRaphael.webp`,
  'kidus-estifanos-saint-stephen': `${CAL_WEB}/SaintStephen.webp`,
  'saint-stephen': `${CAL_WEB}/SaintStephen.webp`,
  martyrs: `${CAL_WEB}/SaintStephen.webp`,
  'kidus-yared': `${CAL_WEB}/SaintYared.webp`,
  'saint-yared': `${CAL_WEB}/SaintYared.webp`,
  'abune-tekle-haymanot': `${CAL_WEB}/AbuneTeklehaymanot.webp`,
  saints: `${CAL_WEB}/AbuneTeklehaymanot.webp`,
  'yohannes-metmek-john-the-baptist': `${CAL_WEB}/SaintJohntheBaptist.webp`,
  'new-year': `${CAL_WEB}/SaintJohntheBaptist.webp`,
  apostles: `${CAL_WEB}/SaintsPeterandPaul.webp`,
  prophets: `${CAL_WEB}/SaintDavid.webp`,
  'jesus-christ': `${CAL_WEB}/MedhaneAlem.webp`,
  'christ-hymns': `${CAL_WEB}/MedhaneAlem.webp`,
  'virgin-mary': `${CAL_WEB}/MarianFeast.webp`,
  'virgin-mary-hymns': `${CAL_WEB}/MarianFeast.webp`,
  filseta: `${CAL_WEB}/MarianFeast.webp`,
  'kidane-mihret': `${CAL_WEB}/SaintMaryCommemoration.webp`,
  'holy-trinity': `${CAL_WEB}/HolyTrinityCommemoration.webp`,
  'holy-spirit': `${CAL_WEB}/HolyTrinityCommemoration.webp`,
  cross: `${CAL_WEB}/Meskel.webp`,
  salvation: `${CAL_WEB}/MedhaneAlem.webp`,
  meskel: `${CAL_WEB}/Meskel.webp`,
  siklet: `${CAL_WEB}/Siqlet.webp`,
  tinsae: `${CAL_WEB}/Fasika.webp`,
  'lideta-maryam': `${CAL_WEB}/LidetaMaryam.webp`,
  'abiy-tsom': '/images/tselot/tselot-major-devotions.jpg',
  'tsome-nineveh': '/images/tselot/tselot-major-devotions.jpg',
  repentance: '/images/tselot/tselot-major-devotions.jpg',
  'repentance-fasting': '/images/tselot/tselot-major-devotions.jpg',
  'fasting-suitable': '/images/tselot/tselot-major-devotions.jpg',
  'tsome-gehad': `${CAL_WEB}/Gena.webp`,
  'holy-week': `${CAL_WEB}/SemuneHimamat.webp`,
  wedding: `${CAL_WEB}/KanaZeGalilee.webp`,
  baptism: `${CAL_WEB}/Gizret.webp`,
  prayer: '/images/tselot/tselot-daily-prayer.jpg',
  praise: '/images/chants/chants-mezmur-learning.jpg',
  'praise-general': '/images/chants/chants-mezmur-learning.jpg',
  'praise-worship': '/images/chants/chants-mezmur-learning.jpg',
  communion: '/images/support/support-incense-sacred-atmosphere.jpg',
  'sacraments-church-life': '/images/support/support-incense-sacred-atmosphere.jpg',
  funeral: '/images/support/support-prayer-books-manuscripts.jpg',
  'angels-saints': '/images/support/support-ethiopian-orthodox-architecture.jpg',
  'abune-gebre-menfes-kidus': '/images/support/support-ethiopian-orthodox-architecture.jpg',
  'kidist-arsema': '/images/support/support-ethiopian-orthodox-architecture.jpg',
  'kidus-petros': `${CAL_WEB}/SaintsPeterandPaul.webp`,
  'kidus-pawlos': `${CAL_WEB}/SaintsPeterandPaul.webp`,
  'kidus-yohannes-wengelawi': '/images/support/support-prayer-books-manuscripts.jpg',
  'kidus-markos': '/images/support/support-prayer-books-manuscripts.jpg',
  'abune-aregawi': `${CAL_WEB}/AbuneAregawi.webp`,
  'kidus-lalibela': '/images/home/home-hero-lalibela-1024.webp',
  'kidus-merkorios': `${CAL_WEB}/St.Merkorious.webp`,
  'kidus-tewodros': `${CAL_WEB}/KidusGiorgis.webp`,
  'nine-saints': `${CAL_WEB}/AbuneAregawi.webp`,
  tsige: `${CAL_WEB}/SaintMaryCommemoration.webp`,
  'holidays-tsige': `${CAL_WEB}/SaintMaryCommemoration.webp`,
  'hidar-tsion': `${CAL_WEB}/MarianFeast.webp`,
  'holidays-hidar-tsion': `${CAL_WEB}/MarianFeast.webp`,
  general: '/images/support/support-incense-sacred-atmosphere.jpg',
  'english-mezmur': '/images/chants/chants-hero.jpg',
  gena: '/images/chants/chants-hero.jpg',
  timket: '/images/chants/chants-hero.jpg',
  hosanna: '/images/chants/chants-hero.jpg',
  'debre-tabor': '/images/chants/chants-hero.jpg',
  erget: '/images/chants/chants-hero.jpg',
  pentecost: '/images/chants/chants-hero.jpg',
  'annual-saint-feast': '/images/chants/chants-hero.jpg',
}

/** Site-relative fallback URL for a section slug, if known (used for `<img onError>` fallback). */
export function hymnSectionArtFallback(slug: string | null | undefined): string {
  const key = String(slug || '')
    .trim()
    .toLowerCase()
  return BY_SLUG[key] || ''
}

/**
 * Prefer mezmur_sections_import.image_path (via resolved Storage URL), then
 * verified new uploaded `content-media` assets matching the section slug/title,
 * and finally local calendar-web / liturgical art when no new media exists.
 */
export function resolveHymnSectionImageUrl(
  slug: string | null | undefined,
  imagePath: string | null | undefined,
  resolvedStorageUrl: string,
): string {
  const path = String(imagePath || '').trim()
  if (path && resolvedStorageUrl) return resolvedStorageUrl

  const key = String(slug || '').trim().toLowerCase()
  if (key && key !== 'abiy-tsom') {
    const newMedia = resolveMedia({
      id: key,
      slug: key,
      domain: 'hymn-section',
      allowLegacyFallback: false,
    })
    if (newMedia.hasImage && newMedia.imageUrl) {
      return newMedia.imageUrl
    }
    const verifiedPath = VERIFIED_CONTENT_MEDIA_BY_SLUG[key]
    if (verifiedPath) {
      const resolved = resolveContentMediaUrl(verifiedPath)
      if (resolved) return resolved
    }
  }

  const local = hymnSectionArtFallback(slug)
  return local || resolvedStorageUrl || ''
}
