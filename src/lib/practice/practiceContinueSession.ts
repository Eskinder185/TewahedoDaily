const KEY = 'td-practice-continue-v1'

export type PracticeContinueSession = {
  slug: string
  title: string
  route: string
  audioUrl?: string | null
  at: number
}

export function rememberPracticeContinue(session: Omit<PracticeContinueSession, 'at' | 'route'> & { route?: string }) {
  const slug = session.slug.trim()
  if (!slug) return
  const payload: PracticeContinueSession = {
    slug,
    title: session.title.trim() || slug,
    route: session.route?.trim() || `/practice/mezmur/${slug}`,
    audioUrl: session.audioUrl || null,
    at: Date.now(),
  }
  try {
    sessionStorage.setItem(KEY, JSON.stringify(payload))
    window.dispatchEvent(new CustomEvent('td-practice-continue'))
  } catch {
    /* ignore */
  }
}

export function getPracticeContinue(): PracticeContinueSession | null {
  try {
    const raw = sessionStorage.getItem(KEY)
    if (!raw) return null
    const parsed = JSON.parse(raw) as PracticeContinueSession
    if (!parsed?.slug || !parsed?.route) return null
    return parsed
  } catch {
    return null
  }
}

export function clearPracticeContinue() {
  try {
    sessionStorage.removeItem(KEY)
    window.dispatchEvent(new CustomEvent('td-practice-continue'))
  } catch {
    /* ignore */
  }
}
