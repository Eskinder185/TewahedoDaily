import type { AppLocale } from './localeHelpers'

export type BilingualStrings = {
  english?: string | null
  amharic?: string | null
}

/**
 * Pick a single string for the active locale.
 * Falls back to the other language when the preferred text is missing.
 */
export function pickContentString(
  block: BilingualStrings,
  mode: AppLocale,
): { text: string; lang: 'en' | 'am' | undefined; isFallback: boolean } {
  const en = (block.english || '').trim()
  const am = (block.amharic || '').trim()
  if (mode === 'am') {
    if (am) return { text: am, lang: 'am', isFallback: false }
    if (en) return { text: en, lang: 'en', isFallback: true }
    return { text: '', lang: undefined, isFallback: false }
  }
  if (en) return { text: en, lang: 'en', isFallback: false }
  if (am) return { text: am, lang: 'am', isFallback: true }
  return { text: '', lang: undefined, isFallback: false }
}

export type BilingualLine = {
  text: string
  lang: 'en' | 'am'
  label: string
  isFallback: boolean
}

/** Single preferred line for the active locale (with graceful fallback). */
export function bilingualLines(block: BilingualStrings, mode: AppLocale): BilingualLine[] {
  const picked = pickContentString(block, mode)
  if (!picked.text || !picked.lang) return []
  return [
    {
      text: picked.text,
      lang: picked.lang,
      label: picked.lang === 'am' ? 'አማርኛ' : 'English',
      isFallback: picked.isFallback,
    },
  ]
}
