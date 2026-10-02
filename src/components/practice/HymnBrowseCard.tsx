import { Link } from 'react-router-dom'
import type { HymnBrowseCard, HymnMajorBrowseGroup } from '../../lib/publicContent/hymnBrowse'
import styles from './HymnBrowseCard.module.css'

export type HymnBrowseCardProps = {
  card: HymnBrowseCard
  /** Prefer eager for above-the-fold featured rows. */
  priority?: boolean
}

/**
 * Shared Category / Occasion / Singer browse card for Hymns Practice.
 */
export function HymnBrowseCardView({ card, priority = false }: HymnBrowseCardProps) {
  const countLabel = `${card.mezmurCount} Mezmur${card.mezmurCount === 1 ? '' : 's'}`
  return (
    <Link
      to={card.href}
      className={styles.card}
      aria-label={`${card.nameAmharic ? `${card.nameAmharic}, ` : ''}${card.name}, ${countLabel}`}
    >
      <div className={styles.media} data-empty={!card.imageUrl || undefined}>
        {card.imageUrl ? (
          <img
            src={card.imageUrl}
            alt={card.imageAlt || ''}
            className={styles.image}
            loading={priority ? 'eager' : 'lazy'}
            decoding="async"
            width={640}
            height={480}
          />
        ) : (
          <div className={styles.placeholder} aria-hidden>
            <span className={styles.placeholderMark}>✣</span>
          </div>
        )}
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
  return (
    <Link
      to={group.href}
      className={styles.card}
      aria-label={`${group.titleAmharic ? `${group.titleAmharic}, ` : ''}${group.title}`}
    >
      <div className={styles.media} data-empty={!group.imageUrl || undefined}>
        {group.imageUrl ? (
          <img
            src={group.imageUrl}
            alt={group.imageAlt || ''}
            className={styles.image}
            loading={priority ? 'eager' : 'lazy'}
            decoding="async"
            width={640}
            height={480}
          />
        ) : (
          <div className={styles.placeholder} aria-hidden>
            <span className={styles.placeholderMark}>✣</span>
          </div>
        )}
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
