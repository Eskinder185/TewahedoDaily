import { db, errorMessage, slugify } from './mezmurService'

export type HomepageSlide = {
  id: string
  slug: string
  eyebrow: string | null
  title: string
  title_amharic: string | null
  subtitle: string | null
  subtitle_amharic: string | null
  image_path: string | null
  image_alt: string | null
  primary_button_label: string | null
  primary_button_url: string | null
  secondary_button_label: string | null
  secondary_button_url: string | null
  sort_order: number
  animation_style: 'fade' | 'crossfade' | 'slide'
  display_duration: number
  active: boolean
  created_at: string
  updated_at: string
}

export type HomepageSlideInput = Omit<
  HomepageSlide,
  'id' | 'created_at' | 'updated_at'
>

export function emptyHomepageSlide(sortOrder = 0): HomepageSlideInput {
  return {
    slug: '',
    eyebrow: '',
    title: '',
    title_amharic: '',
    subtitle: '',
    subtitle_amharic: '',
    image_path: '',
    image_alt: '',
    primary_button_label: 'Explore hymns',
    primary_button_url: '/practice',
    secondary_button_label: 'Today in Church',
    secondary_button_url: '/today',
    sort_order: sortOrder,
    animation_style: 'fade',
    display_duration: 7000,
    active: true,
  }
}

export async function listHomepageSlides(includeInactive = true) {
  let query = db()
    .from('homepage_slides' as never)
    .select('*')
    .order('sort_order', { ascending: true })
    .order('created_at', { ascending: true })

  if (!includeInactive) {
    query = query.eq('active', true)
  }

  const { data, error } = await query
  if (error) throw error
  return (data || []) as unknown as HomepageSlide[]
}

export async function getHomepageSlide(id: string) {
  const { data, error } = await db()
    .from('homepage_slides' as never)
    .select('*')
    .eq('id', id)
    .single()
  if (error) throw error
  return data as unknown as HomepageSlide
}

export async function saveHomepageSlide(
  input: HomepageSlideInput,
  existing?: HomepageSlide | null,
) {
  const slug = (input.slug || slugify(input.title)).trim()
  const payload = {
    ...input,
    slug,
    eyebrow: input.eyebrow || null,
    title_amharic: input.title_amharic || null,
    subtitle: input.subtitle || null,
    subtitle_amharic: input.subtitle_amharic || null,
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    primary_button_label: input.primary_button_label || null,
    primary_button_url: input.primary_button_url || null,
    secondary_button_label: input.secondary_button_label || null,
    secondary_button_url: input.secondary_button_url || null,
    updated_at: new Date().toISOString(),
  }

  if (existing) {
    const { data, error } = await db()
      .from('homepage_slides' as never)
      .update(payload as never)
      .eq('id', existing.id)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as HomepageSlide
  }

  const { data, error } = await db()
    .from('homepage_slides' as never)
    .insert(payload as never)
    .select('*')
    .single()
  if (error) throw error
  return data as unknown as HomepageSlide
}

export async function deleteHomepageSlide(id: string) {
  const { error } = await db()
    .from('homepage_slides' as never)
    .delete()
    .eq('id', id)
  if (error) throw error
}

export async function reorderHomepageSlides(orderedIds: string[]) {
  const updates = orderedIds.map((id, index) =>
    db()
      .from('homepage_slides' as never)
      .update({ sort_order: index, updated_at: new Date().toISOString() } as never)
      .eq('id', id),
  )
  const results = await Promise.all(updates)
  const failed = results.find((r) => r.error)
  if (failed?.error) throw failed.error
}

export { errorMessage }
