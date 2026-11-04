import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { validateQuestionDraft } from '../src/lib/play/questionLibrary'
import { buildFinishMezmurBankSeeded, gradeTyped } from '../src/lib/play/finishMezmur'
import { isCorrectOrder } from '../src/lib/play/bibleTimeline'
import type { QuestionLibraryClient } from '../src/lib/play/questionLibraryService'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'
// Dynamic imports ensure no local credential/config files are required.
const { STUDIO_GAMES, duplicateStudioRecord, exactVerseFragment, internalSource, newHistoryTimelineRecord, newStudioRecord, studioStorage, toQuestionDraft, validateStudioDraft, verifyStudioVerse } = await import('../src/lib/play/contentStudio')
const { createQuestionLibraryApi } = await import('../src/lib/play/questionLibraryService')
const { createStudioBibleSource } = await import('../src/lib/play/studioBibleSource')

let passed = 0
const test = async (name: string, run: () => void | Promise<void>) => { await run(); passed++; console.log(`PASS ${name}`) }
const owner = '11111111-1111-4111-8111-111111111111'
const memory = new Map<string, string>()
const storage = { getItem: (key: string) => memory.get(key) ?? null, setItem: (key: string, value: string) => { memory.set(key, value) } }
const store = studioStorage(storage, owner, 'editor')
assert.equal(STUDIO_GAMES.length, 12)
function fixtureRecord(game: Parameters<typeof newStudioRecord>[0]) {
  const record = newStudioRecord(game, owner)
  // Existing local identity/pair banks claim Amharic while explanations are
  // English-only. Fixtures explicitly opt out of Amharic verification; original banks stay intact.
  if (record.draft.game === 'who-am-i') record.draft.content.verifiedLocales = ['en']
  if (record.draft.game === 'match') for (const pair of record.draft.content) pair.verifiedLocales = ['en']
  if (record.draft.game === 'finish-the-mezmur') {
    Object.assign(record.draft.content, { slug: 'synthetic-lyrics', title: 'Synthetic test lyrics',
    lyrics_amharic: ['አንድ', 'ሁለት', 'ሦስት', 'አራት', 'አምስት', 'ስድስት'].map(word => `የሙከራ ግጥም መስመር ${word}`).join('\n') })
  }
  return record
}
for (const game of STUDIO_GAMES) {
  await test(`${game.id}: exact schema, editing, bilingual copy and local save/reload`, () => {
    const record = fixtureRecord(game.id)
    assert.deepEqual(validateStudioDraft(record.draft), [], `${game.id}: existing template valid`)
    record.name = `Edited ${game.en} ሙከራ`
    store.save(record)
    assert.deepEqual(store.load().find(item => item.id === record.id), record)
    const copy = duplicateStudioRecord(record)
    assert.notEqual(copy.id, record.id); assert.equal(copy.status, 'draft'); assert.equal(copy.remoteId, undefined)
    assert.deepEqual(validateStudioDraft(copy.draft), [])
    if (game.connected) assert.deepEqual(validateQuestionDraft(toQuestionDraft(copy.draft)), [])
    else assert.throws(() => toQuestionDraft(copy.draft), /not connected/)
  })
}
for (const game of STUDIO_GAMES) await test(`${game.id}: malformed game-specific content rejects`, () => {
  const draft = fixtureRecord(game.id).draft
  assert.deepEqual(validateStudioDraft(draft), [], 'negative test starts from valid content')
  switch (draft.game) {
    case 'history': case 'trivia': draft.content.difficulty = 'invalid' as never; break
    case 'emoji': draft.content.emoji = ''; break
    case 'finish-the-verse': draft.content.excerpt = { en: '' }; break
    case 'who-am-i': draft.content.answer.en = ''; break
    case 'match': draft.content[1].id = draft.content[0].id; break
    case 'bible-timeline': draft.content.events[0].route = '//unsafe.invalid'; break
    case 'adventures': draft.content.scenes[0].source.lastVerse = 0; break
    case 'finish-the-mezmur': draft.content.lyrics_amharic = 'too short'; break
    case 'feasts': draft.content[0].kind = 'saint'; break
    case 'saints': draft.content[0].kind = 'feast'; break
    case 'icon-memory': draft.content.push(structuredClone(draft.content[0])); break
  }
  assert.ok(validateStudioDraft(draft).length > 0)
})
await test('game registry matches real public routes, four enabled quiz editorial workflows', () => {
  assert.equal(STUDIO_GAMES.filter(item => item.connected).length, 4)
  const page = readFileSync('src/pages/play/PlayGamePage.tsx', 'utf8')
  assert.match(page, /case 'finish-the-mezmur': return <FinishMezmurGame/)
  assert.match(page, /loadPublishedPlayQuestions/)
  for (const game of ['who-am-i', 'match', 'bible-timeline', 'feasts', 'saints', 'icon-memory']) assert.ok(page.includes(`case '${game}'`))
})
await test('History event/year bank is a separate valid local format, never a quiz payload', () => {
  const record = newHistoryTimelineRecord(owner)
  assert.deepEqual(validateStudioDraft(record.draft), [])
  assert.throws(() => toQuestionDraft(record.draft), /not connected/)
  store.save(record); assert.deepEqual(store.load().find(item => item.id === record.id), record)
  const copy = duplicateStudioRecord(record)
  assert.deepEqual(validateStudioDraft(copy.draft), [])
  if (!('format' in copy.draft)) throw new Error('fixture')
  copy.draft.content[1].year = copy.draft.content[0].year
  assert.match(validateStudioDraft(copy.draft).join(' '), /distinct/)
})
await test('wrong answers, duplicate options, required bilingual verification and unsafe sources reject', () => {
  const record = newStudioRecord('trivia', owner)
  if (record.draft.game !== 'trivia') throw new Error('fixture')
  record.draft.content.correctKey = 'absent'
  assert.match(validateStudioDraft(record.draft).join(' '), /correct answer/)
  record.draft.content = { ...record.draft.content, correctKey: 'a', verifiedLocales: ['en', 'am'], prompt: { en: 'Question?', am: '' } }
  assert.match(validateStudioDraft(record.draft).join(' '), /Amharic/)
  record.draft.content.options[1].text.en = record.draft.content.options[0].text.en
  assert.match(validateStudioDraft(record.draft).join(' '), /distinct/)
  for (const route of ['//evil.test', '/\\evil.test', '/%5cevil.test', 'javascript:alert(1)', '/bible/a\n', '/unknown']) assert.equal(internalSource(route), false)
  assert.equal(internalSource('/bible/genesis/1?edition=am#verse-1'), true)
})
await test('timeline IDs/order/source integrity use actual game grader', () => {
  const record = newStudioRecord('bible-timeline', owner)
  if (record.draft.game !== 'bible-timeline') throw new Error('fixture')
  const chain = record.draft.content
  const round = { id: chain.id, chainId: chain.id, chainTitle: chain.title, events: chain.events }
  assert.equal(isCorrectOrder(round, chain.events.map(event => event.id)), true)
  assert.equal(isCorrectOrder(round, chain.events.map(event => event.id).reverse()), false)
  chain.events[1].id = chain.events[0].id
  assert.match(validateStudioDraft(record.draft).join(' '), /unique/)
})
await test('broken Adventure outcomes/branches/scene counts reject', () => {
  const record = newStudioRecord('adventures', owner)
  if (record.draft.game !== 'adventures') throw new Error('fixture')
  const question = record.draft.content.scenes.find(scene => scene.interaction.kind === 'question')!
  if (question.interaction.kind === 'question') {
    question.interaction.correctId = question.interaction.choices.find(choice => choice.id !== question.interaction.correctId)!.id
    assert.match(validateStudioDraft(record.draft).join(' '), /bound to the template/)
    question.interaction.correctId = 'missing'
  }
  assert.match(validateStudioDraft(record.draft).join(' '), /existing choice/)
  Object.assign(question.interaction, { nextSceneId: 'unreachable' })
  assert.match(validateStudioDraft(record.draft).join(' '), /Branch/)
  record.draft.content.scenes.pop()
  assert.match(validateStudioDraft(record.draft).join(' '), /three linear scenes/)
})
await test('image replacement only accepts known media, kind and unique cards', () => {
  const record = newStudioRecord('feasts', owner)
  if (record.draft.game !== 'feasts') throw new Error('fixture')
  record.draft.content[0].src = 'https://unapproved.invalid/image.svg'
  assert.match(validateStudioDraft(record.draft).join(' '), /catalog/)
  record.draft.content[1].id = record.draft.content[0].id
  assert.match(validateStudioDraft(record.draft).join(' '), /unique/)
})
await test('Finish Mezmur uses actual deterministic question builder and grader', () => {
  const record = store.load().find(record => record.draft.game === 'finish-the-mezmur')!
  if (record.draft.game !== 'finish-the-mezmur') throw new Error('fixture')
  for (const mode of ['choose', 'arrange', 'type'] as const) {
    const bank = buildFinishMezmurBankSeeded([record.draft.content], mode, 'easy', 42)
    assert.ok(bank.length > 0, mode)
    assert.equal(gradeTyped(bank[0].answer.am, bank[0].answer), true)
    assert.equal(gradeTyped('not the source lyric', bank[0].answer), false)
  }
})
await test('staff guard, owner separation, corruption preservation and local publication rejection', () => {
  for (const role of ['user', 'contributor', 'anon']) assert.throws(() => studioStorage(storage, owner, role), /Staff/)
  assert.deepEqual(studioStorage(storage, 'another-owner', 'admin').load(), [])
  const record = store.load()[0]
  assert.throws(() => store.save({ ...record, owner: 'other' }), /cannot/)
  assert.throws(() => store.save({ ...record, status: 'published' }), /cannot/)
  const key = [...memory.keys()][0], original = memory.get(key)!
  memory.set(key, '{broken')
  assert.throws(() => store.load(), /preserved/); assert.equal(memory.get(key), '{broken')
  memory.set(key, original)
})
await test('previews cannot invoke rewards, game rooms or server writes', () => {
  const preview = readFileSync('src/pages/admin/studio/StudioPreview.tsx', 'utf8')
  assert.doesNotMatch(preview, /recordPlayCompletion|syncPlayCompletion|questionLibraryApi|supabase|\.rpc\(/)
  assert.match(preview, /isCorrectOrder/); assert.match(preview, /buildFinishMezmurBankSeeded/)
  assert.match(preview, /disabled=\{!ready\}/)
})
await test('verse publication requires exact text in every reviewed edition; unavailable or changed text fails', async () => {
  assert.equal(exactVerseFragment('In the beginning God created', 'In the beginning ____ created', 'God'), true)
  assert.equal(exactVerseFragment('In the beginning God created', 'In the beginning ____ created', 'Moses'), false)
  assert.equal(exactVerseFragment('God created', '____ ____', 'God'), false)
  const record = newStudioRecord('finish-the-verse', owner)
  if (record.draft.game !== 'finish-the-verse') throw new Error('fixture')
  Object.assign(record.draft.content, { source: { kind: 'bible', label: 'Genesis 1:1', route: '/bible/genesis/1' },
    excerpt: { en: 'In the beginning ____ created' }, verifiedLocales: ['en'] })
  record.draft.content.options.find(option => option.key === record.draft.content.correctKey)!.text.en = 'God'
  await verifyStudioVerse(record.draft, async () => ({ isComplete: true, editionCode: 'web', readerHref: '/bible/genesis/1', verses: [{ id: 'verse-1', text: 'In the beginning God created' }] }))
  await assert.rejects(verifyStudioVerse(record.draft, async () => null), /Cannot verify/)
  await assert.rejects(verifyStudioVerse(record.draft, async () => ({ isComplete: true, editionCode: 'web', readerHref: '/bible/genesis/1', verses: [{ id: 'verse-1', text: 'Changed text' }] })), /Cannot verify/)
})
await test('source selection checks reviewed/public/rights and exact edition-book-chapter relationships', async () => {
  const edition = { id: 'edition', code: 'am', name: 'Synthetic Amharic', language_code: 'am', review_status: 'reviewed', publication_status: 'published', is_public: true, rights_status: 'public_domain' }
  const source = { id: 'source', canonical_book_id: 'book', edition_id: 'edition', review_status: 'reviewed', publication_status: 'published', is_public: true }
  const chapter = { id: 'chapter', source_book_id: source.id, chapter_number: 5, ordinal: 11, edition: 'am', source }
  const detail = { book: { id: 'book', slug: 'genesis', source_status: 'available', name_en: 'Genesis', name_am: 'ዘፍጥረት' }, editions: [edition], byEdition: { am: [chapter] } }
  const text = { chapter, verses: [{ id: 'exact-verse', chapter_id: 'chapter', verse_number: 7, text: 'የሙከራ ጥቅስ ቃል' }] }
  const api = createStudioBibleSource({ loadBook: async () => detail as never, loadText: async () => text as never })
  const request = { bookSlug: 'genesis', chapterNumber: 5, verseStart: 7, preferredEdition: 'am' as const }
  const result = await api.fetchPassage(request)
  assert.equal(result?.chapterNumber, 5); assert.equal(result?.chapterOrdinal, 11)
  assert.equal(result?.readerHref, '/bible/genesis/11?edition=am#verse-7'); assert.equal(result?.verses[0].id, 'exact-verse')
  edition.is_public = false; assert.equal(await api.fetchPassage(request), null); edition.is_public = true
  edition.rights_status = 'unknown'; assert.equal(await api.fetchPassage(request), null); edition.rights_status = 'public_domain'
  source.publication_status = 'draft'; await assert.rejects(api.fetchPassage(request), /unique reviewed/); source.publication_status = 'published'
  source.edition_id = 'wrong'; await assert.rejects(api.fetchPassage(request), /unique reviewed/); source.edition_id = 'edition'
  text.verses.push({ ...text.verses[0], id: 'duplicate-numbering' }); await assert.rejects(api.fetchPassage(request), /ambiguous/)
})
await test('unconnected formats cannot publish through existing API, including lyric-derived Mezmur', async () => {
  let calls = 0
  let game = 'finish-the-mezmur'
  const row = { ...toQuestionDraft(newStudioRecord('trivia', owner).draft), id: 'server', status: 'approved', game_type: game }
  const client = { from: () => ({ select() { return this }, eq() { return this }, async single() { return { data: { ...row, game_type: game }, error: null } } }),
    rpc: async () => { calls++; return { data: null, error: null } } } as unknown as QuestionLibraryClient
  const api = createQuestionLibraryApi(client, async () => ({ profileRole: 'admin' }))
  for (game of ['finish-the-mezmur', 'who-am-i', 'match']) await assert.rejects(api.review('server', 'published', ''), /public question reader/)
  assert.equal(calls, 0)
})
await test('removed image references persist only as incomplete local drafts, never playable content', () => {
  const record = fixtureRecord('icon-memory')
  if (record.draft.game !== 'icon-memory') throw new Error('fixture')
  const original = structuredClone(record.draft.content[0])
  Object.assign(record.draft.content[0], { src: '', fallbackSrc: '' })
  assert.match(validateStudioDraft(record.draft).join(' '), /Replace the removed image/)
  assert.deepEqual(validateStudioDraft(record.draft, { allowMissingImages: true }), [])
  store.save(record)
  assert.deepEqual(store.load().find(item => item.id === record.id), record)
  const catalogCopy = fixtureRecord('icon-memory')
  if (catalogCopy.draft.game !== 'icon-memory') throw new Error('fixture')
  assert.deepEqual(catalogCopy.draft.content[0], original, 'shared catalog was not modified')
  record.draft.content[0].src = 'https://unapproved.invalid/image.png'
  assert.ok(validateStudioDraft(record.draft, { allowMissingImages: true }).length)
  record.draft.content[0] = original
  store.save(record); assert.deepEqual(validateStudioDraft(record.draft), [])
})
await test('delete/recover is atomic, owner-scoped, preserves other drafts and rejects repeated actions', () => {
  const record = fixtureRecord('bible-timeline'); store.save(record)
  const before = store.load()
  store.remove(record.id)
  assert.deepEqual(store.load(), before.filter(item => item.id !== record.id))
  assert.deepEqual(store.deleted().map(item => ({ ...item, deletedAt: undefined })), [{ ...record, deletedAt: undefined }])
  assert.throws(() => store.remove(record.id), /no longer available/)
  assert.throws(() => store.save(record), /Restore the deleted/)
  assert.throws(() => studioStorage(storage, 'other-staff', 'admin').restore(record.id), /no longer available/)
  assert.throws(() => studioStorage(storage, owner, 'user'), /Staff access/)
  assert.deepEqual(store.restore(record.id), record)
  assert.deepEqual(store.load(), before)
  assert.throws(() => store.restore(record.id), /no longer available/)
})
await test('failed deletion preserves original storage and never accepts server or foreign records', () => {
  const record = fixtureRecord('bible-timeline'); store.save(record)
  const before = new Map(memory)
  const failing = studioStorage({ ...storage, setItem() { throw new Error('Synthetic quota exceeded') } }, owner, 'admin')
  assert.throws(() => failing.remove(record.id), /quota/)
  assert.deepEqual(memory, before)
  assert.throws(() => store.save({ ...record, remoteId: 'server-row' }), /cannot publish or replace/)
  assert.throws(() => store.save({ ...record, owner: 'other' }), /cannot publish or replace/)
  assert.throws(() => store.save({ ...record, deletedAt: new Date().toISOString() }), /cannot publish or replace/)
})
await test('corrupt recovery metadata fails closed without overwriting stored drafts', () => {
  const record = fixtureRecord('bible-timeline')
  const raw = JSON.stringify([{ ...record, deletedAt: 'not-a-date' }])
  const isolated = studioStorage({ getItem: () => raw, setItem() { throw new Error('must not write') } }, owner, 'admin')
  assert.throws(() => isolated.load(), /Invalid local draft/)
  assert.throws(() => isolated.deleted(), /Invalid local draft/)
  assert.throws(() => isolated.restore(record.id), /Invalid local draft/)
})
console.log(`${passed} passed, 0 failed`)
