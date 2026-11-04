# Navigation and browser history — 2026-11-03

## Scope and outcome

Implemented the first incremental navigation pass, beginning with Mezmur and Calendar, plus shared scroll restoration and catalog filters. This is **not** a claim that every legacy reader/editor now has URL state. Remaining destinations are inventoried below. No router replacement, SQL, package changes, deployment, or Git index operations were performed. Existing local Calendar layout, Prayer, Mezmur classification and CMS/security edits were retained.

## Audit and URL changes

| Area | Existing behavior / issue | Current URL contract |
|---|---|---|
| Mezmur library | Collections, subcategories and details already had routes. Debounced search replaced history and wrote stale local drafts over POP. | `/hymns?q=...&language=...&browse=categories\|occasions\|zemaris&page=...`. Typing commits a PUSH after debouncing; Back/Forward cancels pending drafts and restores inputs. `/practice` remains supported. |
| Mezmur groups / sections | Existing `/hymns/browse/:slug`, `/hymns/browse/:collectionSlug/:sectionSlug`, category/occasion/singer and legacy aliases remain. Section/collection input state ignored subsequent query changes. | Search reads `q`, preserves other query parameters, resets `page` when changed, and restores pagination on POP. Singer index search uses `zemari`. Section/collection retrieval uses the committed URL query rather than refetching on every typed character. |
| Mezmur details | Existing `/hymns/mezmur/:slug` already shareable. Player's Back button always navigated to `/practice`. | Player's library button uses the existing browse queue's same-site `/hymns` or `/practice` source URL, including filters; otherwise `/hymns`. Browser Back remains native Router POP. |
| Calendar | `date` was applied once; month/year/mode/filter/grid visibility lived locally. Detail sheet overwrote Router history state with native `pushState`. | `/calendar?date=YYYY-MM-DD&grid=open&mode=gregorian\|ethiopian&month=YYYY-MM&filter=all\|feasts\|marian\|saints\|fasting&event=EVENT_ID`. `month` uses the selected calendar's native year/month (including Ethiopian month 13). Date selection clears the explicit viewed month. User choices PUSH. Invalid values fall back without redirects. |
| Calendar event details | Native history entries had no Router key/index; event Forward/refresh could not reconstruct the sheet. | Event is resolved from eligible loaded timeline data using `date` + `event`. Opening PUSHes one Router entry. Closing an in-app detail uses Back; closing a directly opened detail PUSHes its parent URL. Home event cards link to this Calendar destination. Dialog focus trapping/Escape behavior remains. |
| Bible | Book/chapter routes already exist. Testament and book edition were local; chapter edition replaced history. | `/bible?testament=new`, `/bible/:bookSlug?edition=CODE`, `/bible/:bookSlug/:chapter?edition=CODE`. Edition user changes PUSH; verse hashes remain. Existing edition eligibility and source numbering are unchanged. |
| Prayer | `/pray/:collectionSlug/:prayerSlug` and aliases already address collections/details. Library search was local. | `/pray?q=...` (and `/prayers?q=...`) restores committed search through history and refresh. |
| Church Library | Structured sections/editions already have `/library/read/:bookSlug/:sectionKey?`; passage reader accepts `passage`. Catalog filters were local. Legacy `/church-library/:bookId` redirected to a literal `:bookId`. | `/library?q=...&category=...`; legacy book redirect now substitutes the actual ID and preserves query parameters. Publication/retrieval gates and private signed media remain unchanged. |
| Faith Challenges | Game routes, game levels and Adventure story IDs already exist; hub selections were local. | `/play?section=scripture\|pictures\|music\|history\|group&level=beginner\|growing\|challenge`. Game actions, answers and scores are not added to URLs. |
| CMS | CMS sections and Mezmur editors already have routes; Mezmur list already uses search/filter/page query parameters. Faith Challenges filters/tab were local. | `/admin/play?q=...&game=...&category=...&difficulty=...&language=...&status=...&tab=import`. Clear filters changes the URL atomically. Existing authorization and editorial service calls are unchanged. |

## Scroll and data behavior

`useScrollToTopOnRouteChange` keeps its existing public interface. Scroll is recorded by Router entry key, persisted per tab with a 100-entry bound, and restored on POP/refresh. PUSH/REPLACE destinations start at the top; hash destinations wait for their element. Mutation/resize observation accommodates lazy and asynchronously rendered content, stops when restoration succeeds, and is bounded to ten seconds. Pointer, keyboard, wheel and touch interaction cancel pending restoration. Blocked storage falls back to memory. No content, credentials or private query strings are persisted by this scroll store.

Existing public browse/calendar caches and the Calendar's day-context cache remain in use. No authorization-sensitive response cache, heavy-page preloading or query-result persistence was added. Cold remounts may still refetch; refresh intentionally reloads data. Scroll cannot restore an offset that no longer exists after content changes, and delayed content beyond the bounded observation period is a limitation.

## Files changed in this pass

