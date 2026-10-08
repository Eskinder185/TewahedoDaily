import { canAttemptServerTranscription } from '../ai/transcriptionApi.ts'
import { BROWSER_WHISPER_ENABLED } from './speechTypes.ts'

/**
 * Voice transcription provider selection.
 * Production today: native browser SpeechRecognition (English).
 * Future: server ASR via Tewahedo AI API (Amharic, etc.).
 * Browser Whisper stays disabled.
 */
export type VoiceTranscriptionProvider = 'native' | 'server' | 'none'

export function resolveVoiceTranscriptionProvider(options?: {
  /** Prefer server when both native and server are available. */
  preferServer?: boolean
}): VoiceTranscriptionProvider {
  const serverOk = canAttemptServerTranscription()
  if (options?.preferServer && serverOk) return 'server'
  // Native English recognition remains the production path.
  if (typeof window !== 'undefined') {
    const w = window as Window & {
      SpeechRecognition?: unknown
      webkitSpeechRecognition?: unknown
    }
    if (w.SpeechRecognition || w.webkitSpeechRecognition) return 'native'
  }
  if (serverOk) return 'server'
  // Browser Whisper is intentionally not offered.
  if (BROWSER_WHISPER_ENABLED) return 'none'
  return 'none'
}
