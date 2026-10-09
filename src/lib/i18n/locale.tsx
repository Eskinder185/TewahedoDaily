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
  normalizeAppLocale,
  toContentLocale,
  toUiLocale,
  type AppLocale,
  type ContentLocaleMode,
  type UiLocale,
} from './localeHelpers'

export type { AppLocale, ContentLocaleMode, UiLocale }

/**
 * Global language preference for UI chrome + sacred content.
 * Supported interface languages: English (`en`) and Amharic (`am`) only.
 */
const STORAGE_KEY = 'tewahedo-daily-locale'
const LEGACY_CALENDAR_KEY = 'td-calendar-detail-lang-v1'
const LEGACY_GUIDE_KEY = 'td-prayer-guide-lang-v1'
const ACCOUNT_PREFS_KEY = 'tewahedo:prefs:v1'

type LocaleContextValue = {
  locale: AppLocale
  /** Chrome / JSON dictionary locale. */
  uiLocale: UiLocale
  /** Sacred content preference (same as locale). */
  contentLocale: ContentLocaleMode
  setLocale: (locale: AppLocale) => void
  /** Toggles en ↔ am. */
  toggleLocale: () => void
}

const LocaleContext = createContext<LocaleContextValue | null>(null)

function readAccountPrefsLanguage(): AppLocale | null {
  try {
    const raw = window.localStorage.getItem(ACCOUNT_PREFS_KEY)
    if (!raw) return null
    const parsed = JSON.parse(raw) as { language?: unknown }
    if (parsed.language == null || parsed.language === '') return null
    return normalizeAppLocale(parsed.language)
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
    if (primary != null && primary !== '') {
      const normalized = normalizeAppLocale(primary)
      // Rewrite legacy both / Oromo (and aliases) to a supported value.
      if (primary !== normalized) persistLocale(normalized)
      return normalized
    }

    const calendar = window.localStorage.getItem(LEGACY_CALENDAR_KEY)
    if (calendar != null && calendar !== '') {
      const normalized = normalizeAppLocale(calendar)
      persistLocale(normalized)
      return normalized
    }

    const guide = window.localStorage.getItem(LEGACY_GUIDE_KEY)
    if (guide != null && guide !== '') {
      const normalized = normalizeAppLocale(guide)
      persistLocale(normalized)
      return normalized
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
    const normalized = normalizeAppLocale(next)
    setLocaleState(normalized)
    persistLocale(normalized)
  }, [])

  const toggleLocale = useCallback(() => {
    setLocale(locale === 'en' ? 'am' : 'en')
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
