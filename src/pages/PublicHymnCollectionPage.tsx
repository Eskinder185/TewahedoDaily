import { useEffect, useMemo, useState } from 'react'
import { Link, useParams, useSearchParams } from 'react-router-dom'
import { pageNumber, PAGE_SIZE, type MezmurCard } from '../lib/publicContent/service'
import {
  loadHymnBrowseIndex,
  getZemariPublicBySlug,
  listPublishedMezmursForZemari,
  type HymnBrowseCard,
  type HymnBrowseKind,
} from '../lib/publicContent/hymnBrowse'
import { hymnCardMeta } from '../lib/publicContent/labels'
import { hymnMezmurCountLabel, hymnSourceHeading } from '../lib/publicContent/hymnBrowseLabels'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { publicMedia } from '../lib/publicContent/service'
import s from './HymnPractice.module.css'
import { isMezmurLanguageFilter, normalizeMezmurLanguage, mezmurLanguageLabel, type MezmurLanguageCode, type MezmurLanguageFilter } from '../lib/mezmur/mezmurLanguage'
import { HymnBrowseCardView } from '../components/practice/HymnBrowseCard'
import { ZemariSupportLinks } from '../components/practice/ZemariSupportLinks'

function CardArt({ item }: { item: MezmurCard }) {
  const [src, setSrc] = useState('')
  const [failed, setFailed] = useState(false)
  useEffect(() => {
    let active = true
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
  if (!src || failed) return <div className={s.art} aria-hidden>✣</div>
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

type CollectionMode = HymnBrowseKind | 'occasions' | 'categories' | 'singers'

function modeFromPath(pathname: string, paramKind?: string): CollectionMode {
  if (paramKind === 'occasion' || pathname.includes('/occasion/')) return 'occasion'
  if (paramKind === 'category' || pathname.includes('/category/')) return 'category'
  if (
    paramKind === 'singer' ||
    pathname.includes('/singer/') ||
    pathname.includes('/zemari/')
  ) {
    return 'singer'
  }
  if (pathname.endsWith('/occasions')) return 'occasions'
  if (pathname.endsWith('/categories')) return 'categories'
  if (pathname.endsWith('/singers') || pathname.endsWith('/zemaris')) return 'singers'
  return 'occasions'
}

/**
 * Focused collection page for an occasion / category / singer,
 * or an index of all browse cards of one kind.
 */
export function PublicHymnCollectionPage({
  kind: kindProp,
}: {
  kind?: CollectionMode
}) {
  const { slug = '' } = useParams()
  const [params, setParams] = useSearchParams()
  const kind = kindProp || modeFromPath(window.location.pathname)
  const isIndex = kind === 'occasions' || kind === 'categories' || kind === 'singers'
  const detailKind: HymnBrowseKind =
    kind === 'occasions' || kind === 'occasion'
      ? 'occasion'
      : kind === 'categories' || kind === 'category'
        ? 'category'
        : 'singer'

  const [group, setGroup] = useState<HymnBrowseCard | null>(null)
  const [allCards, setAllCards] = useState<HymnBrowseCard[]>([])
  const [items, setItems] = useState<MezmurCard[]>([])
  const [total, setTotal] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [withinQ, setWithinQ] = useState(params.get('q') || '')
  const t = useTranslation()
  const { locale } = useLocale()
  const detailHeading = hymnSourceHeading(group?.name, group?.nameAmharic, locale)
  const detailDescription = hymnSourceHeading(group?.description, group?.descriptionAmharic, locale)

  const title = isIndex
    ? kind === 'occasions'
      ? t('practice.allOccasions')
      : kind === 'categories'
        ? t('practice.allCategories')
        : t('practice.allZemari')
    : detailHeading.primary || t('practice.title')

  const page = pageNumber(params)
  const langParam = params.get('language')
  const language: MezmurLanguageFilter | null = isMezmurLanguageFilter(langParam) ? langParam : null

  usePageMeta(title, detailDescription.primary || t('practice.metaCollection'))

  useEffect(() => {
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        if (detailKind === 'singer' && !isIndex) {
          const found = await getZemariPublicBySlug(slug)
          if (!active) return
          setGroup(found)
          setAllCards([])
          if (!found) setLoading(false)
          return
        }

        const index = await loadHymnBrowseIndex(language || undefined)
        if (!active) return
        const list =
          detailKind === 'occasion'
            ? index.occasions
            : detailKind === 'category'
              ? index.categories
              : index.singers
        setAllCards(list)
        if (!isIndex) {
          const found = list.find((c) => c.slug === slug) || null
          setGroup(found)
        } else {
          setLoading(false)
        }
      } catch {
        if (!active) return
        setError(t('practice.loadError'))
        setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [detailKind, isIndex, slug, t, language])

  const filterKey = useMemo(() => {
    if (isIndex || !group) return ''
    const next = new URLSearchParams()
    if (withinQ.trim()) next.set('q', withinQ.trim())
    if (language) next.set('language', language)
    if (detailKind === 'occasion') next.set('occasion', group.name)
    if (detailKind === 'category') next.set('category', group.name)
    if (detailKind === 'singer') next.set('singer', group.id)
    next.set('page', String(page))
    return next.toString()
  }, [detailKind, group, isIndex, page, withinQ, language])

  useEffect(() => {
    if (isIndex || !group) return
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        let rows: (MezmurCard & { zemari_id?: string | null })[] = []

        if (detailKind === 'singer') {
          const linked = await listPublishedMezmursForZemari(group.id)
          rows = linked.map((row) => ({
            id: row.id,
            slug: row.slug,
            title: row.title,
            title_amharic: row.title_amharic,
            thumbnail_url: row.thumbnail_url,
            audio_url: null as string | null,
            youtube_url: row.youtube_url,
            featured: false,
            published_at: null as string | null,
            created_at: '',
            singer_name: row.singer_name,
            zemari_id: group.id,
            category_name: null as string | null,
            languages: row.language ? [row.language] : [],
            form: (row.form as MezmurCard['form']) || null,
            language: row.language,
            category: null as string | null,
            occasion: null as string | null,
            saint_or_angel: null as string | null,
            themes: [] as string[],
          }))
        } else {
          const { listImportMezmurCards } = await import('../lib/publicContent/hymnBrowse')
          const { supabase } = await import('../lib/supabase/client')
          const cards = await listImportMezmurCards()
          rows = cards.map((row) => ({
            id: row.id,
            slug: row.slug,
            title: row.title,
            title_amharic: row.title_amharic,
            thumbnail_url: row.thumbnail_url,
            audio_url: null as string | null,
            youtube_url: row.youtube_url,
            featured: false,
            published_at: null as string | null,
            created_at: '',
            singer_name: row.singer_name,
            zemari_id: row.zemari_id,
            category_name: null as string | null,
            languages: row.language ? [row.language] : [],
            form: (row.form as MezmurCard['form']) || null,
            language: row.language,
            category: null as string | null,
            occasion: null as string | null,
            saint_or_angel: null as string | null,
            themes: [] as string[],
          })) as (MezmurCard & { zemari_id?: string | null })[]

          if (detailKind === 'occasion' && supabase) {
            // supabase.from('mezmur_category_links_public' as never).select('mezmur_id')
            const { fetchAllOccasionLinks, COLLECTION_TAXONOMY_MAP } = await import('../lib/publicContent/hymnBrowse')
            const allLinks = await fetchAllOccasionLinks()
            const targetSlugs = new Set<string>([group.slug])
            const mappedOccasions = COLLECTION_TAXONOMY_MAP[group.slug]?.occasions
            if (mappedOccasions) {
              for (const occ of mappedOccasions) targetSlugs.add(occ)
            }
            const matchingLinks = allLinks.filter((l) => targetSlugs.has(l.occasion_slug))
            const allowedImportIds = new Set<string>()
            const allowedSlugs = new Set<string>()
            const allowedMezmurIds = new Set<string>()
            for (const l of matchingLinks) {
              if (l.mezmur_import_id) allowedImportIds.add(l.mezmur_import_id)
              if (l.mezmur_slug) allowedSlugs.add(l.mezmur_slug)
              if (l.mezmur_id) allowedMezmurIds.add(l.mezmur_id)
            }
            rows = rows.filter((item) =>
              (item.id && (allowedImportIds.has(item.id) || allowedMezmurIds.has(item.id))) ||
              (item.slug && allowedSlugs.has(item.slug))
            )
          } else if (detailKind === 'category' && supabase) {
            // supabase.from('mezmur_category_links_public' as never).select('mezmur_id')
            const { fetchAllCategoryLinks, COLLECTION_TAXONOMY_MAP } = await import('../lib/publicContent/hymnBrowse')
            const allLinks = await fetchAllCategoryLinks()
            const targetSlugs = new Set<string>([group.slug])
            const mappedCategories = COLLECTION_TAXONOMY_MAP[group.slug]?.categories
            if (mappedCategories) {
              for (const cat of mappedCategories) targetSlugs.add(cat)
            }
            const matchingLinks = allLinks.filter((l) => targetSlugs.has(l.category_slug))
            const allowedImportIds = new Set<string>()
            const allowedSlugs = new Set<string>()
            const allowedMezmurIds = new Set<string>()
            for (const l of matchingLinks) {
              if (l.mezmur_import_id) allowedImportIds.add(l.mezmur_import_id)
              if (l.mezmur_slug) allowedSlugs.add(l.mezmur_slug)
              if (l.mezmur_id) allowedMezmurIds.add(l.mezmur_id)
            }
            rows = rows.filter((item) =>
              (item.id && (allowedImportIds.has(item.id) || allowedMezmurIds.has(item.id))) ||
              (item.slug && allowedSlugs.has(item.slug))
            )
          }
        }

        if (withinQ.trim()) {
          const q = withinQ.trim().toLowerCase()
          rows = rows.filter((item) =>
            `${item.title} ${item.title_amharic || ''} ${item.singer_name || ''}`
              .toLowerCase()
              .includes(q),
          )
        }
        if (language) rows = rows.filter((item) => normalizeMezmurLanguage(item.language) === language)
        if (!active) return
        const from = (page - 1) * PAGE_SIZE
        setItems(rows.slice(from, from + PAGE_SIZE))
        setTotal(rows.length)
        setLoading(false)
      } catch (cause) {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] collection hymns', cause)
        setError(t('practice.loadError'))
        setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [detailKind, filterKey, group, isIndex, page, t, withinQ, language])

  if (isIndex) {
    return (
      <section className={s.page}>
        <p className={s.backRow}>
          <Link to={language ? `/hymns?language=${encodeURIComponent(language)}` : '/hymns'} className={s.viewAll}>
            ← {t('practice.backToHymns')}
          </Link>
        </p>
        <header className={s.intro}>
          <p className={s.eyebrow}>
            {kind === 'categories' ? t('practice.category') : kind === 'singers' ? t('practice.allZemari') : t('practice.collection')}
          </p>
          <h1 className={s.title}>{title}</h1>
        </header>
        {loading ? <p className={s.status}>{t('practice.loadingHymns')}</p> : null}
        {error ? (
          <p className={s.status} role="alert">
            {error}
          </p>
        ) : null}
        {!loading && !error && allCards.length === 0 ? (
          <p className={s.browseEmpty}>
            {kind === 'singers' ? t('practice.zemariEmpty') : t('practice.browseListEmpty')}{' '}
            <Link to="/hymns">{t('practice.backToHymns')}</Link>
          </p>
        ) : null}
        <div className={s.browseGrid}>
          {allCards.map((card) => (
            <HymnBrowseCardView key={card.id} card={{ ...card, href: language ? `${card.href}${card.href.includes('?') ? '&' : '?'}language=${encodeURIComponent(language)}` : card.href }} />
          ))}
        </div>
        {!loading && !error && kind === 'singers' && allCards.length > 0 && allCards.length < 4 ? (
          <p className={s.browseEmpty}>{t('practice.zemariGrowing')}</p>
        ) : null}
      </section>
    )
  }

  return (
    <section className={s.page}>
      <p className={s.backRow}>
          <Link to={language ? `/hymns?language=${encodeURIComponent(language)}` : '/hymns'} className={s.viewAll}>
          ← {t('practice.backToHymns')}
        </Link>
      </p>

      {!group && !loading ? (
        <p className={s.status}>{t('practice.collectionNotFound')}</p>
      ) : (
        <>
          <header className={s.collectionHero}>
            {group?.imageUrl ? (
              <img
                className={s.collectionArt}
                src={group.imageUrl}
                alt={group.imageAlt || group.name}
                width={640}
                height={480}
              />
            ) : (
              <div className={s.collectionArtEmpty} aria-hidden>
                {(group?.name || '?').trim().charAt(0).toUpperCase()}
              </div>
            )}
            <div>
              {detailHeading.secondary ? (
                <p className={s.collectionAm} lang={detailHeading.secondaryLang || undefined}>
                  {detailHeading.secondary}
                </p>
              ) : null}
              <h1 className={s.title} lang={detailHeading.primary ? detailHeading.primaryLang : undefined}>
                {detailHeading.primary || '…'}
              </h1>
              {detailDescription.primary ? (
                <p className={s.subtitle} lang={detailDescription.primaryLang}>
                  {detailDescription.primary}
                </p>
              ) : detailKind === 'singer' ? (
                <p className={s.subtitle}>{t('practice.singerNotesPending')}</p>
              ) : null}
              <p className={s.collectionCount}>
                {group ? hymnMezmurCountLabel(group.mezmurCount, locale) : ''}
              </p>
            </div>
          </header>

          {detailKind === 'singer' && group ? (
            <ZemariSupportLinks singerName={group.name} links={group.socialLinks || {}} />
          ) : null}

          <label className={s.withinSearch}>
            <span className={s.srOnly}>{t('practice.searchWithin')}</span>
            <input
              className={s.searchInput}
              value={withinQ}
              onChange={(e) => {
                setWithinQ(e.target.value)
                const next = new URLSearchParams(params)
                if (e.target.value.trim()) next.set('q', e.target.value.trim())
                else next.delete('q')
                next.delete('page')
                setParams(next, { replace: true })
              }}
              placeholder={t('practice.searchWithinNamed', {
                name: detailHeading.primary || t('practice.collection'),
              })}
            />
          </label>

          {loading ? <p className={s.status}>{t('practice.loadingHymns')}</p> : null}
          {error ? (
            <p className={s.status} role="alert">
              {error}
            </p>
          ) : null}
          {!loading && !items.length ? (
            <div className={s.status} role="status">
              <p>{language ? `No ${mezmurLanguageLabel(language as MezmurLanguageCode)} Mezmurs found in this collection.` : t('practice.noHymnsInCollection')}</p>
              {language ? (
                <button
                  type="button"
                  className={s.textBtn}
                  onClick={() => {
                    const next = new URLSearchParams(params)
                    next.delete('language')
                    next.delete('page')
                    setParams(next)
                  }}
                >
                  View in All languages
                </button>
              ) : null}
            </div>
          ) : null}

          {total > 0 ? (
            <p className={s.hint}>
              Showing {Math.min((page - 1) * PAGE_SIZE + 1, total)}–{Math.min(page * PAGE_SIZE, total)} of {total} Mezmurs
            </p>
          ) : null}

          <div className={s.grid}>
            {items.map((item) => {
              const itemHeading = hymnSourceHeading(item.title, item.title_amharic, locale)
              return (
                <Link key={item.id} to={language ? `/hymns/mezmur/${item.slug}?language=${encodeURIComponent(language)}` : `/hymns/mezmur/${item.slug}`} className={s.card}>
                  <CardArt item={item} />
                  <div className={s.cardBody}>
                    {itemHeading.secondary ? (
                      <p className={s.cardAm} lang={itemHeading.secondaryLang || undefined}>
                        {itemHeading.secondary}
                      </p>
                    ) : null}
                    <h2 className={s.cardTitle} lang={itemHeading.primaryLang}>
                      {itemHeading.primary}
                    </h2>
                    <p className={s.cardMeta}>{hymnCardMeta(item, locale)}</p>
                  </div>
                </Link>
              )
            })}
          </div>

          {total > PAGE_SIZE ? (
            <nav className={s.pager} aria-label={t('practice.pagination')}>
              <button
                type="button"
                disabled={page <= 1}
                onClick={() => {
                  const next = new URLSearchParams(params)
                  next.set('page', String(page - 1))
                  setParams(next)
                }}
              >
                {t('practice.previous')}
              </button>
              <span>{t('practice.page', { page })}</span>
              <button
                type="button"
                disabled={page * PAGE_SIZE >= total}
                onClick={() => {
                  const next = new URLSearchParams(params)
                  next.set('page', String(page + 1))
                  setParams(next)
                }}
              >
                {t('practice.next')}
              </button>
            </nav>
          ) : null}
        </>
      )}
    </section>
  )
}
