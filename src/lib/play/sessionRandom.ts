/** Unbiased shuffling and answer-position randomisation. Answer identity is the option `key`, never its position. */
export type Rng = () => number

/** Fisher–Yates; returns a new array and never mutates the input. */
export function shuffled<T>(items: readonly T[], random: Rng = Math.random): T[] {
  const out = [...items]
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1))
    ;[out[i], out[j]] = [out[j], out[i]]
  }
  return out
}

/** A copy of the question with options in a fresh random order; `correctKey` and option keys are untouched. */
export function withShuffledOptions<T extends { options: Array<{ key: string }> }>(question: T, random: Rng = Math.random): T {
  return { ...question, options: shuffled(question.options, random) }
}

/** Re-apply a previously chosen option order (by key); unknown keys are ignored and missing keys appended. */
export function withOptionOrder<T extends { options: Array<{ key: string }> }>(question: T, order: readonly string[]): T {
  const byKey = new Map(question.options.map((option) => [option.key, option]))
  const ordered = order.flatMap((key) => (byKey.has(key) ? [byKey.get(key)!] : []))
  const rest = question.options.filter((option) => !order.includes(option.key))
  return { ...question, options: [...ordered, ...rest] }
}

/** Small seeded generator (mulberry32) so hosted rooms can give every player the same round. */
export function seededRandom(seed: number): Rng {
  let a = seed >>> 0
  return () => {
    a = (a + 0x6d2b79f5) >>> 0
    let t = a
    t = Math.imul(t ^ (t >>> 15), t | 1)
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61)
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}
export const newSeed = () => Math.floor(Math.random() * 0xffffffff)
