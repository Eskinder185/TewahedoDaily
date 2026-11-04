/**
 * Local, UNPUBLISHED proposals for how each Faith Challenges game appears on the public hub.
 *
 * The public hub reads src/lib/play/gameCatalog.ts. There is no verified database table or public adapter for
 * these settings yet (see docs/ai/proposed-migrations/20261104_play_game_settings_proposal.md), so saving here
 * only stores a browser-local draft scoped to the signed-in staff user. It never changes the deployed website.
 */
import { GAME_ART } from './imageCatalog'
import { HUB_GAMES, type CatalogGame } from './gameCatalog'

export type Pair = { en: string; am: string }
export type GameLevel = 'beginner' | 'growing' | 'challenge'
export const GAME_LEVELS: readonly GameLevel[] = ['beginner', 'growing', 'challenge']
export type GameSettingsDraft = {
  id: string
  title: Pair
  description: Pair
  meta: Pair
  /** No public instructions field exists yet; a proposal only. */
  instructions: Pair
  /** Key into the existing GAME_ART media catalog. */
  thumbnail: string
  order: number
  featured: boolean
  enabled: boolean
  levels: GameLevel[]
}
export type SettingsEnvelope = { version: 1; updatedAt: string; games: Record<string, GameSettingsDraft> }

export const THUMBNAIL_KEYS = Object.keys(GAME_ART)
const KEY = (owner: string) => `tewahedo-play-game-settings:v1:${owner}`
const LIMITS = { title: 120, description: 400, meta: 80, instructions: 2000 }

export function thumbnailKeyFor(game: CatalogGame): string {
  return THUMBNAIL_KEYS.find(key => GAME_ART[key] === game.art) || 'trivia'
}
export function defaultSettings(game: CatalogGame, index: number): GameSettingsDraft {
  return {
    id: game.id,
    title: { en: game.title.en, am: game.title.am },
    description: { en: game.description.en, am: game.description.am },
    meta: { en: game.meta?.en || '', am: game.meta?.am || '' },
    instructions: { en: '', am: '' },
    thumbnail: thumbnailKeyFor(game),
    order: index + 1,
    featured: false,
    enabled: true,
    levels: game.levels ? [...GAME_LEVELS] : [],
  }
}
export const publicDefaults = (): GameSettingsDraft[] => HUB_GAMES.map(defaultSettings)

const same = (a: unknown, b: unknown) => JSON.stringify(a) === JSON.stringify(b)
/** True when the proposal differs from what the public hub shows today. */
export function differsFromPublic(draft: GameSettingsDraft): boolean {
  const index = HUB_GAMES.findIndex(game => game.id === draft.id)
  return index >= 0 && !same(draft, defaultSettings(HUB_GAMES[index], index))
}

/** Validation for one proposal inside the whole set (order must stay unique; one game must stay enabled). */
export function validateSettings(draft: GameSettingsDraft, all: GameSettingsDraft[]): string[] {
  const errors: string[] = []
  const game = HUB_GAMES.find(entry => entry.id === draft.id)
  if (!game) return ['Unknown game.']
  for (const [field, limit] of Object.entries(LIMITS) as Array<[keyof typeof LIMITS, number]>) {
    for (const language of ['en', 'am'] as const) {
      const value = draft[field][language]
      if (typeof value !== 'string' || value.length > limit) errors.push(`${field} (${language}) must be text of at most ${limit} characters.`)
    }
  }
  if (!draft.title.en.trim()) errors.push('English title is required.')
  if (!draft.description.en.trim()) errors.push('English description is required.')
  if (!draft.title.am.trim() || !draft.description.am.trim()) errors.push('Amharic title and description should be reviewed before this proposal is used (shown as a warning on the public hub otherwise).')
  if (!Number.isInteger(draft.order) || draft.order < 1 || draft.order > 99) errors.push('Display order must be a whole number from 1 to 99.')
  else if (all.some(other => other.id !== draft.id && other.order === draft.order)) errors.push(`Display order ${draft.order} is already used by another game.`)
  if (draft.thumbnail !== '' && !THUMBNAIL_KEYS.includes(draft.thumbnail)) errors.push('Choose a thumbnail from the existing artwork catalog.')
  if (!Array.isArray(draft.levels) || draft.levels.some(level => !GAME_LEVELS.includes(level))) errors.push('Unknown difficulty level.')
  else if (!game.levels && draft.levels.length) errors.push('This game has no difficulty levels in gameplay; leave all unchecked.')
  else if (game.levels && !draft.levels.length) errors.push('Keep at least one difficulty available.')
  if (all.every(other => (other.id === draft.id ? !draft.enabled : !other.enabled))) errors.push('At least one game must stay enabled.')
  return errors
}

