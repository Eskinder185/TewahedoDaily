import { lazy, Suspense } from 'react'
import { Routes, Route } from 'react-router-dom'
import { AppShell } from './components/layout/AppShell'
import { PageLoadingFallback } from './components/ui/PageLoadingFallback'

// Lazy load all pages for code splitting
const HomePage = lazy(() => import('./pages/HomePage').then(m => ({ default: m.HomePage })))
const PracticePage = lazy(() => import('./pages/PracticePage').then(m => ({ default: m.PracticePage })))
const CalendarPage = lazy(() => import('./pages/CalendarPage').then(m => ({ default: m.CalendarPage })))
const AboutPage = lazy(() => import('./pages/AboutPage').then(m => ({ default: m.AboutPage })))
const PrayersHubPage = lazy(() => import('./pages/PrayersHubPage').then(m => ({ default: m.PrayersHubPage })))
const ZeweterTselotPage = lazy(() => import('./pages/ZeweterTselotPage').then(m => ({ default: m.ZeweterTselotPage })))
const WudaseMariamPage = lazy(() => import('./pages/WudaseMariamPage').then(m => ({ default: m.WudaseMariamPage })))
const MezmureDawitPage = lazy(() => import('./pages/MezmureDawitPage').then(m => ({ default: m.MezmureDawitPage })))
const YekidaneTselotPage = lazy(() => import('./pages/YekidaneTselotPage').then(m => ({ default: m.YekidaneTselotPage })))
const MehareneAbPage = lazy(() => import('./pages/MehareneAbPage').then(m => ({ default: m.MehareneAbPage })))

export default function App() {
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
        <Route path="/prayers" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayersHubPage />
          </Suspense>
        } />
        <Route path="/prayers/zeweter" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <ZeweterTselotPage />
          </Suspense>
        } />
        <Route path="/prayers/wudase-mariam" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <WudaseMariamPage />
          </Suspense>
        } />
        <Route path="/prayers/mezmure-dawit" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <MezmureDawitPage />
          </Suspense>
        } />
        <Route path="/prayers/yekidane-tselot" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <YekidaneTselotPage />
          </Suspense>
        } />
        <Route path="/prayers/meharene-ab" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <MehareneAbPage />
          </Suspense>
        } />
      </Route>
    </Routes>
  )
}
