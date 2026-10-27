# BACKEND & API INTEGRATION AUDIT REPORT

## 1. Supabase REST & Database State

- **Supabase Host:** `https://tgvhpibzzkqxkcumrivh.supabase.co`
- **Authenticated Staff Authorization:** `public.is_staff()` returns true for editor/admin/super_admin. Tested and functional.
- **Anonymous Permissions:**
  - `public.mezmur_public`: SELECT allowed.
  - `public.mezmur_category_links_public`: SELECT allowed (5 rows verified).
  - `public.mezmur_occasion_links_public`: SELECT allowed (5 rows verified).
  - `public.zemaris`: SELECT allowed (5 rows verified).
  - `public.zemaris_with_counts`: SELECT denied (`42501`) for `anon`. Needs `GRANT SELECT ON public.zemaris_with_counts TO anon, authenticated;`.
  - `public.church_library_book_versions`: `PGRST205` / `404` (Table not in schema cache). Resolved once `REPAIR_CHURCH_LIBRARY_UPLOAD.sql` is executed.

---

## 2. FastAPI Processing Server State (`VM401`)

- **Host Domain:** `https://ai.eskinder.dev`
- **Current Deployed Routes:** 21 routes (inspected via `/openapi.json`).
- **Missing Router:** `/api/church-library/*` endpoints are missing on the deployed container.
- **Root Cause:** The `tewahedo-api` Docker container on host `VM401` (`/opt/tewahedo-ai`) has not been rebuilt with the new router registered in `backend/app/main.py`.
- **Resolution:**
  ```bash
  ssh eskew@VM401
  cd /opt/tewahedo-ai
  git pull origin main
  docker compose build api && docker compose up -d api
  ```
