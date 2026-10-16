import { AiClientError, type AiErrorCode } from '../ai/aiTypes.ts'

const MESSAGES: Record<string, string> = {
  not_configured: 'Extended search is not configured on this device.',
  network: 'Could not reach the assistant service right now.',
  timeout: 'That request took too long. You can try again.',
  unavailable: 'The assistant is briefly unavailable. Please try again.',
  rate_limited: 'Please wait a moment, then try again.',
  bad_request: 'That question could not be processed. Try a shorter phrase.',
  unauthorized: 'The assistant could not authorize this request.',
  aborted: '',
  unknown: 'Something went wrong while searching.',
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

/** User-facing copy only — never includes tokens, URLs with secrets, or raw payloads. */
export function searchBuddyErrorMessage(error: unknown): string {
  const aiErr = asAiClientError(error)
  if (aiErr) {
    if (aiErr.code === 'not_configured' && import.meta.env.DEV && aiErr.message) {
      return aiErr.message
    }
    if (aiErr.code === 'network' && typeof navigator !== 'undefined' && navigator.onLine === false) {
      return 'You appear to be offline. Reconnect and try again.'
    }
    return MESSAGES[aiErr.code] || MESSAGES.unknown
  }
  if (error instanceof DOMException && error.name === 'AbortError') return ''
  return MESSAGES.unknown
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
