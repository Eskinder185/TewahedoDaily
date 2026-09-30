import type { PrayerLang } from '../../components/prayers/prayerLang'
import type { AppLocale } from '../i18n/locale'

export type PrayerTriText = {
  amharic: string
  geez: string
  english: string
}

export type PrayerTriTitle = {
  amharic: string
  geez: string
  english: string
  fallback: string
}

export function hasPrayerText(value?: string | null): boolean {
  return Boolean(value && value.trim())
}

export function availablePrayerLangs(text: PrayerTriText): PrayerLang[] {
  const langs: PrayerLang[] = []
  if (hasPrayerText(text.amharic)) langs.push('amharic')
  if (hasPrayerText(text.geez)) langs.push('geez')
  if (hasPrayerText(text.english)) langs.push('english')
  return langs
}

export function preferredPrayerLangFromLocale(locale: AppLocale): PrayerLang {
  return locale === 'am' ? 'amharic' : 'english'
}

/** preferred → Amharic → Ge'ez → English → first available */
export function resolvePrayerLang(
  text: PrayerTriText,
  preferred: PrayerLang,
): PrayerLang | null {
  const available = availablePrayerLangs(text)
  if (!available.length) return null
  const order: PrayerLang[] = [preferred, 'amharic', 'geez', 'english']
  for (const lang of order) {
    if (available.includes(lang)) return lang
  }
  return available[0]
}

export function prayerBodyForLang(text: PrayerTriText, lang: PrayerLang): string {
  if (lang === 'amharic') return text.amharic.trim()
  if (lang === 'geez') return text.geez.trim()
  return text.english.trim()
}

export function prayerTitleForLang(titles: PrayerTriTitle, lang: PrayerLang): string {
  const pick =
    lang === 'amharic'
      ? titles.amharic
      : lang === 'geez'
        ? titles.geez
        : titles.english
  const chosen = pick.trim() || titles.fallback.trim()
  return chosen
}

export function htmlLangForPrayerLang(lang: PrayerLang): string | undefined {
  if (lang === 'amharic') return 'am'
  if (lang === 'geez') return 'gez'
  return 'en'
}
