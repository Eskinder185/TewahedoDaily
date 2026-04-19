import { useCallback, useState } from 'react'

type Props = {
  src: string
  fallbackSrc: string
  alt?: string
  className?: string
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
      loading="lazy"
      decoding="async"
      onError={onError}
    />
  )
}
