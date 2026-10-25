# Final Mezmur Draft / Published workflow

Date: 2026-10-24  
Production changed: no

## Root cause

The reported `23514` text can only come from the older implementation of
`public.publish_mezmur_import(text,text)` in
`20261024120000_mezmur_import_publication_workflow.sql`. That function rejects
publication unless `review_status = 'approved'`.

The local repository already contained later intended replacements, but the
linked Supabase migration history did not recognize those local migrations.
Consequently, changing only the React interface could never fix the live error:
the database continued executing the old function body.

## Final behavior

- User-facing status is only Draft or Published.
- Ordinary Save writes Draft and never changes review or rights audit fields.
- Publish calls `public.publish_mezmur_import(text,text)` through the authenticated client.
- The RPC requires an authenticated `editor`, `admin`, or `super_admin` profile.
- Title, slug, and Amharic lyrics are required.
- Verified rights allow lyrics display.
- Unknown or unverified rights are never converted to a verified value. Such a
  record may publish only when it has a YouTube URL or authorized source link;
  the public view returns its lyrics columns as `NULL`.
- Unpublish changes the record back to Draft.
- Direct Draft-to-Published table updates remain blocked by the trigger.
- Anonymous and regular authenticated clients cannot read the import table.
  Public clients read `public.mezmur_public`, which contains eligible Published
  records only.

Legacy `review_status` values are retained for history but are not consulted for
publication eligibility and are not displayed in the normal editor.

## Exact migration

Apply only:

`supabase/migrations/20261024180000_mezmur_two_state_publication_final.sql`

The migration replaces all historical `publish_mezmur_import` overloads with one
two-argument function, replaces the publication guard, recreates the safe public
projection, and replaces the unrestricted base-table read policy with a staff-only
policy. It performs no bulk content update and publishes no drafts.

The migration and public projection intentionally do not reference or create
`structured_lyrics`, `lyrics_language`, `source_info`, `external_lyrics_url`,
`last_verified_at`, or `related_content`. The retained public view contract uses
the existing title, five lyrics columns, Zemari/media fields, status, source URL,
timestamps, and rights status. Before replacing the view, the migration checks
its ordered column contract. An unexpected view shape aborts the transaction;
the view is never dropped with `CASCADE`.

Publication locks exactly one slug and updates that locked row by `ctid`. A
duplicated legacy `mezmur_id` therefore cannot cause a second Mezmur to publish.
`deleted_at is null` remains part of the public projection.

## Safe production procedure

1. Back up `public.mezmur_data_import`, `public.mezmur_publication_events`, and the
   current definitions of `publish_mezmur_import` and
   `guard_mezmur_import_publication`.
2. Run the read-only verification file first and save the reported
   `pg_get_viewdef('public.mezmur_public'::regclass, true)` output. Confirm that
   the retained column order matches the contract checked by the migration.
3. Open the Supabase SQL Editor for the linked project.
4. Paste and review only
   `20261024180000_mezmur_two_state_publication_final.sql`.
5. Execute that file as one transaction. Do not run `supabase db push`.
6. Run
   `supabase/mezmur-import/VERIFY_MEZMUR_TWO_STATE_PUBLICATION_20261024_READ_ONLY.sql`.
7. Confirm:
   - one publication overload exists;
   - its definition has no editorial approval predicate;
   - authenticated execution is true and anon/public execution is false;
   - RLS is enabled;
   - anon base-table SELECT is false;
   - `restricted_lyrics_exposed = 0`.
8. With disposable test records, verify Save Draft, Publish, Return to Draft,
   missing-field rejection, media-only publication, and unauthorized rejection.
9. Deploy the frontend only after those checks pass.

## Local validation

- Publication regression test: passed.
- Public visibility and pagination test: passed.
- Playwright desktop/mobile workflow: passed.
- Focused ESLint: passed.
- TypeScript and production build: passed.
- Production-shaped PostgreSQL test with all six unwanted columns absent:
  passed, including exact-row publishing, RLS, public redaction, Trash, Restore,
  relationship preservation, and permanent-delete authorization.
- Full repository ESLint still reports the existing baseline of 51 errors and
  14 warnings in unrelated files; no focused publication-workflow lint failure
  remains.
