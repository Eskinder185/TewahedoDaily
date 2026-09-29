import { lazy, Suspense } from 'react'
import { Navigate, Routes, Route } from 'react-router-dom'
import { AppShell } from './components/layout/AppShell'
import { PageLoadingFallback } from './components/ui/PageLoadingFallback'
import { useScrollToTopOnRouteChange } from './hooks/useScroll'
import { useLegacyMezmur } from './lib/publicContent/service'
import { contentKinds } from './lib/cms/contentService'
import { AdminErrorBoundary } from './pages/admin/AdminErrorBoundary'

// Lazy load all pages for code splitting
const HomePage = lazy(() => import('./pages/HomePage').then(m => ({ default: m.HomePage })))
const PracticePage = lazy(() => import('./pages/PracticePage').then(m => ({ default: m.PracticePage })))
const MezmurDetailPage = lazy(() => import('./pages/MezmurDetailPage').then(m => ({ default: m.MezmurDetailPage })))
const CalendarPage = lazy(() => import('./pages/CalendarPage').then(m => ({ default: m.CalendarPage })))
const AboutPage = lazy(() => import('./pages/AboutPage').then(m => ({ default: m.AboutPage })))
const PrayerListPage = lazy(() => import('./pages/PrayerListPage').then(m => ({ default: m.PrayerListPage })))
const PrayerCollectionPage = lazy(() => import('./pages/PrayerCollectionPage').then(m => ({ default: m.PrayerCollectionPage })))
const PrayerDetailPage = lazy(() => import('./pages/PrayerDetailPage').then(m => ({ default: m.PrayerDetailPage })))
const AdminAuthLayout = lazy(() => import('./pages/admin/AdminAuth').then(m => ({ default: m.AdminAuthLayout })))
const AdminLoginPage = lazy(() => import('./pages/admin/AdminAuth').then(m => ({ default: m.AdminLoginPage })))
const AdminLayout = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.AdminLayout })))
const AdminDashboard = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.AdminDashboard })))
const MezmurList = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.MezmurList })))
const MezmurEditor = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.MezmurEditor })))
const TaxonomyPage = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.TaxonomyPage })))
const AdminPlaceholder = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.AdminPlaceholder })))
const RequireCmsRole = lazy(() => import('./lib/auth/RequireCmsRole').then(m => ({ default: m.RequireCmsRole })))
const CommunityForm = lazy(() => import('./pages/CommunityForm').then(m => ({ default: m.CommunityForm })))
const SubmissionQueue = lazy(() => import('./pages/admin/SubmissionQueue').then(m => ({ default: m.SubmissionQueue })))
const SubmissionReview = lazy(() => import('./pages/admin/SubmissionReview').then(m => ({ default: m.SubmissionReview })))
const PublicMezmurLibrary = lazy(() => import('./pages/PublicMezmurLibrary').then(m => ({ default: m.PublicMezmurLibrary })))
const PublicMezmurDetail = lazy(() => import('./pages/PublicMezmurDetail').then(m => ({ default: m.PublicMezmurDetail })))
const PublicContentDetail = lazy(() => import('./pages/PublicContentDetail').then(m => ({ default: m.PublicContentDetail })))
const PublicAccount = lazy(() => import('./pages/PublicAccount').then(m => ({ default: m.PublicAccount })))
const Favorites = lazy(() => import('./pages/PublicAccount').then(m => ({ default: m.Favorites })))
const ContentList = lazy(() => import('./pages/admin/ContentManager').then(m => ({default:m.ContentList})))
const ContentEditor = lazy(() => import('./pages/admin/ContentManager').then(m => ({default:m.ContentEditor})))
const MediaLibrary = lazy(() => import('./pages/admin/MediaLibrary').then(m => ({default:m.MediaLibrary})))
const DailyContentAdmin = lazy(() => import('./pages/admin/DailyContentAdmin').then(m => ({default:m.DailyContentAdmin})))
const PublicContentLibrary = lazy(() => import('./pages/PublicContentLibrary').then(m => ({default:m.PublicContentLibrary})))
const TodayPage = lazy(() => import('./pages/TodayPage').then(m => ({ default: m.TodayPage })))

