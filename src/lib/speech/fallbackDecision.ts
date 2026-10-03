import type { NativeSpeechErrorCode } from './speechTypes'

export type FallbackAction =
  | { action: 'retry'; reason: string }
  | { action: 'permission'; reason: string }
  | { action: 'whisper'; reason: string }
  | { action: 'idle'; reason: string }
  | { action: 'text-only'; reason: string }

/**
 * Decision table: when native Web Speech fails, what should voice search do?
 *
 * Voice recognition is English-only (`en-US`). Browser Whisper remains disabled
 * via `isWhisperCapable()` / `BROWSER_WHISPER_ENABLED`.
 */
export function decideNativeFallback(
  code: NativeSpeechErrorCode,
  whisperCapable: boolean,
): FallbackAction {
  switch (code) {
    case 'not-allowed':
      return { action: 'permission', reason: code }

    case 'service-not-allowed':
      return whisperCapable
        ? { action: 'whisper', reason: code }
        : { action: 'text-only', reason: code }

    case 'no-speech':
    case 'bad-grammar':
      return { action: 'retry', reason: code }

    case 'aborted':
      return { action: 'idle', reason: code }

    case 'audio-capture':
      return { action: 'text-only', reason: code }

    case 'language-not-supported':
    case 'network':
    case 'unsupported':
    case 'start-threw':
    case 'start-timeout':
      return whisperCapable
        ? { action: 'whisper', reason: code }
        : { action: 'text-only', reason: code }

    case 'unknown':
    default:
      return whisperCapable
        ? { action: 'whisper', reason: code === 'unknown' ? 'unknown' : String(code) }
        : { action: 'text-only', reason: 'unknown' }
  }
}

/**
 * Whether in-browser Whisper may be used.
 * Currently always false — Xenova/whisper-tiny via transformers.js crashes mobile tabs.
 */
export function isWhisperCapable(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): boolean {
  void win
  return false
}
