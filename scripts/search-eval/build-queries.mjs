/**
 * Build a deterministic Mezmur evaluation set from a published-hymn snapshot.
 * Usage: node scripts/search-eval/build-queries.mjs <snapshot.json> [out.json]
 * Expected slugs are recorded here, BEFORE any ranking change, from the snapshot itself.
 * Split: every 5th query is held out (never inspected while tuning).
 */
import fs from 'node:fs'
const [, , snapPath, outPath = 'scripts/search-eval/mezmur-queries.json'] = process.argv
const rows = JSON.parse(fs.readFileSync(snapPath, 'utf8'))
let seed = 20261112
const rnd = () => ((seed = (seed * 1664525 + 1013904223) >>> 0) / 2 ** 32)
const pick = (arr) => arr[Math.floor(rnd() * arr.length)]
const norm = (s) => (s || '').normalize('NFKD').replace(/[̀-ͯ]/g, '').toLowerCase().replace(/[^\p{L}\p{N}\s]/gu, ' ').replace(/\s+/g, ' ').trim()
const titleCount = new Map()
for (const r of rows) titleCount.set(norm(r.title), (titleCount.get(norm(r.title)) || 0) + 1)
const unique = rows.filter((r) => r.title && r.title.length > 5 && titleCount.get(norm(r.title)) === 1)
const lyricLine = (text) => {
  const lines = (text || '').split(/\n/).map((l) => l.replace(/\/\d+\//g, ' ').replace(/\s+/g, ' ').trim()).filter((l) => l.split(' ').length >= 4)
  return lines.length ? lines[Math.floor(lines.length / 2)] : null
}
// Plausible user spelling drift: doubled letters collapse, common vowel/consonant swaps. Deterministic per slug.
const drift = (t) => {
  const s = norm(t)
  const variants = [s.replace(/(.)\1/g, '$1'), s.replace(/ee/g, 'i').replace(/oo/g, 'u'), s.replace(/h/g, ''), s.replace(/ts/g, 'ce'), s.replace(/k/g, 'q'), s.replace(/y/g, 'i')]
  return variants.find((v) => v !== s && v.length > 3) || null
}
const queries = []
const add = (kind, q, slug, lang) => { if (q && slug) queries.push({ kind, query: q, expectedSlug: slug, queryLanguage: lang }) }
const latin = unique.filter((r) => /^[\x00-\x7f]+$/.test(r.title))
const amh = unique.filter((r) => r.title_amharic && /[ሀ-፿]/.test(r.title_amharic))
const withLyr = unique.filter((r) => lyricLine(r.lyrics_amharic) || lyricLine(r.lyrics_transliteration))
const take = (arr, n) => { const out = new Set(); while (out.size < Math.min(n, arr.length)) out.add(pick(arr)); return [...out] }
for (const r of take(latin, 18)) add('title-exact', r.title, r.slug, 'latin')
for (const r of take(latin, 16)) { const d = drift(r.title); if (d) add('title-spelling-drift', d, r.slug, 'latin') }
for (const r of take(latin, 10)) { const w = norm(r.title).split(' '); if (w.length > 2) add('title-partial', w.slice(0, 2).join(' '), r.slug, 'latin') }
for (const r of take(amh, 16)) add('title-amharic', r.title_amharic.trim(), r.slug, 'amharic')
for (const r of take(withLyr, 18)) { const l = lyricLine(r.lyrics_transliteration); if (l) add('lyric-transliteration', l, r.slug, 'latin') }
for (const r of take(withLyr, 14)) { const l = lyricLine(r.lyrics_amharic); if (l) add('lyric-amharic', l, r.slug, 'amharic') }
for (const r of take(withLyr, 8)) { const l = lyricLine(r.lyrics_transliteration); if (l) add('lyric-with-request', `find the hymn with the words ${l}`, r.slug, 'latin') }
// Appended last so earlier query ids and the tune/held-out split stay stable.
// Amharic vowel drift: a distinctive lyric line with the vowel form of up to two letters changed in one word each
// (the typo/ear error people make: ይበራል / ያበራል / ይብራል). Strict matching cannot find these.
const shiftVowel = (w, at) => { const out = [...w]; const k = out[at].codePointAt(0); if (k < 0x1200 || k > 0x1357) return null; const row = Math.floor((k - 0x1200) / 8) * 8; const cur = (k - 0x1200) % 8; const next = 0x1200 + row + ((cur + 3) % 7); out[at] = String.fromCodePoint(next); return out.join('') }
let made = 0
for (const r of take(withLyr, 40)) {
  if (made >= 14) break
  const l = lyricLine(r.lyrics_amharic); if (!l) continue
  const words = l.split(' '); const idx = words.findIndex((w) => w.length >= 4 && /[ሀ-ፗ]/.test(w)); if (idx < 0) continue
  const mutated = shiftVowel(words[idx], 1); if (!mutated || mutated === words[idx]) continue
  words[idx] = mutated
  add('amharic-vowel-drift', words.join(' '), r.slug, 'amharic'); made++
}
queries.forEach((q, i) => { q.id = `m${String(i + 1).padStart(3, '0')}`; q.split = (i + 1) % 5 === 0 ? 'heldout' : 'tune' })
fs.writeFileSync(outPath, JSON.stringify({ generatedFrom: 'published mezmur_public snapshot', seed: 20261112, count: queries.length, queries }, null, 1))
console.log(queries.length, 'queries ->', outPath)
const byKind = {}; for (const q of queries) byKind[q.kind] = (byKind[q.kind] || 0) + 1; console.log(byKind)
