import type { SourceReference } from './types'
import type { StudioGame } from './contentStudio'

export const QUESTION_GAME_TYPES = ['trivia', 'emoji', 'finish-the-verse', 'finish-the-mezmur', 'history', 'who-am-i', 'match'] as const
export const QUESTION_DIFFICULTIES = ['beginner', 'growing', 'challenge'] as const
export type QuestionGameType = (typeof QUESTION_GAME_TYPES)[number]
export const QUESTION_STATUSES = ['draft', 'review', 'approved', 'rejected', 'published', 'archived'] as const
export type QuestionStatus = (typeof QUESTION_STATUSES)[number]
export type EditorialRole = 'editor' | 'admin' | 'super_admin'

// Mirrors public.play_content_transition_allowed() in the live reconciliation proposal.
// The database is the authority; this copy only avoids doomed requests and drives the UI.
const ADMIN_TRANSITIONS: Record<QuestionStatus, readonly QuestionStatus[]> = {
  draft: ['archived'],
  review: ['approved', 'rejected', 'draft', 'archived'],
  approved: ['published', 'draft', 'archived'],
  rejected: ['draft', 'archived'],
  published: ['draft', 'archived'],
  archived: ['draft'],
}
export function questionTransitionAllowed(from: QuestionStatus, to: QuestionStatus, role: EditorialRole): boolean {
  if (role !== 'editor' && role !== 'admin' && role !== 'super_admin') return false
  if (from === 'draft' && to === 'review') return true
  return role !== 'editor' && (ADMIN_TRANSITIONS[from] || []).includes(to)
}

export type QuestionDraft = {
  stable_id: string
  game_type: QuestionGameType | StudioGame
  category: string
  difficulty: (typeof QUESTION_DIFFICULTIES)[number]
  payload: Record<string, unknown>
  source_references: SourceReference[]
}

export type QuestionRow = QuestionDraft & {
  id: string
  question_id: string
  status: QuestionStatus
  review_notes: string | null
  updated_at: string
  published_at: string | null
}

const stableId = /^[a-z0-9]+(?:-[a-z0-9]+)*$/
const object = (value: unknown): value is Record<string, unknown> => Boolean(value && typeof value === 'object' && !Array.isArray(value))
const filled = (value: unknown) => typeof value === 'string' && value.trim().length > 0
const answerKey = /^[a-z0-9_-]{1,20}$/i
const normalizedAnswer = (value: unknown) => typeof value === 'string'
  ? value.normalize('NFKC').toLocaleLowerCase().replace(/[^\p{L}\p{N}]+/gu, ' ').trim() : ''

function localized(value: unknown, name: string, errors: string[], requireAmharic: boolean) {
  if (!object(value) || !filled(value.en)) errors.push(`${name}: English text is required.`)
  if (requireAmharic && (!object(value) || !filled(value.am))) errors.push(`${name}: reviewed Amharic text is required.`)
  if (object(value) && value.am !== undefined && typeof value.am !== 'string') errors.push(`${name}: Amharic text must be a string.`)
}

function sourceValid(value: unknown): value is SourceReference {
  return object(value) && filled(value.label) && filled(value.route) &&
    String(value.route).startsWith('/') && !String(value.route).startsWith('//') &&
    ['bible', 'church-library', 'mezmur', 'calendar'].includes(String(value.kind))
}

