/** Friendly labels for language / form and display helpers. */

import {
  canonicalizeCategory,
  canonicalizeOccasion,
  displayClassification,
  isNaClassification,
} from './taxonomy'

const LANGUAGE_LABELS: Record<string, string> = {
  amharic: 'Amharic',
  english: 'English',
  oromo: 'Oromo',
  geez: 'Amharic',
  am: 'Amharic',
  en: 'English',
  om: 'Oromo',
  gez: 'Amharic',
}

const FORM_LABELS: Record<string, string> = {
  mezmur: 'Mezmur',
  werb: 'Werb',
}

export function classificationLabel(value: string | null | undefined): string {
  if (!value || isNaClassification(value)) return ''
  const key = value.trim().toLowerCase()
  if (LANGUAGE_LABELS[key]) return LANGUAGE_LABELS[key]
  if (FORM_LABELS[key]) return FORM_LABELS[key]
  const category = canonicalizeCategory(value)
  if (category) return category
  const occasion = canonicalizeOccasion(value)
  if (occasion) return occasion
  return displayClassification(value) || ''
}

export function normalizeLanguageParam(value: string): string {
  const v = value.trim().toLowerCase()
  if (v === 'am' || v === 'amharic' || v === 'gez' || v === 'geez') return 'amharic'
  if (v === 'en' || v === 'english') return 'english'
  if (v === 'om' || v === 'oromo') return 'oromo'
  return v
}

export function languageCodeFromNormalized(value: string | null | undefined): string | null {
  if (!value) return null
  const v = value.toLowerCase()
  if (v === 'amharic' || v === 'am' || v === 'geez' || v === 'gez') return 'am'
  if (v === 'english' || v === 'en') return 'en'
  if (v === 'oromo' || v === 'om') return 'om'
  return null
}

/** Card metadata: Language · Form only (never NA / category / occasion). */
export function hymnCardMeta(item: {
  language?: string | null
  languages?: string[]
  form?: string | null
}): string {
  const language = item.language
    ? classificationLabel(item.language)
    : item.languages?.includes('am')
      ? 'Amharic'
      : item.languages?.includes('en')
        ? 'English'
        : item.languages?.includes('om')
          ? 'Oromo'
          : ''
  const form =
    item.form === 'werb' ? 'Werb' : item.form === 'mezmur' || !item.form ? 'Mezmur' : classificationLabel(item.form)
  return [language, form].filter(Boolean).join(' · ')
}
