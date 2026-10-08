import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { responsiveImageAttrs } from '../../lib/media/responsiveImage'
import styles from './PracticeMediaCard.module.css'

const THUMB_SIZES = '(max-width: 640px) 92vw, min(280px, 30vw)'

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
  const tt = useTranslation()
  const ariaWatchExternal = `${t('watch')} ${title} - ${t('opensInNewTab')}`
  const imageAttrs = imageUrl
    ? responsiveImageAttrs(imageUrl, {
        sizes: THUMB_SIZES,
        width: 640,
        height: 360,
      })
    : null

  const inner = (
    <>
      <div className={styles.thumbWrap}>
        {imageUrl ? (
          <img
            className={styles.thumb}
            src={imageAttrs?.src || imageUrl}
            srcSet={imageAttrs?.srcSet}
            alt=""
            width={imageAttrs?.width || 640}
            height={imageAttrs?.height || 360}
            sizes={imageAttrs?.sizes || THUMB_SIZES}
            loading={imageAttrs?.loading || 'lazy'}
            decoding="async"
            fetchPriority={imageAttrs?.fetchPriority}
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
        window.prompt(tt('mezmurPractice.library.copyPrompt'), copyHref)
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
            {tt('mezmurPractice.library.open')}
          </Link>
          {copyHref ? (
            <button type="button" className={styles.copyBtn} onClick={copyLink}>
              {tt('mezmurPractice.library.copyLink')}
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
