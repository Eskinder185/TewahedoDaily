type BibleTable<Row, Insert = Partial<Row>> = {
  Row: Row
  Insert: Insert
  Update: Partial<Insert>
  Relationships: []
}

export type BibleEdition = {
  id: string
  code: string
  name: string
  language_code: string
  review_status: string
  is_public: boolean
  source_metadata: unknown
  created_at: string
  updated_at: string
}

export type CanonicalBook = {
  id: string
  canonical_number: number
  collection: 'old' | 'new'
  slug: string
  name_en: string | null
  name_am: string | null
  sort_order: number
  source_status: 'available' | 'partial' | 'missing'
  created_at: string
  updated_at: string
}

export type SourceBook = {
  id: string
  edition_id: string
  canonical_book_id: string
  source_book_number: number
  source_file: string
  source_name_en: string | null
  source_name_am: string | null
  source_short_name_en: string | null
  source_short_name_am: string | null
  source_order: number
  source_part: number | null
  source_metadata: unknown
  review_status: string
  is_public: boolean
  created_at: string
  updated_at: string
}

export type BibleChapter = {
  id: string
  source_book_id: string
  chapter_number: number
  source_order: number
  created_at: string
  updated_at: string
}

export type BibleSection = {
  id: string
  chapter_id: string
  source_order: number
  title: string | null
  created_at: string
  updated_at: string
}

export type BibleVerse = {
  id: string
  chapter_id: string
  section_id: string | null
  source_order: number
  verse_number: number
  text: string
  created_at: string
  updated_at: string
}

export type BibleTables = {
  bible_editions: BibleTable<BibleEdition>
  bible_canonical_books: BibleTable<CanonicalBook>
  bible_source_books: BibleTable<SourceBook>
  bible_chapters: BibleTable<BibleChapter>
  bible_sections: BibleTable<BibleSection>
  bible_verses: BibleTable<BibleVerse>
}

export type BibleLanguage = 'am' | 'en' | 'both'
export type BibleEditionCode = 'am' | 'web'

export type ReaderChapter = BibleChapter & {
  source: SourceBook
  edition: BibleEditionCode
  ordinal: number
}

export type BibleBookDetail = {
  book: CanonicalBook
  sources: SourceBook[]
  chapters: Record<'am' | 'web', ReaderChapter[]>
}

export type ChapterText = {
  chapter: ReaderChapter
  sections: BibleSection[]
  verses: BibleVerse[]
}
