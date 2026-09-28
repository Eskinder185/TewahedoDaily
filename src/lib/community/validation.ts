export const correctionTypes = ['incorrect_lyrics', 'missing_lyrics', 'translation_issue', 'wrong_singer', 'broken_youtube_link', 'wrong_category', 'spelling_issue', 'other'] as const
export const limits = { title: 200, title_amharic: 200, singer_name: 200, youtube_url: 500, lyrics_amharic: 20000, lyrics_english: 20000, lyrics_oromo: 20000, transliteration: 20000, suggested_category: 200, contributor_name: 100, contributor_email: 254, source_notes: 4000, source_reference: 1000, suggested_correction: 12000, explanation: 4000, current_page_url: 1000, related_content_id: 36, related_legacy_key: 250, related_content_title: 200 } as const
export function youtubeUrl(value: string) {
  if (!value) return ''
  let url: URL
  try { url = new URL(value) } catch { throw new Error('Enter a valid YouTube video URL.') }
  if (url.protocol !== 'https:' || url.username || url.password || url.port || !['youtube.com', 'www.youtube.com', 'm.youtube.com', 'music.youtube.com', 'youtu.be'].includes(url.hostname)) throw new Error('Use an HTTPS YouTube or youtu.be video link.')
  const id = url.hostname === 'youtu.be' ? url.pathname.slice(1) : url.pathname === '/watch' ? url.searchParams.get('v') : /^\/(shorts|embed)\/([^/]+)$/.exec(url.pathname)?.[2]
  if (!id || !/^[A-Za-z0-9_-]{11}$/.test(id)) throw new Error('Use a link to a specific YouTube video.')
  return `https://www.youtube.com/watch?v=${id}`
}
export function validateSubmission(raw: unknown) {
  if (!raw || typeof raw !== 'object' || Array.isArray(raw)) throw new Error('Invalid submission.')
  const value = raw as Record<string, unknown>
  const fields = {} as Record<keyof typeof limits, string>
  for (const [key, max] of Object.entries(limits)) {
    const field = value[key] ?? ''
    if (typeof field !== 'string' || field.length > max || [...field].some(char => char.charCodeAt(0) < 32 && !['\t', '\n', '\r'].includes(char))) throw new Error(`${key.replaceAll('_', ' ')} must be text no longer than ${max} characters.`)
    fields[key as keyof typeof limits] = field.trim()
  }
  if (value.submission_type !== 'mezmur' && value.submission_type !== 'correction') throw new Error('This form accepts Mezmur and correction submissions.')
  for (const key of ['title', 'contributor_name'] as const) if (fields[key].length < 2 || !/[\p{L}\p{N}]/u.test(fields[key])) throw new Error(`${key === 'title' ? 'Title' : 'Contributor name'} is required (at least two characters).`)
  if (fields.contributor_email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(fields.contributor_email)) throw new Error('Enter a valid email address, or leave it blank.')
  if (value.credit_requested !== undefined && typeof value.credit_requested !== 'boolean') throw new Error('Invalid credit preference.')
  fields.youtube_url = youtubeUrl(fields.youtube_url)
  const suggested_tags = value.suggested_tags ?? []
  if (!Array.isArray(suggested_tags) || suggested_tags.length > 20 || suggested_tags.some(tag => typeof tag !== 'string' || tag.length > 60)) throw new Error('Use up to 20 tags, each no longer than 60 characters.')
  if (/^[a-z][a-z0-9+.-]*:/i.test(fields.source_reference)) {
    try { const source = new URL(fields.source_reference); if (source.protocol !== 'https:' || source.username || source.password) throw new Error() } catch { throw new Error('Source links must use HTTPS. You can also enter a book or reference citation.') }
  }
  if (value.submission_type === 'mezmur' && !fields.youtube_url && (fields.lyrics_amharic + fields.lyrics_english + fields.lyrics_oromo).trim().length < 10) throw new Error('Add a YouTube video link or at least 10 characters of lyrics.')
  let correction_type: typeof correctionTypes[number] | null = null
  if (value.submission_type === 'correction') {
    if (!correctionTypes.includes(value.correction_type as typeof correctionTypes[number])) throw new Error('Choose a correction type.')
    correction_type = value.correction_type as typeof correctionTypes[number]
    if (fields.suggested_correction.length < 10) throw new Error('Describe the suggested correction in at least 10 characters.')
    if (fields.explanation.length < 5) throw new Error('Add a short explanation for the correction.')
    if (!fields.related_content_id && !fields.related_legacy_key) throw new Error('Open the correction form from a Mezmur page.')
  }
  return { ...fields, submission_type: value.submission_type as 'mezmur' | 'correction', suggested_tags: [...new Set(suggested_tags.map((tag: string) => tag.trim()).filter(Boolean))], credit_requested: value.credit_requested === true, correction_type }
}
export type SubmissionPayload = ReturnType<typeof validateSubmission>

