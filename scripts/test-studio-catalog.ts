/**
 * Faith Challenges public-page-to-CMS integration: shared catalog, built-in content inventory, local game settings,
 * coverage matrix and campaign draft review. Pure functions and fakes only: no network, SQL or Supabase.
 * Run: npx tsx scripts/test-studio-catalog.ts
 */
import assert from 'node:assert/strict'
import { existsSync, readFileSync } from 'node:fs'
process.env.VITE_SUPABASE_URL = 'https://studio-catalog-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'
// Dynamic imports so the media catalog sees the synthetic configuration and no credential files are needed.
const { HUB_GAMES, HUB_SECTIONS, hubGameForStudio, studioIdForHubGame } = await import('../src/lib/play/gameCatalog.ts')
const { GAME_MODES } = await import('../src/lib/play/gameModes.ts')
const { STUDIO_GAMES, isQuizStudioGame, validateStudioDraft } = await import('../src/lib/play/contentStudio.ts')
const { APPROVED_QUESTIONS, MATCH_PAIRS, WHO_AM_I_CARDS } = await import('../src/lib/play/approvedContent.ts')
const { builtInContent, builtInCounts, builtInOrigin, recordFromBuiltIn } = await import('../src/lib/play/staticContent.ts')
const { GAME_LEVELS, defaultSettings, differsFromPublic, exportSettings, publicDefaults, settingsStorage, validateSettings } = await import('../src/lib/play/gameSettings.ts')
const { coverageRows } = await import('../src/lib/play/coverage.ts')
const { importCandidates, locateSource, parseCampaignFile, reviewStorage } = await import('../src/lib/play/campaignDrafts.ts')

let passed = 0
const test = (name: string, fn: () => void) => { fn(); passed += 1; console.log(`PASS ${name}`) }
const memory = () => {
  const data = new Map<string, string>()
  return { getItem: (key: string) => data.get(key) ?? null, setItem: (key: string, value: string) => void data.set(key, value), removeItem: (key: string) => void data.delete(key), data }
}

