import { useEffect } from 'react'
import { useLocation } from 'react-router-dom'
import { scrollToTop } from '../lib/scrollUtils'

/**
 * Hook that scrolls to top whenever the route changes
 * Use this in App.tsx or main layout components
 */
export function useScrollToTopOnRouteChange() {
  const location = useLocation()
  
  useEffect(() => {
    // Scroll to top when route changes, with a small delay to allow content to render
    scrollToTop({ delay: 50, behavior: 'instant' })
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
    scrollToElement: (selector: string, behavior: 'smooth' | 'instant' = 'smooth') => {
      const element = document.querySelector(selector)
      if (element) {
        element.scrollIntoView({ behavior })
      }
    }
  }
}