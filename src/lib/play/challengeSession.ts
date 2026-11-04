import { selectUnseen, type Seen } from './questionHistory'
import type { PlayDifficulty } from './types'

/** Selection metadata, not a new question schema or authorization boundary.
 * Only trusted content adapters may mark a candidate reviewed and published.
 * Multiplayer must apply equivalent rules server-side before this is enabled.
 */
export type ChallengeCandidate = {
  questionId: string
  contentId: string
  subjectId?: string
  sourceId?: string
  equivalentIds?: readonly string[]
  mechanic: 'choices' | 'timeline' | 'memory' | 'clues' | 'emoji' | 'match' | 'words' | 'story'
  topic: string
  difficulty: PlayDifficulty
  status: string
  reviewed: boolean
}
type Options = {
  count: number
  difficulty: PlayDifficulty
  topics?: readonly string[]
  used?: readonly ChallengeCandidate[]
  seen?: Seen
  random?: () => number
}
const identities = (item: ChallengeCandidate) => [item.questionId, item.contentId, ...(item.equivalentIds || [])]
const sameSubject = (a: ChallengeCandidate, b: ChallengeCandidate) => !!(
  (a.subjectId && a.subjectId === b.subjectId) || (a.sourceId && a.sourceId === b.sourceId))

/** Bounded, deterministic with an injected RNG; never invents or repeats content. */
export function selectChallengeSession(candidates: readonly ChallengeCandidate[], options: Options) {
  if (!Number.isInteger(options.count) || options.count < 1 || options.count > 20) throw new Error('Choose between 1 and 20 challenges.')
  const used = [...(options.used || [])]
  const picked: ChallengeCandidate[] = []
  const usedIds = new Set(used.flatMap(identities))
  const seen = options.seen || { has: () => false }
  const warnings = new Set<string>()
  // Reuse the existing ID deduplication and seen-history preference.
  const eligible = candidates.filter(item => item.status === 'published' && item.reviewed && item.questionId.trim() && item.contentId.trim()
    && item.difficulty === options.difficulty && (!options.topics?.length || options.topics.includes(item.topic)))
  let pool = selectUnseen([...eligible], item => item.questionId, seen, eligible.length, options.random).picked
  while (picked.length < options.count) {
    pool = pool.filter(item => !identities(item).some(id => usedIds.has(id)))
    if (!pool.length) break
    const previous = used.at(-1)
    const topicCounts = new Map<string, number>()
    for (const item of used) topicCounts.set(item.topic, (topicCounts.get(item.topic) || 0) + 1)
    // Subject and mechanic variety precede topic balancing; seen content is a
    // final preference so fresh variants cannot dominate the same subject.
    const rank = (item: ChallengeCandidate) => [
      previous && sameSubject(previous, item) ? 1 : 0,
      previous?.mechanic === item.mechanic ? 1 : 0,
      topicCounts.get(item.topic) || 0,
      seen.has(item.questionId) ? 1 : 0,
    ]
    pool.sort((a, b) => {
      const left = rank(a), right = rank(b)
      for (let i = 0; i < left.length; i++) if (left[i] !== right[i]) return left[i] - right[i]
      return 0
    })
    const next = pool[0]
    if (previous && sameSubject(previous, next)) warnings.add('Not enough distinct subjects to avoid consecutive related challenges.')
    if (previous?.mechanic === next.mechanic) warnings.add('Not enough approved mechanics to vary every consecutive round.')
    picked.push(next); used.push(next)
    for (const id of identities(next)) usedIds.add(id)
  }
  const shortage = options.count - picked.length
  if (shortage) warnings.add(`Insufficient reviewed published content: ${picked.length} of ${options.count} challenges available.`)
  return { picked, shortage, warnings: [...warnings] }
}
