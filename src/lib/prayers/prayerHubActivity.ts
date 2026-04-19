/**
 * Lightweight local persistence for the Prayers hub: last visit, recents, and
 * saved paths. Child prayer pages may call `addSavedPrayerPath` when bookmark UI exists.
 */

export const PRAYER_HUB_ROUTES = [
  '/prayers/zeweter',
  '/prayers/wudase-mariam',
  '/prayers/mezmure-dawit',
  '/prayers/yekidane-tselot',
  '/prayers/meharene-ab',
] as const

export type PrayerHubRoute = (typeof PRAYER_HUB_ROUTES)[number]

const STORAGE_LAST = 'tewahedo-prayer-hub-last'
const STORAGE_RECENT = 'tewahedo-prayer-hub-recent'
const STORAGE_SAVED = 'tewahedo-prayer-saved'

/** Same-tab updates (storage event only fires in other tabs). */
export const PRAYER_HUB_UPDATE = 'tewahedo-prayer-hub-update'

export function isPrayerHubRoute(path: string): path is PrayerHubRoute {
  return (PRAYER_HUB_ROUTES as readonly string[]).includes(path)
}

export function recordPrayerHubVisit(path: string) {
  if (typeof window === 'undefined') return
  if (!isPrayerHubRoute(path)) return
  try {
    window.localStorage.setItem(
      STORAGE_LAST,
      JSON.stringify({ path, at: Date.now() }),
    )
    const raw = window.localStorage.getItem(STORAGE_RECENT)
    const prev: string[] = raw ? JSON.parse(raw) : []
    const next = [path, ...prev.filter((p) => p !== path)].slice(0, 4)
    window.localStorage.setItem(STORAGE_RECENT, JSON.stringify(next))
    window.dispatchEvent(new Event(PRAYER_HUB_UPDATE))
  } catch {
    /* quota / private mode */
  }
}

export function getLastPrayerHubVisit(): {
  path: PrayerHubRoute
  at: number
} | null {
  if (typeof window === 'undefined') return null
  try {
    const raw = window.localStorage.getItem(STORAGE_LAST)
    if (!raw) return null
    const parsed = JSON.parse(raw) as { path: string; at: number }
    if (!isPrayerHubRoute(parsed.path)) return null
    return { path: parsed.path, at: parsed.at }
  } catch {
    return null
  }
}

export function getRecentPrayerHubPaths(): PrayerHubRoute[] {
  if (typeof window === 'undefined') return []
  try {
    const raw = window.localStorage.getItem(STORAGE_RECENT)
    if (!raw) return []
    const arr = JSON.parse(raw) as string[]
    return arr.filter((p): p is PrayerHubRoute => isPrayerHubRoute(p))
  } catch {
    return []
  }
}

export function getSavedPrayerPaths(): PrayerHubRoute[] {
  if (typeof window === 'undefined') return []
  try {
    const raw = window.localStorage.getItem(STORAGE_SAVED)
    if (!raw) return []
    const arr = JSON.parse(raw) as string[]
    return arr.filter((p): p is PrayerHubRoute => isPrayerHubRoute(p))
  } catch {
    return []
  }
}

/** For future use from prayer detail pages (bookmark / save). */
export function addSavedPrayerPath(path: PrayerHubRoute) {
  if (typeof window === 'undefined') return
  const cur = getSavedPrayerPaths()
  if (cur.includes(path)) return
  try {
    window.localStorage.setItem(STORAGE_SAVED, JSON.stringify([...cur, path]))
    window.dispatchEvent(new Event(PRAYER_HUB_UPDATE))
  } catch {
    /* ignore */
  }
}
