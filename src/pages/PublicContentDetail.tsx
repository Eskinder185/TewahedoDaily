import { useCallback } from 'react'
import { Link, Navigate, useParams } from 'react-router-dom'
import { readContent } from '../lib/publicContent/service'
import type { ContentType } from '../lib/supabase/cms.types'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useAsync } from '../lib/cms/useAsync'
import { Notice } from '../components/publicContent/PublicUi'
import { ContentBody } from '../components/publicContent/ContentBody'
import type { EditorialContent, EditorialKind } from '../lib/cms/contentService'
import s from '../components/publicContent/PublicContent.module.css'

const PUBLIC_KINDS = ['saints', 'prayers', 'feasts'] as const

function libraryPath(kind: string) {
  if (kind === 'saints') return '/saints'
  if (kind === 'feasts') return '/feasts'
  if (kind === 'prayers') return '/prayer-library'
  return '/'
}

/** Public detail for saints, feasts, and prayer-library entries (not articles). */
export function PublicContentDetail() {
  const { kind, slug } = useParams()
  const isArticle = kind === 'articles'
  const valid =
    !isArticle && PUBLIC_KINDS.includes(kind as (typeof PUBLIC_KINDS)[number])
  const result = useAsync(
    useCallback(
      () =>
        valid
          ? readContent(kind as Exclude<ContentType, 'mezmur'>, slug || '')
          : Promise.resolve(null),
      [kind, slug, valid],
    ),
  )
  usePageMeta(
    result.data?.title || 'Content',
    result.data?.description?.slice(0, 180) ||
      'Published content from Tewahedo Daily.',
  )

  if (isArticle) return <Navigate to="/" replace />

  return (
    <article className={s.shell}>
      <Link to={libraryPath(kind || '')}>← Back</Link>
      <Notice {...result} retry={result.reload} />
      {!result.loading && !result.error && !result.data && (
        <h1>Content not found</h1>
      )}
      {result.data && (
        <ContentBody
          key={result.data.id || slug}
          kind={kind as EditorialKind}
          item={result.data as unknown as EditorialContent}
        />
      )}
    </article>
  )
}
