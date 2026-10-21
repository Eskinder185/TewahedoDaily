# Book catalog and inspection findings

Date: 2026-10-18. Package version: `editorially-complete-drafts-v3`.

| ID | Title | Source records | Reading paragraphs | Sections | Languages | Approval |
| --- | --- | ---: | ---: | ---: | --- | --- |
| F01 | The Faith and Order of the Church | 834 | 482 | 17 | English source and edited English reading | Held |
| S01 | The Seven Sacraments of the Church | 621 | 589 | 9 | English reading; Amharic with Geʽez source | Held |
| E01 | Church History in Ethiopia | 673 | 669 | 11 | English reading; Amharic with Geʽez source | Held |
| M01 | The Gospel of Matthew — Andemta Commentary | 741 | 740 | 8 | English reading; Amharic with Geʽez source | Held |
| W01 | Church History on the World Stage | 529 | 523 | 10 | English reading; Amharic with Geʽez source | Held |

There are 3,398 source records: 3,048 nonblank and 350 blank layout records.
There are 3,003 reading paragraphs and 55 editorial sections. Every nonblank
source ID is accounted for exactly once in reading alignment, including explicit
merges. Source IDs are retained verbatim; F01 uses the `F01W-` paragraph/section
prefix, despite its catalog document ID being `F01`.

The read-only audit verifies all five original DOCX hashes and full body XML
paragraph text against the archive. It also verifies the three immutable
archive/reference exports, all 70 manifest-listed files plus the manifest itself,
and every ZIP member byte. All 43 JSON/JSONL files parse. All book JSON/JSONL,
bilingual originals, reference excerpts, ordered sections and aggregate exports
agree. All five Markdown/plain-text editions were read and checked for reading
text/anchors. Original files and package text were not edited.

Reference IDs generally point into F01; `S01-P0208` also legitimately cites
`S01-P0237`. Validation preserves this cross-passage evidence rather than assuming
every reference ID must have an F01 prefix. Bilingual rows carry exact reference
excerpts and exact archived source records.

M01 contains only the supplied introduction and chapters 1–5. It preserves all
52 table-cell positions, including five empty source cells. Those empty positions
remain provenance; no translated teaching is fabricated for them. E01/W01
historical claims and inherited source annotations remain attributed source
material, not independently certified Church doctrine. The received W01 chapter
labels are preserved, including their discontinuities.

There are 33 separate reference supplement records and three inline reference
explanations. The ingestion representation splits all 36 explanations from
original sources and translations. It generates 6,054 deterministic candidate
UUIDs: 3,048 original-source passages, 2,489 translation segments, 481 edited
English-reference segments and 36 explanations. Language routing is 3,507
English and 2,547 Amharic-source variants. These are candidate counts, not
approved records or indexed points.

All governing catalog, book metadata and reading-paragraph ingestion flags remain
false. All five metadata `final_human_approval` flags remain false. No issue-free
paragraph is assumed approved merely because it has no individual review flag.
The package's structural QA passed; its theological/linguistic certification is
still pending.

The unresolved queue contains 828 issue records: 352 language-review holds, 191
theological-review holds and 285 available-source-evidence holds. Five whole-book
sign-offs bring the human queue to 833 entries. Issues may overlap passages;
these are neither counts of distinct missing pages nor 833 distinct doctrines.
All 940 inherited flags have dispositions. The reference change log preserves
335 historical operations and links them to final reading revisions.

No original PDF pagination has been certified. Reliable citations use book,
section, stable paragraph/source IDs, DOCX paragraph/table coordinates and hashes.
`VALIDATION_REPORT.json` records the audit evidence; the original package's
`QA_Report.json` and `FINAL_COMPLETION_REPORT.md` remain unchanged.
