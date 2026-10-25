# Hymns Trash schema repair — 2026-10-24

## Root cause

The frontend Delete/Trash/Restore feature was merged with queries for
`deleted_at`, `deleted_by`, and `deleted_from_status`, but the linked Supabase
project did not apply local migration
`20261024170000_hymn_content_trash_management.sql`. PostgREST therefore rejects
the select before any Trash RPC is reached.

The older migration was also incomplete as a production repair: collection and
section trash indexes were absent, imported relationship tables remained
publicly readable without checking whether their Mezmur was live, ordinary
staff updates could forge trash metadata, and the public Mezmur projection had
no independent `deleted_at is null` boundary.

## Reviewed repair

Apply only:

`supabase/migrations/20261024200000_hymn_content_trash_schema_repair.sql`

It is forward-only and idempotent. It can be applied whether the older trash
migration was skipped or already applied. It does not move, restore, publish,
or delete any content when installed.

The migration supplies:

- three trash metadata columns on Mezmurs, Zemaris, collections, and sections;
- partial trash indexes and relationship lookup indexes;
- a staff-readable immutable deletion event log;
- guarded trash metadata updates so ordinary Save operations cannot forge it;
- Admin/Super Admin Trash and Restore RPCs;
- Super Admin-only permanent-delete and Zemari-reassignment RPCs;
- stable single-row resolution when an ID or slug is supplied;
- non-cascading Zemari, collection, and section handling;
- public RLS filters for deleted Zemaris, collections, sections, and links;
- `deleted_at is null` in the `mezmur_public` security boundary; and
- a `zemaris_with_counts` view compatible with staff Trash and public browse.

Restore always returns content as a draft. The original publication status is
preserved in `content_deletion_events.details.previous_status`; this avoids an
Admin restore silently republishing content around the normal publication RPC.

## Local integration validation

The migration was applied twice to an isolated PostgreSQL 17 database built
from `supabase/tests/hymn_trash_schema_baseline.sql`. The second application
confirmed idempotence. `hymn_trash_schema_repair_test.sql` verified:

- staff create and edit;
- published Mezmur Trash and immediate public hiding;
- actor/timestamp/original-status recording;
- rejection of direct trash metadata mutation;
- safe Restore as Draft;
- Admin permanent-delete rejection;
- Super Admin permanent deletion after Trash;
- category, occasion, and section link preservation during soft delete;
- removal of only the deleted Mezmur's links during permanent delete;
- Zemari deletion refusal while referenced;
- explicit Zemari reassignment without deleting Mezmurs; and
- collection/section deletion without cascading into Mezmurs.

Frontend validation also passed the production TypeScript/Vite build, scoped
ESLint for all touched Trash/public-query files, static Trash security tests,
public visibility tests, publication tests, and the Playwright desktop/mobile
Save → Publish → Trash → Restore → permanent-delete workflow. Repository-wide
ESLint still reports 50 pre-existing React hook/compiler errors in unrelated
calendar, prayer, liturgy, and public-page components; no touched file appears
in that failure list.

## Manual activation checklist

1. Take a database backup.
2. Confirm the four existing content tables and `public.is_staff()` are present.
3. Open the reviewed migration file in the Supabase SQL editor.
4. Execute that file only. Do **not** run unrestricted `supabase db push`.
5. Run
   `supabase/mezmur-import/VERIFY_HYMN_TRASH_SCHEMA_REPAIR_READ_ONLY.sql`.
6. Confirm 12 metadata columns, eight indexes, four triggers, RLS enabled, no
   anonymous RPC execution, and zero deleted/published inconsistencies.
7. In staging, create a draft, edit it, move it to Trash, restore it, and confirm
   it returns as Draft.
8. Verify a public published Mezmur disappears immediately when trashed.
9. Verify Admin cannot permanently delete and Super Admin can only permanently
   delete an already-trashed record.
10. Deploy the already-tested frontend only after the schema verification passes.

No production database or deployment was changed during local implementation.

