import assert from 'node:assert/strict'
import { mkdtemp, readFile, rm, writeFile } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { spawnSync } from 'node:child_process'

const dir = await mkdtemp(join(tmpdir(), 'td-play-bank-'))
const input = join(dir, 'snapshot.json'); const output = join(dir, 'out.json'); const report = join(dir, 'report.json')
const verses = [1, 2].map((verse) => ({ edition: 'web', bookSlug: 'genesis', chapter: 1, verse, text: `Synthetic verse ${verse}` }))
const snapshot = { verses, candidates: [
  { bookSlug: 'genesis', chapter: 1, verseStart: 1, verseEnd: 1, promptEn: 'Which verse is first?', options: ['First', 'Second', 'Third', 'Fourth'], correctIndex: 0, explanationEn: 'The supplied verse range identifies it.', difficulty: 'beginner' },
  { bookSlug: 'genesis', chapter: 1, verseStart: 2, verseEnd: 2, promptEn: 'What text is supplied for verse two?', options: ['First', 'Second', 'Third', 'Fourth'], correctIndex: 1, explanationEn: 'The supplied verse range identifies it.', difficulty: 'growing' },
  { bookSlug: 'genesis', chapter: 1, verseStart: 3, verseEnd: 3, promptEn: 'Missing verse?', options: ['First', 'Second', 'Third', 'Fourth'], correctIndex: 0, explanationEn: 'Unsupported.' },
  { bookSlug: 'genesis', chapter: 1, verseStart: 1, verseEnd: 1, promptEn: 'Which verse is first?', options: ['First', 'Second', 'Third', 'Fourth'], correctIndex: 0, explanationEn: 'Duplicate.' },
] }
await writeFile(input, JSON.stringify(snapshot))
const result = spawnSync(process.execPath, ['scripts/bible/generate-play-question-candidates.mjs', input, output, report], { encoding: 'utf8' })
assert.equal(result.status, 0, result.stderr)
const generated = JSON.parse(await readFile(output, 'utf8')); const summary = JSON.parse(await readFile(report, 'utf8'))
assert.equal(generated.status, 'draft'); assert.equal(generated.questions.length, 2); assert.equal(summary.accepted, 2); assert.equal(summary.rejected, 2)
assert.equal(new Set(generated.questions.map((q) => q.id)).size, 2)
assert.ok(generated.questions.every((q) => q.source.route.startsWith('/bible/genesis/1?edition=web#verse-')))
assert.ok(generated.questions.every((q) => q.verifiedLocales.length === 1 && q.verifiedLocales[0] === 'en'))
await rm(dir, { recursive: true, force: true })
console.log('Bible Play question generator checks passed.')
