const base = 'https://ai.eskinder.dev'
const token = '\u12A0\u1265\u1230\u122B'

async function show(label, path) {
  const j = await (await fetch(base + path)).json()
  console.log('\n' + label)
  console.log(JSON.stringify(j, null, 2).slice(0, 1400))
}

await show('hymn', `/api/hymns/search?q=${encodeURIComponent(token)}&limit=2`)
await show('prayer', `/api/prayers/search?q=${encodeURIComponent(token)}&limit=2`)
await show('bible', `/api/bible/search?q=${encodeURIComponent(token)}&language=am&limit=2`)
await show(
  'syn',
  `/api/synaxarium/search?q=${encodeURIComponent('\u1308\u1265\u122D\u12A4\u120D')}&limit=2`,
)

for (const message of ['calendar today', "today's Synaxarium", 'fasting today']) {
  const c = await (
    await fetch(`${base}/api/chat`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ message }),
    })
  ).json()
  console.log('\nchat', message, '=>', c.type, Object.keys(c))
}
