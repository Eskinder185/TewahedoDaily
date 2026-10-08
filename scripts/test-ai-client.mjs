/**
 * Unit checks for AI client scaffolding (no live backend required).
 * Run: node --experimental-strip-types --no-warnings scripts/test-ai-client.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = join(dirname(fileURLToPath(import.meta.url)), '..')

// Ensure no AI URL is required for imports / config defaults.
delete process.env.VITE_TEWAHEDO_AI_API_URL
delete process.env.VITE_AI_CHAT_ENABLED
delete process.env.VITE_AI_SERVER_TRANSCRIPTION_ENABLED
delete process.env.VITE_AI_OCR_ENABLED

const {
  getAiApiBaseUrl,
  getAiFeatureFlags,
  isAiApiConfigured,
  AI_TIMEOUTS_MS,
} = await import('../src/lib/ai/aiConfig.ts')
const { canAttemptAiChat } = await import('../src/lib/ai/chatApi.ts')
const { friendlyAiError } = await import('../src/lib/ai/aiErrors.ts')
const { AiClientError } = await import('../src/lib/ai/aiTypes.ts')
const { classifySearchRoute, shouldAttemptAiAnswer } = await import(
  '../src/lib/search/aiRouting.ts'
)
const { VOICE_MAX_DURATION_MS, VOICE_MAX_LISTEN_MS } = await import(
  '../src/lib/speech/speechTypes.ts'
)

assert.equal(getAiApiBaseUrl(), null)
assert.equal(isAiApiConfigured(), false)
assert.equal(canAttemptAiChat(), false)
assert.deepEqual(getAiFeatureFlags(), {
  configured: false,
  chatEnabled: false,
  serverTranscriptionEnabled: false,
  ocrEnabled: false,
})

assert.equal(AI_TIMEOUTS_MS.health, 5_000)
assert.ok(AI_TIMEOUTS_MS.chat >= 30_000 && AI_TIMEOUTS_MS.chat <= 60_000)
assert.ok(AI_TIMEOUTS_MS.transcription >= 30_000 && AI_TIMEOUTS_MS.transcription <= 60_000)

assert.equal(VOICE_MAX_DURATION_MS, 15_000)
assert.equal(VOICE_MAX_LISTEN_MS, VOICE_MAX_DURATION_MS)

assert.equal(classifySearchRoute('John 3:16'), 'structured')
assert.equal(classifySearchRoute('Psalm 23'), 'structured')
assert.equal(classifySearchRoute('Find St. George hymns'), 'structured')
assert.equal(classifySearchRoute('Open Calendar'), 'structured')
assert.equal(classifySearchRoute('What is the Mystery of Baptism?'), 'knowledge')
assert.equal(classifySearchRoute('Explain fasting'), 'knowledge')

assert.equal(
  shouldAttemptAiAnswer('John 3:16', [
    {
      sourceType: 'bible-verse',
      sourceId: 'j316',
      title: 'John 3:16',
      titleAmharic: '',
      route: '/bible/john/3#16',
      description: '',
      imagePath: null,
      score: 0,
      matchKind: 'exact',
      typeLabel: 'Bible',
    },
  ]),
  false,
)

assert.equal(shouldAttemptAiAnswer('What is Baptism?', []), true)

assert.equal(
  friendlyAiError(new AiClientError('not_configured', 'x')),
  'Extended answers are temporarily unavailable.',
)
assert.equal(friendlyAiError(new AiClientError('aborted', 'x')), '')

// Secrets must not appear as VITE_* AI credentials in source.
const envExample = readFileSync(join(root, '.env.example'), 'utf8')
assert.match(envExample, /VITE_TEWAHEDO_AI_API_URL/)
assert.doesNotMatch(envExample, /VITE_.*SECRET|VITE_.*SERVICE_ROLE|VITE_.*TOKEN/i)

const aiClientSrc = readFileSync(join(root, 'src/lib/ai/aiClient.ts'), 'utf8')
assert.match(aiClientSrc, /Authorization/)
assert.match(aiClientSrc, /getSession/)
assert.doesNotMatch(aiClientSrc, /10\.0\.0\.|192\.168\.|ollama|qdrant|proxmox/i)

const configSrc = readFileSync(join(root, 'src/lib/ai/aiConfig.ts'), 'utf8')
assert.match(configSrc, /tewahedodaily\.pages\.dev/)
assert.match(configSrc, /Access-Control-Allow-Origin/)

console.log('test-ai-client: ok')
