# Admin CMS + Community Submissions Audit

Last updated: 2026-09-28

## Architecture

```
Public site (Vite + React Router)
  └─ browser Supabase client (anon/publishable key + RLS)
       ├─ published content reads
       └─ authenticated CMS staff writes via RLS + RPCs

Cloudflare Pages Function: POST /api/submissions
  └─ Turnstile verify + rate limit
       └─ service_role RPC receive_community_submission

Supabase Postgres
  ├─ profiles / cms_role
  ├─ mezmur + taxonomy + mezmur_tags
  ├─ saints / feasts / prayers / articles
  ├─ community_submissions
  ├─ content_versions / content_reports
  └─ storage buckets (mezmur-images, mezmur-audio, saints, feasts, articles, general-media)
```

## Routes

### Public
| Path | Purpose |
|------|---------|
| `/` | Homepage |
| `/practice`, `/practice/mezmur/:slug` | Hymns |
| `/pray`, `/prayers` | Prayers |
| `/calendar`, `/today` | Calendar / Today |
| `/submit-mezmur`, `/suggest-correction` | Community forms → Pages Function |
| `/admin/login` (footer link) | CMS sign-in |

### Admin (protected except login)
| Path | Roles |
|------|-------|
| `/admin/login` | Public |
| `/admin` | contributor+ |
| `/admin/mezmur`, `/new`, `/:id/edit` | contributor+ (RLS scopes edits) |
| `/admin/submissions`, `/:id` | editor+ |
| `/admin/saints|feasts|prayers|articles` | contributor+ |
| `/admin/categories|singers|tags` | browse all; manage editor+ |
| `/admin/media`, `/admin/daily` | admin+ |
| `/admin/users`, `/admin/settings` | placeholders (admin+ nav) |

SPA fallback: `public/_redirects` → `/* /index.html 200`

## Tables (expected vs migrations)

| Table | Status |
|-------|--------|
| profiles | Present (`cms_role` nullable; **no `user` enum** — non-staff = `role IS NULL`) |
| mezmur | Present + lyrics/media/FKs + `source_submission_id`, `contributor_credit` |
| categories, singers, tags, mezmur_tags | Present |
| community_submissions | Present (mezmur + correction fields) |
| content_versions | Present |
| content_reports | Present; **no public UI/insert** (corrections use submissions) |
| saints, feasts, prayers, articles | Present |

## Roles (`public.cms_role`)

| Role | Access |
|------|--------|
| *(null / no profile)* | Public only; admin UI hidden |
| contributor | Own drafts; submit for review; cannot publish |
| editor | Edit/publish workflow; review submissions; manage taxonomy |
| admin | + media/daily; manage lower roles via `set_cms_member` |
| super_admin | Full; role management |

Frontend helper: `hasCmsRole()` in `src/lib/auth/useAuth.ts`.  
Database helper: `cms_private.current_role()`.

## Community submission workflow

1. Visitor posts `/submit-mezmur` or `/suggest-correction`
2. Browser validates input, then calls Supabase RPC `submit_community_submission` with the **publishable** key (shared Vite client — no service role in the browser)
3. RPC inserts into `community_submissions` with `status = submitted` and returns `public_reference` (e.g. `TD-YYYY-#####`)
4. Optional legacy path: Cloudflare Pages Function `POST /api/submissions` + Turnstile + `receive_community_submission` (service role, server-only)
5. Editor/admin reviews via RPCs `review_submission` / `submission_duplicates`
6. Approve → `convert_submission` creates **draft** mezmur, sets `converted_to_content`, links `related_content_id`
7. Staff edits draft, submits for review, publishes (community-sourced mezmur cannot skip review)

Anonymous users **cannot** SELECT/UPDATE/DELETE `community_submissions`.

## Storage buckets

`mezmur-images`, `mezmur-audio`, `saints`, `feasts`, `articles`, `general-media`  
Public read of published media only; staff upload per role helpers.

## Environment

### Browser (Cloudflare Pages build vars)
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_PUBLISHABLE_KEY` (`VITE_SUPABASE_ANON_KEY` still accepted as fallback)
- `VITE_TURNSTILE_SITE_KEY`
- optional `VITE_PUBLIC_MEZMUR_SOURCE=supabase`

### Pages Functions (`.dev.vars` / CF secrets — never `VITE_`)
- `SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`
- `TURNSTILE_SECRET_KEY`
- `SUBMISSION_IP_HASH_SECRET`
- `SITE_URL=https://tewahedodaily.pages.dev`

## Known limitations / TODOs

1. **Production deploy gap (critical):** Live bundle at tewahedodaily.pages.dev (inspected 2026-09-28) did **not** contain Admin CMS route code — `/admin/login` renders blank. Redeploy this repo with Vite env vars set at build time.
2. `/admin/users` and `/admin/settings` are placeholders — membership is via SQL/`set_cms_member` only until a Users UI ships.
3. `content_reports` table exists but is unused; corrections use `community_submissions`. Public inserts go through `submit_community_submission` (no table SELECT for anon).
4. Version “restore” loads a draft into the form; it does not auto-write until Save.
5. Apply migrations through `20260928230000_browser_community_submit.sql` on project `tgvhpibzzkqxkcumrivh` (editor taxonomy + browser submit RPC).
6. **Convert UX:** `convert_submission` uses `lower(public_reference)` as slug and does not map free-text `singer_name` / suggested tags to taxonomy FKs — editors must finish those fields before publish.
7. **Taxonomy public read:** `taxonomy_read` is `using (true)`, so archived categories/singers/tags remain visible to anon (not a write risk).
8. **`SITE_URL` must match deploy origin exactly** or `/api/submissions` returns 403.
9. Signed-in non-CMS users hitting protected `/admin/*` are redirected home (not back to login).

## Manual Supabase / Cloudflare actions

1. Confirm all migrations through `20260928220000_admin_cms_repair.sql` applied.
2. Create storage buckets if missing (see `20260928000100_cms_storage.sql`).
3. Provision first `super_admin` via trusted SQL / `set_cms_member` (no open signup grants roles).
4. Set Cloudflare Pages **build** env: `VITE_SUPABASE_*`, Turnstile site key.
5. Set Pages **runtime** secrets for `/api/submissions` (see `.dev.vars.example`). Ensure `SITE_URL` matches the live origin.
6. Redeploy so admin chunks ship in the production JS bundle.
7. Smoke-test Flows A–E from the audit checklist after deploy.
