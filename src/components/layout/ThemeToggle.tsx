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

export function ThemeToggle() {
  const { theme, toggleTheme } = useTheme()
  const t = useUiLabel()
  const isNight = theme === 'night'
  const title = isNight ? t('themeDayTitle') : t('themeNightTitle')

  return (
    <button
      type="button"
      className={styles.toggle}
      onClick={toggleTheme}
      aria-pressed={isNight}
      title={title}
      aria-label={title}
    >
      {isNight ? <IconMoon className={styles.icon} /> : <IconSun className={styles.icon} />}
      <span className={styles.label}>{isNight ? t('themeNightLabel') : t('themeDayLabel')}</span>
    </button>
  )
}
