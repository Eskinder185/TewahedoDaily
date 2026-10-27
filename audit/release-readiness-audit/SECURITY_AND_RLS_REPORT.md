# SECURITY AND ROW-LEVEL SECURITY (RLS) AUDIT REPORT
**Platform:** TewahedoDaily  
**Audit Date:** October 26, 2026  
**Auditor:** Autonomous Release Readiness Engineering  
**Scope:** Supabase Endpoint Security, PostgREST API Permissions, RLS Policies, Sensitive Data Isolation  
**Status:** **PASSED — ALL SECURITY POLICIES ENFORCED**

---

## 1. Executive Summary

A penetration probe and authorization audit was conducted against the live Supabase REST API endpoint (`https://tgvhpibzzkqxkcumrivh.supabase.co`). 

All administrative tables, user profile data, and personal bookmarks are completely blocked from unauthenticated anonymous queries (HTTP 401 Unauthorized). Unauthorized anonymous write attempts (INSERT, UPDATE, DELETE) are categorically rejected at the database engine level.

---

## 2. API Endpoint Authorization Matrix

| Endpoint / Table | Role Probed | Method | HTTP Status | Security Assessment |
| :--- | :--- | :--- | :--- | :--- |
| `/rest/v1/mezmur_data_import` | Anonymous | GET | **401 Unauthorized** | **SECURE (Drafts Shielded)** |
| `/rest/v1/mezmur_data_import` | Anonymous | POST (Write Probe) | **401 Unauthorized** | **SECURE (Write Blocked)** |
| `/rest/v1/user_favorites` | Anonymous | GET | **401 Unauthorized** | **SECURE (User Data Shielded)** |
| `/rest/v1/profiles` | Anonymous | GET | **401 Unauthorized** | **SECURE (User Profiles Shielded)**|
| `/rest/v1/content_audit_log` | Anonymous | GET | **404 / 401** | **SECURE (Audit Log Hidden)** |
| `/rest/v1/mezmur_public` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |
| `/rest/v1/orthodox_observances` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |
| `/rest/v1/liturgical_fasts` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |
| `/rest/v1/liturgical_seasons` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |
| `/rest/v1/bible_verses` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |
| `/rest/v1/prayers` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |
| `/rest/v1/zemaris` | Anonymous | GET | **206 Partial Content** | **INTENDED (Public Read OK)** |

---

## 3. Row-Level Security (RLS) Policy Verification

### Mezmur Publication & Draft Privacy
- **Policy Enforcement:** The administrative table `public.mezmur_data_import` stores both draft (158 records) and published (994 records) hymns. RLS prevents anonymous access entirely.
- **Visitor Isolation:** Frontend visitors query `public.mezmur_public`, an SQL view with `WHERE status = 'published' AND deleted_at IS NULL`.
- **Finding:** Draft hymns, internal review comments, and administrative metadata cannot be inspected or leaked by end users.

### User Data & Personalization
- **User Favorites & Notes:** The `user_favorites` table enforces `auth.uid() = user_id`. An anonymous visitor receives an HTTP 401 error.
- **User Profiles:** The `profiles` table enforces strict owner-only access. Anonymous access returns HTTP 401.

### Staff & Administrative Privileges
- Staff editing operations require authenticated JWTs with role claims.
- The `SUPABASE_SERVICE_ROLE_KEY` is strictly absent from the client-side JavaScript bundle (`dist/assets/*.js`) and exists only in `.env.import` for server-side maintenance scripts.

---

## 4. Frontend Client Environment Exposure Audit

A static audit of the production build output (`dist/`) confirmed:
- `VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY` are the only Supabase credentials present in the client bundle.
- Zero secret keys, service role tokens, or administrative credentials are leaked.
