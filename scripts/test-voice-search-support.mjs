/**
 * Regression checks for shared voice-search support (mobile failure messaging).
 * Run: node --experimental-strip-types --no-warnings scripts/test-voice-search-support.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  amharicRecognitionNote,
  detectVoiceSupport,
  extractTranscript,
  speechLocales,
  toSpeechLocale,
  voiceErrorMessage,
  voiceSupportMessage,
} from '../src/lib/speech/voiceSearchSupport.ts'

assert.equal(speechLocales.am, 'am-ET')
assert.equal(speechLocales.en, 'en-US')
assert.equal(toSpeechLocale('am'), 'am-ET')
assert.equal(toSpeechLocale('en'), 'en-US')
assert.equal(toSpeechLocale('both'), 'en-US')

const insecure = {
  isSecureContext: false,
  SpeechRecognition: function Fake() {},
}
assert.deepEqual(detectVoiceSupport(insecure), { ok: false, stage: 'insecure-context' })
assert.match(voiceSupportMessage('insecure-context', 'en'), /HTTPS|secure/i)

const unsupported = { isSecureContext: true }
assert.deepEqual(detectVoiceSupport(unsupported), { ok: false, stage: 'unsupported' })
assert.match(voiceSupportMessage('unsupported', 'en'), /isn't supported|type your search/i)

const FakeCtor = function FakeRecognition() {}
const supported = {
  isSecureContext: true,
  SpeechRecognition: FakeCtor,
}
const ok = detectVoiceSupport(supported)
assert.equal(ok.ok, true)
assert.equal(ok.ctor, FakeCtor)

assert.match(voiceErrorMessage('not-allowed', 'en'), /blocked|settings/i)
assert.doesNotMatch(voiceErrorMessage('service-not-allowed', 'en'), /blocked|settings/i)
assert.match(voiceErrorMessage('service-not-allowed', 'en'), /unavailable|fallback|language/i)
assert.match(voiceErrorMessage('no-speech', 'en'), /didn't hear|Try again/i)
assert.match(voiceErrorMessage('network', 'en'), /connect|Try again/i)
assert.match(voiceErrorMessage('audio-capture', 'en'), /No microphone/i)
assert.match(voiceErrorMessage('language-not-supported', 'en'), /language/i)
assert.match(voiceErrorMessage('unknown-code', 'en'), /failed|type your search/i)

const qidus = '\u1245\u12f1\u1235'
const george = '\u130a\u12ee\u122d\u130a\u1235'
const row1 = Object.assign([{ transcript: qidus }], { isFinal: true })
const row2 = Object.assign([{ transcript: george }], { isFinal: true })
const extracted = extractTranscript({
  resultIndex: 0,
  results: [row1, row2],
})
assert.equal(extracted.transcript, `${qidus} ${george}`)
assert.equal(extracted.isFinal, true)

assert.match(amharicRecognitionNote('en'), /browser/i)

const buddy = readFileSync(new URL('../src/components/search/SearchBuddy.tsx', import.meta.url), 'utf8')
assert.match(buddy, /MezmurVoiceSearch/)
assert.match(buddy, /active=\{open && !preview\}/)
assert.match(buddy, /setSnapshot\(\{ query: text \}\)/)

const voiceUi = readFileSync(new URL('../src/components/search/MezmurVoiceSearch.tsx', import.meta.url), 'utf8')
assert.match(voiceUi, /detectVoiceSupport/)
assert.match(voiceUi, /continuous = false/)
assert.match(voiceUi, /interimResults = false/)
assert.match(voiceUi, /recognition\.lang = language/)
assert.match(voiceUi, /am-ET/)
assert.match(voiceUi, /onstart/)
assert.match(voiceUi, /stopAll\('lang-change'\)/)
assert.match(voiceUi, /type="button"/)
assert.match(voiceUi, /stopPropagation/)
assert.match(voiceUi, /visibilitychange/)
assert.match(voiceUi, /voiceDebug/)
assert.match(voiceUi, /runWhisperFallback/)
assert.match(voiceUi, /voiceTimeoutRef/)
assert.match(voiceUi, /clearVoiceTimeout/)
assert.match(voiceUi, /startVoiceTimeout/)
assert.match(voiceUi, /softStopNative/)
assert.match(voiceUi, /VOICE_MAX_LISTEN_MS/)
assert.match(voiceUi, /recognition\.stop\(\)/)
assert.doesNotMatch(voiceUi, /🎙/)

const speechTypes = readFileSync(new URL('../src/lib/speech/speechTypes.ts', import.meta.url), 'utf8')
assert.match(speechTypes, /VOICE_MAX_LISTEN_MS = 10_000/)
assert.match(speechTypes, /WHISPER_MAX_RECORD_MS = 10_000/)

console.log('test-voice-search-support: ok')
