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

/**
 * Scroll to the top of the page
 */
export function scrollToTop(options: ScrollToOptions = {}) {
  const { behavior = 'smooth', delay = 0, offset = 0 } = options
  
  const doScroll = () => {
    window.scrollTo({
      top: offset,
      left: 0,
      behavior,
    })
  }
  
  if (delay > 0) {
    setTimeout(doScroll, delay)
  } else {
    doScroll()
  }
}

/**
 * Scroll to a specific element by ID or selector
 */
export function scrollToElement(selector: string, options: ScrollToOptions = {}) {
  const { behavior = 'smooth', delay = 0, offset = 0 } = options
  
  const doScroll = () => {
    const element = document.querySelector(selector)
    if (element) {
      const elementTop = element.getBoundingClientRect().top + window.pageYOffset
      window.scrollTo({
        top: elementTop - offset,
        left: 0,
        behavior,
      })
    }
  }
  
  if (delay > 0) {
    setTimeout(doScroll, delay)
  } else {
    doScroll()
  }
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
    delay: 100, // Allow state to update first
    offset: getHeaderOffset(),
    ...options,
  })
}