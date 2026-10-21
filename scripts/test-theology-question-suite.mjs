/**
 * Diverse theological question suite.
 * Default: offline fixtures + heuristic flags (does NOT prove doctrine).
 * Optional live: RUN_LIVE_THEOLOGY=1 with VITE_TEWAHEDO_AI_API_URL.
 *
 * Run: npx tsx --env-file-if-exists=.env.local scripts/test-theology-question-suite.mjs
 */
import assert from 'node:assert/strict'
import { spawnSync } from 'node:child_process'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { parseSearchBuddyResponse } from '../src/lib/searchBuddy/parseSearchBuddyResponse.ts'
import { partitionAiSources } from '../src/lib/searchBuddy/aiSources.ts'
import { plainTextFromAiAnswer } from '../src/lib/searchBuddy/formatAiAnswer.ts'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const live = process.env.RUN_LIVE_THEOLOGY === '1'
const outDir = path.join(root, 'tmp', 'theology-suite')
fs.mkdirSync(outDir, { recursive: true })

const u = (...cps) => cps.map((c) => String.fromCodePoint(c)).join('')
const baptismAm = u(0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1325, 0x121d, 0x1240, 0x1275)
const meron = u(0x1245, 0x1265, 0x12d3, 0x20, 0x121c, 0x122e, 0x1295)
const qendil = u(0x1245, 0x1265, 0x12d3, 0x20, 0x1240, 0x1295, 0x12f2, 0x120d)
const trinityAm = u(0x121d, 0x1225, 0x1322, 0x1228, 0x20, 0x1225, 0x120b, 0x1234)
const badTrinity = u(0x1245, 0x12f5, 0x1235, 0x12eb, 0x20, 0x120d, 0x12d1, 0x120d)
const amLabel = u(0x12e8, 0x12a0, 0x121b, 0x122d, 0x129b, 0x20, 0x121b, 0x1265, 0x122b, 0x122a, 0x12eb)

export const THEOLOGY_QUESTIONS = [
  {
    id: 'five-mysteries-bilingual',
    q: 'What are the Five Mysteries? Explain in English and Amharic.',
    expect: ['terminology', 'bilingual'],
  },
  {
    id: 'trinity',
    q: 'Explain the Holy Trinity according to the Ethiopian Orthodox Church.',
    expect: ['terminology'],
  },
  {
    id: 'incarnation',
    q: 'What is the Mystery of the Incarnation?',
    expect: ['terminology'],
  },
  {
    id: 'baptism-am',
    q: `${baptismAm}\u1295 \u1260\u12a0\u121b\u122d\u129b \u12a0\u1265\u122b\u122b\u1362`,
    expect: ['amharic'],
  },
  {
    id: 'eucharist',
    q: 'What is the significance of the Holy Eucharist?',
    expect: ['eucharist'],
  },
  {
    id: 'resurrection-dead',
    q: 'Explain the resurrection of the dead.',
    expect: ['resurrection'],
  },
  {
    id: 'meron-vs-qendil',
    q: `What is the difference between ${meron} and ${qendil}?`,
    expect: ['anointing'],
  },
  {
    id: 'jacobs-ladder',
    q: "Explain Jacob's ladder in Genesis 28:10–22.",
    expect: ['bible-ref'],
  },
  {
    id: 'exact-ref',
    q: 'What does John 3:16 teach?',
    expect: ['bible-ref'],
  },
  {
    id: 'no-sources-topic',
    q: 'How should a beginner prepare for confession in the Ethiopian Orthodox Church?',
    expect: ['honesty'],
  },
]

