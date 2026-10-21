import { translate } from '../../i18n/index.ts'
import type { UiLocale } from '../i18n/localeHelpers.ts'
import { parseRetryAfterHeader } from '../ai/aiErrors.ts'
import { AiClientError, type AiErrorCode } from '../ai/aiTypes.ts'

export { parseRetryAfterHeader }

const ERROR_KEYS: Record<string, string> = {
  not_configured: 'searchBuddy.errors.notConfigured',
  network: 'searchBuddy.errors.network',
  timeout: 'searchBuddy.errors.timeout',
  unavailable: 'searchBuddy.errors.unavailable',
  rate_limited: 'searchBuddy.errors.rateLimited',
  bad_request: 'searchBuddy.errors.badRequest',
  unauthorized: 'searchBuddy.errors.unauthorized',
  unknown: 'searchBuddy.errors.unknown',
  offline: 'searchBuddy.errors.offline',
}

function asAiClientError(error: unknown): AiClientError | null {
  if (error instanceof AiClientError) return error
  if (
    typeof error === 'object' &&
    error !== null &&
    (error as { name?: string }).name === 'AiClientError' &&
    typeof (error as { code?: unknown }).code === 'string'
  ) {
    return error as AiClientError
  }
  return null
}

export function isSearchBuddyAbort(error: unknown): boolean {
  const aiErr = asAiClientError(error)
  if (aiErr?.code === 'aborted') return true
  return error instanceof DOMException && error.name === 'AbortError'
}

/** Seconds to wait before another try, only when the error carries Retry-After. */
export function searchBuddyRetryAfterSeconds(error: unknown): number | undefined {
  const aiErr = asAiClientError(error)
  const seconds = aiErr?.retryAfterSeconds
  if (seconds == null || !Number.isFinite(seconds) || seconds < 0) return undefined
  return seconds
}

/** User-facing copy only — never includes tokens, URLs with secrets, or raw payloads. */
export function searchBuddyErrorMessage(error: unknown, locale: UiLocale = 'en'): string {
  if (isSearchBuddyAbort(error)) return ''
  const aiErr = asAiClientError(error)
  if (aiErr) {
    if (aiErr.code === 'not_configured' && import.meta.env.DEV && aiErr.message) {
      return aiErr.message
    }
    if (aiErr.code === 'network' && typeof navigator !== 'undefined' && navigator.onLine === false) {
      return translate(locale, ERROR_KEYS.offline)
    }
    return translate(locale, ERROR_KEYS[aiErr.code] || ERROR_KEYS.unknown)
  }
  return translate(locale, ERROR_KEYS.unknown)
}

/**
 * Notice for a failed request. Null means cancellation — not an error and not
 * a no-results answer.
 */
export function searchBuddyUserNotice(error: unknown, locale: UiLocale = 'en'): string | null {
  if (isSearchBuddyAbort(error)) return null
  return searchBuddyErrorMessage(error, locale) || null
}

/**
 * Safe internal diagnostics (code/status only). Never log Authorization headers,
 * service tokens, or response bodies that may contain secrets.
 */
export function logSearchBuddyDiagnostic(
  error: unknown,
  context = 'request',
): { code: string; status?: number } {
  const aiErr = asAiClientError(error)
  const info = {
    code: (aiErr?.code as AiErrorCode | undefined) || 'unknown',
    status: typeof aiErr?.status === 'number' ? aiErr.status : undefined,
  }
  try {
    console.info('[search-buddy]', context, info)
  } catch {
    /* ignore console failures */
  }
  return info
}

/** True when a finished request should update UI (newer searches invalidate older ones). */
export function isSearchBuddyRequestCurrent(
  requestId: number,
  currentRequestId: number,
): boolean {
  return requestId === currentRequestId
}
