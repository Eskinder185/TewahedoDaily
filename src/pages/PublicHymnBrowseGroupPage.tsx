import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import {
  getHymnCollectionBySlug,
  loadBrowseGroupChildren,
  type HymnBrowseCard,
  type HymnCollection,
} from '../lib/publicContent/hymnBrowse'
import { hymnSourceHeading } from '../lib/publicContent/hymnBrowseLabels'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { HymnBrowseCardView } from '../components/practice/HymnBrowseCard'
import s from './HymnPractice.module.css'

/**
 * Level 2 — sections under a hymn collection.
 * Route: /practice/browse/:collectionSlug  (and /hymns/browse/:collectionSlug)
 */
export function PublicHymnBrowseGroupPage() {
  const { slug = '' } = useParams()
  const [group, setGroup] = useState<HymnCollection | null>(null)
  const [children, setChildren] = useState<HymnBrowseCard[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const t = useTranslation()
  const { locale } = useLocale()
  const heading = hymnSourceHeading(group?.title, group?.titleAmharic, locale)
  const description = hymnSourceHeading(group?.description, group?.descriptionAmharic, locale)

  usePageMeta(
    heading.primary || t('practice.browse'),
    description.primary || t('practice.metaBrowse'),
  )

  useEffect(() => {
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        const collection = await getHymnCollectionBySlug(slug)
        if (!active) return
        setGroup(collection)
        if (!collection) {
          setChildren([])
          return
        }
        const { children: next } = await loadBrowseGroupChildren(collection.slug)
        if (!active) return
        setChildren(next)
      } catch (cause) {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] collection', cause)
        setError(t('practice.loadError'))
      } finally {
        if (active) setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [slug, reloadTick])

  return (
    <section className={s.page}>
      <p className={s.backRow}>
        <Link to="/practice" className={s.viewAll}>
          ← {t('practice.title')}
        </Link>
      </p>

      <header className={s.intro}>
        <p className={s.eyebrow}>{t('practice.collection')}</p>
        {heading.secondary ? (
          <p className={s.subtitle} lang={heading.secondaryLang || undefined}>
            {heading.secondary}
          </p>
        ) : null}
        <h1 className={s.title} lang={heading.primary ? heading.primaryLang : undefined}>
          {heading.primary || (loading ? '…' : t('practice.notFound'))}
        </h1>
        {description.primary ? (
          <p className={s.subtitle} lang={description.primaryLang}>
            {description.primary}
          </p>
        ) : null}
      </header>

      {loading ? (
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
      ) : null}

      {error ? (
        <div className={s.status} role="alert">
          <p>{error}</p>
          <button type="button" className={s.textBtn} onClick={() => setReloadTick((n) => n + 1)}>
            {t('practice.retry')}
          </button>
        </div>
      ) : null}

      {!loading && !error && group && !children.length ? (
        <p className={s.browseEmpty}>
          {t('practice.noSections')} <Link to="/practice">{t('practice.title')}</Link>
        </p>
      ) : null}

      {!loading && !error && !group ? (
        <p className={s.status}>{t('practice.collectionNotFound')}</p>
      ) : null}

      {!loading && children.length > 0 ? (
        <div className={s.browseGrid}>
          {children.map((card, index) => (
            <HymnBrowseCardView key={card.id} card={card} priority={index < 3} />
          ))}
        </div>
      ) : null}
    </section>
  )
}
