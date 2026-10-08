import { getAiApiBaseUrl } from './aiConfig.ts'
import { mapHttpStatusToAiError } from './aiErrors.ts'
import { AiClientError } from './aiTypes.ts'
import { supabase } from '../supabase/client.ts'

export type AiRequestOptions = {
  method?: 'GET' | 'POST'
  path: string
  body?: BodyInit | null
  json?: unknown
  headers?: Record<string, string>
  timeoutMs: number
  signal?: AbortSignal
  /** When true, attach Supabase access token if a session exists (optional auth). */
  withAuth?: boolean
}

async function resolveAccessToken(): Promise<string | null> {
  if (!supabase) return null
  try {
    const { data } = await supabase.auth.getSession()
    return data.session?.access_token ?? null
  } catch {
    return null
  }
}

function combineSignals(timeoutMs: number, outer?: AbortSignal): {
  signal: AbortSignal
  cleanup: () => void
} {
  const controller = new AbortController()
  const timer = globalThis.setTimeout(() => controller.abort(), timeoutMs)

  const onOuterAbort = () => controller.abort()
  if (outer) {
    if (outer.aborted) controller.abort()
    else outer.addEventListener('abort', onOuterAbort, { once: true })
  }

  return {
    signal: controller.signal,
    cleanup: () => {
      globalThis.clearTimeout(timer)
      if (outer) outer.removeEventListener('abort', onOuterAbort)
    },
  }
}

/**
 * Low-level AI gateway request. Never throws raw stack traces to UI —
 * callers should map via friendlyAiError().
 */
export async function aiFetch<T>(options: AiRequestOptions): Promise<T> {
  const base = getAiApiBaseUrl()
  if (!base) {
    throw new AiClientError('not_configured', 'AI API is not configured.')
  }

  const headers: Record<string, string> = {
    Accept: 'application/json',
    ...(options.headers || {}),
  }

  let body = options.body ?? null
  if (options.json !== undefined) {
    headers['Content-Type'] = 'application/json'
    body = JSON.stringify(options.json)
  }

  if (options.withAuth) {
    const token = await resolveAccessToken()
    if (token) headers.Authorization = `Bearer ${token}`
  }

  const { signal, cleanup } = combineSignals(options.timeoutMs, options.signal)
  try {
    const response = await fetch(`${base}${options.path}`, {
      method: options.method || (options.json !== undefined || body ? 'POST' : 'GET'),
      headers,
      body,
      signal,
    })

    if (!response.ok) {
      let detail = ''
      try {
        detail = (await response.text()).slice(0, 200)
      } catch {
        /* ignore */
      }
      throw mapHttpStatusToAiError(response.status, detail || undefined)
    }

    if (response.status === 204) return undefined as T
    try {
      return (await response.json()) as T
    } catch {
      throw new AiClientError('unknown', 'The assistant returned invalid JSON.')
    }
  } catch (error) {
    if (error instanceof AiClientError) throw error
    if (error instanceof DOMException && error.name === 'AbortError') {
      if (options.signal?.aborted) {
        throw new AiClientError('aborted', 'Request cancelled.')
      }
      throw new AiClientError('timeout', 'Request timed out.')
    }
    if (typeof navigator !== 'undefined' && navigator.onLine === false) {
      throw new AiClientError('network', 'You appear to be offline.')
    }
    throw new AiClientError('network', 'Network unavailable.')
  } finally {
    cleanup()
  }
}
