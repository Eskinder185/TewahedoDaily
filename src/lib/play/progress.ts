import type { PlayGameType } from './types'

export const PLAY_PROGRESS_STORAGE_KEY = 'tewahedo-play-progress-v1'
export const PLAY_PROGRESS_EVENT = 'tewahedo-play-progress'

export type PlayHistoryEntry = {
  id: string
  game: string
  score: number
  maxScore: number
  xpEarned: number
  completedAt: string
}

export type PlayAchievement = 'first-steps' | 'perfect-round' | 'curious-explorer' | 'three-day-streak'

export type PlayProgress = {
  xp: number
  streak: number
  lastPlayedDate: string | null
  achievements: PlayAchievement[]
  categoryMastery: Record<string, { correct: number; total: number }>
  personalBests: Record<string, number>
  history: PlayHistoryEntry[]
}

export const EMPTY_PLAY_PROGRESS: PlayProgress = {
  xp: 0,
  streak: 0,
  lastPlayedDate: null,
  achievements: [],
  categoryMastery: {},
  personalBests: {},
  history: [],
}

function todayKey(date = new Date()) {
  return date.toISOString().slice(0, 10)
}

function previousDayKey(currentDate: Date) {
  const date = new Date(currentDate)
  date.setUTCDate(date.getUTCDate() - 1)
  return todayKey(date)
}

export function readPlayProgress(): PlayProgress {
  if (typeof window === 'undefined') return EMPTY_PLAY_PROGRESS
  try {
    const parsed = JSON.parse(window.localStorage.getItem(PLAY_PROGRESS_STORAGE_KEY) || '') as Partial<PlayProgress>
    return {
      ...EMPTY_PLAY_PROGRESS,
      ...parsed,
      achievements: Array.isArray(parsed.achievements) ? parsed.achievements : [],
      history: Array.isArray(parsed.history) ? parsed.history : [],
      categoryMastery: parsed.categoryMastery || {},
      personalBests: parsed.personalBests || {},
    }
  } catch {
    return EMPTY_PLAY_PROGRESS
  }
}

export function savePlayProgress(progress: PlayProgress) {
  if (typeof window === 'undefined') return
  window.localStorage.setItem(PLAY_PROGRESS_STORAGE_KEY, JSON.stringify(progress))
  window.dispatchEvent(new CustomEvent(PLAY_PROGRESS_EVENT, { detail: progress }))
}

export type PlayCompletionInput = {
  game: PlayGameType | 'who-am-i' | 'match'
  score: number
  maxScore: number
  category: string
}

export function applyPlayCompletion(current: PlayProgress, input: PlayCompletionInput, completedAt = new Date()) {
  const day = todayKey(completedAt)
  const streak = current.lastPlayedDate === day
    ? current.streak
    : current.lastPlayedDate === previousDayKey(completedAt)
      ? current.streak + 1
      : 1
  const ratio = input.maxScore > 0 ? input.score / input.maxScore : 0
  const xpEarned = 20 + Math.round(Math.max(0, Math.min(1, ratio)) * 80)
  const gamesPlayed = new Set([...current.history.map((entry) => entry.game), input.game])
  const achievements = new Set(current.achievements)
  achievements.add('first-steps')
  if (input.maxScore > 0 && input.score === input.maxScore) achievements.add('perfect-round')
  if (gamesPlayed.size >= 3) achievements.add('curious-explorer')
  if (streak >= 3) achievements.add('three-day-streak')

  const mastery = current.categoryMastery[input.category] || { correct: 0, total: 0 }
  const next: PlayProgress = {
    xp: current.xp + xpEarned,
    streak,
    lastPlayedDate: day,
    achievements: [...achievements],
    categoryMastery: {
      ...current.categoryMastery,
      [input.category]: {
        correct: mastery.correct + input.score,
        total: mastery.total + input.maxScore,
      },
    },
    personalBests: {
      ...current.personalBests,
      [input.game]: Math.max(current.personalBests[input.game] || 0, input.score),
    },
    history: [{
      id: `${input.game}-${completedAt.getTime()}`,
      game: input.game,
      score: input.score,
      maxScore: input.maxScore,
      xpEarned,
      completedAt: completedAt.toISOString(),
    }, ...current.history].slice(0, 50),
  }

  return { progress: next, xpEarned, newAchievements: next.achievements.filter((item) => !current.achievements.includes(item)) }
}

export function recordPlayCompletion(input: PlayCompletionInput) {
  const result = applyPlayCompletion(readPlayProgress(), input)
  savePlayProgress(result.progress)
  return result
}

export function getDailyChallenge() {
  const dayNumber = Math.floor(Date.now() / 86_400_000)
  return { id: `daily-${todayKey()}`, questionIndex: dayNumber % 20 }
}
