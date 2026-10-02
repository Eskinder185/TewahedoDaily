# Tewahedo Daily — Production QA Audit

**Date:** 2026-10-01 (local) / audit window against production `https://tewahedodaily.pages.dev/`  
**Auditor:** Cursor agent (code + production browser + build tooling)  
**Scope:** Performance, mobile UX, network/Supabase, Calendar/CMS integrity, Hymn/Pray, accessibility, security hygiene  

---

## Executive Summary

**Overall status: NOT READY** for a mobile-primary production launch as currently deployed.

### Why

1. **Unusable image payload on mobile.** `public/images/calendar/` alone is ~**444 MB** of PNG files (many **9–11 MB each**). Hero fallback `lalibela.png` was **~8.7 MB**. Zero WebP in `public/images`. A single calendar card or fallback can dominate LCP and feel “sluggish” on phones.
2. **Production Calendar public surface is not showing curated cards.** At `/calendar` production showed: *“No featured calendar cards yet. Add curated cards under Calendar → Calendar Cards.”* That is a CMS → public integrity failure for the primary Calendar Cards experience (regardless of local timeline work that may not be deployed yet).
3. **Homepage critical path was pulling heavy calendar/practice graphs.** Measured production homepage JS graph included `calendar-*.js` and even `chant-data-mezmur-*.js` (~536 KB). Initial paint showed a full-page **Loading...** shell before hero content.
4. **Lint is red** (`65` errors / `10` warnings) — mostly React Compiler `set-state-in-effect` rules. Build typechecks pass; lint does not.
5. **CMS end-to-end could not be fully verified in this pass** (no Admin credentials / write session in the audit browser). Production public Calendar empty-state is strong evidence that card presentation sync is broken or unpublished in prod.

Local code has partial mitigations applied during this audit (hero JPG, lighter homepage Today fetch, lazy Today section, dynamic `dayChurchContext` import). **Those fixes are not on production until deployed**, and they do **not** replace the mandatory image compression program.

---

## Top Problems

| ID | Sev | Problem |
|----|-----|---------|
| P0-IMG | P0 | Calendar PNGs 9–11 MB; folder ~444 MB; no WebP in public |
| P0-HERO | P0 | Hero used multi‑MB PNG (`lalibela.png` ~8.7 MB) |
| P0-CAL-PUB | P0 | Production `/calendar` shows no featured calendar cards |
| P0-HOME-LOAD | P0 | Homepage Suspense/chunk graph delayed hero; full-page Loading |
| P1-BUNDLE | P1 | `calendar` chunk ~670–883 KB; `chant-data-mezmur` ~536 KB |
| P1-FALLBACK | P1 | Card image fallback pointed at multi‑MB `TodayInChurch.png` |
| P1-FAV-LEGACY | P1 | Favorites still dual-writes / falls back to `mezmur_favorites` |
| P1-LINT | P1 | `npm run lint` fails (65 errors) |
| P2-HOME-SPACE | P2 | Production Today section still shows large left/right gap (pre-local layout fix) |
| P2-SELECT-* | P2 | Widespread `select('*')` in CMS/public services |

---

## Performance

### Measured (production homepage, tooling-available)

| Metric | Value | Notes |
|--------|-------|-------|
| FCP | **~568 ms** | From Performance paint entry after navigate |
| DOMContentLoaded | **~399 ms** | Navigation timing |
| loadEvent | **~399 ms** | Early; heavy images continue after |
| Hero/calendar PNG transfer (cold) | **~3.8 MB** observed for `SacredCalendarContinuity.png` | Disk-cache later shows `transferSize: 0` |
| Homepage Supabase | `homepage_slides` **200** | Seen on homepage |
| WebP in `public/images` | **0 files** | Local filesystem audit |
| Calendar PNG count | **51** | Local `public/images/calendar` |
| Calendar folder size | **~444 MB** | Local filesystem |

**Do not invent Core Web Vitals lab scores** beyond the Performance API values above. Lighthouse was not run in this environment.

### Bundle observations (`npm run build`, post-fix local)

Largest JS assets (gzipped):

| Chunk | ~gzip | Risk |
|-------|------:|------|
| `calendar-*.js` | **209 KB** (raw ~883 KB) | Calendar + eotc/lib pulled into one manual chunk |
| `chant-data-mezmur-*.js` | **161 KB** (raw ~536 KB) | Full mezmur JSON in client |
| `react-vendor` | **57 KB** | Expected |
| `practice-*.js` | **38 KB** | Practice UI |
| `prayers-*.js` | **31 KB** | Pray |

### Duplicate / heavy query patterns

