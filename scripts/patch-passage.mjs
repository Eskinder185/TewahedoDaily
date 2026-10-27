import fs from 'fs'

let s = fs.readFileSync('src/lib/bible/passageService.ts', 'utf8')

s = s.replace(
  "import type { CanonicalBook, SourceBook, BibleEdition, BibleChapter, BibleVerse } from './bibleTypes'",
  "import type { BibleEdition, BibleChapter } from './bibleTypes'"
)

s = s.replace(
  ".select('*, bible_editions(*)')",
  "// @ts-expect-error Supabase auto types do not declare foreign table bible_editions on bible_source_books\n      .select('*, bible_editions(*)')"
)

s = s.replace(
  "let matchedSource = sources.find((s) => s.bible_editions?.code === targetEditionCode)",
  "let matchedSource = (sources as any[]).find((s: any) => s.bible_editions?.code === targetEditionCode)"
)

s = s.replace(
  "const edition = matchedSource.bible_editions as BibleEdition",
  "const edition = (matchedSource as any).bible_editions as BibleEdition"
)

s = s.replace(
  "bookTitleEn: book.name_en,",
  "bookTitleEn: book.name_en || book.slug,"
)

s = s.replace(
  "bookTitleAm: book.name_am || book.name_en,",
  "bookTitleAm: book.name_am || book.name_en || book.slug,"
)

fs.writeFileSync('src/lib/bible/passageService.ts', s, 'utf8')
console.log('Patched passageService.ts successfully')
