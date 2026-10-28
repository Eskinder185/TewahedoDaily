# Mezmur data-quality review

**Source:** production table export `mezmur_data_import_rows.csv` (2,316 rows, exported 2026-10-27)
**Tool:** `npm run audit:mezmur-data-quality -- <export.csv>` (`scripts/audit-mezmur-data-quality.ts`)
**Changes made to data:** none. This report only proposes corrections.

Every finding is keyed by **`import_id`**, the immutable, unique identifier present in all 2,316 rows. `mezmur_id` is included where it exists; it is blank in 1,364 rows of this export.

| File | Contents |
|---|---|
| `mezmur_data_quality_issues.csv` | One row per (Mezmur, issue): `import_id`, `mezmur_id`, slug, title, status, issue, severity, evidence, suggested action |
| `mezmur_language_verification.csv` | Language evidence for all 2,316 rows: label, detected language, verdict, per-language scores, the marker words found |
| `data_quality_summary.json` | Counts |

## Summary

2,098 of 2,316 rows have at least one finding. Almost all findings are low-severity formatting issues.

| Issue | Rows | Severity | Suggested action |
|---|---:|---|---|
| Missing lyrics | 5 | high (all published) | Add lyrics from a verified source, or keep the record media-only |
| Corrupted text | 11 | 1 high, 10 medium | Re-import from the original source |
| Incorrect language label | 177 | 172 medium, 5 low | Confirm with a reader, then correct `primary_language` |
| Insufficient lyrics (under 3 lines or under 60 characters) | 429 | medium | Check for truncation or a split hymn |
| Scan / OCR errors | 420 | 77 medium, 343 low | Proof-read against the source booklet |
| Transliteration unreadable | 757 | 22 medium, 735 low | Regenerate from `lyrics_amharic` |
| Transliteration missing | 123 | low | Generate one |
| Generated "VERSE n" / "CHORUS" labels inside lyrics | 1,576 | low | Remove the labels (they are not sung), or move them to display markup |
| Amharic translation lines (ትርጉም፡-) mixed into the sung text | 44 | low | Move to a separate field, or confirm they belong |

## Language verification

Each row's sung text (`lyrics_amharic` + `lyrics_geez`, or the Latin lyrics when there is no Ethiopic text) was scored against marker words for each language. Translations are scored separately.

| Language | Markers used |
|---|---|
| Tigrinya | ኣብ ናይ ናብ ንሱ እቲ ኣነ ካብ ኢኻ ኢና እዩ ብዘይ ጎይታይ ንዓኻ …, plus ቐ-row letters |
| Amharic | ነው ናቸው ነበር ሆይ እንዴት ጌታ ወደ ላይ ውስጥ …, plus endings such as -ችን -ኛል -ለሁ -ዋል |
| Ge'ez | ውእቱ ለነ ኀበ እግዚኦ ይትባረክ እስመ ዮም … |
| Afaan Oromo | Waaqayyo gooftaa kan fi isaa ani hin …, and Ethiopic-script Oromo (ፈኖ ዋቀዮ ኬኛ …) |
| English | English function words |

Ge'ez and Amharic are treated as compatible labels, because Amharic hymns routinely quote Ge'ez.

| Verdict | Rows |
|---|---:|
| Label confirmed | 1,444 |
| Not enough marker words to decide (mostly short Amharic hymns) | 672 |
| Bilingual / mixed (e.g. Amharic lyrics plus a full English translation, or Latin-script Amharic) | 23 |
| **Mismatch confirmed** | **172** |
| **Mismatch likely** | **5** |

| Label → detected | Rows | What it means |
|---|---:|---|
| amharic → **tigrinya** | 129 | Tigrinya hymns labelled Amharic |
| english → tigrinya | 3 | Tigrinya hymns labelled English |
| geez → tigrinya | 1 | Tigrinya hymn labelled Ge'ez |
| english → **oromo** | 5 | Afaan Oromo (Latin script) labelled English |
| amharic → oromo | 1 | Ethiopic-script Afaan Oromo labelled Amharic (`kuni-fenoni-gadisada-qorchada-2`) |
| amharic → english | 23 | English lyrics stored in `lyrics_amharic` (e.g. "CHORUS Our Heavenly Father…") |
| english → amharic | 15 | Labelled English, but the only lyrics are Amharic |