- `getCalendarEventsForDate` previously **statically** imported `loadDayChurchContext`, which fans out to Synaxarium + mezmur scoring — pulled practice/mezmur into homepage graphs.
- Admin reconciliation uses `select('*')` on all structured calendar tables (acceptable for admin sync; not for public homepage).
- Favorites: on `user_favorites` failure, code hits `mezmur_favorites` (legacy), risking 404/errors in console if table removed.

### Rendering / loading

- Route-level `Suspense` + `PageLoadingFallback` (“Loading...”) blocks entire page chunk trees.
- Homepage Today previously competed with hero for the same critical path.

---

## Mobile UX

Primary widths exercised via device metrics override: **390px** (also reviewed layout implications for 360–430).

| Width | Finding |
|------:|---------|
| 390 | Mobile nav hamburger OK; hero readable; Today card fills width; carousel arrows over image (small touch targets) |
| 360–430 | Same pattern: stack OK once content loads; **image weight** dominates perceived performance |
| Desktop 1280+ | Production Today still left-copy / far-right card gap (pre-deploy of local layout work) |

**Touch targets:** carousel arrows ~2.15rem — below comfortable 44px on some phones. Calendar day cells on production grid feel tight.

**Verdict:** Interaction patterns are mostly sane; **performance payload fails mobile-primary**.

---

## Homepage

### Production observed

- Hero + nav + footer render after delay.
- Today in Church carousel shows Saint Mary Monthly Commemoration (multi-event dots present).
- Explore / See Today CTAs present.
- Footer: brand / portfolio / © / utilities OK.

### Issues

- Cold load: full-page Loading before hero.
- Heavy PNG/JPG assets.
- Production layout still shows large horizontal gap in Today section (local reorganization not deployed).

### Local fixes applied this audit

- Lazy-load `HomeTodayInChurchPreview` so hero can paint first.
- `getHomepageTodayEvents()` — orthodox catalog + cards only (no Synaxarium/mezmur fan-out).
- Dynamic import of `dayChurchContext` inside full `getCalendarEventsForDate`.
- Hero points to `/images/home/home-hero-tewahedo-daily.jpg` (~1.1 MB vs 8.7 MB PNG).
- Card image fallback → `/images/home/home-today-in-church.jpg` (~0.9 MB vs ~9 MB PNG).

---

## Hymn Practice

### Production observed (`/practice`)

- Library loads: **“264 hymns found”**.
- Search/filters UI present.
- Amharic + English titles visible.
- Auto Scroll: **not present in codebase** (grep clean) — PASS.

### Not fully exercised this pass

- Detail page loops / Record Yourself / YouTube postMessage (needs deeper interactive session + mic permission).
- Favorites add/remove while logged in (needs auth).

### Risks (code)

- `chant-data-mezmur` ~536 KB shipped to client for Practice.
- YouTube API load timing not re-validated end-to-end here.

---

## Pray

### Production observed (`/pray`)

- Collections render (Zewter Tselot, Wudase Mariam, Mezmure Dawit, etc.).
- Today’s prayer rhythm references feast/commemoration (Gishen Maryam / Virgin Mary).
- Mobile hamburger nav works.

### Risks

- Pray can still pull large prayer JSON chunks.
- Learn How to Pray (`prayer_learning_*`) not fully click-tested in this pass; code path uses normalized tables in `prayerLearning.ts`.

---

## Learn How to Pray

- Code: `src/lib/prayers/prayerLearning.ts` queries `prayer_learning_collections|sections|content`.
- **Not fully UI-tested** this pass against production (timeboxed). Treat as **UNVERIFIED** in CMS table below.

---

## Calendar

### Production observed

- Message: **no featured calendar cards**.
- Month grid + legend + selected day detail (“Gishen Maryam”) still appear via day engine.
- Timeline/multi-day fill from recent local work **not evidenced on production** (likely undeployed or different build).

### Local architecture notes

- Range fetch `getCalendarEventsForRange` avoids per-day Supabase for timeline.
- Reconciliation service exists for Admin Sync (link repair, image preserve, placeholder clear).
- Public resolver inheritance implemented in prior work; **prod data/deploy must catch up**.

### Image integrity

- Fallback and manifest still capable of referencing enormous local PNGs if CMS `image_path` empty.
- Prefer Supabase content-media relative WebP paths (`calendar/.../*.webp`).

---

## Synaxarium

- Calendar page Synaxarium panel depends on `loadDayChurchContext` / synaxarium tables.
- Production calendar empty-card state still showed day titles from orthodox/day engine.
- Deep accordion QA **partial** — no raw DB error strings observed in page text.

---

## Authentication / Favorites

### Code

- Canonical: `user_favorites` (+ guest localStorage).
- Legacy: dual-write / fallback to `mezmur_favorites`.
- Content Health still probes both tables.

### Test status

