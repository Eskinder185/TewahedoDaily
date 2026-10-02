# Repo Cleanup Report — Tewahedo Daily

Safe production cleanup after Supabase became content source of truth.  
Process: inventory → archive/stub → remove runtime imports → rebuild → document.

**Date:** 2026-10-02  
**No destructive database changes** (no table drops; migration history kept).

---

## Before

### Runtime / bundle hot spots (production build baseline)

| Chunk | Size (approx) |
| --- | --- |
| `chant-data-mezmur-*.js` | **535.66 kB** (gzip 160.67) |
| `eotc-dataset-*.js` | 197.54 kB (gzip 28.08) |
| `calendar-*.js` | 678.67 kB (gzip 178.86) |
| `practice-*.js` | 129.07 kB (gzip 38.36) |
| `prayers-*.js` | 107.01 kB (gzip 31.58) |
| `practice-*.css` | 84.96 kB |
| `chant-data-prayers-*.js` | 11.66 kB |

### Repo assets found

- Local mezmur / werb / prayer / liturgy / synaxarium JSON under `src/data` and related loaders
- ~444 MB `public/images/calendar` PNG/JPG masters (also WebP under `calendar-web`)
- Legacy Cloudflare `bundledMezmur` JSON imports
- Optional Content Health probe against `mezmur_favorites`
- Vite `manualChunks` paths targeting `src/data/chants/*`

---

## Removed (from production runtime)

| Path / item | Reason | Size impact |
| --- | --- | --- |
| Browser import of amharic + english mezmur JSON | Supabase `mezmur` is SoT | **−535.66 kB** JS chunk eliminated |
| Runtime local prayer / wudase / zeweter / psalm JSON imports | Supabase prayer tables | ~MB of JSON out of client graph (stubs remain) |
| Runtime import of `synaxariumEntries.json` | Supabase Synaxarium tables | ~1 MB JSON not bundled |
| Liturgy local JSON from `src` runtime | Archived | ~0.5 MB off src |
| `public/images/calendar/*` PNG/JPG masters | Cards/media use content-media + WebP pool | **~444 MB** off public deploy path |
| `bundledMezmur` reading chant JSON in Functions | Always returns `undefined` | Worker no longer depends on packs |
| Content Health `mezmur_favorites` probe | Favorites = `user_favorites` only | Dead optional query removed |
| Vite chant-data-* manualChunks for moved JSON | Dead chunk names | Build config cleaned |
| Legacy chantRepository “use bundled chant data” catch | Fail closed to empty + warning | No silent local DB |

---

## Archived

Moved under `archive/` (not imported by Vite app entry):

| Location | Reason |
| --- | --- |
| `archive/local-data/chants/` | Mezmur / werb / classified packs for migration |
| `archive/local-data/tselot/` | Prayer / wudase / zeweter / mezmure-dawit JSON |
| `archive/local-data/synaxarium/synaxariumEntries.json` | Historical Synaxarium dump |
| `archive/local-data/liturgy/` | Old liturgy rule/structure JSON |
| `archive/local-data/calendar/mezmur-index.json` | Old day→mezmur index |
| `archive/media/calendar-png/` | ~443.9 MB PNG/JPG masters |
| `archive/media/home/` | Oversized home master (~8.5 MB) |

**Archive totals:** ~87 files, ~479 MB (mostly calendar PNG masters).

---

## Kept

| Item | Why |
| --- | --- |
| `src/data/eotc_calendar_json/*` | Required calendar **rule engine** data (movable feasts, fasts, seasons) |
| `public/images/calendar-web/*.webp` | Optimized static art (~7.6 MB) for strips / non-card UI |
| Brand / icons / favicon / essential home heroes | Static site assets |
| `supabase/migrations/*` | Applied migration history |
| Empty typed stubs in `src/lib/practice/*` and `src/lib/prayers/*` | Preserve import graph / types without shipping data |
| Calendar calculation + presentation resolvers | Logic, not duplicate CMS copy |

---

## Bundle Before / After

Measured with `npm run build` (see `.cleanup-before-build.log` / `.cleanup-after-build.log`).

| Chunk | Before | After |
| --- | --- | --- |
| `chant-data-mezmur` | 535.66 kB | **gone (0)** |
| `eotc-dataset` | 197.54 kB | **72.29 kB** |
| `practice` JS | 129.07 kB | **52.93 kB** |
| `practice` CSS | 84.96 kB | **54.17 kB** |
| `prayers` JS | 107.01 kB | 141.92 kB* |
| `calendar` JS | 678.67 kB | 678.59 kB |
| **Sum of key chunks above** | **~1733 kB** | **~1000 kB** (**≈ −733 kB / −42%**) |

\*Prayers chunk grew slightly after graph reshuffle; mezmur dump removal dominates overall win.  
`dist/assets` total after cleanup: **~1.90 MB**.

### Repository size

- Working tree excl. `node_modules` / `dist` / `.git`: **~551 MB** (includes `archive/` ~479 MB).
- **Production deploy footprint** improved mainly by: no 535 kB mezmur chunk + no ~444 MB calendar PNG under `public/`.
- To shrink the git working tree further later: keep `archive/media` outside the repo or in Git LFS (follow-up).

---

## Dependencies Removed

None in this pass. Unused packages were not removed without import certainty.

---

## Runtime Fallbacks Removed

1. Bundled mezmur JSON as Practice / public catch-all  
2. Local prayer / wudase / zeweter / psalm packs in client  
3. Local Synaxarium JSON import  
4. Giant calendar PNG public fallback pool (WebP + Supabase media remain)  
5. `mezmur_favorites` dual-path / health probe  
6. Functions `bundledMezmur` JSON lookup  

---

## Remaining Legacy Code

| Item | Status |
| --- | --- |
| `useLegacyMezmur = !supabase` | Dev-only empty local path when env missing |
| `chantRepository` / old `chants` table loader | Not public hymn SoT; returns empty when Supabase configured |
| `WudaseMariamPage` reading empty `WUDASE_PRAYERS` | Prefer Supabase Pray collections routes; stub page may be empty |
| EOTC JSON still references `/images/calendar/*.png` in some fields | UI presentation prefers `calendar_cards` + WebP manifest; raw PNG paths are stale metadata |
| `calendarImageManifest` WebP pool | Still used for non-card strips — intentional |
| Old DB tables (`prayer_guides*`, `mezmur_favorites`) | **Not dropped** — code cleanup only |

---

## Risks / Follow-up

1. Confirm Cloudflare / Pages deploy excludes `archive/` (Vite `dist` already does).  
2. Optional: delete or LFS `archive/media/calendar-png` after backup.  
3. Migrate remaining EOTC factual copy fully to Supabase when ready — then shrink `eotc-dataset` further **without** removing the date math engine.  
4. Wire any leftover local-only prayer pages fully to Supabase or remove routes.  
5. Mobile Slow-3G / Fast-4G lab pass recommended on Homepage, Hymns, Pray, Calendar (not automated here).  
6. Lint: `npm run lint` reports **67 errors / 10 warnings** (mostly React Compiler `setState` in effects) — pre-existing pattern, not introduced as build blockers (`tsc -b` + Vite succeed).

---

## Verification

| Check | Result |
| --- | --- |
| `npm run build` | **Pass** |
| `npm run test:calendar-cards` | **Pass** (`calendar-card-reconciliation pure checks: ok`) |
| `npm run lint` | Fail with existing React hooks/compiler debt (see above) |
| DB migrations / table drops | **None performed** |

See also: [DATA_SOURCE_MAP.md](./DATA_SOURCE_MAP.md).
