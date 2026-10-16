import { Suspense, lazy, useEffect } from 'react'
import { Outlet } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { SiteHeader } from './SiteHeader'
import { SiteFooter } from './SiteFooter'
import { OutletErrorBoundary } from './OutletErrorBoundary'
import styles from './AppShell.module.css'
import { AuthProvider } from '../../lib/auth/AuthProvider'
import { SearchBuddyProvider } from '../../lib/search/searchBuddySession'
import { GlobalAudio } from '../publicContent/GlobalAudio'
import { getHomeDayLabels } from '../../lib/home/homeDayLabels'
import { maybeFireDailyCalendarReminder } from '../../lib/calendar/calendarReminders'

const SearchBuddy = lazy(() =>
  import('../search/SearchBuddy').then((m) => ({ default: m.SearchBuddy })),
)
const PracticeContinueDock = lazy(() =>
  import('../practice/PracticeContinueDock').then((m) => ({ default: m.PracticeContinueDock })),
)

function AppShellFrame() {
  const t = useTranslation()

  useEffect(() => {
    const tick = () => {
      const labels = getHomeDayLabels()
      const body = t('calendar.reminders.notificationBody', {
        ethiopian: labels.ethiopianLabel,
        gregorian: labels.gregorianLabel,
      })
      maybeFireDailyCalendarReminder(body, t('calendar.reminders.notificationTitle'))
    }
    tick()
    const id = window.setInterval(tick, 60_000)
    return () => window.clearInterval(id)
  }, [t])

  return (
    <GlobalAudio>
      <div className={styles.shell}>
        <a href="#main" className={styles.skipLink}>
          {t('a11y.skipToMain')}
        </a>
        <SiteHeader />
        <main className={styles.main} id="main" tabIndex={-1}>
          <OutletErrorBoundary>
            <Outlet />
          </OutletErrorBoundary>
        </main>
        <SiteFooter />
        <Suspense fallback={null}>
          <PracticeContinueDock />
          <SearchBuddy />
        </Suspense>
      </div>
    </GlobalAudio>
  )
}

export function AppShell() {
  return (
    <AuthProvider>
      <SearchBuddyProvider>
        <AppShellFrame />
      </SearchBuddyProvider>
    </AuthProvider>
  )
}
