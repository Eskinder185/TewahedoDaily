/**
 * Anti-repetition for Tewahedo Play (spec Phase 5).
 *
 * A question carries a stable id. We never repeat an id inside one play
 * session, and across sessions we prefer ids the player has never seen. Seen
 * ids are kept per game in localStorage for guests (and for signed-in users,
 * who additionally sync progress elsewhere); "Practice again" is an explicit
 * opt-in to replay seen questions when fresh ones run low.
 *
 * Browser storage can be unavailable, so every access is guarded and the game
 * still works (falling back to no cross-session memory) if it throws.
 */

const KEY = (game: string) => `td.play.seen.${game}.v1`
const MAX_SEEN = 4000

function read(game: string): Set<string> {
  try {
    const raw = window.localStorage.getItem(KEY(game))
    return new Set(raw ? (JSON.parse(raw) as string[]) : [])
  } catch {
    return new Set()
  }
}

function write(game: string, seen: Set<string>) {
  try {
    const arr = [...seen]
    // Keep the most recent ids if we exceed the cap (drop oldest).
    window.localStorage.setItem(KEY(game), JSON.stringify(arr.slice(-MAX_SEEN)))
  } catch {
    /* storage unavailable — in-memory only for this session */
  }
}

export type Seen = { has: (id: string) => boolean }

/** A read-only view of the ids a player has already answered for this game. */
export function loadSeen(game: string): Seen {
  const set = read(game)
  return { has: (id) => set.has(id) }
}

/** Record that these question ids were answered. */
export function markSeen(game: string, ids: string[]) {
  if (!ids.length) return
  const set = read(game)
  for (const id of ids) set.add(id)
  write(game, set)
}

/** Forget this game's history (the player chose Practice Again from scratch). */
export function resetSeen(game: string) {
  try {
    window.localStorage.removeItem(KEY(game))
  } catch {
    /* ignore */
  }
}

export type SelectResult<T> = {
  /** The chosen items, never repeating within this call. */
  picked: T[]
  /** True when some picked items were already seen (fresh pool was too small). */
  reusedSeen: boolean
  /** True when the whole bank has been seen — the player has exhausted it. */
  exhausted: boolean
}

/**
 * Choose up to `count` items, preferring never-seen ones.
 *
 * `idOf` gives each candidate's stable id. `random` is injectable for tests.
 * Order: all unseen (shuffled) first, then — only if needed — seen ones
 * (shuffled), so a session is filled with fresh questions whenever possible
 * and never repeats an id within the returned list.
 */
export function selectUnseen<T>(
  candidates: T[],
  idOf: (item: T) => string,
  seen: Seen,
  count: number,
  random: () => number = Math.random,
): SelectResult<T> {
  const shuffle = (items: T[]) => {
    const a = [...items]
    for (let i = a.length - 1; i > 0; i--) {
      const j = Math.floor(random() * (i + 1))
      ;[a[i], a[j]] = [a[j], a[i]]
    }
    return a
  }
  // Dedupe candidates by id first (equivalent questions collapse to one).
  const byId = new Map<string, T>()
  for (const item of candidates) if (!byId.has(idOf(item))) byId.set(idOf(item), item)
  const unique = [...byId.values()]
  const fresh = shuffle(unique.filter((item) => !seen.has(idOf(item))))
  const stale = shuffle(unique.filter((item) => seen.has(idOf(item))))
  const picked = [...fresh, ...stale].slice(0, Math.max(0, count))
  return {
    picked,
    reusedSeen: picked.some((item) => seen.has(idOf(item))),
    exhausted: fresh.length === 0 && unique.length > 0,
  }
}
