import { AiClientError, type AiErrorCode } from './aiTypes.ts'

const FRIENDLY: Record<AiErrorCode, string> = {
  not_configured: 'Extended answers are temporarily unavailable.',
  network: 'Extended answers are temporarily unavailable.',
  timeout: 'Extended answers are taking too long. Showing local results instead.',
  unavailable: 'Extended answers are temporarily unavailable.',
  rate_limited: 'Extended answers are briefly limited. Please try again shortly.',
  bad_request: 'That request could not be processed. Try a shorter question.',
  unauthorized: 'Extended answers are temporarily unavailable.',
  transcription_failed: 'Voice transcription failed. You can still type your search.',
  ocr_failed: 'Document reading failed. Please try again later.',
  aborted: '',
  unknown: 'Extended answers are temporarily unavailable.',
}

function isAiClientError(error: unknown): error is AiClientError {
  if (error instanceof AiClientError) return true
  // Duck-type for Node strip-types / duplicate-module edge cases.
  return (
    typeof error === 'object' &&
    error !== null &&
    (error as { name?: string }).name === 'AiClientError' &&
    typeof (error as { code?: unknown }).code === 'string'
  )
}

export function friendlyAiError(error: unknown): string {
  if (isAiClientError(error)) {
    return FRIENDLY[error.code] ?? FRIENDLY.unknown
  }
  if (error instanceof DOMException && error.name === 'AbortError') {
    return FRIENDLY.aborted
  }
  return FRIENDLY.unknown
}

export function mapHttpStatusToAiError(status: number, fallbackMessage?: string): AiClientError {
  if (status === 400) return new AiClientError('bad_request', fallbackMessage || FRIENDLY.bad_request, status)
  if (status === 401 || status === 403) {
    return new AiClientError('unauthorized', FRIENDLY.unauthorized, status)
  }
  if (status === 408) return new AiClientError('timeout', FRIENDLY.timeout, status)
  if (status === 429) return new AiClientError('rate_limited', FRIENDLY.rate_limited, status)
  if (status >= 500) return new AiClientError('unavailable', FRIENDLY.unavailable, status)
  return new AiClientError('unknown', fallbackMessage || FRIENDLY.unknown, status)
}
