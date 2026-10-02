import { lazy, Suspense } from 'react'
import { Navigate, Routes, Route, useParams } from 'react-router-dom'
import { AppShell } from './components/layout/AppShell'
import { PageLoadingFallback } from './components/ui/PageLoadingFallback'
import { useScrollToTopOnRouteChange } from './hooks/useScroll'
import { AdminErrorBoundary } from './pages/admin/AdminErrorBoundary'

function LegacyMezmurEditRedirect() {
  const { id } = useParams()
  return <Navigate to={`/admin/hymns/mezmur/${id}/edit`} replace />
}

function LegacyPathRedirect({ to }: { to: string }) {
  const params = useParams()
  const resolved = to.replace(/:([A-Za-z_]+)/g, (_, key: string) => params[key] || '')
  return <Navigate to={resolved} replace />
}

function LegacyHomeSlideRedirect() {
  const { id } = useParams()
  if (!id || id === 'slides' || id === 'daily') return <Navigate to="/admin/home" replace />
  return <Navigate to={`/admin/home/slides/${id}/edit`} replace />
}

function LegacyCalendarCardRedirect() {
  const { id } = useParams()
  const reserved = new Set(['cards', 'synaxarium', 'saints', 'feasts', 'daily'])
  if (!id || reserved.has(id)) return <Navigate to="/admin/calendar" replace />
  return <Navigate to={`/admin/calendar/cards/${id}/edit`} replace />
}