- Guest favorites: not fully exercised in browser this pass.
- Logged-in: **not tested** (no session).

---

## Admin CMS

### Production

- `/admin/login` reachable.
- **No authenticated CMS mutation tests** this pass.

### Implication of public Calendar empty featured state

Either:

- no published `show_on_home` / featured cards in prod DB, or  
- production frontend still filters to “featured” cards only and none qualify, or  
- deploy lag vs local timeline admin.

**Must be verified after deploy + Admin login:** Sync Calendar Cards → public `/calendar` shows cards with images preserved.

---

## CMS End-to-End Verification

| Feature | Admin save | DB persisted | Public updated | Result |
|---------|------------|--------------|----------------|--------|
| Homepage slides | Not write-tested | Partial (GET `homepage_slides` 200) | Hero/slides render | **PARTIAL** |
| Mezmur | Not tested | — | Library lists hymns | **UNVERIFIED writes** |
| Calendar Card | Not tested | Suspected gap | “No featured cards” | **FAIL (prod public)** |
| Calendar image | Not tested | — | Heavy PNG fallbacks | **FAIL (perf)** |
| Pray collections | Not tested | — | Collections visible | **PARTIAL** |
| Learn How to Pray | Not tested | — | — | **UNVERIFIED** |
| Synaxarium | Not tested | — | Day titles appear | **PARTIAL** |

---

## Console / Network Errors

### Before (production observations)

- Extreme image downloads (multi‑MB PNG).
- Homepage waited on large JS chunks (`calendar`, sometimes mezmur data graph historically).
- Production Calendar featured-cards empty state (product/data error, not necessarily HTTP 500).

### After (local fixes — not yet production)

- Hero/fallback image paths reduced to ~1 MB JPGs.
- Homepage Today lazy + lighter event API.
- Build still warns: calendar chunk > 800 KB.

**Remaining expected third-party noise:** YouTube iframe / postMessage (when Practice detail opened) — not re-captured this pass.

---

## Accessibility

- Landmarks/nav present; language toggles exposed.
- Carousel has `aria-roledescription` / tabs on homepage Today.
- Focus styles exist on CTAs.
- Gaps: small carousel controls; calendar cell density; Amharic size in compact chrome.
- Reduced-motion respected in homepage carousel autoplay code.

---

## Security / RLS

- Frontend Supabase client uses publishable/anon key only (`client.ts` documents no service role) — **PASS hygiene**.
- RLS not exhaustively re-audited against live policies this pass; do **not** weaken RLS to fix empty Calendar.
- Favorites/user tables must remain user-scoped.

---

## Fixed During Audit (local repo)

1. Homepage Today uses `getHomepageTodayEvents` (no Synaxarium/mezmur fan-out).
2. `loadDayChurchContext` dynamically imported from full day helper.
3. `HomeTodayInChurchPreview` lazy-loaded after hero.
4. Hero image → compressed JPG.
5. Calendar event image fallback → lighter home JPG.
6. Vite manualChunks expanded for calendar/practice isolation (homepage still must avoid static calendar cards until Today lazy loads).

---

## Remaining Issues

| Sev | Item |
|-----|------|
| P0 | Compress/convert calendar (and remaining) assets to sized WebP; remove 9–11 MB PNG from hot paths |
| P0 | Fix production Calendar Cards visibility (featured/publish/sync/deploy) |
| P0 | Deploy local Calendar timeline + homepage layout + perf fixes |
| P1 | Shrink/split `calendar` and `chant-data-mezmur` chunks further |
| P1 | Remove or gate legacy `mezmur_favorites` once `user_favorites` proven |
| P1 | Clear eslint set-state-in-effect debt or adjust lint config intentionally |
| P2 | Touch targets on carousel/calendar |
| P2 | Narrow `select('*')` on hot public queries |
| P2 | Full CMS write E2E with staff account |
| P3 | Polish production Today spacing (after deploy of local layout) |

---

## Recommended Next Steps (priority order)

1. **Image program:** batch-convert `public/images/calendar/*.png` → WebP (max edge ~1600, quality ~75); update manifests; prefer Supabase content-media WebP in CMS.
2. **Deploy** current Calendar Cards reconciliation + timeline + homepage lazy/layout fixes.
3. **Admin:** run Sync Calendar Cards on prod; verify featured/published cards appear on `/calendar` and Homepage.
4. **Auth E2E:** favorites + Admin mutation matrix with a staff user.
5. **Lighthouse mobile** on production after image deploy; capture LCP element.
6. **Chunk strategy:** fetch mezmur catalog from Supabase/API instead of embedding 536 KB JSON when ready.
7. Fix or waive lint errors with documented policy.

---

## Build / Test Status (local)

