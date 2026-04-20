import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { TodayInChurchSection } from '../components/todayInChurch'
import { resolveMonthlyImage } from '../content/calendarImageManifest'
import { useHomeToday } from '../hooks/useHomeToday'
import { CalendarImage } from '../components/calendar/CalendarImage'
import { calendarImageManifest } from '../content/calendarImageManifest'
import styles from './CalendarPage.module.css'

export function CalendarPage() {
  const { snapshot } = useHomeToday()
  const monthImage = resolveMonthlyImage(snapshot.ethiopian.month)

  return (
    <PageSection id="calendar" variant="tint" className={styles.page}>
      <header className={styles.head}>
        <div className={styles.headContent}>
          <figure className={styles.headImageWrap} aria-hidden>
            <CalendarImage
              src={monthImage}
              fallbackSrc={calendarImageManifest.anchors.todayInChurch}
              alt=""
              className={styles.headImage}
              fetchPriority="low"
              sizes="(max-width: 919px) 100vw, min(340px, 40vw)"
            />
          </figure>
          <div className={styles.copy}>
            <p className={styles.eyebrow}>Ethiopian Orthodox Liturgical Guide</p>
            <h1 className={styles.title}>Today in the Church</h1>
            <p className={styles.deck}>
              Your daily Ethiopian Orthodox guide: Ethiopian dates, feast and fast days, saint commemorations, 
              Marian observances, movable feasts, and practical guidance for prayer and chant. Navigate any day 
              to discover what the Church is keeping and how to observe it faithfully.
            </p>
            <div className={styles.actions}>
              <Link to="/" className={styles.inlineHome}>
                Home
              </Link>
              <Link to="/prayers" className={styles.back}>
                Open prayer mode
              </Link>
            </div>
          </div>
        </div>
      </header>
      <div className={styles.mobileStack}>
        <TodayInChurchSection embedded embeddedOnCalendarPage />
      </div>
    </PageSection>
  )
}
