export type VisibilitySourceRow = {
  import_id: string
  mezmur_id?: string | null
  slug: string
  title?: string | null
  status?: string | null
  deleted_at?: string | null
}

export type VisibilityPublicRow = {
  mezmur_id?: string | null
  slug: string
  title?: string | null
  status?: string | null
}

export type VisibilityResult = {
  visible: boolean
  reason: string | null
}

function value(value: unknown) {
  return String(value ?? '').trim()
}

function normalizedSlug(valueToNormalize: unknown) {
  return value(valueToNormalize).toLowerCase()
}

/**
 * Match one imported record to the public projection without treating a
 * nullable legacy mezmur_id as the record's identity. Slug fallback is only
 * accepted when it is unique in both the published source rows and the public
 * projection, so duplicate slugs can never make the wrong record look public.
 */
export function resolveMezmurPublicVisibility(
  source: VisibilitySourceRow,
  publishedSources: VisibilitySourceRow[],
  publicRows: VisibilityPublicRow[],
): VisibilityResult {
  if (value(source.status).toLowerCase() !== 'published' || value(source.deleted_at)) {
    return { visible: false, reason: 'source row is not an active published record' }
  }

  const slug = normalizedSlug(source.slug)
  if (!slug || !value(source.title)) {
    return { visible: false, reason: 'public projection requires a nonempty title and slug' }
  }

  const id = value(source.mezmur_id)
  const idMatches = id
    ? publicRows.filter((row) => value(row.mezmur_id) === id)
    : []
  if (idMatches.length === 1) return { visible: true, reason: null }
  if (idMatches.length > 1) {
    return { visible: false, reason: 'multiple public rows share the same mezmur_id' }
  }

  if (id) return { visible: false, reason: 'published row is absent from mezmur_public' }

  const sourceSlugCount = publishedSources.filter(
    (row) => normalizedSlug(row.slug) === slug,
  ).length
  const publicSlugMatches = publicRows.filter(
    (row) => normalizedSlug(row.slug) === slug,
  )
  if (sourceSlugCount > 1 || publicSlugMatches.length > 1) {
    return { visible: false, reason: 'duplicate normalized slug makes public identity ambiguous' }
  }
  if (sourceSlugCount === 1 && publicSlugMatches.length === 1) {
    return { visible: true, reason: null }
  }
  return { visible: false, reason: 'published row is absent from mezmur_public' }
}
