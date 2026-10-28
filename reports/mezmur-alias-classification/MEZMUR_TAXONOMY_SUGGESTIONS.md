# Suggested taxonomy improvements

These are suggestions only. None of them were applied, and no taxonomy IDs, names or slugs were changed.

## 1. Give every canonical category a browse section

Six of the 25 categories are not listed under any `hymn_browse_groups` section, so songs tagged with them can't be browsed:

| Category | Songs (primary / any) | Suggested section |
|---|---:|---|
| Holy Spirit | 15 / 26 | `praise-general`, or a new "Holy Trinity & Holy Spirit" item |
| Prayer | 32 / 90 | `praise-general` |
| Salvation | 41 / 104 | `jesus-christ` |
| Kidus Yared | 10 / 10 | `angels-saints` |
| Abune Gebre Menfes Kidus | 8 / 9 | `angels-saints` (next to Abune Tekle Haymanot) |
| Yohannes Metmek / John the Baptist | 8 / 9 | `angels-saints` |

Three occasions have no browse section either: Tsome Nebiyat, Tsome Hawariat and Annual Saint Feast. Suggested: put both fasts under `repentance-fasting`, and Annual Saint Feast under `angels-saints`.

## 2. Confirm two slugs

These slugs don't appear in the browse migrations. Please check them against the live `categories` table:

- **Yohannes Metmek / John the Baptist** → `yohannes-metmek-john-the-baptist` (the `slugify` result)
- **Abune Gebre Menfes Kidus** → `abune-gebre-menfes-kidus`

The alias dictionary is the only place these slugs need to change.

## 3. Align occasion slugs and labels

`mezmur_occasions` uses `new-year` and `funeral` as slugs, while the canonical labels are "New Year / Enkutatash" and "Funeral / Memorial". The dictionary already maps each label to its existing slug.

The table also contains browse-only occasions that are not in the 24 canonical occasions: `short-hymns`, `sunday-school`, `repentance`, `praise`, `bisrate-gabriel`, `wednesday-friday`, `general-fasting`, `marian-feasts`, `church-worship`, `children-youth` and `holiday-wereb`. Decide whether each should be:

- a canonical occasion;
- a category (Repentance and Praise already are); or
- kept as a browse-only shortcut.

## 4. Candidates seen often in the lyrics but missing from the taxonomy

These would be new taxonomy entries, so they were **not** created. They're recorded only as evidence for a decision.

| Candidate | Evidence in lyrics | Current handling |
|---|---|---|
| Bisrate Gabriel / Annunciation (occasion) | ብሥራት, "ገብርኤል … አበሠራት" in many Gabriel and Mary hymns; already a browse occasion | Tagged Kidus Gabriel + Virgin Mary |
| Tsome Tsige / Zemene Tsige (season) | ማኅሌተ ጽጌ, ጽጌ, "flight to Egypt" hymns (ስደትሽ, በግብፅ በረሀ) | Virgin Mary only |
| Kidist Arsema (category) | አርሴማ; already has the browse slug `kidist-arsema` | Counted under Martyrs |
| Kidus Kirkos & Iyeluta | ቂርቆስ, ኢየሉጣ appear in their own hymns | Counted under Martyrs |
| Sabbath / Sunday (theme) | ሰንበት hymns ("ያከብርዋ ለሰንበት") | No clear category; flagged for review |
| Church / Ethiopia (theme) | ቤተክርስቲያን, ኢትዮጵያ, "ኦርቶዶክስ ተዋሕዶ" hymns | Often unassigned or General |

## 5. Data issues to fix at the source

- **Wrong language label:** 105 songs labelled `amharic` are Tigrinya, and 7 are Afaan Oromo. Correcting `primary_language` would improve both search and classification.
- **No real lyrics:** 74 rows have lyrics too short to classify, 5 have no lyrics, and at least one contains corrupted Arabic-script text.
- **Scan errors:** many booklet rows still have scan errors, such as አ/እ swaps, stray digits and ፃ for ሃ. The matcher tolerates these, but correcting the text would raise confidence.

## 6. Maintaining the dictionary

- **Adding an alias:** add it to the right `define(...)` block in `src/lib/mezmur/taxonomyAliases.ts`. Give it a strength (5 = the name itself, 1 = a weak hint). Mark `ambiguous` when the word has other common meanings. Mark `searchOnly` for feast names that are also everyday words.
- **Regex patterns:** these run on normalized text, so write them with normalized letters. A test enforces this.
- **After any change:** run `npm run test:mezmur-aliases`.
