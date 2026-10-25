# Mezmur bulk classification hardening — 2026-10-25

## Root cause

The bulk request identifies a Mezmur by `mezmur_data_import.import_id`, but the
legacy category and occasion relationship tables identify their owner only by
`mezmur_slug`. Two records with the same normalized slug can therefore read or
mutate the same relationship rows. The browser compounded this by accepting an
RPC result matched by slug and by treating one matching relationship as proof
that an entire request succeeded.

The production-safe repair adds nullable `mezmur_import_id` foreign keys to the
two relationship tables. Legacy rows are backfilled only when their normalized
slug identifies exactly one active Mezmur. Ambiguous legacy rows are retained,
left unowned, excluded from public views, and never selected as a mutation
target. All new writes and verification use the stable UUID.

## Security behavior

- The bulk RPC permits only `admin` and `super_admin` profiles.
- The ordinary editor UUID RPC remains available to authenticated staff.
- The old slug-only editor RPC is revoked rather than used as a fallback.
- Direct relationship tables are denied to `anon`; signed-in staff retain CRUD
  subject to `is_staff()` RLS policies.
- Anonymous clients read only `mezmur_category_links_public` and
  `mezmur_occasion_links_public`. Those views contain UUID-owned relationships
  for Published, nondeleted, public-eligible Mezmurs.
- Invalid or archived taxonomy slugs fail that record with SQLSTATE `23503`.
- Each record runs in a PL/pgSQL exception block (a subtransaction), so a failed
  record cannot retain partial category or occasion writes.
- `applied` is returned only after exact read-after-write verification of every
  requested UUID relationship.

The migration does not update lyrics, status, rights, Zemari, or media fields.
The explicit taxonomy manifest uses `ON CONFLICT (slug) DO NOTHING`: existing
labels, types, and hierarchy are not renamed or reparented. Review the preflight
taxonomy output before approving installation.

## Manual production activation

1. In Supabase SQL Editor, run
   `supabase/mezmur-import/PREFLIGHT_MEZMUR_BULK_CLASSIFICATION_READ_ONLY.sql`.
   Save the results. Stop if `import_id` is nullable/non-unique, or review any
   ambiguous legacy links and unexpected grants/policies.
2. Review the existing category list against the manifest in the migration.
3. Paste and run only
   `supabase/migrations/20261025020000_mezmur_bulk_classification.sql`.
   Do not run `supabase db push`.
4. Run
   `supabase/mezmur-import/VERIFY_MEZMUR_BULK_CLASSIFICATION_READ_ONLY.sql`.
   The four privacy leak counts and two duplicate relationship counts must all
   be zero. Confirm the RPC signature is
   `bulk_assign_mezmur_classifications(jsonb,boolean)` and is executable only by
   `authenticated` (authorization is additionally enforced inside the RPC).
5. Run
   `supabase/mezmur-import/TEST_MEZMUR_BULK_CLASSIFICATION_THREE_RECORDS.sql`.
   Confirm all six verification booleans are true. The script ends with
   `ROLLBACK`, so it leaves no test relationships behind.
6. Deploy the reviewed frontend separately, after the database migration.
7. Sign in as Admin or Super Admin, open Mezmur Bulk Management, refresh, and
   run **Auto-Categorize All** with overwrite disabled first. The result panel
   reports inserted, already-present, preserved, and failed counts from the
   database. Export failures before considering an overwrite run.

## Verification limitation

The configured anonymous Supabase key cannot read the staff-only import table,
and no service-role key is available locally. Consequently, the exact live
duplicate-slug count could not be collected from this workstation. The supplied
preflight query is the authoritative read-only production audit. No production
SQL or data mutation was performed.

## Local validation

- `powershell -File scripts/run-mezmur-classification-sql-test.ps1` starts an
  isolated PostgreSQL 17 cluster, installs a production-shaped baseline,
  executes the migration twice, and verifies UUID isolation, RLS privacy,
  invalid-taxonomy rollback, idempotency, authorization, and database-confirmed
  result counts.
- `npx tsx scripts/test-mezmur-classification-draft-published.ts` covers 1,152
  record pagination, duplicate-slug handling, exact read-back, and frontend
  result accounting.
- The production build, focused ESLint, Bulk Management tests, Hymn Browse
  tests, public visibility tests, and Playwright workflows were also run as
  documented in the implementation handoff.
