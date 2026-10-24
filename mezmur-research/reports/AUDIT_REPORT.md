# TewahedoDaily — Full EOTC Media Hymn Catalog Audit & CSV Import Report

**Execution Date:** `2026-10-24T02:07:28Z`  
**Source Catalog:** `https://eotcmedia.com/hymns` & `https://eotcmedia.com/sitemap.xml`  
**Catalog Completion:** **100.0% (`4,175 / 4,175` unique hymn detail pages opened and strictly inspected)**

---

## 1. Executive Summary & Exact Verified Counts

| Metric | Exact Verified Count | Notes |
| :--- | ---: | :--- |
| **Advertised Catalog Size (`/hymns`)** | **4,175** | `initialTotal: 4175` across `174` listing pages (`24` per page) |
| **Sitemap Hymn Detail URLs (`/sitemap.xml`)** | **4,175** | Plus `581` singer URLs and `640` channel URLs |
| **Total Unique Hymn Detail Pages Discovered** | **4,175** | Zero pagination or discovery gaps (`difference = 0`) |
| **Unique Hymn Detail Pages Opened & Inspected** | **4,175** | **100.0% full catalog inspection** |
| **Total Confirmed WITH Written Lyrics (`has_lyrics = true`)** | **930** | `872` human-verified (`lyrics`), `47` AI-transcribed (`aiLyrics`), `11` community suggestions (`lyricsSuggestion`) |
| **Total Confirmed WITHOUT Written Lyrics (`has_lyrics = false`)** | **3,243** | Display `"Lyrics not yet available"` / `"Sign in to add or generate lyrics"` or placeholder text |
| **Total Uncertain (`lyrics_verification = uncertain`)** | **2** | Reachable (`HTTP 200`), but `ግጥም` section contains only a 1-line title/chant fragment (`10–13` chars) |
| **Total Duplicate / Alternate Recording Matches** | **201** | `118` matches against existing TewahedoDaily hymns; `83` internal EOTC Media matches |
| **Total Import-Ready Qualifying Records** | **794** | Confirmed `has_lyrics = true`, non-duplicate, non-compilation, valid YouTube URL & TewahedoDaily taxonomy |
| **Total YouTube URLs Verified (With Lyrics / All Inspected)** | **930 / 4,175** | 100% of qualifying hymns (`930/930`) and 100% of catalog (`4,175/4,175`) have verified 11-char YouTube IDs |
| **Total Singers (`Zemari`) Verified (With Lyrics)** | **837** | `837 / 930` (`90.0%`) have verified individual Zemari attribution separated from YouTube channels |
| **Total Qualifying Records Flagged `needs_review`** | **381** | Includes existing TewahedoDaily overlaps, AI/suggested lyrics verification, or missing Zemari |
| **Total Qualifying Records `ready` Without Extra Flags** | **549** | Confirmed human-verified lyrics, verified Zemari, high-confidence taxonomy, non-duplicate |
| **Unresolved Crawl / Network Errors** | **0** | All `4,175` detail pages returned `HTTP 200` and were parsed cleanly |

---

## 2. Deliverable Files in `data/imports/eotcmedia/`

All CSV files are encoded in **UTF-8 with BOM (`utf-8-sig`)** so Amharic and Ge'ez Ethiopic script opens cleanly in Microsoft Excel and Supabase import tools. Full copyrighted lyrics are **never** republished in public CSV columns; `lyrics_source_url` and `copyright_status = source_reference_only_rights_review_required` are preserved on every qualifying row.

1. **`data/imports/eotcmedia/eotcmedia_with_lyrics.csv`** (`930` records, 24 columns)
   - Contains every hymn in the EOTC Media catalog confirmed to have genuine written lyrics in the `ግጥም` section.
2. **`data/imports/eotcmedia/eotcmedia_without_lyrics.csv`** (`3,243` records, 12 columns)
   - Contains every hymn confirmed to lack written lyrics (`has_lyrics = false`), along with `source_url` and `without_lyrics_reason`.
3. **`data/imports/eotcmedia/eotcmedia_uncertain.csv`** (`2` records, 10 columns)
   - Contains the 2 hymns (`source_id=282` `ይቅር ስላልከኝ` and `source_id=943` `ቤዛ ኲሉ`) where the `ግጥም` box contained only a single short 10–13 character line.
4. **`data/imports/eotcmedia/eotcmedia_duplicates.csv`** (`201` records, 18 columns)
   - Logs all duplicate and alternate-recording comparisons against:
     - **Existing TewahedoDaily hymns** (`118` matches against `public.mezmur_data_import`, `amharic-chants-supabase.csv`, and `english-mezmur-supabase-deduped.csv`)
     - **Other EOTC Media records** (`83` internal matches across canonical URL, YouTube video ID, normalized Amharic title + singer, or alternate recordings by different Zemaris).
5. **`data/imports/eotcmedia/eotcmedia_import_ready.csv`** (`794` records, 24 columns)
   - Contains only qualifying `has_lyrics = true` individual hymns that pass all schema, taxonomy, YouTube URL, compilation-exclusion, and deduplication checks.
6. **`data/imports/eotcmedia/eotcmedia_full_audit.json`**
   - Machine-readable JSON audit report with complete breakdowns by lyrics source kind, theological category, primary occasion, language, and form.

---

## 3. Breakdown of the 930 Qualifying Hymns (`has_lyrics = true`)

### 3.1 By Theological Category (18 Canonical TewahedoDaily Categories)
| Theological Category | Count |
| :--- | ---: |
| `Praise Worship` | 359 |
| `Jesus Christ` | 209 |
| `Virgin Mary` | 135 |
| `Repentance` | 69 |
| `Kidus Michael` | 29 |
| `Kidus Gabriel` | 24 |
| `Saints` | 22 |
| `Cross` | 21 |
| `Holy Trinity` | 18 |
| `Holy Spirit` | 13 |
| `Angels` | 11 |
| `Prayer` | 9 |
| `Apostles` | 5 |
| `Abune Tekle Haymanot` | 3 |
| `Kidus Yared` | 2 |
| `Kidus Estifanos Saint Stephen` | 1 |
| **Total** | **930** |

### 3.2 By Primary Occasion (24 Canonical TewahedoDaily Occasions)
| Primary Occasion | Count |
| :--- | ---: |
| `General / Anytime` | 563 |
| `Annual Saint Feast` | 96 |
| `Gena` | 76 |
| `Abiy Tsom` | 74 |
| `Tinsae` | 35 |
| `Meskel` | 27 |
| `Pentecost` | 14 |
| `Kidane Mihret` | 12 |
| `Wedding` | 8 |
| `Siklet` | 7 |
| `New Year / Enkutatash` | 6 |
| `Hosanna` | 3 |
| `Timket` | 3 |
| `Debre Tabor` | 2 |
| `Filseta` | 2 |
| `Communion` | 1 |
| `Lideta Maryam` | 1 |
| **Total** | **930** |

### 3.3 By Language & Form
- **Language:** `amharic` (`832`), `english` (`72`), `geez` (`23`), `oromo` (`3`)
- **Form:** `mezmur` (`922`), `werb` (`8`)
