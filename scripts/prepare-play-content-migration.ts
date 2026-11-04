/** Offline review manifest only. Never connects to Supabase or imports/publishes content. */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { pathToFileURL } from 'node:url'
import type { StudioDraft, StudioRecord } from '../src/lib/play/contentStudio'
import type { QuestionDraft } from '../src/lib/play/questionLibrary'

const main = !!process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href
const args = main ? process.argv.slice(2) : []
const flags = new Map<string, string>()
for (let i = 0; i < args.length; i += 2) {
  if (!['--out', '--media-origin'].includes(args[i]) || !args[i + 1] || flags.has(args[i])) throw new Error('Use --media-origin <public-https-origin> [--out <new-review-manifest.json>].')
  flags.set(args[i], args[i + 1])
}
if (flags.has('--media-origin')) {
  const origin = new URL(flags.get('--media-origin')!)
  if (origin.protocol !== 'https:' || origin.username || origin.password || origin.pathname !== '/' || origin.search || origin.hash) throw new Error('Provide only a public HTTPS media origin, without credentials or query parameters.')
  process.env.VITE_SUPABASE_URL = origin.origin
}
if (!process.env.VITE_SUPABASE_URL) throw new Error('Offline media resolution needs --media-origin <public-https-origin>. No network connection will be made.')
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'offline-review-no-network'
const { APPROVED_QUESTIONS, HISTORY_TIMELINE, MATCH_PAIRS, WHO_AM_I_CARDS } = await import('../src/lib/play/approvedContent')
const { TIMELINE_CHAINS } = await import('../src/lib/play/bibleTimeline')
const { PLAY_IMAGES } = await import('../src/lib/play/imageCatalog')
const { bibleAdventureStories } = await import('../src/lib/play/bibleAdventureStories')
const { toStudioActivityDraft, validateLibraryDraft } = await import('../src/lib/play/studioActivity')

const hash = (value: unknown) => createHash('sha256').update(JSON.stringify(value)).digest('hex')
export function preparePlayContentMigration() {
  const candidates: { source: string; draft: QuestionDraft; sourceHash: string; validationErrors: string[]; status: 'draft'; editorialReviewRequired: true; rightsStatus: 'unverified'; importAllowed: false }[] = []
  const add = (source: string, draft: QuestionDraft) => candidates.push({ source, draft, sourceHash: hash(draft), validationErrors: validateLibraryDraft(draft), status: 'draft', editorialReviewRequired: true, rightsStatus: 'unverified', importAllowed: false })
  for (const question of APPROVED_QUESTIONS) {
    if (!['history', 'trivia', 'emoji', 'finish-the-verse'].includes(question.game)) continue
    add('src/lib/play/approvedContent.ts', { stable_id: question.id, game_type: question.game, category: question.category, difficulty: question.difficulty, payload: structuredClone(question) as unknown as Record<string, unknown>, source_references: [question.source] })
  }
  const activity = (source: string, key: string, draft: StudioDraft) => {
    const record: StudioRecord = { version: 1, id: '00000000-0000-4000-8000-000000000001', stableId: `legacy-${draft.game}-${key}`, owner: 'offline-review', name: `Existing ${draft.game}: ${key}`, status: 'draft', updatedAt: '2026-11-04T00:00:00Z', draft }
    add(source, toStudioActivityDraft(record))
  }
  WHO_AM_I_CARDS.forEach(card => activity('src/lib/play/approvedContent.ts', card.id, { game: 'who-am-i', content: structuredClone(card) }))
  MATCH_PAIRS.forEach(pair => activity('src/lib/play/approvedContent.ts', pair.id, { game: 'match', content: [structuredClone(pair)] }))
  activity('src/lib/play/approvedContent.ts', 'chronology', { game: 'history', format: 'timeline', content: structuredClone(HISTORY_TIMELINE) })
  TIMELINE_CHAINS.forEach(chain => activity('src/lib/play/bibleTimeline.ts', chain.id, { game: 'bible-timeline', content: structuredClone(chain) }))
  bibleAdventureStories.forEach(story => activity('src/lib/play/bibleAdventureStories.ts', story.id, { game: 'adventures', content: structuredClone(story) }))
  const blocked: { game: string; reason: string; ids: string[] }[] = []
  for (const game of ['feasts', 'saints', 'icon-memory'] as const) {
    const pool = PLAY_IMAGES.filter(image => game === 'feasts' ? image.kind === 'feast' : game === 'saints' ? image.kind !== 'feast' : true)
    let start = 0
    while (start < pool.length) {
      let size = Math.min(game === 'icon-memory' ? 8 : 12, pool.length - start)
      if (game === 'icon-memory' && size % 2) size--
      if (pool.length - start - size > 0 && pool.length - start - size < 4) size -= game === 'icon-memory' ? 4 : 4 - (pool.length - start - size)
      if (size < 4) { blocked.push({ game, reason: 'Remaining images cannot form a unique supported deck; requires editorial grouping.', ids: pool.slice(start).map(image => image.id) }); break }
      const images = structuredClone(pool.slice(start, start + size))
      activity('src/lib/play/imageCatalog.ts', images.map(image => image.id).join('-').slice(0, 100), { game, content: images })
      start += size
    }
  }
  blocked.push({ game: 'finish-the-mezmur', reason: 'Already database-derived. Authorized editors must select reviewed, public lyric sources; never copy or modify hymn source records.', ids: [] })
  blocked.push({ game: 'game-night', reason: 'Keep questions in the existing private bank and redacted RPC flow. Never import private answers into the public content table.', ids: [] })
  if (new Set(candidates.map(item => item.draft.stable_id)).size !== candidates.length) throw new Error('Migration identifiers collide; no import is allowed.')
  return { version: 1, kind: 'faith-challenges-offline-review-manifest', importEnabled: false, candidates, blocked }
}
if (main) {
  const manifest = preparePlayContentMigration()
  if (flags.has('--out')) writeFileSync(flags.get('--out')!, JSON.stringify(manifest, null, 2) + '\n', { flag: 'wx' })
  console.log(JSON.stringify({ mode: 'offline-review-only', candidates: manifest.candidates.length, valid: manifest.candidates.filter(item => !item.validationErrors.length).length, invalid: manifest.candidates.filter(item => item.validationErrors.length).length, importEnabled: false, blocked: manifest.blocked }))
}
