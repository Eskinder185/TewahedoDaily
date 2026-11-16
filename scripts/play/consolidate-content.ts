/* eslint-disable @typescript-eslint/no-explicit-any -- heterogeneous game payloads are validated by validateLibraryDraft before use */
/**
 * Faith Challenges consolidation: bundled approved content -> play_content_items rows.
 *
 *   npx tsx scripts/play/consolidate-content.ts                         # offline dry run: inventory + validation
 *   npx tsx scripts/play/consolidate-content.ts --compare               # also read existing rows (anon = published only)
 *   npx tsx scripts/play/consolidate-content.ts --apply --project-ref <ref> --backup <new-file.json> [--status published]
 *
 * Rules enforced here:
 *  - Source = the bundled approved banks only (src/lib/play/approvedContent.ts, bibleTimeline.ts, bibleAdventureStories.ts,
 *    imageCatalog.ts and the build-published-bank output in src/lib/play/generated/*.json). Nothing is invented or translated.
 *  - Stable identifiers: quiz rows keep their question ID; activity rows use `legacy-<game>-<id>` (existing convention).
 *  - Insert-only and idempotent: a stable_id that already exists is never updated or deleted. A different payload for an
 *    existing ID is reported as a conflict (CMS edits win).
 *  - --apply needs server-side SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY, the matching --project-ref, and a new backup file
 *    (existing rows for the affected IDs are exported before any write). Credentials are never printed.
 *  - Default status is `draft`. `--status published` is explicit; it records provenance in review_notes and only the rows
 *    that validated are written. Verified Amharic is never claimed: generated Amharic stays verifiedLocales ['en'].
 */
