# Hymn Trash/Restore column mismatch diagnostic

Date: 2026-10-24

## Finding

The 12 base-table metadata columns are present and visible to PostgREST. The
remaining `42703` is from the derived `public.zemaris_with_counts` view, whose
production projection still omits `deleted_at`, `deleted_by`, and
`deleted_from_status`.

Observed read-only REST probes against the configured project:

| Relation | Trash metadata projection | Result |
| --- | --- | --- |
| `mezmur_data_import` | three fields | 200 |
| `zemaris` | three fields | 200 |
| `mezmur_collections_import` | three fields | 200 |
| `mezmur_sections_import` | three fields | 200 |
| `zemaris_with_counts` | three fields | 400 / SQLSTATE 42703 |

The failing request was a `GET /rest/v1/zemaris_with_counts` with a `select`
projection containing the Trash fields. The database response was:

`column zemaris_with_counts.deleted_from_status does not exist`

This is not evidence that `public.zemaris.deleted_from_status` is absent. A
PostgreSQL view keeps the output columns from the `SELECT` used to define it;
adding a column to its source table does not add that column to the view.

## Configuration and cache checks

- `.env`, `.env.local`, and `supabase/.temp/project-ref` resolve to the same
  Supabase project.
- Base-table REST probes return 200, so PostgREST has already discovered the
  new base columns. A cache reload alone cannot add fields omitted by the SQL
  view definition.
- The existing Trash RPC implementations operate directly on the four base
  tables. They do not depend on `zemaris_with_counts`.
- The repository's complete forward migration already contains the corrected
  view at its end. Production behavior shows that the view-replacement portion
  is not reflected remotely even though the base columns are present.

## Local application repair

- Trash loading retries against canonical `public.zemaris` only for the exact
  stale-view `42703`/`PGRST204` signature, then calculates active Mezmur counts
  from `mezmur_data_import`.
- Zemari admin and public browse queries remember the stale-view result and use
  the canonical table instead of repeatedly generating failed REST requests.
- Other `42703` errors are not swallowed; they continue to surface normally.
- The general error mapper now describes this as an outdated Zemari summary
  view rather than telling an operator to recreate a base column.

## Production repair (not applied)

After approval, run only
`supabase/mezmur-import/REPAIR_ZEMARIS_WITH_COUNTS_TRASH_VIEW.sql` in Supabase
SQL Editor. It validates dependencies, replaces only the view, preserves its
existing column order, appends the three metadata columns, and reloads the
PostgREST schema cache. It does not add columns, update rows, or change RLS.

Do not run an unrestricted `supabase db push` for this repair.
