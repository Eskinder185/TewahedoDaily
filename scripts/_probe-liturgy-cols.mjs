import { readFileSync, existsSync } from 'node:fs'
function load(p) {
  if (!existsSync(p)) return
  for (const l of readFileSync(p, 'utf8').split(/\r?\n/)) {
    const m = l.match(/^([^#=]+)=(.*)$/)
    if (!m) continue
    let v = m[2].trim()
    if (
      (v.startsWith('"') && v.endsWith('"')) ||
      (v.startsWith("'") && v.endsWith("'"))
    )
      v = v.slice(1, -1)
    if (!process.env[m[1].trim()]) process.env[m[1].trim()] = v
  }
}
load('.env')
load('.env.local')
const u = process.env.VITE_SUPABASE_URL
const k = process.env.VITE_SUPABASE_PUBLISHABLE_KEY
const r = await fetch(`${u}/rest/v1/liturgy_entries?select=*&limit=1`, {
  headers: { apikey: k, Authorization: `Bearer ${k}` },
})
const j = await r.json()
console.log(Object.keys(j[0] || {}))
