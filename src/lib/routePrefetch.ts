/**
 * Warm the destination route module on pointer intent.
 * Maps to the same dynamic imports used by React.lazy in App.tsx.
 */
const warmed = new Set<string>()

const loaders: Array<{ match: (path: string) => boolean; load: () => Promise<unknown> }> = [
  { match: (path) => path === '/' || path === '', load: () => import('../pages/HomePage') },
  {
    match: (path) => /^\/pray\/[^/]+\/[^/]+/.test(path) || /^\/prayers\/[^/]+\/[^/]+/.test(path),
    load: () => import('../pages/LibraryItemRoute'),
  },
  {
    match: (path) =>
      (/^\/pray\/[^/]+/.test(path) && path !== '/pray') ||
      (/^\/prayers\/[^/]+/.test(path) && path !== '/prayers'),
    load: () => import('../pages/LibraryCollectionRoute'),
  },
  { match: (path) => path.startsWith('/pray') || path.startsWith('/prayers'), load: () => import('../pages/PrayerListPage') },
  {
    match: (path) => path.startsWith('/practice/browse/') && path.split('/').filter(Boolean).length > 3,
    load: () => import('../pages/PublicHymnSectionPage'),
  },
  {
    match: (path) => path.startsWith('/practice/browse/'),
    load: () => import('../pages/PublicHymnBrowseGroupPage'),
  },
  { match: (path) => path.startsWith('/practice/mezmur/'), load: () => import('../pages/PublicMezmurDetail') },
  {
    match: (path) =>
      /\/practice\/(occasion|category|zemari|singer|occasions|categories|zemaris|singers)(\/|$)/.test(
        path,
      ),
    load: () => import('../pages/PublicHymnCollectionPage'),
  },
  {
    match: (path) => path === '/practice' || path === '/hymns',
    load: () => import('../pages/PublicMezmurLibrary'),
  },
  { match: (path) => path.startsWith('/calendar'), load: () => import('../pages/CalendarPage') },
  { match: (path) => path.startsWith('/bible'), load: () => import('../pages/BiblePage') },
  { match: (path) => path.startsWith('/about'), load: () => import('../pages/AboutPage') },
  { match: (path) => path.startsWith('/account'), load: () => import('../pages/auth/AccountPages') },
  { match: (path) => path.startsWith('/library'), load: () => import('../pages/PublicChurchLibrary') },
  { match: (path) => path === '/play', load: () => import('../pages/play/PlayHubPage') },
]

export function prefetchRoute(to: string) {
  const path = to.split('?')[0].split('#')[0]
  if (!path || warmed.has(path)) return
  const loader = loaders.find((entry) => entry.match(path))
  if (!loader) return
  warmed.add(path)
  void loader.load()
}

export function prefetchPrimaryNav() {
  prefetchRoute('/pray')
  prefetchRoute('/hymns')
  prefetchRoute('/calendar')
  prefetchRoute('/bible')
  prefetchRoute('/play')
}
