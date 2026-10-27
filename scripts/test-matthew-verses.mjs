import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) return

  // 1. Find canonical book for matthew
  const { data: book, error: bErr } = await supabase
    .from('bible_canonical_books')
    .select('*')
    .eq('slug', 'matthew')
    .maybeSingle()
  console.log('Matthew canonical book:', bErr ? bErr.message : book?.id, book?.name_en, book?.name_am)

  if (!book) return

  // 2. Find source books & editions
  const { data: sources } = await supabase
    .from('bible_source_books')
    .select('*, bible_editions(*)')
    .eq('canonical_book_id', book.id)
  console.log('Sources count:', sources?.length)
  for (const s of sources || []) {
    console.log('Source:', s.id, 'edition:', s.bible_editions?.code, s.bible_editions?.name)
  }

  // 3. Find chapters with chapter_number = 6
  const sourceIds = (sources || []).map(s => s.id)
  const { data: chapters } = await supabase
    .from('bible_chapters')
    .select('*')
    .in('source_book_id', sourceIds)
    .eq('chapter_number', 6)
  console.log('Chapters found:', chapters?.length)
  for (const c of chapters || []) {
    console.log('Chapter:', c.id, 'source_book_id:', c.source_book_id)
    // 4. Fetch verses 16, 17, 18
    const { data: verses } = await supabase
      .from('bible_verses')
      .select('id, verse_number, text')
      .eq('chapter_id', c.id)
      .in('verse_number', [16, 17, 18])
      .order('verse_number')
    console.log(`Verses for chapter ${c.id}:`, verses)
  }
}

run().catch(console.error)
