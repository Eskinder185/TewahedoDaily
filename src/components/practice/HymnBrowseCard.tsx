import { useState } from 'react'
import { Link } from 'react-router-dom'
import type { HymnBrowseCard, HymnMajorBrowseGroup } from '../../lib/publicContent/hymnBrowse'
import { hymnMezmurCountLabel, hymnSourceHeading } from '../../lib/publicContent/hymnBrowseLabels'
import { hymnSectionArtFallback } from '../../lib/publicContent/hymnSectionArtFallbacks'
import { responsiveImageAttrs } from '../../lib/media/responsiveImage'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import { prefetchRoute } from '../../lib/routePrefetch'
import styles from './HymnBrowseCard.module.css'

const BROWSE_SIZES = '(max-width: 430px) 92vw, (max-width: 768px) 44vw, 280px'

export type HymnBrowseCardProps = {
  card: HymnBrowseCard
  /** Prefer eager for above-the-fold featured rows. */
  priority?: boolean
}

function BrowseCardMedia({
  imageUrl,
  imageAlt,
  slug,
  priority,
}: {
  imageUrl: string
  imageAlt?: string | null
  slug?: string | null
  priority?: boolean
}) {
  const localFallback = hymnSectionArtFallback(slug)
  const [phase, setPhase] = useState<'primary' | 'fallback' | 'empty'>(() =>
    imageUrl ? 'primary' : localFallback ? 'fallback' : 'empty',
  )

  const src =
    phase === 'primary' ? imageUrl : phase === 'fallback' ? localFallback : ''

  if (!src || phase === 'empty') {
    return (
      <div className={styles.placeholder} aria-hidden>
        <span className={styles.placeholderMark}>✣</span>
      </div>
    )
  }

  const attrs = responsiveImageAttrs(src, {
    sizes: BROWSE_SIZES,
    width: 640,
    height: 480,
    priority,
  })

  return (
    <img
      src={attrs?.src || src}
      srcSet={attrs?.srcSet}
      sizes={attrs?.sizes || BROWSE_SIZES}
      alt={imageAlt || ''}
      className={styles.image}
      loading={attrs?.loading || (priority ? 'eager' : 'lazy')}
      decoding="async"
      width={attrs?.width || 640}
      height={attrs?.height || 480}
      fetchPriority={attrs?.fetchPriority}
      onError={() => {
        setPhase((prev) => {
          if (prev === 'primary' && localFallback) return 'fallback'
          return 'empty'
        })
      }}
    />
  )
}

/**
 * Shared Category / Occasion / Singer browse card for Hymns Practice.
 */
export function HymnBrowseCardView({ card, priority = false }: HymnBrowseCardProps) {
  const { locale } = useLocale()
  const heading = hymnSourceHeading(card.name, card.nameAmharic, locale)
  const countLabel = hymnMezmurCountLabel(card.mezmurCount, locale)
  const showMedia = Boolean(card.imageUrl) || Boolean(hymnSectionArtFallback(card.slug))
  return (
    <Link
      to={card.href}
      className={styles.card}
      aria-label={`${heading.primary}, ${countLabel}`}
      onPointerEnter={() => prefetchRoute(card.href)}
      onPointerDown={() => prefetchRoute(card.href)}
    >
      <div className={styles.media} data-empty={!showMedia || undefined}>
        <BrowseCardMedia
          imageUrl={card.imageUrl}
          imageAlt={card.imageAlt}
          slug={card.slug}
          priority={priority}
        />
      </div>
      <div className={styles.body}>
        {heading.secondary ? (
          <p className={styles.amharic} lang={heading.secondaryLang || undefined}>
            {heading.secondary}
          </p>
        ) : null}
        <h3 className={styles.title} lang={heading.primaryLang}>
          {heading.primary}
        </h3>
        <div className={styles.meta}>
          <span className={styles.count}>{countLabel}</span>
          <span className={styles.arrow} aria-hidden>
            →
          </span>
        </div>
      </div>
    </Link>
  )
}

/** Level-1 major browse group card. */
export function HymnMajorBrowseCardView({
  group,
  priority = false,
}: {
  group: HymnMajorBrowseGroup
  priority?: boolean
}) {
  const t = useTranslation()
  const { locale } = useLocale()
  const heading = hymnSourceHeading(group.title, group.titleAmharic, locale)
  const description = hymnSourceHeading(group.description, group.descriptionAmharic, locale)
  const countLabel =
    group.mezmurCount > 0 ? hymnMezmurCountLabel(group.mezmurCount, locale) : t('practice.browse')
  const showMedia = Boolean(group.imageUrl)
  return (
    <Link
      to={group.href}
      className={styles.card}
      aria-label={`${heading.primary}${description.primary ? `, ${description.primary}` : ''}, ${countLabel}`}
      onPointerEnter={() => prefetchRoute(group.href)}
      onPointerDown={() => prefetchRoute(group.href)}
    >
      <div className={styles.media} data-empty={!showMedia || undefined}>
        <BrowseCardMedia
          imageUrl={group.imageUrl}
          imageAlt={group.imageAlt}
          slug={group.slug}
          priority={priority}
        />
      </div>
      <div className={styles.body}>
        {heading.secondary ? (
          <p className={styles.amharic} lang={heading.secondaryLang || undefined}>
            {heading.secondary}
          </p>
        ) : null}
        <h3 className={styles.title} lang={heading.primaryLang}>
          {heading.primary}
        </h3>
        {description.primary ? (
          <p className={styles.description} lang={description.primaryLang}>
            {description.primary}
          </p>
        ) : null}
        <div className={styles.meta}>
          <span className={styles.count}>{countLabel}</span>
          <span className={styles.arrow} aria-hidden>
            →
          </span>
        </div>
      </div>
    </Link>
  )
}
