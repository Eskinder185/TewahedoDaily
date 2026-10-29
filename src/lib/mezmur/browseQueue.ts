/**
 * Mezmur browse queue — the ordered list a visitor opened a Mezmur from
 * (a category, sub-collection, occasion, Zemari or search results), so the
 * Mezmur page can offer Previous / Next / Shuffle / Repeat within that list.
 *
 * Stored per tab (sessionStorage); playback preferences persist (localStorage).
 * Browser storage can be unavailable, so every access is guarded.
 */
import { fisherYates } from './playerQueue'

export type RepeatSetting = 'off' | 'all' | 'one'

export type BrowseQueueItem = {
  slug: string
  title: string
  /** Has an embeddable YouTube recording. */
  hasVideo: boolean
  /** Has a direct audio recording. */
  hasAudio: boolean
}

export type BrowseQueue = {
  label: string
  href: string
  items: BrowseQueueItem[]
  /** Play order as slugs (equals items order unless shuffled). */
  order: string[]
  /**
   * Listening history for this list: slugs in the order they were first
   * opened. Shuffle keeps this prefix so Previous walks back through what was
   * actually heard and Next never returns to an already-played Mezmur.
   */
  history?: string[]
}

export type QueuePrefs = { shuffle: boolean; repeat: RepeatSetting; autoplay: boolean }

const QUEUE_KEY = 'td.mezmurBrowseQueue.v1'
const PREFS_KEY = 'td.mezmurQueuePrefs.v1'
const AUTOPLAY_KEY = 'td.mezmurAutoplaySlug.v1'
const MAX_ITEMS = 2500

function read<T>(storage: () => Storage, key: string): T | null {
  try {
    const raw = storage().getItem(key)
    return raw ? (JSON.parse(raw) as T) : null
  } catch {
    return null
  }
}

function write(storage: () => Storage, key: string, value: unknown) {
  try {
    if (value === null) storage().removeItem(key)
    else storage().setItem(key, JSON.stringify(value))
  } catch {
    /* storage unavailable (private mode, quota) — controls simply stay disabled */
  }
}

const session = () => window.sessionStorage
const local = () => window.localStorage

export function readQueuePrefs(): QueuePrefs {
  const p = read<Partial<QueuePrefs>>(local, PREFS_KEY) || {}
  return {
    shuffle: p.shuffle === true,
    repeat: p.repeat === 'all' || p.repeat === 'one' ? p.repeat : 'off',
    autoplay: p.autoplay !== false,
  }
}

export function writeQueuePrefs(prefs: QueuePrefs) {
  write(local, PREFS_KEY, prefs)
}

export const isPlayable = (item: BrowseQueueItem) => item.hasVideo || item.hasAudio

/**
 * Shuffled play order. `played` (the listening history, or just the Mezmur
 * being opened) stays first in the order it was heard; only the Mezmurs not
 * yet played are randomised after it.
 */
export function shuffledOrder(items: BrowseQueueItem[], played?: string | string[], random: () => number = Math.random): string[] {
  const known = new Set(items.map((i) => i.slug))
  const prefix: string[] = []
  for (const slug of typeof played === 'string' ? [played] : played ?? []) {
    if (known.has(slug) && !prefix.includes(slug)) prefix.push(slug)
  }
  const rest = items.map((i) => i.slug).filter((s) => !prefix.includes(s))
  return [...prefix, ...fisherYates(rest, random)]
}

/** Natural (collection) order. */
export const naturalOrder = (q: BrowseQueue) => q.items.map((i) => i.slug)

/** Add `slug` to the listening history (no-op if already there or not in the list). */
export function withPlayed(q: BrowseQueue, slug: string): BrowseQueue {
  const history = q.history ?? []
  if (history.includes(slug) || !q.items.some((i) => i.slug === slug)) return q
  return { ...q, history: [...history, slug] }
}

/** Turn shuffle on (history kept, the rest randomised) or off (collection order). */
export function reorder(q: BrowseQueue, shuffle: boolean, currentSlug: string, random: () => number = Math.random): BrowseQueue {
  const played = withPlayed(q, currentSlug).history ?? [currentSlug]
  return { ...q, history: played, order: shuffle ? shuffledOrder(q.items, played, random) : naturalOrder(q) }
}

/** Record the list a Mezmur was opened from. Call from the card's onClick. */
export function rememberBrowseQueue(label: string, href: string, items: BrowseQueueItem[], openedSlug?: string) {
  const seen = new Set<string>()
  const clean = items
    .filter((i) => i.slug && !seen.has(i.slug) && seen.add(i.slug))
    .slice(0, MAX_ITEMS)
  if (!clean.length) return
  const prefs = readQueuePrefs()
  const order = prefs.shuffle ? shuffledOrder(clean, openedSlug) : clean.map((i) => i.slug)
  const history = openedSlug && clean.some((i) => i.slug === openedSlug) ? [openedSlug] : []
  write(session, QUEUE_KEY, { label: label.replace(/\s+/g, ' ').trim(), href, items: clean, order, history } satisfies BrowseQueue)
}

export function readBrowseQueue(): BrowseQueue | null {
  const q = read<BrowseQueue>(session, QUEUE_KEY)
  if (!q || !Array.isArray(q.items) || !Array.isArray(q.order)) return null
  return q
}

export function saveBrowseQueue(q: BrowseQueue) {
  write(session, QUEUE_KEY, q)
}

/**
 * The neighbouring playable Mezmur in play order. Items with neither a video
 * nor an audio recording are skipped. With repeat 'all' the order wraps.
 */
export function neighbour(q: BrowseQueue, currentSlug: string, direction: 1 | -1, repeat: RepeatSetting): string | null {
  const bySlug = new Map(q.items.map((i) => [i.slug, i]))
  const n = q.order.length
  const start = q.order.indexOf(currentSlug)
  if (start < 0 || n < 2) return null
  for (let step = 1; step < n; step++) {
    let idx = start + direction * step
    if (idx < 0 || idx >= n) {
      if (repeat !== 'all') return null
      idx = (idx + n) % n
    }
    const item = bySlug.get(q.order[idx])
    if (item && isPlayable(item)) return item.slug
  }
  return null
}

/** One-shot flag: the next Mezmur page should start playing on its own. */
export function markAutoplay(slug: string) {
  write(session, AUTOPLAY_KEY, { slug, at: Date.now() })
}

export function consumeAutoplay(slug: string): boolean {
  const v = read<{ slug: string; at: number }>(session, AUTOPLAY_KEY)
  if (!v) return false
  write(session, AUTOPLAY_KEY, null)
  return v.slug === slug && Date.now() - v.at < 60_000
}

const SHEET_KEY = 'td.mezmurSheetOpen.v1'

/** One-shot flag: keep the expanded player open on the next Mezmur page. */
export function markSheetOpen(slug: string) {
  write(session, SHEET_KEY, { slug, at: Date.now() })
}

export function consumeSheetOpen(slug: string): boolean {
  const v = read<{ slug: string; at: number }>(session, SHEET_KEY)
  if (!v) return false
  write(session, SHEET_KEY, null)
  return v.slug === slug && Date.now() - v.at < 60_000
}

export function queueItem(slug: string, title: string, youtubeUrl?: string | null, audioUrl?: string | null): BrowseQueueItem {
  return { slug, title, hasVideo: Boolean(youtubeUrl?.trim()), hasAudio: Boolean(audioUrl?.trim()) }
}
