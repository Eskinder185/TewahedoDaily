import { Suspense, lazy } from 'react'
import { Outlet } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { SiteHeader } from './SiteHeader'
import { SiteFooter } from './SiteFooter'
import { OutletErrorBoundary } from './OutletErrorBoundary'
import styles from './AppShell.module.css'
import { AuthProvider } from '../../lib/auth/AuthProvider'
import { SearchBuddyProvider } from '../../lib/search/searchBuddySession'
import { GlobalAudio } from '../publicContent/GlobalAudio'

const SearchBuddy = lazy(() =>
  import('../search/SearchBuddy').then((m) => ({ default: m.SearchBuddy })),
)

function AppShellFrame() {
  const t = useTranslation()
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
