import { publicErrorMessage } from '../lib/errors/publicError'
import { useCallback, useEffect, useId, useRef, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { useUrlSearchInput } from '../hooks/useUrlState'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { responsiveImageAttrs } from '../lib/media/responsiveImage'
import { publicMedia } from '../lib/publicContent/service'
import {
  getHymnCollections,
  getHymnSingersPage,
  searchHymns,
  type HymnBrowseCard,
  type HymnCollection,
  type HymnDiscoveryHit,
} from '../lib/publicContent/hymnBrowse'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { expandSearchAliases } from '../lib/search/routeCatalog'
import {
  searchMezmursUnified,
  type UnifiedMezmurSearchItem,
} from '../lib/search/unifiedHymnSearch'
import { hymnCardMeta } from '../lib/publicContent/labels'
import { hymnMezmurCountLabel, hymnSourceHeading } from '../lib/publicContent/hymnBrowseLabels'
import { useLocale } from '../lib/i18n/locale'
import { useTranslation } from '../i18n'
import { prefetchRoute } from '../lib/routePrefetch'
import { VoiceTranscriptionControl } from '../components/search/VoiceTranscriptionControl'
import { HighlightedText } from '../components/search/HighlightedText'
import { queueItem, rememberBrowseQueue } from '../lib/mezmur/browseQueue'
import s from './HymnPractice.module.css'
import { MEZMUR_LANGUAGES, isMezmurLanguageFilter, type MezmurLanguageFilter } from '../lib/mezmur/mezmurLanguage'
import {
  MEZMUR_CATEGORY_BROWSE_GROUPS,
  MEZMUR_OCCASION_BROWSE_GROUPS,
  type MezmurBrowseGroup,
} from '../lib/publicContent/mezmurBrowseGroups'

type SearchItem = UnifiedMezmurSearchItem

function CardArt({ item }: { item: SearchItem }) {
  const [src, setSrc] = useState('')
  const [failed, setFailed] = useState(false)
  useEffect(() => {
    let active = true
    queueMicrotask(() => { if (active) setFailed(false) })
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

function CollectionSkeletonGrid({ count = 6 }: { count?: number }) {
  return (
    <div className={s.libraryCardGrid} aria-hidden>
      {Array.from({ length: count }).map((_, i) => (
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

type BrowseMode = 'categories' | 'occasions' | 'zemaris'

const browseModeFromParam = (value: string | null): BrowseMode =>
  value === 'occasions' || value === 'zemaris' ? value : 'categories'

function libraryGroupHref(
  definition: MezmurBrowseGroup,
  collection: HymnCollection | undefined,
  language: MezmurLanguageFilter,
) {
  const href = collection?.href || `/hymns/browse/${definition.slug}`
  return language === 'all'
    ? href
    : `${href}${href.includes('?') ? '&' : '?'}language=${encodeURIComponent(language)}`
}

function LibraryNavigationCard({
  definition,
  collection,
  language,
  isAmharic,
}: {
  definition: MezmurBrowseGroup
  collection: HymnCollection | undefined
  language: MezmurLanguageFilter
  isAmharic: boolean
}) {
  const [imageFailed, setImageFailed] = useState(false)
  const imageUrl = collection?.imageUrl || ''
  const showImage = Boolean(imageUrl) && !imageFailed
  const primaryHref = libraryGroupHref(definition, collection, language)

  const imageAttrs = showImage
    ? responsiveImageAttrs(imageUrl, {
        sizes: '(max-width: 560px) 34vw, (max-width: 900px) 24vw, 190px',
        width: 480,
        height: 360,
      })
    : null

  return (
    <article className={`${s.libraryNavCard} ${s.libraryNavCardComplex} ${showImage ? s.libraryNavCardWithImage : ''}`}>
      <Link
        className={s.libraryNavPrimary}
        to={primaryHref}
        onPointerEnter={() => prefetchRoute(collection?.href || `/hymns/browse/${definition.slug}`)}
        onPointerDown={() => prefetchRoute(collection?.href || `/hymns/browse/${definition.slug}`)}
      >
        <span className={s.libraryNavMedia}>
        {showImage ? (
          <img
            className={s.libraryNavImage}
            src={imageAttrs?.src || imageUrl}
            srcSet={imageAttrs?.srcSet}
            sizes={imageAttrs?.sizes}
            width={imageAttrs?.width || 480}
            height={imageAttrs?.height || 360}
            loading={imageAttrs?.loading || 'lazy'}
            decoding="async"
            alt={collection?.imageAlt || definition.title}
            onError={() => setImageFailed(true)}
          />
        ) : (
          <span className={s.libraryNavPlaceholder} aria-hidden>✣</span>
        )}
        </span>
        <span className={s.libraryNavCardBody}>
        <strong lang={isAmharic ? 'am' : 'en'}>
          {isAmharic ? definition.titleAmharic : definition.title}
        </strong>
        <span className={s.libraryNavMeta}>
          <span>{hymnMezmurCountLabel(collection?.mezmurCount || 0, isAmharic ? 'am' : 'en')}</span>
          <span className={s.libraryNavArrow} aria-hidden>→</span>
        </span>
        </span>
      </Link>
    </article>
  )
}

function ZemariNavigationCard({ card, isAmharic }: { card: HymnBrowseCard; isAmharic: boolean }) {
  const [imageFailed, setImageFailed] = useState(false)
  const showImage = Boolean(card.imageUrl) && !imageFailed
  const imageAttrs = showImage
    ? responsiveImageAttrs(card.imageUrl, {
        sizes: '(max-width: 560px) 86vw, (max-width: 900px) 42vw, 320px',
        width: 640,
        height: 480,
      })
    : null

  return (
    <Link className={s.libraryNavCard} to={card.href}>
      <span className={s.libraryNavMedia}>
        {showImage ? (
          <img
            className={s.libraryNavImage}
            src={imageAttrs?.src || card.imageUrl}
            srcSet={imageAttrs?.srcSet}
            sizes={imageAttrs?.sizes}
            width={imageAttrs?.width || 640}
            height={imageAttrs?.height || 480}
            loading={imageAttrs?.loading || 'lazy'}
            decoding="async"
            alt={card.imageAlt || card.name}
            onError={() => setImageFailed(true)}
          />
        ) : (
          <span className={s.libraryNavPlaceholder} aria-hidden>✣</span>
        )}
      </span>
      <span className={s.libraryNavCardBody}>
        <strong lang={isAmharic && card.nameAmharic ? 'am' : 'en'}>
          {isAmharic && card.nameAmharic ? card.nameAmharic : card.name}
        </strong>
        {card.nameAmharic && !isAmharic ? <span lang="am">{card.nameAmharic}</span> : null}
        <span className={s.libraryNavMeta}>
          <span>{hymnMezmurCountLabel(card.mezmurCount, isAmharic ? 'am' : 'en')}</span>
          <span className={s.libraryNavArrow} aria-hidden>→</span>
        </span>
      </span>
    </Link>
  )
}

function LibraryNavigation({
  mode,
  groups,
  language,
  locale,
  onModeChange,
  onSearchZemaris,
  zemaris,
  zemariTotal,
  zemariLoading,
  zemariError,
  zemariHasMore,
  onShowMoreZemaris,
}: {
  mode: BrowseMode
  groups: HymnCollection[]
  language: MezmurLanguageFilter
  locale: string
  onModeChange: (mode: BrowseMode) => void
  onSearchZemaris: () => void
  zemaris: HymnBrowseCard[]
  zemariTotal: number
  zemariLoading: boolean
  zemariError?: string
  zemariHasMore: boolean
  onShowMoreZemaris: () => void
}) {
  const isAmharic = locale === 'am'
  const definitions = mode === 'occasions'
    ? MEZMUR_OCCASION_BROWSE_GROUPS
    : MEZMUR_CATEGORY_BROWSE_GROUPS
  const collectionsBySlug = new Map(groups.map((group) => [group.slug, group]))
  const panelId = `mezmur-library-${mode}`
  const tabs: Array<{ id: BrowseMode; label: string; labelAmharic: string }> = [
    { id: 'categories', label: 'Categories', labelAmharic: 'ምድቦች' },
    { id: 'occasions', label: 'Occasions', labelAmharic: 'ወቅቶች' },
    { id: 'zemaris', label: 'Zemaris', labelAmharic: 'ዘማሪዎች' },
  ]

  return (
    <div className={s.libraryNavigation}>
      <div className={s.libraryTabs} role="tablist" aria-label={isAmharic ? 'የመዝሙር ማሰሻ' : 'Browse Mezmurs'}>
        {tabs.map((tab) => (
          <button
            key={tab.id}
            id={`mezmur-library-tab-${tab.id}`}
            type="button"
            role="tab"
            aria-selected={mode === tab.id}
            aria-controls={`mezmur-library-${tab.id}`}
            className={mode === tab.id ? s.libraryTabActive : s.libraryTab}
            onClick={() => onModeChange(tab.id)}
          >
            {isAmharic ? tab.labelAmharic : tab.label}
          </button>
        ))}
      </div>

      <div
        id={panelId}
        className={s.libraryTabPanel}
        role="tabpanel"
        aria-labelledby={`mezmur-library-tab-${mode}`}
      >
        {mode === 'zemaris' ? (
          <div>
            <div className={s.libraryPanelHead}>
              <div>
                <h2>{isAmharic ? 'በዘማሪ ይፈልጉ' : 'Browse by Zemari'}</h2>
                <p>{isAmharic ? 'በአማርኛ ወይም በእንግሊዝኛ ስም ይፈልጉ።' : `${zemariTotal} Zemaris with published Mezmurs`}</p>
              </div>
              <button type="button" className={s.textBtn} onClick={onSearchZemaris}>
                {isAmharic ? 'ዘማሪ ይፈልጉ' : 'Search Zemaris'}
              </button>
            </div>
            {zemariError ? <p className={s.status} role="alert">{zemariError}</p> : null}
            {zemariLoading && zemaris.length === 0 ? <CollectionSkeletonGrid count={8} /> : null}
            {!zemariLoading && !zemariError && zemaris.length === 0 ? (
              <p className={s.status}>{isAmharic ? 'ምንም ዘማሪ አልተገኘም።' : 'No Zemaris found.'}</p>
            ) : null}
            {zemaris.length > 0 ? (
              <div className={s.libraryCardGrid}>
                {zemaris.map((card) => <ZemariNavigationCard key={card.id} card={card} isAmharic={isAmharic} />)}
              </div>
            ) : null}
            {zemariHasMore ? (
              <div className={s.libraryShowMore}>
                <button type="button" onClick={onShowMoreZemaris} disabled={zemariLoading}>
                  {zemariLoading
                    ? (isAmharic ? 'በመጫን ላይ…' : 'Loading…')
                    : (isAmharic ? 'ተጨማሪ ዘማሪዎችን አሳይ' : 'Show More Zemaris')}
                </button>
              </div>
            ) : null}
          </div>
        ) : (
          <div className={s.libraryCardGrid}>
            {definitions.map((definition) => {
              const collection = collectionsBySlug.get(definition.slug)
              return (
                <LibraryNavigationCard
                  key={`${definition.slug}:${collection?.imageUrl || ''}`}
                  definition={definition}
                  collection={collection}
                  language={language}
                  isAmharic={isAmharic}
                />
              )
            })}
          </div>
        )}
      </div>
    </div>
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
  const t = useTranslation()
  const { locale } = useLocale()
  if (loading) return <MezmurSkeletonGrid />
  if (error) {
    return (
      <div className={s.status} role="alert">
        <p>{error}</p>
          <button type="button" className={s.textBtn} onClick={onRetry}>
          {t('practice.retry')}
        </button>
      </div>
    )
  }
  if (!items.length) {
    return (
      <p className={s.status}>{emptyMessage}</p>
    )
  }
  return (
    <div className={s.grid}>
      {items.map((item) => {
        const searchQuery = (new URLSearchParams(window.location.search).get('q') || '').replace(/\s+/g, ' ').trim()
        const heading = hymnSourceHeading(
          item.title_english || item.title,
          item.title_amharic,
          locale,
        )
        const meta = [
          item.zemari || item.singer_name,
          hymnCardMeta(
            { language: item.primary_language, form: item.form },
            locale,
          ),
        ]
          .filter(Boolean)
          .join(' · ')
        return (
          <Link
            key={item.id || item.slug}
            // A lyric match opens the hymn with the query so the viewer can show the matched passage.
            to={item.excerpt && searchQuery ? `/hymns/mezmur/${item.slug}?q=${encodeURIComponent(searchQuery)}` : `/hymns/mezmur/${item.slug}`}
            className={s.card}
            onClick={() => rememberBrowseQueue(
              new URLSearchParams(window.location.search).get('q') ? 'Search results' : 'Mezmur Library',
              `${window.location.pathname}${window.location.search}`,
              items.map((row) => queueItem(row.slug, row.title, row.youtube_url, row.audio_url)),
              item.slug,
            )}
          >
            <CardArt item={item} />
            <div className={s.cardBody}>
              {heading.secondary ? (
                <p className={s.cardAm} lang={heading.secondaryLang || undefined}>
                  {heading.secondary}
                </p>
              ) : null}
              {heading.primary ? (
                <h3 className={s.cardTitle} lang={heading.primaryLang}>
                  {heading.primary}
                </h3>
              ) : null}
              {meta ? <p className={s.cardMeta}>{meta}</p> : null}
              {item.similar ? <p className={s.cardMeta} data-testid="mezmur-similar-badge">{t('practice.similarSpelling')}</p> : null}
              {item.confirmedVersionCount && item.confirmedVersionCount > 1 ? <p className={s.cardMeta}>{item.confirmedVersionCount} confirmed versions · open to view each original</p> : null}
              {item.excerpt ? (
                <p className={s.cardExcerpt} data-testid="mezmur-lyric-excerpt" lang={/[ሀ-፿]/.test(item.excerpt.text) ? 'am' : undefined}>
                  <HighlightedText text={item.excerpt.text} ranges={item.excerpt.ranges} markClassName={s.match} />
                </p>
              ) : item.preview ? (
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
  const { locale } = useLocale()
  const navigate = useNavigate()
  const [params, setParams] = useSearchParams()
  const languageParam = params.get('language')
  const language: MezmurLanguageFilter = isMezmurLanguageFilter(languageParam) ? languageParam : 'all'
  const [draftQ, setDraftQ] = useUrlSearchInput()
  const [browse, setBrowse] = useState<HymnCollection[] | null>(null)
  const browseLoadedRef = useRef(false)
  const [browseError, setBrowseError] = useState<string>()
  const [zemaris, setZemaris] = useState<HymnBrowseCard[]>([])
  const [zemariTotal, setZemariTotal] = useState(0)
  const [zemariLoading, setZemariLoading] = useState(false)
  const [zemariError, setZemariError] = useState<string>()
  const [zemariHasMore, setZemariHasMore] = useState(false)
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
  const searchInputRef = useRef<HTMLInputElement>(null)
  const listboxId = useId()

  const browseMode = browseModeFromParam(params.get('browse'))
  const zemariQuery = browseMode === 'zemaris' ? (params.get('q') || '').trim() : ''
  const hasQuery = Boolean((params.get('q') || '').trim())
  const showResults = hasQuery && browseMode !== 'zemaris'
  const page = Math.max(1, Number(params.get('page')) || 1)

  usePageMeta(
    t('practice.metaTitle'),
    t('practice.metaDescription'),
  )

  useEffect(() => {
    if (showResults) return
    let active = true
    if (!browseLoadedRef.current) {
      queueMicrotask(() => {
        if (active) { setBrowse(null); setBrowseError(undefined) }
      })
    }
    void getHymnCollections(language)
      .then((data) => {
        if (active) {
          browseLoadedRef.current = true
          setBrowse(data)
          setBrowseError(undefined)
          for (const group of data.slice(0, 3)) {
            if (group.href) prefetchRoute(group.href)
          }
        }
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] browse', cause)
        setBrowseError(t('practice.loadError'))
        setBrowse([])
      })
    return () => {
      active = false
    }
  }, [showResults, reloadTick, t, language])

  useEffect(() => {
    if (browseMode !== 'zemaris') return
    let active = true
    queueMicrotask(() => {
      if (!active) return
      setZemaris([])
      setZemariLoading(true)
      setZemariError(undefined)
    })
    void getHymnSingersPage({ offset: 0, limit: 8, query: zemariQuery, language })
      .then((pageResult) => {
        if (!active) return
        setZemaris(pageResult.items)
        setZemariTotal(pageResult.total)
        setZemariHasMore(pageResult.hasMore)
        setZemariLoading(false)
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] zemaris', cause)
        setZemariError(publicErrorMessage(cause, t('practice.loadError')))
        setZemariLoading(false)
      })
    return () => {
      active = false
    }
  }, [browseMode, language, zemariQuery, reloadTick, t])

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
      queueMicrotask(() => { setResult(null); setLoading(false) })
      return
    }
    let active = true
    queueMicrotask(() => {
      if (active) { setLoading(true); setError(undefined); setResult(null) }
    })
    // Raw query → GET /api/hymns/search (same path for typed and voice).
    // Do not expand aliases or run local exact-match before the backend.
    const q = (params.get('q') || '').replace(/\s+/g, ' ').trim()
    const controller = new AbortController()
    void (async () => {
      try {
        // One lyric-aware search for every language filter (API first, bounded public fallback).
        // A language filter pages the (at most 50) matches 24 at a time.
        const [data, hits] = await Promise.all([
          language === 'all'
            ? searchMezmursUnified(q, { limit: 20, signal: controller.signal })
            : searchMezmursUnified(q, { limit: 50, language, signal: controller.signal }).then((found) => ({
                items: found.items.slice((page - 1) * 24, page * 24), total: found.total, page,
              })),
          // Browse discovery only (sections/singers) — does not drive hymn ranking.
          searchHymns(expandSearchAliases(q), 8).catch(() => [] as HymnDiscoveryHit[]),
        ])
        if (!active) return
        setDiscoveryHits(hits)
        setResult({
          items: data.items,
          total: data.total,
          page: data.page,
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
  }, [params, reloadTick, showResults, t, language, page])

  const applyDiscoveryHit = (hit: HymnDiscoveryHit) => {
    setSuggestOpen(false)
    const targetHref = language !== 'all' ? `${hit.href}${hit.href.includes('?') ? '&' : '?'}language=${encodeURIComponent(language)}` : hit.href
    if (hit.type === 'mezmur') {
      navigate(targetHref)
      return
    }
    setDraftQ('')
    navigate(targetHref)
  }

  const clearSearch = useCallback(() => {
    setDraftQ('')
    setDiscoveryHits([])
    setHeardTranscript(null)
    const next = new URLSearchParams(params)
    next.delete('q'); next.delete('page')
    setParams(next)
  }, [params, setParams, setDraftQ])

  const selectLanguage = (nextLanguage: MezmurLanguageFilter) => {
    const next = new URLSearchParams(params)
    if (nextLanguage === 'all') next.delete('language')
    else next.set('language', nextLanguage)
    next.delete('page')
    setParams(next)
  }

  const selectBrowseMode = (nextMode: BrowseMode) => {
    const next = new URLSearchParams(params)
    if (nextMode === 'categories') next.delete('browse')
    else next.set('browse', nextMode)
    next.delete('page')
    setParams(next)
    if (nextMode === 'zemaris') {
      window.requestAnimationFrame(() => searchInputRef.current?.focus())
    }
  }

  const showMoreZemaris = () => {
    if (zemariLoading || !zemariHasMore) return
    setZemariLoading(true)
    setZemariError(undefined)
    void getHymnSingersPage({ offset: zemaris.length, limit: 8, query: zemariQuery, language })
      .then((pageResult) => {
        setZemaris((current) => {
          const seen = new Set(current.map((card) => card.id))
          return [...current, ...pageResult.items.filter((card) => !seen.has(card.id))]
        })
        setZemariTotal(pageResult.total)
        setZemariHasMore(pageResult.hasMore)
        setZemariLoading(false)
      })
      .catch((cause) => {
        if (import.meta.env.DEV) console.error('[hymn practice] more zemaris', cause)
        setZemariError(publicErrorMessage(cause, t('practice.loadError')))
        setZemariLoading(false)
      })
  }

  const sectionMatchCount = discoveryHits.filter(
    (hit) => hit.type === 'section' || hit.type === 'singer' || hit.type === 'collection',
  ).length

  const resultsHeading = (() => {
    if (loading || !result) return t('practice.searching')
    return t('practice.resultsCount', { count: result.total })
  })()

  // Always the Amharic empty copy when the backend returns no hymns.
  const emptyMessage = t('practice.emptyHymns')

  return (
    <section className={s.page}>
      <div className={s.libraryPanel}>
      <header className={s.libraryHeader}>
        <h1 className={s.libraryHeading}>{locale === 'am' ? 'የመዝሙር ቤተ መጻሕፍት' : 'Mezmur Library'}</h1>
      </header>

      <div className={s.toolbar}>
        <div className={s.searchRow} ref={searchWrapRef}>
          <label className={s.srOnly} htmlFor="hymn-search">
            {t('practice.searchLabel')}
          </label>
          <div className={s.searchField}>
            <input
              ref={searchInputRef}
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
            <div className={s.searchVoice}>
              <VoiceTranscriptionControl
                ariaLabel={t('practice.voiceSearchAria')}
                onTranscript={(text) => {
                  const transcript = text.trim()
                  if (!transcript) return
                  setHeardTranscript(transcript)
                  setDraftQ(transcript)
                  setSuggestOpen(false)
                  window.setTimeout(() => searchInputRef.current?.focus(), 0)
                }}
              />
            </div>
            {suggestOpen && discoveryHits.length > 0 && !showResults ? (
              <ul id={listboxId} className={s.suggestList} role="listbox">
                {discoveryHits.map((hit) => {
                  const heading = hymnSourceHeading(hit.title, hit.titleAmharic, locale)
                  return (
                  <li key={`${hit.type}-${hit.id}`} role="option" aria-selected="false">
                    <button
                      type="button"
                      className={s.suggestItem}
                      onClick={() => applyDiscoveryHit(hit)}
                    >
                      <strong lang={heading.primaryLang}>{heading.primary}</strong>
                      {heading.secondary ? (
                        <span lang={heading.secondaryLang || undefined}>{heading.secondary}</span>
                      ) : null}
                      <small>{hit.meta}</small>
                    </button>
                  </li>
                  )
                })}
              </ul>
            ) : null}
          </div>
          {draftQ || hasQuery ? (
            <button type="button" className={s.clearBtn} onClick={clearSearch}>
              {t('practice.clear')}
            </button>
          ) : null}
        </div>
      </div>

      {heardTranscript ? (
        <p className={s.browseEmpty} role="status">
          {t('practice.heard')} {heardTranscript}
        </p>
      ) : null}

      <div className={s.languageChips} role="group" aria-label={t('practice.languageFilter')}>
        <button type="button" className={language === 'all' ? s.languageChipActive : s.languageChip} aria-pressed={language === 'all'} onClick={() => selectLanguage('all')}>{t('practice.languages.all')}</button>
        {MEZMUR_LANGUAGES.map((item) => <button type="button" key={item.code} className={language === item.code ? s.languageChipActive : s.languageChip} aria-pressed={language === item.code} onClick={() => selectLanguage(item.code)}>{t(`practice.languages.${item.code}`)}</button>)}
      </div>

      {showResults ? (
        <>
          <div className={s.resultsHead}>
            <h2 className={s.browseTitle}>{resultsHeading}</h2>
            <Link to={language !== 'all' ? `/hymns?language=${encodeURIComponent(language)}` : '/hymns'} className={s.viewAll}>
              {t('practice.backToBrowse')}
            </Link>
          </div>
          {!loading && result && result.items.length > 0 && result.items.every((item) => item.similar) ? (
            <p className={s.cardMeta} role="status" data-testid="mezmur-similar-note">{t('practice.similarNote')}</p>
          ) : null}
          {!loading && sectionMatchCount > 0 ? (
            <ul className={s.suggestList} aria-label={t('practice.matchingSectionsAria')}>
              {discoveryHits
                .filter((hit) => hit.type === 'section' || hit.type === 'singer' || hit.type === 'collection')
                .slice(0, 6)
                .map((hit) => {
                  const heading = hymnSourceHeading(hit.title, hit.titleAmharic, locale)
                  return (
                  <li key={`${hit.type}-${hit.id}`}>
                    <button
                      type="button"
                      className={s.suggestItem}
                      onClick={() => applyDiscoveryHit(hit)}
                    >
                      <strong lang={heading.primaryLang}>{heading.primary}</strong>
                      {heading.secondary ? (
                        <span lang={heading.secondaryLang || undefined}>{heading.secondary}</span>
                      ) : null}
                      <small>{hit.meta}</small>
                    </button>
                  </li>
                  )
                })}
            </ul>
          ) : null}
          <MezmurResultGrid
            items={result?.items || []}
            loading={loading || !result}
            error={error}
            onRetry={() => setReloadTick((n) => n + 1)}
            emptyMessage={emptyMessage}
          />
          {language !== 'all' && result && result.total > 24 ? <nav className={s.pager} aria-label={t('practice.pagination')}>
            <button type="button" disabled={page <= 1} onClick={() => { const next = new URLSearchParams(params); next.set('page', String(page - 1)); setParams(next) }}>{t('practice.previous')}</button>
            <span>{t('practice.page', { page })}</span>
            <button type="button" disabled={page * 24 >= result.total} onClick={() => { const next = new URLSearchParams(params); next.set('page', String(page + 1)); setParams(next) }}>{t('practice.next')}</button>
          </nav> : null}
        </>
      ) : (
        <>
          {browseError ? (
            <div className={s.status} role="alert">
              <p>{browseError}</p>
              <button type="button" className={s.textBtn} onClick={() => setReloadTick((n) => n + 1)}>
                {t('practice.retry')}
              </button>
            </div>
          ) : null}

          {!browse && !browseError ? (
            <>
              <header className={s.browseHead}>
                <h2 className={s.browseTitle}>{t('practice.browse')}</h2>
              </header>
              <CollectionSkeletonGrid count={browseMode === 'occasions' ? 4 : browseMode === 'zemaris' ? 8 : 6} />
            </>
          ) : null}

          {browse && !browseError ? (
            <LibraryNavigation
              mode={browseMode}
              groups={browse}
              language={language}
              locale={locale}
              onModeChange={selectBrowseMode}
              onSearchZemaris={() => searchInputRef.current?.focus()}
              zemaris={zemaris}
              zemariTotal={zemariTotal}
              zemariLoading={zemariLoading}
              zemariError={zemariError}
              zemariHasMore={zemariHasMore}
              onShowMoreZemaris={showMoreZemaris}
            />
          ) : null}
        </>
      )}
      </div>
    </section>
  )
}
