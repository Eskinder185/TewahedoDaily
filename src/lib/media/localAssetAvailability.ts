/**
 * Which legacy local calendar images still ship in `public/`.
 *
 * Many generic images under `public/images/calendar-web/` were intentionally removed because they did not
 * represent Ethiopian Orthodox Tewahedo tradition accurately. They must never be selected as a primary or
 * fallback image. This is an allow-list of the files that REMAIN (not a list of removed names), so adding a
 * file to `public/images/calendar-web/` requires adding its stem here; `scripts/test-play-image-catalog.ts`
 * fails when this list and the directory drift apart.
 *
 * `/images/calendar/` currently ships no images. Remote (`https://`) URLs are not judged here.
 */
export const LOCAL_CALENDAR_WEB_STEMS: readonly string[] = [
  'AbiyTsom', 'AbuneAregawi', 'AbuneTeklehaymanot', 'ArchangelRaphael', 'ArchangelUriel', 'Fasika', 'Gizret',
  'HolyTrinityCommemoration', 'KanaZeGalilee', 'KidusGiorgis', 'LidetaMaryam', 'MarianFeast', 'MedhaneAlem', 'Meskel',
  'Saint George', 'Saint Philip', 'SaintDavid', 'SaintGabrielFeast', 'SaintJohntheBaptist', 'SaintMaryCommemoration',
  'SaintMichaelCommemoration', 'SaintMichaelFeast', 'SaintStephen', 'SaintYared', 'SaintsPeterandPaul', 'SemuneHimamat',
  'Siqlet', 'St.Merkorious', 'Tsinset', 'TsomeHawaryat', 'TsomeNebiyat',
]

const AVAILABLE = new Set(LOCAL_CALENDAR_WEB_STEMS.map((stem) => `${stem}.webp`.toLowerCase()))
const CALENDAR_WEB = /^\/?images\/calendar-web\/(.+)$/i
const CALENDAR_ROOT = /^\/?images\/calendar\//i

function decoded(value: string): string {
  try { return decodeURIComponent(value) } catch { return value }
}

/**
 * False only for a local `/images/calendar-web/*` or `/images/calendar/*` path whose file is not shipped.
 * Everything else (remote URLs, other local folders, empty values) is not judged here and returns true.
 */
export function isLocalAssetAvailable(pathOrUrl: string | null | undefined): boolean {
  const value = (pathOrUrl ?? '').trim().split('?')[0]
  if (!value) return true
  if (CALENDAR_ROOT.test(value)) return false
  const match = CALENDAR_WEB.exec(value)
  if (!match) return true
  return AVAILABLE.has(decoded(match[1]).toLowerCase())
}

/** The path when its local file ships (or it is not a judged local path); otherwise an empty string. */
export function availableLocalAsset(pathOrUrl: string): string {
  return isLocalAssetAvailable(pathOrUrl) ? pathOrUrl : ''
}
