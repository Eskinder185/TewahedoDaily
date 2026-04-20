import { useEffect, useLayoutEffect, useRef } from 'react'
import { useLocation, useNavigationType } from 'react-router-dom'
import {
  scrollToTop,
  forceScrollToTopOnMobile,
  scrollTargetIntoView,
  scrollToLocationHash,
  scrollWindowToTopInstant,
} from '../lib/scrollUtils'

/**
 * Route-level scroll restoration for React Router 7 (`BrowserRouter` + {@link Routes}).
 *
 * - **PUSH / REPLACE**: When `pathname` or `search` changes, scroll to top immediately (layout phase)
 *   and again after paint so `React.lazy` + `Suspense` pages still open at the top once real content mounts.
 *   If the new URL has a `#fragment`, a short deferred scroll brings that element into view after lazy chunks load.
 * - **POP** (browser back/forward): Leaves scroll alone so history restoration can work.
 * - **Hash-only** (same pathname + search): Scrolls to the hash target when it exists; otherwise top.
 */
export function useScrollToTopOnRouteChange() {
  const location = useLocation()
  const navigationType = useNavigationType()

  const pathKey = `${location.pathname}${location.search}`
  const fullKey = `${pathKey}${location.hash}`

  const prevPathKeyRef = useRef<string | null>(null)
  const prevFullKeyRef = useRef<string | null>(null)

  useLayoutEffect(() => {
    if (navigationType === 'POP') {
      prevPathKeyRef.current = pathKey
      prevFullKeyRef.current = fullKey
      return
    }

    const prevPath = prevPathKeyRef.current
    const prevFull = prevFullKeyRef.current

    const pathChanged = prevPath === null || prevPath !== pathKey
    const hashOnly = !pathChanged && prevFull !== fullKey

    prevPathKeyRef.current = pathKey
    prevFullKeyRef.current = fullKey

    if (pathChanged) {
      scrollWindowToTopInstant()
      return
    }

    if (hashOnly && location.hash) {
      scrollToLocationHash(location.hash, { smooth: true })
    }
  }, [pathKey, fullKey, location.hash, navigationType])

  useEffect(() => {
    if (navigationType === 'POP') return

    scrollWindowToTopInstant()

    // Read from window so this effect does not re-run on hash-only updates (those are handled above).
    const h = window.location.hash
    if (!h || h === '#') return

    const timer = window.setTimeout(() => {
      scrollToLocationHash(h, { smooth: true })
    }, 160)

    return () => window.clearTimeout(timer)
  }, [pathKey, navigationType])
}

/**
 * Hook for manual scroll to top (e.g., on prayer selection)
 */
export function useScrollToTop() {
  return {
    scrollToTop: (behavior: 'smooth' | 'instant' = 'smooth') => {
      scrollToTop({ behavior })
    },
    scrollToTopMobile: () => {
      forceScrollToTopOnMobile()
      scrollToTop({ behavior: 'instant' })
    },
    scrollToElement: (selector: string, behavior: 'smooth' | 'instant' = 'smooth') => {
      scrollTargetIntoView(selector, {
        smooth: behavior === 'smooth',
      })
    },
  }
}