export default function App() {
  // Automatically scroll to top when route changes
  useScrollToTopOnRouteChange()
  
  return (
    <Routes>
      <Route path="/admin" element={<Suspense fallback={<PageLoadingFallback />}><AdminErrorBoundary><AdminAuthLayout /></AdminErrorBoundary></Suspense>}>
        <Route path="login" element={<AdminLoginPage />} />
        <Route element={<RequireCmsRole />}>
          <Route element={<AdminLayout />}>
            <Route index element={<AdminDashboard />} />
            <Route path="mezmur" element={<MezmurList />} />
            <Route path="mezmur/new" element={<MezmurEditor />} />
            <Route path="mezmur/:id/edit" element={<MezmurEditor />} />
            <Route path="categories" element={<TaxonomyPage />} />
            <Route path="singers" element={<TaxonomyPage />} />
            <Route path="tags" element={<TaxonomyPage />} />
            <Route element={<RequireCmsRole allowed={['editor', 'admin', 'super_admin']} />}>
              <Route path="submissions" element={<SubmissionQueue />} />
              <Route path="submissions/:id" element={<SubmissionReview />} />
            </Route>
            {contentKinds.map(kind=><Route key={kind} path={kind}><Route index element={<ContentList kind={kind}/>}/><Route path="new" element={<ContentEditor kind={kind}/>}/><Route path=":id/edit" element={<ContentEditor kind={kind}/>}/></Route>)}
            <Route element={<RequireCmsRole allowed={['admin','super_admin']}/>}><Route path="media" element={<MediaLibrary/>}/><Route path="daily" element={<DailyContentAdmin/>}/></Route>
            {['users', 'settings'].map(path => <Route key={path} path={path} element={<AdminPlaceholder />} />)}
          </Route>
        </Route>
        <Route path="*" element={<Navigate to="/admin" replace />} />
      </Route>
      <Route element={<AppShell />}>
        <Route path="/saints" element={<Suspense fallback={<PageLoadingFallback/>}><PublicContentLibrary kind="saints"/></Suspense>}/>
        <Route path="/feasts" element={<Suspense fallback={<PageLoadingFallback/>}><PublicContentLibrary kind="feasts"/></Suspense>}/>
        <Route path="/prayer-library" element={<Suspense fallback={<PageLoadingFallback/>}><PublicContentLibrary kind="prayers"/></Suspense>}/>
        <Route path="/search" element={<Navigate to="/" replace />} />
        <Route path="/teachings" element={<Navigate to="/" replace />} />
        <Route path="/teaching" element={<Navigate to="/" replace />} />
        <Route path="/articles" element={<Navigate to="/" replace />} />
        <Route path="/content/:kind/:slug" element={<Suspense fallback={<PageLoadingFallback />}><PublicContentDetail /></Suspense>} />
        <Route path="/account" element={<Suspense fallback={<PageLoadingFallback />}><PublicAccount /></Suspense>} />
        <Route path="/saved" element={<Suspense fallback={<PageLoadingFallback />}><Favorites /></Suspense>} />
        <Route path="/favorites" element={<Navigate to="/saved" replace />} />
        <Route path="/today" element={<Suspense fallback={<PageLoadingFallback />}><TodayPage /></Suspense>} />
        <Route path="/practice/werb" element={<Navigate to="/practice?form=werb" replace />} />
        <Route path="/submit-mezmur" element={<Suspense fallback={<PageLoadingFallback />}><CommunityForm /></Suspense>} />
        <Route path="/suggest-correction" element={<Suspense fallback={<PageLoadingFallback />}><CommunityForm /></Suspense>} />
        <Route path="/" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <HomePage />
          </Suspense>
        } />
        <Route path="/practice" element={
          <Suspense fallback={<PageLoadingFallback />}>
            {useLegacyMezmur ? <PracticePage /> : <PublicMezmurLibrary />}
          </Suspense>
        } />
        <Route path="/practice/mezmur/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            {useLegacyMezmur ? <MezmurDetailPage /> : <PublicMezmurDetail />}
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
