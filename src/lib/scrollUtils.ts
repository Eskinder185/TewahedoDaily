/**
 * Scroll utility functions for better mobile UX
 */

export interface ScrollToOptions {
  /** Smooth or instant scrolling */
  behavior?: 'smooth' | 'instant' | 'auto'
  /** Delay before scrolling (useful for state updates) */
  delay?: number
  /** Additional offset from top (to account for sticky headers) */
  offset?: number
}

function prefersReducedMotion(): boolean {
  if (typeof window === 'undefined' || !window.matchMedia) return false
  return window.matchMedia('(prefers-reduced-motion: reduce)').matches
}

/**
 * `html { scroll-behavior: smooth }` can make `window.scrollTo({ behavior: 'auto' })` animated.
 * For route changes and reader jumps we need a truly instant scroll.
 */
function withDocumentInstantScroll(run: () => void): void {
  const html = document.documentElement
  const prev = html.style.scrollBehavior
  html.style.scrollBehavior = 'auto'
  try {
    run()
  } finally {
    html.style.scrollBehavior = prev
  }
}

function mapScrollBehavior(
  behavior: ScrollToOptions['behavior'],
): 'smooth' | 'instant' {
  if (behavior === 'smooth') return 'smooth'
  return 'instant'
}

/**
 * Scroll to the top of the page with robust fallback
 */
export function scrollToTop(options: ScrollToOptions = {}) {
  const { delay = 0, offset = 0 } = options
  const mapped = mapScrollBehavior(options.behavior)
  const useSmooth = mapped === 'smooth' && !prefersReducedMotion()

  const doScroll = () => {
    if (useSmooth) {
      try {
        window.scrollTo({
          top: offset,
          left: 0,
          behavior: 'smooth',
        })
      } catch {
        document.documentElement.scrollTop = offset
        document.body.scrollTop = offset
      }
      return
    }

    withDocumentInstantScroll(() => {
      window.scrollTo(0, offset)
      document.documentElement.scrollTop = offset
      document.body.scrollTop = offset
    })
  }

  if (delay > 0) {
    window.setTimeout(doScroll, delay)
  } else {
    doScroll()
  }
}

/**
 * Scroll to a specific element by ID or selector
 */
export function scrollToElement(selector: string, options: ScrollToOptions = {}) {
  const { delay = 0, offset = 0 } = options
  const mapped = mapScrollBehavior(options.behavior)
  const useSmooth = mapped === 'smooth' && !prefersReducedMotion()

  const doScroll = () => {
    const element = document.querySelector(selector)
    if (!element) return

    if (useSmooth) {
      const elementTop = element.getBoundingClientRect().top + window.pageYOffset
      try {
        window.scrollTo({
          top: elementTop - offset,
          left: 0,
          behavior: 'smooth',
        })
      } catch {
        window.scrollTo(0, elementTop - offset)
      }
      return
    }

    withDocumentInstantScroll(() => {
      const elementTop = element.getBoundingClientRect().top + window.pageYOffset
      const top = Math.max(0, elementTop - offset)
      window.scrollTo(0, top)
      document.documentElement.scrollTop = top
      document.body.scrollTop = top
    })
  }

  if (delay > 0) {
    window.setTimeout(doScroll, delay)
  } else {
    doScroll()
  }
}

/**
 * Scroll a target into view, honoring reduced motion and bypassing global smooth scroll when needed.
 * Prefer `scroll-margin-top` on the target for sticky header clearance.
 */
export function scrollTargetIntoView(
  selector: string,
  options: {
    delay?: number
    /** When false, always jump (after paint). Default respects reduced-motion. */
    smooth?: boolean
    block?: ScrollLogicalPosition
    /**
     * When true with `smooth: false`, run the scroll immediately (no double rAF).
     * Use from `useLayoutEffect` when the DOM is already committed (e.g. mobile prayer reader).
     */
    flush?: boolean
  } = {},
) {
  const { delay = 0, smooth, block = 'start', flush } = options
  const useSmooth = smooth !== false && !prefersReducedMotion()

  const run = () => {
    const el = document.querySelector(selector)
    scrollNodeIntoView(el, { useSmooth, block })
  }

  if (delay > 0) {
    window.setTimeout(run, delay)
  } else if (flush && !useSmooth) {
    run()
  } else {
    requestAnimationFrame(() => {
      requestAnimationFrame(run)
    })
  }
}

