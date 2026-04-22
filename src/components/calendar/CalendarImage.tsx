import { useCallback, useState } from 'react'

type Props = {
  src: string
  fallbackSrc: string
  alt?: string
  className?: string
  /** Optional fit mode override for framed slots. */
  objectFit?: 'cover' | 'contain'
  /** Optional crop anchor, e.g. `50% 35%` */
  objectPosition?: string
  /** Default `lazy`. Use `eager` for above-the-fold liturgical hero when it carries immediate meaning. */
  loading?: 'lazy' | 'eager'
  /** Hint scheduling; use `low` for decorative art, `high` for primary day hero. */
  fetchPriority?: 'high' | 'low' | 'auto'
  /** Responsive hint for the browser pick of image bytes (when multiple resolutions exist later). */
  sizes?: string
  /** Intrinsic dimensions reduce layout shift before paint. */
  width?: number
  height?: number
}

/**
 * Calendar art can ship as PNG or JPG depending on bundle; swap once on error
 * so cards never sit on a broken thumbnail.
 */
export function CalendarImage({
  src,
  fallbackSrc,
  alt = '',
  className,
  objectFit,
  objectPosition,
  loading = 'lazy',
  fetchPriority,
  sizes,
  width,
  height,
}: Props) {
  const [useFallback, setUseFallback] = useState(false)
  const active = useFallback ? fallbackSrc : src

  const onError = useCallback(() => {
    setUseFallback((prev) => {
      if (prev) return prev
      return true
    })
  }, [])

  return (
    <img
      src={active}
      alt={alt}
      className={className}
      loading={loading}
      decoding="async"
      sizes={sizes}
      width={width}
      height={height}
      fetchPriority={fetchPriority}
      style={
        objectFit || objectPosition
          ? {
              objectFit,
              objectPosition,
            }
          : undefined
      }
      onError={onError}
    />
  )
}
