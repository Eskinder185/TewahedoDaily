/**
 * Church content workflow: rules that must hold (no network, no speech model). Run: npm run test:content-workflow
 * Uses a temporary folder and invented sample text only.
 */
import assert from 'node:assert/strict'
import { spawnSync } from 'node:child_process'
import fs from 'node:fs'
import os from 'node:os'
import path from 'node:path'
import {
  Store, applyGlossary, approvalBlockers, buildReviewRows, computeStatus, draftHash, expandRefs, findReferences, mergeChunks, paragraphsToSegments, parseDraft,
  renderPreviewHtml, renderReviewHtml, scriptureMatches, signalFlags, validateDraft, type Approval, type Decisions, type DraftVersion, type GlossaryEntry, type Item, type SegmentVersion,
} from './content-workflow/lib.ts'

let passed = 0
const test = async (name: string, run: () => void | Promise<void>) => { await run(); passed += 1; console.log(`PASS ${name}`) }
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'cw-test-'))
const item = (over: Partial<Item> = {}, permission: Item['source']['permission']['status'] = 'confirmed'): Item => ({
  id: 'x', kind: 'teaching', title: 'Invented test teaching', sample: false, createdAt: '2026-11-13T00:00:00Z',
  source: { path: null, sha256: null, bytes: null, speaker: 'Test Speaker', date: '2026-11-13', audience: null, language: 'am', permission: { status: permission, note: 'test', recordedBy: 'tester', recordedAt: '' }, channels: ['website'] },
  ...over,
})
const source: SegmentVersion = { artifact: 'transcript', version: 1, basedOn: null, createdBy: 'test', createdAt: '', note: '', corrections: [], segments: [
  { id: 's1', start: 0, end: 4, text: 'ሰላም ለእናንተ ይሁን', signals: { avgLogProb: -0.2 } },
  { id: 's2', start: 4, end: 9, text: 'ዛሬ ስለ ትዕግሥት እንማራለን', signals: { avgLogProb: -1.4, lowProbabilityWords: [{ word: 'ትዕግሥት', start: 5, probability: 0.3 }] } },
  { id: 's3', start: 9, end: 15, text: 'ጸሎት የልብ ንግግር ነው' },
] }
const draftOf = (content: string, version = 1): DraftVersion => { const parsed = parseDraft(content); return { artifact: 'draft.summary', version, type: 'summary', generator: 'test', createdAt: '', note: '', title: parsed.title, content, blocks: parsed.blocks } }
const GOOD = `title-en: Patience\n::quote s3 lang=am\nጸሎት የልብ ንግግር ነው\n::translation s3\nPrayer is the speech of the heart.\n::paraphrase s2\nToday's lesson is about patience.\n::generated\nA short lesson for families.\n`

await test('written sources become citable passages; speech chunks merge in order with stable ids', () => {
  assert.deepEqual(paragraphsToSegments('One.\r\n\r\nTwo\nlines.\n\n\n').map(s => [s.id, s.text]), [['p1', 'One.'], ['p2', 'Two lines.']])
  const merged = mergeChunks([
    { index: 1, transcript: [{ start: 300, end: 303, text: 'b' }], translationError: 'boom' },
    { index: 0, transcript: [{ start: 0, end: 2, text: 'a' }, { start: 2, end: 3, text: '  ' }], translation: [{ start: 0, end: 3, text: 'A' }] },
  ])
  assert.deepEqual(merged.transcript.map(s => [s.id, s.text]), [['s1', 'a'], ['s2', 'b']])
  assert.equal(merged.translation[0].id, 't1'); assert.equal(merged.translationErrors.length, 1, 'a failed translation is reported, the transcript is kept')
})

await test('uncertainty comes from the tool\'s own signals and is described in words, never as a made-up score', () => {
  assert.deepEqual(signalFlags({ avgLogProb: -0.3, noSpeechProb: 0.1, compressionRatio: 1.5 }), [])
  const flags = signalFlags({ avgLogProb: -1.3, noSpeechProb: 0.8, compressionRatio: 3, lowProbabilityWords: [{ word: 'ቃል', start: 1, probability: 0.2 }] })
  assert.equal(flags.length, 4); assert.ok(flags.every(flag => !/\d+%|\bscore\b|confidence/i.test(flag)))
})

