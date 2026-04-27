import { useEffect, useId } from 'react'
import type { EotcCalendarDatasetRow } from '../../lib/eotcCalendar/eotcTypes'
import { getEntryById } from '../../lib/eotcCalendar/eotcCalendarDataset'
import {
  formatEntryDateHint,
  formatObservanceStateLabel,
  galleryBucketToPlaceholderVisual,
  getObservanceGalleryBucket,
} from '../../lib/eotcCalendar/eotcObservanceGalleryModel'
import { findNextCivilDayForEntry } from '../../lib/eotcCalendar/eotcFindEntryOccurrence'
import { toGregorianIsoDate } from '../../data/utils/gregorianIso'
import {
  calendarImageManifest,
  resolveEventImageById,
  resolveEventImagePresentation,
} from '../../content/calendarImageManifest'
import { CalendarImage } from './CalendarImage'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './EotcObservanceDetailSheet.module.css'

type Props = {
  row: EotcCalendarDatasetRow | null
  open: boolean
  onClose: () => void
  today: Date
  /** Navigate calendar page: civil day + optional observance focus id */
  onGoToCalendar: (iso: string, observanceId: string) => void
  onOpenRelated: (id: string) => void
}

function initials(row: EotcCalendarDatasetRow): string {
  const t = (row.entry.englishTitle ?? row.entry.title).trim()
  if (t.length <= 2) return t.slice(0, 2).toLocaleUpperCase()
  const words = t.split(/\s+/).filter(Boolean)
  if (words.length >= 2) {
    return `${words[0][0] ?? ''}${words[1][0] ?? ''}`.toLocaleUpperCase()
  }
  return t.slice(0, 2).toLocaleUpperCase()
}

