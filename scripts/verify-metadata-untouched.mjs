import { execSync } from 'node:child_process'

console.log('Verifying non-lyric columns on public.mezmur_data_import...')

// Check if any non-lyric columns have null or changed values unexpectedly
const sql = `
SELECT
  COUNT(*) as total_published,
  COUNT(title) as with_title,
  COUNT(slug) as with_slug,
  COUNT(CASE WHEN youtube_url IS NOT NULL THEN 1 END) as with_youtube,
  COUNT(CASE WHEN zemari_id IS NOT NULL THEN 1 END) as with_zemari,
  COUNT(CASE WHEN status = 'published' THEN 1 END) as published_count,
  COUNT(CASE WHEN deleted_at IS NULL THEN 1 END) as active_count
FROM public.mezmur_data_import
WHERE deleted_at IS NULL AND status = 'published';
`

const out = execSync(`npx supabase db query --linked "${sql.replace(/\r?\n/g, ' ')}"`, { encoding: 'utf8' })
console.log('Query result:', out)
