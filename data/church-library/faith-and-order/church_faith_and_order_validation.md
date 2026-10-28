# Faith and Order — extraction & completeness validation

Source: `The Faith And Order Of The Church (2)(4).docx` · sha256 `2e3bdda29772507a2ebbe21714a2170a7be9a7391b518cc5036a986aab36b37e`  
Result: **21/21 checks passed** · 47 passages · 16 chapters · 51 pages · 215 Scripture references

## Automated checks

| # | Check | Result | Detail |
|---|---|---|---|
| 1 | JSONL is valid UTF-8 (no BOM) | PASS | 186,578 bytes |
| 2 | Every JSONL line is one valid JSON object | PASS | 47 lines |
| 3 | Required fields present with correct types | PASS | all 47 records |
| 4 | Passage IDs unique | PASS | 47 unique |
| 5 | Passage IDs stable format faith-and-order-NNNN | PASS |  |
| 6 | passage_order contiguous 1..N in file order | PASS |  |
| 7 | All body paragraphs present, in original order, none duplicated | PASS | 466 paragraphs (after re-joining page-split sentences) |
| 8 | Every non-empty source paragraph's exact text is found in a passage | PASS | 484 body paragraphs checked |
| 9 | Word count reconciles (source = passages + chapter headings + title) | PASS | 19518 = 19436 + 82 |
| 10 | All 16 chapter headings represented | PASS | 16 chapters |
| 11 | No passage mixes chapters | PASS |  |
| 12 | Page numbers derived from section breaks only, within 1..51, start <= end | PASS | max page 51 |
| 13 | Scripture references preserved (same multiset as source) | PASS | 215 references |
| 14 | Passage sizes near 300-600 words | PASS | min 134, max 637, mean 414; 41/47 within 250-650 |
| 15 | No Amharic/generated alias text inside passage content | PASS |  |
| 16 | Five Pillars of Mystery aliases never attached to Seven Sacrament chapters | PASS | [] |
| 17 | Seven Sacraments aliases never attached to the Five Mysteries chapters | PASS | [] |
| 18 | CSV row count equals JSONL | PASS | 47 rows |
| 19 | CSV columns are live church_library_passages columns (+ section_order join key) | PASS | book_id, version_id, section_order, passage_order, language, content, page_start, page_end, chapter_reference, locator_label, extraction_confidence, review_status |
| 20 | CSV content identical to JSONL content | PASS |  |
| 21 | CSV book_id/version_id left for the import tool to resolve (never guessed) | PASS |  |

## How completeness was proven
The DOCX was re-read independently and its body paragraphs were rebuilt into the expected sequence (headings removed, page-split sentences re-joined). Splitting every passage back on its paragraph separators reproduces that sequence exactly, so nothing was dropped, duplicated, or reordered. The word counts reconcile to the word (source words = passage words + heading/title words).

## Document structure

| # | Chapter | Starts p. | Passages |
|---|---|---|---|
| 1 | Introduction | 1 | 1 |
| 2 | The Mystery of the Holy Trinity | 1 | 2 |
| 3 | The Mystery of Incarnation | 3 | 3 |
| 4 | The Mystery of Baptism | 7 | 1 |
| 5 | The Mystery of the Holy Communion; what is Holy Communion? | 8 | 2 |
| 6 | The Mystery of Resurrection | 9 | 1 |
| 7 | Human Salvation | 10 | 2 |
| 8 | A Word in Conclusion | 13 | 1 |
| 9 | Introduction to Church Sacraments | 13 | 3 |
| 10 | The Sacrament of Baptism | 16 | 5 |
| 11 | The Sacrament of Confirmation | 21 | 2 |
| 12 | The Sacrament of Penance | 24 | 4 |
| 13 | The Sacrament of the Holy Communion | 28 | 10 |
| 14 | The Sacrament of the Unction of the Sick | 40 | 2 |
| 15 | The Sacrament of Matrimony | 42 | 3 |
| 16 | The Sacrament of the Holy Orders | 45 | 5 |

Sub-section titles inside the sacrament chapters (Definition, Institution of the Sacrament, The Visible Sign, The Invisible Grace, …) are carried in each passage's `section` field. Passages in the first eight chapters have `section: null` unless the source itself has a sub-title there; no section names were invented.

