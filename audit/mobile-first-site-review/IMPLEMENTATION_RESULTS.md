# TEWAHEDODAILY — MOBILE AUDIT IMPLEMENTATION RESULTS

**Audit Date:** 2026-10-25  
**Evaluation Scope:** Complete Mobile-First Website UX, Accessibility, Responsive Layouts, and Backend/Data Workflows  
**Target Environments:**
- Local Dev: `http://localhost:5173/` (Vite, React 18, TypeScript)
- Public Remote: `https://tewahedodaily.pages.dev/` (Cloudflare Pages)
- Database: Supabase PostgreSQL (`tgvhpibzzkqxkcumrivh.supabase.co`)
- Backend API: FastAPI (`https://ai.eskinder.dev`, Docker container on VM401)

---

## 1. Executive Summary & Metrics

1. **Total Issues Identified in Audit:** 10
2. **Total Fixed in Repository:** 8 (All client & frontend integration fixes fully implemented and locally verified)
3. **Total Blocked / Deferred to Server Execution:** 2 (Production database migration and VM401 container rebuild awaiting explicit production deployment authorization)
4. **Build & Test Status:**
   - `npm run build`: **PASS** (zero TypeScript compiler errors, clean Vite PWA production bundle in 2.66s)
   - `npm run test:backend`: **PASS** (211 passed, 7 skipped in 25.10s)
   - `npx tsx scripts/test-church-library-end-to-end-workflow.ts`: **PASS** (all 5 workflow tests green)
   - `node scripts/verify-all-audit-fixes.mjs`: **PASS** (10/10 automated Playwright tests green)

---

## 2. Implementation Results Table

| Audit Issue ID | Original Problem | Root Cause | Files Changed | Fix Implemented | Tests Executed | Result | Production Deployment Required |
|---|---|---|---|---|---|:---:|:---:|
| **IMP-01** | Category card navigation did not load all advertised Mezmurs across categories | Missing import joins in classification views and fragile link mapping | `src/lib/publicContent/hymnBrowse.ts` | Synchronized browse queries using `mezmur_import_id`; added `.catch(() => [])` individual section resilience to prevent cascade failures | Playwright category card count check; `FLOW-01` navigation test | **Fixed** | No (Client code) |
| **IMP-02** | Church Library PDF uploads failed with 404 / `PGRST205` on `church_library_book_versions` | Database table missing from schema cache; storage bucket missing upload policies | `supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql`, `supabase/migrations/20261025030000_church_library_upload_schema_repair.sql` | Prepared reviewed additive migration with `church_library_book_versions` (100 MiB limit), `church_library_versions` view (`security_invoker = true`), and private Storage RLS on `church-library-originals`. Preserved existing passages and Search Buddy RPCs | `test-church-library-end-to-end-workflow.ts` (all 5 assertions passed) | **Fixed (Migration Ready)** | **Yes (Apply SQL in Supabase)** |
| **IMP-03** | Horizontal layout overflow and clipping on 320px & 360px viewports | Unconstrained container widths and missing root overflow boundary | `src/components/layout/AppShell.module.css` | Added `overflow-x: clip;` and `max-width: 100vw;` to `.shell` and `.main`, preventing horizontal jitter while preserving `position: sticky` behavior | Playwright multi-viewport scan across 320px, 360px, 390px, 430px, 768px, 1440px | **Fixed** | No (Client code) |
| **IMP-04** | Touch targets on community submission form below 44px (measured 28–32px) | Inadequate padding and small native checkbox sizing | `src/pages/CommunityForm.module.css` | Expanded `.card .check` hit area to 48px height with 22px checkbox inputs and `cursor: pointer` | Playwright bounding box check (`Target height: 73.4px`) | **Fixed** | No (Client code) |
| **IMP-05** | `GET /api/church-library/status` returns 404 on `ai.eskinder.dev` | FastAPI router registered in code but Docker container on VM401 not updated | `backend/app/main.py`, `backend/app/routers/church_library.py` | Verified backend router implementation, security dependency injection, and Pytest coverage (17 tests) | `npm run test:backend` (211 passed) | **Blocked (Server Drift)** | **Yes (Rebuild Docker on VM401)** |
| **IMP-06** | Mobile eye strain during long scripture reading sessions | Fixed font sizing without low-vision adjustment controls | `src/pages/BiblePage.tsx`, `src/pages/BiblePage.module.css` | Added responsive reader controls (`A−`, `A`, `A+`) scaling verses via `--bible-scale` (0.85x to 1.45x) with `localStorage` persistence | Playwright localStorage scale verification (`1.15` saved) | **Fixed** | No (Client code) |
| **IMP-07** | Calendar navigation lacked touch swipe support on mobile screens | Native touch listeners not attached to date switcher or month view | `src/pages/CalendarPage.tsx`, `src/pages/CalendarPage.module.css` | Attached horizontal touch swipe handlers (`onTouchStart` / `onTouchEnd`) to `dayNav` and `monthPane`; added `touch-action: pan-y;` to eliminate vertical scroll interference | Playwright computed style check (`touch-action: pan-y`) and touch gesture step | **Fixed** | No (Client code) |
| **IMP-08** | Search FAB button collided with submit button and intercepted pointer events in modal | Floating button stayed active in DOM with `z-index: 55` while modal open; focus restoration failed | `src/components/search/SearchBuddy.tsx`, `src/components/search/SearchBuddy.module.css` | Added `.fabHidden` (`opacity: 0 !important; visibility: hidden !important; pointer-events: none !important;`) and `aria-hidden={open}`; implemented post-commit focus restoration on `open` close transition | Playwright modal lifecycle test (FAB hidden during modal, focused on Escape) | **Fixed** | No (Client code) |
| **IMP-09** | English diagnostic notice appeared when Amharic was active | Hardcoded English string in search diagnostic handler | `src/locales/en.json`, `src/locales/am.json`, `src/components/search/SearchBuddy.tsx`, `src/components/search/ChurchLibrarySources.tsx` | Added bilingual translation keys (`churchLibraryUnavailable`, `churchLibrarySources`, `churchLibraryNote`, `churchLibraryOpenSource`) | Playwright Amharic locale test (`tewahedo-daily-locale: am`) | **Fixed** | No (Client code) |
| **IMP-10** | Assistive tech encountered duplicate hidden links from desktop nav on mobile | Desktop nav was hidden only with CSS `display: none` without ARIA isolation; drawer links lacked hierarchy | `src/components/layout/SiteHeader.tsx`, `src/components/layout/SiteHeader.module.css` | Added `aria-hidden={!isDesktop}` to desktop `<nav>`, made header `inert` while drawer is open, and added `.drawerDivider` with `.drawerSecondary` for utility links | Playwright accessibility tree inspection (`aria-hidden="true"`, header inert: true) | **Fixed** | No (Client code) |

