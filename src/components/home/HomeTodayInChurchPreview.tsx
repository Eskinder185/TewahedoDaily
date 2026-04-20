import { Link } from 'react-router-dom'
import { imageManifest } from '../../content/imageManifest'
import { PageSection } from '../ui/PageSection'
import { useHomeToday } from '../../hooks/useHomeToday'
import styles from './HomeTodayInChurchPreview.module.css'

function fastLine(weekly: string | null, seasonal: string | null) {
  const parts = [weekly, seasonal].filter(Boolean)
  return parts.length ? parts.join(' · ') : null
}

export function HomeTodayInChurchPreview() {
  const { snapshot } = useHomeToday()
  const { gregorian, ethiopian, commemoration, season, fasting } = snapshot
  const commemorationLead =
    commemoration.shortDescription?.trim() || commemoration.whyTodayShort
  const fast = fastLine(fasting.weeklyFast, fasting.seasonalFast)
  const seasonLine = `${season.title} — ${season.summary}`

  return (
    <PageSection id="today-preview" className={styles.tail}>
      <div className={styles.top}>
        <header className={styles.head}>
          <p className={styles.eyebrow}>Today in Church</p>
          <h2 className={styles.title}>What the Church is keeping</h2>
        </header>
        <figure className={styles.figure}>
          <img
            src={imageManifest.home.todayInChurch}
            alt=""
            className={styles.figureImg}
            width={imageManifest.home.todayInChurchWidth}
            height={imageManifest.home.todayInChurchHeight}
            sizes="(max-width: 767px) 100vw, 45vw"
            loading="lazy"
            decoding="async"
          />
        </figure>
      </div>

      <div className={styles.grid}>
        <div className={styles.chip}>
          <span className={styles.label}>Gregorian</span>
          <span className={styles.value}>{gregorian.labelLong}</span>
        </div>
        <div className={styles.chip}>
          <span className={styles.label}>Ethiopian</span>
          <span className={styles.value}>{ethiopian.labelLong}</span>
        </div>
        <div className={styles.chipWide}>
          <span className={styles.label}>Commemoration</span>
          <span className={styles.feast}>{commemoration.title}</span>
          {commemoration.subtitle ? (
            <span className={styles.sub}>{commemoration.subtitle}</span>
          ) : null}
        </div>
        <div className={styles.chipWide}>
          <span className={styles.label}>Season &amp; fast</span>
          <span className={styles.season}>{seasonLine}</span>
          {fast ? <span className={styles.fast}>{fast}</span> : null}
        </div>
      </div>

      <p className={styles.meaning}>{commemorationLead}</p>

      <Link to="/calendar" className={styles.cta}>
        Open full calendar &amp; Today in Church
      </Link>
    </PageSection>
  )
}
