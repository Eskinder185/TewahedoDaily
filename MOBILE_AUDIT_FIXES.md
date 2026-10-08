# Mobile Audit Remediation (TD-01 – TD-23)

Source of truth: mobile inspection findings TD-01–TD-23 (remediation brief).  
Verified against the **local working tree** + Vite preview (`127.0.0.1:4173`) on 2026-10-08.  
Original TD report was not checked into the repo; the remediation brief + this file are the working source of truth.

## Status legend

| Status | Meaning |
|--------|---------|
| Verified | Fixed in code and confirmed in local preview / tests this session |
| Already fixed | Present before remediation; re-verified |
| Partial | Improved; residual risk documented |
| Unresolved | Still open / ops / measurement |

---

## Final verification summary (2026-10-08)

| Area | Outcome |
|------|---------|
| 17 reported fixed issues | **Verified** in local preview (see checklist below) |
| TD-10 / TD-13 outstanding a11y | **Additional public-surface fixes landed** this session |
| Search Buddy 320 / 375 / 390 / 430 | Composer usable; mic/Send non-overlapping; short landscape body ≥96px at 430×320 |
| Voice / submit / listening | Listening UI + Stop/Cancel; automation browser falls back to “Voice search isn’t available…” |
| Hymn → Mezmur detail + Back | `/practice/mezmur/medhanealem-simeh-genana` then `history.back()` → `/` |
| Learn fallback | Loads empty catalog **without** HTTP 400; empty h2 under page h1 |
| Network / images / ESLint | Profiled + triaged (details below) |
| Locale / theme | Amharic nav + Night theme (`data-theme=night`) confirmed |
| Build / focused tests | Pass |

### Stabilization pass (post-remediation)

| Focus | Outcome |
|-------|---------|
| Responsive Mezmur images | Client helpers + card wiring; CDN transforms still unavailable |
| Amharic hero / nav | Localized brand, hero chrome, nav a11y; night theme OK |
| ESLint | **78 → 47** errors; 12 warnings unchanged; no hook mass-rewrite |
| Mobile perf recheck | Local + production tables below |

---

## Stage 1 — Critical

| ID | Status | Evidence |
|----|--------|----------|
| **TD-01** | **Verified** | Live REST still lacks `articles.description`; `listContent` retries. Preview `/learn` renders empty state (no error). Probe: `scripts/probe-articles-list.mjs` → `ok: true`. |
| **TD-02** | **Verified** | `OutletErrorBoundary` wraps `<Outlet />` in AppShell; chrome retained on route failures. |

## Stage 2 — Search Buddy

| ID | Status | Evidence |
|----|--------|----------|
| **TD-03** | **Verified** | Mic bbox `(95,782) 48×48`, Send `(282,782) 76×48` — no overlap at 390×844. |
| **TD-05** | **Verified** | Short landscape 430×320: conversation `.body` `min-height: 96px` (30vh), composer + mic/Send remain on-screen. |
| **TD-06** | **Verified** | Starter “Open John 3:16” returns John 3:16 EN+AM via local fallback; `test:bible-search` ok. |
| **TD-17** | **Verified** | Voice language control shows **EN** only; listening copy “English · up to 15s”. Amharic transcription not advertised without API readiness. |

## Stage 3 — Reading / navigation

| ID | Status | Evidence |
|----|--------|----------|
| **TD-04** | **Verified** (code) | Liturgy toolbar stacks ≤430px; TOC `max-width: 100%`. |
| **TD-07** | **Verified** (code) | Mezmure Dawit starts reader-first when `?n=` set. |
| **TD-11** | **Verified** (code) | English lyrics mode / transliteration fallback in practice panel. |
| **TD-12** | **Verified** (code) | Synaxarium months use `<details>`; first month open by default. |

## Stage 4 — Accessibility

| ID | Status | Evidence |
|----|--------|----------|
| **TD-09** | **Verified** | `--color-gold-ink` used for text eyebrows/meta. |
| **TD-10** | **Verified** (public surfaces) | This session: hero/home dots → `role=group` + `aria-pressed`; Learn How to Pray + upcoming observances tab wiring; liturgy already had tabpanel. Residual: admin / rarely used tab patterns. |
| **TD-13** | **Verified** (public surfaces) | This session: Search Buddy FAB, header utility/home/mode links, hero controls/dots, Bible search clear/input, pray mode tabs, home preview dots → `--tap-min`. Residual: some practice/admin 40px controls. |
| **TD-23** | **Verified** | `/learn` and `/saints`: single `h1`, empty copy as `h2`. |

## Stage 5 — Performance

