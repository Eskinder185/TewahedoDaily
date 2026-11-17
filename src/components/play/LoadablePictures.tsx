import type { ReactNode } from 'react'
import type { AppLocale } from '../../lib/i18n/locale'
import type { PlayImage } from '../../lib/play/imageCatalog'
import { useLoadablePictures } from '../../lib/play/useLoadablePictures'

/** Renders a picture game only with pictures that can actually be shown, and says how many were skipped. */
export function LoadablePictures({ pool, locale, children }: { pool: PlayImage[]; locale: AppLocale; children: (available: PlayImage[]) => ReactNode }) {
  const { checking, available, skipped } = useLoadablePictures(pool)
  const am = locale === 'am'
  if (checking) return <p role="status" aria-live="polite" data-pictures-checking style={{ padding: '1rem' }}>{am ? 'ሥዕሎቹ እየተፈተሹ ነው…' : 'Checking the pictures…'}</p>
  return (
    <>
      {children(available)}
      {skipped.length > 0 && (
        <p role="note" data-pictures-skipped style={{ padding: '0 1rem 1rem', fontSize: '0.85rem', opacity: 0.85 }}>
          {am ? `${skipped.length} ከ${pool.length} ሥዕሎች አሁን ሊታዩ ስላልቻሉ ተዘልለዋል።` : `${skipped.length} of ${pool.length} pictures can’t be shown right now, so they are skipped in this game.`}
        </p>
      )}
    </>
  )
}