## Page numbers
The file has 51 sections, each starting with a rendered page break, and no section contains a second break. Section *n* is therefore page *n* of this file's own layout. These page numbers are reliable for this DOCX, but they are not the page numbers of any separately printed edition. There are no printed page numbers, headers or footers in the file (all 51 are empty), so nothing had to be stripped.

## Repairs applied (formatting only)

| Paragraphs re-joined | Pages | Start of joined text |
|---|---|---|
| 23, 25 | 2–3 | The Father is different from the Son and the Holy Spirit only in that He alone is Father. … |
| 29, 30 | 3 | If we may put the emphasis in our words, the term “Father” with reference to God signifies… |
| 45, 46 | 4 | God who created the world made man as the crown of creation. Made in God’s image and endow… |
| 84, 86 | 7–8 | In accordance with such writings of the Holy Scriptures, the Ethiopian Orthodox Tewahedo C… |
| 96, 98 | 8–9 | The Preparation and Presentation of the Holy Communion is in the form of bread and wine; i… |
| 127, 129 | 11–12 | Salvation is a present experience consisting in man’s complete confidence and communion wi… |
| 170, 172 | 14–15 | The writings of the fathers in the early centuries make it clear that they are seven. Alth… |
| 315, 316 | 22 | The Bible declares that some babies were filled with the Holy Ghost even from their mother… |
| 337, 339 | 23–24 | When anointing David as King of Israel he was said to have been given the gift of the Holy… |
| 355, 357 | 24–25 | When, after resurrection, He showed them their great commission to the world. “As my Fathe… |
| 459, 461 | 30–31 | This shows that on Thursday the feast has not yet begun; because one has to buy things for… |
| 471, 473 | 31–32 | And Adam Clarke, in his commentary, states : “As the feast of unleavened bread did not beg… |
| 521, 523 | 34–35 | Then He repeats the same words used by the Savior when He instituted the sacrament. “For I… |
| 614, 615, 616, 618, 619 | 40 | The difference between this sacrament and that of penance is that the latter is administer… |
| 770, 772 | 47–48 | The ordained minister is given a divine gift appropriate to the service to which he is cal… |

Also: runs of spaces/tabs collapsed; two empty Heading-1 paragraphs (layout artifacts) ignored; ALL-CAPS chapter headings shown in title case in `chapter` (original kept in `chapter_source_heading`). **No word of content was changed.**

## Flagged source issues — not corrected (65 flags in 34 passages)

These look like OCR/typing errors or reference slips in the source. They are recorded in each passage's `quality_flags`, and the import marks those passages `review_status = needs_attention` so a reviewer can confirm them in the passage editor. The text was left as-is.