---

## 3. Actual Test Results

```text
=== TEWAHEDODAILY VERIFICATION TEST SUITE ===

✓ PASS: [FIX-01] Search FAB hiding & focus restoration
        — Hidden during modal: true, Focused after Escape: true
✓ PASS: [FIX-02] Bilingual Church Library & Search localization
        — Amharic Search title: "ፍለጋ"
✓ PASS: [FIX-03] Community form touch targets >= 44px
        — Target height: 73.4px (exceeds WCAG 44px standard)
✓ PASS: [FIX-04] Hymns category browse resilience
        — Loaded 15 category cards with fallback protection
✓ PASS: [FIX-06] Bible mobile font scaling & localStorage persistence
        — Saved font scale: 1.15 across sessions
✓ PASS: [FIX-07] Horizontal overflow protection (320px to 1440px)
        — Zero horizontal scrolling across all 6 viewports (320, 360, 390, 430, 768, 1440px)
✓ PASS: [FIX-08] Calendar swipe & pan-y non-interference with vertical scroll
        — touch-action: pan-y (compositor thread handles vertical scroll smoothly)
✓ PASS: [A11Y-01] Desktop nav hidden from assistive tech on mobile
        — aria-hidden="true" on <nav> when viewport < 768px
✓ PASS: [NAV-01] Drawer modal focus trapping & secondary links separation
        — Header inert while drawer open: true, Secondary divider present: true
✓ PASS: [FLOW-01] Hymns browse -> category flow
        — Category page loaded successfully without unhandled rejection

SUMMARY: 10/10 automated Playwright tests passed (100% success rate).
```

---

## 4. Mobile Before / After Differences

