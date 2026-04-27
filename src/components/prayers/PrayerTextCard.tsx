import { PrayerTextTabs } from './PrayerTextTabs'
import styles from './PrayerTextCard.module.css'

type Props = {
  title: string
  transliterationTitle?: string
  text: {
    amharic: string
    geez: string
    english: string
  }
}

export function PrayerTextCard({
  title,
  transliterationTitle,
  text,
}: Props) {
  return (
    <section className={styles.wrap} aria-labelledby="prayer-text-card-title">
      <div className={styles.head}>
        <p className={styles.eyebrow}>Prayer text</p>
        <h2 id="prayer-text-card-title" className={styles.title} lang="am">
          {title}
        </h2>
        {transliterationTitle ? (
          <p className={styles.subTitle}>{transliterationTitle}</p>
        ) : null}
      </div>

      <PrayerTextTabs text={text} />
    </section>
  )
}
