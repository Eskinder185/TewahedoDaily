# Production Mezmur publication audit

Date: 2026-10-27

## Read-only results obtained

The configured Supabase REST endpoint was queried without performing writes.

| Measurement | Result |
| --- | ---: |
| Rows in `public.mezmur_public` | 1,514 |
| Duplicate normalized slugs in `public.mezmur_public` | 0 |
| Public rows with Amharic lyrics | 1,458 |
| Public rows with transliteration | 1,354 |
| Public rows with YouTube URLs | 1,504 |

## Blocked comparison

The anonymous/publishable key received:

```text
401 / 42501: permission denied for table mezmur_data_import
```

Therefore these values were **not** calculated and must not be guessed:

- total imported records;
- imported records marked `published`;
- published records missing from `mezmur_public`;
- duplicate slug groups in the private import table;
- duplicate `mezmur_id` groups.

Run `supabase/mezmur-import/MEZMUR_DUPLICATE_SLUG_AUDIT_READ_ONLY.sql` using
an authenticated staff or service-role SQL session to obtain those counts.
The missing anonymous privilege is expected for a protected import table and
is not a reason to grant public read access.

## URL ambiguity

The public projection currently has no duplicate normalized slugs, so public
detail URLs are not ambiguous among the 1,514 visible rows. This does not prove
that the private import table has no duplicate slugs; that requires the blocked
staff query.

## Migration safety and activation

The UUID migration is forward-only and does not delete, merge, or rewrite
content. It preserves the existing role, rights, title/slug, and publication
guard checks by delegating the UUID overload to the established publisher. It
must still be reviewed against the deployed private schema and applied
manually. No migration or publication write was executed during this audit.

Manual publishing and bulk publishing against actual imported records remain
pending migration approval and an authenticated staff session. They were not
simulated as successful.
