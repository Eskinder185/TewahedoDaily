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
  source_edition: string | null
  attribution: string | null
  rights_status: 'unknown' | 'owned' | 'licensed' | 'public_domain' | 'permission_granted' | 'restricted'
  canon_code: string
  numbering_scheme: string
  publication_status: 'draft' | 'published'
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
  publication_status: 'draft' | 'published'
  created_at: string
  updated_at: string
}

export type BibleDraftVerse = {
  section_id: string | null
  source_order: number
  verse_number: number
  text: string
}

export type BibleChapterDraft = {
  id: string
  chapter_id: string
  verses: BibleDraftVerse[]
  updated_by: string
  created_at: string
  updated_at: string
}

export type BibleChapterRevision = {
  id: string
  chapter_id: string
  revision_number: number
  verses: BibleDraftVerse[]
  action: 'published' | 'restored'
  note: string | null
  created_by: string
  created_at: string
}

export type BibleImportJob = {
  id: string
  file_name: string
  format: 'csv' | 'json' | 'usfm'
  mode: 'create_only' | 'update_existing'
  status: 'processing' | 'completed' | 'completed_with_errors' | 'failed'
  total_chapters: number
  processed_chapters: number
  created_chapters: number
  updated_chapters: number
  skipped_chapters: number
  errors: unknown[]
  created_by: string
  created_at: string
  completed_at: string | null
}

export type BibleContentLink = {
  id: string
  canonical_book_id: string
  chapter_number: number | null
  verse_start: number | null
  verse_end: number | null
  content_type: 'calendar_card' | 'feast' | 'fast' | 'mezmur' | 'prayer' | 'library_book'
  content_id: string
  label: string | null
  is_public: boolean
  created_by: string
  created_at: string
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
  bible_chapter_drafts: BibleTable<BibleChapterDraft>
  bible_chapter_revisions: BibleTable<BibleChapterRevision>
  bible_import_jobs: BibleTable<BibleImportJob>
  bible_content_links: BibleTable<BibleContentLink>
}

export type BibleLanguage = 'am' | 'en' | 'both'
export type BibleEditionCode = string

export type ReaderChapter = BibleChapter & {
  source: SourceBook
  edition: BibleEditionCode
  ordinal: number
}

export type BibleBookDetail = {
  book: CanonicalBook
  sources: SourceBook[]
  chapters: Record<'am' | 'web', ReaderChapter[]>
  byEdition: Record<string, ReaderChapter[]>
  editions: BibleEdition[]
}

export type ChapterText = {
  chapter: ReaderChapter
  sections: BibleSection[]
  verses: BibleVerse[]
}
