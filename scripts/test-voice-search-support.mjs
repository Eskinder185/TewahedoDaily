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
  voiceErrorMessage,
  voiceSupportMessage,
} from '../src/lib/speech/voiceSearchSupport.ts'

const insecure = {
  isSecureContext: false,
  SpeechRecognition: function Fake() {},
}
assert.deepEqual(detectVoiceSupport(insecure), { ok: false, stage: 'insecure-context' })
assert.match(voiceSupportMessage('insecure-context', 'en'), /HTTPS|secure/i)

const unsupported = { isSecureContext: true }
assert.deepEqual(detectVoiceSupport(unsupported), { ok: false, stage: 'unsupported' })
assert.match(voiceSupportMessage('unsupported', 'en'), /unavailable|type your search/i)

const FakeCtor = function FakeRecognition() {}
const supported = {
  isSecureContext: true,
  SpeechRecognition: FakeCtor,
}
const ok = detectVoiceSupport(supported)
assert.equal(ok.ok, true)
assert.equal(ok.ctor, FakeCtor)

assert.match(voiceErrorMessage('not-allowed', 'en'), /permission was denied/i)
assert.match(voiceErrorMessage('service-not-allowed', 'en'), /permission was denied/i)
assert.match(voiceErrorMessage('no-speech', 'en'), /No speech/i)
assert.match(voiceErrorMessage('network', 'en'), /network/i)
assert.match(voiceErrorMessage('audio-capture', 'en'), /microphone|audio capture/i)
assert.match(voiceErrorMessage('language-not-supported', 'en'), /language/i)
assert.match(voiceErrorMessage('unknown-code', 'en'), /failed|type your search/i)

const extracted = extractTranscript({
  resultIndex: 0,
  results: [[{ transcript: '  Meskel  ' }], [{ transcript: 'Meskel hymn' }]],
})
assert.equal(extracted.transcript, 'Meskel hymn')

assert.match(amharicRecognitionNote('en'), /not been verified/i)

const buddy = readFileSync(new URL('../src/components/search/SearchBuddy.tsx', import.meta.url), 'utf8')
assert.match(buddy, /MezmurVoiceSearch/)
assert.match(buddy, /active=\{open && !preview\}/)

const voiceUi = readFileSync(new URL('../src/components/search/MezmurVoiceSearch.tsx', import.meta.url), 'utf8')
assert.match(voiceUi, /detectVoiceSupport/)
assert.match(voiceUi, /continuous = false/)
assert.match(voiceUi, /visibilitychange/)
assert.doesNotMatch(voiceUi, /🎙/)

console.log('test-voice-search-support: ok')