export function EotcObservanceDetailSheet({
  row,
  open,
  onClose,
  today,
  onGoToCalendar,
  onOpenRelated,
}: Props) {
  const t = useUiLabel()
  const titleId = useId()
  const imageUrl = row ? resolveEventImageById(row.entry.id) : undefined
  const imagePresentation = row
    ? resolveEventImagePresentation(
        row.entry.id,
        {
          objectFit: 'cover',
          objectPosition: '50% 30%',
        },
        row.entry,
      )
    : undefined

  useEffect(() => {
    if (!open) return
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      document.body.style.overflow = prev
    }
  }, [open])

  useEffect(() => {
    if (!open) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [open, onClose])

  if (!open || !row) return null

  const e = row.entry
  const displayTitle = e.englishTitle?.trim() || e.title
  const bucket = getObservanceGalleryBucket(row)
  const ph = galleryBucketToPlaceholderVisual(bucket)
  const nextDay = findNextCivilDayForEntry(e.id, today)
  const dateHint = formatEntryDateHint(row)
  const stateLabel = formatObservanceStateLabel(row)
  const related = e.content.relatedEntries ?? []

  const onBackdrop = () => onClose()

  const goCalendar = () => {
    if (nextDay) {
      onGoToCalendar(toGregorianIsoDate(nextDay), e.id)
      onClose()
    }
  }

  return (
    <div
      className={styles.scrim}
      role="presentation"
      onClick={onBackdrop}
      aria-hidden={false}
    >
      <section
        className={styles.sheet}
        role="dialog"
        aria-modal="true"
        aria-labelledby={titleId}
        onClick={(ev) => ev.stopPropagation()}
      >
        <header className={styles.head}>
          <div className={styles.hero}>
            {imageUrl ? (
              <CalendarImage
                src={imageUrl}
                fallbackSrc={calendarImageManifest.anchors.todayInChurch}
                alt=""
                className={styles.heroImg}
                objectFit={imagePresentation?.objectFit}
                objectPosition={imagePresentation?.objectPosition}
                loading="eager"
                fetchPriority="high"
                sizes="(max-width: 720px) 100vw, min(28rem, 90vw)"
              />
            ) : (
              <div
                className={`${styles.heroPh} ${
                  (styles as Record<string, string>)[`heroPh_${ph}`] ?? ''
                }`.trim()}
                aria-hidden
              >
                <span className={styles.heroPattern} />
                <span className={styles.heroInitials}>{initials(row)}</span>
              </div>
            )}
          </div>
          <div className={styles.headText}>
            <p className={styles.collection}>
              {row.collection} · {e.category.primary}
            </p>
            <h2 id={titleId} className={styles.hd}>
              {displayTitle}
            </h2>
            {e.title.trim() !== displayTitle.trim() ? (
              <p className={styles.native}>{e.title}</p>
            ) : null}
            {e.transliterationTitle?.trim() ? (
              <p className={styles.translit}>{e.transliterationTitle.trim()}</p>
            ) : null}
            <div className={styles.meta}>
              <span className={styles.chip}>{stateLabel}</span>
              {e.category.majorHoliday ? (
                <span className={styles.chipMajor}>Major</span>
              ) : null}
              <span className={styles.chipMuted}>{dateHint}</span>
            </div>
          </div>
          <button
            type="button"
            className={styles.close}
            onClick={onClose}
            aria-label={t('dialogClose')}
          >
            ×
          </button>
        </header>

        <div className={styles.body}>
          {e.summary.panel?.trim() ? (
            <p className={styles.panel}>{e.summary.panel.trim()}</p>
          ) : null}
          {e.summary.short?.trim() ? (
            <p className={styles.p}>{e.summary.short.trim()}</p>
          ) : null}
          {e.summary.whyItMatters?.trim() ? (
            <div className={styles.block}>
              <h3 className={styles.h3}>{t('calendarGalleryDetailWhy')}</h3>
              <p className={styles.p}>{e.summary.whyItMatters.trim()}</p>
            </div>
          ) : null}
          {e.summary.connection?.trim() ? (
            <div className={styles.block}>
              <h3 className={styles.h3}>{t('calendarGalleryDetailConnection')}</h3>
              <p className={styles.p}>{e.summary.connection.trim()}</p>
            </div>
          ) : null}
          {e.content.extended?.trim() ? (
            <div className={styles.block}>
              <h3 className={styles.h3}>{t('calendarGalleryDetailMore')}</h3>
              <p className={styles.p}>{e.content.extended.trim()}</p>
            </div>
          ) : null}
          {e.observance.commonPractices.length > 0 ? (
            <div className={styles.block}>
              <h3 className={styles.h3}>{t('calendarGalleryDetailPractices')}</h3>
              <ul className={styles.ul}>
                {e.observance.commonPractices.map((x) => (
                  <li key={x}>{x}</li>
                ))}
              </ul>
            </div>
          ) : null}
          {e.content.notes?.length ? (
            <div className={styles.block}>
              <h3 className={styles.h3}>{t('calendarGalleryDetailNotes')}</h3>
              <ul className={styles.ul}>
                {e.content.notes.map((x) => (
                  <li key={x}>{x}</li>
                ))}
              </ul>
            </div>
          ) : null}

          {related.length > 0 ? (
            <div className={styles.block}>
              <h3 className={styles.h3}>{t('calendarGalleryDetailRelated')}</h3>
              <ul className={styles.related}>
                {related.map((rid) => {
                  const target = getEntryById(rid)
                  const label =
                    target?.entry.englishTitle?.trim() ||
                    target?.entry.title ||
                    rid
                  return (
                    <li key={rid}>
                      <button
                        type="button"
                        className={styles.relatedBtn}
                        onClick={() => onOpenRelated(rid)}
                      >
                        {label}
                      </button>
                    </li>
                  )
                })}
              </ul>
            </div>
          ) : null}
        </div>

        <footer className={styles.footer}>
          {nextDay ? (
            <button type="button" className={styles.primaryBtn} onClick={goCalendar}>
              {t('calendarGalleryShowOnCalendar')}
            </button>
          ) : (
            <p className={styles.unresolved}>{t('calendarGalleryNoResolvedDay')}</p>
          )}
          <button type="button" className={styles.secondaryBtn} onClick={onClose}>
            {t('dialogClose')}
          </button>
        </footer>
      </section>
    </div>
  )
}
