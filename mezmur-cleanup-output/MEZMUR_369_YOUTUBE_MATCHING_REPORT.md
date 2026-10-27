# 369 Mezmur YouTube matching report

Date: 2026-10-27

## Scope and safety

The source was `mezmur_import_ready_without_youtube_CORRECTED.csv`. It contains 369 records and 25 columns. A byte-preserving source backup was created as `mezmur_import_ready_without_youtube_CORRECTED.csv.backup-20261027`.

No Supabase writes, schema changes, publishing, or changes to the existing 488 YouTube-linked records were made.

## Results

| Result | Count |
|---|---:|
| Source records searched/processed | 369 |
| Strong corroborated matches accepted | 1 |
| Possible candidates retained for review | 1 |
| Records still without a reliable link | 368 |
| Invalid or unavailable links accepted | 0 |
| Placeholder URLs generated | 0 |

The low accepted count is intentional. The available browser search could not access YouTube directly from the local runtime (`ERR_NETWORK_ACCESS_DENIED`), and no YouTube Data API credential was configured. Indexed search results were used only where they exposed enough title, channel, context, and lyrics evidence. Similar titles and Telegram/Scribd references were not treated as verified YouTube recordings.

## Accepted match

- `tsega-ne-ene` — `ጸጋ ነሣእነ`
  - [https://www.youtube.com/watch?v=Q2lWt4A_bT8](https://www.youtube.com/watch?v=Q2lWt4A_bT8)
  - Indexed title is an exact Amharic match.
  - Indexed metadata identifies an Ethiopian Orthodox Tewahedo song, Mahtot Tube, and Sister Fasika Mekonnen.
  - Indexed source context and the source record's title/lyrics corroborate the match.
  - Confidence: 96/100.

## Possible candidate not accepted

- `tsega-ne-ene` — `https://www.youtube.com/watch?v=8xcK5xX6F0s`, confidence 78.
  - The indexed result includes the hymn title but appears to be a multi-item/new-release post and does not establish that it is the same recording.
  - It remains in `mezmur_369_YOUTUBE_CANDIDATES.csv` for human review and was not added to the import file.

## Generated files

- `mezmur_369_WITH_youtube_FOUND.csv` — 1 record, exact 25-column source schema, UTF-8 BOM.
- `mezmur_369_STILL_NO_youtube.csv` — 368 records, exact 25-column source schema, UTF-8 BOM.
- `mezmur_369_YOUTUBE_CANDIDATES.csv` — 2 offline candidate rows with evidence and rejection status.
- `mezmur_import_ready_without_youtube_CORRECTED.csv.backup-20261027` — source backup.

The generator is `scripts/generate-369-youtube-results.mjs`. It preserves all source fields and only adds a URL for the explicitly corroborated slug.

## Validation

- Source count: 369.
- Final split: 1 + 368 = 369.
- Accepted URL uses an 11-character YouTube ID (`Q2lWt4A_bT8`).
- No original lyrics or metadata were rewritten except `youtube_url` in the one accepted output row.
- No production database or existing linked record was changed.

At least 15 representative accepted matches cannot be truthfully supplied from the available evidence: only one strong match was found and the runtime did not permit direct YouTube result verification. The remaining records are intentionally left blank rather than assigned by title similarity alone. A YouTube Data API key or an approved browser environment with YouTube access is required to continue the remaining searches safely.
