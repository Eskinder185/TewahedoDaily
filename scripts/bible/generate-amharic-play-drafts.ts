import { readFile, stat, writeFile } from 'node:fs/promises'
import { resolve } from 'node:path'
import { buildAmharicQuestionPrompt, validateAmharicQuestionResponse } from '../../src/lib/play/amharicBibleQuestionGenerator'

const options = new Map<string, string>()
const allowed = new Set(['--source', '--model', '--prompt-out', '--response-in', '--draft-out', '--report-out', '--existing-in'])
for (let index = 2; index < process.argv.length; index += 2) {
  const key = process.argv[index]
  const value = process.argv[index + 1]
  if (!allowed.has(key) || !value || value.startsWith('--') || options.has(key)) {
    throw new Error('Usage: tsx generate-amharic-play-drafts.ts --source batch.json --model EXACT_ID --prompt-out prompt.json [--response-in generated.json --draft-out drafts.json --report-out report.json] [--existing-in prompts.json]')
  }
  options.set(key, value)
}
if (!options.has('--source') || !options.has('--model') || !options.has('--prompt-out') ||
    (options.has('--response-in') !== options.has('--draft-out')) ||
    (options.has('--response-in') !== options.has('--report-out')) ||
    (options.has('--existing-in') && !options.has('--response-in'))) {
  throw new Error('Source, exact model, and prompt output are required; response validation also requires draft and report outputs.')
}

async function boundedJson(path: string, maxBytes: number): Promise<unknown> {
  const absolute = resolve(path)
  const info = await stat(absolute)
  if (!info.isFile() || info.size > maxBytes) throw new Error(`Input exceeds ${maxBytes} bytes or is not a file.`)
  return JSON.parse(await readFile(absolute, 'utf8')) as unknown
}

const source = await boundedJson(options.get('--source')!, 65_536)
const modelId = options.get('--model')!
const prompt = await buildAmharicQuestionPrompt(source, modelId)
let result: Awaited<ReturnType<typeof validateAmharicQuestionResponse>> | null = null
if (options.has('--response-in')) {
  const response = await boundedJson(options.get('--response-in')!, 131_072)
  const existing = options.has('--existing-in') ? await boundedJson(options.get('--existing-in')!, 131_072) : []
  if (!Array.isArray(existing) || existing.some((item) => typeof item !== 'string')) {
    throw new Error('Existing prompts must be a JSON array of Amharic strings.')
  }
  result = await validateAmharicQuestionResponse(source, modelId, response, existing as string[])
}

const outputs = [options.get('--prompt-out')!, options.get('--draft-out'), options.get('--report-out')]
  .filter((path): path is string => Boolean(path)).map((path) => resolve(path))
if (new Set(outputs).size !== outputs.length) throw new Error('Each output path must be distinct.')
for (const path of outputs) {
  try { await stat(path); throw new Error(`Refusing to overwrite existing output: ${path}`) }
  catch (error) { if ((error as NodeJS.ErrnoException).code !== 'ENOENT') throw error }
}
await writeFile(outputs[0], `${JSON.stringify(prompt, null, 2)}\n`, { flag: 'wx' })
if (result) {
  await writeFile(resolve(options.get('--draft-out')!), `${JSON.stringify({ version: 1, status: 'draft',
    editorialReviewRequired: true, sourceHash: result.sourceHash, modelId, drafts: result.drafts }, null, 2)}\n`, { flag: 'wx' })
  await writeFile(resolve(options.get('--report-out')!), `${JSON.stringify({ version: 1, accepted: result.drafts.length,
    rejected: 0, sourceHash: result.sourceHash, modelId, publication: 'not_allowed',
    editorialReviewRequired: true }, null, 2)}\n`, { flag: 'wx' })
}
console.log(JSON.stringify({ sourceHash: prompt.sourceHash, modelId, drafts: result?.drafts.length ?? 0,
  mode: result ? 'validated-drafts' : 'prompt-only', publication: 'not_allowed' }))
