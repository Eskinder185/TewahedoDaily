/**
 * Review model for the locally generated Bible question campaign (artifacts/faith-challenges/**).
 *
 * Generated drafts are NEVER approved or published here. This module parses a file the reviewer chose, validates
 * every question with the same validator the CMS uses, and keeps the human review decision in the reviewer's own
 * browser storage, clearly separate from the generated content. The only output is a file of validated server
 * DRAFT candidates for the existing /admin/play/import tool, which still requires its own preview and confirmation.
 */
import { validateQuestionDraft, type QuestionDraft, type QuestionGameType } from './questionLibrary'
import type { PlayQuestion, SourceReference } from './types'

export type ReviewState = 'unreviewed' | 'ready' | 'rejected'
export type CampaignItem = {
  id: string
  /** Batch label: from the file name (batch-007) when present, else the short source hash, else "unbatched". */
  batch: string
  game: string
  difficulty: string
  category: string
  bookSlug: string
  chapter: string
  verse: string
  question: PlayQuestion
  /** What the generator recorded about the source passage and model. */
  evidence: { passageId: string; sourceHash: string; modelId: string; verseIds: string[]; evidenceVerseId: string; edition: string }
  errors: string[]
  /** Raw generator provenance, kept so an import candidate carries its evidence. */
  provenance: Record<string, unknown>
  /** Amharic is only usable publicly once a human verifies it; generated Amharic stays unverified. */
  amharic: 'present' | 'missing'
  verifiedLocales: string[]
}
export type ParsedCampaign = { items: CampaignItem[]; skipped: number; campaignId: string | null }

const MAX_BYTES = 8_000_000
const MAX_ITEMS = 2000
const object = (value: unknown): value is Record<string, unknown> => !!value && typeof value === 'object' && !Array.isArray(value)
const GAMES = new Set<string>(['trivia', 'emoji', 'finish-the-verse', 'history'])

