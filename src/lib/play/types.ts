import type { AppLocale } from '../i18n/locale'

export type PlayGameType = 'trivia' | 'emoji' | 'finish-the-verse' | 'finish-the-mezmur' | 'history' | 'adventure'
export type PlayDifficulty = 'beginner' | 'growing' | 'challenge'
export type LocalizedText = Partial<Record<AppLocale, string>> & { en: string }

export type SourceReference = {
  label: string
  route: string
  kind: 'bible' | 'church-library' | 'mezmur'
  sourceId?: string
}

export type PlayOption = { key: string; text: LocalizedText }

export type PlayQuestion = {
  id: string
  game: PlayGameType
  category: string
  difficulty: PlayDifficulty
  prompt: LocalizedText
  options: PlayOption[]
  correctKey: string
  explanation: LocalizedText
  source: SourceReference
  emoji?: string
  excerpt?: LocalizedText
  hints?: LocalizedText[]
  mode?: 'finish-lyrics' | 'missing-word' | 'guess-mezmur' | 'guess-occasion'
  verifiedLocales: AppLocale[]
}

export type WhoAmICard = {
  id: string
  category: 'biblical-people' | 'biblical-locations' | 'saints' | 'holy-objects'
  answer: LocalizedText
  explanation: LocalizedText
  source: SourceReference
  verifiedLocales: AppLocale[]
}

export type MatchPair = {
  id: string
  category: string
  left: LocalizedText
  right: LocalizedText
  explanation: LocalizedText
  source: SourceReference
  verifiedLocales: AppLocale[]
}

export function localized(value: LocalizedText, locale: AppLocale) {
  return {
    text: value[locale] || value.en,
    fallback: locale === 'am' && !value.am,
  }
}