// Lazy load all pages for code splitting
const HomePage = lazy(() => import('./pages/HomePage').then(m => ({ default: m.HomePage })))
const CalendarPage = lazy(() => import('./pages/CalendarPage').then(m => ({ default: m.CalendarPage })))
const AboutPage = lazy(() => import('./pages/AboutPage').then(m => ({ default: m.AboutPage })))
const LegalPage = lazy(() => import('./pages/LegalPage').then(m => ({ default: m.LegalPage })))
const PrayerListPage = lazy(() => import('./pages/PrayerListPage').then(m => ({ default: m.PrayerListPage })))
const LibraryCollectionRoute = lazy(() => import('./pages/LibraryCollectionRoute').then(m => ({ default: m.LibraryCollectionRoute })))
const LibraryItemRoute = lazy(() => import('./pages/LibraryItemRoute').then(m => ({ default: m.LibraryItemRoute })))
const AdminAuthLayout = lazy(() => import('./pages/admin/AdminAuth').then(m => ({ default: m.AdminAuthLayout })))
const AdminLoginPage = lazy(() => import('./pages/admin/AdminAuth').then(m => ({ default: m.AdminLoginPage })))
const AdminLayout = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.AdminLayout })))
const AdminDashboard = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.AdminDashboard })))
const MezmurList = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.MezmurList })))
const MezmurEditor = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.MezmurEditor })))
const TaxonomyPage = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.TaxonomyPage })))
const HymnBrowseGroupsList = lazy(() =>
  import('./pages/admin/HymnBrowseGroupsAdmin').then((m) => ({ default: m.HymnBrowseGroupsList })),
)
const HymnBrowseGroupEditor = lazy(() =>
  import('./pages/admin/HymnBrowseGroupsAdmin').then((m) => ({ default: m.HymnBrowseGroupEditor })),
)
const ZemarisList = lazy(() =>
  import('./pages/admin/ZemarisAdmin').then((m) => ({ default: m.ZemarisList })),
)
const ZemariEditor = lazy(() =>
  import('./pages/admin/ZemarisAdmin').then((m) => ({ default: m.ZemariEditor })),
)
const AdminPlaceholder = lazy(() => import('./pages/admin/adminPages').then(m => ({ default: m.AdminPlaceholder })))
const RequireCmsRole = lazy(() => import('./lib/auth/RequireCmsRole').then(m => ({ default: m.RequireCmsRole })))
const CommunityForm = lazy(() => import('./pages/CommunityForm').then(m => ({ default: m.CommunityForm })))
const SubmissionQueue = lazy(() => import('./pages/admin/SubmissionQueue').then(m => ({ default: m.SubmissionQueue })))
const SubmissionReview = lazy(() => import('./pages/admin/SubmissionReview').then(m => ({ default: m.SubmissionReview })))
const PublicMezmurLibrary = lazy(() => import('./pages/PublicMezmurLibrary').then(m => ({ default: m.PublicMezmurLibrary })))
const PublicMezmurDetail = lazy(() => import('./pages/PublicMezmurDetail').then(m => ({ default: m.PublicMezmurDetail })))
const PublicHymnCollectionPage = lazy(() =>
  import('./pages/PublicHymnCollectionPage').then((m) => ({ default: m.PublicHymnCollectionPage })),
)
const PublicHymnBrowseGroupPage = lazy(() =>
  import('./pages/PublicHymnBrowseGroupPage').then((m) => ({ default: m.PublicHymnBrowseGroupPage })),
)
const PublicHymnSectionPage = lazy(() =>
  import('./pages/PublicHymnSectionPage').then((m) => ({ default: m.PublicHymnSectionPage })),
)
const PublicContentDetail = lazy(() => import('./pages/PublicContentDetail').then(m => ({ default: m.PublicContentDetail })))
const PublicAccount = lazy(() => import('./pages/auth/AccountPages').then(m => ({ default: m.AccountHomePage })))
const Favorites = lazy(() => import('./pages/PublicAccount').then(m => ({ default: m.Favorites })))
const LoginPage = lazy(() => import('./pages/auth/LoginPage').then(m => ({ default: m.LoginPage })))
const SignupPage = lazy(() => import('./pages/auth/SignupPage').then(m => ({ default: m.SignupPage })))
const AccountFavoritesPage = lazy(() => import('./pages/auth/AccountPages').then(m => ({ default: m.AccountFavoritesPage })))
const AccountPrayerProgressPage = lazy(() => import('./pages/auth/AccountPages').then(m => ({ default: m.AccountPrayerProgressPage })))
const AccountActivityPage = lazy(() => import('./pages/auth/AccountPages').then(m => ({ default: m.AccountActivityPage })))
const RequireAuth = lazy(() => import('./lib/auth/RequireAuth').then(m => ({ default: m.RequireAuth })))
const ContentList = lazy(() => import('./pages/admin/ContentManager').then(m => ({default:m.ContentList})))
const ContentEditor = lazy(() => import('./pages/admin/ContentManager').then(m => ({default:m.ContentEditor})))
const MediaLibrary = lazy(() => import('./pages/admin/MediaLibrary').then(m => ({default:m.MediaLibrary})))
const DailyContentAdmin = lazy(() => import('./pages/admin/DailyContentAdmin').then(m => ({default:m.DailyContentAdmin})))
const HomepageAdmin = lazy(() => import('./pages/admin/HomepageAdmin').then(m => ({ default: m.HomepageAdmin })))
const HomepageSlideEditor = lazy(() => import('./pages/admin/HomepageAdmin').then(m => ({ default: m.HomepageSlideEditor })))
const StructureCollectionList = lazy(() => import('./pages/admin/StructureAdmin').then(m => ({ default: m.StructureCollectionList })))
const StructureCollectionEditor = lazy(() => import('./pages/admin/StructureAdmin').then(m => ({ default: m.StructureCollectionEditor })))
const SynaxariumAdmin = lazy(() => import('./pages/admin/StructureAdmin').then(m => ({ default: m.SynaxariumAdmin })))
const SynaxariumDayEditor = lazy(() => import('./pages/admin/StructureAdmin').then(m => ({ default: m.SynaxariumDayEditor })))
const CalendarAdmin = lazy(() => import('./pages/admin/CalendarAdmin').then(m => ({ default: m.CalendarAdmin })))
const CalendarCardEditor = lazy(() => import('./pages/admin/CalendarAdmin').then(m => ({ default: m.CalendarCardEditor })))
const HomeAdminLayout = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.HomeAdminLayout })))
const HomeOverview = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.HomeOverview })))
const HymnsAdminLayout = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.HymnsAdminLayout })))
const HymnsOverview = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.HymnsOverview })))
const PrayAdminLayout = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.PrayAdminLayout })))
const PrayOverview = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.PrayOverview })))
const PrayerGuidesAdmin = lazy(() => import('./pages/admin/PrayerGuidesAdmin').then(m => ({ default: m.PrayerGuidesAdmin })))
const PrayerGuideEditor = lazy(() => import('./pages/admin/PrayerGuidesAdmin').then(m => ({ default: m.PrayerGuideEditor })))
const PrayerGuidePage = lazy(() => import('./pages/PrayerGuidePage').then(m => ({ default: m.PrayerGuidePage })))
const CalendarAdminLayout = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.CalendarAdminLayout })))
const CalendarOverview = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.CalendarOverview })))
const OrthodoxyObservancesAdmin = lazy(() =>
  import('./pages/admin/OrthodoxyRulesAdmin').then((m) => ({ default: m.OrthodoxyObservancesAdmin })),
)
const OrthodoxyFastsAdmin = lazy(() =>
  import('./pages/admin/OrthodoxyRulesAdmin').then((m) => ({ default: m.OrthodoxyFastsAdmin })),
)
const OrthodoxySeasonsAdmin = lazy(() =>
  import('./pages/admin/OrthodoxyRulesAdmin').then((m) => ({ default: m.OrthodoxySeasonsAdmin })),
)
const OrthodoxyMonthlyAdmin = lazy(() =>
  import('./pages/admin/OrthodoxyRulesAdmin').then((m) => ({ default: m.OrthodoxyMonthlyAdmin })),
)
const AboutAdminPage = lazy(() => import('./pages/admin/CmsPageHubs').then(m => ({ default: m.AboutAdminPage })))
const ContentHealthAdmin = lazy(() =>
  import('./pages/admin/ContentHealthAdmin').then((m) => ({ default: m.ContentHealthAdmin })),
)
const PublicContentLibrary = lazy(() => import('./pages/PublicContentLibrary').then(m => ({default:m.PublicContentLibrary})))
const TodayPage = lazy(() => import('./pages/TodayPage').then(m => ({ default: m.TodayPage })))
const NotFoundPage = lazy(() => import('./pages/NotFoundPage').then(m => ({ default: m.NotFoundPage })))

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

            {/* Page-based CMS: Home */}
            <Route path="home" element={<HomeAdminLayout />}>
              <Route index element={<HomeOverview />} />
              <Route path="slides" element={<HomepageAdmin />} />
              <Route path="slides/new" element={<HomepageSlideEditor />} />
              <Route path="slides/:id/edit" element={<HomepageSlideEditor />} />
              <Route path="daily" element={<DailyContentAdmin />} />
              <Route path="new" element={<Navigate to="/admin/home/slides/new" replace />} />
              <Route path=":id/edit" element={<LegacyHomeSlideRedirect />} />
            </Route>

            {/* Page-based CMS: Hymns Practice */}
            <Route path="hymns" element={<HymnsAdminLayout />}>
              <Route index element={<HymnsOverview />} />
              <Route path="mezmur" element={<MezmurList />} />
              <Route path="mezmur/new" element={<MezmurEditor />} />
              <Route path="mezmur/:id/edit" element={<MezmurEditor />} />
              <Route path="browse-groups" element={<HymnBrowseGroupsList />} />
              <Route path="browse-groups/new" element={<HymnBrowseGroupEditor />} />
              <Route path="browse-groups/:id/edit" element={<HymnBrowseGroupEditor />} />
              <Route path="zemaris" element={<ZemarisList />} />
              <Route path="zemaris/new" element={<ZemariEditor />} />
              <Route path="zemaris/:id/edit" element={<ZemariEditor />} />
              <Route path="singers" element={<Navigate to="/admin/hymns/zemaris" replace />} />
              <Route path="categories" element={<TaxonomyPage kind="categories" />} />
              <Route path="occasions" element={<TaxonomyPage kind="occasions" />} />
              <Route path="tags" element={<TaxonomyPage kind="tags" />} />
            </Route>

            {/* Page-based CMS: Pray */}
            <Route path="pray" element={<PrayAdminLayout />}>
              <Route index element={<PrayOverview />} />
              <Route path="collections" element={<StructureCollectionList kind="prayers" basePath="/admin/pray/collections" />} />
              <Route path="collections/new" element={<StructureCollectionEditor kind="prayers" basePath="/admin/pray/collections" />} />
              <Route path="collections/:id/edit" element={<StructureCollectionEditor kind="prayers" basePath="/admin/pray/collections" />} />
              <Route path="prayers" element={<StructureCollectionList kind="prayers" basePath="/admin/pray/prayers" />} />
              <Route path="prayers/new" element={<StructureCollectionEditor kind="prayers" basePath="/admin/pray/prayers" />} />
              <Route path="prayers/:id/edit" element={<StructureCollectionEditor kind="prayers" basePath="/admin/pray/prayers" />} />
              <Route path="liturgy" element={<StructureCollectionList kind="liturgy" basePath="/admin/pray/liturgy" />} />
              <Route path="liturgy/new" element={<StructureCollectionEditor kind="liturgy" basePath="/admin/pray/liturgy" />} />
              <Route path="liturgy/:id/edit" element={<StructureCollectionEditor kind="liturgy" basePath="/admin/pray/liturgy" />} />
              <Route path="guides" element={<PrayerGuidesAdmin />} />
              <Route path="guides/new" element={<PrayerGuideEditor />} />
              <Route path="guides/:id/edit" element={<PrayerGuideEditor />} />
              <Route path="images" element={<MediaLibrary />} />
            </Route>

            {/* Page-based CMS: Calendar */}
            <Route path="calendar" element={<CalendarAdminLayout />}>
              <Route index element={<CalendarOverview />} />
              <Route path="cards" element={<CalendarAdmin />} />
              <Route path="cards/new" element={<CalendarCardEditor />} />
              <Route path="cards/:id/edit" element={<CalendarCardEditor />} />
              <Route path="observances" element={<OrthodoxyObservancesAdmin />} />
              <Route path="fasts" element={<OrthodoxyFastsAdmin />} />
              <Route path="seasons" element={<OrthodoxySeasonsAdmin />} />
              <Route path="monthly" element={<OrthodoxyMonthlyAdmin />} />
              <Route path="synaxarium" element={<SynaxariumAdmin />} />
              <Route path="synaxarium/:id/edit" element={<SynaxariumDayEditor />} />
              <Route path="saints">
                <Route index element={<ContentList kind="saints" />} />
                <Route path="new" element={<ContentEditor kind="saints" />} />
                <Route path=":id/edit" element={<ContentEditor kind="saints" />} />
              </Route>
              <Route path="feasts">
                <Route index element={<ContentList kind="feasts" />} />
                <Route path="new" element={<ContentEditor kind="feasts" />} />
                <Route path=":id/edit" element={<ContentEditor kind="feasts" />} />
              </Route>
              <Route path="daily" element={<DailyContentAdmin />} />
              <Route path="new" element={<Navigate to="/admin/calendar/cards/new" replace />} />
              <Route path=":id/edit" element={<LegacyCalendarCardRedirect />} />
            </Route>

            <Route path="about" element={<AboutAdminPage />} />

            <Route element={<RequireCmsRole allowed={['editor', 'admin', 'super_admin']} />}>
              <Route path="content-health" element={<ContentHealthAdmin />} />
              <Route path="submissions" element={<SubmissionQueue />} />
              <Route path="submissions/:id" element={<SubmissionReview />} />
            </Route>

            <Route element={<RequireCmsRole allowed={['admin', 'super_admin']} />}>
              <Route path="media" element={<MediaLibrary />} />
            </Route>

            {/* Articles remain available but not in the page-based sidebar */}
            <Route path="articles">
              <Route index element={<ContentList kind="articles" />} />
              <Route path="new" element={<ContentEditor kind="articles" />} />
              <Route path=":id/edit" element={<ContentEditor kind="articles" />} />
            </Route>

            {['users', 'settings'].map(path => (
              <Route key={path} path={path} element={<AdminPlaceholder />} />
            ))}

            {/* Legacy redirects */}
            <Route path="mezmur" element={<Navigate to="/admin/hymns/mezmur" replace />} />
            <Route path="mezmur/new" element={<Navigate to="/admin/hymns/mezmur/new" replace />} />
            <Route path="mezmur/:id/edit" element={<LegacyMezmurEditRedirect />} />
            <Route path="prayers" element={<Navigate to="/admin/pray/collections" replace />} />
            <Route path="prayers/new" element={<Navigate to="/admin/pray/collections/new" replace />} />
            <Route path="prayers/:id/edit" element={<LegacyPathRedirect to="/admin/pray/collections/:id/edit" />} />
            <Route path="liturgy" element={<Navigate to="/admin/pray/liturgy" replace />} />
            <Route path="liturgy/new" element={<Navigate to="/admin/pray/liturgy/new" replace />} />
            <Route path="liturgy/:id/edit" element={<LegacyPathRedirect to="/admin/pray/liturgy/:id/edit" />} />
            <Route path="synaxarium" element={<Navigate to="/admin/calendar/synaxarium" replace />} />
            <Route path="synaxarium/:id/edit" element={<LegacyPathRedirect to="/admin/calendar/synaxarium/:id/edit" />} />
            <Route path="saints" element={<Navigate to="/admin/calendar/saints" replace />} />
            <Route path="saints/new" element={<Navigate to="/admin/calendar/saints/new" replace />} />
            <Route path="saints/:id/edit" element={<LegacyPathRedirect to="/admin/calendar/saints/:id/edit" />} />
            <Route path="feasts" element={<Navigate to="/admin/calendar/feasts" replace />} />
            <Route path="feasts/new" element={<Navigate to="/admin/calendar/feasts/new" replace />} />
            <Route path="feasts/:id/edit" element={<LegacyPathRedirect to="/admin/calendar/feasts/:id/edit" />} />
            <Route path="categories" element={<Navigate to="/admin/hymns/categories" replace />} />
            <Route path="singers" element={<Navigate to="/admin/hymns/zemaris" replace />} />
            <Route path="tags" element={<Navigate to="/admin/hymns/tags" replace />} />
            <Route path="daily" element={<Navigate to="/admin/calendar/daily" replace />} />
          </Route>
        </Route>
        <Route path="*" element={<Navigate to="/admin" replace />} />
      </Route>
      <Route element={<AppShell />}>
        <Route path="/saints" element={<Suspense fallback={<PageLoadingFallback/>}><PublicContentLibrary kind="saints"/></Suspense>}/>
        <Route path="/feasts" element={<Suspense fallback={<PageLoadingFallback/>}><PublicContentLibrary kind="feasts"/></Suspense>}/>
        <Route path="/prayer-library" element={<Navigate to="/prayers" replace />} />
        <Route path="/search" element={<Navigate to="/" replace />} />
        <Route path="/teachings" element={<Navigate to="/" replace />} />
        <Route path="/teaching" element={<Navigate to="/" replace />} />
        <Route path="/articles" element={<Navigate to="/" replace />} />
        <Route path="/content/:kind/:slug" element={<Suspense fallback={<PageLoadingFallback />}><PublicContentDetail /></Suspense>} />
        <Route path="/login" element={<Suspense fallback={<PageLoadingFallback />}><LoginPage /></Suspense>} />
        <Route path="/signup" element={<Suspense fallback={<PageLoadingFallback />}><SignupPage /></Suspense>} />
        <Route path="/account" element={<Suspense fallback={<PageLoadingFallback />}><PublicAccount /></Suspense>} />
        <Route element={<Suspense fallback={<PageLoadingFallback />}><RequireAuth /></Suspense>}>
          <Route path="/account/favorites" element={<Suspense fallback={<PageLoadingFallback />}><AccountFavoritesPage /></Suspense>} />
          <Route path="/account/prayer-progress" element={<Suspense fallback={<PageLoadingFallback />}><AccountPrayerProgressPage /></Suspense>} />
          <Route path="/account/activity" element={<Suspense fallback={<PageLoadingFallback />}><AccountActivityPage /></Suspense>} />
        </Route>
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
            <PublicMezmurLibrary />
          </Suspense>
        } />
        <Route path="/hymns" element={<Navigate to="/practice" replace />} />
        <Route path="/hymns/browse/:collectionSlug/:sectionSlug" element={
          <LegacyPathRedirect to="/practice/browse/:collectionSlug/:sectionSlug" />
        } />
        <Route
          path="/hymns/browse/:slug"
          element={<LegacyPathRedirect to="/practice/browse/:slug" />}
        />
        <Route path="/hymns/occasion/:slug" element={<LegacyPathRedirect to="/practice/occasion/:slug" />} />
        <Route path="/hymns/category/:slug" element={<LegacyPathRedirect to="/practice/category/:slug" />} />
        <Route path="/hymns/singer/:slug" element={<LegacyPathRedirect to="/practice/zemari/:slug" />} />
        <Route path="/hymns/zemari/:slug" element={<LegacyPathRedirect to="/practice/zemari/:slug" />} />
        <Route path="/practice/browse/:collectionSlug/:sectionSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnSectionPage />
          </Suspense>
        } />
        <Route path="/practice/browse/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnBrowseGroupPage />
          </Suspense>
        } />
        <Route path="/practice/occasions" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="occasions" />
          </Suspense>
        } />
        <Route path="/practice/categories" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="categories" />
          </Suspense>
        } />
        <Route path="/practice/singers" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="singers" />
          </Suspense>
        } />
        <Route path="/practice/zemaris" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="singers" />
          </Suspense>
        } />
        <Route path="/practice/occasion/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="occasion" />
          </Suspense>
        } />
        <Route path="/practice/category/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="category" />
          </Suspense>
        } />
        <Route path="/practice/singer/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="singer" />
          </Suspense>
        } />
        <Route path="/practice/zemari/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicHymnCollectionPage kind="singer" />
          </Suspense>
        } />
        <Route path="/practice/mezmur/:slug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PublicMezmurDetail />
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
        <Route path="/legal" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <LegalPage />
          </Suspense>
        } />
        <Route path="/pray" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayerListPage />
          </Suspense>
        } />
        <Route path="/pray/zeweter" element={<Navigate to="/pray/zewter-tselot" replace />} />
        <Route path="/pray/zeweter-tselot" element={<Navigate to="/pray/zewter-tselot" replace />} />
        <Route path="/pray/wudasie-mariam" element={<Navigate to="/pray/wudase-mariam" replace />} />
        <Route path="/pray/learn-how-to-pray" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <PrayerGuidePage />
          </Suspense>
        } />
        <Route path="/pray/:collectionSlug/:prayerSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <LibraryItemRoute />
          </Suspense>
        } />
        <Route path="/pray/:collectionSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <LibraryCollectionRoute />
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
        <Route path="/prayers/zeweter-tselot" element={
          <Navigate to="/pray/zewter-tselot" replace />
        } />
        <Route path="/prayers/zewter-tselot" element={
          <Navigate to="/pray/zewter-tselot" replace />
        } />
        <Route path="/prayers/wudasie-mariam" element={
          <Navigate to="/pray/wudase-mariam" replace />
        } />
        <Route path="/prayers/wudase-mariam" element={
          <Navigate to="/pray/wudase-mariam" replace />
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
        <Route path="/prayers/divine-liturgy" element={
          <Navigate to="/pray/divine-liturgy" replace />
        } />
        <Route path="/prayers/synaxarium" element={
          <Navigate to="/pray/synaxarium" replace />
        } />
        <Route path="/prayers/:collectionSlug/:prayerSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <LibraryItemRoute />
          </Suspense>
        } />
        <Route path="/prayers/:collectionSlug" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <LibraryCollectionRoute />
          </Suspense>
        } />
        <Route path="*" element={
          <Suspense fallback={<PageLoadingFallback />}>
            <NotFoundPage />
          </Suspense>
        } />
      </Route>
    </Routes>
  )
}