export function validateQuestionDraft(value: unknown): string[] {
  const errors: string[] = []
  if (!object(value)) return ['Question must be an object.']
  if (!filled(value.stable_id) || !stableId.test(String(value.stable_id))) errors.push('Stable ID must use lowercase letters, numbers, and hyphens.')
  if (!QUESTION_GAME_TYPES.includes(value.game_type as QuestionGameType)) errors.push('Unsupported game type.')
  if (!filled(value.category)) errors.push('Category is required.')
  if (!QUESTION_DIFFICULTIES.includes(value.difficulty as QuestionDraft['difficulty'])) errors.push('Unsupported difficulty.')
  if (!object(value.payload)) return [...errors, 'Question payload must be an object.']
  const payload = value.payload
  if (payload.id !== value.stable_id) errors.push('Payload ID must match the stable ID.')
  const locales = payload.verifiedLocales
  if (!Array.isArray(locales) || !locales.includes('en') || locales.some((item) => !['en', 'am'].includes(String(item)))) {
    errors.push('Verified locales must include English and contain only English or Amharic.')
  }
  const requireAmharic = Array.isArray(locales) && locales.includes('am')
  const game = value.game_type
  if (['trivia', 'emoji', 'finish-the-verse', 'finish-the-mezmur', 'history'].includes(String(game))) {
    if (payload.game !== game || payload.category !== value.category || payload.difficulty !== value.difficulty) {
      errors.push('Payload game, category, and difficulty must match the library fields.')
    }
    localized(payload.prompt, 'Prompt', errors, requireAmharic)
    localized(payload.explanation, 'Explanation', errors, requireAmharic)
    if (!Array.isArray(payload.options) || payload.options.length !== 4 ||
        new Set(payload.options.map((option) => object(option) ? option.key : null)).size !== 4) {
      errors.push('Exactly four distinct answer options are required.')
    } else {
      for (const [index, option] of payload.options.entries()) {
        if (!object(option) || !filled(option.key) || !answerKey.test(String(option.key))) errors.push(`Answer ${index + 1} needs a valid key.`)
        localized(object(option) ? option.text : null, `Answer ${index + 1}`, errors, requireAmharic)
      }
      for (const language of ['en', ...(requireAmharic ? ['am'] : [])]) {
        const answers = payload.options.map((option) => {
          const item = object(option) ? option : {}
          const translated = object(item.text) ? item.text : {}
          return normalizedAnswer(translated[language])
        })
        if (answers.every(Boolean) && new Set(answers).size !== 4) errors.push(`Answer options must be distinct in ${language === 'am' ? 'Amharic' : 'English'}.`)
      }
      if (!payload.options.some((option) => object(option) && option.key === payload.correctKey)) errors.push('Select a valid correct answer.')
    }
    if (game === 'emoji' && !filled(payload.emoji)) errors.push('Emoji challenges need an emoji clue.')
    if (game === 'finish-the-verse') localized(payload.excerpt, 'Verse excerpt', errors, requireAmharic)
    if (game === 'finish-the-mezmur' && !['finish-lyrics', 'missing-word', 'guess-mezmur', 'guess-occasion'].includes(String(payload.mode))) {
      errors.push('Finish the Mezmur needs an existing supported mode.')
    }
  } else if (game === 'who-am-i') {
    if (!['biblical-people', 'biblical-locations', 'saints', 'holy-objects'].includes(String(payload.category)) || payload.category !== value.category) {
      errors.push('Who Am I needs a supported matching category.')
    }
    localized(payload.answer, 'Answer', errors, requireAmharic)
    localized(payload.explanation, 'Explanation', errors, requireAmharic)
  } else if (game === 'match') {
    if (payload.category !== value.category) errors.push('Match category must match the library field.')
    localized(payload.left, 'Prompt', errors, requireAmharic)
    localized(payload.right, 'Answer', errors, requireAmharic)
    localized(payload.explanation, 'Explanation', errors, requireAmharic)
  }
  if (!sourceValid(payload.source)) errors.push('An internal source reference with label and kind is required.')
  if (!Array.isArray(value.source_references) || !value.source_references.some((source) =>
    sourceValid(source) && object(payload.source) && source.route === payload.source.route)) {
    errors.push('Source references must include the question source.')
  }
  return errors
}

export function makeQuestionDraft(game: QuestionGameType = 'trivia'): QuestionDraft {
  const source = { label: '', route: '', kind: 'bible' as const }
  const base = { id: '', category: '', explanation: { en: '', am: '' }, source, verifiedLocales: ['en'] }
  const payload = game === 'who-am-i' ? { ...base, answer: { en: '', am: '' } }
    : game === 'match' ? { ...base, left: { en: '', am: '' }, right: { en: '', am: '' } }
      : { ...base, game, difficulty: 'beginner', prompt: { en: '', am: '' },
        options: ['a', 'b', 'c', 'd'].map((key) => ({ key, text: { en: '', am: '' } })),
        correctKey: 'a', ...(game === 'emoji' ? { emoji: '' } : {}),
        ...(game === 'finish-the-verse' ? { excerpt: { en: '', am: '' } } : {}),
        ...(game === 'finish-the-mezmur' ? { mode: 'finish-lyrics' } : {}) }
  return { stable_id: '', game_type: game, category: '', difficulty: 'beginner', payload, source_references: [source] }
}

export function duplicateQuestionDraft(draft: QuestionDraft, suffix: string): QuestionDraft {
  if (!/^[a-z0-9]{8}$/.test(suffix) || !stableId.test(draft.stable_id)) throw new Error('Invalid draft copy ID.')
  const copy = structuredClone(draft)
  copy.stable_id = `${draft.stable_id}-copy-${suffix}`
  copy.payload.id = copy.stable_id
  return copy
}

export function previewQuestionImport(raw: string, existingIds: ReadonlySet<string>) {
  if (raw.length > 1_000_000) return { items: [] as QuestionDraft[], errors: ['Import exceeds 1 MB.'] }
  let parsed: unknown
  try { parsed = JSON.parse(raw) } catch { return { items: [] as QuestionDraft[], errors: ['Import must be valid JSON.'] } }
  if (!Array.isArray(parsed) || parsed.length < 1 || parsed.length > 100) return { items: [] as QuestionDraft[], errors: ['Import must contain 1–100 questions.'] }
  const seen = new Set<string>()
  const errors: string[] = []
  for (const [index, item] of parsed.entries()) {
    const id = object(item) && filled(item.stable_id) ? String(item.stable_id) : ''
    for (const error of validateQuestionDraft(item)) errors.push(`Question ${index + 1}: ${error}`)
    if (seen.has(id) || existingIds.has(id)) errors.push(`Question ${index + 1}: stable ID already exists.`)
    seen.add(id)
  }
  return { items: errors.length ? [] : parsed as QuestionDraft[], errors }
}

