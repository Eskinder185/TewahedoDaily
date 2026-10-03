# Tewahedo Daily Bible source quality audit

## Scope and method

The read-only scanner `scripts/bible/auditCorpus.mjs` parsed all 83 Amharic JSON files and the WEB JSON file and visited every verse object: **42,139 Amharic + 31,103 WEB = 73,242**. `13-verse-scan-index.csv` contains one row per visited verse, including explicit label, array-derived source position, text hash, length, and signal count. The scan checked book mapping, chapter/section association, source order, labels, blanks, repeated labels/text, length outliers, Unicode decoding, literal escapes, Latin letters in Amharic, and punctuation clusters. It also compared chapter counts where editions map to the same canonical book; that comparison does not assert identical versification.

The exact pre-audit files are preserved in `original-snapshot/`. The scanner checks their SHA-256 hashes against the current source files before producing reports. No source JSON was changed. This is a whole-corpus **programmatic** audit with contextual review of flagged patterns; it is not a human proofread of all 73,242 words or an independent source verification of every verse.

## Results

| Measure | Result |
| --- | ---: |
| Source files | 83 Amharic; 1 WEB |
| Chapters / real Amharic sections | 2,711 / 2,796 |
| Verse objects audited and retained | 73,242 |
| Signals / distinct flagged positions | 423 / 419 |
| Signal rows classified REVIEW_ONLY / NO_ISSUE | 415 / 8 |
| SAFE_AUTO_FIX / SOURCE_VERIFIED_FIX | 0 / 0 |
| Verse objects added / removed | 0 / 0 |
| Blank texts before / after | 17 Amharic + 5 WEB / unchanged |
| Repeated explicit Amharic labels before / after | 18 / 18, all in Psalm 9 |
| Numbering jumps before / after | 129 / 129, all Amharic |
| Chapter starts above label 1 | 2 Amharic chapters |
| Text repeat signals | 192 nonadjacent, 1 adjacent |
| Latin-letter signals in Amharic | 33 verses |
| Punctuation-cluster signals | 4 (1 Amharic review; 3 ordinary WEB ellipses) |
| Replacement character / unpaired surrogate / control / null / literal-escape signals | 0 |
| Chapter or section structure fixes | 0 |

All counts are **signal counts**, not adjudicated error counts. A verse may have multiple signals. The five empty WEB locations and three ordinary WEB ellipses account for the eight `NO_ISSUE` signal rows. The 415 remaining rows are review signals, not 415 proven defects.

## Highest-priority editorial review

1. **Clement 6:83–86 and 9:18–20:** 6:83 contains a single character; 6:84 has mixed Ethiopic/Latin and damaged punctuation; 6:86 and 9:18–20 are blank. Neighboring prose confirms a concerning cluster, but no trustworthy copy of the *same transcription* was established. Preserve the labels and text until an editor checks the source.
2. **Didascalia 33:152–157 and 226–232:** thirteen consecutive blank verse objects in two spans. The surrounding verses are present. Do not fill from a different edition.
3. **Amharic Latin intrusions:** 33 verse objects contain ASCII letters embedded in Amharic text, including recurring `Wa` in Enoch. They look like transcription/OCR contamination; exact Ethiopic replacements require source verification. See `08-unicode-script-report.csv`.
4. **Numbering:** Psalm 9 has 18 repeated explicit labels and a descent; 129 gap jumps and two starts above 1 occur elsewhere in the Amharic files. Some gaps are large and may reflect missing source material, while others may reflect traditional division. No label was inferred or changed. See `05-verse-numbering-report.csv`.
5. **Repeated text:** most matches are formulaic phrases in Numbers, Leviticus, Ezekiel, and Psalms. Song of Songs 6:12–13 is the one adjacent identical text pair. An external Amharic 81-book edition also repeats the opening phrase, but the repository does not establish that it is the same source or that the current short verse text is complete. Leave unchanged pending source review.
6. **Empty sections:** Amharic source section 1 in Lamentations 4, Ezekiel 17, and Daniel 14 has no verse object. Section titles and source section structure were preserved.
7. **Cross-edition structure:** WEB Proverbs has 31 chapters while Amharic Proverbs has 24 plus seven separately mapped Tegsats chapters. Esther, Jeremiah collection, and Daniel also have chapter-count differences. These are mapping review signals, not grounds to force alignment. See `09-cross-edition-review.csv`.

## WEB blank locations

The official [WEB Classic Luke 17](https://ebible.org/eng-web/LUK17.htm), [Acts 8](https://ebible.org/eng-web/ACT08.htm), [Acts 15](https://ebible.org/eng-web/ACT15.htm), [Acts 24](https://ebible.org/eng-web/ACT24.htm), and [Romans 16](https://ebible.org/eng-web/ROM16.htm) display the corresponding verse locations as textual-variant markers rather than main-text wording. These five empty JSON slots were therefore classified `NO_ISSUE` for this audit and were not filled. The repository labels its WEB module as 2006; the linked online pages are the currently published WEB Classic and do not establish byte-for-byte identity with the old module.

## Verification and limits

`node scripts/bible/validate.mjs` exited 0 with 83 Amharic files, 1,522 Amharic chapters, 2,796 sections, 42,139 Amharic verses, 66 WEB source books, 31,103 WEB verses, 74 represented of 81 canonical books, and no errors. It retains warnings about 18 labels, 22 blanks, and Proverbs/Tegsats alignment.

`node scripts/bible/import.mjs --dry-run` exited 0 with the same corpus counts and explicitly reported that no database calls were made. No migration, import, SQL export, CSV export, publish, push, or deploy was performed.

Amharic files do not include a provenance field identifying a precise edition or upstream transcription. [EOTC Open Source Store](https://github.com/EOTCOpenSource/store) was inspected as a possible provenance lead; its current repository contains lectionary and prayer datasets, not these Bible JSON files. [YouVersion's Amharic 2000 Song of Songs 6](https://www.bible.com/am/bible/3200/SNG.6.%E1%8A%A0%E1%88%9B2000) was used only as a comparison signal. It was **not** used to rewrite scripture. Automated outlier checks cannot guarantee detection of subtle transcription, theology, or OCR errors, so unresolved entries need an edition-identified human comparison before publication.

## Exports

The source JSON and its hashes are unchanged, so the existing `artifacts/bible-csv` and `artifacts/bible-import` exports do **not** need regeneration as a result of this audit. Rebuild them after any later source correction, before importing that correction.
