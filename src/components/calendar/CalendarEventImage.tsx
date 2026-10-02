import { useCallback, useState } from 'react'
import {
  imagePositionToObjectPosition,
  normalizeImagePosition,
  type CalendarCardImagePosition,
} from '../../lib/calendar/resolveCalendarCard'
import styles from './CalendarEventImage.module.css'

export type CalendarEventImageProps = {
  src?: string | null
  alt?: string
  /** Safe calendar_cards.image_position token, or a pre-mapped object-position string. */
  position?: CalendarCardImagePosition | string | null
  className?: string
  /** Extra class on the inner <img>. */
  imageClassName?: string
  loading?: 'lazy' | 'eager'
  /** Prefer `priority` for LCP; maps to fetchPriority=high + loading=eager. */
  priority?: boolean
  fetchPriority?: 'high' | 'low' | 'auto'
  sizes?: string
  /**
   * When true and src is empty/broken, show a neutral empty frame (no borrowed event art).
   * Default true — missing images must never reuse another observance's artwork.
   */
  allowEmpty?: boolean
  /** @deprecated Prefer allowEmpty — kept for call sites that still pass decorativeFallback. */
  decorativeFallback?: boolean
}

function resolveObjectPosition(position?: CalendarCardImagePosition | string | null): string {
  const raw = (position || '').trim()
  if (!raw) return imagePositionToObjectPosition('center')
  if (raw.includes('%') || raw.includes(' ')) {
    const allowed =
      /^(center|top|bottom|left|right|\d+(\.\d+)?%)(\s+(center|top|bottom|left|right|\d+(\.\d+)?%))?$/i
    if (allowed.test(raw)) return raw
  }
  return imagePositionToObjectPosition(normalizeImagePosition(raw))
}

/**
 * Shared 4:3 Calendar / Homepage event image presentation.
 * Reserves space before load; cover + sanitized object-position.
 * Empty/missing src → neutral frame (never another event's image).
 */
export function CalendarEventImage({
  src,
  alt = '',
  position,
  className,
  imageClassName,
  loading,
  priority = false,
  fetchPriority,
  sizes,
  allowEmpty = true,
  decorativeFallback,
}: CalendarEventImageProps) {
  const trimmed = (src || '').trim()
  const [failed, setFailed] = useState(false)
  const emptyAllowed = decorativeFallback === false ? false : allowEmpty
  const showEmpty = emptyAllowed && (!trimmed || failed)
  const objectPosition = resolveObjectPosition(position)
  const resolvedLoading = priority ? 'eager' : loading ?? 'lazy'
  const resolvedPriority = priority ? 'high' : fetchPriority

  const onError = useCallback(() => {
    setFailed(true)
  }, [])

  return (
    <div
      className={`${styles.frame} ${className || ''}`.trim()}
      data-calendar-event-image=""
      data-fallback={showEmpty ? 'true' : undefined}
      data-empty={showEmpty ? 'true' : undefined}
    >
      {showEmpty ? (
        <div className={styles.empty} role="img" aria-label={alt ? `${alt} (needs image)` : 'Needs image'}>
          <span className={styles.emptyLabel}>Needs image</span>
        </div>
      ) : (
        <img
          src={trimmed}
          alt={alt}
          className={`${styles.image} ${imageClassName || ''}`.trim()}
          loading={resolvedLoading}
          decoding="async"
          sizes={sizes}
          width={1200}
          height={900}
          fetchPriority={resolvedPriority}
          style={{ objectPosition }}
          onError={onError}
        />
      )}
    </div>
  )
}
