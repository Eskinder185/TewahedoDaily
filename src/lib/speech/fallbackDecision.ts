import type { NativeSpeechErrorCode, VoiceSearchLang } from './speechTypes'

export type FallbackAction =
  | { action: 'retry'; reason: string }
  | { action: 'permission'; reason: string }
  | { action: 'whisper'; reason: string }
  | { action: 'idle'; reason: string }
  | { action: 'text-only'; reason: string }

export type FallbackDecisionOptions = {
  /** Selected Web Speech locale at the time of failure. */
  lang?: VoiceSearchLang
}

/**
 * Decision table: when native Web Speech fails, what should Search Buddy do?
 *
 * Important: `service-not-allowed` is NOT the same as microphone permission denial.
 * Many browsers report it (or related codes) when Amharic speech service is unavailable
 * even though the mic already works for English.
 *
 * Callers must pass `isWhisperCapable()` for `whisperCapable`. That helper is hard-gated
 * so mobile never enters the heavy local ASR path (see `BROWSER_WHISPER_ENABLED`).
 */
export function decideNativeFallback(
  code: NativeSpeechErrorCode,
  whisperCapable: boolean,
  options: FallbackDecisionOptions = {},
): FallbackAction {
  const isAmharic = options.lang === 'am-ET'

  switch (code) {
    case 'not-allowed':
      // True mic denial for English stays a permission message.
      // Amharic engines often misuse not-allowed for unsupported speech services —
      // never show "microphone blocked" for that case; use typed Amharic fallback.
      if (isAmharic) {
        return whisperCapable
          ? { action: 'whisper', reason: 'not-allowed-amharic-verify' }
          : { action: 'text-only', reason: 'amharic-unavailable' }
      }
      return { action: 'permission', reason: code }

    case 'service-not-allowed':
      // Speech / recognition service refused the request — not browser mic permission.
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
      if (whisperCapable) {
        return { action: 'whisper', reason: code === 'unknown' ? 'unknown' : String(code) }
      }
      return { action: 'text-only', reason: isAmharic ? 'amharic-unavailable' : 'unknown' }
  }
}

/**
 * Whether in-browser Whisper may be used.
 * Currently always false — Xenova/whisper-tiny via transformers.js crashes mobile tabs.
 * Re-enable only after a memory-safe path exists; also flip `BROWSER_WHISPER_ENABLED`.
 */
export function isWhisperCapable(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): boolean {
  // Hard-disabled for stability. Runtime gates also live in whisperClient.ts
  // via BROWSER_WHISPER_ENABLED — keep both false until a memory-safe ASR path exists.
  void win
  return false
}

export function whisperLanguageFromSpeechLang(lang: 'am-ET' | 'en-US'): 'am' | 'en' {
  return lang === 'am-ET' ? 'am' : 'en'
}
