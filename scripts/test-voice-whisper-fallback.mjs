/**
 * Unit checks for Whisper fallback decision table + safety kill switch.
 * Run: node --experimental-strip-types --no-warnings scripts/test-voice-whisper-fallback.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  decideNativeFallback,
  isWhisperCapable,
  whisperLanguageFromSpeechLang,
} from '../src/lib/speech/fallbackDecision.ts'
import {
  BROWSER_WHISPER_ENABLED,
  VOICE_MAX_LISTEN_MS,
  WHISPER_MAX_RECORD_MS,
  WHISPER_MODEL_ID,
} from '../src/lib/speech/speechTypes.ts'
import { voiceErrorMessage, voiceMessage } from '../src/lib/speech/voiceSearchSupport.ts'

function resampleMono(input, fromRate, toRate) {
  if (fromRate === toRate) return input
  const ratio = fromRate / toRate
  const outLength = Math.max(1, Math.round(input.length / ratio))
  const output = new Float32Array(outLength)
  for (let i = 0; i < outLength; i += 1) {
    const srcIndex = i * ratio
    const left = Math.floor(srcIndex)
    const right = Math.min(left + 1, input.length - 1)
    const t = srcIndex - left
    output[i] = input[left] * (1 - t) + input[right] * t
  }
  return output
}

assert.equal(WHISPER_MODEL_ID, 'Xenova/whisper-tiny')
assert.equal(VOICE_MAX_LISTEN_MS, 10_000)
assert.equal(WHISPER_MAX_RECORD_MS, 10_000)
assert.equal(BROWSER_WHISPER_ENABLED, false)
assert.equal(isWhisperCapable(), false)
assert.equal(whisperLanguageFromSpeechLang('am-ET'), 'am')
assert.equal(whisperLanguageFromSpeechLang('en-US'), 'en')

// True mic denial (English) stays permission-only.
assert.equal(decideNativeFallback('not-allowed', false, { lang: 'en-US' }).action, 'permission')

// Production path: isWhisperCapable() is always false → Amharic never enters Whisper.
const liveCapable = isWhisperCapable()
assert.equal(decideNativeFallback('not-allowed', liveCapable, { lang: 'am-ET' }).action, 'text-only')
assert.equal(decideNativeFallback('service-not-allowed', liveCapable, { lang: 'am-ET' }).action, 'text-only')
assert.equal(decideNativeFallback('service-not-allowed', liveCapable, { lang: 'en-US' }).action, 'text-only')
assert.equal(decideNativeFallback('language-not-supported', liveCapable, { lang: 'am-ET' }).action, 'text-only')
assert.equal(decideNativeFallback('network', liveCapable).action, 'text-only')
assert.equal(decideNativeFallback('unsupported', liveCapable).action, 'text-only')
assert.equal(decideNativeFallback('start-timeout', liveCapable).action, 'text-only')
assert.equal(decideNativeFallback('unknown', liveCapable, { lang: 'am-ET' }).action, 'text-only')

// Decision-table regression (hypothetical re-enable): whisperCapable=true may still choose whisper.
assert.equal(decideNativeFallback('service-not-allowed', true, { lang: 'am-ET' }).action, 'whisper')
assert.equal(decideNativeFallback('not-allowed', true, { lang: 'am-ET' }).action, 'whisper')

assert.equal(decideNativeFallback('no-speech', true).action, 'retry')
assert.equal(decideNativeFallback('aborted', true).action, 'idle')
assert.equal(decideNativeFallback('audio-capture', true).action, 'text-only')
assert.equal(decideNativeFallback('start-threw', false).action, 'text-only')

assert.match(voiceErrorMessage('not-allowed', 'en'), /blocked|settings/i)
assert.doesNotMatch(voiceErrorMessage('service-not-allowed', 'en'), /blocked|settings/i)
assert.match(voiceMessage('en', 'amharicTextOnly'), /Amharic voice recognition isn't available/i)

const input = Float32Array.from([0, 1, 0, -1, 0, 1, 0, -1])
const out = resampleMono(input, 32_000, 16_000)
assert.equal(out.length, 4)

const buddy = readFileSync(new URL('../src/components/search/SearchBuddy.tsx', import.meta.url), 'utf8')
assert.match(buddy, /MezmurVoiceSearch/)

const voiceUi = readFileSync(new URL('../src/components/search/MezmurVoiceSearch.tsx', import.meta.url), 'utf8')
assert.match(voiceUi, /interimResults = false/)
assert.match(voiceUi, /decideNativeFallback/)
assert.match(voiceUi, /amharicTextOnly/)
assert.match(voiceUi, /SpeechRecognition error/)
assert.match(voiceUi, /recognition\.lang = language === 'am-ET' \? 'am-ET' : 'en-US'/)
assert.match(voiceUi, /disposeWhisperClient/)
assert.match(voiceUi, /VOICE_MAX_LISTEN_MS/)
assert.match(voiceUi, /softStopNative/)
assert.doesNotMatch(voiceUi, /ensureWhisperLoaded/)
assert.doesNotMatch(voiceUi, /transcribeWithWhisper/)
assert.doesNotMatch(voiceUi, /startAudioCapture/)
assert.doesNotMatch(voiceUi, /runWhisperFallback/)

const speechTypesSrc = readFileSync(new URL('../src/lib/speech/speechTypes.ts', import.meta.url), 'utf8')
assert.match(speechTypesSrc, /BROWSER_WHISPER_ENABLED = false/)

const client = readFileSync(new URL('../src/lib/speech/whisperClient.ts', import.meta.url), 'utf8')
assert.match(client, /BROWSER_WHISPER_ENABLED/)
assert.match(client, /disabled for memory safety/)

const worker = readFileSync(new URL('../src/lib/speech/whisperWorker.ts', import.meta.url), 'utf8')
assert.match(worker, /@huggingface\/transformers/)
assert.match(worker, /task: 'transcribe'/)
assert.match(worker, /Xenova\/whisper-tiny|modelId/)

const pkg = JSON.parse(readFileSync(new URL('../package.json', import.meta.url), 'utf8'))
assert.ok(pkg.dependencies['@huggingface/transformers'])

console.log('test-voice-whisper-fallback: ok')
