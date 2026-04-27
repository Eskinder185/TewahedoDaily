import { lazy, Suspense } from 'react'
import { Navigate, Routes, Route } from 'react-router-dom'
import { AppShell } from './components/layout/AppShell'
import { PageLoadingFallback } from './components/ui/PageLoadingFallback'
import { useScrollToTopOnRouteChange } from './hooks/useScroll'

// Lazy load all pages for code splitting
const HomePage = lazy(() => import('./pages/HomePage').then(m => ({ default: m.HomePage })))
const PracticePage = lazy(() => import('./pages/PracticePage').then(m => ({ default: m.PracticePage })))
const MezmurDetailPage = lazy(() => import('./pages/MezmurDetailPage').then(m => ({ default: m.MezmurDetailPage })))
const CalendarPage = lazy(() => import('./pages/CalendarPage').then(m => ({ default: m.CalendarPage })))
const AboutPage = lazy(() => import('./pages/AboutPage').then(m => ({ default: m.AboutPage })))
const PrayerListPage = lazy(() => import('./pages/PrayerListPage').then(m => ({ default: m.PrayerListPage })))
const PrayerCollectionPage = lazy(() => import('./pages/PrayerCollectionPage').then(m => ({ default: m.PrayerCollectionPage })))
const PrayerDetailPage = lazy(() => import('./pages/PrayerDetailPage').then(m => ({ default: m.PrayerDetailPage })))

export default function App() {
  // Automatically scroll to top when route changes
  useScrollToTopOnRouteChange()
  
  return (
    <Routes>
      <Route element={<AppShell />}>
        <Route path="/" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <HomePage />
          </Suspense>
        } />
        <Route path="/practice" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PracticePage />
          </Suspense>
        } />
        <Route path="/practice/mezmur/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <MezmurDetailPage />
          </Suspense>
        } />
        <Route path="/calendar" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <CalendarPage />
          </Suspense>
        } />
        <Route path="/about" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <AboutPage />
          </Suspense>
        } />
        <Route path="/pray" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayerListPage />
          </Suspense>
        } />
        <Route path="/pray/:collectionSlug/:prayerSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayerDetailPage />
          </Suspense>
        } />
        <Route path="/pray/:collectionSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayerCollectionPage />
          </Suspense>
        } />
        <Route path="/prayers" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayerListPage />
          </Suspense>
        } />
        <Route path="/prayers/zeweter" element={
          <Navigate to="/pray/zewter-tselot" replace />
        } />
        <Route path="/prayers/wudase-mariam" element={
          <Navigate to="/pray/wudasie-mariam" replace />
        } />
        <Route path="/prayers/mezmure-dawit" element={
          <Navigate to="/pray/mezmure-dawit" replace />
        } />
        <Route path="/prayers/yekidane-tselot" element={
          <Navigate to="/pray/yekidane-tselot" replace />
        } />
        <Route path="/prayers/meharene-ab" element={
          <Navigate to="/pray/meharene-ab" replace />
        } />
      </Route>
    </Routes>
  )
}
