import { supabase } from '../supabase/client'

export type FaqSourceReference = {
  book_title: string
  book_slug: string
  chapter_title?: string | null
  section_title?: string | null
  section_key?: string | null
  passage_key?: string | null
}

export type ChurchLibraryFaqMatch = {
  stableId: string
  question: string
  answer: string
  language: 'am' | 'en'
  topic: string
  sources: FaqSourceReference[]
  score: number
}

function normalizeSources(value: unknown): FaqSourceReference[] {
  if (!Array.isArray(value)) return []
  return value.flatMap((candidate) => {
    if (!candidate || typeof candidate !== 'object') return []
    const row = candidate as Record<string, unknown>
    if (typeof row.book_title !== 'string' || typeof row.book_slug !== 'string') return []
    return [{
      book_title: row.book_title,
      book_slug: row.book_slug,
      chapter_title: typeof row.chapter_title === 'string' ? row.chapter_title : null,
      section_title: typeof row.section_title === 'string' ? row.section_title : null,
      section_key: typeof row.section_key === 'string' ? row.section_key : null,
      passage_key: typeof row.passage_key === 'string' ? row.passage_key : null,
    }]
  })
}

export function faqSourceHref(source: FaqSourceReference) {
  const base = source.section_key
    ? `/library/read/${encodeURIComponent(source.book_slug)}/${encodeURIComponent(source.section_key)}`
    : `/library/read/${encodeURIComponent(source.book_slug)}`
  return source.passage_key ? `${base}#${encodeURIComponent(source.passage_key)}` : base
}

export async function searchChurchLibraryFaq(
  query: string,
  language: 'am' | 'en',
  contextStableId?: string | null,
): Promise<ChurchLibraryFaqMatch | null> {
  if (!supabase || query.trim().length < 2) return null
  const { data, error } = await supabase.rpc('search_church_library_faq' as never, {
    search_query: query.trim(), search_language: language, result_limit: 1,
    context_stable_id: contextStableId || null,
  } as never)
  if (error) {
    if (error.code === 'PGRST202' || error.code === '42883' || error.code === '42P01') return null
    throw error
  }
  const row = Array.isArray(data) ? data[0] as Record<string, unknown> | undefined : undefined
  if (!row || typeof row.stable_id !== 'string' || typeof row.answer !== 'string') return null
  const sources = normalizeSources(row.source_references)
  if (!sources.length) return null
  return {
    stableId: row.stable_id,
    question: typeof row.question === 'string' ? row.question : query,
    answer: row.answer,
    language: row.language === 'am' ? 'am' : 'en',
    topic: typeof row.topic === 'string' ? row.topic : '',
    sources,
    score: Number(row.score) || 0,
  }
}

export async function listPopularChurchLibraryFaqs(language: 'am' | 'en') {
  if (!supabase) return [] as Array<{ stableId: string; question: string }>
  const { data, error } = await supabase
    .from('church_library_faqs' as never)
    .select('stable_id,question_en,question_am' as never)
    .eq('publication_status' as never, 'published')
    .eq('review_status' as never, 'approved')
    .order('published_at' as never, { ascending: false })
    .limit(5)
  if (error || !Array.isArray(data)) return []
  return (data as unknown as Record<string, unknown>[]).flatMap((row) => {
    const stableId = typeof row.stable_id === 'string' ? row.stable_id : ''
    const question = language === 'am' ? row.question_am : row.question_en
    return stableId && typeof question === 'string' ? [{ stableId, question }] : []
  })
}
