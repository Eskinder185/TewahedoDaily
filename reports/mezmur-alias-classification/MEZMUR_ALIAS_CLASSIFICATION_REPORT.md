# Mezmur alias dictionary & lyrics classification — quality report

**Input:** `mezmur_data_import_CLEAN.csv` (2,092 Mezmurs) · **Run:** `npm run classify:mezmur-aliases -- <csv>` · **Database:** not touched.

## What was built

| Piece | File | Purpose |
|---|---|---|
| Alias dictionary | `src/lib/mezmur/taxonomyAliases.ts` | 1,118 aliases for the existing 25 categories and 24 occasions, with language, script, alias type, evidence strength, ambiguity flag and notes. No new taxonomy entries; existing slugs kept. |
| Matcher | `src/lib/mezmur/aliasMatcher.ts` | Unicode-safe normalization and whole-word matching (details below). Stored text is never changed. |
| Classifier | `src/lib/mezmur/lyricsTaxonomyClassifier.ts` | Lyrics-only proposals: one primary category, any number of additional categories, several occasions, browse sections, matched aliases, verbatim excerpts, confidence and review reasons. |
| Search | `src/lib/publicContent/taxonomy.ts`, `mezmurSearch.ts` | `canonicalizeCategory` / `canonicalizeOccasion` accept any alias; public search finds songs by alias (e.g. "Saint Michael", "Mikael", "ቅዱስ ሚካኤል"). URLs, navigation and hierarchy unchanged. |
| Tests | `scripts/test-mezmur-taxonomy-aliases.ts` (`npm run test:mezmur-aliases`) | 93 regression tests, plus precision / recall on a labelled gold set. |
| Batch runner | `scripts/classify-mezmur-lyrics-aliases.ts` (`npm run classify:mezmur-aliases`) | Classifies a CSV in batches of 50, then checks the output before writing it. |

The older 6-group classifier (`mezmurClassification.ts`) is unchanged, and its 25-scenario suite still passes.

## Dictionary contents

| | Count |
|---|---:|
| Aliases | 1,118 |
| Amharic / Ge'ez / Tigrinya (Ethiopic script) | 562 / 45 / 4 |
| English / transliterations (Latin script) | 334 / 173 |
| Exact names / honorifics / contextual phrases / transliterations | 552 / 64 / 328 / 173 |
| Ambiguous aliases (count only with supporting context) | 72 |
| Search-only aliases (feast names that are also everyday words, e.g. ገና, መስቀል) | 44 |
| Regex phrase patterns (Trinitarian formula, "born of the Virgin", "body … blood", etc.) | 6 |

### How matching works

