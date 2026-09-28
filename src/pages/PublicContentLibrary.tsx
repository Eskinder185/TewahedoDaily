import { useCallback } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import {
  listContent,
  type EditorialKind,
} from '../lib/cms/contentService'
import { useAsync } from '../lib/cms/useAsync'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import {
  Artwork,
  Notice,
  Pagination,
} from '../components/publicContent/PublicUi'
import { contentPath } from '../lib/cms/contentService'
import s from '../components/publicContent/PublicContent.module.css'

const LIBRARY_TITLES: Record<Exclude<EditorialKind, 'articles'>, string> = {
  saints: 'Saints',
  feasts: 'Feasts',
  prayers: 'Prayer library',
}

/** Public libraries for saints, feasts, and CMS prayers (not articles/teachings). */
export function PublicContentLibrary({
  kind,
}: {
  kind: Exclude<EditorialKind, 'articles'>
}) {
  const [params, setParams] = useSearchParams()
  const q = params.get('q') || ''
  const page = Math.max(1, Number(params.get('page')) || 1)
  const result = useAsync(
    useCallback(() => listContent(kind, q, 'published', page), [kind, q, page]),
  )
  const title = LIBRARY_TITLES[kind]
  usePageMeta(title, `Explore ${title.toLowerCase()} on Tewahedo Daily.`)
  return (
    <section className={s.shell}>
      <h1>{title}</h1>
      {kind === 'prayers' && (
        <Link to="/prayers">Traditional prayer collections</Link>
      )}
      <form
        className={s.filters}
        key={params.toString()}
        onSubmit={(e) => {
          e.preventDefault()
          const data = new FormData(e.currentTarget)
          setParams({
            q: String(data.get('q') || ''),
          })
        }}
      >
        <label>
          Search
          <input name="q" defaultValue={q} maxLength={200} />
        </label>
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
                <p>{item.description}</p>
              </article>
            ))}
          </div>
          {!result.data.items.length && (
            <p>No published content matches yet.</p>
          )}
          <Pagination
            page={page}
            total={result.data.total}
            change={(p) => setParams({ q, page: String(p) })}
          />
        </>
      )}
    </section>
  )
}
