/**
 * Deterministic Bible verse evaluation set from live public verses (anon read-only).
 * node --env-file=.env.local scripts/search-eval/build-bible-queries.mjs
 * Kinds: exact-phrase (control), english-typo (one word misspelled), amharic-vowel-drift (one word's vowel form changed).
 * Expected verse ids are recorded here, before any ranking change. Every 5th query is held out.
 */
import fs from 'node:fs'
const url = process.env.VITE_SUPABASE_URL, key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY
if (!url || !key) throw new Error('Supabase env missing')
let seed = 20261113
const rnd = () => ((seed = (seed * 1664525 + 1013904223) >>> 0) / 2 ** 32)
const SEL = 'id,text,verse_number,bible_chapters!inner(chapter_number,bible_source_books!inner(bible_editions!inner(code),bible_canonical_books!inner(slug)))'
async function page(code, offset) {
  const r = await fetch(`${url}/rest/v1/bible_verses?select=${encodeURIComponent(SEL)}&bible_chapters.bible_source_books.bible_editions.code=eq.${code}&order=id&offset=${offset}&limit=40`, { headers: { apikey: key, Authorization: `Bearer ${key}` } })
  if (!r.ok) throw new Error(`${code} ${r.status}`)
  return r.json()
}
const words = (t) => t.split(/\s+/).filter(Boolean)
const typo = (w) => { const i = Math.max(1, Math.floor(w.length / 2)); return w.slice(0, i - 1) + w[i] + w[i - 1] + w.slice(i + 1) } // transposition
const shiftVowel = (w) => { const out = [...w]; const k = out[1].codePointAt(0); if (k < 0x1200 || k > 0x1357) return null; const row = Math.floor((k - 0x1200) / 8) * 8; out[1] = String.fromCodePoint(0x1200 + row + (((k - 0x1200) % 8) + 3) % 7); return out.join('') }
const out = []
const add = (kind, query, row, lang) => out.push({ kind, query, expectedVerseId: row.id, ref: `${row.bible_chapters.bible_source_books.bible_canonical_books.slug} ${row.bible_chapters.chapter_number}:${row.verse_number}`, queryLanguage: lang })
const pool = { web: [], am: [] }
for (const code of ['web', 'am']) for (let n = 0; n < 8; n++) pool[code].push(...await page(code, Math.floor(rnd() * 30000)))
const usable = (code) => pool[code].filter((r) => words(r.text).length >= 8 && words(r.text).length <= 30)
const phrase = (r, n = 5) => { const w = words(r.text.replace(/[“”"‘’]/g, '')); const s = Math.floor(rnd() * Math.max(1, w.length - n)); return w.slice(s, s + n) }
const pickN = (arr, n) => { const s = new Set(); while (s.size < Math.min(n, arr.length)) s.add(arr[Math.floor(rnd() * arr.length)]); return [...s] }
for (const r of pickN(usable('web'), 12)) add('exact-phrase', phrase(r).join(' ').replace(/[.,;:!?]/g, ''), r, 'en')
for (const r of pickN(usable('web'), 20)) { const p = phrase(r).map((w) => w.replace(/[.,;:!?]/g, '')); const i = p.findIndex((w) => w.length >= 5); if (i < 0) continue; p[i] = typo(p[i]); add('english-typo', p.join(' '), r, 'en') }
for (const r of pickN(usable('am'), 12)) add('exact-phrase', phrase(r, 4).join(' ').replace(/[።፣፤፥፦፧]/g, ''), r, 'am')
for (const r of pickN(usable('am'), 20)) { const p = phrase(r, 4).map((w) => w.replace(/[።፣፤፥፦፧]/g, '')); const i = p.findIndex((w) => w.length >= 4); if (i < 0) continue; const m = shiftVowel(p[i]); if (!m || m === p[i]) continue; p[i] = m; add('amharic-vowel-drift', p.join(' '), r, 'am') }
out.forEach((q, i) => { q.id = `b${String(i + 1).padStart(3, '0')}`; q.split = (i + 1) % 5 === 0 ? 'heldout' : 'tune' })
fs.writeFileSync('scripts/search-eval/bible-queries.json', JSON.stringify({ seed: 20261113, count: out.length, queries: out }, null, 1))
const by = {}; for (const q of out) by[q.kind] = (by[q.kind] || 0) + 1
console.log(out.length, by)
