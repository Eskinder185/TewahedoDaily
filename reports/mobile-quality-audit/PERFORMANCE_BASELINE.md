# Performance baseline — 2026-10-27

## Method

- Target: `https://tewahedodaily.pages.dev/` (deployed production; not the local worktree build).
- Browser: Playwright Chromium, headless, 390 × 844 CSS pixels, ordinary desktop-network connection.
- Navigation wait: `networkidle`; resource data from the browser Performance Resource Timing API.
- This is a lab measurement, not RUM. It cannot establish field LCP, INP, or Core Web Vitals percentiles.
- Lighthouse was not installed in the repository, and the locally installed Playwright WebKit executable was unavailable, so no Lighthouse score or Safari/WebKit result is reported.

## Production homepage baseline

| Metric | Result |
| --- | ---: |
| Requests observed after `networkidle` | 95 |
| Browser-reported transferred bytes | 688,889 B |
| Console errors | 0 |
| Supabase REST requests | 5 |
| Supabase Storage image requests | 2 |

Largest transferred resources were `vendor-COuBdY64.js` (277,997 B), `calendarPresentation-DkyFd5CU.js` (121,107 B), `react-vendor-DAXjE501.js` (90,672 B), and the home hero WebP (72,372 B).

The local `dist` inspected during this audit has code splitting enabled. Its largest JavaScript artifacts are the vendor chunk (953,515 B uncompressed), the optional PDF worker (1,189,100 B), the lazy Whisper worker (853,432 B), and the lazy calendar presentation chunk (450,848 B). The PDF/Whisper assets are not in the observed initial production-home request list.

## Network observations

The initial homepage caused these live Supabase reads:

1. `orthodox_observances?select=*&status=eq.published`
2. `liturgical_fasts?select=*&status=eq.published`
3. `liturgical_seasons?select=*&status=eq.published`
4. `monthly_commemorations?select=*&status=eq.published`
5. `calendar_cards?...&status=eq.published&order=sort_order.asc&limit=500`

The first four use `select=*`; the calendar-card request selects a long metadata list and up to 500 rows. The requests are plausibly needed for the home-day/calendar context, but they are the clearest high-value follow-up for request/payload reduction: return only fields required for the Home companion, cache stable published rules/cards, and defer wider card metadata to Calendar detail interactions. This should be benchmarked after any service change; no data was changed in this audit.

## Existing positives

- `App.tsx` uses `React.lazy` for public and admin routes.
- Search Buddy and the practice continuation dock are lazy/deferred in `AppShell`.
- Route-level prefetching exists for pointer/focus intent.
- The PWA runtime cache covers static assets, images, and Google fonts.
- The current calendar page guards stale date-context responses with a request ID and keeps an in-memory per-date cache.

## Follow-up performance risks

- `HomeCompanionBoard` calls `prefetchPrimaryNav()` after its home event load. On a constrained mobile connection this can load route modules before an explicit user intent. Measure before retaining or narrowing it to idle/pointer intent.
- The default PWA cache still lets first visits make all five calendar metadata requests; no offline result for those reads was verified here.
- The inspected local build has no Lighthouse package. Install/use a pinned Lighthouse version in CI or an approved tooling environment for comparable scores rather than reporting synthetic scores from a different tool.

## Scope and safety

This audit made no source or database changes, made no authenticated requests, and did not expose credentials. Browser screenshots and the broader mobile navigation probe are recorded separately by the mobile QA audit.