import { createHash } from 'node:crypto'
import { existsSync, writeFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'
import { pathToFileURL } from 'node:url'

// Image decks embed media URLs resolved from the Supabase origin, and the app re-validates them: they must be generated for the TARGET project.
if (process.argv.includes('--apply') && process.env.SUPABASE_URL) process.env.VITE_SUPABASE_URL = process.env.SUPABASE_URL
process.env.VITE_SUPABASE_URL ||= process.env.SUPABASE_URL || 'https://offline.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'offline-no-network'
const { preparePlayContentMigration } = await import('../prepare-play-content-migration')
const { toStudioActivityDraft, validateLibraryDraft } = await import('../../src/lib/play/studioActivity')
const { PLAY_IMAGES } = await import('../../src/lib/play/imageCatalog')
type QuestionDraft = import('../../src/lib/play/questionLibrary').QuestionDraft
type StudioDraft = import('../../src/lib/play/contentStudio').StudioDraft
type StudioRecord = import('../../src/lib/play/contentStudio').StudioRecord

const read = async (name: string) => (await import(`../../src/lib/play/generated/${name}.json`, { with: { type: 'json' } })).default as any[]
const hash = (value: unknown) => createHash('sha256').update(JSON.stringify(value)).digest('hex')

export type Candidate = { game: string; origin: string; draft: QuestionDraft; hash: string; errors: string[] }
export type Excluded = { game: string; id: string; origin: string; reason: string }

type MezmurSong = import('../../src/lib/play/finishMezmur').MezmurSong
/** `songs`: published hymns chosen by the caller (slugs only are stored; lyrics are never copied into the game table). */
export async function buildConsolidation(options: { mezmurSongs?: MezmurSong[] } = {}) {
  const base = preparePlayContentMigration()
  const candidates: Candidate[] = []
  const excluded: Excluded[] = []
  const downgraded: Excluded[] = []
  const seen = new Set<string>()
  const push = (origin: string, draft: QuestionDraft) => {
    const errors = validateLibraryDraft(draft)
    if (seen.has(draft.stable_id)) { excluded.push({ game: draft.game_type, id: draft.stable_id, origin, reason: 'duplicate stable ID (built-in wins)' }); return }
    seen.add(draft.stable_id)
    candidates.push({ game: draft.game_type, origin, draft, hash: hash(draft), errors })
  }
  // 1. Built-in approved content, exactly as the existing offline manifest prepares it.
  for (const item of base.candidates) {
    // Built-in cards that claim reviewed Amharic but have no Amharic explanation: do not invent text; mark Amharic unreviewed.
    const content = (item.draft.payload as any)?.draft?.content
    if (item.draft.game_type === 'who-am-i' && content?.verifiedLocales?.includes('am') && !content.explanation?.am) {
      content.verifiedLocales = ['en']
      downgraded.push({ game: 'who-am-i', id: item.draft.stable_id, origin: item.source, reason: 'built-in card claimed reviewed Amharic without an Amharic explanation; imported with verifiedLocales [en]' })
    }
    push(item.source, item.draft)
  }

  const activity = (origin: string, game: string, id: string, draft: StudioDraft, category: string, difficulty: 'beginner' | 'growing' | 'challenge' = 'beginner') => {
    const record = { version: 1, id: '00000000-0000-4000-8000-000000000001', stableId: `legacy-${game}-${id}`.slice(0, 160), owner: 'consolidation', name: `Existing ${game}: ${id}`,
      status: 'draft', updatedAt: '2026-11-16T00:00:00Z', category, difficulty, draft } as StudioRecord
    push(origin, toStudioActivityDraft(record))
  }
  // 2. Generated, ledger-published bank (validated + Bible-grounded at build time; Amharic unreviewed => verifiedLocales ['en']).
  for (const [file, game] of [['trivia', 'trivia'], ['emoji', 'emoji'], ['finish-the-verse', 'finish-the-verse']] as const) {
    for (const q of await read(file)) {
      push(`src/lib/play/generated/${file}.json`, { stable_id: q.id, game_type: game, category: q.category, difficulty: q.difficulty, payload: structuredClone(q), source_references: [q.source] })
    }
  }
  for (const card of await read('who-am-i')) activity('src/lib/play/generated/who-am-i.json', 'who-am-i', card.id, { game: 'who-am-i', content: structuredClone(card) }, card.category)
  for (const pair of await read('match')) activity('src/lib/play/generated/match.json', 'match', pair.id, { game: 'match', content: [structuredClone(pair)] }, pair.category)
  for (const chain of await read('timeline')) activity('src/lib/play/generated/timeline.json', 'bible-timeline', chain.id, { game: 'bible-timeline', content: structuredClone(chain) }, 'bible-timeline')

  // 2b. Finish the Mezmur: source-only selections of published hymns (never copies lyrics).
  for (const song of options.mezmurSongs ?? []) activity('mezmur_public (published hymn source)', 'finish-the-mezmur', song.slug, { game: 'finish-the-mezmur', content: structuredClone(song) } as StudioDraft, 'mezmur')
  // 3. Relationship checks: every referenced image must exist in the approved image catalog.
  const imageIds = new Set(PLAY_IMAGES.map(image => image.id))
  for (const item of candidates) {
    const content = (item.draft.payload as any)?.draft?.content
    const images: any[] = ['feasts', 'saints', 'icon-memory'].includes(item.game) && Array.isArray(content) ? content : []
    for (const image of images) if (!imageIds.has(image.id)) item.errors.push(`Image ${image.id} is not in the approved catalog.`)
  }
  const valid = candidates.filter(item => !item.errors.length)
  for (const item of candidates.filter(item => item.errors.length)) excluded.push({ game: item.game, id: item.draft.stable_id, origin: item.origin, reason: item.errors.join(' ') })
  for (const item of base.blocked.filter(entry => !(entry.game === 'finish-the-mezmur' && options.mezmurSongs?.length))) excluded.push({ game: item.game, id: '(game)', origin: 'prepare-play-content-migration', reason: item.reason })
  return { candidates, valid, excluded, downgraded }
}

/** Playable unit counts, using the same units the hub shows. */
export function unitCounts(rows: { game: string; draft: QuestionDraft }[]) {
  const out: Record<string, { rows: number; units: number; unit: string; events?: number }> = {}
  for (const { game, draft } of rows) {
    const content = (draft.payload as any)?.draft?.content
    const entry = (out[game] ||= { rows: 0, units: 0, unit: { match: 'pairs', 'finish-the-mezmur': 'songs', 'who-am-i': 'cards', 'bible-timeline': 'chains', adventures: 'stories', history: 'questions', feasts: 'decks', saints: 'decks', 'icon-memory': 'sets' }[game] || 'questions' })
    entry.rows++
    if (game === 'bible-timeline') { entry.units++; entry.events = (entry.events ?? 0) + (content?.events?.length ?? 0) }
    else if (game === 'match') entry.units += content?.length ?? 1
    else if (game === 'history' && Array.isArray(content) && content[0]?.year !== undefined) entry.units += 0
    else entry.units++
  }
  return out
}

const main = !!process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href
if (main) {
  const args = process.argv.slice(2)
  const flag = (name: string) => args.includes(name)
  const value = (name: string) => { const i = args.indexOf(name); return i >= 0 ? args[i + 1] : undefined }
  const apply = flag('--apply')
  const status = (value('--status') || 'draft') as 'draft' | 'published'
  if (!['draft', 'published'].includes(status)) throw new Error('--status must be draft or published.')
  let mezmurSongs: MezmurSong[] = []
  if (flag('--include-mezmur')) {
    const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
    const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_PUBLISHABLE_KEY
    if (!url || !key) throw new Error('--include-mezmur reads the public mezmur_public projection; set VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY.')
    const { usableLines } = await import('../../src/lib/play/finishMezmur')
    const reader = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })
    const found: MezmurSong[] = []
    for (let from = 0; from < 3000; from += 500) {
      const { data, error } = await reader.from('mezmur_public').select('slug,title,title_amharic,title_english,primary_language,lyrics_amharic,lyrics_english,lyrics_transliteration,youtube_url')
        .eq('status', 'published').not('lyrics_amharic', 'is', null).order('slug', { ascending: true }).range(from, from + 499)
      if (error) throw new Error(`mezmur_public read failed: ${error.message}`)
      found.push(...(data as MezmurSong[]))
      if (!data || data.length < 500) break
    }
    mezmurSongs = found.filter(song => /^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(song.slug) && usableLines(song).length >= 5).slice(0, 100)
    console.log(`Finish the Mezmur: ${found.length} published hymns read; ${mezmurSongs.length} selected (>=5 usable lines, slug order, max 100 per the reader's request guard).`)
  }
  const { candidates, valid, excluded, downgraded } = await buildConsolidation({ mezmurSongs })
  const counts = unitCounts(valid)
  console.log(`Candidates: ${candidates.length}; valid: ${valid.length}; excluded: ${excluded.filter(item => item.id !== '(game)').length}`)
  console.table(Object.fromEntries(Object.entries(counts).map(([game, c]) => [game, { rows: c.rows, [c.unit]: c.units, ...(c.events ? { events: c.events } : {}) }])))
  for (const item of downgraded) console.log(`  downgraded ${item.id}: ${item.reason}`)
  const byReason = new Map<string, number>()
  for (const item of excluded) byReason.set(`${item.game}: ${item.reason}`, (byReason.get(`${item.game}: ${item.reason}`) ?? 0) + 1)
  for (const [reason, n] of byReason) console.log(`  excluded ${n} × ${reason}`)
  if (value('--manifest')) {
    if (existsSync(value('--manifest')!)) throw new Error('Refusing to overwrite an existing manifest file.')
    writeFileSync(value('--manifest')!, JSON.stringify({ version: 1, kind: 'faith-challenges-consolidation', generatedFrom: 'bundled approved banks', rows: valid.map(item => ({ origin: item.origin, hash: item.hash, ...item.draft })), excluded, downgraded }, null, 2) + '\n', { flag: 'wx' })
    console.log(`Wrote manifest ${value('--manifest')}`)
  }
  if (flag('--compare') || apply) {
    const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
    const key = apply ? process.env.SUPABASE_SERVICE_ROLE_KEY : (process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_PUBLISHABLE_KEY)
    if (!url || !key || url.includes('offline.invalid')) throw new Error(apply ? 'SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are required for --apply (server-side only).' : 'Set VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY (or server credentials) for --compare.')
    const ref = new URL(url).hostname.split('.')[0]
    console.log(`Target project: ${ref} (${process.env.SUPABASE_SERVICE_ROLE_KEY ? 'server key' : 'public anon key: published rows only'})`)
    const client = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })
    const existing = new Map<string, any>()
    const ids = valid.map(item => item.draft.stable_id)
    for (let i = 0; i < ids.length; i += 80) {
      const { data, error } = await client.from('play_content_items').select('*').in('stable_id', ids.slice(i, i + 80))
      if (error) throw new Error(`Existing-row read failed: ${error.message}`)
      for (const row of data ?? []) existing.set(row.stable_id, row)
    }
    const conflicts = valid.filter(item => existing.has(item.draft.stable_id) && hash((existing.get(item.draft.stable_id)).payload) !== hash(item.draft.payload))
    const present = valid.filter(item => existing.has(item.draft.stable_id))
    const toInsert = valid.filter(item => !existing.has(item.draft.stable_id))
    console.log(`Existing rows visible with these IDs: ${present.length} (payload conflicts: ${conflicts.length}); would insert: ${toInsert.length}`)
    for (const item of conflicts.slice(0, 20)) console.log(`  CONFLICT ${item.draft.stable_id}: existing payload differs; left untouched`)
    // Source availability: items citing an unpublished Church Library book are hidden from visitors (legacy and database mode alike).
    const books = await client.from('church_library_books').select('slug').eq('publication_status', 'published')
    if (!books.error && books.data) {
      const published = new Set(books.data.map((row: { slug: string }) => row.slug))
      const hidden: Record<string, Record<string, number>> = {}
      for (const item of valid) for (const source of item.draft.source_references as { kind?: string; route?: string }[]) {
        const slug = source.kind === 'church-library' ? source.route?.match(/^\/library\/read\/([^/?#]+)/)?.[1] : undefined
        if (slug && !published.has(slug)) ((hidden[item.game] ||= {})[slug] = (hidden[item.game][slug] ?? 0) + 1)
      }
      console.log(`Published Church Library books visible to visitors: ${[...published].join(', ') || '(none)'}`)
      for (const [game, slugs] of Object.entries(hidden)) console.log(`  HIDDEN from visitors until the book is published — ${game}: ${Object.entries(slugs).map(([slug, n]) => `${n} × ${slug}`).join(', ')}`)
    }
    if (!apply) { console.log('Dry run only. No writes.'); process.exit(0) }
    if (value('--project-ref') !== ref) throw new Error(`--project-ref must equal the target project (${ref}).`)
    const backup = value('--backup')
    if (!backup || existsSync(backup)) throw new Error('Provide --backup <new file>; existing files are never overwritten.')
    writeFileSync(backup, JSON.stringify({ exportedAt: new Date().toISOString(), project: ref, rows: [...existing.values()] }, null, 2), { flag: 'wx' })
    console.log(`Exported ${existing.size} affected existing row(s) to ${backup}`)
    const now = new Date().toISOString()
    const rows = toInsert.map(item => ({
      question_id: item.draft.stable_id, stable_id: item.draft.stable_id, game_type: item.draft.game_type, category: item.draft.category, difficulty: item.draft.difficulty,
      payload: item.draft.payload, source_references: item.draft.source_references, status: status,
      review_notes: `Consolidated from bundled approved content (${item.origin}, sha256 ${item.hash.slice(0, 16)}) on ${now.slice(0, 10)}. Amharic not marked reviewed unless the payload says so.`,
      ...(status === 'published' ? { published_at: now, reviewed_at: now } : {}),
    }))
    for (let i = 0; i < rows.length; i += 50) {
      const { error } = await client.from('play_content_items').insert(rows.slice(i, i + 50))
      if (error) throw new Error(`Insert failed at batch ${i / 50 + 1}: ${error.message}. Earlier batches remain; re-run to continue (idempotent).`)
    }
    console.log(`Inserted ${rows.length} row(s) as ${status}. Rollback: set these stable_ids back to draft/archived through the review RPC; nothing was deleted or updated.`)
  }
}
