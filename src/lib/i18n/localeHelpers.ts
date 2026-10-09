/** Site UI / content preference — English and Amharic only. */
export type AppLocale = 'en' | 'am'
export type UiLocale = 'en' | 'am'
export type ContentLocaleMode = AppLocale

export function isAppLocale(value: unknown): value is AppLocale {
  return value === 'en' || value === 'am'
}

/**
 * Normalize stored / legacy language codes to a supported AppLocale.
 * Afaan Oromoo (`om` / `oromo`) and former `both` mode fall back to English.
 */
export function normalizeAppLocale(value: unknown): AppLocale {
  if (value === 'am' || value === 'en') return value
  const raw = typeof value === 'string' ? value.trim().toLowerCase() : ''
  if (raw === 'am' || raw === 'am-et' || raw === 'amharic') return 'am'
  if (raw === 'en' || raw === 'en-us' || raw === 'english') return 'en'
  // Legacy UI options — no longer selectable.
  if (
    raw === 'om' ||
    raw === 'oromo' ||
    raw === 'afaan' ||
    raw === 'afaan-oromoo' ||
    raw === 'afaan_oromoo' ||
    raw === 'both'
  ) {
    return 'en'
  }
  return 'en'
}

export function toUiLocale(locale: AppLocale): UiLocale {
  return locale === 'am' ? 'am' : 'en'
}

export function toContentLocale(locale: AppLocale): ContentLocaleMode {
  return locale
}

/** Prefer Amharic sacred text when the UI locale is Amharic. */
export function prefersAmharicContent(locale: AppLocale): boolean {
  return locale === 'am'
}
