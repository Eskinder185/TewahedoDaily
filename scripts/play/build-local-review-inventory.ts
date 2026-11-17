/* eslint-disable @typescript-eslint/no-explicit-any -- heterogeneous game payloads, same convention as consolidate-content.ts */
/**
 * LOCAL-ONLY review inventory of the 834 consolidated Faith Challenges draft records.
 *
 *   npx tsx scripts/play/build-local-review-inventory.ts
 *
 * Writes .local-preview/review-inventory.json (git-ignored). It reuses buildConsolidation(), which is offline: it reads the
 * bundled banks and the committed generated bank, never a database, and needs no credentials. Nothing here promotes, edits or
 * publishes a record; the JSON is only read by the dev-only /play/local-review screen (see src/pages/play/LocalPreviewReview.tsx).
 *
 * Honesty rules: labels describe what the repository can prove. Rights are reported as "not recorded" unless the draft carries a
 * rights field; nothing is marked approved, and no translation or source is invented.
 */
import { existsSync, mkdirSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
import { buildConsolidation, type Candidate } from './consolidate-content'
import type { ReviewArtwork, ReviewField, ReviewRow, ReviewSource, ReviewTag } from '../../src/lib/play/localReviewTypes'

/** Church Library books readable by an anonymous visitor on 2026-11-17 (read-only check of public.church_library_books). */
export const PUBLISHED_LIBRARY_SLUGS = ['five-pillars-of-mystery-am', 'five-pillars-of-mystery-en', 'seven-sacraments-baptism-am', 'seven-sacraments-baptism-en']

export type { ReviewTag, ReviewField, ReviewSource, ReviewArtwork, ReviewRow } from '../../src/lib/play/localReviewTypes'

const text = (value: any) => ({ en: String(value?.en ?? ''), am: String(value?.am ?? '') })
const field = (label: string, value: any): ReviewField => ({ label, ...text(value) })
const hasAmharic = (value: unknown): boolean => {
  if (!value || typeof value !== 'object') return false
  if (Array.isArray(value)) return value.some(hasAmharic)
  const record = value as Record<string, unknown>
  if (typeof record.am === 'string' && record.am.trim()) return true
  return Object.values(record).some(hasAmharic)
}
const librarySlug = (route: string) => /^\/library\/read\/([^/?#]+)/.exec(route)?.[1] ?? ''

const CONTENT_TYPE: Record<string, string> = {
  trivia: 'Multiple-choice question', emoji: 'Emoji clue question', 'finish-the-verse': 'Finish-the-verse excerpt', history: 'History question',
  'who-am-i': 'Who Am I? card', match: 'Match pair', 'bible-timeline': 'Timeline chain', adventures: 'Adventure story',
  feasts: 'Feast picture deck', saints: 'Saint picture deck', 'icon-memory': 'Icon memory deck',
}

function describe(candidate: Candidate): Pick<ReviewRow, 'title' | 'fields' | 'artwork'> & { sources: any[]; amharic: boolean } {
  const payload: any = candidate.draft.payload
  const content = payload?.draft?.content
  const none: ReviewArtwork = { status: 'No artwork for this content type', items: [] }
  const sources: any[] = candidate.draft.source_references as any[]
  switch (candidate.game) {
    case 'trivia': case 'emoji': case 'finish-the-verse': case 'history': {
      if (candidate.game === 'history' && payload?.format === 'studio-activity-v1') {
        // The History Quest "Timeline Challenge" chronology: events with years, not a multiple-choice question.
        const events: any[] = Array.isArray(content) ? content : []
        return {
          title: `History chronology (${events.length} events)`, artwork: none, sources, amharic: hasAmharic(content),
          fields: events.map((event, index) => ({ label: `Event ${index + 1} · ${event.year}`, ...text(event.label) })),
        }
      }
      const q = payload
      const fields: ReviewField[] = []
      if (q.emoji) fields.push({ label: 'Emoji clue', en: q.emoji, am: q.emoji })
      fields.push(field('Prompt', q.prompt))
      if (q.excerpt) fields.push(field('Excerpt', q.excerpt))
      for (const option of q.options ?? []) fields.push(field(`Option ${option.key}${option.key === q.correctKey ? ' (correct)' : ''}`, option.text))
      const correct = (q.options ?? []).find((option: any) => option.key === q.correctKey)
      fields.push(field('Correct answer', correct?.text))
      for (const [index, hint] of (q.hints ?? []).entries()) fields.push(field(`Hint ${index + 1}`, hint))
      fields.push(field('Explanation', q.explanation))
      return { title: q.prompt?.en ?? candidate.draft.stable_id, fields, artwork: none, sources, amharic: hasAmharic(q) }
    }
    case 'who-am-i':
      return { title: content.answer?.en, fields: [field('Answer (hidden from the guesser)', content.answer), field('Clue / explanation', content.explanation), { label: 'Category', en: content.category, am: '' }], artwork: none, sources, amharic: hasAmharic(content) }
    case 'match':
      return { title: `${content[0].left?.en} ↔ ${content[0].right?.en}`, fields: [field('Left card', content[0].left), field('Right card', content[0].right), field('Why they match', content[0].explanation)], artwork: none, sources, amharic: hasAmharic(content) }
    case 'bible-timeline':
      return {
        title: content.title?.en, artwork: none, sources, amharic: hasAmharic(content),
        fields: [field('Timeline', content.title), ...content.events.map((event: any, index: number) => ({ ...field(`Event ${index + 1} (${event.ref})`, event.title), }))],
      }
    case 'adventures':
      return {
        title: content.title?.en, sources, amharic: hasAmharic(content),
        artwork: { status: `Built-in illustrated scenes (art: ${content.art}); no external image files`, items: [] },
        fields: [field('Story', content.title), field('Summary', content.summary), { label: 'Passage', en: String(content.passage ?? ''), am: '' },
          ...content.scenes.map((scene: any, index: number) => field(`Scene ${index + 1}`, scene.title))],
      }
    case 'feasts': case 'saints': case 'icon-memory': {
      const items = (content as any[]).map((image) => ({ id: image.id, name: image.answer?.en ?? image.id, remote: String(image.src ?? ''), localFallback: String(image.fallbackSrc ?? '') }))
      const missingLocal = items.filter((item) => item.localFallback && !existsSync(join('public', item.localFallback.replace(/^\//, '')))).length
      return {
        title: `${CONTENT_TYPE[candidate.game]} (${items.length} pictures)`, sources, amharic: hasAmharic(content),
        artwork: { status: `${items.length} pictures served from the project's public media bucket; ${items.filter((item) => item.localFallback).length} have a local fallback${missingLocal ? `, ${missingLocal} fallback file(s) missing` : ''}`, items },
        fields: (content as any[]).map((image, index) => ({ label: `Picture ${index + 1}${image.when ? ` · ${image.when}` : ''}`, ...text(image.answer) })),
      }
    }
    default:
      return { title: candidate.draft.stable_id, fields: [], artwork: none, sources, amharic: false }
  }
}

export async function buildReviewInventory() {
  const { candidates, excluded, downgraded } = await buildConsolidation()
  const downgradedIds = new Set(downgraded.map((item) => item.id))
  const rows: ReviewRow[] = candidates.map((candidate) => {
    const info = describe(candidate)
    const payload: any = candidate.draft.payload
    const verified: string[] = payload?.verifiedLocales ?? payload?.draft?.content?.verifiedLocales ?? []
    const generated = candidate.origin.includes('/generated/')
    const sources: ReviewSource[] = info.sources.map((source) => {
      const slug = source.kind === 'church-library' ? librarySlug(source.route) : ''
      const blocked = source.kind === 'church-library' && !PUBLISHED_LIBRARY_SLUGS.includes(slug)
      return { label: source.label, route: source.route, kind: source.kind, blocked, ...(blocked ? { note: `Church Library book "${slug}" is not published, so this record cannot be published yet.` } : {}) }
    })
    const tags: ReviewTag[] = [generated ? 'generated-draft' : 'existing-bundled']
    if (candidate.errors.length) tags.push('invalid')
    if (sources.some((source) => source.blocked)) tags.push('source-blocked')
    if (generated || sources.some((source) => source.blocked)) tags.push('editorial-review')
    if (info.amharic && !verified.includes('am')) tags.push('translation-review')
    if (!info.amharic) tags.push('no-amharic')
    if (downgradedIds.has(candidate.draft.stable_id)) tags.push('downgraded-amharic')
    return {
      id: candidate.draft.stable_id, game: candidate.game, title: info.title, contentType: CONTENT_TYPE[candidate.game] ?? candidate.game,
      difficulty: candidate.draft.difficulty, category: candidate.draft.category, fields: info.fields, sources, artwork: info.artwork,
      provenance: { origin: candidate.origin, kind: generated ? 'generated' : 'bundled' },
      reviewState: generated
        ? 'Draft (local only). Generated and validated by the build script; human editorial review required before it can be published.'
        : 'Draft (local only). Bundled in the app and already shown to visitors; not yet reviewed through the database workflow.',
      rights: info.artwork.items.length
        ? 'Not recorded in the draft. Artwork licence/ownership must be confirmed by the content owner before publication.'
        : 'Not recorded in the draft. Source text is referenced, not copied; rights owner confirmation is still required.',
      problems: candidate.errors, tags,
    }
  })
  return { generatedAt: new Date().toISOString(), rows, excluded, downgraded }
}

const main = process.argv[1]?.replace(/\\/g, '/').endsWith('build-local-review-inventory.ts')
if (main) {
  const inventory = await buildReviewInventory()
  mkdirSync('.local-preview', { recursive: true })
  writeFileSync(join('.local-preview', 'review-inventory.json'), JSON.stringify(inventory))
  const by = (tag: ReviewTag) => inventory.rows.filter((row) => row.tags.includes(tag)).length
  console.log(`Local review inventory: ${inventory.rows.length} rows -> .local-preview/review-inventory.json (git-ignored)`)
  console.log(`  existing bundled ${by('existing-bundled')}, generated drafts ${by('generated-draft')}, source-blocked ${by('source-blocked')}, editorial review ${by('editorial-review')}, translation review ${by('translation-review')}, no Amharic ${by('no-amharic')}, invalid ${by('invalid')}`)
}
