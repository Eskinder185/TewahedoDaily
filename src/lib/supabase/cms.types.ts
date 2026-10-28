import type { Json } from './database.types'
import type { CommunitySubmission } from '../community/types'
export type CmsRole = 'super_admin' | 'admin' | 'editor' | 'contributor' | 'user'
export type ContentStatus = 'draft' | 'pending_review' | 'published' | 'rejected' | 'archived'
export type ContentType = 'mezmur' | 'saints' | 'feasts' | 'prayers' | 'articles'
type Table<Row, Required extends keyof Row = never> = {
  Row: Row
  Insert: Partial<Row> & Pick<Row, Required>
  Update: Partial<Row>
  Relationships: []
}
type Timestamps = { created_at: string; updated_at: string }
type Content = Timestamps & {
  id: string; slug: string; title: string; title_amharic: string | null; title_oromo: string | null
  description: string | null; thumbnail_url: string | null; status: ContentStatus
  featured: boolean; published_at: string | null; created_by: string | null; updated_by: string | null
}
type Body = { body: string | null; body_amharic: string | null; body_oromo:string|null; audio_url:string|null; date_notes:string|null; related_content:Json }
export type CmsTables = {
  church_library_books: Table<Timestamps & {
    id: string
    title: string
    title_amharic?: string | null
    author: string | null
    language: 'en' | 'am' | 'gez' | 'mixed' | 'other'
    category: string | null
    document_type?: 'book' | 'article' | 'teaching' | 'liturgy' | 'reference' | 'other'
    publication_date?: string | null
    description: string | null
    cover_storage_path: string | null
    original_publication_info: string | null
    source_url: string | null
    access_level: 'private' | 'staff' | 'public_search'
    rights_status: 'unknown' | 'owned' | 'licensed' | 'public_domain' | 'permission_granted' | 'restricted'
    rights_notes: string | null
    allow_search_quotes: boolean
    allow_source_link: boolean
    approved_for_ingestion: boolean
    public_retrieval_enabled: boolean
    processing_status: 'not_uploaded' | 'pending' | 'processing' | 'ready' | 'needs_ocr' | 'failed'
    extraction_quality: 'not_checked' | 'good' | 'partial' | 'uncertain' | 'unreadable'
    extraction_notes: string | null
    current_version_id: string | null
    created_by: string | null
    updated_by: string | null
    ingestion_status?: string | null
    search_enabled?: boolean
    storage_path?: string | null
  }, 'title'>
  church_library_versions: Table<{
    id: string
    book_id: string
    version_number: number
    original_file_name: string
    source_storage_path: string
    mime_type: string
    byte_size: number
    sha256: string | null
    processing_status: 'pending' | 'processing' | 'ready' | 'needs_ocr' | 'failed'
    extraction_quality: 'not_checked' | 'good' | 'partial' | 'uncertain' | 'unreadable'
    extraction_notes: string | null
    error_code: string | null
    error_message: string | null
    page_count: number | null
    section_count: number
    passage_count: number
    processed_at: string | null
    created_by: string | null
    created_at: string
  }, 'id' | 'book_id' | 'version_number' | 'original_file_name' | 'source_storage_path' | 'mime_type' | 'byte_size'>
  church_library_book_versions: Table<{
    id: string
    book_id: string
    version_number: number
    original_file_name: string
    source_storage_path: string
    mime_type: string
    byte_size: number
    sha256: string | null
    processing_status: 'pending' | 'processing' | 'ready' | 'needs_ocr' | 'failed'
    extraction_quality: 'not_checked' | 'good' | 'partial' | 'uncertain' | 'unreadable'
    extraction_notes: string | null
    error_code: string | null
    error_message: string | null
    page_count: number | null
    section_count: number
    passage_count: number
    processed_at: string | null
    created_by: string | null
    created_at: string
  }, 'id' | 'book_id' | 'version_number' | 'original_file_name' | 'source_storage_path' | 'mime_type' | 'byte_size'>
  church_library_sections: Table<{
    id: string
    book_id: string
    version_id: string
    section_order: number
    title: string | null
    chapter_reference: string | null
    page_start: number | null
    page_end: number | null
    created_at: string
  }, 'book_id' | 'version_id' | 'section_order'>
  church_library_passages: Table<{
    id: string
    book_id: string
    version_id: string
    section_id: string | null
    passage_order: number
    language: 'en' | 'am' | 'gez' | 'mixed' | 'other'
    content: string
    page_start: number | null
    page_end: number | null
    chapter_reference: string | null
    locator_label: string | null
    source_passage_id: string | null
    extraction_confidence: number | null
    search_document: unknown
    embedding: unknown
    embedding_model: string | null
    original_content: string | null
    review_status: 'pending' | 'reviewed' | 'needs_attention'
    reviewer_notes: string | null
    reviewed_by: string | null
    reviewed_at: string | null
    revision_count: number
    updated_by: string | null
    updated_at: string
    created_at: string
  }, 'book_id' | 'version_id' | 'passage_order' | 'content'>
  church_library_passage_revisions: Table<{
    id: string
    passage_id: string
    revision_number: number
    content: string
    review_status: 'pending' | 'reviewed' | 'needs_attention'
    reviewer_notes: string | null
    changed_by: string | null
    created_at: string
  }, 'passage_id' | 'revision_number' | 'content'>
  daily_content: Table<{
    id: string
    content_date: string
    mezmur_id: string | null
    saint_id: string | null
    feast_id: string | null
    announcement: string
    summary: string | null
    published: boolean
    updated_at: string
    updated_by: string | null
  }, 'content_date'>
  mezmur_favorites: Table<{user_id:string;mezmur_id:string;created_at:string},'mezmur_id'>
  user_favorites: Table<{
    id: string
    user_id: string
    content_type: string
    content_id: string | null
    content_slug: string | null
    collection_slug: string | null
    title: string | null
    route: string | null
    created_at: string
  }, 'user_id' | 'content_type'>
  user_reading_progress: Table<{
    id: string
    user_id: string
    content_type: string
    content_id: string | null
    content_slug: string | null
    collection_slug: string | null
    section_slug: string | null
    title: string | null
    route: string | null
    position_percent: number | null
    scroll_offset: number | null
    updated_at: string
  }, 'user_id' | 'content_type'>
  community_submissions: Table<CommunitySubmission, 'submission_type' | 'title' | 'contributor_name'>
  profiles: Table<Timestamps & { id: string; email: string | null; display_name: string; avatar_url: string | null; role: CmsRole | null }, 'id'>
  mezmur: Table<Content & {
    lyrics_amharic: string | null; lyrics_geez: string | null; lyrics_english: string | null; lyrics_oromo: string | null
    transliteration: string | null; youtube_url: string | null; audio_url: string | null
    singer_id: string | null; category_id: string | null; source_submission_id: string | null; contributor_credit: string | null
    language: string | null; form: 'mezmur' | 'werb' | null; category: string | null
    occasion: string | null; occasion_tags: string[]; saint_or_angel: string | null
    saint_tags: string[]; themes: string[]; search_keywords: string[]; source: string | null
    thumbnail_path: string | null; image_alt: string | null
  }, 'slug' | 'title'>
  categories: Table<Timestamps & { id: string; name: string; name_amharic: string | null; slug: string; description: string | null; type: ContentType; is_archived: boolean }, 'name' | 'slug'>
  singers: Table<Timestamps & { id: string; name: string; name_amharic: string | null; description: string | null; image_url: string | null; is_archived: boolean }, 'name'>
  tags: Table<{ id: string; name: string; slug: string }, 'name' | 'slug'>
  mezmur_tags: Table<{ mezmur_id: string; tag_id: string }, 'mezmur_id' | 'tag_id'>
  saints: Table<Content & Body & { commemoration_month: number | null; commemoration_day: number | null }, 'slug' | 'title'>
  feasts: Table<Content & Body & { ethiopian_month: number | null; ethiopian_day: number | null; is_movable: boolean; fasting_info:string|null }, 'slug' | 'title'>
  prayers: Table<Content & Body & { body_oromo: string | null; transliteration: string | null; audio_url: string | null }, 'slug' | 'title'>
  articles: Table<Content & Body & { body_oromo: string | null; teaching_category:string|null }, 'slug' | 'title'>
  prayer_guides: Table<Timestamps & {
    id: string
    slug: string
    title: string
    title_amharic: string | null
    summary: string | null
    summary_amharic: string | null
    status: ContentStatus
    sort_order: number
    source_title: string | null
    source_reference: string | null
    review_status: string
    published_at: string | null
  }, 'slug' | 'title'>
  prayer_guide_sections: Table<Timestamps & {
    id: string
    guide_id: string
    slug: string
    title: string
    title_amharic: string | null
    body_english: string | null
    body_amharic: string | null
    sort_order: number
    source_reference: string | null
    review_status: string
    review_notes: string | null
    content_type: 'instruction' | 'prayer' | 'article' | null
  }, 'guide_id' | 'slug' | 'title'>
  content_versions: Table<{ id: string; content_type: ContentType; content_id: string; snapshot: Json; changed_by: string | null; created_at: string }, 'content_type' | 'content_id' | 'snapshot'>
  content_reports: Table<Timestamps & { id: string; content_type: ContentType; content_id: string; message: string; reporter_email: string | null; status: 'open' | 'resolved' | 'dismissed' }, 'content_type' | 'content_id' | 'message'>
}
