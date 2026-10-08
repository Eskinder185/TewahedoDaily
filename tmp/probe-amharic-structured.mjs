/**
 * Live probe: structured Amharic retrieval against the AI API
 * (mirrors frontend/backend routing; does not send Ethiopic to /api/chat).
 */
const base = process.env.VITE_TEWAHEDO_AI_API_URL || 'http://10.0.0.86:8000'

const hymnPunct = '\u12A0\u1265\u1230\u122B \u1308\u1265\u122C\u120D\u1362'
const fastingPunct = '\u12DB\u122C \u133E\u121D \u1290\u12CD\u1362'

function normalizeAmharic(text) {
  return text
    .replace(/[\u1362\u1363\u1364\u1365\u1366\u1367\u061F?!.,;:\u2026]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

async function get(path) {
  const res = await fetch(`${base}${path}`)
  const json = await res.json()
  return { status: res.status, json }
}

async function postChat(message) {
  const res = await fetch(`${base}/api/chat`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
    body: JSON.stringify({ message }),
  })
  return { status: res.status, json: await res.json() }
}

function summarizeHymn(payload) {
  const results = payload?.results || []
  return {
    count: results.length,
    first: results[0]
      ? {
          slug: results[0].slug,
          title_amharic: results[0].title_amharic,
          title: results[0].title || results[0].title_english,
        }
      : null,
  }
}

async function structuredAmharic(raw) {
  const normalized = normalizeAmharic(raw)
  const fastingPatterns = [
    '\u12DB\u122C \u133E\u121D \u1290\u12CD',
    '\u12DB\u122C \u133E\u121D',
  ]
  if (fastingPatterns.some((p) => normalized === p || normalized.includes(p))) {
    const via = await postChat('fasting today')
    return { path: 'alias->english_chat', type: via.json?.type, keys: Object.keys(via.json || {}) }
  }

  let hymn = await get(`/api/hymns/search?q=${encodeURIComponent(normalized)}&limit=12`)
  let summary = summarizeHymn(hymn.json)
  if (!summary.count) {
    const tokens = normalized.split(/\s+/).filter((t) => t.length >= 2)
    const merged = []
    const seen = new Set()
    for (const token of tokens) {
      const part = await get(`/api/hymns/search?q=${encodeURIComponent(token)}&limit=8`)
      for (const row of part.json?.results || []) {
        const key = String(row.slug || row.id || row.title_amharic || '')
        if (!key || seen.has(key)) continue
        seen.add(key)
        merged.push(row)
      }
    }
    summary = summarizeHymn({ results: merged })
  }
  if (summary.count) {
    return { path: 'hymn_search', type: 'hymn_search', ...summary }
  }
  return { path: 'unknown', type: 'unknown' }
}

console.log('base', base)
console.log('normalized hymn', normalizeAmharic(hymnPunct))
console.log('normalized fasting', normalizeAmharic(fastingPunct))

console.log('\n=== structured hymn ===')
console.log(JSON.stringify(await structuredAmharic(hymnPunct), null, 2))

console.log('\n=== structured fasting ===')
console.log(JSON.stringify(await structuredAmharic(fastingPunct), null, 2))

console.log('\n=== raw /api/chat hymn (baseline — expect ai/corrupt) ===')
const rawHymn = await postChat(hymnPunct)
console.log(rawHymn.status, rawHymn.json?.type, String(rawHymn.json?.message || rawHymn.json?.text || '').slice(0, 120))

console.log('\n=== English fasting today ===')
const en = await postChat('fasting today')
console.log(en.status, en.json?.type, Object.keys(en.json || {}))
