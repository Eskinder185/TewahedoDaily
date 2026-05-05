import { useTranslation } from '../../i18n'
import styles from './SiteFooter.module.css'

const PORTFOLIO_URL = 'https://eskinder.dev/'

export function SiteFooter() {
  const t = useTranslation()
  const year = new Date().getFullYear()

  return (
    <footer className={styles.footer}>
      <div className={styles.inner}>
        <div className={styles.brand}>
          <p className={styles.name}>{t('brand.name')}</p>
        </div>
        <p className={styles.portfolioWrap}>
          <a
            href={PORTFOLIO_URL}
            className={styles.portfolio}
            target="_blank"
            rel="noopener noreferrer"
          >
            {t('footer.portfolio')}
          </a>
        </p>
        <p className={styles.copy}>{t('footer.copyright', { year })}</p>
      </div>
    </footer>
  )
}
