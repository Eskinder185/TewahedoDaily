/**
 * LOCAL PREVIEW write guard. Called only when LOCAL_PREVIEW is true (see main.tsx).
 *
 * Every non-read request to the configured Supabase origin is refused in the browser before it leaves the machine, so a
 * local preview can never write progress, XP, drafts or anything else to a hosted database, even if the person is signed in.
 * Reads (GET/HEAD) pass through: the preview still uses public, read-only data such as published hymns.
 * Blocked attempts are recorded on `window.__localPreviewBlocked` so tests and the review screen can show them.
 */
export type BlockedWrite = { method: string; url: string; at: string }

export function installLocalPreviewWriteGuard() {
  const target = (() => { try { return new URL(String(import.meta.env.VITE_SUPABASE_URL)).origin } catch { return '' } })()
  const blocked: BlockedWrite[] = []
  ;(window as unknown as { __localPreviewBlocked: BlockedWrite[]; __localPreviewGuard: string }).__localPreviewBlocked = blocked
  ;(window as unknown as { __localPreviewGuard: string }).__localPreviewGuard = target || 'no-supabase-origin'
  const realFetch = window.fetch.bind(window)
  window.fetch = (input, init) => {
    const request = input instanceof Request ? input : null
    const url = request ? request.url : String(input instanceof URL ? input.href : input)
    const method = (init?.method ?? request?.method ?? 'GET').toUpperCase()
    let origin = ''
    try { origin = new URL(url, window.location.href).origin } catch { /* relative or invalid URLs are not the hosted origin */ }
    if (target && origin === target && method !== 'GET' && method !== 'HEAD') {
      blocked.push({ method, url, at: new Date().toISOString() })
      console.warn(`[LOCAL PREVIEW] Blocked ${method} ${url}: hosted writes are disabled in the local preview.`)
      return Promise.resolve(new Response(JSON.stringify({ message: 'Blocked by the local preview write guard' }), { status: 403, headers: { 'content-type': 'application/json' } }))
    }
    return realFetch(input, init)
  }
}
