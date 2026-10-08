/** Voice recognition is English-only (`en-US`). */
export type VoiceSearchLang = 'en-US'
export type VoiceUiLang = 'en' | 'am'
export type SpeechProvider = 'native' | 'whisper' | 'none'

export const VOICE_RECOGNITION_LANG: VoiceSearchLang = 'en-US'

export type VoicePhase =
  | 'idle'
  | 'starting-native'
  | 'listening-native'
  | 'native-failed'
  | 'loading-model'
  | 'requesting-mic'
  | 'recording'
  | 'processing'
  | 'success'
  | 'error'
  | 'unsupported'

export type NativeSpeechErrorCode =
  | 'not-allowed'
  | 'service-not-allowed'
  | 'no-speech'
  | 'audio-capture'
  | 'network'
  | 'language-not-supported'
  | 'bad-grammar'
  | 'aborted'
  | 'start-threw'
  | 'start-timeout'
  | 'unsupported'
  | 'unknown'

/** Whisper worker protocol (main ↔ worker). */
export type WhisperWorkerIn =
  | { type: 'load'; modelId: string }
  | {
      type: 'transcribe'
      audio: Float32Array
      language: 'am' | 'en'
      sampleRate: number
    }
  | { type: 'dispose' }

export type WhisperWorkerOut =
  | { type: 'progress'; status: string; progress?: number }
  | { type: 'ready'; modelId: string }
  | { type: 'result'; text: string }
  | { type: 'error'; message: string }

export const WHISPER_MODEL_ID = 'Xenova/whisper-tiny'
/**
 * Shared max for native listen, practice record, and future server transcription upload.
 * (Maximum window, not a minimum.)
 */
export const VOICE_MAX_DURATION_MS = 15_000
/** @deprecated Prefer VOICE_MAX_DURATION_MS — kept for existing call sites. */
export const VOICE_MAX_LISTEN_MS = VOICE_MAX_DURATION_MS
/** Multilingual tiny; quantized ONNX is typically ~40–75 MB on first download. */
export const WHISPER_MAX_RECORD_MS = VOICE_MAX_DURATION_MS
export const WHISPER_SAMPLE_RATE = 16_000

/**
 * Hard kill switch for in-browser Whisper / transformers.js.
 * Loading Xenova/whisper-tiny (WebGPU→WASM) has crashed mobile tabs on Amharic fallback.
 * Keep false until a lightweight, memory-safe path exists (prefer server ASR later).
 */
export const BROWSER_WHISPER_ENABLED = false