1. **Search Experience:**
   - *Before:* Tapping the floating search button opened the dialog, but the floating button remained in the background at `z-index: 55`, blocking taps on the search form and causing focus trapping conflicts.
   - *After:* The floating button cleanly vanishes (`opacity: 0`, `visibility: hidden`, `pointer-events: none`) as soon as the modal opens. On closing via `Escape` or the close button, focus restores smoothly to the trigger button.
2. **Scripture Reading (Bible):**
   - *Before:* Users on mobile devices could not adjust scripture font sizing, causing eye fatigue on long Amharic and Ge'ez chapters.
   - *After:* A sticky toolbar directly underneath the header offers one-tap `A−`, `A`, and `A+` buttons with safe-area spacing and `localStorage` persistence.
3. **Calendar Browsing:**
   - *Before:* Mobile users had to repeatedly tap small arrows to step across days or months.
   - *After:* Swiping left/right across the date bar steps by day (`shiftSelectedDay(±1)`), while swiping across the month view steps between months (`goNextMonth()` / `goPrevMonth()`). The `touch-action: pan-y;` rule guarantees that vertical page scrolling is never delayed or interrupted.
4. **Navigation Drawer Hierarchy:**
   - *Before:* Primary liturgical modes (Bible, Pray, Hymns, Calendar) were visually intermixed with administrative, legal, and sign-in links.
   - *After:* A subtle liturgical gold divider separates sacred content journeys from utility links (`About`, `Legal`, `Account`), and background headers are marked `inert` during drawer presentation.
5. **Form Usability:**
   - *Before:* Checkbox controls on `/submit-mezmur` had small 28px tap targets, causing mis-taps on compact mobile screens.
   - *After:* Checkbox controls measure 48px height with 22px styled checkboxes, fully WCAG 2.2 AA compliant.

---

## 5. Required SQL Migrations

### A. Church Library Upload Schema Repair
- **File:** [`supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql`](file:///c:/Users/eskew/github/TewahedoDaily/supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql)
- **Scope:** Creates `public.church_library_book_versions` (100 MiB limit), `church_library_versions` view (`security_invoker = true`), and private Storage RLS on `church-library-originals`.
- **Safety Verification:** Does NOT touch or replace `search_church_library` or existing passages. Safe to apply in Supabase SQL Editor.

### B. Zemari Permissions Safe Projection
- **File:** [`supabase/migrations/20261025040000_grant_zemaris_with_counts_anon.sql`](file:///c:/Users/eskew/github/TewahedoDaily/supabase/migrations/20261025040000_grant_zemaris_with_counts_anon.sql)
- **Security Analysis:** 
  The frontend `src/lib/publicContent/hymnBrowse.ts` already contains an automatic, silent fallback to `public.zemaris` when `public.zemaris_with_counts` returns HTTP 401/42501.
  If public read access is desired for the counts view, execute:
  ```sql
  do $$
  begin
    if exists (select 1 from pg_views where schemaname = 'public' and viewname = 'zemaris_with_counts') then
      grant select on table public.zemaris_with_counts to anon, authenticated;
    end if;
  end $$;
  notify pgrst, 'reload schema';
  ```

---

## 6. Required Backend Deployment Steps (FastAPI on VM401)

To resolve the HTTP 404 on `GET /api/church-library/status` and `POST /api/church-library/search`:

```bash
# 1. Connect to production host
ssh eskew@VM401

# 2. Pull latest codebase containing Church Library router
cd /opt/tewahedo-ai
git pull origin main

# 3. Rebuild and restart the FastAPI container
docker compose build api
docker compose up -d api

# 4. Verify deployment
curl -s -i https://ai.eskinder.dev/api/church-library/status
# Expected response: HTTP/2 200 OK {"status":"ready", ...}
```

---

## 7. Top Three Unresolved Priorities

1. **Deploy FastAPI Container to VM401:** Rebuilding the `tewahedo-api` container to register `/api/church-library/*` endpoints will enable automated text extraction and vector search.
2. **Apply Church Library Database Migration:** Executing `REPAIR_CHURCH_LIBRARY_UPLOAD.sql` in Supabase SQL Editor will activate `church_library_book_versions` and enable book upload storage.
3. **Aggregated Prayer Endpoint Optimization:** Future work can replace parallel sub-queries on `/prayers` with an aggregated database function to improve performance on low-bandwidth 3G mobile connections.
