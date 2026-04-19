import styles from './PageLoadingFallback.module.css'

export function PageLoadingFallback() {
  return (
    <div className={styles.container}>
      <div className={styles.spinner} role="status" aria-label="Loading page">
        <span className={styles.text}>Loading...</span>
      </div>
    </div>
  )
}