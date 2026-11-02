import { readFile, writeFile } from 'node:fs/promises'
import { createHash } from 'node:crypto'

const [inputPath, outputPath = 'scripts/bible/generated-play-candidates.json', reportPath = 'scripts/bible/generated-play-candidates.report.json'] = process.argv.slice(2)
if (!inputPath) throw new Error('Usage: node generate-play-question-candidates.mjs <snapshot.json> [output.json] [report.json]')

const snapshot = JSON.parse(await readFile(inputPath, 'utf8'))
const verses = Array.isArray(snapshot.verses) ? snapshot.verses : []
const candidates = Array.isArray(snapshot.candidates) ? snapshot.candidates : []
const normalize = (value) => String(value ?? '').toLowerCase().normalize('NFKC').replace(/[^\p{L}\p{N}]+/gu, ' ').trim()
const slug = (value) => normalize(value).replace(/\s+/g, '-')
const hash = (value) => createHash('sha256').update(value).digest('hex').slice(0, 10)
const key = (edition, bookSlug, chapter, verse) => `${edition}:${bookSlug}:${chapter}:${verse}`
const verseMap = new Map(verses.map((v) => [key(v.edition, v.bookSlug, v.chapter, v.verse), v]))
const issues = []
const accepted = []
const fingerprints = []

function rangeRows(candidate, edition = 'web') {
  const rows = []
  for (let verse = candidate.verseStart; verse <= candidate.verseEnd; verse += 1) {
    const row = verseMap.get(key(edition, candidate.bookSlug, candidate.chapter, verse))
    if (!row || !String(row.text ?? '').trim()) return null
    rows.push(row)
  }
  return rows
}

for (const [index, c] of candidates.entries()) {
  const label = `candidate[${index}]`
  const rows = rangeRows(c)
  const errors = []
  if (!/^[a-z0-9-]+$/.test(String(c.bookSlug ?? '')) || !Number.isInteger(c.chapter) || !Number.isInteger(c.verseStart) || !Number.isInteger(c.verseEnd) || c.verseEnd < c.verseStart) errors.push('invalid citation range')
  if (!rows) errors.push('incomplete or missing English verse range')
  if (!String(c.promptEn ?? '').trim() || !String(c.explanationEn ?? '').trim()) errors.push('missing English prompt or explanation')
  if (!Array.isArray(c.options) || c.options.length !== 4 || c.options.some((option) => !String(option).trim())) errors.push('requires four non-empty options')
  if (new Set((c.options ?? []).map(normalize)).size !== 4) errors.push('options must be distinct')
  if (!Number.isInteger(c.correctIndex) || c.correctIndex < 0 || c.correctIndex > 3) errors.push('invalid correctIndex')
  if (c.amharic) {
    if (!String(c.promptAm ?? '').trim() || !String(c.explanationAm ?? '').trim()) errors.push('incomplete Amharic localization')
    if (!rangeRows(c, 'am')) errors.push('Amharic localization lacks an independently verified verse range')
  }
  const citation = `${c.bookSlug}:${c.chapter}:${c.verseStart}-${c.verseEnd}`
  const stableId = `bible-${slug(c.bookSlug)}-${c.chapter}-${c.verseStart}-${c.verseEnd}-${hash(normalize(c.promptEn))}`
  const fingerprint = normalize(`${c.promptEn}|${(c.options ?? []).join('|')}|${citation}`)
  if (fingerprints.some((old) => old === fingerprint)) errors.push('duplicate question fingerprint')
  if (fingerprints.some((old) => {
    const a = new Set(fingerprint.split(' ')); const b = new Set(old.split(' ')); const overlap = [...a].filter((token) => b.has(token)).length
    return overlap / Math.max(a.size, b.size, 1) >= 0.9
  })) errors.push('near-duplicate question fingerprint')
  if (errors.length) { issues.push({ candidate: label, errors }); continue }
  accepted.push({
    id: stableId, game: 'trivia', category: c.category ?? 'Bible', difficulty: c.difficulty ?? 'beginner',
    prompt: c.amharic ? { en: c.promptEn, am: c.promptAm } : { en: c.promptEn },
    options: c.options.map((text, optionIndex) => ({ key: String.fromCharCode(97 + optionIndex), text: { en: text } })),
    correctKey: String.fromCharCode(97 + c.correctIndex),
    explanation: c.amharic ? { en: c.explanationEn, am: c.explanationAm } : { en: c.explanationEn },
    source: { label: `${c.bookSlug} ${c.chapter}:${c.verseStart}${c.verseEnd === c.verseStart ? '' : `-${c.verseEnd}`}`, route: `/bible/${c.bookSlug}/${c.chapter}?edition=web#verse-${c.verseStart}`, kind: 'bible' },
    verifiedLocales: c.amharic ? ['en', 'am'] : ['en'],
    status: 'draft',
  })
  fingerprints.push(fingerprint)
}

const report = { accepted: accepted.length, rejected: issues.length, issues }
await writeFile(outputPath, JSON.stringify({ status: 'draft', questions: accepted }, null, 2) + '\n')
await writeFile(reportPath, JSON.stringify(report, null, 2) + '\n')
console.log(JSON.stringify(report))
