import { useCallback, useMemo } from 'react'
import { Link, Navigate, useParams } from 'react-router-dom'
import { readContent } from '../lib/publicContent/service'
import type { ContentType } from '../lib/supabase/cms.types'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useAsync } from '../lib/cms/useAsync'
import {
  emptyContent,
  normalizeRelatedList,
  type EditorialContent,
  type EditorialKind,
} from '../lib/cms/contentService'
import { Notice } from '../components/publicContent/PublicUi'
import { ContentBody } from '../components/publicContent/ContentBody'
import { EncyclopediaTopic } from '../components/publicContent/EncyclopediaTopic'
import { EmptyState } from '../components/ui/EmptyState'
import s from '../components/publicContent/PublicContent.module.css'

const PUBLIC_KINDS = ['saints', 'feasts', 'articles'] as const

function libraryPath(kind: string) {
  if (kind === 'saints') return '/saints'
  if (kind === 'feasts') return '/feasts'
  if (kind === 'articles') return '/learn'
  return '/'
}

function libraryLabel(kind: string) {
  if (kind === 'saints') return 'Saints'
  if (kind === 'feasts') return 'Feasts'
  if (kind === 'articles') return 'Learn'
  return 'Home'
}

function toEditorial(
  kind: EditorialKind,
  row: Record<string, unknown>,
): EditorialContent {
  return {
    ...emptyContent(),
    ...row,
    id: String(row.id || ''),
    slug: String(row.slug || ''),
    title: String(row.title || ''),
    title_amharic: (row.title_amharic as string | null) ?? '',
    title_oromo: (row.title_oromo as string | null) ?? '',
    description: (row.description as string | null) ?? '',
    body: (row.body as string | null) ?? '',
    body_amharic: (row.body_amharic as string | null) ?? '',
    body_oromo: (row.body_oromo as string | null) ?? '',
    thumbnail_url: (row.thumbnail_url as string | null) ?? '',
    image_path: (row.image_path as string | null) ?? '',
    image_alt: (row.image_alt as string | null) ?? '',
    audio_url: (row.audio_url as string | null) ?? '',
    date_notes: (row.date_notes as string | null) ?? '',
    related_content: normalizeRelatedList(row.related_content),
    status: (row.status as EditorialContent['status']) || 'published',
    created_by: (row.created_by as string | null) ?? null,
    updated_at: String(row.updated_at || ''),
    published_at: (row.published_at as string | null) ?? null,
    teaching_category: (row.teaching_category as string | null) ?? null,
    fasting_info: (row.fasting_info as string | null) ?? null,
    is_movable: Boolean(row.is_movable),
    ethiopian_month: (row.ethiopian_month as number | null) ?? null,
    ethiopian_day: (row.ethiopian_day as number | null) ?? null,
    commemoration_month: (row.commemoration_month as number | null) ?? null,
    commemoration_day: (row.commemoration_day as number | null) ?? null,
    transliteration: (row.transliteration as string | null) ?? '',
  }
  void kind
}

/** Public detail for saints, feasts, and encyclopedia articles. */
export function PublicContentDetail() {
  const { kind, slug } = useParams()
  const valid = PUBLIC_KINDS.includes(kind as (typeof PUBLIC_KINDS)[number])
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

  const editorial = useMemo(() => {
    if (!result.data || !kind || !valid) return null
    return toEditorial(kind as EditorialKind, result.data as Record<string, unknown>)
  }, [result.data, kind, valid])

  if (!valid) return <Navigate to="/" replace />

  const kindKey = kind || ''
  const notFound = !result.loading && !result.error && !result.data

  return (
    <article className={s.shell}>
      <Link to={libraryPath(kindKey)}>← Back to {libraryLabel(kindKey)}</Link>
      <Notice {...result} retry={result.reload} />
      {notFound ? (
        <EmptyState title="Content not found" headingLevel="h1">
          <p>
            This{' '}
            {kindKey === 'saints'
              ? 'saint'
              : kindKey === 'feasts'
                ? 'feast'
                : kindKey === 'articles'
                  ? 'teaching'
                  : 'page'}{' '}
            is not published, or the link may be outdated.
          </p>
          <p>
            Continue with the{' '}
            <Link to={libraryPath(kindKey)}>{libraryLabel(kindKey)}</Link> library, open the{' '}
            <Link to="/calendar">Calendar</Link>
            {kindKey === 'saints' ? (
              <>
                , or browse{' '}
                <Link to="/practice/browse/angels-saints">Angels &amp; Saints hymns</Link>
              </>
            ) : kindKey === 'feasts' ? (
              <>
                , or browse{' '}
                <Link to="/practice/browse/holidays-feasts">Holidays &amp; Feasts hymns</Link>
              </>
            ) : (
              <>
                , or open <Link to="/learn">Learn</Link>
              </>
            )}
            .
          </p>
        </EmptyState>
      ) : null}
      {editorial && kindKey === 'articles' ? (
        <EncyclopediaTopic key={editorial.id || slug} item={editorial} kind="articles" />
      ) : null}
      {editorial && kindKey !== 'articles' ? (
        <ContentBody
          key={editorial.id || slug}
          kind={kindKey as EditorialKind}
          item={editorial}
        />
      ) : null}
    </article>
  )
}
