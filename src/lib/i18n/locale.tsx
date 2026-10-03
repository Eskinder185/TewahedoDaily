import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react'
import {
  isAppLocale,
  toContentLocale,
  toUiLocale,
  type AppLocale,
  type ContentLocaleMode,
  type UiLocale,
} from './localeHelpers'

export type { AppLocale, ContentLocaleMode, UiLocale }

/**
 * Global language preference for UI chrome + bilingual sacred content.
 * - en / am: UI and content prefer that language
 * - both: UI chrome uses English; content shows Amharic then English when available
 */
const STORAGE_KEY = 'tewahedo-daily-locale'
const LEGACY_CALENDAR_KEY = 'td-calendar-detail-lang-v1'
const LEGACY_GUIDE_KEY = 'td-prayer-guide-lang-v1'
const ACCOUNT_PREFS_KEY = 'tewahedo:prefs:v1'

type LocaleContextValue = {
  locale: AppLocale
  /** Chrome / JSON dictionary locale. */
  uiLocale: UiLocale
  /** Sacred / bilingual content mode (same as locale). */
  contentLocale: ContentLocaleMode
  setLocale: (locale: AppLocale) => void
  /** Cycles en → am → both → en. */
  toggleLocale: () => void
}

const LocaleContext = createContext<LocaleContextValue | null>(null)

function readAccountPrefsLanguage(): AppLocale | null {
  try {
    const raw = window.localStorage.getItem(ACCOUNT_PREFS_KEY)
    if (!raw) return null
    const parsed = JSON.parse(raw) as { language?: unknown }
    return isAppLocale(parsed.language) ? parsed.language : null
  } catch {
    return null
  }
}

function writeAccountPrefsLanguage(locale: AppLocale) {
  try {
    const raw = window.localStorage.getItem(ACCOUNT_PREFS_KEY)
    const parsed = raw ? (JSON.parse(raw) as Record<string, unknown>) : {}
    parsed.language = locale
    window.localStorage.setItem(ACCOUNT_PREFS_KEY, JSON.stringify(parsed))
  } catch {
    /* ignore */
  }
}

function persistLocale(locale: AppLocale) {
  try {
    window.localStorage.setItem(STORAGE_KEY, locale)
    window.localStorage.setItem(LEGACY_CALENDAR_KEY, locale)
    window.localStorage.setItem(LEGACY_GUIDE_KEY, locale)
    writeAccountPrefsLanguage(locale)
  } catch {
    /* ignore */
  }
}

function readStoredLocale(): AppLocale {
  if (typeof window === 'undefined') return 'en'
  try {
    const primary = window.localStorage.getItem(STORAGE_KEY)
    if (isAppLocale(primary)) return primary

    const calendar = window.localStorage.getItem(LEGACY_CALENDAR_KEY)
    if (isAppLocale(calendar)) {
      persistLocale(calendar)
      return calendar
    }

    const guide = window.localStorage.getItem(LEGACY_GUIDE_KEY)
    if (isAppLocale(guide)) {
      persistLocale(guide)
      return guide
    }

    const account = readAccountPrefsLanguage()
    if (account) {
      persistLocale(account)
      return account
    }
  } catch {
    /* ignore */
  }
  return 'en'
}

export function LocaleProvider({ children }: { children: ReactNode }) {
  const [locale, setLocaleState] = useState<AppLocale>(() => readStoredLocale())

  const setLocale = useCallback((next: AppLocale) => {
    setLocaleState(next)
    persistLocale(next)
  }, [])

  const toggleLocale = useCallback(() => {
    setLocale(locale === 'en' ? 'am' : locale === 'am' ? 'both' : 'en')
  }, [locale, setLocale])

  useEffect(() => {
    document.documentElement.lang = toUiLocale(locale)
    document.documentElement.dataset.lang = locale
  }, [locale])

  const uiLocale = toUiLocale(locale)
  const contentLocale = toContentLocale(locale)

  const value = useMemo(
    () => ({
      locale,
      uiLocale,
      contentLocale,
      setLocale,
      toggleLocale,
    }),
    [locale, uiLocale, contentLocale, setLocale, toggleLocale],
  )

  return <LocaleContext.Provider value={value}>{children}</LocaleContext.Provider>
}

// Hook co-located with provider (standard React context pattern).
// eslint-disable-next-line react-refresh/only-export-components -- useLocale belongs with LocaleProvider
export function useLocale(): LocaleContextValue {
  const ctx = useContext(LocaleContext)
  if (!ctx) {
    throw new Error('useLocale must be used within LocaleProvider')
  }
  return ctx
}
