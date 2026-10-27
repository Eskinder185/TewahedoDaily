# IMPLEMENTATION ACTION PLAN

A prioritized roadmap of technical improvements based on the mobile-first website audit.

---

## Phase 1: Immediate Fixes (Quick Wins — 1 to 2 Days)

1. **Apply Reviewed Supabase Upload Schema Repair:**
   - Execute [`supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql`](file:///c:/Users/eskew/github/TewahedoDaily/supabase/church-library/REPAIR_CHURCH_LIBRARY_UPLOAD.sql) in Supabase SQL Editor.
   - Creates `church_library_book_versions` table and private Storage RLS on `church-library-originals`.
2. **Grant Anonymous Read on `zemaris_with_counts`:**
   - Execute:
     ```sql
     GRANT SELECT ON public.zemaris_with_counts TO anon, authenticated;
     NOTIFY pgrst, 'reload schema';
     ```
   - Eliminates HTTP 401 console noise on `/practice/categories` and `/practice/occasions`.
3. **Deploy Backend Container to VM401:**
   - Rebuild and restart `tewahedo-api` container to register Church Library endpoints.
   - Eliminates 404 on `GET /api/church-library/status` and `POST /api/church-library/search`.

---

## Phase 2: Mobile UI & Interaction Hardening (3 to 5 Days)

4. **Isolate Desktop Navigation DOM on Mobile:**
   - Add conditional rendering or `aria-hidden="true"` to desktop mode links when mobile viewport is active to eliminate duplicate hidden nodes.
5. **Fix Search FAB Pointer Collision:**
   - Hide or disable `button[aria-label="Open search"]` while the Search Dialog modal is open.
6. **Increase Touch Targets on Forms:**
   - Expand hit areas for checkboxes and inline links on `/submit-mezmur` to a minimum of 44px × 44px.
7. **Add Amharic Translation for Search Diagnostic Notice:**
   - Localize `"Church Library sources are temporarily unavailable."` into Amharic (`የቤተ መጻሕፍት ምንጮች ለጊዜው አይገኙም።`).

---

## Phase 3: Structural & Long-Term Enhancements (1 to 2 Weeks)

8. **Touch Swipe Gestures for Calendar:**
   - Implement horizontal touch swipe navigation on `/calendar` for day and month stepping.
9. **Bible Reading Mode Controls:**
   - Introduce an in-reader toolbar on `/bible/:book/:chapter` allowing font size adjustments (A- / A+) and custom line-height.
10. **Aggregated Prayer Section Counts:**
    - Replace parallel sub-queries on `/prayers` with an aggregated RPC function to reduce HTTP request count on low-bandwidth connections.
