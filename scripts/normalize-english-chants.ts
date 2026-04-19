/**
 * Rewrites `src/data/chants/english-mezmur-chants.json` as one valid JSON
 * document `{ kind, language, entries: [...] }` (deduped by `id`).
 *
 * Run after saving the file (including `[{...}{...}]` or JSONL pastes):
 *   npx --yes tsx scripts/normalize-english-chants.ts
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { dirname, join } from 'node:path'
import { parseEnglishChantPackText } from '../src/lib/practice/parseEnglishChantPack.ts'

const root = dirname(fileURLToPath(import.meta.url))
const target = join(root, '../src/data/chants/english-mezmur-chants.json')

const raw = readFileSync(target, 'utf8')
const rows = parseEnglishChantPackText(raw)
const seen = new Map<string, unknown>()
for (const r of rows) {
  if (r && typeof r === 'object' && r !== null && 'id' in r) {
    const id = String((r as { id: unknown }).id).trim()
    if (id) seen.set(id, r)
  }
}

const pack = {
  kind: 'chant',
  language: 'en',
  description: 'English mezmur chants for practice (chant workshop).',
  implementationNotes: 'Each entry matches MezmurEntry in src/data/types/mezmur.ts.',
  entries: [...seen.values()],
}

writeFileSync(target, `${JSON.stringify(pack, null, 2)}\n`, 'utf8')
console.log(`Wrote ${seen.size} English mezmur entries to english-mezmur-chants.json`)
