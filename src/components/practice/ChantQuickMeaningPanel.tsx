import type { ChantLearningMeta } from './chantPracticeModel'
import styles from './ChantQuickMeaningPanel.module.css'

type Props = {
  title: string
  transliterationTitle: string
  learning?: ChantLearningMeta
}

export function ChantQuickMeaningPanel({
  title,
  transliterationTitle,
  learning,
}: Props) {
  return (
    <section className={styles.root} aria-labelledby="quick-meaning-h">
      <h2 id="quick-meaning-h" className={styles.h}>
        Quick meaning
      </h2>
      <dl className={styles.dl}>
        <div className={styles.row}>
          <dt>Title</dt>
          <dd lang="am">{title}</dd>
        </div>
        {transliterationTitle.trim() ? (
          <div className={styles.row}>
            <dt>Transliteration</dt>
            <dd>{transliterationTitle}</dd>
          </div>
        ) : null}
        {learning?.meaning ? (
          <div className={styles.row}>
            <dt>Meaning</dt>
            <dd>{learning.meaning}</dd>
          </div>
        ) : null}
        {learning?.categoryLabel ? (
          <div className={styles.row}>
            <dt>Theme</dt>
            <dd>{learning.categoryLabel}</dd>
          </div>
        ) : null}
        {learning?.themesLine ? (
          <div className={styles.row}>
            <dt>Themes</dt>
            <dd>{learning.themesLine}</dd>
          </div>
        ) : null}
        {learning?.usage ? (
          <div className={styles.row}>
            <dt>How it is used</dt>
            <dd>{learning.usage}</dd>
          </div>
        ) : null}
        {learning?.saintsLine ? (
          <div className={styles.row}>
            <dt>Saints</dt>
            <dd>{learning.saintsLine}</dd>
          </div>
        ) : null}
        {learning?.majorHolidayLine ? (
          <div className={styles.row}>
            <dt>Major holidays</dt>
            <dd>{learning.majorHolidayLine}</dd>
          </div>
        ) : null}
        {learning?.categoryConfidence ? (
          <div className={styles.row}>
            <dt>Tag confidence</dt>
            <dd>{learning.categoryConfidence}</dd>
          </div>
        ) : null}
        {learning?.feastLine ? (
          <div className={styles.row}>
            <dt>Feasts &amp; days</dt>
            <dd>{learning.feastLine}</dd>
          </div>
        ) : null}
        {learning?.season || learning?.seasonLine ? (
          <div className={styles.row}>
            <dt>Season</dt>
            <dd>{learning?.season ?? learning?.seasonLine}</dd>
          </div>
        ) : null}
      </dl>
    </section>
  )
}
