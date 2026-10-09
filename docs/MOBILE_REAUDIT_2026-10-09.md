# TewahedoDaily — Independent Mobile QA Re-Audit (2026-10-09)

**Production:** https://tewahedodaily.pages.dev/  
**Local verification:** Vite preview `http://127.0.0.1:4173` after `npm run build`  
**Repo HEAD at audit:** `c1115c8` (working tree ahead with uncommitted fixes)  
**Prior artifact:** `MOBILE_AUDIT_FIXES.md` (2026-10-08 remediation notes)

## Method

1. Probed live production with Playwright (`scripts/mobile-reaudit-probe.mjs`) at **390×844**.
2. Compared against current working-tree implementation.
3. Implemented smallest safe fixes locally (no commit / push / DB apply).
4. Retested on local preview with the same probe + dedicated regression script `scripts/test-mobile-calendar-language.mjs`.
5. Confirmed Supabase API errors with live REST (anon key from local env only; no secrets recorded here).

**Important:** Production and local differ. Statuses below distinguish **deployed** vs **local-fixed**.

## Status legend

| Status | Meaning |
|--------|---------|
| **PASS** | Independently verified working (local and/or production as noted) |
| **FIXED** | Reproduced, corrected in local code, regression verified on preview |
| **FAIL** | Still broken on the named environment |
| **BLOCKED** | Could not fully verify with available access |

---

## Issue table

| Issue | Production before | Current code | Action taken | Final test | Deployment status |
|---|---|---|---|---|---|
| CAL-01 | Sheet ~92vh, Close often off-screen (`top` negative due to AppShell transform) | Portaled sheet, `max-height: min(72dvh, 720px)`, body scrolls | Portal to `document.body` + 72dvh panel CSS | Local: **72vh**, Close visible (`top≈236`). Prod: still **FAIL** | **FIXED** locally · **not deployed** |
| CAL-02 | Browser Back left Calendar → Home | `history.pushState` + `popstate` closes sheet | History stack for open detail | Local: Back closes sheet, stays `/calendar`. Prod: Back → Home (**FAIL**) | **FIXED** locally · **not deployed** |
| CAL-03 | Partial / inconsistent modal a11y | Escape, focus trap, `inert` on chrome, restore focus | Kept/strengthened dialog a11y | Local Escape closes sheet (**PASS**). Full keyboard trap on physical devices: **Not Verified** | **FIXED** locally · **not deployed** |
| CAL-04 | No Previous/Next day controls (`prevDay/nextDay=0`) | Day nav buttons + EN/AM labels | Added `.dayNav` controls on Calendar page | Local: visible + clickable. Prod: missing (**FAIL**) | **FIXED** locally · **not deployed** |
| CAL-05 | Scroll jumped after close / Back | Save `scrollY`, `scrollRestoration='manual'`, restore on close | CalendarPage open/close restore | Local regression **PASS**. Prod: **FAIL** (old build) | **FIXED** locally · **not deployed** |
| SEARCH-01 | Bible race: Mark wins after John→Mark (search visible) | Existing `AbortController` + request id in `BibleSearchBar` | No code change required | Local+prod probe: John not sticky, Mark shown (**PASS**) | **PASS** on production |
| A11Y-01 | Gold ink / focus patterns from prior audit; residual contrast risks | No new theme tokens this pass | Spot-check header/calendar dialog focus rings | Day theme dialog OK locally. Night theme full matrix: **Not Verified** | **PASS** (partial) · residual night check |
| A11Y-02 | Labels mostly present; drawer had Both | EN/አማ only; language button labelled | One-tap switcher + LanguageToggle EN/AM only | Local drawer: no Oromo/Both. Prod drawer still has **Both** | **FIXED** locally · **not deployed** |
| TOUCH-01 | Header taps mostly OK; footer links ~34px | Footer links/`portfolio` → `--tap-min` | Footer CSS bump | Header language/Close ≥44. Footer fixed locally; brand link height may still be short | **FIXED** (footer) locally · **not deployed** |
| LANGUAGE-01 | No header language control; only hamburger; Both option | Header 🌐 **EN** / **አማ** one-tap toggle (no Oromo) | `LanguageMenuButton` always-visible on mobile | Local: visible, toggles, stays on page, persists via existing locale. Prod: **FAIL** (absent) | **FIXED** locally · **not deployed** |
| API-01 | `public_daily_content` → **PGRST202**; `articles.description` missing (**42703**) | App already falls back for daily RPC + article columns | Prepared migration `supabase/migrations/20261009120000_public_daily_and_articles_columns.sql` (**not applied**) | Live REST reconfirmed errors 2026-10-09 | **FAIL** on backend · migration ready, needs ops |

---

## Production vs local evidence (390×844)

### Production (`tewahedodaily.pages.dev`)

