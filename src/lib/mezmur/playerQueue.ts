import type { PlayableHymn } from './playlistService'

export function sameTrack(a: PlayableHymn | null | undefined, b: PlayableHymn | null | undefined) {
  if (!a || !b) return false
  return a.id === b.id || a.slug === b.slug
}

export function playableQueue(items: PlayableHymn[]): PlayableHymn[] {
  const seen = new Set<string>()
  return items.filter((item) => {
    if (!item.audioUrl?.trim()) return false
    const key = item.id || item.slug
    if (!key || seen.has(key)) return false
    seen.add(key)
    return true
  })
}

export function fisherYates<T>(items: readonly T[], random: () => number = Math.random): T[] {
  const shuffled = [...items]
  for (let index = shuffled.length - 1; index > 0; index--) {
    const target = Math.floor(random() * (index + 1))
    ;[shuffled[index], shuffled[target]] = [shuffled[target], shuffled[index]]
  }
  return shuffled
}

export function shuffledAfterCurrent(
  items: PlayableHymn[],
  current: PlayableHymn,
  random: () => number = Math.random,
): PlayableHymn[] {
  const available = playableQueue(items).filter((item) => !sameTrack(item, current))
  return [current, ...fisherYates(available, random)]
}

export function shuffledCycle(
  items: PlayableHymn[],
  previous: PlayableHymn | null,
  random: () => number = Math.random,
): PlayableHymn[] {
  const cycle = fisherYates(playableQueue(items), random)
  if (previous && cycle.length > 1 && sameTrack(cycle[0], previous)) {
    ;[cycle[0], cycle[1]] = [cycle[1], cycle[0]]
  }
  return cycle
}

export function moveQueueItem<T>(items: readonly T[], from: number, to: number): T[] {
  if (from < 0 || from >= items.length || to < 0 || to >= items.length || from === to) {
    return [...items]
  }
  const result = [...items]
  const [item] = result.splice(from, 1)
  result.splice(to, 0, item)
  return result
}
