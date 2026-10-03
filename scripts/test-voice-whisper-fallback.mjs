/**
 * Unit checks for Whisper fallback decision table + audio resample helpers.
 * Run: node --experimental-strip-types --no-warnings scripts/test-voice-whisper-fallback.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { decideNativeFallback, whisperLanguageFromSpeechLang } from '../src/lib/speech/fallbackDecision.ts'
import { WHISPER_MODEL_ID } from '../src/lib/speech/speechTypes.ts'

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
assert.equal(whisperLanguageFromSpeechLang('am-ET'), 'am')
assert.equal(whisperLanguageFromSpeechLang('en-US'), 'en')

assert.equal(decideNativeFallback('not-allowed', true).action, 'permission')
assert.equal(decideNativeFallback('service-not-allowed', true).action, 'permission')
assert.equal(decideNativeFallback('no-speech', true).action, 'retry')
assert.equal(decideNativeFallback('aborted', true).action, 'idle')
assert.equal(decideNativeFallback('audio-capture', true).action, 'text-only')
assert.equal(decideNativeFallback('language-not-supported', true).action, 'whisper')
assert.equal(decideNativeFallback('network', true).action, 'whisper')
assert.equal(decideNativeFallback('unsupported', true).action, 'whisper')
assert.equal(decideNativeFallback('start-timeout', true).action, 'whisper')
assert.equal(decideNativeFallback('start-threw', false).action, 'text-only')

const input = Float32Array.from([0, 1, 0, -1, 0, 1, 0, -1])
const out = resampleMono(input, 32_000, 16_000)
assert.equal(out.length, 4)

const buddy = readFileSync(new URL('../src/components/search/SearchBuddy.tsx', import.meta.url), 'utf8')
assert.match(buddy, /MezmurVoiceSearch/)

const voiceUi = readFileSync(new URL('../src/components/search/MezmurVoiceSearch.tsx', import.meta.url), 'utf8')
assert.match(voiceUi, /runWhisperFallback/)
assert.match(voiceUi, /interimResults = false/)
assert.match(voiceUi, /decideNativeFallback/)
assert.match(voiceUi, /transcribeWithWhisper/)

const worker = readFileSync(new URL('../src/lib/speech/whisperWorker.ts', import.meta.url), 'utf8')
assert.match(worker, /@huggingface\/transformers/)
assert.match(worker, /task: 'transcribe'/)
assert.match(worker, /Xenova\/whisper-tiny|modelId/)

const pkg = JSON.parse(readFileSync(new URL('../package.json', import.meta.url), 'utf8'))
assert.ok(pkg.dependencies['@huggingface/transformers'])

console.log('test-voice-whisper-fallback: ok')
