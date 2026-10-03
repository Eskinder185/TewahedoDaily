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
      // For Amharic, some engines misuse not-allowed for unsupported speech services —
      // enter Whisper so getUserMedia can confirm real permission state.
      if (isAmharic && whisperCapable) {
        return { action: 'whisper', reason: 'not-allowed-amharic-verify' }
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
      // Amharic: always prefer Whisper over a generic dead-end error.
      if (isAmharic || whisperCapable) {
        return whisperCapable
          ? { action: 'whisper', reason: code === 'unknown' ? 'unknown' : String(code) }
          : { action: 'text-only', reason: 'unknown' }
      }
      return { action: 'text-only', reason: 'unknown' }
  }
}

export function isWhisperCapable(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): boolean {
  if (!win) return false
  if (win.isSecureContext === false) return false
  if (typeof Worker === 'undefined') return false
  if (!win.navigator?.mediaDevices?.getUserMedia) return false
  if (
    typeof win.AudioContext === 'undefined' &&
    typeof (win as unknown as { webkitAudioContext?: unknown }).webkitAudioContext === 'undefined'
  ) {
    return false
  }
  return true
}

export function whisperLanguageFromSpeechLang(lang: 'am-ET' | 'en-US'): 'am' | 'en' {
  return lang === 'am-ET' ? 'am' : 'en'
}
