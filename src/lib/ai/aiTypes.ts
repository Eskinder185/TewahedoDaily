/** Shared contracts for the future Tewahedo AI API gateway (homelab-backed). */

export type AiLanguage = 'en' | 'am'

export type AiUiStatus =
  | 'idle'
  | 'connecting'
  | 'thinking'
  | 'recording'
  | 'transcribing'
  | 'success'
  | 'error'
  | 'unavailable'

export type AiSource = {
  id?: string
  title: string
  url?: string
  excerpt?: string
  sourceType?: string
}

export type AiHealthResponse = {
  service: string
  status: 'healthy' | 'degraded' | 'unhealthy' | string
}

export type AiCapabilities = {
  chat?: boolean
  rag?: boolean
  transcription?: {
    enabled: boolean
    languages?: AiLanguage[]
  }
  ocr?: boolean
}

export type AiChatRequest = {
  message: string
  timezone?: string
  ui_language?: AiLanguage
  answer_language?: AiLanguage | 'bilingual'
  history?: Array<{ role: 'user' | 'assistant'; content: string }>
}

export type AiChatResponse = {
  answer: string
  sources?: AiSource[]
  answer_language?: AiLanguage | 'bilingual'
  grounding?: 'scripture' | 'general_knowledge' | 'unavailable_document'
}

export type AiTranscribeResponse = {
  text: string
  language?: AiLanguage | string
  detected_language?: string | null
  duration?: number | null
  model?: string | null
}

export type AiOcrResponse = {
  text: string
  language?: AiLanguage | string
  status?: 'ok' | 'needs_review' | string
}

export type AiErrorCode =
  | 'not_configured'
  | 'network'
  | 'timeout'
  | 'unavailable'
  | 'rate_limited'
  | 'bad_request'
  | 'unauthorized'
  | 'transcription_failed'
  | 'ocr_failed'
  | 'aborted'
  | 'unknown'

export class AiClientError extends Error {
  readonly code: AiErrorCode
  readonly status?: number
  /** Seconds from a Retry-After header, when the response included one. */
  readonly retryAfterSeconds?: number

  constructor(
    code: AiErrorCode,
    message: string,
    status?: number,
    retryAfterSeconds?: number,
  ) {
    super(message)
    this.name = 'AiClientError'
    this.code = code
    this.status = status
    if (retryAfterSeconds != null && Number.isFinite(retryAfterSeconds)) {
      this.retryAfterSeconds = retryAfterSeconds
    }
  }
}

/** Feature flags derived from env + optional capabilities endpoint. */
export type AiFeatureFlags = {
  /** Base URL configured via VITE_TEWAHEDO_AI_API_URL */
  configured: boolean
  chatEnabled: boolean
  serverTranscriptionEnabled: boolean
  ocrEnabled: boolean
}
