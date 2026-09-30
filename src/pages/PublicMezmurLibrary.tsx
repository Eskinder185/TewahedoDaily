import { useCallback, useEffect, useId, useMemo, useRef, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import {
  discover,
  facets,
  pageNumber,
  PAGE_SIZE,
  type Facets,
  type MezmurCard,
} from '../lib/publicContent/service'
import { suggestMezmurTitles, loadMezmurSearchCatalog } from '../lib/publicContent/mezmurSearch'
import { classificationLabel, hymnCardMeta } from '../lib/publicContent/labels'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { publicMedia } from '../lib/publicContent/service'
import s from './HymnPractice.module.css'

function useDebounced(value: string, ms = 200) {
  const [debounced, setDebounced] = useState(value)
  useEffect(() => {
    const id = window.setTimeout(() => setDebounced(value), ms)
    return () => window.clearTimeout(id)
  }, [value, ms])
  return debounced
}

function CardArt({ item }: { item: MezmurCard }) {
  const [src, setSrc] = useState<string>('')
  const [failed, setFailed] = useState(false)
  useEffect(() => {
    let active = true
    setFailed(false)
    const videoId = parseYoutubeVideoId(item.youtube_url || '')
    const yt = videoId ? youtubeThumbnailUrl(videoId) || '' : ''
    void publicMedia(item.thumbnail_url)
      .then((url) => {
        if (active) setSrc(url || yt)
      })
      .catch(() => {
        if (active) setSrc(yt)
      })
    return () => {
      active = false
    }
  }, [item.thumbnail_url, item.youtube_url])

  if (!src || failed) {
    return (
      <div className={s.art} aria-hidden>
        ✣
      </div>
    )
  }

  return (
    <img
      className={s.art}
      src={src}
      alt=""
      loading="lazy"
      decoding="async"
      onError={() => setFailed(true)}
    />
  )
}

export function PublicMezmurLibrary() {
  const [params, setParams] = useSearchParams()
  const [draftQ, setDraftQ] = useState(params.get('q') || '')
  const debouncedQ = useDebounced(draftQ, 200)
  const [filtersOpen, setFiltersOpen] = useState(false)
  const [facetData, setFacetData] = useState<Facets | null>(null)
  const [result, setResult] = useState<{
    items: MezmurCard[]
    total: number
    page: number
    hasStrongMatch?: boolean
    closest?: MezmurCard[]
  } | null>(null)
  const [suggestions, setSuggestions] = useState<MezmurCard[]>([])
  const [suggestOpen, setSuggestOpen] = useState(false)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const searchWrapRef = useRef<HTMLDivElement>(null)
  const listboxId = useId()

  usePageMeta(
    'Hymn Practice',
    'Practice Ethiopian Orthodox mezmur, werb, and hymns with lyrics, transliteration, and audio/video.',
  )

  useEffect(() => {
    const current = params.get('q') || ''
    if (debouncedQ === current) return
    const next = new URLSearchParams(params)
    if (debouncedQ) next.set('q', debouncedQ)
    else next.delete('q')
    next.delete('page')
    setParams(next, { replace: true })
  }, [debouncedQ, params, setParams])

  useEffect(() => {
    void loadMezmurSearchCatalog().catch((cause) => {
      if (import.meta.env.DEV) console.error('[hymn practice] catalog prefetch', cause)
    })
  }, [])

  useEffect(() => {
    let active = true
    void facets()
      .then((data) => {
        if (active) setFacetData(data)
      })
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[hymn practice] facets', cause)
      })
    return () => {
      active = false
    }
  }, [])

  const language = params.get('language') || ''
  const form = params.get('form') || ''
  const occasion = params.get('occasion') || ''
  const category = params.get('category') || ''
  const sort = params.get('sort') || 'recent'
  const page = pageNumber(params)

  useEffect(() => {
    let active = true
    const needle = draftQ.trim()
    if (needle.length < 2) {
      queueMicrotask(() => {
        if (active) setSuggestions([])
      })
      return () => {
        active = false
      }
    }
    const timeout = window.setTimeout(() => {
      void suggestMezmurTitles(
        needle,
        { language, form, category, occasion },
        6,
      )
        .then((rows) => {
          if (active) setSuggestions(rows)
        })
        .catch((cause) => {
          if (import.meta.env.DEV) console.error('[hymn practice] suggest', cause)
          if (active) setSuggestions([])
        })
    }, 180)
    return () => {
      active = false
      window.clearTimeout(timeout)
    }
  }, [draftQ, language, form, category, occasion])

  useEffect(() => {
    const onPointer = (event: MouseEvent) => {
      if (!searchWrapRef.current?.contains(event.target as Node)) {
        setSuggestOpen(false)
      }
    }
    document.addEventListener('mousedown', onPointer)
    return () => document.removeEventListener('mousedown', onPointer)
  }, [])

  const queryKey = params.toString()
  useEffect(() => {
    let active = true
    setLoading(true)
    setError(undefined)
    void discover(new URLSearchParams(queryKey))
      .then((data) => {
        if (active) {
          setResult(data)
          setLoading(false)
        }
      })
      .catch((cause) => {
        if (active) {
          const message =
            cause && typeof cause === 'object' && 'message' in cause
              ? String((cause as { message?: unknown }).message)
              : "We couldn't load the hymn library."
          if (import.meta.env.DEV) console.error('[hymn practice] discover', cause)
          setError(import.meta.env.DEV ? message : "We couldn't load the hymn library.")
          setResult(null)
          setLoading(false)
        }
      })
    return () => {
      active = false
    }
  }, [queryKey, reloadTick])

  const setFilter = useCallback(
    (key: string, value: string) => {
      const next = new URLSearchParams(params)
      if (value) next.set(key, value)
      else next.delete(key)
      if (key !== 'page') next.delete('page')
      setParams(next)
    },
    [params, setParams],
  )

  const clearAll = useCallback(() => {
    setDraftQ('')
    setSuggestions([])
    setParams(new URLSearchParams())
  }, [setParams])

  const applySuggestion = (item: MezmurCard) => {
    setDraftQ(item.title)
    setSuggestOpen(false)
    const next = new URLSearchParams(params)
    next.set('q', item.title)
    next.delete('page')
    setParams(next)
  }

  const chips = useMemo(() => {
    const list: { key: string; label: string }[] = []
    if (language) list.push({ key: 'language', label: classificationLabel(language) })
    if (form) list.push({ key: 'form', label: classificationLabel(form) })
    if (category) list.push({ key: 'category', label: classificationLabel(category) || category })
    if (occasion) list.push({ key: 'occasion', label: classificationLabel(occasion) || occasion })
    if (params.get('q')) list.push({ key: 'q', label: `“${params.get('q')}”` })
    return list
  }, [language, form, occasion, category, params])

  const filterPanel = (
    <div className={s.filterGrid}>
      <label>
        Language
        <select
          aria-label="Language"
          value={language}
          onChange={(event) => setFilter('language', event.target.value)}
        >
          <option value="">All languages</option>
          <option value="amharic">Amharic</option>
          <option value="english">English</option>
        </select>
      </label>
      <label>
        Type
        <select aria-label="Type" value={form} onChange={(event) => setFilter('form', event.target.value)}>
          <option value="">All types</option>
          <option value="mezmur">Mezmur</option>
          <option value="werb">Werb</option>
        </select>
      </label>
      <label>
        Category
        <select
          aria-label="Category"
          value={category}
          onChange={(event) => setFilter('category', event.target.value)}
        >
          <option value="">All categories</option>
          {(facetData?.categories || []).map((item) => (
            <option key={item.value} value={item.value}>
              {item.name}
            </option>
          ))}
        </select>
      </label>
      <label>
        Occasion
        <select
          aria-label="Occasion"
          value={occasion}
          onChange={(event) => setFilter('occasion', event.target.value)}
        >
          <option value="">All occasions</option>
          {(facetData?.occasions || []).map((item) => (
            <option key={item.slug} value={item.slug}>
              {item.name}
            </option>
          ))}
        </select>
      </label>
      <label>
        Sort
        <select
          aria-label="Sort hymns"
          value={sort}
          onChange={(event) => setFilter('sort', event.target.value)}
          disabled={Boolean(params.get('q'))}
          title={params.get('q') ? 'Relevance sorting is used while searching' : undefined}
        >
          <option value="recent">Recently added</option>
          <option value="az">Title A–Z</option>
          <option value="za">Title Z–A</option>
          <option value="published">Recently published</option>
        </select>
      </label>
    </div>
  )

  const showClosest =
    !loading &&
    !error &&
    result &&
    params.get('q') &&
    result.items.length === 0 &&
    (result.closest?.length || 0) > 0

  const showWeakClosest =
    !loading &&
    !error &&
    result &&
    params.get('q') &&
    result.hasStrongMatch === false &&
    (result.closest?.length || 0) > 0

  const gridItems =
    showClosest || showWeakClosest
      ? result!.closest || result!.items
      : result?.items || []

  return (
    <section className={s.page}>
      <header className={s.intro}>
        <p className={s.eyebrow}>Listen · Learn · Pray</p>
        <h1 className={s.title}>Hymn Practice</h1>
        <p className={s.subtitle}>
          Practice Ethiopian Orthodox mezmur, werb, and hymns with lyrics, transliteration, and
          audio/video.
        </p>
      </header>

      <div className={s.toolbar}>
        <div className={s.searchRow} ref={searchWrapRef}>
          <label className={s.srOnly} htmlFor="hymn-search">
            Search hymns
          </label>
          <div className={s.searchField}>
            <input
              id="hymn-search"
              className={s.searchInput}
              value={draftQ}
              onChange={(event) => {
                setDraftQ(event.target.value)
                setSuggestOpen(true)
              }}
              onFocus={() => setSuggestOpen(true)}
              onKeyDown={(event) => {
                if (event.key === 'Escape') setSuggestOpen(false)
              }}
              placeholder="Search by Amharic or transliterated title…"
              maxLength={200}
              autoComplete="off"
              role="combobox"
              aria-expanded={suggestOpen && suggestions.length > 0}
              aria-controls={listboxId}
              aria-autocomplete="list"
            />
            {suggestOpen && suggestions.length > 0 ? (
              <ul id={listboxId} className={s.suggestList} role="listbox">
                {suggestions.map((item) => (
                  <li key={item.id} role="option">
                    <button type="button" className={s.suggestItem} onClick={() => applySuggestion(item)}>
                      <strong>{item.title}</strong>
                      {item.title_amharic ? <span lang="am">{item.title_amharic}</span> : null}
                      {item.singer_name ? <small>{item.singer_name}</small> : null}
                    </button>
                  </li>
                ))}
              </ul>
            ) : null}
          </div>
          <button
            type="button"
            className={s.filterToggle}
            aria-expanded={filtersOpen}
            onClick={() => setFiltersOpen((open) => !open)}
          >
            Filters
          </button>
        </div>

        <div className={s.desktopFilters}>{filterPanel}</div>
        {filtersOpen ? <div className={s.mobileFilters}>{filterPanel}</div> : null}

        {chips.length > 0 ? (
          <div className={s.chips} aria-label="Active filters">
            {chips.map((chip) => (
              <span className={s.chip} key={chip.key}>
                {chip.label}
                <button
                  type="button"
                  aria-label={`Remove ${chip.label} filter`}
                  onClick={() => {
                    if (chip.key === 'q') setDraftQ('')
                    setFilter(chip.key, '')
                  }}
                >
                  ×
                </button>
              </span>
            ))}
            <button type="button" className={s.ghostBtn} onClick={clearAll}>
              Clear all
            </button>
          </div>
        ) : null}
      </div>

      <div className={s.metaRow}>
        <p>
          {loading
            ? 'Loading hymns…'
            : params.get('q')
              ? `${result?.total ?? 0} match${(result?.total ?? 0) === 1 ? '' : 'es'}`
              : `${result?.total ?? 0} hymn${(result?.total ?? 0) === 1 ? '' : 's'} found`}
        </p>
      </div>

      <div className={s.ctaRow}>
        <Link to="/submit-mezmur">Contribute a Mezmur</Link>
      </div>

      {error ? (
        <div className={s.errorBox} role="alert">
          <p>{error}</p>
          <button
            type="button"
            className={s.primaryBtn}
            onClick={() => setReloadTick((n) => n + 1)}
          >
            Try again
          </button>
        </div>
      ) : null}

      {!loading && !error && result && result.items.length === 0 && !showClosest ? (
        <div className={s.empty}>
          <p>No exact match found.</p>
          <div className={s.ctaRow}>
            <button type="button" className={s.ghostBtn} onClick={clearAll}>
              Clear filters
            </button>
            <Link to="/submit-mezmur">Contribute a Mezmur</Link>
          </div>
        </div>
      ) : null}

      {showClosest || showWeakClosest ? (
        <div className={s.closestNote} role="status">
          <p>
            {showClosest ? 'No exact match found.' : 'Showing closest title matches.'} Closest matches:
          </p>
        </div>
      ) : null}

      {gridItems.length > 0 ? (
        <div className={s.grid}>
          {gridItems.map((item) => {
            const hasVideo = Boolean(parseYoutubeVideoId(item.youtube_url || ''))
            const meta = hymnCardMeta(item)
            return (
              <article className={s.card} key={item.id}>
                <Link className={s.cardLink} to={`/practice/mezmur/${item.slug}`}>
                  <CardArt item={item} />
                  <h2 className={s.cardTitle}>{item.title}</h2>
                  {item.title_amharic ? (
                    <p className={s.cardAmharic} lang="am">
                      {item.title_amharic}
                    </p>
                  ) : null}
                  {meta ? <p className={s.cardMeta}>{meta}</p> : null}
                </Link>
                <div className={s.cardActions}>
                  <Link className={s.primaryBtn} to={`/practice/mezmur/${item.slug}`}>
                    Practice
                  </Link>
                  {hasVideo ? (
                    <Link className={s.ghostBtn} to={`/practice/mezmur/${item.slug}`}>
                      Play
                    </Link>
                  ) : null}
                </div>
              </article>
            )
          })}
        </div>
      ) : null}

      {result && result.total > PAGE_SIZE && !showClosest && result.hasStrongMatch !== false ? (
        <nav className={s.pager} aria-label="Results pages">
          <button
            type="button"
            className={s.ghostBtn}
            disabled={page <= 1}
            onClick={() => setFilter('page', String(page - 1))}
          >
            Previous
          </button>
          <span>
            Page {page} of {Math.max(1, Math.ceil(result.total / PAGE_SIZE))}
          </span>
          <button
            type="button"
            className={s.ghostBtn}
            disabled={page * PAGE_SIZE >= result.total}
            onClick={() => {
              const next = new URLSearchParams(params)
              next.set('page', String(page + 1))
              setParams(next)
            }}
          >
            Next
          </button>
        </nav>
      ) : null}
    </section>
  )
}
