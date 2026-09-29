import { useCallback, type FormEvent } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { discover, facets, pageNumber } from '../lib/publicContent/service'
import { useAsync } from '../lib/cms/useAsync'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import {
  MezmurCards,
  Notice,
  Pagination,
} from '../components/publicContent/PublicUi'
import s from '../components/publicContent/PublicContent.module.css'

export function PublicMezmurLibrary() {
  const [params, setParams] = useSearchParams()
  const key = params.toString()
  const result = useAsync(
    useCallback(() => discover(new URLSearchParams(key)), [key]),
  )
  const options = useAsync(useCallback(() => facets(), []))
  usePageMeta(
    'Mezmur library',
    'Discover Ethiopian Orthodox Mezmur, lyrics, singers, and hymns for every occasion.',
  )

  function filter(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const values = new FormData(event.currentTarget)
    const next = new URLSearchParams()
    for (const [name, value] of values) if (value) next.set(name, String(value))
    setParams(next)
  }

  function resetFilters() {
    setParams(new URLSearchParams())
  }

  const empty = Boolean(result.data && !result.data.items.length && !result.error)

  return (
    <section className={s.shell}>
      <p className={s.eyebrow}>Listen · Learn · Pray</p>
      <h1>Mezmur library</h1>
      <p>Find hymns by language, singer, occasion, or a line you remember.</p>
      <div className={s.actions}>
        <Link to="/submit-mezmur">Contribute a Mezmur</Link>
        <Link to="/practice?form=werb">Werb</Link>
        <Link to="/saved">Your favorites</Link>
      </div>
      <form className={s.filters} key={key} onSubmit={filter}>
        <label>
          Search
          <input
            name="q"
            maxLength={200}
            defaultValue={params.get('q') || ''}
            placeholder="Title, lyrics, or transliteration"
          />
        </label>
        <label>
          Language
          <select
            aria-label="Mezmur language"
            name="language"
            defaultValue={params.get('language') || ''}
          >
            <option value="">All languages</option>
            <option value="am">Amharic</option>
            <option value="en">English</option>
            <option value="om">Oromo</option>
          </select>
        </label>
        <label>
          Singer
          <select
            aria-label="Singer"
            name="singer"
            defaultValue={params.get('singer') || ''}
          >
            <option value="">All singers</option>
            {options.data?.singers.map((x) => (
              <option key={x.id} value={x.id}>
                {x.name}
              </option>
            ))}
          </select>
        </label>
        <label>
          Category
          <select
            aria-label="Category"
            name="category"
            defaultValue={params.get('category') || ''}
          >
            <option value="">All categories</option>
            {options.data?.categories.map((x) => (
              <option key={x.id} value={x.id}>
                {x.name}
              </option>
            ))}
          </select>
        </label>
        <label>
          Occasion
          <select
            aria-label="Occasion"
            name="occasion"
            defaultValue={params.get('occasion') || ''}
          >
            <option value="">All occasions</option>
            {options.data?.occasions.map((x) => (
              <option key={x.slug} value={x.slug}>
                {x.name}
              </option>
            ))}
          </select>
        </label>
        <label>
          Show
          <select
            aria-label="Show"
            name="form"
            defaultValue={params.get('form') || ''}
          >
            <option value="">All Mezmur</option>
            <option value="mezmur">Mezmur</option>
            <option value="werb">Werb</option>
          </select>
        </label>
        <label>
          Featured
          <select
            aria-label="Featured"
            name="featured"
            defaultValue={params.get('featured') || ''}
          >
            <option value="">All</option>
            <option value="yes">Featured only</option>
          </select>
        </label>
        <label>
          Sort
          <select
            aria-label="Sort"
            name="sort"
            defaultValue={params.get('sort') || 'recent'}
          >
            <option value="recent">Recently added</option>
            <option value="alphabetical">Title A–Z</option>
            <option value="published">Recently published</option>
          </select>
        </label>
        <button type="submit">Apply filters</button>
      </form>
      <Notice {...options} retry={options.reload} />
      <Notice {...result} retry={result.reload} />
      {result.data && (
        <>
          <p>
            {result.data.total} hymn{result.data.total === 1 ? '' : 's'} found
          </p>
          <MezmurCards items={result.data.items} />
          {empty && (
            <div className={s.empty}>
              <p>No mezmur matched your filters.</p>
              <div className={s.actions}>
                <button type="button" onClick={resetFilters}>
                  Reset filters
                </button>
                <Link to="/submit-mezmur">Contribute a Mezmur</Link>
              </div>
            </div>
          )}
          <Pagination
            page={pageNumber(params)}
            total={result.data.total}
            change={(page) => {
              const next = new URLSearchParams(params)
              next.set('page', String(page))
              setParams(next)
            }}
          />
        </>
      )}
    </section>
  )
}
