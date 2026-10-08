/**
 * Bible page: typed/voice refs use resolveBibleQuery → POST /api/chat.
 * Run: npm run test:bible-page-chat-refs
 */
import assert from 'node:assert/strict'
import { looksLikeAmharicBibleReference } from '../src/lib/searchBuddy/amharicStructuredSearch.ts'
import { canResolveBibleQuery, resolveBibleQuery } from '../src/lib/search/resolveBibleQuery.ts'
import { searchBibleShared, resolveSharedBibleDestination } from '../src/lib/search/sharedBibleSearch.ts'

const CASES = [
  {
    raw: '\u12E8\u12EE\u1200\u1295\u1235 \u12CB\u1295\u130C\u120D \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u1236\u1235\u1275',
    reference: 'John 2:3',
    routePrefix: '/bible/john/2',
  },
  {
    raw: '\u12A6\u122A\u1275 \u12D8\u134D\u1325\u1228\u1275 \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u12A0\u1295\u12F5',
    reference: 'Genesis 2:1',
    routePrefix: '/bible/genesis/2',
  },
  {
    raw: '\u12EE\u1210\u1295\u1235 3\u136516',
    reference: 'John 3:16',
    routePrefix: '/bible/john/3',
  },
]

for (const c of CASES) {
  assert.equal(looksLikeAmharicBibleReference(c.raw), true, `bible-like for ${c.reference}`)
}
console.log('bible-like signals: ok')

if (!canResolveBibleQuery()) {
  console.log('test-bible-page-chat-refs: skipped live API')
  process.exit(0)
}

async function withRetry(fn, label, attempts = 3) {
  let last
  for (let i = 0; i < attempts; i += 1) {
    try {
      return await fn()
    } catch (error) {
      last = error
      if (error?.code === 'unavailable' || error?.code === 'timeout') {
        await new Promise((r) => setTimeout(r, 400 * (i + 1)))
        continue
      }
      throw error
    }
  }
  throw last
}

for (const c of CASES) {
  const direct = await withRetry(() => resolveBibleQuery(c.raw), c.reference)
  assert.equal(direct.resolved, true, `resolveBibleQuery resolved ${c.reference}`)
  assert.equal(direct.response.type, 'bible_reference')
  assert.equal(
    direct.response.type === 'bible_reference' ? direct.response.reference : null,
    c.reference,
  )
  assert.ok(direct.route?.startsWith(c.routePrefix), `route ${direct.route}`)

  const page = await withRetry(
    () => searchBibleShared(c.raw, { language: 'am', textLimit: 8 }),
    `page ${c.reference}`,
  )
  assert.equal(page.source, 'buddy-api')
  assert.equal(page.structured?.type, 'bible_reference')
  assert.equal(page.empty, false)
  assert.equal(page.directReference, true)
  if (page.structured?.type === 'bible_reference') {
    assert.equal(page.structured.reference, c.reference)
  }
  const dest = resolveSharedBibleDestination(page)
  assert.ok(dest?.startsWith(c.routePrefix), `page dest ${dest}`)

  console.log(
    JSON.stringify({
      raw: c.raw,
      reference: c.reference,
      route: direct.route,
      pageRoute: dest,
    }),
  )
}

console.log('test-bible-page-chat-refs: ok')
