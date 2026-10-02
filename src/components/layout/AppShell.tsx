import { Suspense, lazy } from 'react'
import { Outlet } from 'react-router-dom'
import { SiteHeader } from './SiteHeader'
import { SiteFooter } from './SiteFooter'
import styles from './AppShell.module.css'
import { AuthProvider } from '../../lib/auth/AuthProvider'
import { GlobalAudio } from '../publicContent/GlobalAudio'

const SearchBuddy = lazy(() =>
  import('../search/SearchBuddy').then((m) => ({ default: m.SearchBuddy })),
)

export function AppShell() {
  return (
    <AuthProvider>
      <GlobalAudio>
        <div className={styles.shell}>
          <SiteHeader />
          <main className={styles.main} id="main">
            <Outlet />
          </main>
          <SiteFooter />
          <Suspense fallback={null}>
            <SearchBuddy />
          </Suspense>
        </div>
      </GlobalAudio>
    </AuthProvider>
  )
}
