import type { CmsTables, CmsRole, ContentStatus, ContentType } from './cms.types'
import type { CommunitySubmission, Duplicate, SubmissionStatus } from '../community/types'

export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: CmsTables & {
      chant_categories: {
        Row: {
          slug: string
          name_am: string
          name_en: string
          description: string
          display_order: number
          image_url: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          slug: string
          name_am?: string
          name_en?: string
          description?: string
          display_order?: number
          image_url?: string | null
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          slug?: string
          name_am?: string
          name_en?: string
          description?: string
          display_order?: number
          image_url?: string | null
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Relationships: []
      }
      chant_secondary_categories: {
        Row: {
          chant_key: string
          category_slug: string
          created_at: string
        }
        Insert: {
          chant_key: string
          category_slug: string
          created_at?: string
        }
        Update: {
          chant_key?: string
          category_slug?: string
          created_at?: string
        }
        Relationships: []
      }
      chants: {
        Row: {
          key: string
          id: string
          form: Database['public']['Enums']['chant_form']
          slug: string
          title: string
          transliteration_title: string
          lyrics: string
          transliteration_lyrics: string
          meaning: string | null
          youtube_url: string | null
          audio_url: string | null
          thumbnail_url: string | null
          language: string | null
          category_primary: string
          category_major_holidays: string[]
          category_saints: string[]
          category_themes: string[]
          category_usage: string[]
          category_seasons: string[]
          category_confidence: string | null
          primary_category_slug: string | null
          classification_confidence: number | null
          classification_reason: string | null
          classification_signals: string[]
          needs_review: boolean
          metadata: Json
          source_pack: string | null
          published: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          key: string
          id: string
          form: Database['public']['Enums']['chant_form']
          slug: string
          title: string
          transliteration_title?: string
          lyrics?: string
          transliteration_lyrics?: string
          meaning?: string | null
          youtube_url?: string | null
          audio_url?: string | null
          thumbnail_url?: string | null
          language?: string | null
          category_primary?: string
          category_major_holidays?: string[]
          category_saints?: string[]
          category_themes?: string[]
          category_usage?: string[]
          category_seasons?: string[]
          category_confidence?: string | null
          primary_category_slug?: string | null
          classification_confidence?: number | null
          classification_reason?: string | null
          classification_signals?: string[]
          needs_review?: boolean
          metadata?: Json
          source_pack?: string | null
          published?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: Partial<Database['public']['Tables']['chants']['Insert']>
        Relationships: []
      }
    }
    Views: Record<never, never>
    Functions: {
      save_cms_content: {Args:{content_kind:string;payload:Json;expected_updated_at:string|null};Returns:Json}
      public_daily_content: {Args:{target_day:string};Returns:Json}
      cms_media_inventory: {Args:{q:string;media_type:string;page_number:number};Returns:Json}
      discover_mezmur: { Args: {q:string;language:string;singer:string;category:string;occasion:string;featured_only:boolean;sort_by:string;page_number:number}; Returns: Json }
      public_mezmur_detail: { Args: {slug_or_alias:string}; Returns: Json }
      public_discovery_facets: { Args: Record<string,never>; Returns: Json }
      search_public_content: { Args: {q:string;page_number:number}; Returns: Json }
      public_favorites: { Args: {page_number:number}; Returns: Json }
      review_submission: { Args: { submission_id: string; new_status: SubmissionStatus; notes: string; expected_updated_at: string }; Returns: CommunitySubmission[] }
      convert_submission: { Args: { submission_id: string; expected_updated_at: string; include_credit: boolean }; Returns: string }
      submission_duplicates: { Args: { submission_id: string }; Returns: Duplicate[] }
      save_mezmur: { Args: { payload: Json; tag_ids: string[]; expected_updated_at?: string | null }; Returns: CmsTables['mezmur']['Row'][] }
      cms_version_authors: { Args: Record<string, never>; Returns: { id: string; display_name: string }[] }
      set_cms_member: { Args: { target_user_id: string; new_role: CmsRole | null }; Returns: undefined }
    }
    Enums: {
      cms_role: CmsRole
      content_status: ContentStatus
      cms_content_type: ContentType
      chant_form: 'mezmur' | 'werb'
    }
    CompositeTypes: Record<never, never>
  }
}

