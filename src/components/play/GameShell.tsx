import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import type { PlayArt } from '../../lib/play/imageCatalog'
import styles from './GameShell.module.css'

export function GameShell({ locale, title, subtitle, art, kicker, children }: { locale: AppLocale; title: string; subtitle: string; art?: PlayArt; kicker?: string; children: ReactNode }) {
  const am = locale === 'am'
  return (
    <div className={styles.page} lang={locale}>
      <header className={styles.header}>
        {art ? <img className={styles.headerArt} src={art.src} alt="" style={art.focus ? { objectPosition: art.focus } : undefined} /> : null}
        <div className={styles.headerInner}>
          <Link to="/play" className={styles.back}>
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M19 12H5M11 18l-6-6 6-6" /></svg>
            {am ? 'ሁሉም ጨዋታዎች' : 'All games'}
          </Link>
          <p>{kicker ?? (am ? 'በተገመገሙ ምንጮች የተዘጋጀ' : 'Built from reviewed sources')}</p>
          <h1>{title}</h1>
          <span>{subtitle}</span>
        </div>
      </header>
      <div className={styles.stage}>{children}</div>
    </div>
  )
}

export function VerifiedFallback({ locale }: { locale: AppLocale }) {
  if (locale !== 'am') return null
  return <p className={styles.fallback} role="note">English verified content shown where an approved Amharic version is not yet available.</p>
}
