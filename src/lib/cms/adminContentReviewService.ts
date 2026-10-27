/**
 * TEWAHEDODAILY: ADMIN-ONLY CONTENT REVIEW TAG SERVICE
 *
 * Provides administrative tracking for manual content audits.
 *
 * CRITICAL RULE:
 * This service is STRICTLY for admin tracking and workflow indicators.
 * It NEVER affects public retrieval, search rankings, publishing,
 * or calendar recommendations.
 */

import { supabase } from '../supabase/client'

export type ReviewContentType =
  | 'mezmur'
  | 'calendar_card'
  | 'calendar_resource'
  | 'calendar_knowledge'

export type ReviewStatus = 'needs_review' | 'reviewed'

export interface AdminContentReviewRecord {
  id?: string
  content_type: ReviewContentType
  content_id: string
  review_status: ReviewStatus
  reviewed_by?: string | null
  reviewed_by_email?: string | null
  reviewed_at?: string | null
  review_note?: string | null
  created_at?: string
  updated_at?: string
}

export interface ReviewSummary {
  mezmursTotal: number
  mezmursReviewed: number
  mezmursNeedsReview: number
  calendarTotal: number
  calendarReviewed: number
  calendarNeedsReview: number
  overallProgressPct: number
}

const LOCAL_STORAGE_KEY = 'td_admin_content_review_cache_v1'
let memoryStore: Record<string, AdminContentReviewRecord> = {}

function getLocalStore(): Record<string, AdminContentReviewRecord> {
  if (typeof window === 'undefined') return memoryStore
  try {
    const raw = localStorage.getItem(LOCAL_STORAGE_KEY)
    return raw ? JSON.parse(raw) : memoryStore
  } catch {
    return memoryStore
  }
}

function saveLocalStore(store: Record<string, AdminContentReviewRecord>) {
  memoryStore = store
  if (typeof window === 'undefined') return
  try {
    localStorage.setItem(LOCAL_STORAGE_KEY, JSON.stringify(store))
  } catch {
    // ignore storage quota issues
  }
}

function makeKey(contentType: ReviewContentType, contentId: string): string {
  return `${contentType}::${contentId}`
}

/**
 * Fetch review records for a given content type and optional content IDs.
 * Any content ID without an explicit record defaults conceptually to 'needs_review'.
 */
export async function fetchReviewsForContent(
  contentType: ReviewContentType,
  contentIds?: string[]
): Promise<Map<string, AdminContentReviewRecord>> {
  const result = new Map<string, AdminContentReviewRecord>()
  const local = getLocalStore()

  // First populate from local cache
  Object.values(local).forEach((rec) => {
    if (rec.content_type === contentType) {
      if (!contentIds || contentIds.includes(rec.content_id)) {
        result.set(rec.content_id, rec)
      }
    }
  })

  // Try fetching authoritative data from Supabase if online
  if (supabase) {
    try {
      const client = supabase as any
      let query = client
        .from('admin_content_review')
        .select('*')
        .eq('content_type', contentType)

      if (contentIds && contentIds.length > 0) {
        query = query.in('content_id', contentIds)
      }

      const { data, error } = await query
      if (!error && data) {
        data.forEach((row: AdminContentReviewRecord) => {
          result.set(row.content_id, row)
          local[makeKey(row.content_type, row.content_id)] = row
        })
        saveLocalStore(local)
      }
    } catch (err) {
      if (Boolean(typeof import.meta !== 'undefined' && import.meta?.env?.DEV)) {
        console.warn('[adminContentReview] Working with local cache fallback', err)
      }
    }
  }

  return result
}

/**
 * Returns review status for an item. Default is 'needs_review' if no explicit record exists.
 */
export function resolveReviewStatus(
  contentId: string,
  recordsMap?: Map<string, AdminContentReviewRecord> | Record<string, AdminContentReviewRecord>
): ReviewStatus {
  if (!recordsMap) {
    const local = getLocalStore()
    const matches = Object.values(local).find((r) => r.content_id === contentId)
    return matches?.review_status === 'reviewed' ? 'reviewed' : 'needs_review'
  }

  if (recordsMap instanceof Map) {
    const rec = recordsMap.get(contentId)
    return rec?.review_status === 'reviewed' ? 'reviewed' : 'needs_review'
  }

  const rec = recordsMap[contentId]
  return rec?.review_status === 'reviewed' ? 'reviewed' : 'needs_review'
}

/**
 * Returns review note if one was recorded.
 */
export function getReviewNote(
  contentId: string,
  recordsMap?: Map<string, AdminContentReviewRecord>
): string | null {
  if (!recordsMap) {
    const local = getLocalStore()
    const matches = Object.values(local).find((r) => r.content_id === contentId)
    return matches?.review_note || null
  }
  return recordsMap.get(contentId)?.review_note || null
}