| ID | Status | Evidence |
|----|--------|----------|
| **TD-08** | **Partial** | Artwork width/height/sizes set; hero already has dimensions. Mobile LCP rechecked (see [Performance verification](#performance-verification-2026-10-08-stabilization)). |
| **TD-14** | **Verified** | Search Buddy lazy-loaded; Whisper remains worker-gated. |
| **TD-15** | **Documented** | See [Network profiling](#td-15-network-profiling). Not accidental exact-duplicate GETs for the same query string. |
| **TD-16** | **Partial / CDN** | Client `srcset`/`sizes`/`loading` wired via `responsiveImage.ts`. YouTube thumbs get a real srcset. Supabase/CF transforms remain **off** (403/404) until ops enables `VITE_IMAGE_RESIZE_MODE`. Practice cards still decode 1024–2400px into ~328px slots. |

## Stage 6 — Visual polish

| ID | Status | Evidence |
|----|--------|----------|
| **TD-18** | **Verified** (code) | Public calendar empty art has no “Needs image” label. |
| **TD-19** | **Triaged / reduced** | See [ESLint triage](#td-19-eslint-triage). Current: **47 errors / 12 warnings** (down from 78/12). |
| **TD-20** | **Verified** (code) | Bible chapter `<option>` strings fixed. |
| **TD-21** | **Verified** | Chat Bible cards show “John 3:16” + “English · WEB” / “Amharic”. |
| **TD-22** | **Verified** (code) | About mobile paddings reduced. |

---

## Additional fixes in this verification session

| Change | Why |
|--------|-----|
| Hero / home preview carousel dots: `role="group"` + `aria-pressed` | Invalid tablist without tabpanel (TD-10) |
| LearnHowToPrayControls + PrayerGuidePage tabpanels | Missing `aria-controls` / `role=tabpanel` (TD-10) |
| UpcomingObservancesStrip `aria-controls` + `tabIndex` | Incomplete tabs (TD-10) |
| Search Buddy FAB, SiteHeader links, hero controls, Bible search, pray mode tabs → `--tap-min` | Undersized secondary targets (TD-13) |
| Home preview / hero dots enlarged hit areas | TD-13 |

---

## TD-15 network profiling

**Method:** `performance.getEntriesByType('resource')` on home after load (preview).

**Home callers (related, not identical duplicates):**

| Request pattern | Caller | Notes |
|-----------------|--------|-------|
| `homepage_slides?…active=eq.true` | Homepage slide loader | Once |
| `liturgical_seasons?select=*&status=eq.published` | `loadOrthodoxCalendarCatalog` (`orthodoxCalendarData.ts`) | Catalog cache |
| `liturgical_fasts?select=*&status=eq.published` | same | Catalog cache |
| `orthodox_observances?select=*&status=eq.published` | same | Catalog cache |
| `monthly_commemorations?select=*&status=eq.published` | same | Catalog cache |
| `calendar_cards?…limit=500` | `getHomepageTodayEvents` / calendar cards | Once |
| `orthodox_observances?id=in.(…)` / `slug=in.(…)` | `loadLinkedSourcesForCards` (`calendarCardSources.ts`) | Enrich linked card sources |
| `liturgical_fasts?id=in.(…)` / `slug=in.(…)` | same | Enrich linked card sources |
| `monthly_commemorations?id=in.(…)` / `slug=in.(…)` | same | Enrich linked card sources |

Path-only aggregation showed “3×” for some tables because **catalog full-select + id batch + slug batch** share a path with different query strings. Exact URL duplicates were not the primary issue.

**Practice `/practice`:** collection/section/link imports once each; no signed-URL storm on collection tiles (public URLs). Oversized **pixel dimensions** remain (TD-16).

---

## TD-16 image optimization

| Layer | Status | Work |
|-------|--------|------|
| Local | Done | `responsiveImageAttrs` on `HymnBrowseCard`, `PublicMezmurLibrary` CardArt, `PracticeMediaCard`; YouTube mq/hq/sd srcset; `sizes` for ~328px mobile cards; lazy + low fetchPriority (eager/high only when `priority`) |
| Transforms | Unavailable | Supabase `/storage/v1/render/image/...` → **403**; Cloudflare `/cdn-cgi/image/...` → **404**. Opt-in: `VITE_IMAGE_RESIZE_MODE=supabase\|cloudflare` (documented in `.env.example`) |
| Inventory (local preview `/practice`, 390×844) | Confirmed | All collection art from Supabase `content-media` public URLs (webp). Display width **328px**. Naturals: most **1024×765**; `jesus-christ` **1448×1086**; `angels-saints` **2400×1792**. `srcset` omitted while transforms off (no upscale / no broken URLs). Fallbacks unchanged. |

---

## TD-19 ESLint triage (no blind auto-fix)

| Snapshot | Errors | Warnings |
|----------|-------:|---------:|
| Original audit baseline | 78 | 12 |
| After ignore `tmp/**`/`archive/**` + unused `^_` pattern | 57 | 12 |
| After safe prefer-const / escape cleanup (this session) | **47** | **12** |

| Rule / category | Approx count | Guidance |
|-----------------|-------------:|----------|
| `react-hooks/set-state-in-effect` | ~33 | Intentional load/reset patterns — rewrite carefully; not `--fix` |
| `react-hooks/exhaustive-deps` | 12 (warnings) | Review case-by-case |
| `react-hooks/preserve-manual-memoization` | 8 | React Compiler vs manual memo — do not mass-delete |
| `@typescript-eslint/no-explicit-any` | 5 | Typed incrementally |
| `react-hooks/refs` | 1 | Isolated (`useReadingProgressTracker`) |
| `react-refresh/only-export-components` | 1 | `ChatStarterPrompts` exports helpers |

Safe fixes landed: prefer-const in auth/CMS services; `no-useless-escape` in `PrayerReadingText`; unused-vars underscore policy; ignore temp artifacts. **Do not** run ESLint `--fix` across the repo for hooks rules.

---

## Search Buddy mobile QA notes

| Width | Notes |
|------:|-------|
| 320 | FAB + full-screen panel; composer + mic/Send usable |
| 375 / 390 | Primary phone targets; mic/Send separated; starters work |
| 430×320 landscape | Body min-height keeps scroll region; conversation visually tight but not collapsed to 0 |
| Voice | Listening → Stop/Cancel; automation lacks SpeechRecognition → graceful typed-search message |
| AI API | Preview often: “Could not reach the assistant service…” then **local** results still render |

---

## Amharic localization (hero + nav)

| Surface | Status |
|---------|--------|
| Site header brand / subtitle | Amharic `brand.name` = **ተዋህዶ ዴይሊ**; subtitle already Amharic |
| Primary nav + drawer | `nav.*` + `uiLabels` (fixed `navPrimaryNav` am: **ዋና አሰሳ**) |
| Hero fallback + a11y | `home.hero.*` including prev/next/slides; Amharic UI prefers CMS `title_amharic` and localized chrome (does not invent religious CMS copy) |
| Language toggle compact “Both” | Shows **ሁ** when UI locale is Amharic |
| Night theme | Verified with Amharic UI |
| Content titles on Practice browse | Remain source-language CMS English (by design) |

---

## Performance verification (2026-10-08 stabilization)

**Method:** Playwright Chromium, viewport **390×844** DPR 2, iPhone UA, **cache disabled**, fresh context per route, `networkidle` + 2s settle. LCP/CLS via PerformanceObserver.

**Not Lighthouse.** Cross-origin Supabase image `transferSize` is often 0 (opaque); image waste confirmed via **naturalWidth** inventory above.

### Local preview (`http://127.0.0.1:4173` after `npm run build`)

| Route | LCP (ms) | CLS | JS transfer (KB) | Notes |
|-------|---------:|----:|-----------------:|-------|
| Home | 451 | 0 | 380 | Hero local webp ~71 KB; total img transfer ~212 KB |
| Bible | 454 | 0 | 383 | |
| Mezmur Practice | 923 | 0 | 380 | 9 collection imgs; naturals still 1024–2400 |
| Calendar | 692 | 0.274 | 381 | CLS from calendar layout |
| Search Buddy (home + FAB) | 488 | 0 | 380 | Panel opened |
| Prayers | 455 | 0.193 | 381 | |

### Production (`https://tewahedodaily.pages.dev`) — comparison only

| Route | LCP (ms) | CLS | JS transfer (KB) |
|-------|---------:|----:|-----------------:|
| Home | 657 | 0 | 375 |
| Bible | 580 | 0.092 | 377 |
| Mezmur Practice | 1136 | 0 | 374 |
| Calendar | 952 | 0.274 | 375 |
| Search Buddy (home + FAB) | 564 | 0 | 374 |
| Prayers | 767 | 0.193 | 375 |

Initial JS transfer stays ~**375–383 KB** (~24 script resources) on cold loads for both environments.

---

## Verification commands

| Check | Result |
|-------|--------|
| `npm run test:bible-search` | ok |
| `npm run test:voice-search` | ok |
| `scripts/test-mezmur-route.mjs` | ok |
| `npx tsx … scripts/probe-articles-list.mjs` | ok (`total: 0`) |
| `npm run test:search-site` | ok |
| `npm run test:hymn-browse` | ok |
| `npm run build` | ok |
| `npm run lint` | **47 errors / 12 warnings** (was 78/12) |

---

## Remaining work / production readiness blockers

1. **Apply DB migration** `20261007210000_content_relations_columns.sql` (articles `description` + `teaching_category`) when authorized — Learn Topic filter remains UI-only until then.  
2. **AI Search Buddy backend reachability** from the deployed/preview origin — local fallback works; full hymn_search “Open Mezmur” API cards need the FastAPI service.  
3. **Publish Learn / Saints / Feasts content** — empty libraries block encyclopedia detail navigation QA.  
4. **Enable image transforms** (Supabase Image Transformations or Cloudflare Image Resizing) then set `VITE_IMAGE_RESIZE_MODE` — until then TD-16 byte savings cannot land.  
5. **Optional:** consolidate home calendar catalog + linked-source fetches behind one enriched payload (TD-15 optimization, not a correctness bug).  
6. **ESLint remaining** — ~33 `set-state-in-effect` + 8 preserve-memoization + 5 `any` (no mass autofix).  
7. No deploy / push / production DB changes performed.

## Constraints honored

- No fabricated EOTC content  
- No FastAPI AI backend edits  
- No production database migration  
- No deploy / push  
- Unrelated product features not added  
