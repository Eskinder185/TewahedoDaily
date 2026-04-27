import { memo, type KeyboardEvent } from 'react'
import type { EotcCalendarDatasetRow } from '../../lib/eotcCalendar/eotcTypes'
import {
  formatEntryDateHint,
  formatObservanceStateLabel,
  galleryBucketToPlaceholderVisual,
  getObservanceGalleryBucket,
} from '../../lib/eotcCalendar/eotcObservanceGalleryModel'
import {
  calendarImageManifest,
  resolveEventImageById,
  resolveEventImagePresentation,
} from '../../content/calendarImageManifest'
import { CalendarImage } from './CalendarImage'
import styles from './ObservanceCard.module.css'

type Props = {
  row: EotcCalendarDatasetRow
  onOpen: (row: EotcCalendarDatasetRow) => void
}

function initialsFromRow(row: EotcCalendarDatasetRow): string {
  const t = (row.entry.englishTitle ?? row.entry.title).trim()
  if (t.length <= 2) return t.slice(0, 2).toLocaleUpperCase()
  const words = t.split(/\s+/).filter(Boolean)
  if (words.length >= 2) {
    const a = words[0][0] ?? ''
    const b = words[1][0] ?? ''
    return `${a}${b}`.toLocaleUpperCase()
  }
  return t.slice(0, 2).toLocaleUpperCase()
}

function ObservanceCardInner({ row, onOpen }: Props) {
  const e = row.entry
  const displayTitle = e.englishTitle?.trim() || e.title
  const nativeTitle =
    e.englishTitle?.trim() && e.title.trim() !== displayTitle.trim() ? e.title : null
  const bucket = getObservanceGalleryBucket(row)
  const ph = galleryBucketToPlaceholderVisual(bucket)
  const badge = e.display.calendarBadge?.trim() || bucket.replace(/-/g, ' ')
  const dateHint = formatEntryDateHint(row)
  const stateLabel = formatObservanceStateLabel(row)
  const major = e.category.majorHoliday
  const relatedCount = e.content.relatedEntries?.length ?? 0
  const imageUrl = resolveEventImageById(e.id)
  const imagePresentation = resolveEventImagePresentation(
    e.id,
    {
      objectFit: 'cover',
      objectPosition: '50% 30%',
    },
    e,
  )

  const onKeyDown = (ev: KeyboardEvent) => {
    if (ev.key === 'Enter' || ev.key === ' ') {
      ev.preventDefault()
      onOpen(row)
    }
  }

  return (
    <article className={styles.root}>
      <button
        type="button"
        className={styles.hit}
        onClick={() => onOpen(row)}
        onKeyDown={onKeyDown}
        aria-label={`Open details for ${displayTitle}`}
      >
        <div className={styles.media}>
          {imageUrl ? (
            <CalendarImage
              src={imageUrl}
              fallbackSrc={calendarImageManifest.anchors.todayInChurch}
              alt={`${displayTitle} observance image`}
              className={styles.image}
              objectFit={imagePresentation.objectFit}
              objectPosition={imagePresentation.objectPosition}
              loading="lazy"
              fetchPriority="low"
              sizes="(max-width: 600px) 45vw, 280px"
            />
          ) : (
            <div
              className={`${styles.placeholder} ${
                (styles as Record<string, string>)[`ph_${ph}`] ?? ''
              }`.trim()}
              aria-hidden
            >
              <span className={styles.pattern} />
              <span className={styles.initials}>{initialsFromRow(row)}</span>
            </div>
          )}
        </div>
        <div className={styles.body}>
          <div className={styles.badges}>
            <span className={styles.badge}>{badge}</span>
            {major ? (
              <span className={styles.badgeMajor}>Major</span>
            ) : (
              <span className={styles.badgeSubtle}>Holy day</span>
            )}
            <span className={styles.stateChip}>{stateLabel}</span>
          </div>
          <h3 className={styles.title}>{displayTitle}</h3>
          {nativeTitle ? <p className={styles.native}>{nativeTitle}</p> : null}
          {e.transliterationTitle?.trim() ? (
            <p className={styles.translit}>{e.transliterationTitle.trim()}</p>
          ) : null}
          <p className={styles.hint}>{dateHint}</p>
          {e.summary.short?.trim() ? (
            <p className={styles.short}>{e.summary.short.trim()}</p>
          ) : null}
          {relatedCount > 0 ? (
            <p className={styles.relatedMeta}>
              +{relatedCount} related {relatedCount === 1 ? 'entry' : 'entries'}
            </p>
          ) : null}
        </div>
      </button>
    </article>
  )
}

export const ObservanceCard = memo(ObservanceCardInner)
