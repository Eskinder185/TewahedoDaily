/** Read-only projection using the same candidate anomaly gate as campaign preparation. */
import { readFileSync } from 'node:fs'
import { exclusionReasons, loadAudit, parseSingleColumnExport, type Candidate } from './prepare-play-source-batch'

const manifest = JSON.parse(readFileSync('artifacts/faith-challenges/campaign-manifest.json', 'utf8'))
const rawCandidates = JSON.parse(readFileSync('exports/play-source-candidates.json', 'utf8'))
const candidates = parseSingleColumnExport(JSON.stringify(rawCandidates), 'candidate') as Candidate[]
const audit = await loadAudit('artifacts/bible-audit')
const used = new Set<string>(manifest.usedPassages.map((item: { route: string }) => item.route))
const eligible = new Map<string, Candidate>()
for (const candidate of candidates) {
  const route = `/bible/${candidate.book.slug}/${candidate.chapter.chapter_number}`
  if (used.has(route) || exclusionReasons(candidate, audit).length) continue
  if (eligible.has(route)) throw new Error(`Duplicate candidate route: ${route}`)
  eligible.set(route, candidate)
}
const perBook = new Map<string, number>()
for (const candidate of eligible.values()) {
  perBook.set(candidate.book.slug, (perBook.get(candidate.book.slug) ?? 0) + 1)
}
const remaining = new Map(perBook)
let count = manifest.usedPassages.length
let batch = manifest.totalBatches
while (count < manifest.targetQuestions && [...remaining.values()].some(Boolean)) {
  const books = [...remaining].filter(([, available]) => available > 0).slice(0, 20)
  batch++
  for (const [book, available] of books) remaining.set(book, available - 1)
  count += books.length
}
console.log(JSON.stringify({
  currentPrepared: manifest.usedPassages.length,
  unusedEligibleDistinctRoutes: eligible.size,
  target: manifest.targetQuestions,
  projectedPrepared: count,
  projectedFinalBatch: batch,
  projectedAdded: count - manifest.usedPassages.length,
  availableByBook: Object.fromEntries([...perBook].sort((a, b) => b[1] - a[1])),
  caveat: 'Projection assumes each still-eligible chapter passes preparePlaySourceBatch and supports one distinct validated question.',
}, null, 2))
