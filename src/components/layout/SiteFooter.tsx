import styles from './SiteFooter.module.css'

const PORTFOLIO_URL = 'https://eskinder.dev/'

export function SiteFooter() {
  const year = new Date().getFullYear()

  return (
    <footer className={styles.footer}>
      <div className={styles.inner}>
        <div className={styles.brand}>
          <p className={styles.name}>Tewahedo Daily</p>
        </div>
        <p className={styles.portfolioWrap}>
          <a
            href={PORTFOLIO_URL}
            className={styles.portfolio}
            target="_blank"
            rel="noopener noreferrer"
          >
            Portfolio — eskinder.dev
          </a>
        </p>
        <p className={styles.copy}>© {year} Tewahedo Daily</p>
      </div>
    </footer>
  )
}
