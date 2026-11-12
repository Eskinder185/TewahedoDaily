/* eslint-disable @typescript-eslint/no-explicit-any -- operates on untyped JSON fixtures/drafts */
/**
 * Repeatable publishing pipeline for generated Faith Challenge drafts.
 *
 * Reads local draft collections (artifacts/faith-challenges/**), validates every item with the app's own
 * validators, checks scripture grounding against the repository's Bible text, removes exact and near-duplicate
 * items (including items already built into the app), and writes the PUBLISHABLE subset to
 * src/lib/play/generated/*.json plus a ledger of published / duplicate / rejected / unresolved items.
 *
 * Safe to re-run: output is a pure function of the inputs (stable ordering, existing IDs preserved, no network,
 * no database writes). Run: npx tsx scripts/play/build-published-bank.ts [--check]
 */
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'

process.env.VITE_SUPABASE_URL ||= 'https://bank-builder.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'synthetic-public-key'
const { APPROVED_QUESTIONS, MATCH_PAIRS, WHO_AM_I_CARDS } = await import('../../src/lib/play/approvedContent.ts')
const { validateQuestionDraft } = await import('../../src/lib/play/questionLibrary.ts')
const { validateCardContent } = await import('../../src/lib/play/cardContent.ts')

const ROOT = 'artifacts/faith-challenges'
const OUT = 'src/lib/play/generated'
const LEDGER = 'docs/ai/faith-challenges-publication-ledger.json' // audit record; not bundled into the app
const CHECK = process.argv.includes('--check')

type Json = Record<string, any>
type Verdict = { id: string; game: string; origin: string; status: 'published' | 'duplicate' | 'rejected' | 'unresolved'; reason?: string }
const ledger: Verdict[] = []
const read = (path: string): any => JSON.parse(readFileSync(path, 'utf8'))

