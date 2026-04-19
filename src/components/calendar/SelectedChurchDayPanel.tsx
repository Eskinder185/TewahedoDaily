import { useMemo } from 'react'
import { buildChurchDaySnapshot } from '../../lib/churchCalendar'
import { ChurchDayDetailBody } from './ChurchDayDetailBody'
import styles from './SelectedChurchDayPanel.module.css'

type Props = {
  date: Date
  today: Date
  onPrevDay: () => void
  onNextDay: () => void
}

export function SelectedChurchDayPanel({ date, today, onPrevDay, onNextDay }: Props) {
  const snapshot = useMemo(() => buildChurchDaySnapshot(date), [date])

  const isToday =
    date.getFullYear() === today.getFullYear() &&
    date.getMonth() === today.getMonth() &&
    date.getDate() === today.getDate()

  return (
    <section className={styles.root} aria-labelledby="selected-church-day-title">
      <div className={styles.inner}>
        <header className={styles.head}>
          <div>
            <p className={styles.eyebrow}>{isToday ? 'This day' : 'Selected day'}</p>
            <h2 id="selected-church-day-title" className={styles.title}>
              {snapshot.weekday.long}
            </h2>
            <p className={styles.dates}>
              <span>{snapshot.gregorian.labelLong}</span>
              <span aria-hidden> · </span>
              <span lang="am">{snapshot.ethiopian.labelLong}</span>
            </p>
          </div>
          <div className={styles.nav}>
            <button type="button" className={styles.navBtn} onClick={onPrevDay} aria-label="Previous day">
              ‹
            </button>
            <button type="button" className={styles.navBtn} onClick={onNextDay} aria-label="Next day">
              ›
            </button>
          </div>
        </header>
        <div className={styles.body} key={snapshot.gregorian.labelLong}>
          <ChurchDayDetailBody snapshot={snapshot} />
        </div>
      </div>
    </section>
  )
}
