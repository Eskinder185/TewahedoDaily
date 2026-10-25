const base = process.env.VITE_TEWAHEDO_AI_API_URL?.replace(/\/$/, '')
if (!base) throw new Error('VITE_TEWAHEDO_AI_API_URL is not configured.')

const response = await fetch(`${base}/api/church-library/status`, {
  headers: { Accept: 'application/json' },
  cache: 'no-store',
})
const body = await response.text()
console.log(`GET /api/church-library/status -> ${response.status}`)
if (response.status === 401 || response.status === 403) {
  console.log('PASS route exists and rejects an unauthenticated request.')
} else if (response.status === 404) {
  console.log(`FAIL route is not deployed: ${body.slice(0, 300)}`)
  process.exitCode = 1
} else if (response.ok) {
  console.log('WARNING route returned success without a staff access token; review backend authentication.')
  process.exitCode = 1
} else {
  console.log(`FAIL processing API returned: ${body.slice(0, 300)}`)
  process.exitCode = 1
}
