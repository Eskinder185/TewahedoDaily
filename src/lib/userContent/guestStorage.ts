/** localStorage helpers for guest favorites and reading progress. */

import type {
  FavoriteIdentity,
  FavoriteRecord,
  ProgressIdentity,
  ReadingProgressRecord,
  RecentViewedItem,
  UserContentType,
} from './types.ts'
import { favoriteKey, progressKey } from './types.ts'

const FAVORITES_KEY = 'tewahedo:favorites:v1'
const FAVORITES_KEY_LEGACY = 'td-guest-favorites-v1'
const PROGRESS_KEY = 'td-guest-progress-v1'
const RECENT_MEZMUR_KEY = 'td-guest-recent-mezmur-v1'
const RECENT_VIEWED_KEY = 'td-guest-recent-viewed-v1'
const MERGE_OFFERED_KEY = 'td-guest-merge-offered-v1'

export const USER_CONTENT_UPDATE = 'td-user-content-update'

function notify() {
  if (typeof window === 'undefined') return
  window.dispatchEvent(new Event(USER_CONTENT_UPDATE))
}

function readJson<T>(key: string, fallback: T): T {
  if (typeof window === 'undefined') return fallback
  try {
    const raw = window.localStorage.getItem(key)
    if (!raw) return fallback
    return JSON.parse(raw) as T
  } catch {
    return fallback
  }
}

function writeJson(key: string, value: unknown) {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(key, JSON.stringify(value))
    notify()
  } catch {
    /* private mode / quota */
  }
}

export function getGuestFavorites(): FavoriteRecord[] {
  const current = readJson<FavoriteRecord[]>(FAVORITES_KEY, [])
  if (current.length) return current
  // One-time migrate from legacy key.
  const legacy = readJson<FavoriteRecord[]>(FAVORITES_KEY_LEGACY, [])
  if (legacy.length) {
    writeJson(FAVORITES_KEY, legacy)
    try {
      window.localStorage.removeItem(FAVORITES_KEY_LEGACY)
    } catch {
      /* ignore */
    }
  }
  return legacy
}

export function setGuestFavorites(items: FavoriteRecord[]) {
  writeJson(FAVORITES_KEY, items.slice(0, 200))
}

export function isGuestFavorite(identity: FavoriteIdentity): boolean {
  const key = favoriteKey(identity)
  return getGuestFavorites().some((item) => favoriteKey(item) === key)
}

export function toggleGuestFavorite(identity: FavoriteIdentity): boolean {
  const key = favoriteKey(identity)
  const current = getGuestFavorites()
  const existing = current.find((item) => favoriteKey(item) === key)
  if (existing) {
    setGuestFavorites(current.filter((item) => favoriteKey(item) !== key))
    return false
  }
  const next: FavoriteRecord = {
    id: `local:${key}`,
    contentType: identity.contentType,
    contentId: identity.contentId || null,
    contentSlug: identity.contentSlug || null,
    collectionSlug: identity.collectionSlug || null,
    title: identity.title || null,
    route: identity.route || null,
    createdAt: new Date().toISOString(),
    source: 'local',
  }
  setGuestFavorites([next, ...current])
  return true
}

export function getGuestProgress(): ReadingProgressRecord[] {
  return readJson<ReadingProgressRecord[]>(PROGRESS_KEY, []).sort((a, b) =>
    b.updatedAt.localeCompare(a.updatedAt),
  )
}

export function upsertGuestProgress(identity: ProgressIdentity): ReadingProgressRecord {
  const key = progressKey(identity)
  const current = getGuestProgress()
  const without = current.filter((item) => progressKey(item) !== key)
  const next: ReadingProgressRecord = {
    id: `local:${key}`,
    contentType: identity.contentType,
    contentId: identity.contentId || null,
    contentSlug: identity.contentSlug || null,
    collectionSlug: identity.collectionSlug || null,
    sectionSlug: identity.sectionSlug || null,
    title: identity.title || null,
    route: identity.route || null,
    positionPercent: identity.positionPercent ?? null,
    scrollOffset: identity.scrollOffset ?? null,
    updatedAt: new Date().toISOString(),
    source: 'local',
  }
  writeJson(PROGRESS_KEY, [next, ...without].slice(0, 40))
  return next
}

export function clearGuestFavorites() {
  writeJson(FAVORITES_KEY, [])
}

export function clearGuestProgress() {
  writeJson(PROGRESS_KEY, [])
}

export function recordGuestRecentViewed(input: {
  contentType: UserContentType
  contentSlug: string
  title: string
  route: string
}) {
  const contentSlug = input.contentSlug.trim()
  const route = input.route.trim()
  if (!contentSlug || !route) return
  const current = readJson<RecentViewedItem[]>(RECENT_VIEWED_KEY, [])
  const next: RecentViewedItem[] = [
    {
      contentType: input.contentType,
      contentSlug,
      title: input.title.trim() || contentSlug,
      route,
      at: Date.now(),
    },
    ...current.filter(
      (item) => !(item.contentType === input.contentType && item.contentSlug === contentSlug),
    ),
  ].slice(0, 16)
  writeJson(RECENT_VIEWED_KEY, next)

  // Keep legacy mezmur list in sync for existing Account Activity UI.
  if (input.contentType === 'mezmur') {
    const mezmur = readJson<Array<{ slug: string; title: string; at: number }>>(
      RECENT_MEZMUR_KEY,
      [],
    )
    writeJson(
      RECENT_MEZMUR_KEY,
      [
        { slug: contentSlug, title: input.title.trim() || contentSlug, at: Date.now() },
        ...mezmur.filter((item) => item.slug !== contentSlug),
      ].slice(0, 8),
    )
  }
}

export function getGuestRecentViewed(): RecentViewedItem[] {
  const modern = readJson<RecentViewedItem[]>(RECENT_VIEWED_KEY, [])
  if (modern.length) return modern
  // Migrate legacy mezmur-only list once.
  const legacy = readJson<Array<{ slug: string; title: string; at: number }>>(
    RECENT_MEZMUR_KEY,
    [],
  )
  if (!legacy.length) return []
  const migrated: RecentViewedItem[] = legacy.map((item) => ({
    contentType: 'mezmur' as const,
    contentSlug: item.slug,
    title: item.title || item.slug,
    route: `/practice/mezmur/${item.slug}`,
    at: item.at || Date.now(),
  }))
  writeJson(RECENT_VIEWED_KEY, migrated)
  return migrated
}

/** @deprecated Prefer recordGuestRecentViewed — kept for existing call sites. */
export function recordGuestRecentMezmur(slug: string, title: string) {
  recordGuestRecentViewed({
    contentType: 'mezmur',
    contentSlug: slug,
    title,
    route: `/practice/mezmur/${slug}`,
  })
}

export function getGuestRecentMezmur() {
  return getGuestRecentViewed()
    .filter((item) => item.contentType === 'mezmur')
    .map((item) => ({ slug: item.contentSlug, title: item.title, at: item.at }))
}

export function hasGuestDataToMerge(): boolean {
  return getGuestFavorites().length > 0 || getGuestProgress().length > 0
}

export function wasMergeOffered(): boolean {
  return Boolean(readJson<boolean | string>(MERGE_OFFERED_KEY, false))
}

export function markMergeOffered() {
  writeJson(MERGE_OFFERED_KEY, true)
}

export function clearMergeOffered() {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.removeItem(MERGE_OFFERED_KEY)
  } catch {
    /* ignore */
  }
}
