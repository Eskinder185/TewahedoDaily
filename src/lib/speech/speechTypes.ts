export type VoiceSearchLang = 'am-ET' | 'en-US'
export type VoiceUiLang = 'en' | 'am'
export type SpeechProvider = 'native' | 'whisper' | 'none'

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
/** Multilingual tiny; quantized ONNX is typically ~40–75 MB on first download. */
export const WHISPER_MAX_RECORD_MS = 12_000
export const WHISPER_SAMPLE_RATE = 16_000
