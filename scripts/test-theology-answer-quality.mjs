/**
 * Heuristic quality flags for AI explanation fixtures (not doctrinal proof).
 * Run: npx tsx scripts/test-theology-answer-quality.mjs
 */
import assert from 'node:assert/strict'
import { spawnSync } from 'node:child_process'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { plainTextFromAiAnswer } from '../src/lib/searchBuddy/formatAiAnswer.ts'
import { plainTextFromSearchBuddyResponse } from '../src/lib/searchBuddy/copySearchBuddyText.ts'
import { normalizeAiSources, partitionAiSources } from '../src/lib/searchBuddy/aiSources.ts'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const u = (...cps) => cps.map((c) => String.fromCodePoint(c)).join('')

const M = {
  trinity: u(0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1225, 0x120b, 0x1234),
  incarnation: u(0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1225, 0x130b, 0x12cc),
  baptism: u(0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1325, 0x121d, 0x1240, 0x1275),
  eucharist: u(0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1241, 0x122d, 0x1263, 0x1295),
  resurrection: u(
    0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1275, 0x1295, 0x1223, 0x12a4, 0x20, 0x1219, 0x1273, 0x1295,
  ),
  badTrinity: u(0x1245, 0x12f5, 0x1235, 0x12eb, 0x20, 0x120d, 0x12d1, 0x120d),
  amLabel: u(0x12e8, 0x12a0, 0x121b, 0x122d, 0x129b, 0x20, 0x121b, 0x1265, 0x122b, 0x122a, 0x12eb),
}

const preferred = [
  `1. ${M.trinity} — Mystery of the Trinity`,
  'English explanation: God is one in essence and three in Persons: Father, Son, and Holy Spirit.',
  `${M.amLabel}: ${u(0x12a5, 0x130d, 0x12da, 0x12a0, 0x1265, 0x1214, 0x122d)} ${u(0x1260, 0x12a0, 0x1295, 0x12f5, 0x1290, 0x1275)} ${u(0x1226, 0x1235, 0x1275, 0x1290, 0x1275)} ${u(0x12e8, 0x121a, 0x1218, 0x1208, 0x12ad)} ${u(0x12a0, 0x1295, 0x12f5)} ${u(0x12a0, 0x121d, 0x120b, 0x12ad)} ${u(0x1290, 0x12cd, 0x1362)}`,
  'Bible reference: Matthew 28:19.',
  '',
  `2. ${M.incarnation} — Mystery of the Incarnation`,
  'English explanation: The Son became true man while remaining true God.',
  'Bible reference: John 1:14.',
  '',
  `3. ${M.baptism} — Mystery of Baptism`,
  `4. ${M.eucharist} — Mystery of the Eucharist`,
  `5. ${M.resurrection} — Mystery of the Resurrection of the Dead`,
  'The Five Mysteries summarize core EOTC teaching.',
].join('\n')

const FIXTURES = [
  {
    id: 'five-mysteries-bad-prior',
    answer:
      `### ${M.badTrinity}\n` +
      `${u(0x12e8, 0x121a, 0x12eb, 0x1338)}_ cleanse (${u(0x12e8, 0x121a, 0x12eb, 0x1290, 0x133b)})\n` +
      '"Go ye therefore, and teach all nations..." (long quote dump) ' +
      'A'.repeat(100),
    expectCodes: ['bad_trinity_label', 'amharic_latin_mix', 'markdown_noise'],
    requiresHumanReview: true,
  },
  {
    id: 'five-mysteries-preferred',
    answer: preferred,
    expectCodes: [],
    requiresHumanReview: true,
  },
]

const py = `
import json, sys
sys.path.insert(0, r${JSON.stringify(path.join(root, 'server'))})
from tewahedo_ai.answer_quality import check_explanation_quality
fixtures = json.loads(sys.stdin.read())
out = []
for row in fixtures:
    codes = [i.code for i in check_explanation_quality(row["answer"])]
    out.append({"id": row["id"], "codes": codes})
print(json.dumps(out))
`

const result = spawnSync('python', ['-c', py], {
  cwd: root,
  encoding: 'utf8',
  input: JSON.stringify(FIXTURES),
  env: { ...process.env, PYTHONIOENCODING: 'utf-8' },
})
if (result.status !== 0) {
  console.error(result.stderr)
  process.exit(result.status || 1)
}

const reports = JSON.parse(result.stdout)
for (const fixture of FIXTURES) {
  const report = reports.find((r) => r.id === fixture.id)
  assert.ok(report, fixture.id)
  for (const code of fixture.expectCodes) {
    assert.ok(report.codes.includes(code), `${fixture.id} missing ${code}: ${report.codes}`)
  }
  if (fixture.expectCodes.length === 0) {
    assert.ok(!report.codes.includes('bad_trinity_label'), fixture.id)
    assert.ok(!report.codes.includes('amharic_latin_mix'), fixture.id)
  }
  assert.equal(fixture.requiresHumanReview, true)
}

const verse =
  'Go, and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit,'
const copied = plainTextFromSearchBuddyResponse({
  type: 'ai',
  answer: preferred,
  sources: [
    {
      reference: 'Matthew 28:19',
      edition: 'web',
      language: 'en',
      mystery: 'Trinity',
      verses: [{ verse_number: 19, text: verse, covers_verse_range: null }],
    },
  ],
})
assert.ok(copied.includes(verse))
assert.match(copied, /Supplied Scripture/)
assert.ok(!plainTextFromAiAnswer(preferred).includes(verse))

const parts = partitionAiSources(
  normalizeAiSources([
    {
      reference: 'Matthew 28:19',
      language: 'en',
      edition: 'web',
      verses: [{ verse_number: 19, text: verse }],
    },
  ]),
)
assert.equal(parts.scripture[0].verses[0].text, verse)

console.log('test-theology-answer-quality: ok')
console.log(
  JSON.stringify(
    {
      note: 'Automated checks flag heuristics only; doctrinal accuracy needs human review.',
      fixtures: reports,
    },
    null,
    2,
  ),
)