function checkHeuristic(answer, expect) {
  const flags = []
  const text = answer || ''
  if (expect.includes('bilingual')) {
    const hasAm = /[\u1200-\u137F]/.test(text)
    const hasEn = /[A-Za-z]{4,}/.test(text)
    if (!(hasAm && hasEn)) flags.push('MISSING_BILINGUAL')
  }
  if (expect.includes('terminology')) {
    if (
      !new RegExp(`${trinityAm}|Mystery of the Trinity`, 'i').test(text) &&
      /five mysteries|\u12a0\u121d\u1235\u1271/i.test(text)
    ) {
      flags.push('MISSING_TRINITY_TERM')
    }
    if (text.includes(badTrinity)) flags.push('BAD_TRINITY_LABEL')
  }
  if (expect.includes('amharic') && !/[\u1200-\u137F]{5,}/.test(text)) {
    flags.push('MISSING_AMHARIC')
  }
  if (expect.includes('eucharist') && !/eucharist|qurban|\u1241\u122d\u1263\u1295|communion/i.test(text)) {
    flags.push('MISSING_EUCHARIST_TERM')
  }
  if (expect.includes('resurrection') && !/resurrect|\u1275\u1295\u1223\u12a4|dead/i.test(text)) {
    flags.push('MISSING_RESURRECTION_TERM')
  }
  if (expect.includes('anointing')) {
    if (
      !new RegExp(`${meron}|myron|chrism`, 'i').test(text) ||
      !new RegExp(`${qendil}|lamp|sick|unction`, 'i').test(text)
    ) {
      flags.push('MISSING_ANOINTING_DISTINCTION')
    }
  }
  if (expect.includes('bible-ref') && !/\b\d+:\d+\b|Genesis|John|Matthew/i.test(text)) {
    flags.push('MISSING_BIBLE_REF')
  }
  if (/_ cleanse|###\s|\*\*[^*]+\*\*/.test(text) || /\u12e8\u121a\u12eb\u1338_/.test(text)) {
    flags.push('FORMAT_OR_AMHARIC_NOISE')
  }
  if ((text.match(/"/g) || []).length >= 4 && text.length > 1200) {
    flags.push('POSSIBLE_VERSE_DUMP')
  }
  return flags
}

assert.equal(THEOLOGY_QUESTIONS.length, 10)
const sampleAnswer = [
  `1. ${trinityAm} — Mystery of the Trinity`,
  'English explanation: One God in three Persons.',
  `${amLabel}: \u12a5\u130d\u12da\u12a0\u1265\u1214\u122d \u12a0\u1295\u12f5 \u12a0\u121d\u120b\u12ad \u1290\u12cd\u1362`,
  'Bible reference: Matthew 28:19.',
].join('\n')
assert.deepEqual(checkHeuristic(sampleAnswer, ['terminology', 'bilingual']), [])
assert.ok(!plainTextFromAiAnswer(sampleAnswer).includes('###'))

const parsed = parseSearchBuddyResponse({
  type: 'ai',
  answer: sampleAnswer,
  sources: [
    {
      reference: 'Matthew 28:19',
      language: 'en',
      edition: 'web',
      verses: [{ verse_number: 19, text: 'Go, and make disciples of all nations…' }],
    },
  ],
})
const { scripture } = partitionAiSources(parsed.sources)
assert.equal(scripture.length, 1)
assert.equal(scripture[0].verses[0].text, 'Go, and make disciples of all nations…')

const summary = {
  mode: live ? 'live' : 'offline',
  questions: THEOLOGY_QUESTIONS.length,
  note: 'Doctrinal correctness requires Ethiopian Orthodox subject-matter review.',
  results: [],
}

if (live) {
  const base = (process.env.VITE_TEWAHEDO_AI_API_URL || '').replace(/\/$/, '')
  if (!base) {
    console.error('RUN_LIVE_THEOLOGY=1 requires VITE_TEWAHEDO_AI_API_URL')
    process.exit(1)
  }
  for (const row of THEOLOGY_QUESTIONS) {
    const res = await fetch(`${base}/api/chat`, {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ message: row.q, timezone: 'America/New_York' }),
    })
    const raw = await res.json().catch(() => ({}))
    const response = parseSearchBuddyResponse(raw)
    const answer =
      response.type === 'ai' ? response.answer || response.message || '' : JSON.stringify(response)
    const { scripture: src } = partitionAiSources(response.type === 'ai' ? response.sources : [])
    const flags = checkHeuristic(String(answer), row.expect)
    const py = spawnSync(
      'python',
      [
        '-c',
        `import json,sys; sys.path.insert(0, r${JSON.stringify(path.join(root, 'server'))}); from tewahedo_ai.answer_quality import check_explanation_quality; print(json.dumps([i.code for i in check_explanation_quality(sys.stdin.read())]))`,
      ],
      {
        encoding: 'utf8',
        input: String(answer),
        env: { ...process.env, PYTHONIOENCODING: 'utf-8' },
      },
    )
    const qualityCodes = py.status === 0 ? JSON.parse(py.stdout || '[]') : ['quality_check_failed']
    const item = {
      id: row.id,
      http: res.status,
      type: response.type,
      answerChars: String(answer).length,
      scriptureSources: src.length,
      heuristicFlags: flags,
      qualityCodes,
      requiresHumanReview: true,
    }
    summary.results.push(item)
    fs.writeFileSync(
      path.join(outDir, `${row.id}.json`),
      JSON.stringify({ question: row.q, response, item }, null, 2),
      'utf8',
    )
    console.log(JSON.stringify(item))
  }
} else {
  for (const row of THEOLOGY_QUESTIONS) {
    summary.results.push({
      id: row.id,
      status: 'fixture-only',
      requiresHumanReview: true,
      expect: row.expect,
    })
  }
}

fs.writeFileSync(path.join(outDir, 'summary.json'), JSON.stringify(summary, null, 2), 'utf8')
console.log('test-theology-question-suite: ok')
console.log(JSON.stringify({ mode: summary.mode, questions: summary.questions, outDir }, null, 2))