| Passage | Source text | Note |
|---|---|---|
| faith-and-order-0002 | `, eternally Son` | Paragraph begins mid-sentence; preceding words appear to be missing from the source DOCX. |
| faith-and-order-0002 | `neither convinced in the sense` | 'convinced' may be an error for 'conceived'. |
| faith-and-order-0006 | `one Chris dynamically` | 'Chris' is likely 'Christ'. |
| faith-and-order-0007 | `(Mk. 16:6)` | Quoted verse is Mark 16:16; reference reads 16:6. |
| faith-and-order-0007 | `Rome 6` | 'Rome' used as abbreviation for Romans. |
| faith-and-order-0008 | `reveille strange thoughts` | 'reveille' is unclear (possibly 'repel' or 'reveal'). |
| faith-and-order-0009 | `take, cat;` | 'cat' is likely 'eat'. |
| faith-and-order-0010 | `all who are in the combs` | 'combs' is likely 'tombs' (John 5:28). |
| faith-and-order-0010 | `widow at Nail` | 'Nail' is likely 'Nain' (Luke 7:11). |
| faith-and-order-0013 | `nyatural` | 'nyatural' is likely 'natural'. |
| faith-and-order-0013 | `book if life` | 'if' is likely 'of'. |
| faith-and-order-0013 | `though Jesus Christ our Lord, though whom` | 'though' is likely 'through'. |
| faith-and-order-0015 | `function of the sick` | 'function' is likely 'unction'. |
| faith-and-order-0016 | `grants the race through` | 'race' is likely 'grace'. |
| faith-and-order-0018 | `Per, Can any man` | 'Per' is likely 'Peter' (Acts 10:47). |
| faith-and-order-0020 | `the deeper of the prison` | 'deeper' is likely 'keeper' (Acts 16:33). |
| faith-and-order-0020 | `Rome 6` | 'Rome' used as abbreviation for Romans. |
| faith-and-order-0020 | `Rome 4` | 'Rome' used as abbreviation for Romans. |
| faith-and-order-0022 | `function of the holy oil` | 'function' is likely 'unction'. |
| faith-and-order-0022 | `mairon` | 'mairon' likely means myron (holy chrism). |
| faith-and-order-0024 | `meditation of the priest` | 'meditation' is likely 'mediation'. |
| faith-and-order-0025 | `audible sings` | 'sings' is likely 'signs'. |
| faith-and-order-0026 | `not only to lose` | 'lose' is likely 'loose' (Matt. 16:19). |
| faith-and-order-0026 | `Corinthe` | 'Corinthe' is likely 'Corinth'. |
| faith-and-order-0026 | `spirit may be save in` | 'save' is likely 'saved'. |
| faith-and-order-0027 | `ask too fast` | 'too fast' is likely 'to fast'. |
| faith-and-order-0027 | `examine very sin` | 'very' is likely 'every'. |
| faith-and-order-0027 | `filled with puss` | 'puss' is likely 'pus'. |
| faith-and-order-0027 | `Rome 3` | 'Rome' used as abbreviation for Romans. |
| faith-and-order-0028 | `crowing service` | 'crowing' is likely 'crowning'. |
| faith-and-order-0028 | `brought froth bread` | 'froth' is likely 'forth' (Gen. 14:18). |
| faith-and-order-0028 | `grivet you` | 'grivet' is likely 'giveth' (John 6:32). |
| faith-and-order-0028 | `he that eaten of this bread` | 'eaten' is likely 'eateth'. |
| faith-and-order-0029 | `supped, saving` | 'saving' is likely 'saying'. |
| faith-and-order-0029 | `after having hands on Jesus` | Likely 'after laying hands on Jesus'. |
| faith-and-order-0029 | `from Caliphs` | 'Caliphs' is likely 'Caiaphas' (John 18:28). |
| faith-and-order-0029 | `saying be brought Jesus` | 'be' is likely 'he' (John 19:13). |
| faith-and-order-0030 | `Them said Jesus` | 'Them' is likely 'Then' (John 13:27). |
| faith-and-order-0030 | `Chryksostom` | 'Chryksostom' is likely 'Chrysostom'. |
| faith-and-order-0031 | `which is the shade for many` | 'shade' is likely 'shed'. |
| faith-and-order-0031 | `Lord’s side (John 19: 32)` | Blood and water from the side is John 19:34; reference reads 19:32. |
| faith-and-order-0032 | `Whose eateth` | 'Whose' is likely 'Whoso'. |
| faith-and-order-0032 | `Matt: 26: 27,18` | Reference likely 'Matt. 26:27,28'. |
| faith-and-order-0033 | `Whose eateth` | 'Whose' is likely 'Whoso'. |
| faith-and-order-0033 | `he have not life` | 'he' is likely 'ye' (John 6:53). |
| faith-and-order-0034 | `(John 16: 26)` | Quoted verse is John 16:29; reference reads 16:26. |
| faith-and-order-0035 | `the He remaineth` | 'the' is likely 'that'. |
| faith-and-order-0035 | `Irenacus` | 'Irenacus' is likely 'Irenaeus'. |
| faith-and-order-0036 | `Irenacus` | 'Irenacus' is likely 'Irenaeus'. |
| faith-and-order-0036 | `(Mall. 1: 11)` | 'Mall.' is likely 'Mal.' (Malachi). |
| faith-and-order-0038 | `Function of the sick` | 'function' is likely 'unction'. |
| faith-and-order-0039 | `given 10 priests` | '10' is likely 'to'. |
| faith-and-order-0040 | `By His reaching` | 'reaching' is likely 'teaching'. |
| faith-and-order-0040 | `thay twain` | 'thay' is likely 'the'. |
| faith-and-order-0040 | `lt not man` | 'lt' is likely 'let'. |
| faith-and-order-0040 | `some church fathers` | List item begins lower-case; a leading word or numbering may be missing. |
| faith-and-order-0040 | `discriminately` | Possibly 'indiscriminately' intended. |
| faith-and-order-0041 | `unmarried and windows` | 'windows' is likely 'widows' (1 Cor. 7:8). |
| faith-and-order-0041 | `better to marry an to burn` | 'an' is likely 'than'. |
| faith-and-order-0042 | `whose married her` | 'whose' is likely 'whoso'. |
| faith-and-order-0043 | `(Acts 8-17)` | Reference likely 'Acts 8:17'. |
| faith-and-order-0044 | `visible sings` | 'sings' is likely 'signs'. |
| faith-and-order-0044 | `(Acts 20: 38)` | Quoted verse is Acts 20:28; reference reads 20:38. |
| faith-and-order-0045 | `(Acts 14: f23)` | Reference likely 'Acts 14:23'. |
| faith-and-order-0046 | `not lit to send` | 'lit' is likely 'fit'. |

