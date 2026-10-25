import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

let url = ''
let serviceKey = ''

if (existsSync('.env.import')) {
  for (const line of readFileSync('.env.import', 'utf8').split(/\r?\n/)) {
    const eq = line.indexOf('=')
    if (eq === -1 || line.trim().startsWith('#')) continue
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) {
      val = val.slice(1, -1)
    }
    if (name === 'SUPABASE_URL') url = val
    if (name === 'SUPABASE_SERVICE_ROLE_KEY') serviceKey = val
  }
}

if (!url || !serviceKey) {
  console.log('No service key available')
  process.exit(1)
}

const adminClient = createClient(url, serviceKey)

// 1. Inspect mezmur_data_import columns and sample row
const sample = await adminClient.from('mezmur_data_import').select('*').limit(3)
console.log('Sample mezmur_data_import columns:', Object.keys(sample.data?.[0] || {}))

// 2. Count rows by status
const { data: allRows, error } = await adminClient.from('mezmur_data_import').select('status,rights_status,review_status,publication_approved_at,publication_approved_by,lyrics_amharic,lyrics_geez,lyrics_english,lyrics_oromo,lyrics_transliteration,youtube_url,source_url,external_lyrics_url')

if (error) {
  console.error('Error fetching mezmur_data_import:', error)
  process.exit(1)
}

console.log('Total rows in mezmur_data_import:', allRows.length)

let publishedCount = 0
let draftCount = 0
let otherStatus = 0
let withAmharicLyrics = 0
let withGeezLyrics = 0
let withEnglishLyrics = 0
let withOromoLyrics = 0
let withApprovedAt = 0
let withApprovedBy = 0
let publishedWithLyrics = 0
let publishedApprovedWithLyrics = 0

const rightsCounts = {}
const reviewCounts = {}

for (const row of allRows) {
  if (row.status === 'published') publishedCount++
  else if (row.status === 'draft') draftCount++
  else otherStatus++

  rightsCounts[row.rights_status] = (rightsCounts[row.rights_status] || 0) + 1
  reviewCounts[row.review_status] = (reviewCounts[row.review_status] || 0) + 1

  const hasLyrics = Boolean(row.lyrics_amharic?.trim() || row.lyrics_geez?.trim() || row.lyrics_english?.trim() || row.lyrics_oromo?.trim())
  if (row.lyrics_amharic?.trim()) withAmharicLyrics++
  if (row.lyrics_geez?.trim()) withGeezLyrics++
  if (row.lyrics_english?.trim()) withEnglishLyrics++
  if (row.lyrics_oromo?.trim()) withOromoLyrics++
  if (row.publication_approved_at) withApprovedAt++
  if (row.publication_approved_by) withApprovedBy++

  if (row.status === 'published' && hasLyrics) {
    publishedWithLyrics++
    if (row.publication_approved_at && row.publication_approved_by) {
      publishedApprovedWithLyrics++
    }
  }
}

console.log('Status breakdown:', { publishedCount, draftCount, otherStatus })
console.log('Rights status breakdown:', rightsCounts)
console.log('Review status breakdown:', reviewCounts)
console.log('Lyrics fields breakdown:', {
  withAmharicLyrics,
  withGeezLyrics,
  withEnglishLyrics,
  withOromoLyrics,
  withApprovedAt,
  withApprovedBy,
  publishedWithLyrics,
  publishedApprovedWithLyrics,
})

// Sample published rows
const publishedSample = allRows.filter(r => r.status === 'published').slice(0, 5)
console.log('Published sample rows:', publishedSample.map(r => ({
  rights_status: r.rights_status,
  has_approved_at: Boolean(r.publication_approved_at),
  has_approved_by: Boolean(r.publication_approved_by),
  has_lyrics: Boolean(r.lyrics_amharic?.trim()),
  has_youtube: Boolean(r.youtube_url?.trim()),
})))
