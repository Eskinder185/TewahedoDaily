import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const env = Object.fromEntries(
  fs
    .readFileSync(path.join(root, '.env'), 'utf8')
    .split(/\r?\n/)
    .filter((l) => l.includes('='))
    .map((l) => {
      const i = l.indexOf('=')
      return [l.slice(0, i), l.slice(i + 1).replace(/^"|"$/g, '')]
    }),
)
const url = String(env.VITE_SUPABASE_URL || '').replace(/\/$/, '')
const key = env.VITE_SUPABASE_PUBLISHABLE_KEY
const headers = { apikey: key, Authorization: `Bearer ${key}`, Prefer: 'count=exact' }

for (const q of [
  'prayer_learning_collections?select=collection_slug,status&limit=5',
  'prayer_guides?select=slug,status&limit=5',
  'prayer_learning_sections?select=section_slug,status&limit=3',
  'prayer_learning_content?select=content_id,status&limit=3',
]) {
  const res = await fetch(`${url}/rest/v1/${q}`, { headers })
  console.log(q, res.status, res.headers.get('content-range'), (await res.text()).slice(0, 250))
}