function parse(raw: string | null): SettingsEnvelope | null {
  if (!raw) return null
  const value = JSON.parse(raw) as SettingsEnvelope
  if (!value || value.version !== 1 || typeof value.games !== 'object' || value.games === null) throw new Error('Saved game settings were not readable.')
  return value
}

export function settingsStorage(storage: Pick<Storage, 'getItem' | 'setItem' | 'removeItem'>, owner: string, role: string) {
  const staff = ['editor', 'admin', 'super_admin'].includes(role)
  const guard = () => { if (!staff || !owner) throw new Error('Staff access is required for game settings.') }
  return {
    /** Effective proposals: saved values over the public defaults. Corrupt storage is reported, not overwritten. */
    load(): { games: GameSettingsDraft[]; saved: Set<string>; corrupt: boolean } {
      guard()
      let envelope: SettingsEnvelope | null = null
      let corrupt = false
      try { envelope = parse(storage.getItem(KEY(owner))) } catch { corrupt = true }
      const defaults = publicDefaults()
      const saved = new Set<string>()
      const games = defaults.map(base => {
        const stored = envelope?.games[base.id]
        if (!stored || stored.id !== base.id) return base
        saved.add(base.id)
        return { ...base, ...stored, title: { ...base.title, ...stored.title }, description: { ...base.description, ...stored.description },
          meta: { ...base.meta, ...stored.meta }, instructions: { ...base.instructions, ...stored.instructions } }
      })
      return { games, saved, corrupt }
    },
    save(draft: GameSettingsDraft) {
      guard()
      const current = this.load()
      if (current.corrupt) throw new Error('Saved game settings are unreadable; export or clear them before saving.')
      const next = current.games.map(game => (game.id === draft.id ? draft : game))
      const errors = validateSettings(draft, next)
      if (errors.length) throw new Error(errors.join(' '))
      const envelope: SettingsEnvelope = { version: 1, updatedAt: new Date().toISOString(), games: {} }
      for (const game of next) if (differsFromPublic(game)) envelope.games[game.id] = game
      const raw = JSON.stringify(envelope)
      if (raw.length > 200000) throw new Error('Game settings exceed the local storage limit.')
      storage.setItem(KEY(owner), raw)
      const reopened = this.load()
      if (reopened.corrupt || !same(reopened.games.find(game => game.id === draft.id), draft)) throw new Error('The saved settings could not be reopened.')
    },
    /** Drop one game's saved proposal so it shows the public values again. */
    reset(id: string) {
      guard()
      if (!HUB_GAMES.some(game => game.id === id)) throw new Error('Unknown game.')
      const current = this.load()
      if (current.corrupt) throw new Error('Saved game settings are unreadable; clear them before resetting.')
      const envelope: SettingsEnvelope = { version: 1, updatedAt: new Date().toISOString(), games: {} }
      for (const game of current.games) if (game.id !== id && differsFromPublic(game)) envelope.games[game.id] = game
      storage.setItem(KEY(owner), JSON.stringify(envelope))
    },
    clear() { guard(); storage.removeItem(KEY(owner)) },
  }
}

export function exportSettings(games: GameSettingsDraft[]): string {
  return JSON.stringify({ version: 1, kind: 'faith-challenges-game-settings-proposal', note: 'Unpublished proposal. The public hub does not read this file.',
    games: games.filter(differsFromPublic) }, null, 2)
}
