import { useCallback, useEffect, useRef } from 'react'
import { useAuth } from '../auth/useAuth'
import { saveReadingProgress } from './readingProgressService'
import type { ProgressIdentity } from './types'

const DEBOUNCE_MS = 4000

/**
 * Debounced reading-progress saver for Pray / Psalm / Liturgy pages.
 * Saves on interval during activity, visibility hide, and unmount.
 */
export function useReadingProgressTracker(identity: ProgressIdentity | null) {
  const { session } = useAuth()
  const userId = session?.user.id
  const latest = useRef(identity)
  const dirty = useRef(false)
  const timer = useRef<number | null>(null)

  latest.current = identity

  const flush = useCallback(() => {
    const current = latest.current
    if (!current || !dirty.current) return
    dirty.current = false
    void saveReadingProgress(userId, current)
  }, [userId])

  const mark = useCallback(
    (patch?: Partial<ProgressIdentity>) => {
      if (!latest.current && !patch) return
      latest.current = { ...(latest.current as ProgressIdentity), ...patch }
      dirty.current = true
      if (timer.current) window.clearTimeout(timer.current)
      timer.current = window.setTimeout(() => flush(), DEBOUNCE_MS)
    },
    [flush],
  )

  useEffect(() => {
    if (!identity) return
    dirty.current = true
    mark()
  }, [identity?.route, identity?.contentSlug, identity?.contentId, mark])

  useEffect(() => {
    const onVis = () => {
      if (document.visibilityState === 'hidden') flush()
    }
    const onPageHide = () => flush()
    window.addEventListener('visibilitychange', onVis)
    window.addEventListener('pagehide', onPageHide)
    return () => {
      window.removeEventListener('visibilitychange', onVis)
      window.removeEventListener('pagehide', onPageHide)
      if (timer.current) window.clearTimeout(timer.current)
      flush()
    }
  }, [flush])

  return { markProgress: mark, flushProgress: flush }
}
