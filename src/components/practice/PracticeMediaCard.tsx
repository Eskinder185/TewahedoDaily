import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './PracticeMediaCard.module.css'

type PracticeMediaCardBase = {
  title: string
  /** Omit for a calm gradient placeholder (e.g. werb without a clip yet). */
  imageUrl?: string
  tag?: string
  subtitle?: string
  /** Short meaning line when available from data (no lyrics rewrite). */
  teaserLine?: string
}

export type PracticeMediaCardProps =
  | (PracticeMediaCardBase & { onSelect: () => void; externalHref?: undefined })
  | (PracticeMediaCardBase & { externalHref: string; onSelect?: undefined })

export function PracticeMediaCard({
  title,
  imageUrl,
  onSelect,
  externalHref,
  tag,
  subtitle,
  teaserLine,
}: PracticeMediaCardProps) {
  const t = useUiLabel()
  const ariaWatchExternal = `${t('watch')} ${title} — ${t('opensInNewTab')}`

  const inner = (
    <>
      <div className={styles.thumbWrap}>
        {imageUrl ? (
          <img
            className={styles.thumb}
            src={imageUrl}
            alt=""
            loading="lazy"
            decoding="async"
          />
        ) : (
          <div className={styles.thumbPh} aria-hidden />
        )}
        <span className={styles.scrim} aria-hidden />
        {tag ? <span className={styles.tag}>{tag}</span> : null}
      </div>
      <span className={styles.title}>{title}</span>
      {subtitle ? <span className={styles.subtitle}>{subtitle}</span> : null}
      {teaserLine ? <span className={styles.teaser}>{teaserLine}</span> : null}
    </>
  )

  if (externalHref) {
    return (
      <a
        href={externalHref}
        className={styles.card}
        target="_blank"
        rel="noopener noreferrer"
        aria-label={ariaWatchExternal}
      >
        {inner}
      </a>
    )
  }

  return (
    <button
      type="button"
      className={styles.card}
      onClick={onSelect}
      aria-label={`${t('open')} ${title}`}
    >
      {inner}
    </button>
  )
}