await test('glossary: only approved entries are applied, whole words only, and every change is traceable to its segment', () => {
  const glossary: GlossaryEntry[] = [
    { term: 'Tewahedo', language: 'en', preferred: 'Tewahedo', variants: ['Tewahido'], status: 'approved', approvedBy: 'tester' },
    { term: 'ትዕግሥት', language: 'am', preferred: 'ትዕግሥት', variants: ['ትግስት'], status: 'approved', approvedBy: 'tester' },
    { term: 'Timket', language: 'en', preferred: 'Timket', variants: ['Timkat'], status: 'proposed' },
  ]
  const result = applyGlossary([{ id: 's1', start: 0, end: 1, text: 'The tewahido Church keeps Timkat. ትግስት መልካም ነው ትግስትን አይደለም' }], glossary, 'glossary')
  assert.equal(result.segments[0].text, 'The Tewahedo Church keeps Timkat. ትዕግሥት መልካም ነው ትግስትን አይደለም', 'proposed entry and longer Amharic word are left alone')
  assert.deepEqual(result.corrections.map(c => [c.segment, c.from, c.to]), [['s1', 'Tewahido', 'Tewahedo'], ['s1', 'ትግስት', 'ትዕግሥት']])
})

await test('drafts: every block says what it is; quotations must be word for word in the source language; citations must exist', () => {
  assert.deepEqual(expandRefs(['s3-s5', 's9']), ['s3', 's4', 's5', 's9'])
  const good = parseDraft(GOOD)
  assert.deepEqual(good.errors, []); assert.equal(good.title.en, 'Patience'); assert.deepEqual(good.blocks.map(b => b.kind), ['quote', 'translation', 'paraphrase', 'generated'])
  assert.deepEqual(validateDraft(good.blocks, source.segments, 'am'), [])
  const errors = (content: string) => { const parsed = parseDraft(content); return [...parsed.errors, ...validateDraft(parsed.blocks, source.segments, 'am')].join(' | ') }
  assert.match(errors('::quote s3 lang=am\nጸሎት የልብ መዝሙር ነው\n'), /not exactly what s3 says/, 'an altered quotation is refused')
  assert.match(errors('::quote s3\nPrayer is the speech of the heart.\n'), /must be in the source language/, 'a translation cannot pose as a quotation')
  assert.match(errors('::paraphrase\nSomething he said.\n'), /must cite/)
  assert.match(errors('::paraphrase s99\nSomething.\n'), /not in the source/)
  assert.match(errors('Loose text\n::generated\nx\n'), /text before the first block/)
  assert.match(errors('::miracle s1\nx\n'), /unknown block kind/)
  assert.match(errors('::scripture\nFor God so loved\n'), /must name the reference/)
})

await test('Scripture: written and spoken-style references are found; verse text must equal the edition exactly', () => {
  assert.deepEqual(findReferences('Read John 3:16 and 1 Kings 8:22-30, then ዮሐንስ 3:16 and ዮሐንስ ፫፥፲፮. The reading is John chapter 3 verse 16.').sort(), ['1 Kings 8:22-30', 'John 3:16', 'ዮሐንስ 3:16', 'ዮሐንስ ፫፥፲፮'].sort())
  assert.equal(scriptureMatches('“For God so loved  the world”', 'For God so loved the world'), true)
  assert.equal(scriptureMatches('For God loved the world', 'For God so loved the world'), false)
})

