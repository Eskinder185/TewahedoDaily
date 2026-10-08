import { useCallback, useEffect, useId, useRef, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { responsiveImageAttrs } from '../lib/media/responsiveImage'
import { publicMedia } from '../lib/publicContent/service'
import {
  getHymnCollections,
  searchHymns,
  type HymnCollection,
  type HymnDiscoveryHit,
} from '../lib/publicContent/hymnBrowse'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { expandSearchAliases } from '../lib/search/routeCatalog'
import {
  searchMezmursUnified,
  type UnifiedMezmurSearchItem,
} from '../lib/search/unifiedHymnSearch'
import { useTranslation } from '../i18n'
import { HymnMajorBrowseCardView } from '../components/practice/HymnBrowseCard'
import { VoiceTranscriptionControl } from '../components/search/VoiceTranscriptionControl'
import s from './HymnPractice.module.css'

type SearchItem = UnifiedMezmurSearchItem

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

  const attrs = responsiveImageAttrs(src, {
    sizes: '(max-width: 430px) 42vw, (max-width: 768px) 30vw, 180px',
    width: 320,
    height: 240,
  })

  return (
    <img
      className={s.art}
      src={attrs?.src || src}
      srcSet={attrs?.srcSet}
      sizes={attrs?.sizes}
      alt=""
      loading={attrs?.loading || 'lazy'}
      decoding="async"
      width={attrs?.width || 320}
      height={attrs?.height || 240}
      fetchPriority={attrs?.fetchPriority}
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
  emptyMessage,
}: {
  items: SearchItem[]
  loading: boolean
  error?: string
  onRetry: () => void
  emptyMessage: string
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
    return (
      <p className={s.status} lang="am">
        {emptyMessage}
      </p>
    )
  }
  return (
    <div className={s.grid}>
      {items.map((item) => {
        const english = item.title_english || item.title
        const meta = [item.zemari || item.singer_name, item.form || item.primary_language]
          .filter(Boolean)
          .join(' · ')
        return (
          <Link key={item.id || item.slug} to={`/practice/mezmur/${item.slug}`} className={s.card}>
            <CardArt item={item} />
            <div className={s.cardBody}>
              {item.title_amharic ? (
                <p className={s.cardAm} lang="am">
                  {item.title_amharic}
                </p>
              ) : null}
              {english && english !== item.title_amharic ? (
                <h3 className={s.cardTitle}>{english}</h3>
              ) : !item.title_amharic ? (
                <h3 className={s.cardTitle}>{item.title}</h3>
              ) : null}
              {meta ? <p className={s.cardMeta}>{meta}</p> : null}
              {item.preview ? (
                <p className={s.cardMeta} lang={/[\u1200-\u137F]/.test(item.preview) ? 'am' : undefined}>
                  {item.preview.length > 160 ? `${item.preview.slice(0, 157).trim()}…` : item.preview}
                </p>
              ) : null}
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
  const t = useTranslation()
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
  /** Last voice transcript shown as የተሰማው፦ … */
  const [heardTranscript, setHeardTranscript] = useState<string | null>(null)
  const searchWrapRef = useRef<HTMLDivElement>(null)
  const listboxId = useId()

  const hasQuery = Boolean((params.get('q') || '').trim())
  const showResults = hasQuery

  usePageMeta(
    t('practice.metaTitle'),
    t('practice.metaDescription'),
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
        setBrowseError('Unable to load Hymns.')
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
      // Browse facets only (sections / singers / collections). Hymn titles come
      // from GET /api/hymns/search — do not surface local exact title matches here.
      void searchHymns(expandSearchAliases(needle), 8)
        .then((hits) => {
          if (active) {
            setDiscoveryHits(hits.filter((hit) => hit.type !== 'mezmur'))
          }
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
    // Raw query → GET /api/hymns/search (same path for typed and voice).
    // Do not expand aliases or run local exact-match before the backend.
    const q = (params.get('q') || '').replace(/\s+/g, ' ').trim()
    const controller = new AbortController()
    void (async () => {
      try {
        const [data, hits] = await Promise.all([
          searchMezmursUnified(q, { limit: 20, signal: controller.signal }),
          // Browse discovery only (sections/singers) — does not drive hymn ranking.
          searchHymns(expandSearchAliases(q), 8).catch(() => [] as HymnDiscoveryHit[]),
        ])
        if (!active) return
        setDiscoveryHits(hits)
        setResult({
          items: data.items,
          total: data.items.length,
          page: 1,
        })
        setLoading(false)
      } catch (cause) {
        if (!active || controller.signal.aborted) return
        if (import.meta.env.DEV) console.error('[hymn practice] search', cause)
        setError(t('practice.loadError'))
        setResult(null)
        setLoading(false)
      }
    })()
    return () => {
      active = false
      controller.abort()
    }
  }, [params, reloadTick, showResults, t])

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
    setHeardTranscript(null)
    setParams(new URLSearchParams())
  }, [setParams])

  const sectionMatchCount = discoveryHits.filter(
    (hit) => hit.type === 'section' || hit.type === 'singer' || hit.type === 'collection',
  ).length

  const resultsHeading = (() => {
    if (loading || !result) return t('practice.searching')
    return t('practice.resultsCount', { count: result.total })
  })()

  // Always the Amharic empty copy when the backend returns no hymns.
  const emptyMessage = '\u121D\u1295\u121D \u1218\u12DD\u1219\u122D \u12A0\u120D\u1270\u1308\u1298\u121D\u1362'

  return (
    <section className={s.page}>
      <header className={s.intro}>
        <p className={s.eyebrow}>{t('practice.eyebrow')}</p>
        <h1 className={s.title}>{t('practice.title')}</h1>
        <p className={s.subtitle}>{t('practice.subtitle')}</p>
      </header>

      <div className={s.toolbar}>
        <div className={s.searchRow} ref={searchWrapRef}>
          <label className={s.srOnly} htmlFor="hymn-search">
            {t('practice.searchLabel')}
          </label>
          <div className={s.searchField}>
            <input
              id="hymn-search"
              className={s.searchInput}
              value={draftQ}
              onChange={(event) => {
                setDraftQ(event.target.value)
                setHeardTranscript(null)
                setSuggestOpen(true)
              }}
              onFocus={() => setSuggestOpen(true)}
              onKeyDown={(event) => {
                if (event.key === 'Escape') setSuggestOpen(false)
              }}
              placeholder={t('practice.searchPlaceholder')}
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
                  <li key={`${hit.type}-${hit.id}`} role="option" aria-selected="false">
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
              {t('practice.clear')}
            </button>
          ) : null}
        </div>
        <VoiceTranscriptionControl
          ariaLabel="Search hymns by voice"
          defaultLanguage="am"
          amharicOnly
          onTranscript={(text) => {
            const transcript = text.trim()
            if (!transcript) return
            // Voice → raw transcript → same GET /api/hymns/search as typed (via draftQ).
            setHeardTranscript(transcript)
            setDraftQ(transcript)
            setSuggestOpen(false)
          }}
        />
      </div>

      {heardTranscript ? (
        <p className={s.browseEmpty} lang="am" role="status">
          {'\u12E8\u1270\u1230\u121B\u12CD\u1356 '}
          {heardTranscript}
        </p>
      ) : null}

      {showResults ? (
        <>
          <div className={s.resultsHead}>
            <h2 className={s.browseTitle}>{resultsHeading}</h2>
            <Link to="/practice" className={s.viewAll}>
              {t('practice.backToBrowse')}
            </Link>
          </div>
          {!loading && sectionMatchCount > 0 ? (
            <ul className={s.suggestList} aria-label={t('practice.matchingSectionsAria')}>
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
            emptyMessage={emptyMessage}
          />
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
                <h2 className={s.browseTitle}>{t('practice.browse')}</h2>
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
