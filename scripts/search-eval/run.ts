/* eslint-disable @typescript-eslint/no-explicit-any -- evaluation script over loosely typed JSON snapshots */
/**
 * Evaluate Mezmur search against the recorded expected slugs.
 * npx tsx --env-file=.env.local scripts/search-eval/run.ts <snapshot.json> [label]
 * Systems: catalog (title Fuse catalog used by Mezmur Library browse), specialist (live public-projection search).
 * Reads only public data through the anon client.
 */
import fs from 'node:fs'
import { searchMezmurCatalog, normalizeLatinSearchText, type MezmurSearchDoc } from '../../src/lib/publicContent/mezmurSearch.ts'
import { searchPublicMezmurLyrics } from '../../src/lib/search/mezmurLyricSearch.ts'

const [, , snapPath, label = 'run'] = process.argv
const rows: any[] = JSON.parse(fs.readFileSync(snapPath, 'utf8'))
const set = JSON.parse(fs.readFileSync('scripts/search-eval/mezmur-queries.json', 'utf8')).queries as any[]

const docs = rows.map((r) => ({
  id: r.mezmur_id, slug: r.slug, title: r.title || '', title_amharic: r.title_amharic, thumbnail_url: null, audio_url: null,
  youtube_url: null, featured: false, published_at: null, created_at: '', singer_name: r.singer_name, category_name: null,
  languages: [], form: r.form || 'mezmur', language: r.primary_language, category: null, occasion: null, saint_or_angel: null, themes: [],
  search_keywords: String(r.search_keywords || '').split(/[,;]/).filter(Boolean), titleNorm: normalizeLatinSearchText(r.title || ''),
  titleAmharicNorm: (r.title_amharic || '').trim(), keywordsText: String(r.search_keywords || ''),
})) as unknown as MezmurSearchDoc[]

type Out = { slugs: string[]; ms: number; failed: boolean }
const systems: Record<string, (q: string) => Promise<Out>> = {
  async catalog(q) {
    const t = performance.now()
    const res = searchMezmurCatalog(docs, q, { pageSize: 20 })
    return { slugs: res.items.map((i) => i.slug), ms: performance.now() - t, failed: false }
  },
  async specialist(q) {
    const t = performance.now()
    try {
      const res = await searchPublicMezmurLyrics(q, { limit: 20 })
      return { slugs: res.items.map((i) => i.slug), ms: performance.now() - t, failed: false }
    } catch { return { slugs: [], ms: performance.now() - t, failed: true } }
  },
}

systems.buddy = async (q) => {
  const { searchSite } = await import('../../src/lib/search/searchSite.ts')
  const t = performance.now()
  try {
    const res = await searchSite(q, { limit: 12 })
    const slugs = res.results.filter((r) => r.sourceType === 'mezmur').map((r) => r.route.split('/').pop() as string)
    return { slugs, ms: performance.now() - t, failed: false }
  } catch { return { slugs: [], ms: performance.now() - t, failed: true } }
}

const summary: any = { label, when: new Date().toISOString(), systems: {} }
const detail: any[] = []
for (const [name, fn] of Object.entries(systems)) {
  const buckets: Record<string, any> = {}
  for (const q of set) {
    const out = await fn(q.query)
    const rank = out.slugs.indexOf(q.expectedSlug) + 1
    const dup = out.slugs.length - new Set(out.slugs).size
    detail.push({ system: name, id: q.id, kind: q.kind, split: q.split, rank: rank || null, results: out.slugs.length, failed: out.failed })
    for (const key of ['all', q.kind, `split:${q.split}`]) {
      const b = (buckets[key] ||= { n: 0, top1: 0, top3: 0, top5: 0, top20: 0, miss: 0, empty: 0, failed: 0, dup: 0, ms: [] as number[] })
      b.n++; if (rank === 1) b.top1++; if (rank && rank <= 3) b.top3++; if (rank && rank <= 5) b.top5++; if (rank) b.top20++; else b.miss++
      if (!out.slugs.length) b.empty++; if (out.failed) b.failed++; b.dup += dup; b.ms.push(out.ms)
    }
  }
  for (const b of Object.values<any>(buckets)) {
    const sorted = b.ms.sort((x: number, y: number) => x - y)
    b.p50ms = Math.round(sorted[Math.floor(sorted.length / 2)]); b.p95ms = Math.round(sorted[Math.floor(sorted.length * 0.95)] ?? sorted.at(-1)); delete b.ms
  }
  summary.systems[name] = buckets
}
fs.mkdirSync('scripts/search-eval/results', { recursive: true })
fs.writeFileSync(`scripts/search-eval/results/${label}.json`, JSON.stringify({ summary, detail }, null, 1))
for (const [name, buckets] of Object.entries<any>(summary.systems)) {
  console.log(`\n== ${name} (${label})`)
  for (const [k, b] of Object.entries<any>(buckets)) console.log(k.padEnd(24), `n=${b.n}`.padEnd(6), `top1 ${b.top1}`.padEnd(9), `top3 ${b.top3}`.padEnd(9), `top5 ${b.top5}`.padEnd(9), `found@20 ${b.top20}`.padEnd(13), `miss ${b.miss}`.padEnd(8), `fail ${b.failed}`.padEnd(7), `p50 ${b.p50ms}ms p95 ${b.p95ms}ms`)
}
