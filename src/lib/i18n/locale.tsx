import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react'

/** UI locale. Copy and translations can key off this later. */
export type AppLocale = 'en' | 'am'

const STORAGE_KEY = 'tewahedo-daily-locale'

type LocaleContextValue = {
  locale: AppLocale
  setLocale: (locale: AppLocale) => void
  /** Convenience: flip between English and Amharic. */
  toggleLocale: () => void
}

const LocaleContext = createContext<LocaleContextValue | null>(null)

function readStoredLocale(): AppLocale {
  if (typeof window === 'undefined') return 'en'
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY)
    if (raw === 'am' || raw === 'en') return raw
  } catch {
    /* ignore */
  }
  return 'en'
}

export function LocaleProvider({ children }: { children: ReactNode }) {
  const [locale, setLocaleState] = useState<AppLocale>(() => readStoredLocale())

  const setLocale = useCallback((next: AppLocale) => {
    setLocaleState(next)
    try {
      window.localStorage.setItem(STORAGE_KEY, next)
    } catch {
      /* ignore */
    }
  }, [])

  const toggleLocale = useCallback(() => {
    setLocale(locale === 'en' ? 'am' : 'en')
  }, [locale, setLocale])

  useEffect(() => {
    document.documentElement.lang = locale === 'am' ? 'am' : 'en'
  }, [locale])

  const value = useMemo(
    () => ({ locale, setLocale, toggleLocale }),
    [locale, setLocale, toggleLocale],
  )

  return (
    <LocaleContext.Provider value={value}>{children}</LocaleContext.Provider>
  )
}

export function useLocale(): LocaleContextValue {
  const ctx = useContext(LocaleContext)
  if (!ctx) {
    throw new Error('useLocale must be used within LocaleProvider')
  }
  return ctx
}