- `src/App.tsx` — legacy Library ID redirect.
- `src/hooks/useUrlState.ts` — new shared URL choice/debounced input hooks, including rapid-POP protection.
- `src/hooks/useScroll.ts` — entry-keyed restoration.
- `src/pages/PublicMezmurLibrary.tsx`.
- `src/pages/PublicHymnCollectionPage.tsx`.
- `src/pages/PublicHymnSectionPage.tsx`.
- `src/pages/PublicMezmurDetail.tsx`.
- `src/pages/CalendarPage.tsx`.
- `src/components/calendar/OrthodoxInteractiveCalendar.tsx` — URL-driven native month/mode/filter; swipe follows the viewed month.
- `src/components/calendar/CalendarDateTimeline.tsx` — remove duplicate date navigation before event navigation.
- `src/components/calendar/CalendarEventDetail.tsx` — parent owns history; retain dialog interaction/accessibility.
- `src/components/home/HomeTodayInChurchPreview.tsx` — link event destinations to Calendar.
- `src/pages/BiblePage.tsx`.
- `src/pages/PrayerListPage.tsx`.
- `src/pages/PublicChurchLibrary.tsx`.
- `src/pages/play/PlayHubPage.tsx`.
- `src/pages/admin/PlayContentReview.tsx` — URL filters/tab only; preserve existing editor work.
- `scripts/test-navigation-history.mjs` — new real-component browser suite.
- This report.

## Verification

The new browser harness starts its own loopback Vite server on port 5196, uses synthetic content/services and a test-only editor AuthContext, blocks external browser requests and closes its server/browser in `finally`. It does not load real environment files. It verifies routing behavior, **not** live Supabase permissions. No browser fixture is included in the application entry point or production bundle.

| Command / check | Result |
|---|---|
| `node scripts/test-navigation-history.mjs` | Exit 0: **21 passed, 0 failed**, at 1280px and touch-enabled 390px. Real Router/browser Back/Forward, multilevel Mezmur routes, direct URLs/refresh, query restoration, rapid Back while typing, Calendar date/month/native mode/event sheet, scroll, catalog filters, CMS unsaved-edit cancel/discard and mobile drawer. |
| `$env:BASE_URL='http://127.0.0.1:5198'; npm.cmd run test:journeys` | Exit 0: **54 passed, 0 failed** against a separately started local app using the existing suite's synthetic calendar responses. Includes 360/390px, desktop 1280/1440px, reduced motion, autoplay, navigation, themes and overflow. |
| `node scripts/test-mobile-account-hymns-navigation.mjs` | Exit 0; canonical routes/account navigation source checks. |
| `node scripts/test-hymn-browse.mjs` | Exit 0; existing browse checks. |
| `node node_modules/typescript/bin/tsc -b --pretty false` | Exit 0. |
| `npm.cmd run build` | Exit 0, including TypeScript and production/PWA build. |
| `node --check scripts/test-navigation-history.mjs` | Exit 0. |
| Scoped `git diff --check` plus explicit whitespace checks for the three untracked additions | Exit 0. Git index remains unchanged. |
| Targeted ESLint | Exit 1: **16 existing errors**, no new rules/errors. Read-only HEAD comparison: Calendar timeline 1→1; calendar grid 11→11; Calendar page 4→3; Prayer library 1→1. Other changed tracked modules have zero errors; new hook/browser script pass. Existing errors are ref reads during render and synchronous state updates in effects. They were not suppressed or changed to make validation pass. |
| `node scripts/test-interactive-calendar.mjs` | Exit 1: legacy data-dependent audit timed out waiting for `section[aria-labelledby="mezmur-heading"]` at localhost:5173. It requires populated day-context recommendations; no controlled baseline run established causality. This is **unresolved**, not claimed to be an application regression or a pre-existing failure. |

Early new-suite iterations caught a rapid-Back race, which was fixed in the URL input hook. Harness corrections covered the bilingual hymn heading, async DOM readiness, synthetic staff session and the Library input's actual `searchbox` role. Final expectations retain concrete routes, selected values and unsaved text assertions.

## Remaining navigation gaps and limits

1. **Legacy document readers:** `ChurchLibraryReader.tsx` still changes TOC sections, document/passages mode and in-book search locally; `BuiltInDocumentReader.tsx` still holds PDF page/EPUB chapter/search locally. Structured reader section/edition links already route correctly. Add document-specific URL contracts with publication-gated fixture coverage in a subsequent increment.
2. **Prayer reader state:** language tabs/continuous-reading sections and Psalm index search/mobile index visibility are not all URL-driven. Psalm selection/ranges already use `n`, `from`, `to`; language preferences remain separate local preferences. No prayer text or reading-progress behavior was rewritten here.
3. **CMS breadth:** Mezmur list/editor history and unsaved changes are browser-tested. Faith Challenges filters/tab are addressed, but its selected question/new editor is still local state. Other CMS lists/editors require individual filter and unsaved-navigation audits before claiming universal restoration.
4. **Mezmur expansion:** the additional loaded Zemari count is still local; primary browse/search/category/detail URLs are stable. Direct shared detail URLs do not carry another user's per-tab queue source.
5. **Game attempts:** game/story destinations have URLs. In-progress answers, scene completion and server-authorized Game Night state remain gameplay state; no URL can bypass progression or manufacture a reward. Exact restoration of an unfinished attempt after a full reload is not provided by this navigation pass.
6. **Deployment:** local direct-link/refresh checks passed; deployed Cloudflare SPA fallback, real protected CMS sessions, content-dependent layout and real-provider cache behavior were not tested. No deployment or production data access was required.

Rollback: reverse only the navigation changes listed here after reviewing each file's pre-existing edits. Do not restore whole dirty files or reset the worktree. The shared hook interfaces and existing routes remain intact; no schema/data rollback is involved.
