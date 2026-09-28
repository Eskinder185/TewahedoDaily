export type SubmissionType = 'mezmur' | 'correction' | 'prayer' | 'saint' | 'feast' | 'article' | 'other'
export type SubmissionStatus = 'submitted' | 'under_review' | 'needs_changes' | 'approved' | 'rejected' | 'duplicate' | 'converted_to_content'
export type CommunitySubmission = {
 id: string; public_reference: string; submission_type: SubmissionType; title: string; title_amharic: string
 singer_name: string; youtube_url: string; lyrics_amharic: string; lyrics_english: string; lyrics_oromo: string; transliteration: string
 suggested_category: string; suggested_tags: string[]; contributor_name: string; contributor_email: string; credit_requested: boolean
 source_notes: string; source_reference: string; admin_notes: string; related_content_id: string | null; related_legacy_key: string | null
 related_content_title: string | null; current_page_url: string | null; correction_type: string | null; suggested_correction: string; explanation: string
 status: SubmissionStatus; reviewed_by: string | null; reviewed_at: string | null; created_at: string; updated_at: string
}
export type Duplicate = { content_id: string; source: 'mezmur' | 'submission' | 'legacy'; reference: string; title: string; reason: string; score: number }
