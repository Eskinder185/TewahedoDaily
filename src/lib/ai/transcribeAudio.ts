import { AI_TIMEOUTS_MS, isAiApiConfigured } from './aiConfig.ts'
import { aiFetch } from './aiClient.ts'
import { AiClientError } from './aiTypes.ts'

export type TranscriptionResponse = {
  text: string
  language: string
  detected_language?: string | null
  duration?: number | null
  model?: string | null
}

function extensionForMime(mime: string): string {
  const lower = mime.toLowerCase()
  if (lower.includes('mp4') || lower.includes('m4a') || lower.includes('aac')) return 'm4a'
  if (lower.includes('ogg')) return 'ogg'
  if (lower.includes('mpeg') || lower.includes('mp3')) return 'mp3'
  return 'webm'
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

/**
 * Upload a short microphone recording to POST /api/transcribe.
 * Form field name is `file` (backend contract). Does not set Content-Type —
 * the browser supplies the multipart boundary.
 */
export async function transcribeAudio(
  audio: Blob,
  options: {
    signal?: AbortSignal
    filename?: string
    language?: 'am' | 'en'
  } = {},
): Promise<TranscriptionResponse> {
  if (!isAiApiConfigured()) {
    throw new AiClientError(
      'not_configured',
      'Amharic voice needs VITE_TEWAHEDO_AI_API_URL. Restart Vite after setting it.',
    )
  }
  if (!(audio instanceof Blob) || audio.size <= 0) {
    throw new AiClientError('transcription_failed', 'No audio was recorded.')
  }

  const mime = (audio.type || 'audio/webm').split(';')[0] || 'audio/webm'
  const filename = options.filename || `speech.${extensionForMime(mime)}`
  const form = new FormData()
  form.append('file', audio, filename)
  if (options.language) form.append('language', options.language)

  const raw = await aiFetch<unknown>({
    path: '/api/transcribe',
    method: 'POST',
    body: form,
    timeoutMs: AI_TIMEOUTS_MS.transcription,
    signal: options.signal,
    withAuth: true,
  })

  if (!isRecord(raw)) {
    throw new AiClientError('transcription_failed', 'Transcription returned an unexpected response.')
  }

  const text = typeof raw.text === 'string' ? raw.text.trim() : ''
  if (!text) {
    throw new AiClientError('transcription_failed', 'No speech was detected. Try again, or type your search.')
  }

  return {
    text,
    language: typeof raw.language === 'string' && raw.language.trim() ? raw.language : 'am',
    detected_language:
      typeof raw.detected_language === 'string' || raw.detected_language === null
        ? (raw.detected_language as string | null)
        : undefined,
    duration: typeof raw.duration === 'number' ? raw.duration : null,
    model: typeof raw.model === 'string' ? raw.model : null,
  }
}

export function canAttemptAmharicTranscription(): boolean {
  return isAiApiConfigured()
}
