# Prayer data dictionary

## Hierarchy

`prayer_collections` contains reusable prayer books. `prayer_sections` groups prayers within a collection. `prayers` contains the individual reading units. A prayer may have a null `section_id` when the source is a simple ordered sequence, as with Zewter Tselot.

## CSV files

### prayer-collections-supabase.csv

| Column | Database field | Meaning |
| --- | --- | --- |
| `slug` | `prayer_collections.slug` | Stable lowercase collection key. |
| `title` | `prayer_collections.title` | English or source-provided Latin-script title. |
| `title_amharic` | `prayer_collections.title_amharic` | Source-provided Amharic title. |
| `description` | `prayer_collections.description` | Existing collection description. |
| `sort_order` | `prayer_collections.sort_order` | Public display order. |
| `status` | `prayer_collections.status` | Editorial state; public pages use `published` only. |

### prayer-sections-supabase.csv

| Column | Database field | Meaning |
| --- | --- | --- |
| `collection_slug` | resolved to `prayer_sections.collection_id` | Import-only collection reference. |
| `slug` | `prayer_sections.slug` | Stable key within the collection. |
| `title` | `prayer_sections.title` | Section label. |
| `title_amharic` | `prayer_sections.title_amharic` | Source-provided Amharic section label when available. |
| `description` | `prayer_sections.description` | Existing section summary when available. |
| `sort_order` | `prayer_sections.sort_order` | Order within the collection. |
| `status` | `prayer_sections.status` | Editorial state. |

### prayers-supabase.csv

| Column | Database field | Meaning |
| --- | --- | --- |
| `slug` | `prayers.slug` | Stable globally unique prayer key. Psalm slugs are zero-padded. |
| `title` | `prayers.title` | English or source-provided Latin-script title. |
| `title_amharic` | `prayers.title_amharic` | Original source title in Amharic/Ethiopic script. |
| `text_amharic` | `prayers.text_amharic` | Original Amharic text, unchanged. |
| `text_english` | `prayers.text_english` | Original English text, unchanged. |
| `text_oromo` | `prayers.text_oromo` | Original Oromo text; blank when unavailable. |
| `collection_slug` | resolved to `prayers.collection_id` | Import-only collection reference. |
| `section_slug` | resolved to `prayers.section_id` | Import-only section reference; blank is allowed. |
| `sort_order` | `prayers.sort_order` | Stable sequence number. Psalm order equals Psalm number. |
| `status` | `prayers.status` | Editorial state. |

The migration leaves the existing CMS `body`, `body_amharic`, and `body_oromo` fields intact. The collection-backed Pray page uses the dedicated `text_english`, `text_amharic`, and `text_oromo` columns so the import CSV maps directly to the requested data model.

## Source normalization

- Wudase Mariam remains seven weekday prayers and seven weekday sections.
- Zewter Tselot remains one ordered ten-prayer sequence without artificial sections.
- Mezmure Dawit remains one collection with three range sections.
- Psalm arrays are joined with newline characters in their original order.
- Literal structural sentinels `NULL`, `None`, and `NaN` become blank fields.
- Prayer wording, punctuation, repeated lines, and Ethiopic Unicode are not rewritten.
- Psalm 15 and Psalm 147 are missing from every supplied Psalm source and are not fabricated. Psalm 35 has no English text in either available source.

## Import

Run `node scripts/import-prayers.mjs --dry-run` to validate the CSV files. After applying the SQL migration and creating `.env.import` with `SUPABASE_URL` and a non-empty `SUPABASE_SERVICE_ROLE_KEY` (or `SUPABASE_SECRET_KEY`), run `node scripts/import-prayers.mjs --apply`.

The importer writes `text_amharic` / `text_english` / `text_oromo` to match the live hierarchical `public.prayers` schema.
