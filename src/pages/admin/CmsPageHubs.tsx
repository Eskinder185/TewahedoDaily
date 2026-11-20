import { useCallback, useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { countSynaxariumCommemorations, countSynaxariumDays } from '../../lib/synaxarium/synaxariumService'
import { getDashboard, getTaxonomy } from '../../lib/cms/mezmurService'
import { listSubmissions } from '../../lib/cms/submissionService'
import { useAuth } from '../../lib/auth/useAuth'
import { listHomepageSlides } from '../../lib/cms/homepageService'
import { listCollections } from '../../lib/cms/structureAdminService'
import { countPrayerGuides } from '../../lib/cms/prayerGuideAdminService'
import { listContent } from '../../lib/cms/contentService'
import { listCalendarCards } from '../../lib/cms/calendarAdminService'
import { loadOrthodoxCalendarCatalog } from '../../lib/calendar/orthodoxCalendarData'
import { useAsync } from '../../lib/cms/useAsync'
import { AdminOverviewGrid, AdminPageShell } from './AdminPageShell'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'

const HYMNS_TABS = [
  { to: '/admin/hymns', label: 'Overview', end: true },
  { to: '/admin/hymns/mezmur', label: 'All Mezmurs' },
  { to: '/admin/hymns/categories', label: 'Categories & Occasions' },
  { to: '/admin/hymns/zemaris', label: 'Zemaris' },
  { to: '/admin/hymns/browse-groups', label: 'Browse Collections' },
  { to: '/admin/hymns/review', label: 'Review Queue' },
]

const PRAY_TABS = [
  { to: '/admin/pray', label: 'Overview', end: true },
  { to: '/admin/pray/collections', label: 'Collections' },
  { to: '/admin/pray/prayers', label: 'Prayers' },
  { to: '/admin/pray/liturgy', label: 'Liturgy' },
  { to: '/admin/pray/guides', label: 'Learning / Guides' },
  { to: '/admin/pray/images', label: 'Images' },
]

const CALENDAR_TABS = [
  { to: '/admin/calendar', label: 'Overview', end: true },
  { to: '/admin/calendar/cards', label: 'Calendar Cards' },
  { to: '/admin/calendar/mezmurs', label: 'Hymn Links' },
  { to: '/admin/calendar/observances', label: 'Observances' },
  { to: '/admin/calendar/fasts', label: 'Fasts' },
  { to: '/admin/calendar/seasons', label: 'Seasons' },
  { to: '/admin/calendar/monthly', label: 'Monthly' },
  { to: '/admin/calendar/synaxarium', label: 'Synaxarium' },
  { to: '/admin/calendar/saints', label: 'Saints' },
  { to: '/admin/calendar/feasts', label: 'Feasts' },
  { to: '/admin/calendar/daily', label: 'Daily' },
]

const HOME_TABS = [
  { to: '/admin/home', label: 'Overview', end: true },
  { to: '/admin/home/slides', label: 'Hero slides' },
  { to: '/admin/home/daily', label: 'Daily preview' },
]

export function HomeAdminLayout() {
  return (
    <AdminPageShell
      eyebrow="EDITING: HOME"
      title="Home"
      description="Manage the content that appears on the public Home page — hero slides and today’s church preview."
      tabs={HOME_TABS}
    />
  )
}

export function HomeOverview() {
  const result = useAsync(useCallback(async () => {
    const slides = await listHomepageSlides(true)
    return { slides: slides.length, active: slides.filter((s) => s.active).length }
  }, []))

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      <AdminOverviewGrid
        tiles={[
          {
            to: '/admin/home/slides',
            label: 'Hero / intro slides',
            detail: 'homepage_slides carousel imagery and copy',
            count: result.data ? `${result.data.active} active / ${result.data.slides}` : '…',
          },
          {
            to: '/admin/home/daily',
            label: 'Today’s Church preview',
            detail: 'daily_content used on the homepage preview',
          },
          {
            to: '/admin/media',
            label: 'Media library',
            detail: 'Shared images for homepage slides',
          },
        ]}
      />
    </>
  )
}

export function HymnsAdminLayout() {
  return (
    <AdminPageShell
      eyebrow="EDITING: HYMNS PRACTICE"
      title="Hymns Practice"
      description="Manage Mezmurs, categories and occasions, Zemaris, public browse collections, and the review queue."
      tabs={HYMNS_TABS}
    />
  )
}

