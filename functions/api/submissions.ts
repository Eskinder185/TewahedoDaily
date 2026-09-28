import { validateSubmission } from '../../src/lib/community/validation.ts'
import { bundledMezmur } from '../lib/legacyTargets.ts'
export type SubmissionEnv = { SUPABASE_URL: string; SUPABASE_SERVICE_ROLE_KEY: string; TURNSTILE_SECRET_KEY: string; SUBMISSION_IP_HASH_SECRET: string; SITE_URL: string }
type Context = { request: Request; env: SubmissionEnv }
const respond = (body: unknown, status = 200) => new Response(JSON.stringify(body), { status, headers: { 'Content-Type': 'application/json', 'Cache-Control': 'no-store', 'X-Content-Type-Options': 'nosniff' } })
async function readBody(request: Request) {
  if (!request.headers.get('content-type')?.startsWith('application/json')) throw new Error('Send a JSON submission.')
  const reader = request.body?.getReader()
  if (!reader) throw new Error('Submission is empty.')
  const chunks: Uint8Array[] = []; let size = 0
  while (true) {
    const { value, done } = await reader.read()
    if (done) break
    size += value.byteLength
    if (size > 384 * 1024) { await reader.cancel(); throw new Error('Submission is too large.') }
    chunks.push(value)
  }
  const bytes = new Uint8Array(size); let offset = 0
  for (const chunk of chunks) { bytes.set(chunk, offset); offset += chunk.length }
  try { return JSON.parse(new TextDecoder().decode(bytes)) as Record<string, unknown> } catch { throw new Error('Invalid JSON submission.') }
}
async function clientHash(ip: string, secret: string) {
  const key = await crypto.subtle.importKey('raw', new TextEncoder().encode(secret), { name: 'HMAC', hash: 'SHA-256' }, false, ['sign'])
  const signature = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(ip))
  return [...new Uint8Array(signature)].map(byte => byte.toString(16).padStart(2, '0')).join('')
}
export async function onRequest({ request, env }: Context): Promise<Response> {
  if (request.method !== 'POST') return respond({ error: 'Method not allowed.' }, 405)
  if (!env.SUPABASE_URL || !env.SUPABASE_SERVICE_ROLE_KEY || !env.TURNSTILE_SECRET_KEY || !env.SITE_URL || !env.SUBMISSION_IP_HASH_SECRET) return respond({ error: 'Submissions are temporarily unavailable. Please try again later.' }, 503)
  let origin: string
  try { origin = new URL(env.SITE_URL).origin } catch { return respond({ error: 'Submissions are temporarily unavailable.' }, 503) }
  if (request.headers.get('Origin') !== origin || new URL(request.url).origin !== origin) return respond({ error: 'Submission origin not allowed.' }, 403)
  let raw: Record<string, unknown>; let payload: ReturnType<typeof validateSubmission>
  try {
    raw = await readBody(request)
    if (raw.website) throw new Error('Submission could not be accepted.')
    payload = validateSubmission(raw)
    if (typeof raw.turnstile_token !== 'string' || !raw.turnstile_token || raw.turnstile_token.length > 2048) throw new Error('Complete the verification challenge and try again.')
  } catch (cause) { return respond({ error: cause instanceof Error ? cause.message : 'Invalid submission.' }, 400) }
  const ip = request.headers.get('CF-Connecting-IP')
  if (!ip) return respond({ error: 'Unable to verify the request. Please try again.' }, 403)
  async function database(path: string, body?: unknown) {
    const key = env.SUPABASE_SERVICE_ROLE_KEY
    const response = await fetch(`${env.SUPABASE_URL.replace(/\/$/, '')}/rest/v1/${path}`, {
      method: body ? 'POST' : 'GET', headers: { apikey: key, ...(key.startsWith('sb_secret_') ? {} : { Authorization: `Bearer ${key}` }), 'Content-Type': 'application/json' },
      body: body ? JSON.stringify(body) : undefined, signal: AbortSignal.timeout(8000),
    })
    if (!response.ok) throw new Error('Database unavailable')
    return response.json()
  }
  try {
    const verification = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ secret: env.TURNSTILE_SECRET_KEY, response: raw.turnstile_token, remoteip: ip }), signal: AbortSignal.timeout(8000) })
    const result = await verification.json() as { success?: boolean; hostname?: string; action?: string }
    if (!verification.ok || !result.success || result.hostname !== new URL(origin).hostname || result.action !== 'community_submission') return respond({ error: 'Verification expired or failed. Complete the challenge again.' }, 400)
    const target: Record<string, unknown> = { related_content_id: null, related_legacy_key: null, related_content_title: null, current_page_url: null }
    if (payload.submission_type === 'correction') {
      let page: URL
      try { page = new URL(payload.current_page_url) } catch { return respond({ error: 'Open the correction form from a valid Mezmur page.' }, 400) }
      if (page.origin !== origin || !/^\/practice\/mezmur\/[^/]+$/.test(page.pathname)) return respond({ error: 'Open the correction form from a valid Mezmur page.' }, 400)
      let title = ''
      if (payload.related_content_id) {
        if (!/^[a-f0-9-]{36}$/i.test(payload.related_content_id)) return respond({ error: 'Invalid Mezmur reference.' }, 400)
        const rows = await database(`mezmur?select=id,title&status=eq.published&id=eq.${encodeURIComponent(payload.related_content_id)}`) as { title: string }[]
        if (!rows.length) return respond({ error: 'The selected Mezmur is not publicly available.' }, 400)
        title = rows[0].title; target.related_content_id = payload.related_content_id
      } else {
        const rows = await database(`chants?select=key,title&published=eq.true&form=eq.mezmur&key=eq.${encodeURIComponent(payload.related_legacy_key)}`) as { title: string }[]
        title = rows[0]?.title || bundledMezmur(payload.related_legacy_key)?.title || ''
        if (!title) return respond({ error: 'The selected Mezmur was not found.' }, 400)
        target.related_legacy_key = payload.related_legacy_key
      }
      target.related_content_title = title.slice(0, 200); target.current_page_url = origin + page.pathname
      payload.title = title.slice(0, 200)
    }
    const response = await database('rpc/receive_community_submission', { payload: { ...payload, ...target }, client_hash: await clientHash(ip, env.SUBMISSION_IP_HASH_SECRET) }) as { reference?: string; error?: string; repeated?: boolean }
    if (response.error === 'rate_limited') return respond({ error: 'Too many submissions. Please try again in an hour.' }, 429)
    if (!response.reference || !/^TD-\d{4}-\d{5,}$/.test(response.reference)) throw new Error('Invalid receipt')
    return respond({ reference: response.reference, repeated: response.repeated === true }, 201)
  } catch { return respond({ error: 'We could not save your submission. Your form has been kept; please try again.' }, 503) }
}
