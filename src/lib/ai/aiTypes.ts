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
  language?: AiLanguage
  context?: {
    page?: string
    [key: string]: unknown
  }
}

export type AiChatResponse = {
  answer: string
  sources?: AiSource[]
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

  constructor(code: AiErrorCode, message: string, status?: number) {
    super(message)
    this.name = 'AiClientError'
    this.code = code
    this.status = status
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
