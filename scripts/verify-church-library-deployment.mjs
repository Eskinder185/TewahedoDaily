#!/usr/bin/env node
/**
 * Deployment Verification Script for Church Library FastAPI Endpoints
 * Checks live OpenAPI schema, endpoint route registration, authentication guards,
 * and contract responses against https://ai.eskinder.dev or VITE_TEWAHEDO_AI_API_URL.
 */

const base = (process.env.VITE_TEWAHEDO_AI_API_URL || 'https://ai.eskinder.dev').replace(/\/$/, '')
const bookId = process.env.TEST_BOOK_ID || '6f33c7b8-b177-40ba-8f8e-660df6af2832'
const staffToken = process.env.CMS_BEARER_TOKEN || process.env.TEWAHEDO_STAFF_TOKEN

console.log('=== CHURCH LIBRARY BACKEND DEPLOYMENT VERIFICATION ===')
console.log(`Target Backend: ${base}`)
console.log(`Test Book ID:   ${bookId}\n`)

let failures = 0

async function check(name, fn) {
  try {
    process.stdout.write(`Testing ${name}... `)
    await fn()
    console.log('PASS')
  } catch (err) {
    console.log(`FAIL\n  -> ${err.message}`)
    failures++
  }
}

// 1. Health check
await check('GET /health endpoint', async () => {
  const res = await fetch(`${base}/health`, { cache: 'no-store' })
  if (res.status !== 200) throw new Error(`Expected 200 OK, got ${res.status}`)
  const body = await res.json().catch(() => null)
  if (body?.status !== 'ok') throw new Error(`Unexpected health body: ${JSON.stringify(body)}`)
})

// 2. OpenAPI Route Registration
const requiredRoutes = [
  '/api/church-library/status',
  '/api/church-library/books/{book_id}/process',
  '/api/church-library/books/{book_id}/status',
  '/api/church-library/books/{book_id}/results',
  '/api/church-library/books/{book_id}/retry',
  '/api/church-library/search',
]

let openapiDoc = null
await check('GET /openapi.json route manifest', async () => {
  const res = await fetch(`${base}/openapi.json`, { cache: 'no-store' })
  if (res.status !== 200) throw new Error(`Could not fetch /openapi.json: ${res.status}`)
  openapiDoc = await res.json()
  const paths = Object.keys(openapiDoc.paths || {})
  const missing = requiredRoutes.filter((r) => !paths.includes(r))
  if (missing.length > 0) {
    throw new Error(
      `OpenAPI missing ${missing.length} Church Library routes:\n     - ${missing.join('\n     - ')}\n` +
      `  (Total deployed routes: ${paths.length}. Deployed image has not been updated with the church_library router.)`
    )
  }
})

// 3. Status Endpoint Authentication Guard (Should return 401 Unauthorized, NEVER 404)
await check('GET /api/church-library/status auth guard', async () => {
  const res = await fetch(`${base}/api/church-library/status`, { cache: 'no-store' })
  if (res.status === 404) {
    throw new Error('Endpoint returned 404 Not Found. Router is NOT active on the live server.')
  }
  if (res.status !== 401 && res.status !== 403) {
    throw new Error(`Expected 401 Unauthorized for anonymous request, got ${res.status}`)
  }
})

// 4. Book Results Endpoint Auth Guard (Should return 401 Unauthorized, NEVER 404)
await check(`GET /api/church-library/books/${bookId}/results auth guard`, async () => {
  const res = await fetch(`${base}/api/church-library/books/${bookId}/results?limit=10&offset=0`, { cache: 'no-store' })
  if (res.status === 404) {
    throw new Error('Endpoint returned 404 Not Found. Results route is NOT active on the live server.')
  }
  if (res.status !== 401 && res.status !== 403) {
    throw new Error(`Expected 401 Unauthorized for anonymous request, got ${res.status}`)
  }
})

// 5. Book Process Endpoint Auth Guard (POST, should return 401 Unauthorized, NEVER 404)
await check(`POST /api/church-library/books/${bookId}/process auth guard`, async () => {
  const res = await fetch(`${base}/api/church-library/books/${bookId}/process`, {
    method: 'POST',
    cache: 'no-store',
  })
  if (res.status === 404) {
    throw new Error('Endpoint returned 404 Not Found. Process route is NOT active on the live server.')
  }
  if (res.status !== 401 && res.status !== 403) {
    throw new Error(`Expected 401 Unauthorized for anonymous request, got ${res.status}`)
  }
})

// 6. Optional: Authenticated Verification with staff JWT
if (staffToken) {
  await check('Authenticated GET /api/church-library/status with staff token', async () => {
    const res = await fetch(`${base}/api/church-library/status`, {
      headers: { Authorization: `Bearer ${staffToken}` },
      cache: 'no-store',
    })
    if (res.status !== 200) {
      const err = await res.text()
      throw new Error(`Expected 200 OK, got ${res.status}: ${err.slice(0, 200)}`)
    }
    const data = await res.json()
    if (data.max_upload_bytes !== 100 * 1024 * 1024) {
      throw new Error(`Expected 100 MiB limit, got ${data.max_upload_bytes}`)
    }
  })
}

console.log('\n---------------------------------------------------------')
if (failures === 0) {
  console.log('ALL DEPLOYMENT VERIFICATION CHECKS PASSED!')
  console.log('The backend is fully operational with all Church Library routes.')
  process.exit(0)
} else {
  console.log(`DEPLOYMENT VERIFICATION FAILED WITH ${failures} ERROR(S).`)
  console.log('Follow the operator deployment instructions below to deploy on VM401.')
  process.exit(1)
}