- **Spelling variants:** Ethiopic letters that are written interchangeably are folded together: ሀ/ሐ/ኀ/ሃ, ሰ/ሠ, አ/ዐ/ኣ/እ, ጸ/ፀ and labialized forms. Folding አ and እ was needed because the scanned booklets confuse them constantly.
- **Latin text:** diacritics are removed, letters are lower-cased, doubled letters are collapsed, and "St." is read as "Saint".
- **Word boundaries:** an Ethiopic alias may carry a fused prefix (የ ለ በ ከ ወ ዘ እ ስለ እንደ …) and up to three suffix letters. It may never sit inside an unrelated longer word.
- **Changed final letter:** the final letter may change vowel order, as in መስቀል→መስቀሉ or ተክሊል→ተክሊሉ. The -a form is allowed only before plural possessives, so ያሬድ (Yared) does not match ያሬዳዊ ("Yaredic").
- **Overlapping matches:** when two matches overlap, the longer one wins. So ገብረ መንፈስ ቅዱስ does not also count as "Holy Spirit", and ትንሣኤሽ (the Virgin's resurrection) does not count as Tinsae.

## Results on 2,092 Mezmurs

| Confidence | Rows | Share |
|---|---:|---:|
| HIGH | 725 | 34.7% |
| MEDIUM | 613 | 29.3% |
| LOW | 754 | 36.0% |

- **Needs manual review:** 884 rows, all in `mezmur_alias_classification_review.csv`.
- **More than one category:** 441 songs. **More than one occasion:** 35 songs.

| Reason for review | Rows |
|---|---:|
| Low confidence | 675 |
| No clear subject in the lyrics | 349 |
| Very short (1–2 lines) | 155 |
| Lyrics are Tigrinya | 105 |
| Two subjects with similar weight | 75 |
| Lyrics too short to classify | 74 |
| Lyrics are Afaan Oromo | 7 |
| Mentions ጥምቀት/baptism without enough context to tell Timket from sacramental Baptism | 5 |
| No lyrics | 5 |

A row can have more than one reason.

### Categories (songs tagged, primary + additional)

| Category | Primary | Any |
|---|---:|---:|
| Virgin Mary | 462 | 500 |
| Jesus Christ | 309 | 372 |
| Praise / Worship | 137 | 281 |
| Repentance | 120 | 188 |
| General | 138 | 138 |
| Cross | 80 | 117 |
| Salvation | 41 | 104 |
| Prayer | 32 | 90 |
| Angels | 49 | 86 |
| Kidus Michael | 60 | 62 |
| Kidus Gabriel | 49 | 55 |
| Saints | 21 | 38 |
| Holy Trinity | 31 | 37 |
| Apostles | 15 | 31 |
| Prophets | 16 | 27 |
| Holy Spirit | 15 | 26 |
| Kidus Giorgis | 18 | 23 |
| Martyrs | 12 | 21 |
| Abune Tekle Haymanot | 19 | 19 |
| Kidus Yared | 10 | 10 |
| Kidus Uriel | 4 | 9 |
| Yohannes Metmek / John the Baptist | 8 | 9 |
| Abune Gebre Menfes Kidus | 8 | 9 |
| Kidus Estifanos / Saint Stephen | 6 | 7 |
| Kidus Raphael | 4 | 5 |
| *(no category — needs review)* | 428 | — |

### Occasions (songs tagged)

| Occasion | Songs |
|---|---:|
| Wedding | 62 |
| Gena | 60 |
| Siklet | 49 |
| Tinsae | 41 |
| Communion | 26 |
| Timket | 22 |
| Kidane Mihret | 21 |
| Hosanna | 17 |
| Lideta Maryam | 14 |
| New Year / Enkutatash | 12 |
| Debre Tabor | 9 |
| Meskel | 8 |
| Erget | 5 |
| Tsome Nineveh | 5 |
| Filseta | 2 |
| Pentecost | 1 |
| Funeral / Memorial | 1 |
| General / Anytime (no feast named) | 1,774 |

No lyrics explicitly named Abiy Tsom, Tsome Nebiyat, Tsome Hawariat, Holy Week, Annual Saint Feast or sacramental Baptism strongly enough to assign them.

## Quality measurement

### Gold set (31 labelled hymns, automated)

- **Categories:** precision 100%, recall 100% (29 correct, 0 false positives, 0 missed).
- **Occasions:** precision 100%, recall 100% (14 correct, 0 false positives, 0 missed).

The gold set covers every case you asked for:

- Saint Michael / Archangel Mikael / ቅዱስ ሚካኤል
- Gabriel
- Saint Mary / እመቤታችን
- Jesus / Emmanuel / መድኃኔዓለም
- Gena
- Timket vs Baptism
- Meskel vs Cross
- Tinsae vs the general resurrection, and ትንሣኤሽ
- short hymns
- several saints in one hymn
- Ge'ez verses
- mixed Amharic/Latin
- known traps: ያሬዳዊ, ከፍ አረገን, ገና = "yet", አቡነ ዘበሰማያት

**Caveat:** this set was written while building the rules, so it measures whether each rule works as designed. It does not measure accuracy on unseen songs.

### Spot checks on real songs (judged by reading the lyrics)

| Sample | Result |
|---|---|
| 30 random songs, first version | ~26/30 primary correct; errors drove four fixes (Angels outranking Christ, a single Mary mention, Joachim ≠ Lideta feast, missing ተሰቅሎ) |
| 50 random songs, second version | 45/50 primary correct; 2 unassigned songs correctly flagged for review |
| 20 random songs with a specific occasion | 19/20 correct (the miss: ክርስትና read as christening — now fixed, since ክርስትና normally means "Christianity") |
| **40 random songs, final version** | **24 of 27 assigned songs correct (≈ 89%)**; all 13 unassigned songs are flagged for review |

The three errors in the final sample were:

1. An English Mary hymn ("The garden enclosed my dove…") was read as Jesus Christ. English Marian imagery has since been added.
2. A hymn about the Sabbath was tagged Angels.
3. A Timket hymn with one mention of Mary was given Mary.

Fixes for #1 and #3 were applied after the sample was drawn, so those exact songs were not re-judged.

### Compared with the earlier classification (same 2,092 songs)

- **Same primary category:** 1,293.
- **Changed:** 287. Most changes move a song to Jesus Christ from Mary, Salvation, Repentance or Cross, where Christ is clearly the subject, or move a passing named-saint mention back to Mary.
- **Newly assigned:** 84. **Now unassigned:** 46.
- **Specific occasions:** 318 songs, up from 295.

## Known limits

- **Rule-based reading:** this is an alias- and rule-based reading of the lyrics, not a line-by-line theological reading by a person. Treat HIGH as reliable, MEDIUM as worth a glance, and LOW / review rows as needing a human decision.
- **Other languages:** 105 Tigrinya and 7 Oromo songs are labelled `amharic` in the data. They are classified where possible, but always flagged for review.
- **Damaged lyrics:** at least one row contains corrupted Arabic-script text instead of lyrics.
- **Subcategories:** the repo's only verifiable level below category is the browse sections (`hymn_browse_groups`). `hymn_sections` lists the sections that contain each assigned category or occasion. Six categories and three occasions are not placed in any browse section; see the taxonomy suggestions.
- **Saved data:** nothing was written to Supabase, and no title, lyric, identifier, URL or publication status was changed.
