import { useTheme } from '../../hooks/useTheme'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './ThemeToggle.module.css'

function IconSun({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      <circle cx="12" cy="12" r="3.5" />
      <path d="M12 2v2M12 20v2M4.22 4.22l1.42 1.42M18.36 18.36l1.42 1.42M2 12h2M20 12h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42" />
    </svg>
  )
}

function IconMoon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" />
    </svg>
  )
}

function IconSystem({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      <rect x="3" y="4" width="18" height="12" rx="2" />
      <path d="M8 21h8M12 17v4" />
    </svg>
  )
}

export function ThemeToggle() {
  const { theme, setTheme } = useTheme()
  const t = useUiLabel()

  return (
    <div
      className={styles.group}
      role="group"
      aria-label={t('themeSwitcherGroup')}
    >
      <button
        type="button"
        className={`${styles.seg} ${theme === 'light' ? styles.segOn : ''}`}
        onClick={() => setTheme('light')}
        aria-pressed={theme === 'light'}
        title={t('themeLightTitle')}
        aria-label={t('themeLightTitle')}
      >
        <IconSun className={styles.icon} />
      </button>
      <button
        type="button"
        className={`${styles.seg} ${theme === 'dark' ? styles.segOn : ''}`}
        onClick={() => setTheme('dark')}
        aria-pressed={theme === 'dark'}
        title={t('themeDarkTitle')}
        aria-label={t('themeDarkTitle')}
      >
        <IconMoon className={styles.icon} />
      </button>
      <button
        type="button"
        className={`${styles.seg} ${theme === 'auto' ? styles.segOn : ''}`}
        onClick={() => setTheme('auto')}
        aria-pressed={theme === 'auto'}
        title={t('themeSystemTitle')}
        aria-label={t('themeSystemTitle')}
      >
        <IconSystem className={styles.icon} />
      </button>
    </div>
  )
}
