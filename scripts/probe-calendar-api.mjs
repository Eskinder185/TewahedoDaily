import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const envPath = path.join(root, '.env')
const env = Object.fromEntries(
  fs
    .readFileSync(envPath, 'utf8')
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
  'calendar_cards?select=id&limit=1',
  'calendar_cards?select=id,status,image_path&status=eq.published&limit=3',
  'orthodox_observances?select=id&limit=1',
]) {
  const res = await fetch(`${url}/rest/v1/${q}`, { headers })
  console.log(q, res.status, res.headers.get('content-range'), (await res.text()).slice(0, 200))
}
