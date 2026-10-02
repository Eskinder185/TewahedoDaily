import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import {
  getHymnCollectionBySlug,
  loadBrowseGroupChildren,
  type HymnBrowseCard,
  type HymnCollection,
} from '../lib/publicContent/hymnBrowse'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
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

  usePageMeta(
    group?.title || 'Browse hymns',
    group?.description || 'Browse Ethiopian Orthodox Mezmur collections.',
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
        setError('Unable to load Hymn Practice.')
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
          ← Hymns Practice
        </Link>
      </p>

      <header className={s.intro}>
        <p className={s.eyebrow}>Collection</p>
        {group?.titleAmharic ? (
          <p className={s.subtitle} lang="am">
            {group.titleAmharic}
          </p>
        ) : null}
        <h1 className={s.title}>{group?.title || (loading ? '…' : 'Not found')}</h1>
        {group?.description ? <p className={s.subtitle}>{group.description}</p> : null}
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
            Retry
          </button>
        </div>
      ) : null}

      {!loading && !error && group && !children.length ? (
        <p className={s.browseEmpty}>
          No published sections in this collection yet. Try search from{' '}
          <Link to="/practice">Hymns Practice</Link>.
        </p>
      ) : null}

      {!loading && !error && !group ? (
        <p className={s.status}>Collection not found.</p>
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
