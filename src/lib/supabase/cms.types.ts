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
    lyrics_amharic: string | null; lyrics_english: string | null; lyrics_oromo: string | null
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