/** `/bible/genesis/10?edition=am#verse-1` → { book, chapter, verse }. Chapter here is the reader chapter ordinal. */
export function locateSource(source: SourceReference | undefined): { bookSlug: string; chapter: string; verse: string } {
  const route = typeof source?.route === 'string' ? source.route : ''
  const match = route.match(/^\/bible\/([a-z0-9-]+)\/(\d+)(?:\?[^#]*)?(?:#verse-(\d+))?/)
  return { bookSlug: match?.[1] || '', chapter: match?.[2] || '', verse: match?.[3] || '' }
}

/**
 * The same conversion scripts/bible/adapt-drafts-for-cms.ts applies: source route without query/hash, English as the
 * only verified locale (generated Amharic stays UNVERIFIED until a human reviews it), provenance kept as evidence.
 */
export function toServerDraft(question: PlayQuestion, provenance?: Record<string, unknown>): QuestionDraft {
  const source: SourceReference = { label: question.source.label, route: question.source.route.split('?')[0].split('#')[0], kind: 'bible' }
  const payload: Record<string, unknown> = {
    id: question.id, game: question.game, category: question.category, difficulty: question.difficulty, prompt: question.prompt,
    options: question.options, correctKey: question.correctKey, explanation: question.explanation, source, verifiedLocales: ['en'],
    ...(question.excerpt ? { excerpt: question.excerpt } : {}), ...(provenance && Object.keys(provenance).length ? { provenance } : {}),
  }
  return { stable_id: question.id, game_type: question.game as QuestionGameType, category: question.category, difficulty: question.difficulty,
    payload: structuredClone(payload), source_references: [source] }
}

/** Accepts `{drafts:[{question,provenance}]}` (drafts.json / all-drafts.json), a bare array of those, or CMS import arrays. */
export function parseCampaignFile(raw: string, fileName = ''): ParsedCampaign {
  if (raw.length > MAX_BYTES) throw new Error('Campaign file exceeds 8 MB. Open one batch (batch-00N/drafts.json) at a time.')
  const value: unknown = JSON.parse(raw)
  const list: unknown[] = Array.isArray(value) ? value : object(value) && Array.isArray(value.drafts) ? value.drafts : object(value) && Array.isArray(value.questions) ? value.questions : []
  if (!list.length) throw new Error('No drafts found. Use batch-00N/drafts.json, library/all-drafts.json or a CMS import array.')
  if (list.length > MAX_ITEMS) throw new Error(`At most ${MAX_ITEMS} drafts can be reviewed at once.`)
  const fileBatch = fileName.match(/batch-?(\d{1,4})/i)?.[1]
  const campaignId = object(value) && typeof value.campaignId === 'string' ? value.campaignId : null
  const items: CampaignItem[] = []
  const seen = new Set<string>()
  let skipped = 0
  for (const entry of list) {
    // Wrapped (generator) form has `question` + `provenance`; an adapted CMS draft has `payload`.
    const wrapped = object(entry) && object(entry.question)
    const question = (wrapped ? (entry as { question: unknown }).question : object(entry) && object(entry.payload) ? entry.payload : entry) as PlayQuestion
    if (!object(question) || typeof question.id !== 'string' || !GAMES.has(String(question.game)) || seen.has(question.id)) { skipped++; continue }
    seen.add(question.id)
    const provenance = wrapped && object((entry as { provenance?: unknown }).provenance) ? (entry as { provenance: Record<string, unknown> }).provenance : (object(question) && object((question as unknown as { provenance?: unknown }).provenance) ? (question as unknown as { provenance: Record<string, unknown> }).provenance : {})
    const text = (value: unknown) => (typeof value === 'string' ? value : '')
    const sourceHash = text(provenance.sourceHash)
    const at = locateSource(question.source)
    const errors: string[] = []
    try { errors.push(...validateQuestionDraft(toServerDraft(question, provenance))) } catch (cause) { errors.push(cause instanceof Error ? cause.message : 'Draft could not be validated.') }
    const hasAmharic = !!question.prompt?.am && !!question.explanation?.am && Array.isArray(question.options) && question.options.every(option => !!option?.text?.am)
    items.push({
      id: question.id, batch: fileBatch ? `batch-${fileBatch.padStart(3, '0')}` : sourceHash ? `source ${sourceHash.slice(0, 8)}` : 'unbatched',
      game: String(question.game), difficulty: String(question.difficulty), category: String(question.category), ...at, question,
      provenance, evidence: { passageId: text(provenance.passageId), sourceHash, modelId: text(provenance.modelId), verseIds: Array.isArray(provenance.verseIds) ? provenance.verseIds.map(String) : [],
        evidenceVerseId: text(provenance.evidenceVerseId), edition: question.source?.route?.match(/edition=(\w+)/)?.[1] || '' },
      errors, amharic: hasAmharic ? 'present' : 'missing', verifiedLocales: Array.isArray(question.verifiedLocales) ? question.verifiedLocales.map(String) : [],
    })
  }
  if (!items.length) throw new Error('No supported drafts (trivia, emoji, finish-the-verse, history) were found.')
  return { items, skipped, campaignId }
}

const KEY = (owner: string) => `tewahedo-campaign-review:v1:${owner}`
export type ReviewRecord = { state: ReviewState; reviewer: string; at: string }
/** Human review decisions, per reviewer, keyed by question id. They never touch the generated content. */
export function reviewStorage(storage: Pick<Storage, 'getItem' | 'setItem'>, owner: string) {
  const read = (): Record<string, ReviewRecord> => {
    try { const value = JSON.parse(storage.getItem(KEY(owner)) || '{}'); return object(value) ? (value as Record<string, ReviewRecord>) : {} } catch { return {} }
  }
  return {
    load: read,
    set(id: string, state: ReviewState) {
      const all = read()
      if (state === 'unreviewed') delete all[id]; else all[id] = { state, reviewer: owner, at: new Date().toISOString() }
      const raw = JSON.stringify(all)
      if (raw.length > 400000) throw new Error('Review notes exceed the local storage limit.')
      storage.setItem(KEY(owner), raw)
    },
  }
}

/**
 * Validated DRAFT candidates for /admin/play/import. Only items a human marked "ready" that also pass validation.
 * The file contains no status/publish fields: the import tool inserts drafts only, after its own confirmation.
 */
export function importCandidates(items: CampaignItem[], reviews: Record<string, ReviewRecord>): QuestionDraft[] {
  return items.filter(item => !item.errors.length && reviews[item.id]?.state === 'ready').map(item => {
    return toServerDraft(structuredClone(item.question), item.provenance)
  })
}
