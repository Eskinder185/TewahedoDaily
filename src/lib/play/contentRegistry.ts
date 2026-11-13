/**
 * The single place that says how much playable content each game has, and in which unit.
 *
 * Numbers come from `generated/counts.json`, which scripts/play/build-published-bank.ts derives from the content that
 * actually ships (built-in items plus the validated generated bank, merged by stable id). Nothing here is typed by
 * hand, and `npm run test:play-bank` fails when the file is stale or disagrees with the live modules.
 *
 * Review status is separate from validation: generated items passed automated checks (schema, Bible grounding,
 * duplicate removal) and are awaiting human review; built-in items keep their existing review metadata.
 */
import type { AppLocale } from '../i18n/locale'
import rawCounts from './generated/counts.json'

export type ContentUnit = 'questions' | 'clues' | 'excerpts' | 'cards' | 'pairs' | 'chains' | 'stories' | 'images'
export type GameCounts = {
  unit: ContentUnit
  builtIn: number
  generated: number
  total: number
  levels?: Record<string, number>
  categories?: Record<string, number>
  /** Chains only: events across all chains, and the built-in share. */
  events?: number
  builtInEvents?: number
  /** Adventures only. */
  scenes?: number
  /** History only. */
  timelineEvents?: number
}

export const CONTENT_COUNTS = rawCounts as unknown as Record<string, GameCounts>

/** Hub ids and route ids differ for two games (`mezmur`, `adventure`); every lookup goes through here. */
export function registryId(gameId: string): string {
  if (gameId === 'mezmur' || gameId === 'finish-the-mezmur') return 'finish-the-mezmur'
  if (gameId === 'adventure') return 'adventures'
  if (gameId === 'timeline') return 'bible-timeline'
  return gameId
}

export const countsFor = (gameId: string): GameCounts | null => CONTENT_COUNTS[registryId(gameId)] ?? null

const UNIT_LABEL: Record<string, Record<AppLocale, [string, string]>> = {
  questions: { en: ['question', 'questions'], am: ['ጥያቄ', 'ጥያቄዎች'] },
  clues: { en: ['clue', 'clues'], am: ['ፍንጭ', 'ፍንጮች'] },
  excerpts: { en: ['excerpt', 'excerpts'], am: ['ጥቅስ', 'ጥቅሶች'] },
  cards: { en: ['card', 'cards'], am: ['ካርድ', 'ካርዶች'] },
  pairs: { en: ['pair', 'pairs'], am: ['ጥንድ', 'ጥንዶች'] },
  chains: { en: ['timeline', 'timelines'], am: ['የጊዜ መስመር', 'የጊዜ መስመሮች'] },
  events: { en: ['event', 'events'], am: ['ክስተት', 'ክስተቶች'] },
  timelineEvents: { en: ['timeline event', 'timeline events'], am: ['የጊዜ መስመር ክስተት', 'የጊዜ መስመር ክስተቶች'] },
  stories: { en: ['story', 'stories'], am: ['ታሪክ', 'ታሪኮች'] },
  images: { en: ['picture', 'pictures'], am: ['ሥዕል', 'ሥዕሎች'] },
}
const LEVEL_LABEL: Record<AppLocale, Record<string, string>> = {
  en: { beginner: 'beginner', growing: 'growing', challenge: 'challenge' },
  am: { beginner: 'ጀማሪ', growing: 'እያደገ', challenge: 'ፈታኝ' },
}

export function unitLabel(unit: string, count: number, locale: AppLocale): string {
  const pair = (UNIT_LABEL[unit] ?? UNIT_LABEL.questions)[locale]
  return count === 1 ? pair[0] : pair[1]
}
const phrase = (count: number, unit: string, locale: AppLocale) => `${count.toLocaleString(locale === 'am' ? 'am-ET' : 'en-US')} ${unitLabel(unit, count, locale)}`

/**
 * What a game card says about its content: always the right unit (a picture count is never called a question count),
 * with the secondary line carrying levels or the other unit (events, scenes).
 */
export function describeContent(gameId: string, locale: AppLocale): { primary: string; secondary?: string } | null {
  const counts = countsFor(gameId)
  if (registryId(gameId) === 'finish-the-mezmur') return { primary: locale === 'am' ? 'ከታተሙ መዝሙሮች ግጥም የተሠራ' : 'Built from published hymn lyrics' }
  if (!counts) return null
  const primary = phrase(counts.total, counts.unit, locale)
  if (counts.unit === 'chains' && typeof counts.events === 'number') return { primary: `${primary} · ${phrase(counts.events, 'events', locale)}` }
  if (counts.unit === 'stories' && counts.scenes) return { primary, secondary: locale === 'am' ? `${counts.scenes} ትዕይንቶች (በታሪክ 3)` : `${counts.scenes} scenes (3 per story)` }
  if (typeof counts.timelineEvents === 'number') return { primary: `${primary} · ${phrase(counts.timelineEvents, 'timelineEvents', locale)}`, secondary: levelLine(counts, locale) }
  return { primary, secondary: levelLine(counts, locale) }
}

function levelLine(counts: GameCounts, locale: AppLocale): string | undefined {
  if (!counts.levels) return undefined
  return ['beginner', 'growing', 'challenge'].filter((level) => counts.levels![level]).map((level) => `${counts.levels![level]} ${LEVEL_LABEL[locale][level]}`).join(' · ')
}

/** Items that passed automated checks but are awaiting human review (every generated item). */
export const unreviewedGeneratedCount = (gameId: string): number => countsFor(gameId)?.generated ?? 0

/** Quiz and card items per unit, never mixed: used for honest aggregate text. */
export function totalsByUnit(): Record<string, number> {
  const out: Record<string, number> = {}
  for (const counts of Object.values(CONTENT_COUNTS)) out[counts.unit] = (out[counts.unit] ?? 0) + counts.total
  return out
}

/** Played-before summary for a hub card, from the existing completion history (best score as a share of the maximum). */
export function progressSummary(history: readonly { game: string; score: number; maxScore: number }[], gameId: string): { plays: number; bestPercent: number } | null {
  const id = registryId(gameId)
  const entries = history.filter((entry) => registryId(entry.game) === id)
  if (!entries.length) return null
  return { plays: entries.length, bestPercent: Math.round(Math.max(...entries.map((entry) => (entry.maxScore > 0 ? entry.score / entry.maxScore : 0))) * 100) }
}
