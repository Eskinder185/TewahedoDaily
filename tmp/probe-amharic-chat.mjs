const base = process.env.VITE_TEWAHEDO_AI_API_URL || 'https://ai.eskinder.dev'

// አብሰራ ገብሬል / አብሰራ ገብሬል። / ዛሬ ጾም ነው።
const hymnQ = '\u12A0\u1265\u1230\u122B \u1308\u1265\u122C\u120D'
const hymnPunct = '\u12A0\u1265\u1230\u122B \u1308\u1265\u122C\u120D\u1362'
const fasting = '\u12DB\u122C \u132E\u121D \u1290\u12CD\u1362'

async function get(path) {
  const res = await fetch(`${base}${path}`)
  const text = await res.text()
  let json
  try {
    json = JSON.parse(text)
  } catch {
    json = text.slice(0, 500)
  }
  return { status: res.status, json }
}

async function postChat(message) {
  const res = await fetch(`${base}/api/chat`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
    body: JSON.stringify({ message }),
  })
  const text = await res.text()
  let json
  try {
    json = JSON.parse(text)
  } catch {
    json = text.slice(0, 800)
  }
  return { status: res.status, json }
}

console.log('base', base)
console.log('hymnQ', hymnQ)
console.log('fasting', fasting)

console.log('\n=== GET /api/hymns/search ===')
console.log(
  JSON.stringify(await get(`/api/hymns/search?q=${encodeURIComponent(hymnQ)}&limit=5`), null, 2).slice(
    0,
    3500,
  ),
)

console.log('\n=== POST /api/chat hymn punct ===')
console.log(JSON.stringify(await postChat(hymnPunct), null, 2).slice(0, 3500))

console.log('\n=== POST /api/chat fasting am ===')
console.log(JSON.stringify(await postChat(fasting), null, 2).slice(0, 3500))

console.log('\n=== POST /api/chat fasting today ===')
console.log(JSON.stringify(await postChat('fasting today'), null, 2).slice(0, 2500))

console.log('\n=== GET /api/calendar/today ===')
console.log(JSON.stringify(await get('/api/calendar/today'), null, 2).slice(0, 2500))
