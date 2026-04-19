import { Link, NavLink } from 'react-router-dom'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { LanguageToggle } from './LanguageToggle'
import { ThemeToggle } from './ThemeToggle'
import styles from './SiteHeader.module.css'

export function SiteHeader() {
  const t = useUiLabel()
  const modes = [
    {
      to: '/practice',
      label: t('navPractice'),
      desc: t('navModeLearnDesc'),
    },
    {
      to: '/prayers',
      label: t('navPray'),
      desc: t('navModePrayDesc'),
    },
    {
      to: '/calendar',
      label: t('navKeepDay'),
      desc: t('navModeKeepDayDesc'),
    },
  ]

  return (
    <header className={styles.header}>
      <div className={styles.bar}>
        <div className={styles.topRow}>
          <Link to="/" className={styles.brand}>
            <span className={styles.mark} aria-hidden />
            <span className={styles.brandText}>
              <span className={styles.wordmark}>Tewahedo Daily</span>
              <span className={styles.brandSub}>Quiet liturgical studio</span>
            </span>
          </Link>
          <div className={styles.toggleGroup}>
            <ThemeToggle />
            <LanguageToggle />
          </div>
        </div>
        <nav className={styles.nav} aria-label="Primary">
          <NavLink
            to="/"
            end
            className={({ isActive }) =>
              `${styles.homeLink} ${isActive ? styles.homeLinkOn : ''}`.trim()
            }
          >
            {t('navHome')}
          </NavLink>
          {modes.map((item) => (
            <NavLink
              key={item.to}
              to={item.to}
              title={`${item.label} — ${item.desc}`}
              className={({ isActive }) =>
                `${styles.modeLink} ${isActive ? styles.modeLinkOn : ''}`.trim()
              }
            >
              <span className={styles.modeLabel}>{item.label}</span>
              <span className={styles.modeDesc}>{item.desc}</span>
            </NavLink>
          ))}
          <NavLink
            to="/about"
            className={({ isActive }) =>
              `${styles.homeLink} ${isActive ? styles.homeLinkOn : ''}`.trim()
            }
          >
            {t('navAbout')}
          </NavLink>
        </nav>
      </div>
    </header>
  )
}
