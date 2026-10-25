# Mezmur Zemari matching repair

## Root cause

Bulk Management treated `zemari_verified` (an active `mezmur_data_import.zemari_id` foreign-key match) as if it also described the validity of `singer_name`. The table therefore rendered every text-only imported singer as **Unmatched**, even when the saved name was meaningful. The backend also contained a `SequenceMatcher` fuzzy fallback, which was too permissive for canonical identity links.

The AI availability probe calls `GET {VITE_TEWAHEDO_AI_API_URL}/api/mezmur-bulk/jobs?limit=1`. The router and route exist in the local FastAPI application and are mounted by `backend/app/main.py`. A production 404 means the configured deployment does not contain/mount the current router, or the public base URL targets a different service/version. Supabase inventory and protected publication do not depend on that endpoint.

## Implemented behavior

- Displays **Zemari / Singer**, preserves original `singer_name`, and distinguishes Linked, Name recorded, Needs review, and Not recorded.
- Searches original and canonical names and filters linked/unlinked/review-needed/missing relationships.
- Deterministic matching order: active UUID, exact canonical name, exact verified alias, unique normalized name, exact normalized Latin slug/transliteration.
- Normalizes Unicode, whitespace, punctuation, and supported honorific prefixes. It never fuzzy-merges or creates Zemaris.
- Adds confirmed bulk exact matching and per-record manual linking through an authenticated, admin-only RPC. The RPC accepts stable Mezmur UUIDs, locks draft rows, validates active Zemari UUIDs, preserves singer text, prevents accidental replacement, and never grants anonymous writes.
- Keeps language assignments and publication eligibility independent from Zemari linking.

## Production activation

1. Review and run only `supabase/migrations/20261024290000_mezmur_zemari_matching.sql` in Supabase SQL Editor. Do not run unrestricted `supabase db push`.
2. Run `supabase/mezmur-import/VERIFY_MEZMUR_ZEMARI_MATCHING_READ_ONLY.sql` and save its counts/results.
3. Deploy the frontend after the migration. Sign in as Admin or Super Admin, refresh Bulk Management, review the exact-match count, and confirm the bulk action before writing links.
4. For optional AI analysis, deploy the current backend image and verify authenticated `GET /api/mezmur-bulk/jobs?limit=1` through the same public base URL configured at frontend build time. Do not report AI as available until this returns 200.

No production SQL, content write, deployment, commit, or push was performed during this repair.