// ---------------------------------------------------------------- Bible corpus (both editions) for grounding
function parseCsv(path: string): Json[] {
  const text = readFileSync(path, 'utf8').replace(/\r/g, '')
  const rows: string[][] = []
  let row: string[] = [], field = '', quoted = false
  for (let i = 0; i < text.length; i++) {
    const c = text[i]
    if (quoted) { if (c === '"' && text[i + 1] === '"') { field += '"'; i++ } else if (c === '"') quoted = false; else field += c }
    else if (c === '"') quoted = true
    else if (c === ',') { row.push(field); field = '' }
    else if (c === '\n') { row.push(field); rows.push(row); row = []; field = '' }
    else field += c
  }
  const [header, ...body] = rows.filter(r => r.length > 1)
  return body.map(r => Object.fromEntries(header.map((h, i) => [h, r[i]])))
}
const fold = (s: string) => s.normalize('NFKC').toLowerCase().replace(/[‘’']/g, '').replace(/[^\p{L}\p{N}]+/gu, ' ').trim().replace(/\s+/g, ' ')
const bibleDir = 'artifacts/bible-csv'
const editions = new Map(parseCsv(`${bibleDir}/00-bible_editions.csv`).map(r => [r.id, r.code]))
const books = new Map(parseCsv(`${bibleDir}/01-bible_canonical_books.csv`).map(r => [r.id, r.slug]))
const sourceBook = new Map(parseCsv(`${bibleDir}/02-bible_source_books.csv`).map(r => [r.id, r]))
const chapters = parseCsv(`${bibleDir}/03-bible_chapters.csv`)
// Reader chapter ordinal: chapters of a canonical book are numbered across all of its volumes in source order
// (so 2 Samuel 1 is /bible/samuel/32). Draft routes that name a volume ("1-kings") are remapped to this.
const groups = new Map<string, Array<{ id: string; volume: number; order: number }>>()
for (const r of chapters) {
  const src = sourceBook.get(r.source_book_id)!
  const key = `${books.get(src.canonical_book_id)}|${editions.get(src.edition_id)}`
  groups.set(key, [...(groups.get(key) || []), { id: r.id, volume: Number(src.source_order), order: Number(r.source_order) }])
}
const chapterInfo = new Map<string, { slug: string; edition: string; number: number }>()
const volumeStart = new Map<string, { slug: string; offset: number }>() // `${edition}|${volume slug}` -> canonical slug + chapters before it
for (const [key, list] of groups) {
  const [slug, edition] = key.split('|')
  list.sort((a, b) => a.volume - b.volume || a.order - b.order)
  list.forEach((c, i) => chapterInfo.set(c.id, { slug, edition, number: i + 1 }))
}
const slugify = (s: string) => fold(s).replace(/ /g, '-')
for (const src of sourceBook.values()) {
  if (editions.get(src.edition_id) !== 'web') continue
  const slug = books.get(src.canonical_book_id)!
  const before = chapters.filter(c => { const sb = sourceBook.get(c.source_book_id)!; return sb.canonical_book_id === src.canonical_book_id && editions.get(sb.edition_id) === 'web' && Number(sb.source_order) < Number(src.source_order) }).length
  volumeStart.set(slugify(src.source_name_en), { slug, offset: before })
}
volumeStart.set('song-of-solomon', volumeStart.get('song-of-solomon') || { slug: 'song-of-songs', offset: 0 })
const verseText = new Map<string, { text: string; chapterId: string }>()
const chapterText = new Map<string, string>() // `${slug}|${edition}|${n}` -> text
for (const file of readdirSync(bibleDir).filter(f => /^05-bible_verses-part-\d+\.csv$/.test(f)).sort()) {
  for (const v of parseCsv(join(bibleDir, file))) {
    verseText.set(v.id, { text: v.text, chapterId: v.chapter_id })
    const info = chapterInfo.get(v.chapter_id)
    if (info) { const key = `${info.slug}|${info.edition}|${info.number}`; chapterText.set(key, `${chapterText.get(key) || ''} ${v.text}`) }
  }
}
const bookSlugs = new Set(books.values())
/** `/bible/1-kings/18?edition=web#verse-3` -> `/bible/kings/40...`: the real reader route for that chapter. */
function routeChapter(route: string) {
  const m = route.match(/^\/bible\/([a-z0-9-]+)\/(\d+)/)
  if (!m) return null
  const volume = volumeStart.get(m[1])
  if (volume) return { slug: volume.slug, chapter: volume.offset + Number(m[2]) }
  return { slug: m[1], chapter: Number(m[2]) }
}
function readerRoute(route: string): string {
  const at = routeChapter(route); if (!at) return route
  const tail = route.replace(/^\/bible\/[a-z0-9-]+\/\d+/, '')
  return `/bible/${at.slug}/${at.chapter}${tail}`
}
/** The cited chapter exists in at least one edition. */
const chapterExists = (route: string) => { const at = routeChapter(route); return !!at && bookSlugs.has(at.slug) && ['am', 'web'].some(e => chapterText.has(`${at.slug}|${e}|${at.chapter}`)) }
/** The cited chapter mentions the name: whole phrase in either edition, else a distinctive word (4+ letters). */
const mentions = (route: string, ...phrases: string[]) => {
  const at = routeChapter(route); if (!at) return false
  const texts = ['web', 'am'].map(e => fold(chapterText.get(`${at.slug}|${e}|${at.chapter}`) || ''))
  return phrases.filter(Boolean).some(phrase => {
    const needle = fold(phrase); if (needle.length < 3) return false
    if (texts.some(t => t.includes(needle))) return true
    return needle.split(' ').filter(w => w.length >= 4 && !/^(the|and|with|from|that|this|son|king|saint)$/.test(w)).some(w => texts.some(t => t.includes(w)))
  })
}

// Church Library routes are only real for the documents the built-in games already cite.
const realLibraryRoutes = new Set<string>([...APPROVED_QUESTIONS, ...WHO_AM_I_CARDS, ...MATCH_PAIRS].map(i => i.source).filter(s => s.kind === 'church-library').map(s => s.route.split('#')[0]))

// ---------------------------------------------------------------- duplicate detection
const tokens = (s: string) => new Set(fold(s).split(' ').filter(w => w.length > 2))
const jaccard = (a: Set<string>, b: Set<string>) => { let n = 0; for (const x of a) if (b.has(x)) n++; return n / (a.size + b.size - n || 1) }
class Seen {
  ids = new Set<string>(); keys = new Set<string>(); sets: Array<{ id: string; t: Set<string> }> = []
  find(id: string, key: string, text: string, near = 0.9): string | null {
    if (this.ids.has(id)) return `duplicate ID ${id}`
    if (this.keys.has(key)) return 'exact duplicate of already-published content'
    const t = tokens(text)
    if (t.size >= 4) for (const other of this.sets) if (jaccard(t, other.t) >= near) return `substantially equivalent to ${other.id}`
    return null
  }
  add(id: string, key: string, text: string) { this.ids.add(id); this.keys.add(key); this.sets.push({ id, t: tokens(text) }) }
}
const mark = (id: string, game: string, origin: string, status: Verdict['status'], reason?: string) => ledger.push({ id, game, origin, status, reason })

// ---------------------------------------------------------------- collect quiz-style drafts
type QuizCandidate = { q: Json; origin: string; provenance?: Json }
const quiz: QuizCandidate[] = []
for (const dir of readdirSync(ROOT).filter(d => /^batch-\d+$/.test(d)).sort()) {
  const file = join(ROOT, dir, 'drafts.json')
  if (!existsSync(file)) continue
  for (const d of read(file).drafts || []) quiz.push({ q: d.question, origin: dir, provenance: d.provenance })
}
for (const tier of ['.', 'phase-2', 'phase-3']) for (const game of ['emoji', 'history']) {
  const file = tier === '.' ? join(ROOT, game, 'questions.json') : join(ROOT, tier, game, 'questions.json')
  if (existsSync(file)) for (const q of read(file)) quiz.push({ q, origin: `${tier === '.' ? 'phase-1' : tier}/${game}` })
}
const questionOut: Record<string, Json[]> = { trivia: [], 'finish-the-verse': [], emoji: [] }
const questionSeen = new Seen()
for (const q of APPROVED_QUESTIONS) questionSeen.add(q.id, `${q.game}|${fold(q.prompt.en)}|${q.emoji || ''}`, `${q.prompt.en} ${q.excerpt?.en || ''}`)

const resolvedGame = (q: Json) => q.game === 'finish-the-verse' || (q.excerpt && q.game === 'trivia' && /complete the verse/i.test(q.prompt?.en || '')) ? 'finish-the-verse' : q.game
for (const { q, origin, provenance } of quiz.sort((a, b) => a.q.id.localeCompare(b.q.id))) {
  const game = String(resolvedGame(q))
  const id = String(q.id)
  if (game === 'history') { handleHistory(q, origin); continue }
  if (!['trivia', 'finish-the-verse', 'emoji'].includes(game)) { mark(id, game, origin, 'rejected', 'unsupported game type'); continue }
  const candidate: Json = { ...q, game, verifiedLocales: ['en'] }
  delete candidate.status; delete candidate.provenance
  const errors = validateQuestionDraft({ stable_id: id, game_type: game as any, category: q.category, difficulty: q.difficulty, payload: candidate, source_references: [q.source] })
  if (errors.length) { mark(id, game, origin, 'rejected', `validation: ${errors[0]}`); continue }
  if (q.source?.kind !== 'bible' || !chapterExists(q.source.route)) { mark(id, game, origin, 'unresolved', 'cited Bible chapter not found in the repository Bible text'); continue }
  if (provenance) {
    const missing = (provenance.verseIds || []).filter((v: string) => !verseText.has(v))
    if (!provenance.verseIds?.length || missing.length) { mark(id, game, origin, 'unresolved', 'provenance verse IDs are not in the Bible text'); continue }
    if (game === 'finish-the-verse') {
      const verse = fold((provenance.verseIds as string[]).map(v => verseText.get(v)!.text).join(' '))
      const excerpt = q.excerpt?.am ? fold(q.excerpt.am) : ''
      if (excerpt && !verse.includes(excerpt)) { mark(id, game, origin, 'unresolved', 'excerpt is not found in the cited verse text'); continue }
    }
  }
  if (q.options.some((o: Json) => !o.text?.en) || new Set(q.options.map((o: Json) => fold(o.text.en))).size !== q.options.length) { mark(id, game, origin, 'rejected', 'options are empty or not distinct'); continue }
  const key = `${game}|${fold(q.prompt.en)}|${q.emoji || ''}`
  const dup = questionSeen.find(id, key, `${q.prompt.en} ${q.excerpt?.en || ''} ${q.emoji || ''} ${q.options.find((o: Json) => o.key === q.correctKey)?.text.en}`, game === 'emoji' ? 0.95 : 0.9)
  if (dup) { mark(id, game, origin, 'duplicate', dup); continue }
  questionSeen.add(id, key, `${q.prompt.en} ${q.excerpt?.en || ''} ${q.emoji || ''} ${q.options.find((o: Json) => o.key === q.correctKey)?.text.en}`)
  questionOut[game].push({ ...candidate, source: { ...candidate.source, route: readerRoute(candidate.source.route) } })
  mark(id, game, origin, 'published')
}
function handleHistory(q: Json, origin: string) {
  const id = String(q.id)
  // History drafts cite Church Library routes. Only routes the public library really serves are verifiable.
  const route = String(q.source?.route || '').split('#')[0]
  if (q.source?.kind === 'church-library' && !realLibraryRoutes.has(route)) { mark(id, 'history', origin, 'unresolved', `cites a Church Library route that is not a known published document (${route})`); return }
  mark(id, 'history', origin, 'unresolved', 'history claims need doctrinal review before publication')
}

// ---------------------------------------------------------------- cards and pairs
const cardOut: Record<string, Json[]> = { 'who-am-i': [], match: [] }
function collect(game: 'who-am-i' | 'match', file: string) { return existsSync(file) ? (read(file) as Json[]) : [] }
const cardSeen = { 'who-am-i': new Seen(), match: new Seen() }
for (const c of WHO_AM_I_CARDS) cardSeen['who-am-i'].add(c.id, `who|${fold(c.answer.en)}`, c.answer.en)
for (const p of MATCH_PAIRS) cardSeen.match.add(p.id, `match|${fold(p.left.en)}|${fold(p.right.en)}`, `${p.left.en} ${p.right.en}`)
for (const [game, name] of [['who-am-i', 'cards.json'], ['match', 'pairs.json']] as const) {
  const items: Array<{ item: Json; origin: string }> = []
  for (const tier of ['.', 'phase-2', 'phase-3']) {
    const file = tier === '.' ? join(ROOT, game, name) : join(ROOT, tier, game, name)
    for (const item of collect(game, file)) items.push({ item, origin: `${tier === '.' ? 'phase-1' : tier}/${game}` })
  }
  for (const { item, origin } of items.sort((a, b) => a.item.id.localeCompare(b.item.id))) {
    const id = String(item.id)
    const card = { ...item, verifiedLocales: ['en'] }
    const errors = validateCardContent(game, card as any)
    if (errors.length) { mark(id, game, origin, 'rejected', `validation: ${errors[0]}`); continue }
    if (item.source.kind !== 'bible') { mark(id, game, origin, 'unresolved', `cites a ${item.source.kind} route that is not verifiable (${item.source.route})`); continue }
    if (!chapterExists(item.source.route)) { mark(id, game, origin, 'unresolved', 'cited Bible chapter not found in the repository Bible text'); continue }
    const subject = game === 'who-am-i' ? item.answer.en : `${item.left.en} ${item.right.en}`
    const parts = game === 'who-am-i' ? [item.answer.en, item.answer.am] : [item.left.en, item.right.en, item.left.am, item.right.am]
    if (!mentions(item.source.route, ...parts)) { mark(id, game, origin, 'unresolved', 'neither name appears in the cited chapter text, so the claim could not be verified'); continue }
    const key = game === 'who-am-i' ? `who|${fold(item.answer.en)}` : `match|${fold(item.left.en)}|${fold(item.right.en)}`
    const dup = cardSeen[game].find(id, key, subject, 0.95)
    if (dup) { mark(id, game, origin, 'duplicate', dup); continue }
    cardSeen[game].add(id, key, subject)
    cardOut[game].push({ ...card, source: { ...card.source, route: readerRoute(card.source.route) } })
    mark(id, game, origin, 'published')
  }
}

// ---------------------------------------------------------------- Bible Timeline chains
// A chain qualifies when: it has 3-12 events with English titles and a reference, every cited chapter exists in the
// repository Bible text, event and chain ids are unique (including the chains built into the app), and consecutive
// events in the same book never run backwards through its chapters (a cheap guard against a shuffled chain).
const { TIMELINE_CHAINS } = await import('../../src/lib/play/bibleTimeline.ts')
const timelineOut: Json[] = []
{
  const seenChains = new Set<string>(TIMELINE_CHAINS.map((chain: Json) => chain.id))
  const seenEvents = new Set<string>(TIMELINE_CHAINS.flatMap((chain: Json) => chain.events.map((event: Json) => event.id)))
  for (const file of ['timeline', 'phase-2/timeline', 'phase-3/timeline']) {
    const path = `${ROOT}/${file}/chains.json`
    if (!existsSync(path)) continue
    for (const chain of read(path) as Json[]) {
      const origin = `${file}/chains.json`
      const events: Json[] = Array.isArray(chain.events) ? chain.events : []
      if (!chain.id || !chain.title?.en) { mark(String(chain.id || '?'), 'bible-timeline', origin, 'rejected', 'validation: chain needs an id and an English title'); continue }
      if (seenChains.has(chain.id)) { mark(chain.id, 'bible-timeline', origin, 'duplicate', 'a chain with this id is already published'); continue }
      if (events.length < 3 || events.length > 12) { mark(chain.id, 'bible-timeline', origin, 'rejected', `validation: ${events.length} events (need 3-12)`); continue }
      const bad = events.find(event => !event.id || !event.title?.en || !event.ref || !chapterExists(event.route) || seenEvents.has(event.id))
      if (bad) { mark(chain.id, 'bible-timeline', origin, 'unresolved', `event ${bad.id || '?'} has a missing field, an unknown Bible chapter or a repeated id`); continue }
      let backwards = false
      for (let i = 1; i < events.length; i++) { const a = routeChapter(events[i - 1].route)!, b = routeChapter(events[i].route)!; if (a.slug === b.slug && b.chapter < a.chapter) backwards = true }
      if (backwards) { mark(chain.id, 'bible-timeline', origin, 'unresolved', 'events run backwards through a book, so the stated order needs human review'); continue }
      seenChains.add(chain.id); for (const event of events) seenEvents.add(event.id)
      timelineOut.push({ ...chain, events: events.map(event => ({ ...event, route: readerRoute(event.route) })) })
      mark(chain.id, 'bible-timeline', origin, 'published')
    }
  }
}

// ---------------------------------------------------------------- output
const published = { ...questionOut, ...cardOut, timeline: timelineOut }
const sortById = (list: Json[]) => [...list].sort((a, b) => a.id.localeCompare(b.id))
const builtIn: Record<string, number> = {
  trivia: APPROVED_QUESTIONS.filter(q => q.game === 'trivia').length, 'finish-the-verse': APPROVED_QUESTIONS.filter(q => q.game === 'finish-the-verse').length,
  emoji: APPROVED_QUESTIONS.filter(q => q.game === 'emoji').length, 'who-am-i': WHO_AM_I_CARDS.length, match: MATCH_PAIRS.length, timeline: TIMELINE_CHAINS.length,
}
const summary: Record<string, Record<string, number>> = {}
for (const v of ledger) { const g = (summary[v.game] ||= { published: 0, duplicate: 0, rejected: 0, unresolved: 0 }); g[v.status]++ }
const outputs: Record<string, string> = {}
for (const [game, list] of Object.entries(published)) outputs[`${game}.json`] = `${JSON.stringify(sortById(list), null, 1)}\n`
const reasons: Record<string, number> = {}
for (const v of ledger.filter(v => v.status !== 'published')) { const k = `${v.status}: ${(v.reason || '').replace(/\(.*\)/, '').replace(/ID \S+/, 'ID').replace(/to \S+$/, 'to <id>')}`; reasons[k] = (reasons[k] || 0) + 1 }
const ledgerBody = `${JSON.stringify({ builtIn, published: Object.fromEntries(Object.entries(published).map(([g, l]) => [g, l.length])), summary, reasons, items: ledger.sort((a, b) => a.id.localeCompare(b.id)) }, null, 1)}\n`
if (CHECK) {
  const stale = [...Object.entries(outputs), [LEDGER, ledgerBody] as [string, string]].filter(([name, body]) => !existsSync(name.includes('/') ? name : join(OUT, name)) || readFileSync(name.includes('/') ? name : join(OUT, name), 'utf8') !== body).map(([name]) => name)
  if (stale.length) { console.error(`Generated bank is out of date: ${stale.join(', ')}. Run: npx tsx scripts/play/build-published-bank.ts`); process.exit(1) }
  console.log('Generated bank is up to date.')
} else {
  mkdirSync(OUT, { recursive: true })
  for (const [name, body] of Object.entries(outputs)) writeFileSync(join(OUT, name), body)
  writeFileSync(LEDGER, ledgerBody)
  console.log(JSON.stringify({ builtIn, published: Object.fromEntries(Object.entries(published).map(([g, l]) => [g, l.length])), summary, reasons }, null, 1))
}
