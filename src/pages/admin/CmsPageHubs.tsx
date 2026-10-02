import { useCallback } from 'react'
import { Link } from 'react-router-dom'
import { countSynaxariumCommemorations, countSynaxariumDays } from '../../lib/synaxarium/synaxariumService'
import { getDashboard, getTaxonomy } from '../../lib/cms/mezmurService'
import { listHomepageSlides } from '../../lib/cms/homepageService'
import { listCollections } from '../../lib/cms/structureAdminService'
import { countPrayerGuides } from '../../lib/cms/prayerGuideAdminService'
import { listContent } from '../../lib/cms/contentService'
import { listCalendarCards } from '../../lib/cms/calendarAdminService'
import { loadOrthodoxCalendarCatalog } from '../../lib/calendar/orthodoxCalendarData'
import { useAsync } from '../../lib/cms/useAsync'
import { AdminOverviewGrid, AdminPageShell } from './AdminPageShell'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

const HYMNS_TABS = [
  { to: '/admin/hymns', label: 'Overview', end: true },
  { to: '/admin/hymns/mezmur', label: 'Mezmur' },
  { to: '/admin/hymns/browse-groups', label: 'Browse Groups' },
  { to: '/admin/hymns/occasions', label: 'Occasions' },
  { to: '/admin/hymns/categories', label: 'Categories' },
  { to: '/admin/hymns/zemaris', label: 'Zemaris' },
  { to: '/admin/hymns/tags', label: 'Tags' },
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
      description="Manage Mezmur, browse groups, Zemaris, categories, and tags that power Hymns Practice discovery."
      tabs={HYMNS_TABS}
    />
  )
}

export function HymnsOverview() {
  const result = useAsync(
    useCallback(async () => {
      const [dash, tax] = await Promise.all([getDashboard(), getTaxonomy()])
      return {
        mezmur: dash.counts[0],
        published: dash.counts[1],
        singers: tax.singers.length,
        categories: tax.categories.length,
        tags: tax.tags.length,
      }
    }, []),
  )

  return (
    <>
      <AsyncNotice {...result} retry={result.reload} />
      <AdminOverviewGrid
        tiles={[
          {
            to: '/admin/hymns/mezmur',
            label: 'Mezmur',
            detail: 'Hymn library (public.mezmur)',
            count: result.data ? `${result.data.published} published / ${result.data.mezmur}` : '…',
          },
          {
            to: '/admin/hymns/browse-groups',
            label: 'Browse Groups',
            detail: 'Level-1 Hymns Practice discovery cards',
          },
          {
            to: '/admin/hymns/occasions',
            label: 'Occasions',
            detail: 'Derived from mezmur_occasion_links_import',
          },
          {
            to: '/admin/hymns/zemaris',
            label: 'Zemaris',
            detail: 'public.zemaris — singer profiles for Hymn Practice',
            count: result.data?.singers ?? '…',
          },
          {
            to: '/admin/hymns/categories',
            label: 'Categories',
            detail: 'Derived from mezmur_category_links_import',
            count: result.data?.categories ?? '…',
          },
          {
            to: '/admin/hymns/tags',
            label: 'Tags',
            detail: 'Optional tags table (empty is OK)',
            count: result.data?.tags ?? '…',
          },
          {
            to: '/admin/submissions',
            label: 'Community submissions',
            detail: 'Review Mezmur submissions workflow',
          },
        ]}
      />
      <p className={s.muted} style={{ marginTop: 16 }}>
        <Link to="/admin/hymns/mezmur/new">+ Add Mezmur</Link>
      </p>
    </>
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
