import { Link } from 'react-router-dom'
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
  | (PracticeMediaCardBase & {
      onSelect: () => void
      externalHref?: undefined
      internalHref?: undefined
      copyHref?: undefined
      onCopyLink?: undefined
      onOpen?: undefined
    })
  | (PracticeMediaCardBase & {
      externalHref: string
      onSelect?: undefined
      internalHref?: undefined
      copyHref?: undefined
      onCopyLink?: undefined
      onOpen?: undefined
    })
  | (PracticeMediaCardBase & {
      internalHref: string
      copyHref?: string
      onCopyLink?: () => void
      onOpen?: () => void
      onSelect?: undefined
      externalHref?: undefined
    })

export function PracticeMediaCard({
  title,
  imageUrl,
  onSelect,
  externalHref,
  internalHref,
  copyHref,
  onCopyLink,
  onOpen,
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
            width={1280}
            height={720}
            sizes="(max-width: 640px) 92vw, min(280px, 30vw)"
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

  if (internalHref) {
    const copyLink = async () => {
      if (!copyHref) return
      try {
        await navigator.clipboard.writeText(copyHref)
        onCopyLink?.()
      } catch {
        window.prompt('Copy mezmur link', copyHref)
      }
    }

    return (
      <article className={styles.cardShell}>
        <Link
          to={internalHref}
          className={styles.card}
          aria-label={`${t('open')} ${title}`}
          onClick={onOpen}
        >
          {inner}
        </Link>
        <div className={styles.actions}>
          <Link to={internalHref} className={styles.openLink} onClick={onOpen}>
            Open
          </Link>
          {copyHref ? (
            <button type="button" className={styles.copyBtn} onClick={copyLink}>
              Copy Link
            </button>
          ) : null}
        </div>
      </article>
    )
  }

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
