export const MEZMUR_LANGUAGES = [
  { code: 'am', label: 'Amharic', nativeLabel: 'አማርኛ', aliases: ['am', 'amh', 'amharic'] },
  { code: 'ti', label: 'Tigrinya', nativeLabel: 'ትግርኛ', aliases: ['ti', 'tir', 'tigrinya'] },
  { code: 'om', label: 'Oromo', nativeLabel: 'Afaan Oromoo', aliases: ['om', 'orm', 'oromo', 'afaan oromoo'] },
  { code: 'gez', label: 'Geʽez', nativeLabel: 'ግዕዝ', aliases: ['gez', 'geez', "ge'ez", 'gəʿəz'] },
  { code: 'en', label: 'English', nativeLabel: 'English', aliases: ['en', 'eng', 'english'] },
] as const

export type MezmurLanguageCode = (typeof MEZMUR_LANGUAGES)[number]['code']
export type MezmurLanguageFilter = MezmurLanguageCode | 'all'

export function normalizeMezmurLanguage(value: unknown): MezmurLanguageCode | null {
  const needle = String(value ?? '').trim().toLocaleLowerCase()
  if (!needle) return null
  return MEZMUR_LANGUAGES.find((language) =>
    (language.aliases as readonly string[]).includes(needle),
  )?.code ?? null
}

export function isMezmurLanguageFilter(value: unknown): value is MezmurLanguageFilter {
  if (typeof value !== 'string' || !value) return false
  return value === 'all' || normalizeMezmurLanguage(value) === value
}

export function mezmurLanguageAliases(code: MezmurLanguageCode): string[] {
  return [...MEZMUR_LANGUAGES.find((language) => language.code === code)!.aliases]
}

export function mezmurLanguageLabel(value: unknown, unknownLabel = 'Unknown'): string {
  const code = normalizeMezmurLanguage(value)
  const language = MEZMUR_LANGUAGES.find((entry) => entry.code === code)
  return language ? `${language.label} / ${language.nativeLabel}` : unknownLabel
}