/** Scroll an element that is already in memory (refs) into view. */
export function scrollElementNodeIntoView(
  el: Element | null | undefined,
  options: {
    delay?: number
    smooth?: boolean
    block?: ScrollLogicalPosition
    /**
     * When true with `smooth: false`, scroll in the same frame (after layout).
     * Use from `useLayoutEffect` so the selected-day panel lands under the header immediately.
     */
    flush?: boolean
  } = {},
) {
  const { delay = 0, smooth, block = 'start', flush } = options
  const useSmooth = smooth !== false && !prefersReducedMotion()
  const run = () => scrollNodeIntoView(el, { useSmooth, block })

  if (delay > 0) {
    window.setTimeout(run, delay)
  } else if (flush && !useSmooth) {
    run()
  } else {
    requestAnimationFrame(() => {
      requestAnimationFrame(run)
    })
  }
}

function scrollNodeIntoView(
  el: Element | null | undefined,
  {
    useSmooth,
    block,
  }: { useSmooth: boolean; block: ScrollLogicalPosition },
) {
  if (!el) return
  if (useSmooth) {
    el.scrollIntoView({ behavior: 'smooth', block, inline: 'nearest' })
  } else {
    withDocumentInstantScroll(() => {
      el.scrollIntoView({ behavior: 'auto', block, inline: 'nearest' })
    })
  }
}

/**
 * Scroll to an in-page target from a location hash (e.g. `#section`), or to the top if missing.
 */
export function scrollToLocationHash(
  hash: string,
  options: { smooth?: boolean } = {},
) {
  const raw = hash.replace(/^#/, '').trim()
  if (!raw) {
    scrollToTop({ behavior: 'instant', delay: 0 })
    return
  }

  let el: Element | null = document.getElementById(raw)
  if (!el && typeof CSS !== 'undefined' && typeof CSS.escape === 'function') {
    try {
      el = document.querySelector(`#${CSS.escape(raw)}`)
    } catch {
      el = null
    }
  }

  if (!el) {
    scrollToTop({ behavior: 'instant', delay: 0 })
    return
  }

  const smooth = options.smooth !== false && !prefersReducedMotion()
  scrollNodeIntoView(el, { useSmooth: smooth, block: 'start' })
}

/**
 * Hard reset window scroll (used after route changes). Safe to call multiple times.
 */
export function scrollWindowToTopInstant(): void {
  scrollToTop({ behavior: 'instant', delay: 0 })
}

/**
 * Get the height of the sticky header to use as scroll offset
 */
export function getHeaderOffset(): number {
  const header = document.querySelector('[data-header]')
  return header?.getBoundingClientRect().height || 80 // fallback to 80px
}

/**
 * Check if we're on mobile (useful for conditional scroll behavior)
 */
export function isMobileViewport(): boolean {
  return window.innerWidth < 960
}

/**
 * Scroll to reading panel on mobile when prayer is selected
 */
export function scrollToReaderOnMobile(readerSelector: string = '#reader', options: Partial<ScrollToOptions> = {}) {
  if (!isMobileViewport()) return

  scrollToElement(readerSelector, {
    behavior: 'smooth',
    delay: 150, // Allow state to update first
    offset: getHeaderOffset() + 20, // Extra padding for mobile
    ...options,
  })
}

/**
 * Enhanced page transition scroll for mobile - ensures clean navigation
 */
export function scrollToTopForPageTransition(options: Partial<ScrollToOptions> = {}) {
  // For mobile, we want instant scrolling to ensure pages open at the top
  // For desktop, we can use a subtle smooth scroll
  const behavior = isMobileViewport() ? 'instant' : 'smooth'
  
  scrollToTop({
    behavior,
    delay: 0,
    offset: 0,
    ...options,
  })
}

/**
 * Force immediate scroll to top for prayer selection on mobile
 */
export function forceScrollToTopOnMobile(options: Partial<ScrollToOptions> = {}) {
  if (!isMobileViewport()) return

  requestAnimationFrame(() => {
    scrollToTop({
      behavior: 'instant',
      delay: 0,
      offset: 0,
      ...options,
    })
  })
}