Two short lines are kept exactly where they appear and may be source attributions rather than titles: “The meaning of Holy Trinity (Pope Shenouda III)” (end of the Trinity chapter) and “The Incarnation (St. Athanasius)” (end of the Incarnation chapter). They probably name the sources behind the “(1)”/“(2)” markers that follow some paragraphs, but the file has no footnotes to confirm this, so all of them are kept verbatim.

## Passage sizes
Target 300–600 words; paragraphs are never split. Below 250 words:

- faith-and-order-0001 — 134 words — Introduction (chunk closed at a sub-section or chapter boundary; paragraphs are never split)
- faith-and-order-0009 — 159 words — The Mystery of the Holy Communion; what is Holy Communion? (chunk closed at a sub-section or chapter boundary; paragraphs are never split)
- faith-and-order-0014 — 223 words — Introduction to Church Sacraments (chunk closed at a sub-section or chapter boundary; paragraphs are never split)
- faith-and-order-0017 — 241 words — The Sacrament of Baptism (chunk closed at a sub-section or chapter boundary; paragraphs are never split)
- faith-and-order-0021 — 249 words — The Sacrament of Baptism (chunk closed at a sub-section or chapter boundary; paragraphs are never split)
- faith-and-order-0044 — 240 words — The Sacrament of the Holy Orders (chunk closed at a sub-section or chapter boundary; paragraphs are never split)

Passages without search keywords: faith-and-order-0001.

## Alias review (theological ambiguity)

All Amharic, Ge'ez-script and transliterated aliases are search metadata. None appear in passage content, and the database seed loads them as `pending` so search ignores them until a reviewer approves them.

