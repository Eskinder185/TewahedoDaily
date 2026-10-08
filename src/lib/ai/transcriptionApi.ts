import { AI_TIMEOUTS_MS, getAiFeatureFlags, isAiApiConfigured } from './aiConfig.ts'
import { aiFetch } from './aiClient.ts'
import { AiClientError, type AiLanguage, type AiTranscribeResponse } from './aiTypes.ts'

/**
 * Upload short audio for server-side transcription (future Amharic ASR, etc.).
 * Not used in production UI until SERVER_TRANSCRIPTION_ENABLED is on.
 */
export async function postAiTranscribe(
  input: {
    audio: Blob
    language?: AiLanguage
    filename?: string
  },
  signal?: AbortSignal,
): Promise<AiTranscribeResponse> {
  if (!isAiApiConfigured()) {
    throw new AiClientError('not_configured', 'AI API is not configured.')
  }
  if (!getAiFeatureFlags().serverTranscriptionEnabled) {
    throw new AiClientError('unavailable', 'Server transcription is not enabled.')
  }

  const form = new FormData()
  // Backend contract: multipart field name must be `file`.
  form.append('file', input.audio, input.filename || 'speech.webm')
  if (input.language) form.append('language', input.language)

  return aiFetch<AiTranscribeResponse>({
    path: '/api/transcribe',
    method: 'POST',
    body: form,
    timeoutMs: AI_TIMEOUTS_MS.transcription,
    signal,
    withAuth: true,
  })
}

export function canAttemptServerTranscription(): boolean {
  return getAiFeatureFlags().serverTranscriptionEnabled
}
