import { useEffect, useState } from 'react'
import { Link, useParams, useSearchParams } from 'react-router-dom'
import {
  getHymnCollectionBySlug,
  getHymnSection,
  getMezmursForSection,
  type HymnCollection,
  type HymnSection,
  type HymnSectionMezmur,
} from '../lib/publicContent/hymnBrowse'
import { hymnSectionArtFallback } from '../lib/publicContent/hymnSectionArtFallbacks'
import { hymnMezmurCountLabel, hymnSourceHeading } from '../lib/publicContent/hymnBrowseLabels'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { publicMedia } from '../lib/publicContent/service'
import s from './HymnPractice.module.css'

function SectionHeroArt({
  imageUrl,
  imageAlt,
  slug,
  title,
}: {
  imageUrl?: string | null
  imageAlt?: string | null
  slug?: string | null
  title?: string
}) {
  const localFallback = hymnSectionArtFallback(slug)
  const [phase, setPhase] = useState<'primary' | 'fallback' | 'empty'>(() =>
    imageUrl ? 'primary' : localFallback ? 'fallback' : 'empty',
  )
  useEffect(() => {
    setPhase(imageUrl ? 'primary' : localFallback ? 'fallback' : 'empty')
  }, [imageUrl, localFallback])
  const src = phase === 'primary' ? imageUrl : phase === 'fallback' ? localFallback : ''
  if (!src || phase === 'empty') {
    return <div className={s.collectionArtEmpty} aria-hidden />
  }
  return (
    <img
      className={s.collectionArt}
      src={src}
      alt={imageAlt || title || ''}
      width={640}
      height={480}
      onError={() => {
        setPhase((prev) => (prev === 'primary' && localFallback ? 'fallback' : 'empty'))
      }}
    />
  )
}

function CardArt({ item }: { item: HymnSectionMezmur }) {
  const [src, setSrc] = useState('')
  const [failed, setFailed] = useState(false)
  useEffect(() => {
    let active = true
    const videoId = parseYoutubeVideoId(item.youtubeUrl || '')
    const yt = videoId ? youtubeThumbnailUrl(videoId) || '' : ''
    void publicMedia(item.thumbnailUrl)
      .then((url) => {
        if (active) setSrc(url || yt)
      })
      .catch(() => {
        if (active) setSrc(yt)
      })
    return () => {
      active = false
    }
  }, [item.thumbnailUrl, item.youtubeUrl])
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

/**
 * Level 3 — published Mezmurs linked to a hymn section.
 * Route: /practice/browse/:collectionSlug/:sectionSlug
 */
export function PublicHymnSectionPage() {
  const { collectionSlug = '', sectionSlug = '' } = useParams()
  const [params, setParams] = useSearchParams()
  const [collection, setCollection] = useState<HymnCollection | null>(null)
  const [section, setSection] = useState<HymnSection | null>(null)
  const [items, setItems] = useState<HymnSectionMezmur[]>([])
  const [total, setTotal] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [withinQ, setWithinQ] = useState(params.get('q') || '')
  const t = useTranslation()
  const { locale } = useLocale()
  const heading = hymnSourceHeading(section?.title, section?.titleAmharic, locale)
  const description = hymnSourceHeading(section?.description, section?.descriptionAmharic, locale)
  const collectionHeading = hymnSourceHeading(collection?.title, collection?.titleAmharic, locale)

  usePageMeta(heading.primary || t('practice.section'), description.primary || t('practice.metaSection'))

  useEffect(() => {
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        const col = await getHymnCollectionBySlug(collectionSlug)
        if (!active) return
        setCollection(col)
        if (!col) {
          setSection(null)
          setItems([])
          setTotal(0)
          return
        }
        const sec = await getHymnSection(collectionSlug, sectionSlug)
        if (!active) return
        setSection(sec)
        if (!sec) {
          setItems([])
          setTotal(0)
          return
        }
        const page = Math.max(1, Number(params.get('page') || '1') || 1)
        const result = await getMezmursForSection(collectionSlug, sectionSlug, {
          q: withinQ,
          page,
          pageSize: 48,
        })
        if (!active) return
        setItems(result.items)
        setTotal(result.total)
      } catch (cause) {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] section', cause)
        setError(t('practice.loadError'))
      } finally {
        if (active) setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [collectionSlug, sectionSlug, withinQ, params])

  return (
    <section className={s.page}>
      <p className={s.backRow}>
        <Link to={`/practice/browse/${collectionSlug}`} className={s.viewAll}>
          ← {collectionHeading.primary || t('practice.collection')}
        </Link>
      </p>

      {!section && !loading ? (
        <p className={s.status}>{t('practice.sectionNotFound')}</p>
      ) : (
        <>
          <header className={s.collectionHero}>
            <SectionHeroArt
              imageUrl={section?.imageUrl}
              imageAlt={section?.imageAlt}
              slug={section?.slug || sectionSlug}
              title={section?.title}
            />
            <div>
              {heading.secondary ? (
                <p className={s.collectionAm} lang={heading.secondaryLang || undefined}>
                  {heading.secondary}
                </p>
              ) : null}
              <h1 className={s.title} lang={heading.primary ? heading.primaryLang : undefined}>
                {heading.primary || '…'}
              </h1>
              {description.primary ? (
                <p className={s.subtitle} lang={description.primaryLang}>
                  {description.primary}
                </p>
              ) : null}
              <p className={s.collectionCount}>
                {section ? hymnMezmurCountLabel(section.mezmurCount || total, locale) : ''}
              </p>
            </div>
          </header>

          <label className={s.withinSearch}>
            <span className={s.srOnly}>{t('practice.searchWithinSection')}</span>
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
                name: heading.primary || t('practice.section'),
              })}
            />
          </label>

          {loading ? (
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
          ) : null}
          {error ? (
            <div className={s.status} role="alert">
              <p>{error}</p>
            </div>
          ) : null}
          {!loading && !error && !items.length ? (
            <p className={s.status}>{t('practice.noHymnsInSection')}</p>
          ) : null}

          <div className={s.grid}>
            {items.map((item) => {
              const itemHeading = hymnSourceHeading(item.title, item.titleAmharic, locale)
              return (
                <Link key={item.id} to={`/practice/mezmur/${item.slug}`} className={s.card}>
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
                    <p className={s.cardMeta}>{item.singerName || t('mezmurPractice.library.mezmur')}</p>
                  </div>
                </Link>
              )
            })}
          </div>
        </>
      )}
    </section>
  )
}
