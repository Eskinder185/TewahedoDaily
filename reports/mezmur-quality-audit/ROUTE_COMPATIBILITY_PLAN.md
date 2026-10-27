# Route compatibility plan

## Current route contract

Public detail pages use `/practice/mezmur/:slug`. The current resolver queries `mezmur_public` by slug and historically used `limit(1)`; for the 121 live collision groups this can select an arbitrary row.

## Required sequence — no production action included

1. Run the authorized private-table query in `PRIVATE_SCHEMA_AND_COVERAGE_READ_ONLY.sql` and populate current `import_id`, `updated_at`, status, and dependent-link evidence for every row in `VERIFIED_PUBLIC_SLUG_COLLISIONS.csv`.
2. For each group, have an editor decide whether records are separate hymns, recordings, language variants, or true duplicates. There is no automatic canonical selection.
3. Retain one approved canonical slug only if that choice is editorially verified. Give each other separately retained record a unique, stable slug using the approved `--<import-id-short>` suffix template.
4. Before changing any slug, insert a one-to-one alias from the old slug to the intended immutable `import_id`; the alias must be unique and public read-only.
5. Update the public route resolver to reject ambiguous direct-slug matches and resolve only a verified alias to its stored target.
6. Run detail-page, favorites, recent-history, calendar-link, category-link, and Search Buddy regression tests.

## Current Phase 2 state

- No alias table or redirect was created.
- No slug is proposed as ready to apply because the configured administrator credential was empty and the public view intentionally omits `import_id`.
- Existing URLs are unchanged. The local route guard prevents a collision from silently selecting an arbitrary record after it is deployed.
