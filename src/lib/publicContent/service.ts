import { supabase } from '../supabase/client'
import type { ContentType, CmsTables } from '../supabase/cms.types'
export const useLegacyMezmur =
  !supabase || import.meta.env.VITE_PUBLIC_MEZMUR_SOURCE === 'legacy'
export type PublicMezmur = CmsTables['mezmur']['Row'] & {
  singer_name: string | null
  category_name: string | null
  languages: string[]
  tags: { id: string; name: string; slug: string; kind: string }[]
}
export type MezmurCard = Pick<
  PublicMezmur,
  | 'id'
  | 'slug'
  | 'title'
  | 'title_amharic'
  | 'description'
  | 'thumbnail_url'
  | 'audio_url'
  | 'featured'
  | 'published_at'
  | 'singer_name'
  | 'category_name'
  | 'languages'
  | 'tags'
>
export type Discovery = { items: MezmurCard[]; total: number; page: number }
export type Facets = {
  singers: { id: string; name: string }[]
  categories: { id: string; name: string }[]
  occasions: { slug: string; name: string }[]
}
export type SearchResult = {
  kind: ContentType
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
}
export function database() {
  if (!supabase) throw new Error('The content service is not configured.')
  return supabase
}
export const pageNumber = (params: URLSearchParams) =>
  Math.min(10000, Math.max(1, Math.floor(Number(params.get('page'))) || 1))
export async function discover(params: URLSearchParams): Promise<Discovery> {
  const { data, error } = await database().rpc('discover_mezmur', {
    q: (params.get('q') || '').slice(0, 200),
    language: params.get('language') || '',
    singer: params.get('singer') || '',
    category: params.get('category') || '',
    occasion: params.get('occasion') || '',
    featured_only: params.get('featured') === 'yes',
    sort_by: params.get('sort') || 'recent',
    page_number: pageNumber(params),
  })
  if (error) throw error
  return data as unknown as Discovery
}
export async function facets(): Promise<Facets> {
  const { data, error } = await database().rpc('public_discovery_facets', {})
  if (error) throw error
  return data as unknown as Facets
}
export async function detail(slug: string): Promise<PublicMezmur | null> {
  const { data, error } = await database().rpc('public_mezmur_detail', {
    slug_or_alias: slug,
  })
  if (error) throw error
  return data as unknown as PublicMezmur | null
}
export async function searchSite(
  query: string,
  page = 1,
): Promise<{ items: SearchResult[]; total: number }> {
  const { data, error } = await database().rpc('search_public_content', {
    q: query.slice(0, 200),
    page_number: page,
  })
  if (error) throw error
  return data as unknown as { items: SearchResult[]; total: number }
}
export async function readContent(
  kind: Exclude<ContentType, 'mezmur'>,
  slug: string,
) {
  const { data, error } = await database()
    .from(kind)
    .select('*')
    .eq('slug', slug)
    .eq('status', 'published')
    .maybeSingle()
  if (error) throw error
  return data
}
export async function publicMedia(reference: string | null | undefined) {
  if (!reference) return ''
  if (reference.startsWith('storage://')) {
    const [bucket, ...path] = reference.slice(10).split('/')
    if (
      ![
        'mezmur-images',
        'mezmur-audio',
        'saints',
        'feasts',
        'articles',
        'general-media',
      ].includes(bucket)
    )
      throw new Error('Unsupported media.')
    const { data, error } = await database()
      .storage.from(bucket)
      .createSignedUrl(path.join('/'), 3600)
    if (error) throw error
    return data.signedUrl
  }
  const url = new URL(reference)
  if (url.protocol !== 'https:') throw new Error('Unsupported media URL.')
  return url.href
}
