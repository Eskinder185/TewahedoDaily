import { createContext, useContext, useEffect, useState } from 'react'

export type Theme = 'light' | 'dark' | 'auto'

interface ThemeContextType {
  theme: Theme
  setTheme: (theme: Theme) => void
  effectiveTheme: 'light' | 'dark'
}

export const ThemeContext = createContext<ThemeContextType | null>(null)

export function useTheme() {
  const context = useContext(ThemeContext)
  if (!context) {
    throw new Error('useTheme must be used within a ThemeProvider')
  }
  return context
}

export function getStoredTheme(): Theme {
  if (typeof window === 'undefined') return 'auto'
  try {
    const stored = localStorage.getItem('tewahedo-theme') as Theme
    return ['light', 'dark', 'auto'].includes(stored) ? stored : 'auto'
  } catch {
    return 'auto'
  }
}

export function setStoredTheme(theme: Theme) {
  if (typeof window === 'undefined') return
  try {
    localStorage.setItem('tewahedo-theme', theme)
  } catch {
    // ignore storage errors
  }
}

export function getEffectiveTheme(theme: Theme): 'light' | 'dark' {
  if (theme === 'auto') {
    if (typeof window === 'undefined') return 'light'
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
  }
  return theme
}

export function useThemeState() {
  const [theme, setThemeState] = useState<Theme>(() => getStoredTheme())

  const setTheme = (newTheme: Theme) => {
    setThemeState(newTheme)
    setStoredTheme(newTheme)
  }

  const effectiveTheme = getEffectiveTheme(theme)

  useEffect(() => {
    const root = document.documentElement
    root.setAttribute('data-theme', effectiveTheme)
    root.style.colorScheme = effectiveTheme
  }, [effectiveTheme])

  // Listen for system theme changes when in auto mode
  useEffect(() => {
    if (theme !== 'auto') return

    const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)')
    const handleChange = () => {
      const newEffective = getEffectiveTheme('auto')
      const root = document.documentElement
      root.setAttribute('data-theme', newEffective)
      root.style.colorScheme = newEffective
    }

    mediaQuery.addEventListener('change', handleChange)
    return () => mediaQuery.removeEventListener('change', handleChange)
  }, [theme])

  return { theme, setTheme, effectiveTheme }
}