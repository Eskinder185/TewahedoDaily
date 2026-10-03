import type { AppLocale } from './localeHelpers'

export type BilingualStrings = {
  english?: string | null
  amharic?: string | null
}

/**
 * Pick a single string for modes that cannot stack.
 * `both` prefers Amharic when present (Ethiopian-first card faces).
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
  if (mode === 'en') {
    if (en) return { text: en, lang: 'en', isFallback: false }
    if (am) return { text: am, lang: 'am', isFallback: true }
    return { text: '', lang: undefined, isFallback: false }
  }
  // both — single-line contexts: Amharic first
  if (am) return { text: am, lang: 'am', isFallback: false }
  if (en) return { text: en, lang: 'en', isFallback: true }
  return { text: '', lang: undefined, isFallback: false }
}

export type BilingualLine = {
  text: string
  lang: 'en' | 'am'
  label: string
  isFallback: boolean
}

/** Ordered lines for Both mode: Amharic, then English. Never invents text. */
export function bilingualLines(block: BilingualStrings, mode: AppLocale): BilingualLine[] {
  const en = (block.english || '').trim()
  const am = (block.amharic || '').trim()

  if (mode === 'am') {
    if (am) return [{ text: am, lang: 'am', label: 'አማርኛ', isFallback: false }]
    if (en) return [{ text: en, lang: 'en', label: 'English', isFallback: true }]
    return []
  }
  if (mode === 'en') {
    if (en) return [{ text: en, lang: 'en', label: 'English', isFallback: false }]
    if (am) return [{ text: am, lang: 'am', label: 'አማርኛ', isFallback: true }]
    return []
  }

  const lines: BilingualLine[] = []
  if (am) lines.push({ text: am, lang: 'am', label: 'አማርኛ', isFallback: false })
  if (en) lines.push({ text: en, lang: 'en', label: 'English', isFallback: false })
  return lines
}
