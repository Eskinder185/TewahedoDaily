import { useCallback } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { listContent, contentPath } from '../lib/cms/contentService'
import { useAsync } from '../lib/cms/useAsync'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import {
  Artwork,
  Notice,
  Pagination,
} from '../components/publicContent/PublicUi'
import s from '../components/publicContent/PublicContent.module.css'

const LIBRARY_TITLES: Record<'saints' | 'feasts', string> = {
  saints: 'Saints',
  feasts: 'Feasts',
}

/** Public libraries for saints and feasts. */
export function PublicContentLibrary({
  kind,
}: {
  kind: 'saints' | 'feasts'
}) {
  const [params, setParams] = useSearchParams()
  const q = params.get('q') || ''
  const page = Math.max(1, Number(params.get('page')) || 1)
  const result = useAsync(
    useCallback(() => listContent(kind, q, 'published', page), [kind, q, page]),
  )
  const title = LIBRARY_TITLES[kind]
  usePageMeta(title, `Explore ${title.toLowerCase()} on Tewahedo Daily.`)
  const empty = Boolean(result.data && !result.data.items.length)
  return (
    <section className={s.shell}>
      <h1>{title}</h1>
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
          {empty ? (
            <div className={s.emptyState}>
              <p>
                {q
                  ? `No published ${title.toLowerCase()} matched “${q}”.`
                  : `No published ${title.toLowerCase()} are listed here yet.`}
              </p>
              <p>
                Continue with{' '}
                <Link to="/calendar">Calendar</Link>
                {kind === 'saints' ? (
                  <>
                    {' '}
                    or browse{' '}
                    <Link to="/practice/browse/angels-saints">Angels &amp; Saints hymns</Link>
                  </>
                ) : (
                  <>
                    {' '}
                    or browse{' '}
                    <Link to="/practice/browse/holidays-feasts">Holidays &amp; Feasts hymns</Link>
                  </>
                )}
                , or open Search Buddy to find a feast or saint name.
              </p>
            </div>
          ) : null}
          {!empty ? (
            <Pagination
              page={page}
              total={result.data.total}
              change={(p) => setParams({ q, page: String(p) })}
            />
          ) : null}
        </>
      )}
    </section>
  )
}
