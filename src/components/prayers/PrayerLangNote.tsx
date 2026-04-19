import styles from './PrayerLangNote.module.css'

/** Explains site UI language vs prayer text language — keep subtle. */
export function PrayerLangNote() {
  return (
    <p className={styles.note}>
      <span className={styles.kicker}>Note · </span>
      The header switch sets menus and labels. The buttons here set the{' '}
      <strong>prayer text</strong> language.
    </p>
  )
}
