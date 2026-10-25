# Mezmur two-status publication workflow — 2026-10-24

## Root cause

The applied migration `20261024120000_mezmur_import_publication_workflow.sql`
requires all of the following inside `public.publish_mezmur_import()`:

- `review_status = 'approved'`;
- an allowed `rights_status`; and
- non-null `publication_approved_at` and `publication_approved_by`.

The public `mezmur_public` view created by the subsequent `20261024130000`
migration repeats the same editorial-review predicate. Consequently changing
`mezmur_data_import.status` to `published` does not satisfy either the RPC or
the public read model. The old UI exposed Save, Approve, and Publish as separate
steps, so a normal staff publication could fail with the reported editorial
approval message even when the content itself was complete.

## Local fix

The forward-only migration
`20261024160000_mezmur_media_only_publication.sql` supersedes the strict
rights gate in `20261024150000` and replaces the guard, publication RPC, and
public view without updating any content rows.

- The only writable CMS states are `draft` and `published`.
- A transition to `published` still must use `publish_mezmur_import()`.
- The RPC still requires an authenticated `editor`, `admin`, or `super_admin`.
- Title, slug, and Amharic lyrics remain mandatory.
- Publish never changes or fabricates protected rights metadata.
- When lyrics display is verified, the public view returns the lyrics normally.
- When rights are unresolved or external-only, staff can publish a media/source
  entry only when a YouTube, external-lyrics, or source URL exists. The public
  view returns every lyrics field as `NULL`, while preserving the protected
  lyrics in `mezmur_data_import`.
- The public view no longer filters on `review_status = 'approved'`; it exposes
  lyrics only when verification is recorded and otherwise exposes links only.
- RLS remains enabled; anonymous users receive only `SELECT` on the public view
  and no publication function execution.

The editor now offers only Save Draft, Publish, and (for a published record)
Return to Draft. Ordinary saves never include `review_status`, `rights_status`,
`publication_approved_at`, or `publication_approved_by`. Publish first persists
the content as a draft, then calls the guarded RPC. This preserves lyrics,
Zemari, category, occasion, hymn-section, media,
and YouTube fields and relationships.

## Production application procedure (not performed)

1. Back up the database and apply migrations through `20261024160000` in a
   staging project first.
2. Reload the PostgREST schema cache (the migration issues the notification).
   Run `supabase/mezmur-import/VERIFY_TWO_STATUS_WORKFLOW_READ_ONLY.sql` and
   retain its output with the release record.
3. Deploy the matching frontend only after the migration succeeds.
4. Publish one lyrics-eligible draft and one unresolved-rights draft containing
   a YouTube or authorized source URL.
5. Confirm both rows have `status = 'published'` while rights and legacy review
   metadata remain unchanged.
6. Query `mezmur_public` as staff and anon. The eligible record should include
   lyrics; the media-only record must return all lyrics columns as `NULL`.
7. Confirm a direct anonymous RPC call is denied and a direct base-table
   publication transition still raises SQLSTATE 42501.
8. Return the test item to Draft if it should not remain public.

No existing draft is automatically published and no production database or
deployment was changed by this work.
