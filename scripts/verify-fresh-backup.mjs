import { createClient } from '@supabase/supabase-js'
import { readFileSync, writeFileSync, existsSync } from 'node:fs'
import { createHash } from 'node:crypto'

let url = '', key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
    const eq = line.indexOf('=')
    if (eq === -1 || line.trim().startsWith('#')) continue
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) val = val.slice(1, -1)
    if (name === 'VITE_SUPABASE_URL') url = val
    if (name === 'VITE_SUPABASE_PUBLISHABLE_KEY' || name === 'VITE_SUPABASE_ANON_KEY') key = val
  }
}

const sb = createClient(url, key)

// 1. Fetch all live mezmurs from mezmur_public
console.log('Fetching live mezmurs from mezmur_public...')
let liveRecords = []
let page = 0
const pageSize = 500
while (true) {
  const { data, error } = await sb
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo, status')
    .order('slug', { ascending: true })
    .range(page * pageSize, (page + 1) * pageSize - 1)

  if (error) {
    console.error('Error fetching mezmur_public:', error)
    process.exit(1)
  }
  if (!data || data.length === 0) break
  liveRecords.push(...data)
  if (data.length < pageSize) break
  page++
}

console.log(`Fetched ${liveRecords.length} live records from Supabase.`)

// 2. Check slug uniqueness
const slugMap = new Map()
const duplicates = []
for (const r of liveRecords) {
  if (slugMap.has(r.slug)) {
    duplicates.push(r.slug)
  }
  slugMap.set(r.slug, r)
}
console.log(`Unique slugs: ${slugMap.size} / ${liveRecords.length}. Duplicates: ${duplicates.length}`)

// 3. Save fresh production backup
const freshBackupPath = 'backup/production_lyrics_fresh_backup_20261026.json'
writeFileSync(freshBackupPath, JSON.stringify(liveRecords, null, 2), 'utf8')
console.log(`Saved fresh backup to ${freshBackupPath}`)

// 4. Compare with initial backup
const initialBackupPath = 'backup/mezmur_lyrics_pre_chorus_cleanup_backup.json'
const initialBackup = JSON.parse(readFileSync(initialBackupPath, 'utf8'))
const initialMap = new Map(initialBackup.map(r => [r.slug, r]))

console.log(`Initial backup records: ${initialBackup.length}`)

let exactlyMatching = 0
let changedSinceBackup = []
let missingInLive = []
let newInLive = []

for (const [slug, liveRow] of slugMap) {
  const initRow = initialMap.get(slug)
  if (!initRow) {
    newInLive.push(slug)
    continue
  }
  const amMatch = (liveRow.lyrics_amharic || '') === (initRow.lyrics_amharic || '')
  const trMatch = (liveRow.lyrics_transliteration || '') === (initRow.lyrics_transliteration || '')
  const enMatch = (liveRow.lyrics_english || '') === (initRow.lyrics_english || '')
  const gzMatch = (liveRow.lyrics_geez || '') === (initRow.lyrics_geez || '')
  const orMatch = (liveRow.lyrics_oromo || '') === (initRow.lyrics_oromo || '')

  if (amMatch && trMatch && enMatch && gzMatch && orMatch) {
    exactlyMatching++
  } else {
    changedSinceBackup.push({
      slug,
      diffs: {
        amharic: !amMatch,
        translit: !trMatch,
        english: !enMatch,
        geez: !gzMatch,
        oromo: !orMatch
      }
    })
  }
}

for (const [slug] of initialMap) {
  if (!slugMap.has(slug)) {
    missingInLive.push(slug)
  }
}

console.log('\n--- COMPARISON RESULTS ---')
console.log(`Exactly matching records: ${exactlyMatching} / ${liveRecords.length}`)
console.log(`Changed since initial backup: ${changedSinceBackup.length}`)
console.log(`New in live: ${newInLive.length}`)
console.log(`Missing in live: ${missingInLive.length}`)
if (changedSinceBackup.length > 0) {
  console.log('Changed items:', changedSinceBackup)
}
