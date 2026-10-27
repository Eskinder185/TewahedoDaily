import { createClient } from '@supabase/supabase-js'
import * as fs from 'node:fs'
import * as crypto from 'node:crypto'
import * as path from 'node:path'

const env = fs.readFileSync('.env.local', 'utf8')
let url = '', key = ''
for (const line of env.split('\n')) {
  if (line.startsWith('VITE_SUPABASE_URL=')) url = line.split('=')[1].trim()
  if (line.startsWith('VITE_SUPABASE_PUBLISHABLE_KEY=')) key = line.split('=')[1].trim()
}
const sb = createClient(url, key)

async function backup() {
  console.log('Fetching all records from mezmur_public for immutable backup...')
  let all: any[] = []
  let page = 0
  while (true) {
    const { data, error } = await sb.from('mezmur_public')
      .select('mezmur_id, slug, title, title_amharic, status, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo, updated_at')
      .order('slug', { ascending: true })
      .range(page * 500, (page + 1) * 500 - 1)
    if (error) throw error
    if (!data || data.length === 0) break
    all.push(...data)
    if (data.length < 500) break
    page++
  }

  const jsonStr = JSON.stringify(all, null, 2)
  const hash = crypto.createHash('sha256').update(jsonStr).digest('hex')

  const outDir = path.resolve('backup')
  if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true })

  const backupPath = path.join(outDir, 'MEZMUR_ORIGINAL_BACKUP.json')
  fs.writeFileSync(backupPath, jsonStr, 'utf8')

  console.log(`✓ Saved ${all.length} records to ${backupPath}`)
  console.log(`  File size: ${(Buffer.byteLength(jsonStr) / 1024 / 1024).toFixed(2)} MB`)
  console.log(`  SHA-256: ${hash}`)
}

backup().catch(console.error)
