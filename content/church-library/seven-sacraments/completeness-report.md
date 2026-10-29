# Seven Sacraments — completeness report

Validation: **PASSED** (15/15 automated checks).
This does not mean the original book is complete. See "Known gaps in the source" below.

## Sources

- **am** `sources/am-original.txt`
  - sha256 `ad71f4d22cba226b…`
  - 739 non-empty lines
- **en** `sources/en-verified.md`
  - sha256 `ad9befe1462e26b0…`
  - 78 non-empty lines
- Page numbers: **not available** — The source carries no page numbers; its annex states that its line numbers are not page numbers.

## How every Amharic source line was handled

| Disposition | Lines |
|---|---:|
| Source table of contents (rebuilt from headings; kept in review/) | 80 |
| Content paragraphs (verbatim) | 556 |
| Lines that held only an editorial review marker (recorded in the manifest) | 6 |
| Headings (verbatim) | 78 |
| Unreadable-source annex (kept in review/, not publishable) | 19 |

## Counts per chapter

| ID | Amharic sections | Amharic ¶ | Amharic refs | English sections | English ¶ | English refs |
|---|---:|---:|---:|---:|---:|---:|
| SS-000 | 6 | 54 | 7 | 1 | 9 | 1 |
| SS-001 | 11 | 101 | 77 | 2 | 17 | 23 |
| SS-002 | 8 | 36 | 32 | 1 | 2 | 5 |
| SS-003 | 11 | 85 | 43 | 1 | 2 | 5 |
| SS-004 | 10 | 65 | 58 | 1 | 4 | 8 |
| SS-005 | 10 | 89 | 41 | 4 | 16 | 10 |
| SS-006 | 14 | 102 | 51 | 1 | 13 | 8 |
| SS-007 | 8 | 22 | 5 | 1 | 3 | 2 |
| SS-008 | 1 | 2 | 0 | 0 | 0 | 0 |
| **Total** | 80 | 556 | 314 | 12 | 66 | 62 |

"refs" counts scripture locators (chapter፥verse or chapter:verse). The same counts were taken from the sources and the output, and they match.

## Automated checks

- ✅ Amharic: every content line is present verbatim (review markers removed) — 556 content lines checked; missing: []
- ✅ Amharic: every non-empty source line is accounted for — 739 lines; dispositions: {'table_of_contents': 80, 'content': 556, 'review_marker_line': 6, 'heading': 78, 'unreadable_source_annex': 19}
- ✅ Amharic: no paragraph duplicated or dropped (multiset equality)
- ✅ Amharic: biblical reference locators unchanged — 314 in source, 314 in output
- ✅ Amharic: every contents heading is present as a heading — 78 headings (+ the annex entry, kept out of the publishable files)
- ✅ Amharic: every review marker is recorded in the manifest — 153 in source, 153 recorded
- ✅ Amharic: all seven sacrament chapters present
- ✅ Amharic: chapter order follows the source
- ✅ Publishable Amharic files contain no review markers
- ✅ English: every passage present verbatim (formatting artifacts only) — missing lines: []
- ✅ English: biblical reference locators unchanged — 62 in source, 62 in output
- ✅ English: all seven sacrament headings present — Baptism (ሚስጥረ ጥምቀት), Confirmation (Myron) (ሚስጥረ ሜሮን), Holy Communion (ሚስጥረ ቁርባን), Ordination (ሚስጥረ ክህነት), Holy Matrimony (ሚስጥረተክሊል), Mystery of Penance (ሚስጥረ ንስሀ), Unction of the Sick (ሚስጥረ ቀንዲል)
- ✅ IDs unique within each language
- ✅ No paragraph ID shared between languages (no unverified alignment)
- ✅ Publishable English files contain no HTML entities

## What was removed from publishable text (and where it went)

- **148 inline editorial review markers** (〔ለግምገማ፦ ቤ-NN〕):
  - They point to a separate editorial report that was not supplied.
  - Each one is stored against its paragraph ID in `manifest.json` (`review_markers`).
- **6 lines that held only a marker:**
  - 2 are in the front matter: the first review note, and the note pointing to annex ቤ-ግ01.
  - 4 are in the body, including the incomplete-phrase note 〔ያልተሟላው ሐረግ፦ አባሪ ቤ-ግ05።〕.
  - They are recorded on the neighbouring paragraph (`amharic_gaps` / `review_markers`).
- **Source table of contents** (80 lines):
  - It is kept verbatim in `review/source-table-of-contents-am.md`.
  - The reader builds its navigation from the headings, which are all present.
- **Unreadable-source annex** (19 lines, fragments ቤ-ግ01–ቤ-ግ05 with their notes):
  - It is kept verbatim in `review/am-unreadable-source-annex.md`, marked not publishable.
  - Its fragments are damaged source text that was deliberately not reconstructed.
- **English:** 1 formatting artifact fixed. HTML entities `&#x20;`/`&#x73;` had split a bold run:
  - line 159: `…between close family relations. (Lev. 18:6-21; Deut. 7:3-4).` → `…between close family relations. (Lev. 18:6-21; Deut. 7:3-4).`

No wording, spelling, scripture reference or numbering was changed. That includes places that look like typing slips in either source; correcting those needs a reviewer.

## Known gaps in the source (coverage is NOT complete)

- The Amharic source itself marks **5 unreadable or incomplete fragments** (annex ቤ-ግ01–ቤ-ግ05):
  - an illegible preparer line;
  - a disordered Melchizedek passage;
  - an illegible phrase;
  - two garbled thanksgiving points;
  - an unfinished phrase after the washing of the feet.
  - These are not repaired; affected paragraphs are listed under `amharic_gaps` in the manifest.
- Original page numbers are unavailable, so citations use section and paragraph IDs only.
- The 153 editorial review markers cite an editorial report (ቤ-01 … ቤ-36) that is not in the repository. Those review points cannot be checked from here.
- English/Amharic alignment is chapter-level only (see `alignment-report.md`).
