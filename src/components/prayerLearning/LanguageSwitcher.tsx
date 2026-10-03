/**
 * @deprecated Page-level language switchers are removed.
 * Use the global LanguageToggle in the site header / menu.
 */
export function LanguageSwitcher(_props: {
  value: 'am' | 'en' | 'both'
  onChange: (mode: 'am' | 'en' | 'both') => void
}) {
  return null
}