| Topic | Aliases | Review note |
|---|---|---|
| holy_trinity | ቅድስት ሥላሴ, ሥላሴ, ምሥጢረ ሥላሴ, አንድነትና ሦስትነት, Kidist Selassie, Selassie, Sillase, Mistire Sillase | ሥላሴ is the standard EOTC term for the Holy Trinity. 'Selassie' also appears in personal names; aliases are attached only to passages that discuss the Trinity. |
| godhead_persons | መለኮት, አካል, Melekot, Akal | The source itself transliterates these as 'Melekote' and 'Akal'; the Ethiopic spellings are added as aliases only. |
| incarnation | ሥጋዌ, ምሥጢረ ሥጋዌ, Sigawe, Mistire Sigawe | Transliteration 'Sigawe' (ሥጋዌ, Incarnation) can be confused with ሥጋውና ደሙ ('His Body and Blood', Holy Communion). The communion alias set deliberately uses 'Sigawna Demu', not 'Sigawe'. |
| tewahedo_christology | ተዋሕዶ, Tewahedo, Tewahido, ኬልቄዶን, Kelkedon | Tewahedo ('made one, united') names the union of Godhead and manhood in the one Christ; attached only to passages on that union, not to every passage of the book. |
| virgin_mary | ቅድስት ድንግል ማርያም, ድንግል ማርያም, እመቤታችን, Dingil Maryam, Emebetachin | — |
| baptism | ጥምቀት, ምሥጢረ ጥምቀት, Timket, Timkat, Temqet, Mistire Timket | ጥምቀት/Timket also names the Epiphany feast (Ṭərr 11). These aliases point to passages on the sacrament/mystery of Baptism; Epiphany questions should be answered from calendar content, not from these passages. |
| infant_baptism | የሕፃናት ጥምቀት, ክርስትና, Kristinna, Christening | ክርስትና (Kristinna) is the common Amharic word for christening/baptism of a child. |
| holy_communion | ቁርባን, ቅዱስ ቁርባን, ምሥጢረ ቁርባን, ሥጋውና ደሙ, Qurban, Kurban, Kidus Qurban, Sigawna Demu | ቁርባን literally 'offering'; in EOTC usage it names Holy Communion. Kept distinct from ሥጋዌ (Incarnation). |
| liturgy_anaphora | ቅዳሴ, Qidase, Kidase | ቅዳሴ is the EOTC Divine Liturgy; the source's 'Anaphora of St. John' etc. are individual ቅዳሴ texts. |
| resurrection | ትንሣኤ, ትንሣኤ ሙታን, ምሥጢረ ትንሣኤ ሙታን, Tinsae, Tensae, Tinsae Mutan | ትንሣኤ also names the Easter feast. The source chapter concerns the resurrection of the dead (ትንሣኤ ሙታን) and Christ's resurrection. |
| salvation | ድኅነት, መዳን, ቤዛነት, Dihnet, Medan, Bezanet | ድኅነት (salvation) and ቤዛነት (redemption/ransom) are close but not identical; both are attached only where the passage itself speaks of salvation or redemption. |
| repentance_penance | ንስሐ, ምሥጢረ ንስሐ, ኑዛዜ, የንስሐ አባት, Nisiha, Nissiha, Niseha, Nuzaze, Yenisiha Abat | ንስሐ covers both repentance (the inner turning) and the sacrament of Penance; the English source uses both words. 'Confess' in the sense of confessing faith also triggers this topic, so reviewers should spot-check. |
| confirmation | ሜሮን, ቅብዐ ሜሮን, ምሥጢረ ሜሮን, Meron, Qibe Meron | EOTC Confirmation is administered with holy Myron (ሜሮን) immediately after baptism; 'anoint' also matches the Unction and anointing-of-kings passages, which is acceptable for retrieval. |
| unction | ቀንዲል, ምሥጢረ ቀንዲል, Qendil, Kendil, Kandil | The source text writes 'function of the sick' in two places (an evident typo for 'unction'); the trigger matches both spellings without altering the text. |
| matrimony | ተክሊል, ምሥጢረ ተክሊል, ጋብቻ, Teklil, Gabicha | ተክሊል is the church crowning rite of marriage; ጋብቻ is marriage in general. |
| holy_orders | ክህነት, ምሥጢረ ክህነት, ጳጳስ, ኤጲስ ቆጶስ, ካህን, ቄስ, ዲያቆን, Kihnet, Kehnet, Papas, Episkopos, Kahin, Qes, Diyakon | — |
| seven_sacraments | ሰባቱ ምሥጢራት, ምሥጢራተ ቤተ ክርስቲያን, ሰባቱ ምሥጢራተ ቤተ ክርስቲያን, Sebatu Mistirat, Mistirate Bete Kristiyan | Kept separate from the Five Pillars of Mystery (አምስቱ አዕማደ ምሥጢራት). Baptism and Communion appear in both lists, but the lists are distinct and aliases must not merge them. |
| five_pillars_of_mystery | አምስቱ አዕማደ ምሥጢራት, አዕማደ ምሥጢራት, Amistu Aimade Mistirat, Aimade Mistirat | Derived: the book's five 'THE MYSTERY OF …' chapters (Trinity, Incarnation, Baptism, Holy Communion, Resurrection) correspond to the EOTC Five Pillars of Mystery. The source does not use that phrase; the alias is attached only to those five chapters, never to the seven-sacrament chapters. |
| sin | ኃጢአት, ስርየተ ኃጢአት, Hatiat, Siryete Hatiat | — |
