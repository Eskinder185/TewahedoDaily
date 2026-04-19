import { useEffect } from 'react'
import { useLocation } from 'react-router-dom'
import { scrollToTop, forceScrollToTopOnMobile } from '../lib/scrollUtils'

/**
 * Hook that scrolls to top whenever the route changes
 * Use this in App.tsx or main layout components
 */
export function useScrollToTopOnRouteChange() {
  const location = useLocation()
  
  useEffect(() => {
    // Force immediate scroll to top on route change
    forceScrollToTopOnMobile()
    // Also do a standard scroll for desktop/fallback
    scrollToTop({ delay: 0, behavior: 'instant' })
  }, [location.pathname])
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
    },
    scrollToElement: (selector: string, behavior: 'smooth' | 'instant' = 'smooth') => {
      const element = document.querySelector(selector)
      if (element) {
        element.scrollIntoView({ behavior })
      }
    }
  }
}