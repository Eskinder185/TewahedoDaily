import { useEffect, useLayoutEffect, useRef } from 'react'
import { useLocation, useNavigationType } from 'react-router-dom'
import {
  scrollToTop,
  forceScrollToTopOnMobile,
  scrollTargetIntoView,
  scrollWindowToTopInstant,
} from '../lib/scrollUtils'

const STORAGE_KEY = 'tewahedo.history-scroll.v1'
function readPositions(): Record<string, number> {
  try {
    const value: unknown = JSON.parse(sessionStorage.getItem(STORAGE_KEY) || '{}')
    if (!value || typeof value !== 'object' || Array.isArray(value)) return {}
    return Object.fromEntries(Object.entries(value).filter(([key, y]) =>
      key.length < 100 && typeof y === 'number' && Number.isFinite(y) && y >= 0).slice(-100))
  } catch { return {} } // Storage can be disabled; in-memory restoration still works.
}

/** Entry-keyed restoration, including lazy/async content. No page data is cached.
 * User interaction cancels a pending restoration so it never fights scrolling. */
export function useScrollToTopOnRouteChange() {
  const location = useLocation()
  const navigationType = useNavigationType()
  const positions = useRef<Record<string, number>>(readPositions())

  useEffect(() => {
    const previous = window.history.scrollRestoration
    window.history.scrollRestoration = 'manual'
    return () => { window.history.scrollRestoration = previous }
  }, [])

  useLayoutEffect(() => {
    const saved = positions.current[location.key]
    const target = navigationType === 'POP' ? saved : undefined
    let pending = target !== undefined || Boolean(location.hash)
    let lastY = target ?? 0
    let frame = 0
    const persist = () => {
      positions.current[location.key] = lastY
      positions.current = Object.fromEntries(Object.entries(positions.current).slice(-100))
      try { sessionStorage.setItem(STORAGE_KEY, JSON.stringify(positions.current)) }
      catch { /* Optional persistence; never store private page contents. */ }
    }
    const record = () => { if (!pending) lastY = window.scrollY }
    const stop = () => { pending = false; observer.disconnect(); resize.disconnect() }
    const restore = () => {
      if (!pending) return
      if (target !== undefined) {
        const max = document.documentElement.scrollHeight - window.innerHeight
        window.scrollTo({ top: Math.min(target, Math.max(0, max)), behavior: 'instant' })
        if (max >= target) stop()
      } else if (location.hash) {
        let id = location.hash.slice(1)
        try { id = decodeURIComponent(id) } catch { /* Invalid escapes have no target. */ }
        const element = document.getElementById(id)
        if (element) { element.scrollIntoView({ behavior: 'instant' }); lastY = window.scrollY; stop() }
      }
    }
    const schedule = () => { cancelAnimationFrame(frame); frame = requestAnimationFrame(restore) }
    const observer = new MutationObserver(schedule)
    const resize = new ResizeObserver(schedule)
    const cancel = () => { stop(); lastY = window.scrollY }
    if (pending) {
      observer.observe(document.body, { subtree: true, childList: true })
      resize.observe(document.body)
    }
    if (target === undefined) scrollWindowToTopInstant()
    restore()
    const deadline = window.setTimeout(cancel, 10000) // Bound observers, not navigation readiness.
    window.addEventListener('scroll', record, { passive: true })
    window.addEventListener('pagehide', persist)
    for (const type of ['wheel', 'touchstart', 'pointerdown', 'keydown']) window.addEventListener(type, cancel, { passive: true })
    return () => {
      window.clearTimeout(deadline)
      cancelAnimationFrame(frame)
      observer.disconnect(); resize.disconnect()
      window.removeEventListener('scroll', record)
      window.removeEventListener('pagehide', persist)
      for (const type of ['wheel', 'touchstart', 'pointerdown', 'keydown']) window.removeEventListener(type, cancel)
      persist()
    }
  }, [location.key, location.pathname, location.search, location.hash, navigationType])
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
