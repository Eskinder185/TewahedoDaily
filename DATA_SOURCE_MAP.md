# Data Source Map — Tewahedo Daily

Canonical production sources after the Supabase content migration.
**Rule:** one production source of truth per feature. Local JSON is not a silent fallback.

| Feature | Canonical Supabase table(s) | Frontend service / hook | Legacy local source removed | Fallback behavior |
| --- | --- | --- | --- | --- |
| Homepage hero / slides | `homepage_settings`, related CMS settings | `homepageService` | — | Error / empty secondary rails; hero shell still paints |
| Today in Church / Calendar Cards | `calendar_cards` + structured calendar sources; images via `content-media` | `resolveCalendarEventPresentation`, `resolveCalendarCard`, `calendarAdminService` | Giant `public/images/calendar/*.png` masters (archived) | No image → empty / neutral; no borrow from unrelated events |
| Mezmur library (browse / search) | `mezmur`, browse views / taxonomy | `publicContent/service`, `hymnBrowse`, `mezmurSearch` | `data/chants/amharic-chants.json`, `english-mezmur-chants.json` (archived) | `"We couldn't load the hymn library."` — **no** bundled mezmur dump |
| Mezmur detail / playback | `mezmur` (+ lyrics fields) | `PublicMezmurDetail` → `publicContent/service` | Local workshop entries | Error state; empty local stubs only if `!supabase` (dev) |
| Singer browsing | Mezmur taxonomy / singer fields in Supabase | `hymnBrowse` | Local category JSON in chant packs | Error / empty groups |
| Categories / occasions / browse groups | Hymn browse group tables + mezmur taxonomy | `hymnBrowse`, Admin `HymnBrowseGroupsAdmin` | Local chant `category` objects as runtime catalog | Error message on browse shell |
| Prayers (collections / sections / items) | `prayer_collections`, `prayer_sections`, `prayers` | Pray routes / prayer services | `tselot.json`, `wudase-mariam.json`, `zeweter-tselot.json`, Psalm JSON packs (archived) | Page error — empty stubs in `src/lib/prayers/*Data.ts` |
| Learn How to Pray | `prayer_learning_collections`, `prayer_learning_sections`, `prayer_learning_content` | `PrayerGuidePage`, `prayerGuideAdminService` | Old frontend dependency on local CSV/JSON; DB `prayer_guides*` tables may still exist (not dropped) | Unable to load / empty guide — no local guide dump |
| Liturgy | Liturgy CMS / structure tables as configured | Structure / liturgy admin + public liturgy routes | `data/liturgy/*.json` (archived under `archive/local-data/liturgy`) | Error / structure from Supabase only |
| Calendar factual / date resolution | Local **rule engine** JSON under `src/data/eotc_calendar_json/` (LOGIC + structured observances for computation) **plus** Supabase calendar source / cards for presentation | `eotcCalendar/*`, `getCalendarEventsForDate` | Duplicated liturgy/day-detail JSON copies archived where unused; **EOTC JSON kept** for Pascha / recurrence | Calculation always uses rule engine; presentation prefers `calendar_cards` |
| Synaxarium | `synaxarium_days`, `synaxarium_commemorations` | `synaxariumService` | `synaxariumEntries.json` (~1MB) archived — **not imported** | Unable to load Synaxarium — no local 1MB dump |
| Media | Supabase Storage `content-media` | `contentMedia`, Media Library / MediaPicker | Legacy calendar PNG masters archived | Missing media → broken URL / empty; brand static assets stay in `public/` |
| Favorites | `user_favorites` | `favoritesService` | Runtime dual-write / queries to `mezmur_favorites` removed | Guest: `localStorage` soft cache only |
| Admin CMS (all content types) | Respective Supabase tables | Admin pages under `src/pages/admin` | — | Standard CMS errors |

## Intentionally kept local (not content CMS)

| Asset / module | Why kept |
| --- | --- |
| `src/data/eotc_calendar_json/*` | Calendar **calculation** (Ethiopian dates, movable feasts, fasts, seasons). Distinguishes DATA-for-rules from CMS copy. |
| `public/images/calendar-web/*.webp` | Lightweight static observance art for strips / non-card UI (~7.6MB total). |
| Brand: favicon, icons, essential home/about heroes | Static site chrome — not CMS-managed content. |
| `archive/local-data/**` | Migration / historical packs — **outside** Vite `src`/`public` runtime. |
| `archive/media/calendar-png/**` | ~444MB PNG masters — archive only, not deployed as hot-path assets. |
| `supabase/migrations/**` | Migration history — never delete for “cleanup.” |

## Stub modules (empty arrays, preserve types)

- `src/lib/practice/chantWorkshopEntries.ts`
- `src/lib/practice/werbData.ts`
- `src/lib/prayers/tselotData.ts`, `wudaseData.ts`, `zeweterData.ts`, `psalmData.ts`
- `src/lib/synaxarium/synaxariumDataset.ts` (no JSON import)
- `functions/lib/legacyTargets.ts` → `bundledMezmur()` always `undefined`

## Failure UX

On Supabase failure for content features: show a clear error (e.g. unable to load / try again).  
**Do not** catch and hydrate from archived local databases.
