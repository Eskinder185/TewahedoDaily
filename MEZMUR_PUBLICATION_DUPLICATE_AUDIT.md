# Mezmur publication duplicate audit

## Root cause

The active bulk publication function receives immutable `import_id` values but
delegates to `publish_mezmur_import(text,text)`, which resolves the target by
slug. A duplicate active slug therefore produces the `P0002` error
`Expected one Mezmur for slug ..., found 2` (or can make a non-strict legacy
lookup ambiguous).

The repair adds `publish_mezmur_import(uuid,text)` and makes bulk publication
call that overload. It verifies that the selected import ID still owns exactly
one active slug before delegating to the existing authorization, rights,
content-validation, and publication guards.

Live production counts were not queried or invented. Run
`supabase/mezmur-import/MEZMUR_DUPLICATE_SLUG_AUDIT_READ_ONLY.sql` in the
Supabase SQL Editor and retain its output.
