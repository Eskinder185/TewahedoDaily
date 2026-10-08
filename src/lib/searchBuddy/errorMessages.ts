import { AiClientError } from '../ai/aiTypes.ts'

const MESSAGES: Record<string, string> = {
  not_configured: 'Extended search is not configured on this device.',
  network: 'Could not reach the assistant service right now.',
  timeout: 'That request took too long. You can try again.',
  unavailable: 'The assistant is briefly unavailable.',
  rate_limited: 'Please wait a moment, then try again.',
  bad_request: 'That question could not be processed. Try a shorter phrase.',
  unauthorized: 'The assistant could not authorize this request.',
  aborted: '',
  unknown: 'Something went wrong while searching.',
}

export function searchBuddyErrorMessage(error: unknown): string {
  if (error instanceof AiClientError) {
    if (error.code === 'not_configured' && import.meta.env.DEV && error.message) {
      return error.message
    }
    if (error.code === 'network' && typeof navigator !== 'undefined' && navigator.onLine === false) {
      return 'You appear to be offline. Reconnect and try again.'
    }
    return MESSAGES[error.code] || MESSAGES.unknown
  }
  if (error instanceof DOMException && error.name === 'AbortError') return ''
  return MESSAGES.unknown
}
