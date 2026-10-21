import type { AppLocale } from '../i18n/locale'
import type { PrayerLang } from '../../components/prayers/prayerLang'
import {
  preferredPrayerLangFromLocale,
  resolvePrayerLang,
  type PrayerTriText,
} from './prayerLanguage'

export const READER_LANG_STORAGE_KEY = 'tewahedo:reader-lang'

export function parseReaderLanguage(value: string | null | undefined): PrayerLang | null {
  if (value === 'amharic' || value === 'geez' || value === 'english') return value
  return null
}

export function readStoredReaderLanguage(): PrayerLang | null {
  if (typeof window === 'undefined') return null
  try {
    return parseReaderLanguage(window.localStorage.getItem(READER_LANG_STORAGE_KEY))
  } catch {
    return null
  }
}

export function writeStoredReaderLanguage(lang: PrayerLang) {
  if (typeof window === 'undefined') return
  try {
    window.localStorage.setItem(READER_LANG_STORAGE_KEY, lang)
  } catch {
    /* private mode */
  }
}

/**
 * Saved reader choice wins when one exists.
 * Otherwise pick the UI locale's language when that translation exists,
 * then the next available translation. Ge'ez is never invented.
 */
export function selectReaderLanguage(input: {
  locale: AppLocale
  saved: PrayerLang | null
  text: PrayerTriText | null
}): PrayerLang {
  const preferred = preferredPrayerLangFromLocale(input.locale)
  if (input.saved) return input.saved
  if (!input.text) return preferred
  return resolvePrayerLang(input.text, preferred) || preferred
}