| Command | Result |
|---------|--------|
| `npm run build` | **PASS** (chunk size warning for calendar) |
| `npm run test:calendar-cards` | **PASS** |
| `npm run lint` | **FAIL** — 65 errors / 10 warnings |

---

## Evidence notes

- Production browser: homepage, calendar, practice, pray at ~390px width.
- Filesystem sizes measured under `public/images`.
- Bundle sizes from Vite build output.
- CMS writes: not executed (no credentials).

---

## Remediation Pass

**Date:** 2026-10-02  
**Companion report:** [PERFORMANCE_REMEDIATION.md](./PERFORMANCE_REMEDIATION.md)

### Verdict after remediation (local codebase)

**STILL NOT READY for production launch until deployed + Sync Calendar Cards on prod**, but launch blockers are remediated in code/assets as follows.

Production currently still shows the old featured-card empty strip because **this branch is not deployed** and production `calendar_cards` has **0 rows**.

| Blocker | BEFORE | FIX | AFTER | STATUS |
|---------|--------|-----|-------|--------|
| Calendar production empty state | “No featured calendar cards…”; UI required featured cards; prod DB has **0** `calendar_cards` | Calendar page uses structured sources timeline; `getCalendarCards` no longer requires `featured` by default; linking limit raised | Local shows events from observances/monthly/fasts/seasons without featured cards; images optional/neutral | **FIXED in code** — **needs deploy + optional Sync for images** |
| Calendar image weight | ~444 MB PNG folder; 9–11 MB/card | `optimize-calendar-images.mjs` → `public/images/calendar-web/*.webp`; manifest points to WebP | Delivery copies **~7.3 MB** total; typical card **~40–350 KB** | **FIXED** (originals preserved) |
| Hero image weight | `lalibela.png` ~8.5 MB on hot path | Responsive WebP 640/1024/1600 + srcset | Mobile ~70 KB; tablet ~160 KB; desktop ~357 KB | **FIXED** |
| Homepage blocking loader | Full-page Loading / heavy Suspense | Hero immediate; reserved-size skeleton for Today | Hero paints first; Today skeleton independent | **FIXED** |
| Legacy favorites | Dual-write / fallback `mezmur_favorites` | `user_favorites` + guest localStorage only | No runtime `mezmur_favorites` calls | **FIXED** |
| Calendar bundle | ~883 KB | Split `eotc-dataset` chunk; dynamic `dayChurchContext` | Calendar ~**676 KB**; eotc-dataset ~**198 KB** | **IMPROVED** (still large) |
| Mezmur bundle | ~536 KB | Investigated — Practice still embeds workshop JSON | Unchanged ~**536 KB** | **OPEN** (intentional until Supabase-only Practice) |
| Lint | 65 errors | Not prioritized over launch blockers | **64 errors / 10 warnings** | **OPEN** |

### Production data (actual query)

- `orthodox_observances` 84 published  
- `monthly_commemorations` 53 published  
- `liturgical_fasts` 17 published  
- `liturgical_seasons` 14 published  
- `calendar_cards` **0 total**

### CMS verification matrix

| Feature | Admin component | Supabase table | Mutation | Public consumer | Cache invalidation | Manual E2E |
|---------|-----------------|----------------|----------|-----------------|--------------------|------------|
| Homepage slides | `HomepageAdmin` | `homepage_slides` | insert/update | `HeroSection` | Client refetch on Admin save | **NOT TESTED** |
| Calendar Cards | `CalendarAdmin` | `calendar_cards` | save by id | Calendar timeline / Homepage Today | `invalidateCalendarCardsCache` + list reload | **NOT TESTED** |
| Calendar image | `MediaPicker` + Card editor | `calendar_cards.image_path` + Storage | update path | `CalendarEventImage` | Post-save requery by id | **NOT TESTED** |
| Mezmur | `MezmurEditor` | `mezmur` | save | Public mezmur / Practice | Public list refetch patterns | **NOT TESTED** |
| Pray / guides | `PrayerGuidesAdmin` | prayer guide tables | save | `PrayerGuidePage` | Route reload | **NOT TESTED** |
| Synaxarium | `StructureAdmin` | `synaxarium_*` | save | Calendar Synaxarium panel | Day context cache per date | **NOT TESTED** |
| Favorites | `FavoriteButton` | `user_favorites` | insert/delete | Saved page | Local state + list refetch | **NOT TESTED** |

### Remaining launch blockers (honest)

1. **Deploy** this remediation to Cloudflare Pages.  
2. **Admin Sync Calendar Cards** on production (populate presentation rows / images).  
3. Re-verify `/calendar` on production after deploy.  
4. Optional: further cut mezmur JSON / calendar JS.  
5. Lint debt remains.  
6. CMS write E2E still **NOT TESTED**.
