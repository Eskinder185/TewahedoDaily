/**
 * Probe public.mezmur column types via filter behavior (no direct pg_catalog access).
 * Run: node --env-file-if-exists=.env.local scripts/probe-mezmur-column-types.mjs
 */
import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

function load(file) {
  if (!existsSync(file)) return
  for (const line of readFileSync(file, 'utf8').split(/\r?\n/)) {
    const t = line.trim()
    if (!t || t.startsWith('#')) continue
    const i = t.indexOf('=')
    if (i <= 0) continue
    const k = t.slice(0, i).trim()
    let v = t.slice(i + 1).trim()
    if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) {
      v = v.slice(1, -1)
    }
    if (!process.env[k]) process.env[k] = v
  }
}

load('.env.local')
load('.env')

const url = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL
const key =
  process.env.VITE_SUPABASE_ANON_KEY ||
  process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||
  process.env.SUPABASE_ANON_KEY

if (!url || !key) {
  console.log(JSON.stringify({ error: 'NO_SUPABASE_ENV' }))
  process.exit(0)
}

const sb = createClient(url, key)

async function probe(column) {
  const sample = await sb.from('mezmur').select(column).eq('status', 'published').limit(3)
  const sampleType = sample.data?.[0]
    ? {
        jsType: typeof sample.data[0][column],
        isArray: Array.isArray(sample.data[0][column]),
        sample: sample.data[0][column],
      }
    : { note: 'no rows or column missing', error: sample.error?.message }

  const contains = await sb
    .from('mezmur')
    .select('id')
    .contains(column, ['__probe__'])
    .limit(1)
  const ilike = await sb.from('mezmur').select('id').ilike(column, '%__probe__%').limit(1)
  const eq = await sb.from('mezmur').select('id').eq(column, '__probe__').limit(1)

  let inferred = 'unknown'
  if (contains.error?.message?.includes('operator does not exist: text @>')) inferred = 'text'
  else if (!contains.error || contains.error.code === 'PGRST116') inferred = 'text[] or jsonb (supports @>)'
  else if (contains.error?.message?.includes('jsonb')) inferred = 'maybe jsonb'
  else if (!ilike.error || /invalid|operator/i.test(ilike.error?.message || '')) {
    if (ilike.error?.message?.includes('operator does not exist')) inferred = 'not plain text (maybe text[])'
  }

  if (!contains.error && ilike.error?.message?.includes('operator does not exist')) {
    inferred = 'text[] (or non-text)'
  }
  if (contains.error?.message?.includes('text @>')) inferred = 'text'
  if (!contains.error && sampleType.isArray) inferred = 'text[]'

  return {
    column,
    inferred,
    sampleType,
    contains: contains.error?.message || 'ok',
    ilike: ilike.error?.message || 'ok',
    eq: eq.error?.message || 'ok',
  }
}

const columns = [
  'search_keywords',
  'occasion_tags',
  'themes',
  'saint_tags',
  'category',
  'occasion',
  'language',
  'form',
]

const results = []
for (const column of columns) {
  results.push(await probe(column))
}

console.log(JSON.stringify(results, null, 2))
