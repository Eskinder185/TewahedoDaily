/**
 * Bible verse text search against recorded expected verse ids (live public data, read-only).
 * npx tsx --env-file=.env.local scripts/search-eval/run-bible.ts [label]
 */
import fs from 'node:fs'
import { searchBibleText } from '../../src/lib/bible/bibleSearch.ts'

const label = process.argv[2] ?? 'bible'
const set = JSON.parse(fs.readFileSync('scripts/search-eval/bible-queries.json', 'utf8')).queries as Array<{ id: string; kind: string; split: string; query: string; expectedVerseId: string; queryLanguage: string }>
type Bucket = { n: number; top1: number; top3: number; found: number; empty: number; failed: number; ms: number[] }
const buckets: Record<string, Bucket> = {}
const detail: unknown[] = []
for (const q of set) {
  const t = performance.now()
  let ids: string[] = []; let failed = false
  try { ids = (await searchBibleText(q.query, { textLimit: 12, language: q.queryLanguage === 'am' ? 'am' : 'en' })).map((r) => r.sourceId.replace('bible-text:', '')) } catch { failed = true }
  const ms = performance.now() - t
  const rank = ids.indexOf(q.expectedVerseId) + 1
  detail.push({ id: q.id, kind: q.kind, split: q.split, rank: rank || null, results: ids.length, failed })
  for (const key of ['all', q.kind, `split:${q.split}`]) {
    const b = (buckets[key] ||= { n: 0, top1: 0, top3: 0, found: 0, empty: 0, failed: 0, ms: [] })
    b.n++; if (rank === 1) b.top1++; if (rank && rank <= 3) b.top3++; if (rank) b.found++; if (!ids.length) b.empty++; if (failed) b.failed++; b.ms.push(ms)
  }
}
const summary: Record<string, unknown> = {}
for (const [k, b] of Object.entries(buckets)) {
  const s = [...b.ms].sort((x, y) => x - y)
  summary[k] = { n: b.n, top1: b.top1, top3: b.top3, found: b.found, empty: b.empty, failed: b.failed, p50ms: Math.round(s[Math.floor(s.length / 2)]), p95ms: Math.round(s[Math.floor(s.length * 0.95)] ?? s.at(-1) ?? 0) }
  console.log(k.padEnd(22), JSON.stringify(summary[k]))
}
fs.mkdirSync('scripts/search-eval/results', { recursive: true })
fs.writeFileSync(`scripts/search-eval/results/${label}.json`, JSON.stringify({ label, summary, detail }, null, 1))