test('shared catalog: 12 unique public games map one-to-one onto the 12 Studio editors, hub reads the catalog', () => {
  assert.equal(HUB_GAMES.length, 12)
  assert.equal(new Set(HUB_GAMES.map(game => game.id)).size, 12)
  assert.equal(new Set(HUB_GAMES.map(game => game.route)).size, 12)
  assert.deepEqual(new Set(HUB_GAMES.map(game => studioIdForHubGame(game.id))), new Set(STUDIO_GAMES.map(game => game.id)))
  for (const game of HUB_GAMES) {
    assert.ok(game.route.startsWith('/play/'), game.route)
    assert.ok(game.title.en && game.title.am && game.description.en && game.description.am, `${game.id} bilingual text`)
    assert.ok(hubGameForStudio(studioIdForHubGame(game.id)))
  }
  assert.equal(studioIdForHubGame('mezmur'), 'finish-the-mezmur')
  assert.deepEqual(HUB_SECTIONS.map(section => section.id), ['all', 'pictures', 'scripture', 'music', 'history', 'group'], 'five categories plus All')
  assert.equal(GAME_MODES.length, 5)
  const hub = readFileSync('src/pages/play/PlayHubPage.tsx', 'utf8')
  assert.match(hub, /from '..\/..\/lib\/play\/gameCatalog'/)
  assert.ok(!/title: t\('Bible & Tewahedo Trivia'/.test(hub), 'game metadata is defined once, in the catalog')
})

test('built-in content: every public game except Finish the Mezmur ships visible, read-only content with its source', () => {
  const counts = builtInCounts()
  for (const game of STUDIO_GAMES) {
    const origin = builtInOrigin(game.id)
    assert.ok(origin.file && origin.note, `${game.id} origin`)
    if (game.id === 'finish-the-mezmur') { assert.equal(counts[game.id], 0); assert.equal(origin.kind, 'supabase'); continue }
    assert.ok(counts[game.id] > 0, `${game.id} must not look empty`)
    const items = builtInContent(game.id)
    assert.equal(new Set(items.map(item => item.key)).size, items.length, `${game.id} unique keys`)
    for (const item of items) assert.ok(item.title.en && item.locales.includes('en'), `${game.id}/${item.id}`)
  }
  // The inventory is the public banks themselves, not a copy: counts equal the real exports.
  for (const game of ['trivia', 'emoji', 'finish-the-verse'] as const) assert.equal(counts[game], APPROVED_QUESTIONS.filter(question => question.game === game).length)
  assert.equal(counts['who-am-i'], WHO_AM_I_CARDS.length)
  assert.equal(counts.match, MATCH_PAIRS.length)
  assert.equal(counts.adventures, 6)
})

test('opening a built-in item makes an independent DRAFT copy: originals untouched, stable IDs preserved, quiz IDs fresh', () => {
  const before = JSON.stringify({ APPROVED_QUESTIONS, WHO_AM_I_CARDS, MATCH_PAIRS })
  let invalid = 0
  for (const game of STUDIO_GAMES) {
    for (const item of builtInContent(game.id)) {
      const record = recordFromBuiltIn(game.id, item.id, 'owner-1', `00000000-0000-4000-8000-${String(passed).padStart(12, '0')}`)
      assert.ok(record, `${game.id}/${item.id}`)
      assert.equal(record!.status, 'draft')
      assert.equal(record!.remoteId, undefined, 'a copy is never linked to a server row')
      assert.equal(record!.owner, 'owner-1')
      if (validateStudioDraft(record!.draft).length) invalid += 1
      if (isQuizStudioGame(game.id) && 'id' in record!.draft.content && !('format' in record!.draft)) assert.notEqual((record!.draft.content as { id: string }).id, item.id, 'quiz copies get a new ID')
    }
  }
  assert.equal(JSON.stringify({ APPROVED_QUESTIONS, WHO_AM_I_CARDS, MATCH_PAIRS }), before, 'built-in banks are never mutated')
  const story = recordFromBuiltIn('adventures', builtInContent('adventures')[0].id, 'owner-1')!
  assert.equal((story.draft.content as { id: string }).id, builtInContent('adventures')[0].id, 'story ID is its artwork binding and is preserved')
  assert.deepEqual(validateStudioDraft(story.draft), [], 'a copied story validates')
  assert.equal(recordFromBuiltIn('finish-the-mezmur', 'x', 'owner-1'), null)
  assert.equal(recordFromBuiltIn('trivia', 'does-not-exist', 'owner-1'), null)
  console.log(`  (${invalid} built-in originals fail current Studio validation when copied; shown as validation feedback, never repaired silently)`)
})

test('game settings: defaults mirror the public hub, validation protects order, levels and availability', () => {
  const defaults = publicDefaults()
  assert.equal(defaults.length, 12)
  assert.deepEqual(defaults.map(game => game.order), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
  assert.ok(defaults.every(game => !differsFromPublic(game)))
  for (const game of defaults) assert.deepEqual(validateSettings(game, defaults).filter(issue => !issue.startsWith('Amharic')), [], game.id)
  const trivia = defaults.find(game => game.id === 'trivia')!
  assert.deepEqual(trivia.levels, [...GAME_LEVELS])
  assert.match(validateSettings({ ...trivia, order: 2 }, defaults).join(' '), /already used/)
  assert.match(validateSettings({ ...trivia, order: 0 }, defaults).join(' '), /1 to 99/)
  assert.match(validateSettings({ ...trivia, title: { en: '', am: '' } }, defaults).join(' '), /English title/)
  assert.match(validateSettings({ ...trivia, thumbnail: 'nope' }, defaults).join(' '), /artwork catalog/)
  assert.match(validateSettings({ ...trivia, levels: [] }, defaults).join(' '), /at least one difficulty/i)
  const timeline = defaults.find(game => game.id === 'bible-timeline')!
  assert.match(validateSettings({ ...timeline, levels: ['beginner'] }, defaults).join(' '), /no difficulty levels/)
  const allOff = defaults.map(game => ({ ...game, enabled: false }))
  assert.match(validateSettings(allOff[0], allOff).join(' '), /At least one game must stay enabled/)
})

test('game settings storage: local, per staff user, validated round trip; corrupt data is kept; nothing reaches the public hub', () => {
  const storage = memory()
  const store = settingsStorage(storage, 'staff-1', 'editor')
  assert.equal(store.load().saved.size, 0)
  const trivia = { ...publicDefaults().find(game => game.id === 'trivia')!, order: 42, title: { en: 'Edited', am: 'ተስተካክሏል' }, featured: true }
  store.save(trivia)
  const reopened = store.load()
  assert.ok(reopened.saved.has('trivia'))
  assert.equal(reopened.games.find(game => game.id === 'trivia')!.title.en, 'Edited')
  assert.equal(settingsStorage(storage, 'staff-2', 'editor').load().saved.size, 0, 'another user does not see it')
  assert.equal(defaultSettings(HUB_GAMES[3], 3).title.en, HUB_GAMES[3].title.en, 'catalog is unchanged by saving a proposal')
  assert.throws(() => store.save({ ...trivia, order: 2 }), /already used/)
  assert.deepEqual(JSON.parse(exportSettings(store.load().games)).games.map((game: { id: string }) => game.id), ['trivia'], 'export lists only proposals that differ')
  store.reset('trivia')
  assert.equal(store.load().saved.size, 0)
  storage.setItem([...storage.data.keys()][0], '{not json')
  const corrupt = store.load()
  assert.equal(corrupt.corrupt, true)
  assert.throws(() => store.save(trivia), /unreadable/)
  assert.equal(storage.data.get([...storage.data.keys()][0]), '{not json', 'corrupt data is preserved, not overwritten')
  assert.throws(() => settingsStorage(storage, 'u', 'user').load(), /Staff access/)
})

test('coverage matrix: every public feature, all 12 games, existing source files, and a stated blocker where needed', () => {
  const rows = coverageRows()
  assert.equal(new Set(rows.map(row => row.id)).size, rows.length)
  for (const game of STUDIO_GAMES) assert.ok(rows.some(row => row.id === `content-${game.id}`), `${game.id} row`)
  for (const id of ['hub-cards', 'hub-sections', 'hub-modes', 'hub-levels', 'hub-copy', 'instructions', 'game-night', 'artwork', 'campaign', 'history-chronology']) assert.ok(rows.some(row => row.id === id), id)
  for (const row of rows) {
    assert.ok(row.feature && row.source && row.cms.label && row.editable.text && row.adapter.text, row.id)
    for (const file of row.source.match(/src\/[\w/.-]+\.tsx?/g) ?? []) assert.ok(existsSync(file), `${row.id}: ${file} exists`)
    if (row.adapter.level === 'no') assert.ok(row.blocker, `${row.id}: no adapter requires a stated blocker`)
  }
  assert.equal(rows.find(row => row.id === 'game-night')!.editable.level, 'no', 'Game Night private bank is not editable from the Studio')
  assert.match(rows.find(row => row.id === 'campaign')!.blocker, /nothing is approved or published automatically/i)
})

test('campaign drafts: parse, validate with the CMS validator, review locally, export DRAFT candidates only', () => {
  const question = (id: string, extra: Record<string, unknown> = {}) => ({ id, game: 'trivia', category: 'Bible', difficulty: 'beginner', prompt: { en: `Prompt ${id}`, am: `ጥያቄ ${id}` },
    options: ['a', 'b', 'c', 'd'].map(key => ({ key, text: { en: `Option ${key}`, am: `አማራጭ ${key}` } })), correctKey: 'c', explanation: { en: 'Because.', am: 'ምክንያቱም።' },
    source: { label: 'Genesis 10:1', route: '/bible/genesis/10?edition=am#verse-1', kind: 'bible' }, verifiedLocales: [], ...extra })
  const provenance = { sourceHash: 'abcdef0123456789', modelId: 'fixture', passageId: 'am-genesis-1-10', verseIds: ['v1'], evidenceVerseId: 'v1' }
  const file = JSON.stringify({ campaignId: 'c1', drafts: [
    { status: 'draft', question: question('bible-a-1'), provenance }, { status: 'draft', question: question('bible-a-1'), provenance },
    { status: 'draft', question: question('bible-a-2', { options: [] }), provenance }, { status: 'draft', question: question('bad-game', { game: 'who-am-i' }) },
  ] })
  const parsed = parseCampaignFile(file, 'batch-7-drafts.json')
  assert.equal(parsed.items.length, 2, 'duplicate IDs and unsupported games are skipped')
  assert.equal(parsed.skipped, 2)
  assert.equal(parsed.items[0].batch, 'batch-007')
  assert.deepEqual([parsed.items[0].bookSlug, parsed.items[0].chapter, parsed.items[0].verse], ['genesis', '10', '1'])
  assert.equal(parsed.items[0].errors.length, 0)
  assert.ok(parsed.items[1].errors.length > 0, 'an invalid draft carries its validation errors')
  assert.equal(parsed.items[0].amharic, 'present')
  assert.deepEqual(locateSource({ label: 'x', route: '/church/none', kind: 'bible' }), { bookSlug: '', chapter: '', verse: '' })
  const storage = memory()
  const reviews = reviewStorage(storage, 'reviewer-1')
  assert.deepEqual(importCandidates(parsed.items, reviews.load()), [], 'nothing is exportable before human review')
  reviews.set('bible-a-1', 'ready'); reviews.set('bible-a-2', 'ready')
  const candidates = importCandidates(parsed.items, reviews.load())
  assert.equal(candidates.length, 1, 'an invalid draft can never be exported, even if marked ready')
  assert.equal(candidates[0].stable_id, 'bible-a-1')
  assert.deepEqual(candidates[0].payload.verifiedLocales, ['en'], 'generated Amharic stays unverified')
  assert.equal(candidates[0].source_references[0].route, '/bible/genesis/10', 'query and hash removed like the campaign adapter')
  assert.ok(!('status' in candidates[0]) && !('published_at' in candidates[0].payload))
  assert.equal((candidates[0].payload.provenance as { passageId: string }).passageId, 'am-genesis-1-10')
  assert.equal(reviewStorage(storage, 'reviewer-2').load()['bible-a-1'], undefined, 'review decisions are per reviewer')
  reviews.set('bible-a-1', 'unreviewed')
  assert.deepEqual(importCandidates(parsed.items, reviews.load()), [])
  assert.throws(() => parseCampaignFile('[]'), /No drafts found/)
  assert.throws(() => parseCampaignFile('{"drafts":[{"question":{"id":"x","game":"who-am-i"}}]}'), /No supported drafts/)
  assert.throws(() => parseCampaignFile('x'.repeat(8_000_001)), /exceeds 8 MB/)
})

test('the real generated campaign output (when present) parses and every draft validates', () => {
  const real = 'artifacts/faith-challenges/library/all-drafts.json'
  if (!existsSync(real)) { console.log('  (no local campaign artifacts; skipped)'); return }
  const parsed = parseCampaignFile(readFileSync(real, 'utf8'), 'all-drafts.json')
  assert.ok(parsed.items.length >= 1)
  assert.equal(parsed.items.filter(item => item.errors.length).length, 0, 'generated drafts validate with the CMS validator')
  assert.ok(parsed.items.every(item => item.bookSlug && item.chapter), 'book and chapter are always derived from the cited source')
  assert.equal(importCandidates(parsed.items, {}).length, 0, 'nothing is exportable until a person reviews it')
})

test('game navigation thumbnail removal persists as a proposal without mutating public artwork or questions', () => {
  const storage = memory(), store = settingsStorage(storage, 'staff-1', 'editor')
  const original = publicDefaults().find(game => game.id === 'trivia')!
  const removed = { ...original, thumbnail: '' }
  assert.deepEqual(validateSettings(removed, publicDefaults()).filter(issue => !issue.startsWith('Amharic')), [])
  store.save(removed)
  assert.equal(store.load().games.find(game => game.id === 'trivia')!.thumbnail, '')
  assert.equal(publicDefaults().find(game => game.id === 'trivia')!.thumbnail, original.thumbnail)
  store.save(original)
  assert.equal(store.load().games.find(game => game.id === 'trivia')!.thumbnail, original.thumbnail)
})
console.log(`Studio catalog/integration tests passed: ${passed}.`)
