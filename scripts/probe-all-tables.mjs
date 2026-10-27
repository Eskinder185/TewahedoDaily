import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'

const env = Object.fromEntries(
  readFileSync('.env.local', 'utf8')
    .split(/\r?\n/)
    .filter((l) => l.includes('='))
    .map((l) => l.split('=').map((s) => s.trim()))
)
const sb = createClient(env.VITE_SUPABASE_URL, env.VITE_SUPABASE_PUBLISHABLE_KEY)

const tables = [
  'mezmur_data_import',
  'mezmur_public',
  'mezmur',
  'mezmur_category_links_import',
  'mezmur_occasion_links_import',
  'mezmur_section_links_import',
  'mezmur_enrichment_jobs',
  'mezmur_enrichment_suggestions',
  'mezmur_enrichment_events',
  'mezmur_publication_events',
  'hymn_sections',
  'hymn_collections',
  'zemaris',
  'zemaris_with_counts',
]

for (const t of tables) {
  const { data, error } = await sb.from(t).select('*').limit(1)
  if (error) {
    console.log(`Table ${t}: ERROR ${error.code} - ${error.message}`)
  } else {
    console.log(`Table ${t}: OK (cols: ${Object.keys(data[0] || {}).join(', ')})`)
  }
}
