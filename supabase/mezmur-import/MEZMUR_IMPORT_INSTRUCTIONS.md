# Mezmur staging import instructions

Additive cutover. This package prepares **staging → validation → apply**.

It does **not**:
- switch the frontend
- delete old browse-group code
- drop tables
- invent new Mezmur UUIDs
- import review CSVs into content tables

CSV package location:

`C:\Users\eskew\Documents\Codex\2026-09-29\files-mentioned-by-the-user-amharic\outputs\`

SQL package location (repo):

`supabase/mezmur-import/`

Permanent hierarchy migration (repo):

`supabase/migrations/20261002180000_hymn_collections_sections.sql`

---

## CSV → staging table mapping

| CSV FILE | IMPORT TABLE |
|---|---|
| `mezmur_collections.csv` | `public.mezmur_collections_import` |
| `mezmur_sections.csv` | `public.mezmur_sections_import` |
| `mezmur_data.csv` | `public.mezmur_data_import` |
| `mezmur_section_links.csv` | `public.mezmur_section_links_import` |
| `mezmur_occasion_links.csv` | `public.mezmur_occasion_links_import` |
| `mezmur_category_links.csv` | `public.mezmur_category_links_import` |

### Review-only (DO NOT import into staging/content)

| FILE | PURPOSE |
|---|---|
| `mezmur_duplicates_review.csv` | Uncertain duplicate pairs — editorial review only |
| `mezmur_taxonomy_review.csv` | Taxonomy aliases / ambiguous classifications — review only |

---

## Exact import order

### Before CSV load (dependencies)

These permanent dependencies must already exist in Supabase **before apply**:

1. **`public.mezmur`** — canonical hymn rows (resolve by `slug`; CSV `mezmur_id` is blank on purpose)
2. **`public.mezmur_occasions`** — for occasion-link resolution (`mezmur_occasion_links.csv`)
3. **`public.categories`** — for category_id fill (`mezmur_category_links.csv`)
4. **`public.singers`** — optional; CSV singer fields are currently blank
5. **`public.hymn_collections` / `public.hymn_sections` / `public.mezmur_section_links`** — created by `20261002180000_hymn_collections_sections.sql` (not applied yet until you choose)

Singers are **not** a hard dependency for step 3 CSV load. Occasions and categories **are** hard dependencies for apply of occasion/category links.

### CSV load order

1. `mezmur_collections.csv` → `mezmur_collections_import`
2. `mezmur_sections.csv` → `mezmur_sections_import`
3. `mezmur_data.csv` → `mezmur_data_import`
4. `mezmur_section_links.csv` → `mezmur_section_links_import`
5. `mezmur_occasion_links.csv` → `mezmur_occasion_links_import`
6. `mezmur_category_links.csv` → `mezmur_category_links_import`

Why this order: sections reference collection slugs; links reference mezmur + section/occasion/category slugs. Staging itself has no UUID FKs, so CSV upload order is for human clarity and validation join order.

---

## STEP-BY-STEP (do this in Supabase)

### STEP 0 — Backup

Take a Supabase backup / PITR checkpoint before any permanent apply.

### STEP 1 — Create permanent hierarchy tables (required before apply)

In SQL Editor, run:

`supabase/migrations/20261002180000_hymn_collections_sections.sql`

This creates:

- `public.hymn_collections`
- `public.hymn_sections`
- `public.mezmur_section_links`
- optional `mezmur` metadata columns (`title_english`, `image_path`, etc.)
- browse helper views/functions

**Do not drop** `hymn_browse_groups` / `hymn_browse_group_items`.

### STEP 2 — Create staging tables

Run:

`supabase/mezmur-import/MEZMUR_STAGING_SCHEMA.sql`

Creates:

- `public.mezmur_collections_import`
- `public.mezmur_sections_import`
- `public.mezmur_data_import`
- `public.mezmur_section_links_import`
- `public.mezmur_occasion_links_import`
- `public.mezmur_category_links_import`

All columns are **TEXT** for easy Table Editor CSV upload.

### STEP 3 — Clear staging (if reloading)

```sql
truncate table
  public.mezmur_collections_import,
  public.mezmur_sections_import,
  public.mezmur_data_import,
  public.mezmur_section_links_import,
  public.mezmur_occasion_links_import,
  public.mezmur_category_links_import;
