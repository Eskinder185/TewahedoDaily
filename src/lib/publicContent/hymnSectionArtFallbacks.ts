import { resolveMedia } from '../media/mediaResolver'

/**
 * Local 4:3 calendar-web art used when a hymn section has no CMS image_path,
 * or when the stored Storage object 404s (see HymnBrowseCard onError).
 *
 * CMS `mezmur_sections_import.image_path` is the canonical source. Do not
 * preemptively override paths under hymns/sections/ — admin MediaPicker
 * writes there, and the public cards must show those updates.
 */
const CAL_WEB = '/images/calendar-web'

const BY_SLUG: Record<string, string> = {
  'holidays-meskel': `${CAL_WEB}/Meskel.webp`,
  'holidays-hosanna': `${CAL_WEB}/Hosanna.webp`,
  'holidays-new-year': `${CAL_WEB}/Enkutatash.webp`,
  'holidays-gena': `${CAL_WEB}/Gena.webp`,
  'holidays-timket': `${CAL_WEB}/Timket.webp`,
  'holidays-tinsae': `${CAL_WEB}/Fasika.webp`,
  'holidays-debre-tabor': `${CAL_WEB}/DebreTabor.webp`,
  'holidays-pentecost': `${CAL_WEB}/Peraklitos.webp`,
  'holidays-kidane-mihret': `${CAL_WEB}/KidaneMehret.webp`,
  'holidays-lideta-maryam': `${CAL_WEB}/LidetaMaryam.webp`,
  'holidays-annunciation': `${CAL_WEB}/Tsinset.webp`,
  'holidays-holy-week': `${CAL_WEB}/SemuneHimamat.webp`,
  'holidays-erget': `${CAL_WEB}/Erget.webp`,
  'holidays-filseta': `${CAL_WEB}/FilsetaFast.webp`,
  'holidays-good-friday': `${CAL_WEB}/Siqlet.webp`,
  'holidays-siklet': `${CAL_WEB}/Siqlet.webp`,
  // Canonical fallback sections (src/lib/publicContent/browseTaxonomy.ts)
  'christ-salvation': `${CAL_WEB}/MedhaneAlem.webp`,
  'saint-john-the-baptist': `${CAL_WEB}/SaintJohntheBaptist.webp`,
  'annual-saint-feasts': `${CAL_WEB}/EthiopianSaintsRemembrance.webp`,
  'tsome-nebiyat': `${CAL_WEB}/TsomeNebiyat.webp`,
  'tsome-hawariat': `${CAL_WEB}/TsomeHawaryat.webp`,
  // Canonical subcategories (matching CATEGORY_ENTRIES & OCCASION_ENTRIES)
  'kidus-michael': `${CAL_WEB}/SaintMichaelCommemoration.webp`,
  'saint-michael': `${CAL_WEB}/SaintMichaelCommemoration.webp`,
  'kidus-gabriel': `${CAL_WEB}/SaintGabrielCommemoration.webp`,
  'saint-gabriel': `${CAL_WEB}/SaintGabrielCommemoration.webp`,
  'kidus-giorgis': `${CAL_WEB}/Saint George.webp`,
  'saint-george': `${CAL_WEB}/Saint George.webp`,
  'kidus-uriel': `${CAL_WEB}/ArchangelUriel.webp`,
  'saint-uriel': `${CAL_WEB}/ArchangelUriel.webp`,
  'kidus-raphael': `${CAL_WEB}/ArchangelRaphael.webp`,
  'saint-raphael': `${CAL_WEB}/ArchangelRaphael.webp`,
  'kidus-estifanos-saint-stephen': `${CAL_WEB}/SaintStephen.webp`,
  'saint-stephen': `${CAL_WEB}/SaintStephen.webp`,
  'kidus-yared': `${CAL_WEB}/SaintYared.webp`,
  'saint-yared': `${CAL_WEB}/SaintYared.webp`,
  'abune-tekle-haymanot': `${CAL_WEB}/AbuneTeklehaymanot.webp`,
  'abune-gebre-menfes-kidus': `${CAL_WEB}/AbuneGebreMenfesKidus.webp`,
  'yohannes-metmek-john-the-baptist': `${CAL_WEB}/SaintJohntheBaptist.webp`,
  'jesus-christ': `${CAL_WEB}/MedhaneAlem.webp`,
  'christ-hymns': `${CAL_WEB}/MedhaneAlem.webp`,
  'virgin-mary': `${CAL_WEB}/MarianFeast.webp`,
  'virgin-mary-hymns': `${CAL_WEB}/MarianFeast.webp`,
  'holy-trinity': `${CAL_WEB}/HolyTrinityCommemoration.webp`,
  'holy-spirit': `${CAL_WEB}/Peraklitos.webp`,
  'cross': `${CAL_WEB}/Meskel.webp`,
  'salvation': `${CAL_WEB}/MedhaneAlem.webp`,
  'gena': `${CAL_WEB}/Gena.webp`,
  'timket': `${CAL_WEB}/Timket.webp`,
  'meskel': `${CAL_WEB}/Meskel.webp`,
  'hosanna': `${CAL_WEB}/Hosanna.webp`,
  'siklet': `${CAL_WEB}/Siqlet.webp`,
  'tinsae': `${CAL_WEB}/Fasika.webp`,
  'debre-tabor': `${CAL_WEB}/DebreTabor.webp`,
  'erget': `${CAL_WEB}/Erget.webp`,
  'pentecost': `${CAL_WEB}/Peraklitos.webp`,
  'filseta': `${CAL_WEB}/FilsetaFast.webp`,
  'kidane-mihret': `${CAL_WEB}/KidaneMehret.webp`,
  'lideta-maryam': `${CAL_WEB}/LidetaMaryam.webp`,
  'new-year': `${CAL_WEB}/Enkutatash.webp`,
  'abiy-tsom': `${CAL_WEB}/AbiyTsom.webp`,
  'tsome-nineveh': `${CAL_WEB}/Nineveh.webp`,
  'holy-week': `${CAL_WEB}/SemuneHimamat.webp`,
  'annual-saint-feast': `${CAL_WEB}/EthiopianSaintsRemembrance.webp`,
  'saints': `${CAL_WEB}/EthiopianSaintsRemembrance.webp`,
  'saints-general': `${CAL_WEB}/EthiopianSaintsRemembrance.webp`,
  'martyrs': `${CAL_WEB}/EthiopianSaintsRemembrance.webp`,
  'apostles': `${CAL_WEB}/ApostlesRemembrance.webp`,
  'angels': `${CAL_WEB}/ArchangelsRemembrance.webp`,
  'holy-angels': `${CAL_WEB}/ArchangelsRemembrance.webp`,
  'prophets': `${CAL_WEB}/EthiopianSaintsRemembrance.webp`,
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
 * and finally local calendar-web art when no new media exists.
 */
export function resolveHymnSectionImageUrl(
  slug: string | null | undefined,
  imagePath: string | null | undefined,
  resolvedStorageUrl: string,
): string {
  const path = String(imagePath || '').trim()
  if (path && resolvedStorageUrl) return resolvedStorageUrl

  const key = String(slug || '').trim().toLowerCase()
  if (key) {
    const newMedia = resolveMedia({
      id: key,
      slug: key,
      domain: 'hymn-section',
      allowLegacyFallback: false,
    })
    if (newMedia.hasImage && newMedia.imageUrl) {
      return newMedia.imageUrl
    }
  }

  const local = hymnSectionArtFallback(slug)
  return local || resolvedStorageUrl || ''
}
