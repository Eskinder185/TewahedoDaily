import { validateQuestionDraft, type QuestionDraft } from './questionLibrary'
import { internalSource } from './contentSource'
import type { MatchPair, WhoAmICard } from './types'
import type { AppLocale } from '../i18n/locale'

export type CardGame = 'who-am-i' | 'match'
export type CardFor<G extends CardGame> = G extends 'who-am-i' ? WhoAmICard : MatchPair
/** Staff tests may inspect draft translations; public play uses verified locales. */
export const cardLocale = (locales: readonly AppLocale[], requested: AppLocale, preview = false): AppLocale => preview || locales.includes(requested) ? requested : 'en'
const obj = (value: unknown): value is Record<string, unknown> => !!value && typeof value === 'object' && !Array.isArray(value)

/** Reuses the existing server draft schema. Cards are objects, never quiz rows. */
export function cardQuestionDraft(game: CardGame, payload: unknown): QuestionDraft {
  const item = obj(payload) ? payload : {}
  return { stable_id: typeof item.id === 'string' ? item.id : '', game_type: game,
    category: typeof item.category === 'string' ? item.category : '', difficulty: 'beginner',
    payload: item, source_references: obj(item.source) ? [item.source as QuestionDraft['source_references'][number]] : [] }
}
export function validateCardContent(game: CardGame, value: unknown): string[] {
  if (!obj(value) || JSON.stringify(value).length > 50000) return ['Invalid or oversized game card.']
  const errors = validateQuestionDraft(cardQuestionDraft(game, value))
  const fields = ['id', 'category', 'explanation', 'source', 'verifiedLocales', ...(game === 'who-am-i' ? ['answer'] : ['left', 'right'])]
  if (Object.keys(value).some(key => !fields.includes(key))) errors.push('Unsupported card fields; use the existing game format.')
  const source = obj(value.source) ? value.source : {}
  const prefixes: Record<string, RegExp> = { bible: /^\/bible(?:[/?#]|$)/, 'church-library': /^\/library(?:[/?#]|$)/, calendar: /^\/calendar(?:[/?#]|$)/, mezmur: /^\/(hymns|practice)(?:[/?#]|$)/ }
  if (!internalSource(source.route) || !prefixes[String(source.kind)]?.test(String(source.route))) errors.push('Source kind must match a safe internal destination.')
  return errors
}

/** Invalid published rows are excluded, even if a privileged session can read them. */
export function publishedCard<G extends CardGame>(game: G, value: unknown): CardFor<G> | null {
  if (!obj(value) || value.game_type !== game || value.status !== 'published' || typeof value.published_at !== 'string'
    || !Number.isFinite(Date.parse(value.published_at)) || !obj(value.payload)) return null
  if (value.question_id !== value.stable_id || value.stable_id !== value.payload.id || value.category !== value.payload.category) return null
  const draft = { ...value, source_references: value.source_references }
  if (validateQuestionDraft(draft).length || validateCardContent(game, value.payload).length) return null
  return structuredClone(value.payload) as CardFor<G>
}

/** Stable-ID override plus duplicate-answer rejection preserves playable banks. */
export function mergeCardBank<G extends CardGame>(game: G, fallback: readonly CardFor<G>[], published: readonly CardFor<G>[]): CardFor<G>[] {
  const rows = new Map(fallback.map(item => [item.id, item]))
  const normalize = (text: string) => text.normalize('NFKC').toLocaleLowerCase().replace(/[\s\p{P}]+/gu, ' ').trim()
  for (const item of published) {
    const sides = game === 'match' ? ['left', 'right'] : ['answer']
    const conflict = [...rows.values()].some(other => other.id !== item.id && sides.some(side => ['en', 'am'].some(locale => {
      const a = (item as unknown as Record<string, Record<string, string>>)[side]?.[locale]
      const b = (other as unknown as Record<string, Record<string, string>>)[side]?.[locale]
      return a && b && normalize(a) === normalize(b)
    })))
    if (!conflict) rows.set(item.id, item)
  }
  return [...rows.values()]
}
