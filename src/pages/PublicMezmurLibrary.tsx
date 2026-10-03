import { useCallback, useEffect, useId, useRef, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { publicMedia } from '../lib/publicContent/service'
import {
  getHymnCollections,
  searchHymns,
  searchImportMezmurs,
  type HymnCollection,
  type HymnDiscoveryHit,
} from '../lib/publicContent/hymnBrowse'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { expandSearchAliases } from '../lib/search/routeCatalog'
import { HymnMajorBrowseCardView } from '../components/practice/HymnBrowseCard'
import { MezmurVoiceSearch } from '../components/search/MezmurVoiceSearch'
import s from './HymnPractice.module.css'

type SearchItem = Awaited<ReturnType<typeof searchImportMezmurs>>['items'][number]

function useDebounced(value: string, ms = 280) {
  const [debounced, setDebounced] = useState(value)
  useEffect(() => {
    const id = window.setTimeout(() => setDebounced(value), ms)
    return () => window.clearTimeout(id)
  }, [value, ms])
  return debounced
}

function CardArt({ item }: { item: SearchItem }) {
  const [src, setSrc] = useState('')
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

function CollectionSkeletonGrid() {
  return (
    <div className={s.browseGrid} aria-hidden>
      {Array.from({ length: 6 }).map((_, i) => (
        <div key={i} className={s.skeletonCard}>
          <div className={s.skeletonMedia} />
          <div className={s.skeletonLines}>
            <div className={s.skeletonLine} />
            <div className={`${s.skeletonLine} ${s.skeletonLineShort}`} />
          </div>
        </div>
      ))}
    </div>
  )
}

function MezmurSkeletonGrid() {
  return (
    <div className={s.grid} aria-hidden>
      {Array.from({ length: 6 }).map((_, i) => (
        <div key={i} className={s.skeletonCard}>
          <div className={s.skeletonMedia} />
          <div className={s.skeletonLines}>
            <div className={s.skeletonLine} />
            <div className={`${s.skeletonLine} ${s.skeletonLineShort}`} />
          </div>
        </div>
      ))}
    </div>
  )
}

function BrowseSection({
  title,
  groups,
  emptyHint,
}: {
  title: string
  groups: HymnCollection[]
  emptyHint?: string
}) {
  if (!groups.length) {
    return emptyHint ? (
      <section className={s.browseSection}>
        <header className={s.browseHead}>
          <h2 className={s.browseTitle}>{title}</h2>
        </header>
        <p className={s.browseEmpty}>{emptyHint}</p>
      </section>
    ) : null
  }

  return (
    <section className={s.browseSection}>
      <header className={s.browseHead}>
        <h2 className={s.browseTitle}>{title}</h2>
      </header>
      <div className={s.browseGrid}>
        {groups.map((group, index) => (
          <HymnMajorBrowseCardView key={group.id} group={group} priority={index < 3} />
        ))}
      </div>
    </section>
  )
}

function MezmurResultGrid({
  items,
  loading,
  error,
  onRetry,
}: {
  items: SearchItem[]
  loading: boolean
  error?: string
  onRetry: () => void
}) {
  if (loading) return <MezmurSkeletonGrid />
  if (error) {
    return (
      <div className={s.status} role="alert">
        <p>{error}</p>
        <button type="button" className={s.textBtn} onClick={onRetry}>
          Retry
        </button>
      </div>
    )
  }
  if (!items.length) {
    return <p className={s.status}>No hymns matched your search.</p>
  }
  return (
    <div className={s.grid}>
      {items.map((item) => {
        const english = item.title_english || item.title
        const meta = [item.singer_name, item.form || item.language].filter(Boolean).join(' · ')
        return (
          <Link key={item.id} to={`/practice/mezmur/${item.slug}`} className={s.card}>
            <CardArt item={item} />
            <div className={s.cardBody}>
              {item.title_amharic ? (
                <p className={s.cardAm} lang="am">
                  {item.title_amharic}
                </p>
              ) : null}
              <h3 className={s.cardTitle}>{english}</h3>
              {meta ? <p className={s.cardMeta}>{meta}</p> : null}
            </div>
          </Link>
        )
      })}
    </div>
  )
}

/**
 * Hymns Practice landing — collections browse + search over mezmur_data_import.
 */
export function PublicMezmurLibrary() {
  const navigate = useNavigate()
  const [params, setParams] = useSearchParams()
  const [draftQ, setDraftQ] = useState(params.get('q') || '')
  const debouncedQ = useDebounced(draftQ, 280)
  const [browse, setBrowse] = useState<HymnCollection[] | null>(null)
  const [browseError, setBrowseError] = useState<string>()
  const [discoveryHits, setDiscoveryHits] = useState<HymnDiscoveryHit[]>([])
  const [result, setResult] = useState<{
    items: SearchItem[]
    total: number
    page: number
  } | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const [suggestOpen, setSuggestOpen] = useState(false)
  const searchWrapRef = useRef<HTMLDivElement>(null)
  const listboxId = useId()

  const hasQuery = Boolean((params.get('q') || '').trim())
  const showResults = hasQuery
  const page = Math.max(1, Number(params.get('page') || '1') || 1)

  usePageMeta(
    'Hymns Practice',
    'Learn and practice Ethiopian Orthodox Mezmur — browse by feast, saint, or zemari.',
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
    if (showResults) return
    let active = true
    setBrowse(null)
    setBrowseError(undefined)
    void getHymnCollections()
      .then((data) => {
        if (active) {
          setBrowse(data)
          setBrowseError(undefined)
        }
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] browse', cause)
        setBrowseError('Unable to load Hymn Practice.')
        setBrowse([])
      })
    return () => {
      active = false
    }
  }, [showResults, reloadTick])

  useEffect(() => {
    const needle = draftQ.trim()
    let active = true
    if (needle.length < 2) {
      queueMicrotask(() => {
        if (active) setDiscoveryHits([])
      })
      return () => {
        active = false
      }
    }
    const timeout = window.setTimeout(() => {
      void searchHymns(expandSearchAliases(needle), 8)
        .then((hits) => {
          if (active) setDiscoveryHits(hits)
        })
        .catch(() => {
          if (active) setDiscoveryHits([])
        })
    }, 280)
    return () => {
      active = false
      window.clearTimeout(timeout)
    }
  }, [draftQ])

  useEffect(() => {
    const onPointer = (event: MouseEvent) => {
      if (!searchWrapRef.current?.contains(event.target as Node)) setSuggestOpen(false)
    }
    document.addEventListener('mousedown', onPointer)
    return () => document.removeEventListener('mousedown', onPointer)
  }, [])

  useEffect(() => {
    if (!showResults) {
      setResult(null)
      setLoading(false)
      return
    }
    let active = true
    setLoading(true)
    setError(undefined)
    setResult(null)
    const q = (params.get('q') || '').trim()
    void searchImportMezmurs(q, { page, pageSize: 24 })
      .then((data) => {
        if (active) {
          setResult(data)
          setLoading(false)
        }
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] search', cause)
        setError('Unable to load Hymn Practice.')
        setResult(null)
        setLoading(false)
      })
    return () => {
      active = false
    }
  }, [params, page, reloadTick, showResults])

  const applyDiscoveryHit = (hit: HymnDiscoveryHit) => {
    setSuggestOpen(false)
    if (hit.type === 'mezmur') {
      navigate(hit.href)
      return
    }
    setDraftQ('')
    navigate(hit.href)
  }

  const clearSearch = useCallback(() => {
    setDraftQ('')
    setDiscoveryHits([])
    setParams(new URLSearchParams())
  }, [setParams])

  const totalPages = result ? Math.max(1, Math.ceil(result.total / 24)) : 1

  return (
    <section className={s.page}>
      <header className={s.intro}>
        <p className={s.eyebrow}>Listen · Learn · Pray</p>
        <h1 className={s.title}>Hymns Practice</h1>
        <p className={s.subtitle}>Learn and practice Ethiopian Orthodox Mezmur.</p>
      </header>

      <div className={s.toolbar}>
        <div className={s.searchRow} ref={searchWrapRef}>
          <label className={s.srOnly} htmlFor="hymn-search">
            Search hymns, saints, singers, occasions
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
              placeholder="Search hymns, saints, singers, occasions…"
              maxLength={200}
              autoComplete="off"
              role="combobox"
              aria-expanded={suggestOpen && discoveryHits.length > 0}
              aria-controls={listboxId}
              aria-autocomplete="list"
            />
            {suggestOpen && discoveryHits.length > 0 && !showResults ? (
              <ul id={listboxId} className={s.suggestList} role="listbox">
                {discoveryHits.map((hit) => (
                  <li key={`${hit.type}-${hit.id}`} role="option">
                    <button
                      type="button"
                      className={s.suggestItem}
                      onClick={() => applyDiscoveryHit(hit)}
                    >
                      {hit.titleAmharic ? (
                        <strong lang="am">{hit.titleAmharic}</strong>
                      ) : (
                        <strong>{hit.title}</strong>
                      )}
                      {hit.titleAmharic ? <span>{hit.title}</span> : null}
                      <small>{hit.meta}</small>
                    </button>
                  </li>
                ))}
              </ul>
            ) : null}
          </div>
          {showResults ? (
            <button type="button" className={s.clearBtn} onClick={clearSearch}>
              Clear
            </button>
          ) : null}
        </div>
        <MezmurVoiceSearch onTranscript={(text) => {
          setDraftQ(text)
          setSuggestOpen(false)
        }} />
      </div>

      {showResults ? (
        <>
          <div className={s.resultsHead}>
            <h2 className={s.browseTitle}>
              {loading || !result
                ? 'Searching…'
                : `Search results · ${result.total}`}
            </h2>
            <Link to="/practice" className={s.viewAll}>
              Back to browse
            </Link>
          </div>
          {!loading && discoveryHits.length > 0 ? (
            <ul className={s.suggestList} aria-label="Matching sections and singers">
              {discoveryHits
                .filter((hit) => hit.type === 'section' || hit.type === 'singer' || hit.type === 'collection')
                .slice(0, 6)
                .map((hit) => (
                  <li key={`${hit.type}-${hit.id}`}>
                    <button
                      type="button"
                      className={s.suggestItem}
                      onClick={() => applyDiscoveryHit(hit)}
                    >
                      <strong>{hit.title}</strong>
                      {hit.titleAmharic ? <span lang="am">{hit.titleAmharic}</span> : null}
                      <small>{hit.meta}</small>
                    </button>
                  </li>
                ))}
            </ul>
          ) : null}
          <MezmurResultGrid
            items={result?.items || []}
            loading={loading || !result}
            error={error}
            onRetry={() => setReloadTick((n) => n + 1)}
          />
          {result && totalPages > 1 ? (
            <div className={s.pager}>
              <button
                type="button"
                disabled={page <= 1}
                onClick={() => {
                  const next = new URLSearchParams(params)
                  next.set('page', String(page - 1))
                  setParams(next)
                }}
              >
                Previous
              </button>
              <span>
                Page {page} of {totalPages}
              </span>
              <button
                type="button"
                disabled={page >= totalPages}
                onClick={() => {
                  const next = new URLSearchParams(params)
                  next.set('page', String(page + 1))
                  setParams(next)
                }}
              >
                Next
              </button>
            </div>
          ) : null}
        </>
      ) : (
        <>
          {browseError ? (
            <div className={s.status} role="alert">
              <p>{browseError}</p>
              <button type="button" className={s.textBtn} onClick={() => setReloadTick((n) => n + 1)}>
                Retry
              </button>
            </div>
          ) : null}

          {!browse && !browseError ? (
            <>
              <header className={s.browseHead}>
                <h2 className={s.browseTitle}>Browse</h2>
              </header>
              <CollectionSkeletonGrid />
            </>
          ) : null}

          {browse && !browseError ? (
            <BrowseSection
              title="Browse"
              groups={browse}
              emptyHint="No collections are visible yet. If data exists in Supabase Table Editor, apply supabase/mezmur-import/FIX_MEZMUR_IMPORT_ANON_READ.sql so anon can read the import tables."
            />
          ) : null}
        </>
      )}
    </section>
  )
}
