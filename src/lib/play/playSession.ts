/**
 * Refresh-safe solo session store. Holds only question IDs, option order, the player's choices and settings,
 * never answers' text or any credential. Entries expire after 6 hours; storage failures are ignored.
 */
export type SavedAnswer = { id: string; selected: string; correct: boolean; points: number }
export type SavedSession = {
  v: 1; game: string; savedAt: number
  ids: string[]; orders: Record<string, string[]>
  index: number; selected: string | null; hints: number
  answers: SavedAnswer[]
  settings: { category: string; difficulty: string; count: number; timed: boolean }
}
const KEY = (game: string) => `td.play.resume.${game}.v1`
const TTL = 6 * 60 * 60 * 1000

export function saveSession(session: Omit<SavedSession, 'v' | 'savedAt'>) {
  try { window.localStorage.setItem(KEY(session.game), JSON.stringify({ ...session, v: 1, savedAt: Date.now() })) } catch { /* in-memory only */ }
}
export function loadSession(game: string, now = Date.now()): SavedSession | null {
  try {
    const raw = window.localStorage.getItem(KEY(game))
    if (!raw) return null
    const value = JSON.parse(raw) as SavedSession
    if (value.v !== 1 || value.game !== game || now - value.savedAt > TTL || !Array.isArray(value.ids) || !value.ids.length) { clearSession(game); return null }
    return value
  } catch { return null }
}
export function clearSession(game: string) { try { window.localStorage.removeItem(KEY(game)) } catch { /* ignore */ } }
/** Games with an unfinished session, for the hub's "Continue" shortcut. */
export function resumableGames(games: readonly string[], now = Date.now()): Array<{ game: string; done: number; total: number }> {
  return games.flatMap((game) => { const s = loadSession(game, now); return s ? [{ game, done: s.answers.length, total: s.ids.length }] : [] })
}
