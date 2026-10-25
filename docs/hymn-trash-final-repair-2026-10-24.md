# Hymns Trash final repair — 2026-10-24

## Root cause

Production already contains `deleted_at`, `deleted_by`, and
`deleted_from_status` on all four Hymns content tables. The legacy import
tables do not contain the `import_id` column assumed by the earlier repair.
Repository schema history shows that their original identifiers
(`mezmur_id`/`slug`, `collection_id`/`collection_slug`, and
`section_id`/`section_slug`) are nullable text columns without primary-key or
uniqueness guarantees. They are therefore unsafe selectors for destructive
operations. `zemaris.id`, by contrast, is an existing UUID primary key.

The operational layer was also absent: `content_deletion_events` and the four
action RPCs were not installed. The failed transactional migration could not
create those objects because PostgreSQL stopped first at the nonexistent
`import_id` reference (SQLSTATE 42703).

The prior local repair was not safe enough to apply unchanged. It resolved
records with `ID OR slug`, sorted the candidates, and used `LIMIT 1`. A duplicate
or colliding legacy identifier could therefore select the wrong record during a
destructive operation. It also used a transaction-local setting as a metadata
guard bypass.

## Final implementation

`20261024220000_hymn_trash_final_repair.sql` is forward-only, transactional,
and idempotent. It:

- tolerates the 12 metadata columns already being present;
- adds one internal `import_id uuid` to each of the three legacy import tables,
  using `DEFAULT gen_random_uuid()` so PostgreSQL initializes existing rows
  without firing row-level update triggers; installs a trigger-safe recovery
  backfill for partially added nullable columns, enforces `NOT NULL`, and
  creates a unique index;
- narrows the existing publication guard so it validates inserts, transitions
  into Published, and publication-relevant content/rights edits—not unrelated
  internal metadata changes on historical published rows;
- creates/repairs the immutable deletion audit table;
- installs the four exact RPC signatures;
- authorizes Trash/Restore for Admin and Super Admin only;
- authorizes permanent deletion/reassignment for Super Admin only;
- uses `import_id` UUID for Mezmurs, collections, and sections and `id` UUID for
  Zemaris;
- rejects slugs, malformed identifiers, missing records, and ambiguous IDs;
- serializes competing actions with transaction advisory locks and row locks;
- preserves relationships during soft delete and restore;
- returns restored records as Draft;
- blocks collection cascades and Zemari deletion while references remain;
- removes only directly owned link rows during permanent deletion;
- prevents ordinary writes from changing deletion metadata;
- keeps the existing Draft/Published publication guard and lyrics-rights rules;
- excludes deleted content and relationships at the public database boundary;
- preserves the confirmed 17-column `zemaris_with_counts` contract, including
  `mezmur_count bigint` at position 16 and `published_mezmur_count bigint` at
  position 17, then appends `deleted_at`, `deleted_by`, and
  `deleted_from_status` at positions 18-20;
- replaces only the named policies owned by this repair instead of dropping
  every existing policy; unrelated/custom production access policies remain;
- does not reference or recreate any of the six permanently removed Mezmur
  fields.

The frontend now loads and submits these stable UUIDs and distinguishes missing
RPC, wrong signature, expired login, permission denial, stale PostgREST cache,
missing identifier column (42703/PGRST204), project/network mismatch symptoms,
and unexpected database failures.

## Production compatibility boundary

The migration validates the existing `mezmur_public` column contract before
using `CREATE OR REPLACE VIEW`. If the production view has an unexpected column
order or shape, the transaction intentionally aborts without changing the
database. Run the read-only verification/inspection first and review that view
instead of dropping it blindly.

No production SQL or deployment was performed by this implementation.

## Local validation

- PostgreSQL 17 integration harness: PASS against a production-shaped schema
  where all three `import_id` columns were initially absent and duplicate
  legacy IDs/slugs were present. It also contained an already-published legacy
  Mezmur with missing lyrics. The repair was applied twice successfully.
- Partial-install recovery: PASS after deliberately making that historical
  published row's UUID nullable and null. The second migration run repaired
  the UUID without changing its status/title/slug/lyrics; a subsequent
  publication-relevant title edit was still rejected by the publication guard.
- Existing-view compatibility: PASS with the exact 17-column production view,
  both count columns typed `bigint`, and the migration run twice. The final
  post-install verifier reported PASS for all 19 checks.
- Data preservation/identifier checks: PASS; all pre-existing rows remained,
  every row received a distinct non-null UUID, and defaults covered new rows.
- Trash, restore-as-Draft, Super Admin permanent delete, Admin rejection,
  Zemari reassignment, relationship safety, public filtering, and the existing
  Draft/Published publication workflow: PASS.
- Static security regression suite and focused ESLint: PASS.
- TypeScript plus Vite production build: PASS.
- Playwright desktop/mobile Mezmur workflow: PASS.

Concurrency is enforced inside each action RPC with the same transaction-level
advisory-lock namespace plus `SELECT ... FOR UPDATE` on the exact UUID row.
The regression suite asserts both lock mechanisms. No RPC contains a
`LIMIT 1` fallback or destructive slug selector.

## Manual installation

1. In the linked project's Supabase SQL Editor, run
   `INSPECT_HYMN_TRASH_IDENTIFIER_SCHEMA_READ_ONLY.sql` and save its results.
   It is safe before `import_id` exists and reports columns, keys, duplicate
   legacy identifiers, dependent views, and dependent functions. Do not use a
   slug or legacy ID as a destructive selector even if this one snapshot shows
   no duplicates.
2. Confirm the configured frontend project URL is the same project inspected in
   step 1.
3. Open `20261024220000_hymn_trash_final_repair.sql` and execute that file only.
   Do not use `supabase db push`.
4. If the migration reports an unexpected `mezmur_public` contract, stop. Run
   `select pg_get_viewdef('public.mezmur_public'::regclass, true);` and compare
   the result with the migration's 30-column contract.
5. Run `VERIFY_HYMN_TRASH_FINAL_REPAIR_READ_ONLY.sql`. This is the post-install
   verifier and directly checks the newly installed UUID columns. Every summary
   row must be PASS.
6. If PostgREST still reports PGRST202, use Supabase Dashboard → Settings → API
   to reload/restart the API schema cache, then sign out and back in.
7. In a non-production test record, verify Admin Trash → Restore as Draft and
   Super Admin Trash → Permanent Delete. Verify the corresponding audit rows.
8. Deploy the frontend only after database verification. Existing drafts are
   not published by this migration.
