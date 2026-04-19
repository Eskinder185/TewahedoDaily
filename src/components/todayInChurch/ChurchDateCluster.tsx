import type { ChurchDaySnapshot } from '../../lib/churchCalendar'
import styles from './ChurchDateCluster.module.css'

type Props = {
  snapshot: ChurchDaySnapshot
}

export function ChurchDateCluster({ snapshot }: Props) {
  const { gregorian, ethiopian, weekday } = snapshot

  return (
    <div className={styles.cluster}>
      <div className={styles.card}>
        <span className={styles.label}>Gregorian</span>
        <p className={styles.value}>{gregorian.labelLong}</p>
      </div>
      <div className={styles.card}>
        <span className={styles.label}>Ethiopian</span>
        <p className={styles.valueEth}>{ethiopian.labelLong}</p>
      </div>
      <div className={styles.card}>
        <span className={styles.label}>Weekday</span>
        <p className={styles.valueWeek}>{weekday.long}</p>
      </div>
    </div>
  )
}
