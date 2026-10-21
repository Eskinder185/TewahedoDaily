import { useId, useState } from 'react'
import { Link } from 'react-router-dom'
import type { DayCommemorationItem } from '../../services/dayChurchContext'
import { useLocale } from '../../lib/i18n/locale'
import { useTranslation } from '../../i18n'
import styles from './SynaxariumOfTheDay.module.css'

export type SynaxariumOfTheDayProps = {
  ethiopianLabel: string
  gregorianLabel: string
  items: DayCommemorationItem[]
  loading?: boolean
  daySlug?: string | null
}

function CommemorationRow({ item }: { item: DayCommemorationItem }) {
  const panelId = useId()
  const [open, setOpen] = useState(false)
  const t = useTranslation()
  const { contentLocale } = useLocale()
  const preview = (item.summary || '').trim()
  const fullBody = (item.longerSummary || '').trim()
  const showFullDistinct = Boolean(fullBody && fullBody !== preview)
  const titleEn = (item.title || '').trim()
  const titleAm = (item.titleAmharic || '').trim()
  const primaryTitle =
    contentLocale === 'en' ? titleEn || titleAm : titleAm || titleEn
  const secondaryTitle =
    contentLocale === 'am' && titleEn && titleAm && titleEn !== titleAm
      ? primaryTitle === titleAm
        ? titleEn
        : titleAm
      : contentLocale === 'am' && titleEn && titleEn !== primaryTitle
        ? titleEn
        : contentLocale === 'en' && titleAm && titleAm !== primaryTitle
          ? titleAm
          : ''

  return (
    <div className={`${styles.item} ${open ? styles.itemOpen : ''}`}>
      <button
        type="button"
        className={styles.itemHead}
        aria-expanded={open}
        aria-controls={panelId}
        id={`${panelId}-btn`}
        onClick={() => setOpen((v) => !v)}
      >
        <span className={styles.itemTitles}>
          <span className={styles.itemTitle} lang={primaryTitle === titleAm ? 'am' : undefined}>
            {primaryTitle || t('calendar.synaxariumDay.commemoration')}
          </span>
          {item.typeLabel ? <span className={styles.itemType}>{item.typeLabel}</span> : null}
          {!open && preview ? <span className={styles.itemPreview}>{preview}</span> : null}
        </span>
        <span className={styles.chevron} aria-hidden>
          {open ? '▲' : '▼'}
        </span>
      </button>
      {open ? (
        <div
          id={panelId}
          role="region"
          aria-labelledby={`${panelId}-btn`}
          className={styles.itemBody}
        >
          {secondaryTitle ? (
            <p className={styles.itemAm} lang={secondaryTitle === titleAm ? 'am' : 'en'}>
              {secondaryTitle}
            </p>
          ) : null}
          {preview ? <p className={styles.summary}>{preview}</p> : null}
          {showFullDistinct ? <div className={styles.story}>{fullBody}</div> : null}
          {!preview && !fullBody ? (
            <p className={styles.muted}>{t('calendar.synaxariumDay.noText')}</p>
          ) : null}
        </div>
      ) : null}
    </div>
  )
}

/** Right-rail Synaxarium list for the selected calendar day. */
export function SynaxariumOfTheDay({
  ethiopianLabel,
  gregorianLabel,
  items,
  loading = false,
  daySlug,
}: SynaxariumOfTheDayProps) {
  const t = useTranslation()
  return (
    <aside className={styles.root} aria-labelledby="synaxarium-day-heading">
      <header className={styles.head}>
        <p className={styles.eyebrow}>{t('calendar.synaxariumDay.eyebrow')}</p>
        <h2 id="synaxarium-day-heading" className={styles.title}>
          {ethiopianLabel || t('calendar.synaxariumDay.selected')}
        </h2>
        {gregorianLabel ? <p className={styles.gregorian}>{gregorianLabel}</p> : null}
      </header>

      {loading ? (
        <p className={styles.status} role="status">
          {t('calendar.synaxariumDay.loading')}
        </p>
      ) : items.length === 0 ? (
        <p className={styles.status} role="status">
          {t('calendar.synaxariumDay.empty')}
        </p>
      ) : (
        <div className={styles.list}>
          {items.map((item) => (
            <CommemorationRow key={item.id} item={item} />
          ))}
        </div>
      )}

      {daySlug ? (
        <Link className={styles.fullLink} to={`/pray/synaxarium/${daySlug}`}>
          {t('calendar.synaxariumDay.openFull')}
        </Link>
      ) : null}
    </aside>
  )
}