export function HymnsOverview() {
  const { profile } = useAuth()
  const navigate = useNavigate()
  const [searchText, setSearchText] = useState('')
  const role = profile?.role || ''
  const isStaff = role === 'editor' || role === 'admin' || role === 'super_admin'
  const isAdmin = role === 'admin' || role === 'super_admin'

  const result = useAsync(
    useCallback(async () => {
      const [dash, tax, submissions] = await Promise.all([
        getDashboard(),
        getTaxonomy(),
        listSubmissions('', '', 'mezmur', 1).catch(() => ({ rows: [], count: 0 })),
      ])
      const pendingSubmissions = submissions.rows.filter(
        (item) => item.status === 'submitted' || item.status === 'under_review' || item.status === 'needs_changes',
      ).length
      const recentMezmurs = dash.edited.filter((item) => item.type === 'mezmur').slice(0, 5)
      return {
        total: dash.counts[0],
        published: dash.counts[1],
        drafts: dash.counts[2],
        singers: tax.singers.length,
        categories: tax.categories.length,
        pendingSubmissions,
        reviewQueue: dash.counts[2] + pendingSubmissions,
        recentMezmurs,
      }
    }, []),
  )

  function onQuickSearch(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const query = searchText.trim()
    navigate(query ? `/admin/hymns/mezmur?search=${encodeURIComponent(query)}` : '/admin/hymns/mezmur')
  }

  return (
    <div className={s.stack} style={{ minWidth: 0, maxWidth: '100%' }}>
      <AsyncNotice {...result} retry={result.reload} />

      <div className={s.toolbar} style={{ flexWrap: 'wrap', gap: 10 }}>
        <form onSubmit={onQuickSearch} className={s.actions} style={{ flex: '1 1 260px', flexWrap: 'wrap', minWidth: 0 }}>
          <label className={s.srOnly} htmlFor="hymns-dashboard-search">Search Mezmurs</label>
          <input
            id="hymns-dashboard-search"
            type="search"
            value={searchText}
            onChange={(event) => setSearchText(event.target.value)}
            placeholder="Search Mezmurs by title, lyrics, or slug…"
            style={{ minWidth: 0, flex: '1 1 180px', maxWidth: 420 }}
          />
          <button type="submit">Search</button>
        </form>
        <Link to="/admin/hymns/mezmur/new" className={s.primary}>+ Add Mezmur</Link>
      </div>

      <div className={s.stats} aria-label="Hymns Practice summary">
        <div className={s.card}>
          <span>Total Mezmurs</span>
          <strong className={s.stat}>{result.data?.total ?? '…'}</strong>
        </div>
        <div className={s.card}>
          <span>Published</span>
          <strong className={s.stat}>{result.data?.published ?? '…'}</strong>
        </div>
        <div className={s.card}>
          <span>Unpublished (Draft)</span>
          <strong className={s.stat}>{result.data?.drafts ?? '…'}</strong>
        </div>
        <div className={s.card}>
          <span>Zemaris</span>
          <strong className={s.stat}>{result.data?.singers ?? '…'}</strong>
        </div>
        <div className={s.card}>
          <span>Review Queue</span>
          <strong className={s.stat}>{result.data?.reviewQueue ?? '…'}</strong>
        </div>
      </div>

      <AdminOverviewGrid
        tiles={[
          {
            to: '/admin/hymns/mezmur',
            label: 'All Mezmurs',
            detail: 'Create, edit, search, preview, and publish hymns.',
            count: result.data ? `${result.data.published} published / ${result.data.total}` : '…',
          },
          {
            to: '/admin/hymns/categories',
            label: 'Categories & Occasions',
            detail: 'View how saints, themes, and church feasts group hymns on the site.',
            count: result.data?.categories ?? '…',
          },
          {
            to: '/admin/hymns/zemaris',
            label: 'Zemaris',
            detail: 'Manage singer profiles and link hymns to each Zemari.',
            count: result.data?.singers ?? '…',
          },
          {
            to: '/admin/hymns/browse-groups',
            label: 'Browse Collections',
            detail: 'Manage top-level discovery cards and artwork in the public library.',
          },
          {
            to: '/admin/hymns/review',
            label: 'Review Queue',
            detail: 'Review draft Mezmurs and community Mezmur submissions.',
            count: result.data ? `${result.data.reviewQueue} items` : '…',
          },
        ]}
      />

      <section className={s.card}>
        <div className={s.sectionHeading}>
          <div><h2>Recent edits</h2></div>
          <p>Jump back into recently updated Mezmurs.</p>
        </div>
        {result.data?.recentMezmurs.length ? (
          <div className={s.tableWrap} style={{ marginTop: 12 }}>
            <table>
              <thead>
                <tr>
                  <th>Title</th>
                  <th>Status</th>
                  <th>Updated</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                {result.data.recentMezmurs.map((item) => (
                  <tr key={item.id}>
                    <td><strong>{item.title || 'Untitled Mezmur'}</strong></td>
                    <td><Status value={item.status} /></td>
                    <td>{item.updated_at ? new Date(item.updated_at).toLocaleDateString() : '—'}</td>
                    <td><Link to={`/admin/hymns/mezmur/${item.id}/edit`}>Edit</Link></td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ) : (
          <p className={s.muted} style={{ marginTop: 12 }}>No recent Mezmur edits found.</p>
        )}
      </section>

      {isStaff ? (
        <details className={s.advanced}>
          <summary>
            Advanced &amp; Recovery Tools <span>{isAdmin ? 'Admin / Editor tools' : 'Editor tools'}</span>
          </summary>
          <div className={s.advancedBody}>
            <p className={s.muted}>
              Bulk ingestion, automated classification, offline audit batches, and content recovery.
            </p>
            <div className={s.overviewGrid}>
              <Link to="/admin/hymns/import" className={s.overviewTile}>
                <strong>CSV Import</strong>
                <span className={s.muted}>Stage and validate spreadsheet rows as drafts.</span>
              </Link>
              <Link to="/admin/hymns/bulk" className={s.overviewTile}>
                <strong>Bulk Management</strong>
                <span className={s.muted}>Match Zemaris, classify lyrics, and safely batch-publish.</span>
              </Link>
              <Link to="/admin/hymns/mezmur/versions" className={s.overviewTile}>
                <strong>Version Review</strong>
                <span className={s.muted}>Inspect offline duplicate and version-pair audit batches.</span>
              </Link>
              {isAdmin ? (
                <Link to="/admin/hymns/trash" className={s.overviewTile}>
                  <strong>Trash &amp; Recovery</strong>
                  <span className={s.muted}>Restore deleted hymns/Zemaris or permanently delete with Super Admin approval.</span>
                </Link>
              ) : (
                <div className={s.overviewTile} aria-disabled="true">
                  <strong>Trash &amp; Recovery</strong>
                  <span className={s.muted}>Admin or Super Admin role required.</span>
                </div>
              )}
            </div>
          </div>
        </details>
      ) : null}
    </div>
  )
}

export function PrayAdminLayout() {
  return (
    <AdminPageShell
      eyebrow="EDITING: PRAY"
      title="Pray"
      description="Manage prayer collections, liturgy, and related media for the public Pray experience."
      tabs={PRAY_TABS}
    />
  )
}

export function PrayOverview() {
  const result = useAsync(
    useCallback(async () => {
      const [prayers, liturgy, guides] = await Promise.all([
        listCollections('prayers'),
        listCollections('liturgy'),
        countPrayerGuides().catch(() => 0),
      ])
      return { prayers: prayers.length, liturgy: liturgy.length, guides }
    }, []),
  )

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      <AdminOverviewGrid
        tiles={[
          {
            to: '/admin/pray/collections',
            label: 'Prayer collections',
            detail: 'prayer_collections, sections, and prayers',
            count: result.data?.prayers ?? '…',
          },
          {
            to: '/admin/pray/prayers',
            label: 'Prayers',
            detail: 'Sections and prayers inside collections',
          },
          {
            to: '/admin/pray/liturgy',
            label: 'Liturgy',
            detail: 'liturgy_collections, sections, and entries',
            count: result.data?.liturgy ?? '…',
          },
          {
            to: '/admin/pray/guides',
            label: 'Learning / Guides',
            detail: 'Educational Pray guides (prayer_guides)',
            count: result.data?.guides ?? '…',
          },
          {
            to: '/admin/pray/images',
            label: 'Images',
            detail: 'Prayer and liturgy media in the shared library',
          },
          {
            to: '/admin/calendar/synaxarium',
            label: 'Synaxarium',
            detail: 'Shared with Calendar — daily commemorations',
          },
        ]}
      />
    </>
  )
}

export function CalendarAdminLayout() {
  return (
    <AdminPageShell
      eyebrow="EDITING: CALENDAR"
      title="Calendar"
      description="Manage calendar cards, observances, fasts, seasons, monthly commemorations, Synaxarium, saints, feasts, and daily content."
      tabs={CALENDAR_TABS}
    />
  )
}

export function CalendarOverview() {
  const result = useAsync(
    useCallback(async () => {
      const [cards, days, commemorations, saints, feasts, catalog] = await Promise.all([
        listCalendarCards({ page: 1, pageSize: 1 }).catch(() => ({ total: 0 })),
        countSynaxariumDays().catch(() => 0),
        countSynaxariumCommemorations().catch(() => 0),
        listContent('saints', '', '', 1).catch(() => ({ total: 0 })),
        listContent('feasts', '', '', 1).catch(() => ({ total: 0 })),
        loadOrthodoxCalendarCatalog().catch(() => null),
      ])
      return {
        cards: cards.total,
        days,
        commemorations,
        saints: saints.total,
        feasts: feasts.total,
        observances: catalog?.observances.length ?? 0,
        fasts: catalog?.fasts.length ?? 0,
        seasons: catalog?.seasons.length ?? 0,
        monthly: catalog?.monthly.length ?? 0,
      }
    }, []),
  )

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      <AdminOverviewGrid
        tiles={[
          {
            to: '/admin/calendar/cards',
            label: 'Calendar Cards',
            detail: 'Curated visual strip (public.calendar_cards)',
            count: result.data?.cards ?? '…',
          },
          {
            to: '/admin/calendar/observances',
            label: 'Observances',
            detail: 'public.orthodox_observances',
            count: result.data?.observances ?? '…',
          },
          {
            to: '/admin/calendar/fasts',
            label: 'Fasts',
            detail: 'public.liturgical_fasts',
            count: result.data?.fasts ?? '…',
          },
          {
            to: '/admin/calendar/seasons',
            label: 'Seasons',
            detail: 'public.liturgical_seasons',
            count: result.data?.seasons ?? '…',
          },
          {
            to: '/admin/calendar/monthly',
            label: 'Monthly',
            detail: 'public.monthly_commemorations',
            count: result.data?.monthly ?? '…',
          },
          {
            to: '/admin/calendar/synaxarium',
            label: 'Synaxarium',
            detail: `${result.data?.days ?? '…'} days · ${result.data?.commemorations ?? '…'} commemorations`,
            count: result.data ? `${result.data.days} days` : '…',
          },
          {
            to: '/admin/calendar/saints',
            label: 'Saints',
            detail: 'public.saints',
            count: result.data?.saints ?? '…',
          },
          {
            to: '/admin/calendar/feasts',
            label: 'Feasts',
            detail: 'public.feasts',
            count: result.data?.feasts ?? '…',
          },
          {
            to: '/admin/calendar/daily',
            label: 'Daily content',
            detail: 'Today’s Church / daily highlights',
          },
        ]}
      />
    </>
  )
}

export function AboutAdminPage() {
  return (
    <AdminPageShell
      eyebrow="EDITING: ABOUT"
      title="About"
      description="About page content is currently static in the frontend. Use Settings for site-wide metadata when available."
      tabs={[{ to: '/admin/about', label: 'Overview', end: true }]}
      withOutlet={false}
    >
      <div className={s.card}>
        <h2>About page source</h2>
        <p className={s.muted}>
          The public About page ships as static React content. Contact details, mission text, and social
          links can be moved into <code>site_settings</code> later without changing the public design.
        </p>
        <div className={s.actions} style={{ marginTop: 16 }}>
          <Link to="/about" target="_blank" rel="noreferrer">
            Open public About →
          </Link>
          <Link to="/admin/settings">Site settings →</Link>
        </div>
      </div>
    </AdminPageShell>
  )
}
