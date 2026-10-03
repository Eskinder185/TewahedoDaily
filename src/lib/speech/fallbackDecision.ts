import type { NativeSpeechErrorCode } from './speechTypes'

export type FallbackAction =
  | { action: 'retry'; reason: string }
  | { action: 'permission'; reason: string }
  | { action: 'whisper'; reason: string }
  | { action: 'idle'; reason: string }
  | { action: 'text-only'; reason: string }

/**
 * Decision table: when native Web Speech fails, what should Search Buddy do?
 * Do NOT fall back to Whisper for every error.
 */
export function decideNativeFallback(
  code: NativeSpeechErrorCode,
  whisperCapable: boolean,
): FallbackAction {
  switch (code) {
    case 'not-allowed':
    case 'service-not-allowed':
      return { action: 'permission', reason: code }

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
        ? { action: 'whisper', reason: 'unknown' }
        : { action: 'text-only', reason: 'unknown' }
  }
}

export function isWhisperCapable(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): boolean {
  if (!win) return false
  if (win.isSecureContext === false) return false
  if (typeof Worker === 'undefined') return false
  if (!win.navigator?.mediaDevices?.getUserMedia) return false
  if (typeof win.AudioContext === 'undefined' && typeof (win as unknown as { webkitAudioContext?: unknown }).webkitAudioContext === 'undefined') {
    return false
  }
  return true
}

export function whisperLanguageFromSpeechLang(lang: 'am-ET' | 'en-US'): 'am' | 'en' {
  return lang === 'am-ET' ? 'am' : 'en'
}
