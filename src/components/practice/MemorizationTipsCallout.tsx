import styles from './MemorizationTipsCallout.module.css'

export function MemorizationTipsCallout() {
  return (
    <aside className={styles.root} aria-label="Memorization tips">
      <p className={styles.title}>Memorization tips</p>
      <ul className={styles.list}>
        <li>Read one line aloud several times before adding the next.</li>
        <li>Listen at slower speed, then speak with the recording.</li>
        <li>Use first-letter hints only as a bridge — return to full words often.</li>
        <li>In church, follow the cantor and keep eyes lifted toward the holy icons when appropriate.</li>
      </ul>
    </aside>
  )
}
