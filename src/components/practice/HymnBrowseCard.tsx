import { useState } from 'react'
import { Link } from 'react-router-dom'
import type { HymnBrowseCard, HymnMajorBrowseGroup } from '../../lib/publicContent/hymnBrowse'
import { hymnSectionArtFallback } from '../../lib/publicContent/hymnSectionArtFallbacks'
import { responsiveImageAttrs } from '../../lib/media/responsiveImage'
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
  const countLabel = `${card.mezmurCount} Mezmur${card.mezmurCount === 1 ? '' : 's'}`
  const showMedia = Boolean(card.imageUrl) || Boolean(hymnSectionArtFallback(card.slug))
  return (
    <Link
      to={card.href}
      className={styles.card}
      aria-label={`${card.nameAmharic ? `${card.nameAmharic}, ` : ''}${card.name}, ${countLabel}`}
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
        {card.nameAmharic ? (
          <p className={styles.amharic} lang="am">
            {card.nameAmharic}
          </p>
        ) : null}
        <h3 className={styles.title}>{card.name}</h3>
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
  const countLabel =
    group.mezmurCount > 0
      ? `${group.mezmurCount} Mezmur${group.mezmurCount === 1 ? '' : 's'}`
      : 'Browse'
  const showMedia = Boolean(group.imageUrl)
  return (
    <Link
      to={group.href}
      className={styles.card}
      aria-label={`${group.titleAmharic ? `${group.titleAmharic}, ` : ''}${group.title}`}
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
        {group.titleAmharic ? (
          <p className={styles.amharic} lang="am">
            {group.titleAmharic}
          </p>
        ) : null}
        <h3 className={styles.title}>{group.title}</h3>
        {group.description ? <p className={styles.description}>{group.description}</p> : null}
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
