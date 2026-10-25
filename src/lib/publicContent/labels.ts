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
  tigrinya: 'Tigrinya',
  geez: 'Geʽez',
  am: 'Amharic',
  en: 'English',
  om: 'Oromo',
  ti: 'Tigrinya',
  gez: 'Geʽez',
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
  if (v === 'am' || v === 'amharic') return 'amharic'
  if (v === 'ti' || v === 'tigrinya') return 'tigrinya'
  if (v === 'gez' || v === 'geez') return 'geez'
  if (v === 'en' || v === 'english') return 'english'
  if (v === 'om' || v === 'oromo') return 'oromo'
  return v
}

export function languageCodeFromNormalized(value: string | null | undefined): string | null {
  if (!value) return null
  const v = value.toLowerCase()
  if (v === 'amharic' || v === 'am') return 'am'
  if (v === 'tigrinya' || v === 'ti') return 'ti'
  if (v === 'geez' || v === 'gez') return 'gez'
  if (v === 'english' || v === 'en') return 'en'
  if (v === 'oromo' || v === 'om') return 'om'
  return null
}

const AMHARIC_INTERFACE_LABELS: Record<string, string> = {
  Amharic: 'አማርኛ',
  English: 'እንግሊዝኛ',
  Oromo: 'ኦሮምኛ',
  Tigrinya: 'ትግርኛ',
  'Geʽez': 'ግዕዝ',
  Mezmur: 'መዝሙር',
  Werb: 'ወርብ',
}

/** Card metadata: Language · Form only (never NA / category / occasion). */
export function hymnCardMeta(
  item: {
    language?: string | null
    languages?: string[]
    form?: string | null
  },
  locale: 'en' | 'am' = 'en',
): string {
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
  const line = [language, form].filter(Boolean).join(' · ')
  if (locale !== 'am') return line
  return line
    .split(' · ')
    .map((part) => AMHARIC_INTERFACE_LABELS[part] || part)
    .join(' · ')
}
