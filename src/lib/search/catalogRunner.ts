/**
 * Runs one website-search catalog with a time budget, one bounded retry for
 * transient failures, and a precise outcome. A slow or failing catalog never
 * blocks or hides the results of the others.
 *
 * Pure apart from timers; never logs query text or user data.
 */
import type { CatalogOutcome, SiteSearchResult } from './types'

export type CatalogRun = {
  name: string
  results: SiteSearchResult[]
  failed: boolean
  outcome: CatalogOutcome
}

export type CatalogRunOptions = {
  /** Time budget per attempt (ms). */
  timeoutMs?: number
  /** Extra attempts after a timeout / unavailable outcome (default 1). */
  retries?: number
  /** Delay before a retry (ms). */
  retryDelayMs?: number
  /** Cancels the whole search (user typed again or closed the panel). */
  signal?: AbortSignal
}

export class CatalogTimeoutError extends Error {
  constructor(name: string, ms: number) {
    super(`${name} did not respond within ${ms} ms`)
    this.name = 'CatalogTimeoutError'
  }
}

function isAbort(error: unknown): boolean {
  return (
    (error instanceof DOMException && error.name === 'AbortError') ||
    (error instanceof Error && error.name === 'AbortError')
  )
}

/** Map an error from fetch / PostgREST / our API into a catalog outcome. */
export function classifyCatalogError(error: unknown): Exclude<CatalogOutcome, 'success_with_results' | 'success_empty'> {
  if (error instanceof CatalogTimeoutError) return 'timeout'
  const e = (error ?? {}) as { name?: string; code?: string | number; status?: number; message?: string }
  const code = String(e.code ?? '')
  const status = Number(e.status ?? NaN)
  const message = String(e.message ?? '').toLowerCase()
  if (e.name === 'TimeoutError' || code === '57014' || /statement timeout|timed out|timeout/.test(message)) return 'timeout'
  if (status === 401 || status === 403 || code === '42501' || code === 'PGRST301' || code === 'PGRST302' || /permission denied|jwt|not authorized|unauthori[sz]ed/.test(message)) {
    return 'unauthorized'
  }
  if (
    (Number.isFinite(status) && status >= 500) ||
    status === 0 ||
    status === 429 ||
    /^PGRST00\d$/.test(code) ||
    code === '08006' ||
    code === '08001' ||
    (error instanceof TypeError && /fetch|network|load failed/.test(message)) ||
    /failed to fetch|networkerror|network request failed|service unavailable|bad gateway|not configured/.test(message)
  ) {
    return 'unavailable'
  }
  return 'query_error'
}

export function isTransientOutcome(outcome: CatalogOutcome): boolean {
  return outcome === 'timeout' || outcome === 'unavailable'
}

function withTimeout<T>(name: string, ms: number, run: (signal: AbortSignal) => Promise<T>, parent?: AbortSignal): Promise<T> {
  const controller = new AbortController()
  const onParentAbort = () => controller.abort(parent?.reason)
  if (parent?.aborted) controller.abort(parent.reason)
  else parent?.addEventListener('abort', onParentAbort, { once: true })
  let timer: ReturnType<typeof setTimeout> | undefined
  const timeout = new Promise<never>((_, reject) => {
    timer = setTimeout(() => {
      controller.abort(new CatalogTimeoutError(name, ms))
      reject(new CatalogTimeoutError(name, ms))
    }, ms)
  })
  const abort = new Promise<never>((_, reject) => {
    if (!parent) return
    const fail = () => reject(new DOMException('The operation was aborted.', 'AbortError'))
    if (parent.aborted) fail()
    else parent.addEventListener('abort', fail, { once: true })
  })
  return Promise.race([run(controller.signal), timeout, abort]).finally(() => {
    if (timer) clearTimeout(timer)
    parent?.removeEventListener('abort', onParentAbort)
  })
}

const sleep = (ms: number, signal?: AbortSignal) =>
  new Promise<void>((resolve, reject) => {
    if (signal?.aborted) return reject(new DOMException('The operation was aborted.', 'AbortError'))
    const t = setTimeout(resolve, ms)
    signal?.addEventListener('abort', () => {
      clearTimeout(t)
      reject(new DOMException('The operation was aborted.', 'AbortError'))
    }, { once: true })
  })

export async function runCatalog<T>(
  name: string,
  work: (signal: AbortSignal) => Promise<T>,
  map: (value: T) => SiteSearchResult[],
  options: CatalogRunOptions = {},
): Promise<CatalogRun> {
  const timeoutMs = options.timeoutMs ?? 6000
  const retries = Math.max(0, Math.min(2, options.retries ?? 1))
  let outcome: CatalogOutcome = 'unavailable'
  for (let attempt = 0; attempt <= retries; attempt++) {
    try {
      // Bounded: a retry gets half the budget, so one catalog waits at most 1.5× its timeout.
      const budget = attempt === 0 ? timeoutMs : Math.round(timeoutMs / 2)
      const value = await withTimeout(name, budget, work, options.signal)
      const results = map(value)
      return { name, results, failed: false, outcome: results.length ? 'success_with_results' : 'success_empty' }
    } catch (error) {
      if (options.signal?.aborted || (isAbort(error) && !(error instanceof CatalogTimeoutError))) {
        throw new DOMException('The operation was aborted.', 'AbortError')
      }
      outcome = classifyCatalogError(error)
      if (!isTransientOutcome(outcome) || attempt === retries) break
      await sleep(options.retryDelayMs ?? 300, options.signal)
    }
  }
  return { name, results: [], failed: true, outcome }
}
