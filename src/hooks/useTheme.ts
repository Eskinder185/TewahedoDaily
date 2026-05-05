import { createContext, useContext, useEffect, useState } from 'react'

export type Theme = 'day' | 'night'

interface ThemeContextType {
  theme: Theme
  setTheme: (theme: Theme) => void
  toggleTheme: () => void
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
  if (typeof window === 'undefined') return 'day'
  try {
    const stored = localStorage.getItem('tewahedo-theme')
    if (stored === 'night' || stored === 'dark') return 'night'
    if (stored === 'day' || stored === 'light') return 'day'
    return 'day'
  } catch {
    return 'day'
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

function colorSchemeForTheme(theme: Theme): 'light' | 'dark' {
  return theme === 'night' ? 'dark' : 'light'
}

export function useThemeState() {
  const [theme, setThemeState] = useState<Theme>(() => getStoredTheme())

  const setTheme = (newTheme: Theme) => {
    setThemeState(newTheme)
    setStoredTheme(newTheme)
  }

  const toggleTheme = () => {
    setTheme(theme === 'night' ? 'day' : 'night')
  }

  useEffect(() => {
    const root = document.documentElement
    root.setAttribute('data-theme', theme)
    root.style.colorScheme = colorSchemeForTheme(theme)
  }, [theme])

  return { theme, setTheme, toggleTheme }
}