await test('review rows: unclear audio, corrections, machine translation, Scripture and each draft block; doctrine is flagged for a qualified reviewer', () => {
  const translation: SegmentVersion = { ...source, artifact: 'translation', segments: [{ id: 't1', start: 4, end: 9, text: 'Today we learn about patience' }] }
  const doctrinal = draftOf(`${GOOD}::generated\nThis teaches the mystery of baptism.\n`)
  const rows = buildReviewRows({ item: item({}, 'unconfirmed'), transcript: { ...source, corrections: [{ segment: 's1', from: 'ሰላም', to: 'ሰላም', reason: 'test', by: 'x' }] }, translation, drafts: [doctrinal],
    scripture: [{ reference: 'John 3:16', where: 's1', editions: [{ edition: 'web', found: true, title: 'John 3:16', text: 'For God…', route: '/', message: '' }, { edition: 'am', found: false, title: '', text: '', route: '', message: 'not found' }] }] })
  const groups = rows.map(row => row.group)
  for (const group of ['permission', 'unclear audio', 'correction', 'translation', 'scripture', 'draft: summary v1']) assert.ok(groups.includes(group), group)
  const audio = rows.find(row => row.group === 'unclear audio')!
  assert.match(audio.source, /s2 @ 00:04/); assert.equal(audio.translation, 'Today we learn about patience')
  assert.equal(rows.find(row => row.proposed.includes('mystery of baptism'))!.needsQualifiedReviewer, true)
  assert.equal(rows.find(row => row.proposed.startsWith('NOT VERIFIED'))!.needsQualifiedReviewer, true, 'an unverified reference is flagged, not quoted')
  assert.equal(new Set(rows.map(row => row.id)).size, rows.length, 'row ids are unique')
  const html = renderReviewHtml(item(), rows, {})
  assert.match(html, /name="viewport"/); assert.match(html, /needs a qualified reviewer/); assert.doesNotMatch(html, /<script src|https?:\/\//, 'the review page loads nothing from the network')
})

await test('approval: needs confirmed permission, every row accepted, and never applies to sample content', () => {
  const draft = draftOf(GOOD)
  const rows = buildReviewRows({ item: item(), transcript: source, translation: null, drafts: [draft], scripture: [] })
  const mine = rows.filter(row => row.group === 'draft: summary v1')
  assert.equal(mine.length, 4)
  const accept = (ids: string[]): Decisions => Object.fromEntries(ids.map(id => [id, { decision: 'accept' as const, correction: '', reviewer: 'R', role: 'editor', at: '' }]))
  assert.match(approvalBlockers(item(), draft, rows, {}).join(), /4 review row\(s\) have no decision/)
  const partly: Decisions = { ...accept(mine.slice(1).map(row => row.id)), [mine[0].id]: { decision: 'needs-clergy', correction: '', reviewer: 'R', role: 'editor', at: '' } }
  assert.match(approvalBlockers(item(), draft, rows, partly).join(), /1 review row\(s\) were not accepted/)
  const all = accept(mine.map(row => row.id))
  assert.deepEqual(approvalBlockers(item(), draft, rows, all), [])
  assert.match(approvalBlockers(item({}, 'unconfirmed'), draft, buildReviewRows({ item: item({}, 'unconfirmed'), transcript: source, translation: null, drafts: [draft], scripture: [] }), all).join(), /not confirmed/)
  assert.match(approvalBlockers(item({ sample: true }), draft, rows, all).join(), /SAMPLE content/)
})

await test('states: Received → Processed → Needs review → Approved → Published; an approval covers one exact version', () => {
  const v1 = draftOf(GOOD, 1)
  const approval: Approval = { draft: 'summary', version: 1, sha256: draftHash(v1), by: 'Abba Test', role: 'priest', evidence: 'test', at: '2026-11-13T00:00:00Z' }
  const base = { approvals: [] as Approval[], publications: [] }
  assert.equal(computeStatus({ ...base, hasProcessed: false, hasReview: false, drafts: [] }).state, 'received')
  assert.equal(computeStatus({ ...base, hasProcessed: true, hasReview: false, drafts: [] }).state, 'processed')
  assert.equal(computeStatus({ ...base, hasProcessed: true, hasReview: true, drafts: [v1] }).state, 'needs_review')
  assert.equal(computeStatus({ ...base, hasProcessed: true, hasReview: true, drafts: [v1], approvals: [approval] }).state, 'approved')
  const published = computeStatus({ hasProcessed: true, hasReview: true, drafts: [v1], approvals: [approval], publications: [{ draft: 'summary', version: 1, sha256: draftHash(v1), channel: 'website', url: 'https://example.invalid', by: 'x', at: '' }] })
  assert.equal(published.state, 'published')
  const v2 = draftOf(GOOD.replace('families', 'everyone'), 2)
  const changed = computeStatus({ hasProcessed: true, hasReview: true, drafts: [v2], approvals: [approval], publications: [] })
  assert.equal(changed.state, 'needs_review', 'a material change after approval returns to review')
  assert.match(changed.notes.join(), /changed after approval/)
  const html = renderPreviewHtml(item(), changed, [v2], source.segments)
  assert.match(html, /DRAFT version 2 — not approved/); assert.match(html, /Quotation/); assert.match(html, /Editorial wording/); assert.match(html, /s3 @ 00:09/)
  assert.match(renderPreviewHtml(item(), computeStatus({ hasProcessed: true, hasReview: true, drafts: [v1], approvals: [approval], publications: [] }), [v1], source.segments), /Approved version 1 — Abba Test \(priest\)/)
})

await test('storage: versions are never overwritten, the log is append-only, and writes are atomic', () => {
  const store = new Store(temp)
  store.writeJson('a', 'item.json', item({ id: 'a' }))
  assert.equal(store.addVersion('a', 'transcript', { segments: [] }), 1); assert.equal(store.addVersion('a', 'transcript', { segments: [{ id: 's1' }] }), 2)
  assert.deepEqual(store.versions('a', 'transcript'), [1, 2])
  assert.deepEqual(store.version<SegmentVersion>('a', 'transcript', 1)!.segments, [], 'the first version is still there, unchanged')
  assert.equal(store.latest<SegmentVersion>('a', 'transcript')!.version, 2)
  assert.deepEqual(store.logEntries('a').map(entry => entry.event), ['version-added', 'version-added'])
  assert.equal(fs.readdirSync(path.join(temp, 'items', 'a')).some(name => name.endsWith('.tmp')), false)
})

await test('command line, end to end on invented text: intake → extract → draft → review → decisions; publishing is refused without approval', () => {
  const data = path.join(temp, 'cli')
  const run = (...args: string[]) => spawnSync(process.execPath, ['--import', 'tsx', 'scripts/content-workflow/cw.ts', ...args], { encoding: 'utf8', env: { ...process.env, CONTENT_WORKFLOW_DATA: data, VITE_SUPABASE_URL: '' } })
  const file = path.join(temp, 'notice.md'); fs.writeFileSync(file, 'Invented notice.\n\nThe study evening is on Saturday at 6 PM.\n')
  const draft = path.join(temp, 'draft.md'); fs.writeFileSync(draft, 'title-en: Study evening\n::detail p2\nSaturday at 6 PM.\n::generated\nAll are welcome.\n')
  assert.match(run('intake', '--kind', 'notice', '--file', file, '--title', 'Test notice', '--date', '2026-11-13', '--language', 'en', '--permission', 'confirmed').stderr, /needs --permission-note/, 'a confirmed permission must say who allowed it')
  assert.equal(run('intake', '--kind', 'notice', '--file', file, '--title', 'Test notice', '--date', '2026-11-13', '--language', 'en', '--channels', 'website', '--permission', 'confirmed', '--permission-note', 'test fixture', '--recorded-by', 'tester').status, 0)
  const id = '2026-11-13-test-notice'
  assert.equal(run('extract', id).status, 0)
  const bad = path.join(temp, 'bad.md'); fs.writeFileSync(bad, '::quote p2\nThe study evening is on Sunday at 6 PM.\n')
  assert.match(run('draft', id, '--type', 'announcement', '--file', bad, '--generator', 'test').stderr, /not exactly what p2 says/)
  assert.equal(run('draft', id, '--type', 'announcement', '--file', draft, '--generator', 'test').status, 0)
  assert.match(run('approve', id, '--draft', 'announcement', '--by', 'R', '--role', 'editor', '--evidence', 'x').stderr, /does not cover|Run: review/)
  assert.equal(run('review', id).status, 0)
  assert.match(run('approve', id, '--draft', 'announcement', '--by', 'R', '--role', 'editor', '--evidence', 'x').stderr, /have no decision yet/)
  assert.match(run('mark-published', id, '--draft', 'announcement', '--channel', 'website', '--url', 'https://example.invalid', '--by', 'R').stderr, /not approved/)
  const rows = JSON.parse(fs.readFileSync(path.join(data, 'items', id, 'review', 'rows.json'), 'utf8')) as Array<{ id: string }>
  const decisions = path.join(temp, 'decisions.json'); fs.writeFileSync(decisions, JSON.stringify({ item: id, reviewer: 'Reviewer', role: 'editor', rows: Object.fromEntries(rows.map(row => [row.id, { decision: 'accept' }])) }))
  assert.equal(run('decisions', id, '--file', decisions).status, 0)
  assert.equal(run('approve', id, '--draft', 'announcement', '--by', 'Reviewer', '--role', 'editor', '--evidence', 'test fixture approval').status, 0)
  assert.match(run('mark-published', id, '--draft', 'announcement', '--channel', 'telegram', '--url', 'https://example.invalid', '--by', 'R').stderr, /not a channel this source may be published to/)
  assert.match(run('status', id).stdout, /state: APPROVED/)
  fs.writeFileSync(draft, 'title-en: Study evening\n::detail p2\nSaturday at 6 PM.\n::generated\nEveryone is welcome.\n')
  assert.match(run('draft', id, '--type', 'announcement', '--file', draft, '--generator', 'test').stdout, /changed after approval/)
  assert.match(run('status', id).stdout, /state: NEEDS_REVIEW/)
  assert.equal(run('export', id).status, 0)
  assert.ok(fs.existsSync(path.join(data, 'items', id, 'export', 'channels', 'website.announcement.en.DRAFT.txt')), 'an unapproved export is marked DRAFT')
})

fs.rmSync(temp, { recursive: true, force: true })
console.log(`\n${passed} passed`)
