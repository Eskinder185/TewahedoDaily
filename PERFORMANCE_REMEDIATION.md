# Performance Remediation Report

**Date:** 2026-10-02  
**Project:** Tewahedo Daily  
**Scope:** Launch-blocker remediation (images, Calendar empty state, Homepage loading, favorites, bundles)

Numbers below are measured locally unless marked production.

---

## Production data (queried via Supabase REST, 2026-10-02)

| Table | Total | Published |
|-------|------:|---------:|
| `orthodox_observances` | 84 | 84 |
| `monthly_commemorations` | 53 | 53 |
| `liturgical_fasts` | 17 | 17 |
| `liturgical_seasons` | 14 | 14 |
| `calendar_cards` | **0** | **0** |

`calendar_cards` breakdown (production): featured **0**, `show_on_home` **0**, `home_featured` **0**, with image **0**, linked **0**.

Structured calendar **sources exist**. Presentation table `calendar_cards` is empty in production.

---

## Image size before / after

### Calendar artwork (`public/images/calendar`)

| Metric | Before | After |
|--------|-------:|------:|
| Folder size | **~443.9 MB** (64–65 files, mostly PNG) | Originals **kept** |
| Delivery copies | none (0 WebP) | `public/images/calendar-web/` **~7.5–8 MB** WebP |
| Typical card PNG | **9–11 MB** | WebP **~40–350 KB** (most ~80–170 KB) |
| WebP count | **0** | **62+** derivatives |

Optimization script: `npm run optimize:calendar-images`  
Manifest: `scripts/optimize-calendar-images.manifest.json`  
Aggregate reduction reported by script: **492.3 MB → 8.4 MB (98.3%)** including hero derivatives.

Rules: resize down only (max 1200×900 inside), no crop, WebP q≈78, originals untouched.

### Hero

| Asset | Before | After |
|-------|-------:|------:|
| `lalibela.png` (archive) | **8.52 MB** | kept |
| Mobile delivery | often multi‑MB PNG/JPG | `home-hero-lalibela-640.webp` **~70 KB** |
| Tablet | — | `home-hero-lalibela-1024.webp` **~160 KB** |
| Desktop | — | `home-hero-lalibela-1600.webp` **~358 KB** |
| Prior JPG fallback | `home-hero-tewahedo-daily.jpg` **~1.11 MB** | still available |

`HeroSection` uses `srcSet` + explicit width/height for CLS.

---

## Bundle size before / after (`npm run build`)

| Chunk | Before (raw ≈) | After (raw ≈) | Notes |
|-------|---------------:|--------------:|-------|
| `calendar-*.js` | **~883 KB** | **~688 KB** | EOTC JSON split out |
| `eotc-dataset-*.js` | (inside calendar) | **~198 KB** | Separate chunk |
| `chant-data-mezmur-*.js` | **~536 KB** | **~536 KB** | Still required by Practice workshop JSON |
| gzip calendar | ~210 KB | ~182 KB | |

Homepage uses lazy `HomeTodayInChurchPreview` + `getHomepageTodayEvents` (orthodox catalog + cards), not the full Synaxarium graph on first paint.

---

## Network / query cleanup

| Issue | Status |
|-------|--------|
| Favorites fall back / dual-write to `mezmur_favorites` | **Removed** — `user_favorites` + guest localStorage only |
| Homepage full-page “Loading…” over hero | **Removed** — reserved skeleton under hero |
| Calendar public path requiring `featured=true` | **Removed** for public linking / legacy fallback |
| Production empty card strip | Root cause: **0 `calendar_cards` rows** + deployed UI that only listed featured cards. Local Calendar timeline uses structured sources and does not require cards for event listing. |

---

## Remaining concerns

1. **Deploy required** — production still serves the old featured-card strip until this branch is deployed.
2. **Run Admin → Sync Calendar Cards** against production to populate `calendar_cards` for images/presentation (sources already published).
3. **`chant-data-mezmur` ~536 KB** remains for Practice; do not remove until Practice is fully Supabase-driven for lyrics.
4. Calendar chunk still large (~688 KB) due to calendar UI + churchCalendar logic; further cut needs month-marks rewrite off bundled EOTC JSON.
5. Lint still **~64 errors** (mostly `set-state-in-effect`); not blocking build.
6. CMS authenticated write E2E: **NOT TESTED** (no Admin session).

---

## Mobile widths retested

Device metrics exercised in browser tooling against **production** (pre-deploy) and code-reviewed for **local** post-fix:

| Width | Production (pre-deploy) | Local post-fix expectation |
|------:|-------------------------|------------------------------|
| 375 | Hero heavy; Calendar featured empty strip | Hero WebP srcset; timeline from sources |
| 390 | Same | Same |
| 430 | Same | Same |

Full cold-network Lighthouse after deploy is still recommended.