```

### STEP 4 — Import CSVs in Table Editor

For each mapping row above:

1. Open **Table Editor** → staging table
2. **Insert** → **Import data from CSV**
3. Select the matching CSV
4. Confirm header row matches
5. Import

CSVs are UTF-8 with BOM (`UTF-8-SIG`).

Or with `psql` (service role):

```text
\copy public.mezmur_collections_import from '<OUTPUT_DIR>/mezmur_collections.csv' with (format csv, header true, encoding 'UTF8')
\copy public.mezmur_sections_import from '<OUTPUT_DIR>/mezmur_sections.csv' with (format csv, header true, encoding 'UTF8')
\copy public.mezmur_data_import from '<OUTPUT_DIR>/mezmur_data.csv' with (format csv, header true, encoding 'UTF8')
\copy public.mezmur_section_links_import from '<OUTPUT_DIR>/mezmur_section_links.csv' with (format csv, header true, encoding 'UTF8')
\copy public.mezmur_occasion_links_import from '<OUTPUT_DIR>/mezmur_occasion_links.csv' with (format csv, header true, encoding 'UTF8')
\copy public.mezmur_category_links_import from '<OUTPUT_DIR>/mezmur_category_links.csv' with (format csv, header true, encoding 'UTF8')
```

Expected counts after load:

| Staging table | Rows |
|---|---:|
| collections | 9 |
| sections | 56 |
| mezmur_data | 264 |
| section_links | 466 |
| occasion_links | 67 |
| category_links | 210 |

### STEP 5 — Validate (required)

Run:

`supabase/mezmur-import/MEZMUR_IMPORT_VALIDATION.sql`

Inspect:

- `B_*` duplicate checks → must be empty
- `C_*` empty required fields → must be empty
- `D_*` staging package references → must be empty
- `E_*` production references → must be empty for blockers
- `F_zero_required` → **every `n` must be 0**

If any `F_zero_required.n > 0`, **STOP**. Use the matching `E_*` / `D_*` queries for exact broken rows (`mezmur_slug`, `section_slug`, `reason`, etc.).

Common production blockers:

- staged `mezmur_slug` not present in live `public.mezmur`
- staged `occasion_slug` not present in live `public.mezmur_occasions`
- staged `category_slug` not present in live `public.categories`

Fix by creating/aligning taxonomy or Mezmur rows in CMS — do **not** invent UUIDs in CSV.

### STEP 6 — Apply import (ONLY after validation passes)

**Do not run this until you are ready.**

1. Open `supabase/mezmur-import/MEZMUR_APPLY_IMPORT.sql`
2. Run the script once to **create** `public.apply_mezmur_staging_import(boolean)`
3. Then explicitly execute:

```sql
begin;
select public.apply_mezmur_staging_import(false);
-- Inspect the jsonb result and table counts.
-- commit;   -- only if satisfied
-- rollback; -- if anything looks wrong
```

Safe mode (`false`):

- upserts collections + sections
- upserts section links
- inserts occasion links
- fills `mezmur.category_id` only when currently null
- does **not** update existing mezmur lyrics/titles/media
- does **not** insert new mezmur rows

Optional metadata mode (`true`) after editorial review:

```sql
select public.apply_mezmur_staging_import(true);
```

Notes:

- CSV form `wereb` is mapped to DB check value `werb`
- Category architecture reuses `public.categories` + `mezmur.category_id` (there is **no** `mezmur_category_links` permanent M2M table)
- Occasion architecture reuses `public.mezmur_occasions` + `public.mezmur_occasion_links`

---

## Permanent schema inventory (inspected from repo migrations)

### Present today (repo)

| Table | Role |
|---|---|
| `public.mezmur` | Canonical hymn rows (`slug` unique; `singer_id`, `category_id`; classification text fields; lyrics; media) |
| `public.singers` | Singer taxonomy (`slug` unique index when present) |
| `public.categories` | Category taxonomy (`slug` unique) |
| `public.tags` / `public.mezmur_tags` | Tag M2M |
| `public.mezmur_occasions` | Normalized occasions |
| `public.mezmur_occasion_links` | Mezmur ↔ occasion M2M |
| `public.hymn_browse_groups` / `hymn_browse_group_items` | Current browse draft — leave in place |

### Created by `20261002180000_hymn_collections_sections.sql` (not applied until you run it)

| Table | Role |
|---|---|
| `public.hymn_collections` | Level-1 browse cards |
| `public.hymn_sections` | Level-2 sections (`collection_id`, optional `parent_section_id`) |
| `public.mezmur_section_links` | Level-3 membership (`mezmur_id`, `section_id`, `sort_order`, `is_primary`) |

### Not present (do not invent)

| Name | Status |
|---|---|
| `public.mezmur_category_links` | **Does not exist.** Category links CSV fills `mezmur.category_id` |
| `mezmur_v2` / `new_mezmur` / permanent `mezmur_data` | **Do not create** as replacements |

---

## Package CSV integrity already checked offline

Within the generated CSV package (no live DB):

- 0 duplicate collection/section/mezmur slugs
- 0 empty required titles
- 0 broken collection/section/mezmur references inside the package
- 0 parent_section rows (parent column blank)
- Forms: 247 `mezmur`, 17 `wereb`
- Languages: 183 `amharic`, 81 `english`

Live unresolved references (missing production mezmur/category/occasion slugs) can only be confirmed after STEP 5 against your Supabase project.

---

## After apply — next phase (DOCUMENT ONLY — do not implement yet)

Frontend:

1. `/hymns` → `hymn_collections` / `hymn_collections_with_counts`
2. Collection page → `hymn_sections` / `hymn_sections_with_counts`
3. Section page → `mezmur_section_links` → `mezmur` via `get_hymns_for_section`
4. Keep `zemari-singers` on existing singers browse
5. Only later remove `hymn_browse_groups` runtime dependency

CMS:

1. Collections admin
2. Sections admin
3. Mezmur editor section multi-select
4. Singers / Classification remain on existing tables

Do **not** switch routes until apply + QA pass.

---

## What to run first / what not to run yet

### Run first

1. Backup
2. `20261002180000_hymn_collections_sections.sql` (when ready for permanent tables)
3. `MEZMUR_STAGING_SCHEMA.sql`
4. CSV imports (six files only)
5. `MEZMUR_IMPORT_VALIDATION.sql`

### Do NOT run yet (until validation `F_zero_required` is all zeros and you explicitly choose)

- `select public.apply_mezmur_staging_import(...)` production commit
- Frontend cutover
- Dropping browse-group tables
- Importing review CSVs
