/**
 * Guided practice progress for Learn How to Pray.
 * Guests: localStorage. Authenticated: also mirrors into reading progress.
 */
import { saveReadingProgress } from '../userContent/readingProgressService'

const STORAGE_KEY = 'td-learn-how-to-pray-progress-v1'
const ROUTE = '/pray/learn-how-to-pray'

export type GuidedProgressState = {
  completedSlugs: string[]
  updatedAt: string
}

function readLocal(): GuidedProgressState {
  if (typeof window === 'undefined') return { completedSlugs: [], updatedAt: new Date(0).toISOString() }
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY)
    if (!raw) return { completedSlugs: [], updatedAt: new Date(0).toISOString() }
    const parsed = JSON.parse(raw) as GuidedProgressState
    return {
      completedSlugs: Array.isArray(parsed.completedSlugs)
        ? parsed.completedSlugs.filter((slug) => typeof slug === 'string')
        : [],
      updatedAt: typeof parsed.updatedAt === 'string' ? parsed.updatedAt : new Date().toISOString(),
    }
  } catch {
    return { completedSlugs: [], updatedAt: new Date(0).toISOString() }
  }
}

function writeLocal(state: GuidedProgressState) {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(state))
  } catch {
    /* ignore */
  }
}

async function mirrorReadingProgress(
  userId: string | null | undefined,
  state: GuidedProgressState,
  totalSteps: number,
  guideId?: string | null,
) {
  const percent = totalSteps > 0 ? Math.round((state.completedSlugs.length / totalSteps) * 100) : 0
  await saveReadingProgress(userId, {
    contentType: 'collection',
    contentId: guideId || null,
    contentSlug: 'learn-how-to-pray',
    collectionSlug: 'learn-how-to-pray',
    sectionSlug: state.completedSlugs[state.completedSlugs.length - 1] || null,
    title: 'Learn How to Pray',
    route: ROUTE,
    positionPercent: percent,
  })
}

export function getGuidedProgress(): GuidedProgressState {
  return readLocal()
}

export async function markStepLearned(
  slug: string,
  options: { userId?: string | null; totalSteps: number; guideId?: string | null },
): Promise<GuidedProgressState> {
  const current = readLocal()
  const completedSlugs = current.completedSlugs.includes(slug)
    ? current.completedSlugs
    : [...current.completedSlugs, slug]
  const next = { completedSlugs, updatedAt: new Date().toISOString() }
  writeLocal(next)
  await mirrorReadingProgress(options.userId, next, options.totalSteps, options.guideId)
  return next
}

export async function unmarkStepLearned(
  slug: string,
  options: { userId?: string | null; totalSteps: number; guideId?: string | null },
): Promise<GuidedProgressState> {
  const current = readLocal()
  const next = {
    completedSlugs: current.completedSlugs.filter((item) => item !== slug),
    updatedAt: new Date().toISOString(),
  }
  writeLocal(next)
  await mirrorReadingProgress(options.userId, next, options.totalSteps, options.guideId)
  return next
}

export async function resetGuidedProgress(options: {
  userId?: string | null
  totalSteps: number
  guideId?: string | null
}): Promise<GuidedProgressState> {
  const next = { completedSlugs: [] as string[], updatedAt: new Date().toISOString() }
  writeLocal(next)
  await mirrorReadingProgress(options.userId, next, options.totalSteps, options.guideId)
  return next
}