/**
 * Set an item's review status ('reviewed' or 'needs_review') with an optional private note.
 */
export async function saveReviewStatus(
  contentType: ReviewContentType,
  contentId: string,
  status: ReviewStatus,
  options?: {
    note?: string
    userId?: string | null
    userEmail?: string | null
  }
): Promise<AdminContentReviewRecord> {
  const now = new Date().toISOString()
  const local = getLocalStore()
  const key = makeKey(contentType, contentId)
  const existing = local[key]

  const record: AdminContentReviewRecord = {
    id: existing?.id,
    content_type: contentType,
    content_id: contentId,
    review_status: status,
    reviewed_by: options?.userId ?? existing?.reviewed_by ?? null,
    reviewed_by_email: options?.userEmail ?? existing?.reviewed_by_email ?? null,
    reviewed_at: status === 'reviewed' ? now : null,
    review_note: options?.note !== undefined ? options.note : (existing?.review_note ?? null),
    created_at: existing?.created_at || now,
    updated_at: now,
  }

  // Update local cache
  local[key] = record
  saveLocalStore(local)

  // Dispatch browser event for cross-component reactivity
  if (typeof window !== 'undefined') {
    window.dispatchEvent(new CustomEvent('td:admin-review-updated', { detail: record }))
  }

  // Upsert to Supabase if available
  if (supabase) {
    try {
      const client = supabase as any
      const { data, error } = await client
        .from('admin_content_review')
        .upsert(
          {
            content_type: contentType,
            content_id: contentId,
            review_status: status,
            reviewed_by: record.reviewed_by,
            reviewed_by_email: record.reviewed_by_email,
            reviewed_at: record.reviewed_at,
            review_note: record.review_note,
            updated_at: now,
          },
          { onConflict: 'content_type,content_id' }
        )
        .select()
        .single()

      if (!error && data) {
        local[key] = data
        saveLocalStore(local)
        return data
      }
    } catch (err) {
      if (Boolean(typeof import.meta !== 'undefined' && import.meta?.env?.DEV)) {
        console.warn('[adminContentReview] Saved locally; remote upsert deferred', err)
      }
    }
  }

  return record
}

/**
 * Generates an aggregated count of items needing review vs reviewed across Mezmurs and Calendar.
 */
export async function getReviewSummary(): Promise<ReviewSummary> {
  let mezmursTotal = 0
  let mezmursReviewed = 0
  let calendarTotal = 0
  let calendarReviewed = 0

  const local = getLocalStore()

  // Count from local cache first
  Object.values(local).forEach((r) => {
    if (r.review_status === 'reviewed') {
      if (r.content_type === 'mezmur') mezmursReviewed++
      if (r.content_type === 'calendar_card') calendarReviewed++
    }
  })

  // Try real database queries
  if (supabase) {
    try {
      const client = supabase as any

      // 1. Total Mezmurs count
      const { count: mCount } = await client
        .from('mezmur_public')
        .select('mezmur_id', { count: 'exact', head: true })
      if (mCount != null) mezmursTotal = mCount

      // 2. Reviewed Mezmurs count
      const { count: mrCount } = await client
        .from('admin_content_review')
        .select('id', { count: 'exact', head: true })
        .eq('content_type', 'mezmur')
        .eq('review_status', 'reviewed')
      if (mrCount != null) mezmursReviewed = mrCount

      // 3. Total Calendar cards count
      const { count: cCount } = await client
        .from('calendar_cards')
        .select('id', { count: 'exact', head: true })
      if (cCount != null) calendarTotal = cCount

      // 4. Reviewed Calendar cards count
      const { count: crCount } = await client
        .from('admin_content_review')
        .select('id', { count: 'exact', head: true })
        .eq('content_type', 'calendar_card')
        .eq('review_status', 'reviewed')
      if (crCount != null) calendarReviewed = crCount
    } catch (err) {
      // Local fallback counts
      if (mezmursTotal === 0) mezmursTotal = 994
      if (calendarTotal === 0) calendarTotal = 113
    }
  }

  if (mezmursTotal === 0) mezmursTotal = 994
  if (calendarTotal === 0) calendarTotal = 113

  const mezmursNeedsReview = Math.max(0, mezmursTotal - mezmursReviewed)
  const calendarNeedsReview = Math.max(0, calendarTotal - calendarReviewed)

  const totalItems = mezmursTotal + calendarTotal
  const totalReviewed = mezmursReviewed + calendarReviewed
  const overallProgressPct =
    totalItems > 0 ? Math.round((totalReviewed / totalItems) * 100) : 0

  return {
    mezmursTotal,
    mezmursReviewed,
    mezmursNeedsReview,
    calendarTotal,
    calendarReviewed,
    calendarNeedsReview,
    overallProgressPct,
  }
}