| Check | Result |
|-------|--------|
| Header language button | Missing |
| Drawer languages | English, Amharic, **Both** (no Oromo) |
| Day prev/next | Missing |
| Detail sheet | ~92vh, Close not reliably on-screen |
| Back with detail open | Navigates **Home** |
| Bible John→Mark race | Mark remains (OK) |

Screenshots: `tmp/mobile-reaudit-2026-10-09/` (overwritten by last probe run — re-run prod probe to refresh).

### Local preview (post-fix)

| Check | Result |
|-------|--------|
| Header language | Visible `EN` / toggles to `አማ` |
| Drawer | EN + Amharic only (no Oromo, no Both) |
| Day prev/next | Present |
| Detail sheet | **72vh**, Close visible |
| Back | Closes detail, stays on Calendar |
| Scroll restore | Regression **PASS** |
| Bible race | Mark shown, John not sticky |

Regression command:

```bash
npm run build
npx vite preview --host 127.0.0.1 --port 4173
BASE_URL=http://127.0.0.1:4173 npm run test:mobile-calendar-language
BASE_URL=http://127.0.0.1:4173 npm run probe:mobile-reaudit
```

---

## LANGUAGE-01 — Mobile EN ↔ አማ (product note)

Per product direction: **no Afaan Oromoo UI toggle**. Interface languages are English and Amharic only.

- Mobile header: one-tap globe control showing current abbreviation (`EN` or `አማ`).
- Desktop (≥768px): segment `LanguageToggle` (EN / አማ).
- Reuses `useLocale` / `normalizeAppLocale` (maps legacy `om` / `both` → `en`).
- Oromo **content** fields remain in data models; they are not offered as a UI locale.

---

## API-01 — Backend (still broken in live Supabase)

Confirmed against project REST (2026-10-09):

1. `POST /rest/v1/rpc/public_daily_content` → **404 / PGRST202**  
   Function `public.public_daily_content(target_day)` not in schema cache.
2. `GET /rest/v1/articles?select=id,description,teaching_category` → **400 / 42703**  
   `column articles.description does not exist`.

App mitigations already present:

- `publicDaily()` falls back when RPC returns `PGRST202`.
- `listContent()` retries without missing article columns.

These fallbacks mean UI may still “load,” but the underlying schema/RPC gap is **not resolved** until migration is applied.

Prepared (not applied): `supabase/migrations/20261009120000_public_daily_and_articles_columns.sql`.

---

## Files changed this re-audit (local)

| Area | Files |
|------|--------|
| Calendar sheet / a11y / history | `src/components/calendar/CalendarEventDetail.tsx`, `.module.css` |
| Day nav + scroll restore | `src/pages/CalendarPage.tsx`, `CalendarPage.module.css` |
| Mobile language | `src/components/layout/LanguageMenuButton.tsx`, `.module.css`, `SiteHeader.tsx` |
| Locales | `src/locales/en.json`, `src/locales/am.json` (`previousDay`/`nextDay`, `language.switchTo`) |
| Touch | `src/components/layout/SiteFooter.module.css` |
| Tests / probes | `scripts/test-mobile-calendar-language.mjs`, `scripts/mobile-reaudit-probe.mjs`, `package.json` scripts |
| Migration (ops) | `supabase/migrations/20261009120000_public_daily_and_articles_columns.sql` |

Related locale cleanup (EN/AM-only) already in the working tree from earlier work: `LanguageToggle.tsx`, `localeHelpers.ts`, etc.

---

## Build / lint / tests

| Check | Result |
|-------|--------|
| `npm run build` (`tsc -b && vite build`) | **PASS** |
| `npm run test:mobile-calendar-language` (local preview) | **PASS** |
| `npm run test:locale-unify` | **PASS** |
| `npm run test:shared-bible-search` | **FAIL** (pre-existing assertion on starter phrase `Open John 3:16` vs normalized `John 3:16`) — unrelated to this calendar/language pass |
| ESLint on `CalendarPage.tsx` | Pre-existing `react-hooks/set-state-in-effect` errors (not introduced here) |

---

## Remaining / needs physical device

- Deploy Cloudflare Pages build so production matches local fixes.
- Apply Supabase migration for API-01 (ops approval required).
- Night-theme contrast pass across Hymns / Legal / Auth.
- Multi-viewport matrix (320 / 360 / 375 / 430 / 768) beyond the 390×844 deep pass — spot automation done; full journey matrix **Not Verified** on every template.
- Real iOS Safari / Android Chrome Back gesture + safe-area with portaled sheet.

---

## Definition of done checklist

| Criterion | Status |
|-----------|--------|
| Every listed issue rechecked | Yes |
| Calendar open/close/day switch comfortable (local) | Yes |
| Mobile language switcher visible & one-tap EN↔አማ (local) | Yes |
| High-severity mobile bugs unresolved without report | Documented (prod lag + API-01) |
| Regression tests for implemented fixes | `test:mobile-calendar-language` |
| Production build succeeds | Yes |
| Report distinguishes local vs deployed | Yes |
| No commit / push / DB mutation without authorization | Honored |