### How the language results were checked

- **Tigrinya: 133 detected.** The first version of the detector over-counted. Ge'ez hymns ("ቤዛ ኩሉ ዓለም ዮም ተወልደ") matched because ኩሉ is shared, and Amharic written with the ኣ spelling ("ያላንተ ጌታ ደስታ መች ኣለ", "ኣለኝ ውዳሴ … እዘምራለው") matched on ኣ alone. Both causes were fixed. Afterwards I read the 14 lowest-scoring detections and 8 random ones; all 22 are Tigrinya. The earlier estimate of 105 came from the de-duplicated 2,092-song set using a cruder rule; 133 is the figure for all 2,316 production rows.
- **Afaan Oromo: 9 detected, all 9 read and confirmed.** 6 are mislabelled: 5 labelled English, 1 labelled Amharic. The other 3 are already labelled `om` / `oromo`. The earlier estimate was 7.

| `import_id` | `mezmur_id` | Slug | Label | Detected |
|---|---|---|---|---|
| 272a06cf-7587-4c5e-ae28-fb65fc0768bc | — | itti-hin-leeyya-u-angafa-faarfattootaa-d | english | Oromo (Latin) |
| 4d9970a4-f301-48e2-8c2f-9b3790e3fb93 | — | kiristos-waaqako-zemarit-fasika-mekonnen | english | Oromo (Latin) |
| 9fc81bfc-4a65-4ec3-b480-e10a6cc2340b | — | simalee-hin-jiraadhu | english | Oromo (Latin) |
| b51d1863-7116-4390-8d12-99363c7c6d11 | — | faarsaa-cuuphaa-best-afaan-oromoo-orthod… | english | Oromo (Latin) |
| e6ba045e-fcfa-4ee9-8a98-5055cbe72a45 | — | bakkattan-deebisa | english | Oromo (Latin) |
| 69585d94-319c-4c13-bb79-e69b64c37621 | 42044b75-6320-44a1-9745-39eb7c27fcc8 | kuni-fenoni-gadisada-qorchada-2 | amharic | Oromo (Ethiopic script) |

**Recommendation:** have a Tigrinya reader and an Oromo reader confirm each row in `mezmur_language_verification.csv` (filter `verdict` = `mismatch_*`). Only then update `primary_language`. For Oromo, the text could also be moved to `lyrics_oromo`, which is empty in every row. Labels were not changed.

## Corrupted text (11)

| Kind | Rows | Example |
|---|---:|---|
| Unicode replacement characters (�) where Ethiopic letters were lost | 10 | `mariyam-nitsihit`: "ሰ��ሊለነ" (should read ሰአሊለነ) |
| Lyrics replaced by Arabic-script text | 1 (high) | `alemamenen-eridaw-getaye`: 184 Arabic-script characters |

All 11 are published.

## Missing lyrics (5, all published)

`mudaye-mena`, `nu-beegziaber-des-yibelen`, `adergehlegnal-ena-amesegnalew`, `titnash-gerum-new`, `silassen-amesgnu`. Their `import_id`s are in the issues file.

## Scan / OCR errors (420)

| Pattern | Rows |
|---|---:|
| Booklet hymn/line numbers in the text ("265.", "70.") | 212 |
| አግዚአብሔር for እግዚአብሔር | 92 |
| Stray ‹ › « » | 75 |
| Corrupted repeat markers (/ቄ, /ሪ) | 67 |
| አንደ for እንደ (whole word only) | 51 |
| Digits inside Ethiopic words | 43 |
| አመቤ… for እመቤ… | 38 |
| ብርፃን for ብርሃን | 17 |
| አኔ for እኔ | 13 |

The checks are deliberately narrow. For example, አንደበት ("tongue") is not flagged.

## Unreadable transliterations (757)

Mostly non-ASCII phonetic letters (ä ə č ñ ṭ…) left from an older transliteration style. 22 also contain Ethiopic characters, or cover less than a third of the lyric lines. The project standard (`MEZMUR_TRANSLITERATION_STANDARD.md`) and the plain-English-letters transliterator used earlier can regenerate them.
