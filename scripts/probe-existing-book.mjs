import { createClient } from '@supabase/supabase-js'

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY

if (!url || !key) {
  console.error('Missing Supabase credentials in environment')
  process.exit(1)
}

const supabase = createClient(url, key)
const bookId = 'bd177171-ee34-4ec0-a762-9687b87153e3'

console.log(`Checking existing Church Library book: ${bookId}`)
const { data: book, error: bookError } = await supabase
  .from('church_library_books')
  .select('*')
  .eq('id', bookId)
  .maybeSingle()

console.log('Book query result:', JSON.stringify({ book, bookError }, null, 2))

console.log('\nChecking church_library_book_versions:')
const { data: versions, error: versionsError } = await supabase
  .from('church_library_book_versions')
  .select('*')
  .eq('book_id', bookId)

console.log('Versions query result:', JSON.stringify({ versions, versionsError }, null, 2))

console.log('\nChecking church-library-originals bucket:')
const { data: bucket, error: bucketError } = await supabase.storage.getBucket('church-library-originals')
console.log('Bucket check result:', JSON.stringify({ bucket, bucketError }, null, 2))
