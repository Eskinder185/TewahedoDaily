import type { AppLocale } from '../i18n/locale'

export type LocalizedPick = {
  text: string
  /** Language of `text`, for the `lang` attribute. */
  lang: 'en' | 'am'
  /** True when the selected language was empty and the other one is shown. */
  fallback: boolean
}

/**
 * Picks one language for a bilingual field. Falls back to the other language
 * (never both) and reports it so callers can label the fallback.
 */
export function pickLocalized(
  locale: AppLocale,
  english: string | null | undefined,
  amharic: string | null | undefined,
): LocalizedPick {
  const en = (english ?? '').trim()
  const am = (amharic ?? '').trim()
  const wantAm = locale === 'am'
  const primary = wantAm ? am : en
  if (primary) return { text: primary, lang: wantAm ? 'am' : 'en', fallback: false }
  const other = wantAm ? en : am
  if (other) return { text: other, lang: wantAm ? 'en' : 'am', fallback: true }
  return { text: '', lang: wantAm ? 'am' : 'en', fallback: false }
}
