import { isSupabaseConfigured, supabase } from '../supabase/client'
import type { SubmissionPayload } from './validation'

export { isSupabaseConfigured }

/** Friendly mapping for Postgres / PostgREST errors shown to visitors. */
export function submissionErrorMessage(error: { message?: string; code?: string; details?: string } | null): string {
  if (!error) return 'Unable to submit. Please try again.'
  const text = `${error.message || ''} ${error.details || ''}`.toLowerCase()
  if (error.code === '23514' || text.includes('check')) {
    return 'Please check required fields (title, name, and either YouTube or lyrics) and try again.'
  }
  if (error.code === '23503' || text.includes('foreign')) {
    return 'Related content was not found. Open the correction form from a Mezmur page.'
  }
  if (error.code === '42501' || text.includes('permission') || text.includes('row-level security')) {
    return 'Submissions are temporarily unavailable. Please try again later.'
  }
  if (text.includes('network') || text.includes('fetch')) {
    return 'Network error. Check your connection and try again.'
  }
  if (error.message && !/stack|exception|sqlstate/i.test(error.message)) {
    return error.message
  }
  return 'Unable to submit. Please try again.'
}

/**
 * Inserts a community submission through the shared browser Supabase client.
 * Uses SECURITY DEFINER RPC so visitors never need SELECT on the table and
 * cannot set status/admin fields. No service-role key is used.
 */
export async function submitCommunityPayload(
  payload: SubmissionPayload,
  options?: { website?: string; turnstileToken?: string },
) {
  if (!supabase) throw new Error('Community submissions are not configured yet.')

  const body = {
    submission_type: payload.submission_type,
    title: payload.title,
    title_amharic: payload.title_amharic,
    singer_name: payload.singer_name,
    youtube_url: payload.youtube_url,
    lyrics_amharic: payload.lyrics_amharic,
    lyrics_english: payload.lyrics_english,
    lyrics_oromo: payload.lyrics_oromo,
    transliteration: payload.transliteration,
    suggested_category: payload.suggested_category,
    suggested_tags: payload.suggested_tags,
    contributor_name: payload.contributor_name,
    contributor_email: payload.contributor_email,
    credit_requested: payload.credit_requested,
    source_notes: payload.source_notes,
    source_reference: payload.source_reference,
    related_content_id: payload.related_content_id || null,
    related_legacy_key: payload.related_legacy_key || null,
    related_content_title: payload.related_content_title || null,
    current_page_url: payload.current_page_url || null,
    correction_type: payload.correction_type,
    suggested_correction: payload.suggested_correction,
    explanation: payload.explanation,
    website: options?.website || '',
    // Reserved for future Turnstile verification; ignored by the RPC today.
    turnstile_token: options?.turnstileToken || '',
  }

  const { data, error } = await supabase.rpc('submit_community_submission', {
    payload: body,
  })

  if (error) throw new Error(submissionErrorMessage(error))

  const result = data as { reference?: string; error?: string } | null
  if (!result?.reference) {
    throw new Error(result?.error || 'Unable to submit. Please try again.')
  }
  return result.reference
}
