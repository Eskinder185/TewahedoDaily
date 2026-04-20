import { useEffect, useLayoutEffect, useMemo, useRef } from 'react'
import { buildChurchDaySnapshot } from '../../lib/churchCalendar'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { ChurchDayDetailBody } from './ChurchDayDetailBody'
import styles from './CalendarDayDetailModal.module.css'

type Props = {
  open: boolean
  onClose: () => void
  /** Gregorian calendar day for the detail view */
  date: Date | null
  /** Highlight “today” in the modal header */
  today: Date
}

export function CalendarDayDetailModal({ open, onClose, date, today }: Props) {
  const t = useUiLabel()
  const panelRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    if (!open) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [open, onClose])

  useEffect(() => {
    if (open) panelRef.current?.focus()
  }, [open])

  useLayoutEffect(() => {
    if (!open) return
    const el = panelRef.current
    if (el) el.scrollTop = 0
  }, [open, date?.getTime()])

  const snapshot = useMemo(() => {
    if (!date) return null
    return buildChurchDaySnapshot(date)
  }, [date])

  if (!open || !date || !snapshot) return null

  const isToday =
    date.getFullYear() === today.getFullYear() &&
    date.getMonth() === today.getMonth() &&
    date.getDate() === today.getDate()

  return (
    <div className={styles.backdrop} role="presentation" onClick={onClose}>
      <div
        className={styles.panel}
        role="dialog"
        aria-modal="true"
        aria-labelledby="day-detail-title"
        tabIndex={-1}
        ref={panelRef}
        onClick={(e) => e.stopPropagation()}
      >
        <header className={styles.head}>
          <div>
            <p className={styles.eyebrow}>{isToday ? 'This day' : 'Church day'}</p>
            <h2 id="day-detail-title" className={styles.title}>
              {snapshot.weekday.long}
            </h2>
            <p className={styles.dates}>
              <span>{snapshot.gregorian.labelLong}</span>
              <span aria-hidden> · </span>
              <span lang="am">{snapshot.ethiopian.labelLong}</span>
            </p>
          </div>
          <button
            type="button"
            className={styles.close}
            onClick={onClose}
            aria-label={t('dialogClose')}
          >
            {t('dialogClose')}
          </button>
        </header>

        <div className={styles.body}>
          <ChurchDayDetailBody snapshot={snapshot} />
        </div>
      </div>
    </div>
  )
}
