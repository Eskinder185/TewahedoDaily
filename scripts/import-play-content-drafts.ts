import { createClient } from '@supabase/supabase-js'
import { APPROVED_QUESTIONS } from '../src/lib/play/approvedContent'
import type { PlayQuestion } from '../src/lib/play/types'

const apply = process.argv.includes('--apply')
const allowedGames = new Set(['trivia', 'emoji', 'finish-the-verse', 'finish-the-mezmur', 'history'])
const stableId = /^[a-z0-9]+(?:-[a-z0-9]+)*$/

function validate(item: PlayQuestion) {
  const errors: string[] = []
  if (!stableId.test(item.id)) errors.push('invalid stable ID')
  if (!allowedGames.has(item.game)) errors.push('unsupported game type')
  if (!item.prompt.en?.trim() || !item.explanation.en?.trim()) errors.push('missing verified English text')
  if (item.options.length !== 4) errors.push('must have exactly four answers')
  if (!item.options.some((option) => option.key === item.correctKey)) errors.push('correct answer key is absent')
  if (!item.source.label?.trim() || !item.source.route?.startsWith('/')) errors.push('missing internal source reference')
  if (!item.verifiedLocales.includes('en')) errors.push('English localization is not marked verified')
  return errors
}

const seen = new Set<string>()
const candidates = APPROVED_QUESTIONS.map((item) => {
  const errors = validate(item)
  if (seen.has(item.id)) errors.push('duplicate stable ID in candidate set')
  seen.add(item.id)
  return { item, errors }
})
const invalid = candidates.filter((candidate) => candidate.errors.length)
if (invalid.length) {
  for (const candidate of invalid) console.error(`${candidate.item.id}: ${candidate.errors.join(', ')}`)
  throw new Error(`${invalid.length} Play draft candidate(s) failed validation.`)
}

console.log(`Validated ${candidates.length} source-linked Play draft candidates.`)
console.log('No content will be approved or published by this pipeline.')
if (!apply) {
  console.log('Dry run complete. Use --apply with server-side SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY to insert missing drafts.')
  process.exit(0)
}

const url = process.env.SUPABASE_URL
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !serviceRoleKey) throw new Error('SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are required for --apply. Do not use VITE_ client credentials.')

const supabase = createClient(url, serviceRoleKey, { auth: { persistSession: false, autoRefreshToken: false } })
const ids = candidates.map(({ item }) => item.id)
const { data: existingRows, error: existingError } = await supabase.from('play_content_items').select('stable_id').in('stable_id', ids)
if (existingError) throw existingError
const existing = new Set((existingRows || []).map((row) => String(row.stable_id)))
const rows = candidates.filter(({ item }) => !existing.has(item.id)).map(({ item }) => ({
  stable_id: item.id,
  game_type: item.game,
  category: item.category,
  difficulty: item.difficulty,
  payload: item,
  source_references: [item.source],
  status: 'draft',
}))
if (!rows.length) {
  console.log('All validated candidates already exist; no rows inserted.')
  process.exit(0)
}
const { error: insertError } = await supabase.from('play_content_items').insert(rows)
if (insertError) throw insertError
console.log(`Inserted ${rows.length} new draft item(s). Editorial approval and publication are still required in /admin/play.`)
