import { db } from './mezmurService'
import type { CommunitySubmission, SubmissionStatus, SubmissionType } from '../community/types'
export const submissionStatuses: SubmissionStatus[] = ['submitted','under_review','needs_changes','approved','rejected','duplicate','converted_to_content']
export const submissionTypes: SubmissionType[] = ['mezmur','correction','prayer','saint','feast','article','other']
export async function listSubmissions(search: string, status: string, type: string, page: number) {
 let query = db().from('community_submissions').select('*', { count: 'exact' })
 const text = search.replace(/[,().%_*\\]/g, ' ').trim()
 if (text) query = query.or(`title.ilike.%${text}%,title_amharic.ilike.%${text}%,public_reference.ilike.%${text}%,contributor_name.ilike.%${text}%`)
 if (submissionStatuses.includes(status as SubmissionStatus)) query = query.eq('status', status as SubmissionStatus)
 if (submissionTypes.includes(type as SubmissionType)) query = query.eq('submission_type', type as SubmissionType)
 const { data, error, count } = await query.order('created_at', { ascending: false }).order('id').range((page-1)*20,page*20-1)
 if (error) throw error
 return { rows: data, count: count || 0 }
}
export async function submissionCounts() {
 return Promise.all(submissionStatuses.slice(0,5).map(async status => {
  const { count, error } = await db().from('community_submissions').select('id', { count: 'exact', head: true }).eq('status', status)
  if (error) throw error
  return { status, count: count || 0 }
 }))
}
export async function getSubmission(id: string) {
 const { data,error } = await db().from('community_submissions').select('*').eq('id',id).single()
 if (error) throw error
 return data
}
export async function getDuplicates(id: string) {
 const { data,error } = await db().rpc('submission_duplicates', { submission_id:id })
 if (error) throw error
 return data
}
export async function reviewSubmission(item: CommunitySubmission, status: SubmissionStatus, notes: string) {
 const { data,error } = await db().rpc('review_submission',{ submission_id:item.id, new_status:status, notes, expected_updated_at:item.updated_at }).single()
 if (error) throw error
 return data
}
export async function convertSubmission(item: CommunitySubmission, includeCredit: boolean) {
 const { data,error } = await db().rpc('convert_submission',{ submission_id:item.id, expected_updated_at:item.updated_at, include_credit:includeCredit })
 if (error) throw error
 return data
}
export async function reviewAuthors() {
 const { data,error } = await db().rpc('cms_version_authors',{})
 if (error) throw error
 return data
}
