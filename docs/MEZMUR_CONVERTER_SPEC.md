# Mezmur CSV converter specification

The CMS converter is the staff-only preview at `/admin/hymns/import`. It parses and validates source data in the browser. Uploading and previewing never writes to the database. Import is a separate, explicit action and always creates unpublished drafts (`status=draft`, `featured=false`). It never updates an existing CMS record.

## Accepted input

Encoding: UTF-8 or UTF-8 with BOM. Format: RFC 4180 CSV with one header row. Quoted commas, escaped double quotes, CRLF/LF records, and line breaks inside quoted lyric cells are supported.

Accepted layouts:

1. Canonical Mezmur CSV, with the columns below.
2. The legacy canonical layout, which omits `geez_lyrics` and `oromo_lyrics`.
3. The existing EOTC Media audit layout. Its recognized aliases include `source_id`, `title_am`, `title_en`, `transliteration`, `zemari_name`, `lyrics_am`, `theological_category`, `review_status`, and `review_notes`.

Canonical column order:

```text
id,amharic_title,transliteration_title,slug,description,amharic_lyrics,transliteration_lyrics,english_lyrics,geez_lyrics,oromo_lyrics,lyrics_status,youtube_url,thumbnail_url,image_alt_text,audio_url,language,form,category,primary_occasion,zemari,hymn_sections,additional_occasions,source_url,classification_confidence,review_required,status,featured
```

List fields (`hymn_sections`, `additional_occasions`) use `|` in canonical output. The importer also accepts `;` and `,` in those source fields. Stanza and paragraph breaks are retained verbatim.

Valid enums:

- `lyrics_status`: `available`, `missing`, `rights_review_required`
- `language`: `amharic`, `geez`, `english`, `oromo`, `tigrinya`, `bilingual`
- `form`: `mezmur`, `werb` (`wereb` is accepted as a source alias and canonicalized to `werb`)
- `status`: output/import is always `draft`
- `featured`: output/import is always `false`

Categories and occasions must be members of the project-owned canonical taxonomy. Hymn sections are checked against live CMS sections when available. Zemari names are matched only to existing Zemari records using exact stored names, Amharic names, or existing slugs; the converter does not invent transliterations.

## Validation and duplicate strategy

Required: at least one source title, a transliteration title for the current draft editor, a canonical slug, valid language/form/category values, and confidence from 0 through 1. Optional identifiers must be UUIDs. Media and source references must be absolute HTTP(S) URLs.

Within an upload, duplicate matching uses the first available stable identity in this order:

1. normalized source URL;
2. YouTube video ID;
3. exact slug;
4. NFC-normalized, punctuation-insensitive title plus normalized Zemari name.

Before import, the converter compares UUID, slug, source URL, YouTube URL, and normalized title/Zemari identities with `mezmur_data_import`. Any match is a conflict and is blocked. The check is repeated immediately before import to reduce race windows. Conflicts must be resolved editorially; no upsert or overwrite is attempted.

## Output and recovery

“Export All Staged CSV” preserves the working preview, including invalid rows. “Export Valid Canonical CSV” exports only import-ready records and automatically downloads a JSON exclusion report naming every omitted row and reason. Invalid records are therefore never silently dropped.

The original upload is retained separately from edited staging data for the browser session. Staff can download it or reprocess it after correcting CMS taxonomy/connectivity. For very large files that exceed browser storage quota, the original remains available while the page stays open.

Supported fields map to the real `mezmur_data_import` schema and its relationship services: multilingual titles/lyrics, media/source references, language/form, category, primary/additional occasions, Zemari, and hymn sections. A relationship failure is reported as a partial draft with an actionable message; it is never hidden and the row is not reported as a successful import.

The workflow does not fabricate lyrics, translations, citations, taxonomy, or attribution, and it does not consume generated enrichment datasets.
