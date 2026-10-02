/** localStorage helpers for guest favorites and reading progress. */

import type {
  FavoriteIdentity,
  FavoriteRecord,
  ProgressIdentity,
  ReadingProgressRecord,
} from './types'
import { favoriteKey, progressKey } from './types'

const FAVORITES_KEY = 'td-guest-favorites-v1'
const PROGRESS_KEY = 'td-guest-progress-v1'
const RECENT_MEZMUR_KEY = 'td-guest-recent-mezmur-v1'
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
  return readJson<FavoriteRecord[]>(FAVORITES_KEY, [])
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

export function recordGuestRecentMezmur(slug: string, title: string) {
  if (!slug) return
  const current = readJson<Array<{ slug: string; title: string; at: number }>>(RECENT_MEZMUR_KEY, [])
  const next = [{ slug, title, at: Date.now() }, ...current.filter((item) => item.slug !== slug)].slice(
    0,
    8,
  )
  writeJson(RECENT_MEZMUR_KEY, next)
}

export function getGuestRecentMezmur() {
  return readJson<Array<{ slug: string; title: string; at: number }>>(RECENT_MEZMUR_KEY, [])
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
