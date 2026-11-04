import assert from 'node:assert/strict'
import {
  detectVoiceSupport,
  extractTranscript,
  toSpeechLocale,
  voiceErrorMessage,
} from '../src/lib/speech/voiceSearchSupport.ts'

assert.equal(toSpeechLocale('en'), 'en-US')
assert.equal(toSpeechLocale('am'), 'am-ET')
assert.deepEqual(detectVoiceSupport({ isSecureContext: true }), { ok: false, stage: 'unsupported' })
assert.deepEqual(detectVoiceSupport({ isSecureContext: false }), { ok: false, stage: 'insecure-context' })
const ctor = function Recognition() {}
assert.equal(detectVoiceSupport({ isSecureContext: true, webkitSpeechRecognition: ctor }).ctor, ctor)
assert.match(voiceErrorMessage('not-allowed', 'en'), /blocked/i)
assert.match(voiceErrorMessage('language-not-supported', 'en'), /language/i)
assert.match(voiceErrorMessage('no-speech', 'en'), /hear|try again/i)
const text = 'ቅዱስ ሚካኤል'
assert.equal(extractTranscript({ resultIndex: 0, results: [Object.assign([{ transcript: text }], { isFinal: true })] }).transcript, text)
console.log('modern voice support checks: passed')
