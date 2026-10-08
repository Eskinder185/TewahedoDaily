import { useCallback } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { listContent, contentPath, teachingCategories } from '../lib/cms/contentService'
import type { EditorialKind } from '../lib/cms/contentService'
import { useAsync } from '../lib/cms/useAsync'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import {
  Artwork,
  Notice,
  Pagination,
} from '../components/publicContent/PublicUi'
import { EmptyState } from '../components/ui/EmptyState'
import s from '../components/publicContent/PublicContent.module.css'

const LIBRARY_META: Record<
  EditorialKind,
  { title: string; description: string }
> = {
  saints: {
    title: 'Saints',
    description: 'Explore published saint commemorations on Tewahedo Daily.',
  },
  feasts: {
    title: 'Feasts',
    description: 'Explore published feast days on Tewahedo Daily.',
  },
  articles: {
    title: 'Learn',
    description:
      'Published teachings and encyclopedia topics from Tewahedo Daily editors.',
  },
}

/** Public libraries for saints, feasts, and encyclopedia articles. */
export function PublicContentLibrary({ kind }: { kind: EditorialKind }) {
  const [params, setParams] = useSearchParams()
  const q = params.get('q') || ''
  const category = params.get('category') || ''
  const page = Math.max(1, Number(params.get('page')) || 1)
  const result = useAsync(
    useCallback(
      () => listContent(kind, q, 'published', page, category),
      [kind, q, page, category],
    ),
  )
  const meta = LIBRARY_META[kind]
  usePageMeta(meta.title, meta.description)
  const empty = Boolean(result.data && !result.data.items.length)
  return (
    <section className={s.shell}>
      <h1>{meta.title}</h1>
      {kind === 'articles' ? (
        <p>
          Approved teachings only. Topics appear here after editors publish them — nothing is
          invented for empty categories.
        </p>
      ) : null}
      <form
        className={s.filters}
        key={params.toString()}
        onSubmit={(e) => {
          e.preventDefault()
          const data = new FormData(e.currentTarget)
          const next: Record<string, string> = {
            q: String(data.get('q') || ''),
          }
          if (kind === 'articles') {
            const cat = String(data.get('category') || '')
            if (cat) next.category = cat
          }
          setParams(next)
        }}
      >
        <label>
          Search
          <input name="q" defaultValue={q} maxLength={200} />
        </label>
        {kind === 'articles' ? (
          <label>
            Topic
            <select name="category" defaultValue={category}>
              <option value="">All topics</option>
              {teachingCategories.map((item) => (
                <option key={item} value={item}>
                  {item}
                </option>
              ))}
            </select>
          </label>
        ) : null}
        <button>Search</button>
      </form>
      <Notice {...result} retry={result.reload} />
      {result.data && (
        <>
          <div className={s.grid}>
            {result.data.items.map((item) => (
              <article key={item.id} className={s.card}>
                <Link to={contentPath(kind, item.slug)}>
                  <Artwork reference={item.thumbnail_url} />
                  <h2>{item.title}</h2>
                </Link>
                <p lang="am">{item.title_amharic}</p>
                {kind === 'articles' && item.teaching_category ? (
                  <p>{item.teaching_category}</p>
                ) : (
                  <p>{item.description}</p>
                )}
              </article>
            ))}
          </div>
          {empty ? (
            <EmptyState
              title={
                q || category
                  ? `No published ${meta.title.toLowerCase()} matched your filters.`
                  : `No published ${meta.title.toLowerCase()} are listed here yet.`
              }
            >
              <p>
                Continue with <Link to="/calendar">Calendar</Link>
                {kind === 'saints' ? (
                  <>
                    {' '}
                    or browse{' '}
                    <Link to="/practice/browse/angels-saints">Angels &amp; Saints hymns</Link>
                  </>
                ) : kind === 'feasts' ? (
                  <>
                    {' '}
                    or browse{' '}
                    <Link to="/practice/browse/holidays-feasts">Holidays &amp; Feasts hymns</Link>
                  </>
                ) : (
                  <>
                    , <Link to="/saints">Saints</Link>, or <Link to="/bible">Bible</Link>
                  </>
                )}
                , or open Search Buddy.
              </p>
            </EmptyState>
          ) : null}
          {!empty ? (
            <Pagination
              page={page}
              total={result.data.total}
              change={(p) =>
                setParams({
                  q,
                  ...(category ? { category } : {}),
                  page: String(p),
                })
              }
            />
          ) : null}
        </>
      )}
    </section>
  )
}
