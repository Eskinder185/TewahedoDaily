/** Versioned adapters for the existing Studio schemas, not a new game format. */
import { fromQuestionRow, isHistoryTimeline, validateStudioDraft, type StudioDraft, type StudioRecord } from './contentStudio'
import { validateQuestionDraft, type QuestionDraft, type QuestionRow } from './questionLibrary'
import { adventureSourceLabel, adventureSourceLink } from './bibleAdventureStories'
import type { SourceReference } from './types'

export const ACTIVITY_FORMAT = 'studio-activity-v1'
const object = (v: unknown): v is Record<string, unknown> => !!v && typeof v === 'object' && !Array.isArray(v)
export const isStudioActivity = (payload: unknown) => object(payload) && payload.format === ACTIVITY_FORMAT

export function activitySources(draft: StudioDraft): SourceReference[] {
  if (isHistoryTimeline(draft)) return draft.content.map(event => event.source)
  switch (draft.game) {
    case 'match': case 'feasts': case 'saints': case 'icon-memory': return draft.content.map(item => item.source)
    case 'bible-timeline': return draft.content.events.map(event => ({ kind: 'bible', label: event.ref, route: event.route }))
    case 'adventures': return draft.content.scenes.map(scene => ({ kind: 'bible', label: adventureSourceLabel(scene.source), route: adventureSourceLink(scene.source) }))
    case 'finish-the-mezmur': return [{ kind: 'mezmur', label: draft.content.title, route: `/hymns/${draft.content.slug}` }]
    default: return [draft.content.source]
  }
}
function bilingualComplete(value: unknown): boolean {
  if (Array.isArray(value)) return value.every(bilingualComplete)
  if (!object(value)) return true
  if ('en' in value && (typeof value.am !== 'string' || !value.am.trim())) return false
  return Object.values(value).every(bilingualComplete)
}
export function validateLibraryDraft(value: unknown): string[] {
  if (!object(value) || !isStudioActivity(value.payload)) return validateQuestionDraft(value)
  const errors: string[] = []
  const payload = value.payload as Record<string, unknown>
  if (typeof value.stable_id !== 'string' || !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(value.stable_id) || value.stable_id.length > 160 || payload.id !== value.stable_id) errors.push('Activity identifiers must match a stable slug.')
  if (typeof payload.name !== 'string' || !payload.name.trim() || payload.name.length > 500) errors.push('Activity name required.')
  if (payload.sortOrder !== undefined && (!Number.isSafeInteger(payload.sortOrder) || Number(payload.sortOrder) < 0 || Number(payload.sortOrder) > 100000)) errors.push('Activity order must be a whole number from 0 to 100000.')
  if (typeof value.category !== 'string' || !value.category.trim() || value.category.length > 200 || !['beginner', 'growing', 'challenge'].includes(String(value.difficulty))) errors.push('Activity category and difficulty required.')
  if (JSON.stringify(payload).length > 128000) return [...errors, 'Activity exceeds 128 KB.']
  const mezmur = object(payload.draft) && payload.draft.game === 'finish-the-mezmur'
  const sourceOnly = mezmur && payload.sourceOnly === true
  if (mezmur && !sourceOnly) return [...errors, 'Mezmur activities require source-only storage; copied lyrics cannot be published here.']
  const sourceContent = sourceOnly && object(payload.draft) && object(payload.draft.content) ? payload.draft.content : null
  const issues = sourceOnly ? (sourceContent && typeof sourceContent.slug === 'string' && /^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(sourceContent.slug)
    && typeof sourceContent.title === 'string' && sourceContent.title.trim()
    && Object.keys(sourceContent).every(key => ['slug', 'title', 'title_amharic', 'title_english', 'primary_language', 'lyrics_amharic', 'lyrics_english', 'lyrics_transliteration', 'youtube_url'].includes(key))
    && ['lyrics_amharic', 'lyrics_english', 'lyrics_transliteration', 'youtube_url'].every(key => sourceContent[key] === '' || sourceContent[key] === null)
    ? [] : ['Mezmur activities must contain only a source selection, never copied lyrics or media.']) : validateStudioDraft(payload.draft)
  if (issues.length) return [...errors, ...issues]
  const draft = payload.draft as StudioDraft
  if (draft.game !== value.game_type) errors.push('Activity game must match its library row.')
  const locales = payload.verifiedLocales
  if (!Array.isArray(locales) || !locales.includes('en') || new Set(locales).size !== locales.length || locales.some(locale => !['en', 'am'].includes(String(locale)))) errors.push('Choose reviewed English/Amharic locales.')
  if (Array.isArray(locales) && locales.includes('am') && !bilingualComplete(draft.content)) errors.push('Complete every bilingual field before marking Amharic reviewed.')
  if (JSON.stringify(value.source_references) !== JSON.stringify(activitySources(draft))) errors.push('Activity source references must match every content source.')
  return errors
}
export function toStudioActivityDraft(record: StudioRecord): QuestionDraft {
  const stable_id = record.stableId || `studio-${record.id}`
  const draft = structuredClone(record.draft)
  if (draft.game === 'finish-the-mezmur') {
    const song = draft.content
    draft.content = { slug: song.slug, title: song.title, title_amharic: song.title_amharic, title_english: song.title_english, primary_language: song.primary_language,
      lyrics_amharic: '', lyrics_english: null, lyrics_transliteration: null, youtube_url: null }
  }
  return { stable_id, game_type: record.draft.game, category: record.category ?? record.draft.game, difficulty: record.difficulty || 'beginner',
    payload: { id: stable_id, format: ACTIVITY_FORMAT, name: record.name, sortOrder: record.sortOrder ?? 0, verifiedLocales: record.reviewedAmharic ? ['en', 'am'] : ['en'], draft,
      ...(draft.game === 'finish-the-mezmur' ? { sourceOnly: true } : {}) },
    source_references: activitySources(record.draft) }
}
export function fromLibraryRow(row: QuestionRow, owner: string): StudioRecord | null {
  if (!isStudioActivity(row.payload)) return fromQuestionRow(row, owner)
  const errors = validateLibraryDraft(row)
  if (row.question_id !== row.stable_id || errors.length) throw new Error(errors.join(' ') || 'Activity identifiers need reconciliation.')
  return { version: 1, id: row.id, remoteId: row.id, stableId: row.stable_id, owner, status: row.status, name: String(row.payload.name), updatedAt: row.updated_at,
    draft: structuredClone(row.payload.draft) as StudioDraft, category: row.category, difficulty: row.difficulty, sortOrder: Number(row.payload.sortOrder || 0), reviewedAmharic: (row.payload.verifiedLocales as string[]).includes('am') }
}
/** Unreviewed translations remain stored for editors but are not served to players. */
export function publicActivityDraft(row: QuestionRow): StudioDraft {
  const draft = structuredClone(row.payload.draft) as StudioDraft
  if (!(row.payload.verifiedLocales as string[]).includes('am')) {
    const strip = (value: unknown) => {
      if (Array.isArray(value)) value.forEach(strip)
      else if (object(value)) { if ('en' in value) delete value.am; if ('verifiedLocales' in value) value.verifiedLocales = ['en']; Object.values(value).forEach(strip) }
    }
    strip(draft.content)
  }
  return draft
}
