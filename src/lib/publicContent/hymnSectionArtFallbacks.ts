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
}

/** Site-relative fallback URL for a section slug, if known. */
export function hymnSectionArtFallback(slug: string | null | undefined): string {
  const key = String(slug || '')
    .trim()
    .toLowerCase()
  return BY_SLUG[key] || ''
}

/**
 * Prefer mezmur_sections_import.image_path (via resolved Storage URL).
 * Local calendar-web art fills empty paths only; load errors use HymnBrowseCard.
 */
export function resolveHymnSectionImageUrl(
  slug: string | null | undefined,
  imagePath: string | null | undefined,
  resolvedStorageUrl: string,
): string {
  const local = hymnSectionArtFallback(slug)
  const path = String(imagePath || '').trim()
  if (path && resolvedStorageUrl) return resolvedStorageUrl
  return local || resolvedStorageUrl || ''
}
