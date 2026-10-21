import type { AppLocale } from '../i18n/locale'

export function hymnMezmurCountLabel(count: number, locale: AppLocale): string {
  const safe = Number.isFinite(count) ? Math.max(0, Math.trunc(count)) : 0
  if (locale === 'am') return safe === 1 ? '1 መዝሙር' : `${safe} መዝሙሮች`
  return safe === 1 ? '1 Mezmur' : `${safe} Mezmurs`
}

/**
 * Choose stored hymn titles or descriptions for the UI locale.
 * Missing Amharic stays English source text; it is not translated here.
 */
export function hymnSourceHeading(
  english: string | null | undefined,
  amharic: string | null | undefined,
  locale: AppLocale,
): {
  primary: string
  primaryLang: 'en' | 'am'
  secondary: string
  secondaryLang: 'en' | 'am' | null
} {
  const am = (amharic || '').trim()
  const en = (english || '').trim()
  if (locale === 'am' && am) {
    const showEnglish = Boolean(en && en !== am)
    return {
      primary: am,
      primaryLang: 'am',
      secondary: showEnglish ? en : '',
      secondaryLang: showEnglish ? 'en' : null,
    }
  }
  const primary = en || am
  const primaryLang: 'en' | 'am' = en ? 'en' : 'am'
  const showAmharic = locale === 'en' && Boolean(am && am !== en)
  return {
    primary,
    primaryLang,
    secondary: showAmharic ? am : '',
    secondaryLang: showAmharic ? 'am' : null,
  }
}
