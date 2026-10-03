export type AppLocale = 'en' | 'am' | 'both'
export type UiLocale = 'en' | 'am'
export type ContentLocaleMode = AppLocale

export function isAppLocale(value: unknown): value is AppLocale {
  return value === 'en' || value === 'am' || value === 'both'
}

export function toUiLocale(locale: AppLocale): UiLocale {
  return locale === 'am' ? 'am' : 'en'
}

export function toContentLocale(locale: AppLocale): ContentLocaleMode {
  return locale
}

/** Binary pickers that cannot render both: prefer Amharic only in `am` mode. */
export function prefersAmharicContent(locale: AppLocale): boolean {
  return locale === 'am'
}
