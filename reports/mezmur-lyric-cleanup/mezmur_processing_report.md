# Mezmur lyric cleanup proposal

Source: C:\Users\eskew\Downloads\mezmur_data_import_rows (1).csv (read-only). This is an offline proposal; no database or publication action occurred.

| Measure | Count |
| --- | ---: |
| total | 2553 |
| eligible | 2531 |
| excluded | 22 |
| lyric rows changed | 471 |
| lyric edits | 931 |
| classification fields filled | 54 |
| blank categories filled | 42 |
| classified output rows | 1668 |
| unresolved category rows | 863 |
| unresolved occasion rows | 552 |
| suggested category differences | 851 |
| suggested occasion differences | 718 |
| low confidence rows | 807 |
| manual review rows | 1642 |
| transliteration mismatch rows | 48 |
| unchanged lyric rows | 2060 |
| remaining | 0 |

The existing published and editorial statuses, identifiers, rights, media, descriptions, and approval metadata are preserved. Classification is based on the existing multilingual lyric alias classifier. Vacant category/occasion fields are filled only on unapproved records with medium or high evidence. Existing classifications remain in the import proposal; different lyric-based suggestions are in the audit for human review. Whitespace and separator edits are logged with before and after text. No uncertain spelling was automatically changed. Transliteration alignment differences are flagged, not guessed. The classifier provides evidence-based proposals, not human theological or linguistic verification. Some category and occasion fields remain blank because the lyrics do not support an automatic assignment. Stanza boundaries were preserved where present; new semantic stanza breaks were not inferred automatically. Editorial review is required before any import, especially for published records and low-confidence classifications.
