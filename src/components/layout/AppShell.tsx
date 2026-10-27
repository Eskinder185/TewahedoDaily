import { Suspense, lazy, useEffect, useState } from 'react'
import { Outlet, useLocation } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { SiteHeader } from './SiteHeader'
import { OutletErrorBoundary } from './OutletErrorBoundary'
import styles from './AppShell.module.css'
import { AuthProvider } from '../../lib/auth/AuthProvider'
import { SearchBuddyProvider, useSearchBuddy } from '../../lib/search/searchBuddySession'
import { PlayerProvider } from '../../lib/mezmur/playerContext'
import { PersistentMiniPlayer } from '../mezmur/PersistentMiniPlayer'
import { GlobalAudio } from '../publicContent/GlobalAudio'
import { getHomeDayLabels } from '../../lib/home/homeDayLabels'
import { getPracticeContinue } from '../../lib/practice/practiceContinueSession'

const SearchBuddy = lazy(() =>
  import('../search/SearchBuddy').then((m) => ({ default: m.SearchBuddy })),
)
const PracticeContinueDock = lazy(() =>
  import('../practice/PracticeContinueDock').then((m) => ({ default: m.PracticeContinueDock })),
)

function SearchBuddyFabStub({ onOpen }: { onOpen: () => void }) {
  const t = useTranslation()
  return (
    <button
      type="button"
      className={styles.searchFab}
      aria-label={t('searchBuddy.fabAria')}
      aria-haspopup="dialog"
      aria-expanded={false}
      onClick={onOpen}
    >
      <span className={styles.searchFabIcon} aria-hidden>
        ⌕
      </span>
      <span className={styles.searchFabLabel}>{t('searchBuddy.fab')}</span>
    </button>
  )
}

function SearchBuddySuspenseFallback() {
  const { setOpen } = useSearchBuddy()
  return <SearchBuddyFabStub onOpen={() => setOpen(true)} />
}

function DeferredSearchBuddy() {
  const { setOpen } = useSearchBuddy()
  const [ready, setReady] = useState(false)

  useEffect(() => {
    const timeout = window.setTimeout(() => setReady(true), 4000)
    return () => window.clearTimeout(timeout)
  }, [])

  const openNow = () => {
    setReady(true)
    setOpen(true)
  }

  if (!ready) return <SearchBuddyFabStub onOpen={openNow} />
  return <SearchBuddy />
}

function DeferredPracticeContinueDock() {
  const location = useLocation()
  const [show, setShow] = useState(false)

  useEffect(() => {
    const update = () => setShow(Boolean(getPracticeContinue()))
    update()
    window.addEventListener('td-practice-continue', update)
    return () => window.removeEventListener('td-practice-continue', update)
  }, [location.pathname])

  if (!show) return null
  return <PracticeContinueDock />
}

function AppShellFrame() {
  const t = useTranslation()

  useEffect(() => {
    let cancelled = false
    const tick = async () => {
      const { maybeFireDailyCalendarReminder } = await import('../../lib/calendar/calendarReminders')
      if (cancelled) return
      const labels = getHomeDayLabels()
      const body = t('calendar.reminders.notificationBody', {
        ethiopian: labels.ethiopianLabel,
        gregorian: labels.gregorianLabel,
      })
      maybeFireDailyCalendarReminder(body, t('calendar.reminders.notificationTitle'))
    }
    void tick()
    const id = window.setInterval(() => {
      void tick()
    }, 60_000)
    return () => {
      cancelled = true
      window.clearInterval(id)
    }
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
        <Suspense fallback={null}>
          <DeferredPracticeContinueDock />
        </Suspense>
        <PersistentMiniPlayer />
        <Suspense fallback={<SearchBuddySuspenseFallback />}>
          <DeferredSearchBuddy />
        </Suspense>
      </div>
    </GlobalAudio>
  )
}

export function AppShell() {
  return (
    <AuthProvider>
      <SearchBuddyProvider>
        <PlayerProvider>
          <AppShellFrame />
        </PlayerProvider>
      </SearchBuddyProvider>
    </AuthProvider>
  )
}
