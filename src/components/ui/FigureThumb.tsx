import styles from './FigureThumb.module.css'

type Props = {
  src: string
  /** Use empty string for decorative thumbnails when visible text labels the image nearby. */
  alt: string
  className?: string
}

/**
 * Rounded cover image for cards and section rails — consistent `object-fit` and crop.
 */
export function FigureThumb({ src, alt, className }: Props) {
  return (
    <div className={`${styles.wrap} ${className ?? ''}`}>
      <img
        src={src}
        alt={alt}
        className={styles.img}
        loading="lazy"
        decoding="async"
      />
    </div>
  )
}
