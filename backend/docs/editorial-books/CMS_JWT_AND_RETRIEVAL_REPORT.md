# CMS JWT auth bridge & retrieval diagnosis

**Date:** 2026-10-19  
**Scope:** Local only — no push, deploy, VM401, or production secret changes.

## 1. Authorization model (actual)

TewahedoDaily CMS does **not** put staff roles in the JWT `role` claim.

| Layer | Meaning |
|-------|---------|
| Supabase JWT `role` | Auth realm: `authenticated` / `anon` / `service_role` |
| Supabase JWT `sub` | User id |
| `public.profiles.role` | CMS role: `user`, `contributor`, `editor`, `admin`, `super_admin` |
| `public.is_staff()` | `profiles.role in ('editor','admin','super_admin')` |

Editorial preview matches staff roles used by `/admin/editorial-books` (`RequireCmsRole` + `isStaff`): **editor, admin, super_admin**. Contributors are denied.

## 2. Verified fixes

### Backend (`app/editorial/cms_auth.py`)

- Prefer `Authorization: Bearer <Supabase access_token>`
- When `SUPABASE_JWT_SECRET` is set: HS256 verify + `exp` + `aud` (`authenticated`) + `iss` (`{SUPABASE_URL}/auth/v1` unless overridden)
- Reject `anon` / `service_role` tokens used as user bearers
- Load CMS role from `profiles` via service key (same source as `is_staff()`)
- Deny non-staff CMS roles with 403
- Optional Auth API confirmation (`EDITORIAL_CONFIRM_AUTH_API`)
- Legacy `X-Editorial-Token` remains available only if `EDITORIAL_ALLOW_LEGACY_TOKEN=true` (default) for ops rollback; frontend no longer uses it

### Router

- All `/api/editorial/*` routes use `Depends(require_editorial_principal)`
- New staff-only `GET /api/editorial/diagnostics/retrieval`

### Frontend

- `editorialBooksApi.ts` sends CMS session `access_token` as Bearer
- Removed sessionStorage / manual token paste UI
- Preview gates on `isStaff` and shows retrieval diagnostics

## 3. Why real-package retrieval is empty

Diagnosis endpoint / `diagnose_package_retrieval()` separates causes:

| Check | Result on current drafts |
|-------|--------------------------|
| Parsing | OK (3003 paragraphs load) |
| Private lexical EN index | Hits available |
| Private lexical AM (Ethiopic source) | Hits available |
| `approved_for_ingestion=true` | **0** |
| Search Buddy `retrieve_for_search_buddy` | **[]** |
| **Cause** | **`approval_filter`** (correct, not a bug) |

Empty public retrieval is **not** caused by missing Amharic indexing or parse failure. Books remain unapproved theological drafts.

## 4. Tests

| Suite | Result |
|-------|--------|
| `pytest tests` | **126 passed** |
| `scripts/eval_bilingual_retrieval_local.py` | PASSED (synthetic EN/AM + package diagnosis) |
| `npm run test:editorial-books-access` | OK |
| `npm run test:editorial-books-mobile` | OK (375/390/393/430) |
| `tsc -b` | Clean |

Security unit/API tests included in the 126.

## 5. Deployment requirements (when authorized)

1. Set on AI backend (secrets, not repo):
   - `ENABLE_EDITORIAL_PREVIEW=1` only in Access-locked environments
   - `SUPABASE_URL`, `SUPABASE_KEY` (service role for profile lookup)
   - `SUPABASE_JWT_SECRET` (JWT secret from Supabase project settings)
   - Optionally `SUPABASE_JWT_ISS`, `SUPABASE_JWT_AUD`
2. After CMS JWT path is verified in staging: set `EDITORIAL_ALLOW_LEGACY_TOKEN=false` and remove `EDITORIAL_PREVIEW_TOKEN`
3. Keep preview off in public production unless Cloudflare Access + staff accounts
4. Do not wire book retrieval into public Search Buddy until approved exports exist

## 6. Unresolved blockers / limits

- **Live Supabase round-trip** against the real project JWT secret was not executed here (no production secrets in workspace). Unit tests mint HS256 tokens and mock `profiles` lookup.
- **Contributor** CMS users can open `/admin` for limited areas but cannot pass editorial API staff checks (by design).
- Books remain unapproved; no promotion of drafts to theological sources.
- Public book library and Search Buddy book RAG still intentionally absent.

## 7. Explicit non-actions

No GitHub push, VM401 changes, production Qdrant ingest, approval-flag mutation, or public exposure of private books.
