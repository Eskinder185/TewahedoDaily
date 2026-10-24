# TewahedoDaily — 2,000+ Mezmur Collection, Classification, and CSV Import System

This directory (`C:\Users\eskew\github\TewahedoDaily\mezmur-research`) implements the polite, resumable Ethiopian Orthodox Tewahedo Mezmur research crawler, deduplicator, Antigravity Gemini batch classifier, taxonomy validator, and UTF-8 with BOM CSV export pipeline for **TewahedoDaily**.

---

## 1. Directory Structure

```text
mezmur-research/
  crawler/
    client.py            # Polite HTTP client (robots.txt check, conservative rate limits, exponential backoff)
    parser.py            # Sitemap XML, SSR Next.js Flight stream, and JSON-LD VideoObject parser
    db.py                # SQLite WAL checkpoint database (resumable state, merge-on-upsert, milestone logs)
    runner.py            # CLI crawler orchestrator with milestone checkpoints every 50 records
  classifier/
    taxonomy.py          # Canonical TewahedoDaily categories, occasions, languages, forms, and 38 hymn sections
    transliterator.py    # Ethiopic -> Latin phonetic transliterator, homophone normalizer, and slug generator
    deduplicator.py      # Compilation/album detector and multi-stage duplicate vs. distinct performance detector
    engine.py            # Evidence-based classification engine + Gemini batch classification integration
    gemini_batches.py    # Antigravity Gemini batch classification runner (persists structured JSON batches)
  importer/
    readiness.py         # Draft vs. Publish import readiness evaluator
    exporter.py          # Generates all 10 mandatory UTF-8 with BOM CSV files
  checkpoints/
    mezmur_crawl.sqlite  # SQLite checkpoint database (visited URLs, raw listings, Gemini classifications)
    gemini_batches/      # Checkpointed Gemini classification batches (batch_001.json .. batch_009.json)
  exports/               # All 10 mandatory UTF-8-SIG CSV files
  reports/
    pipeline_summary.json # Summary metrics of the collection and classification run
  tests/
    test_pipeline.py     # 11 deterministic unit & integration test suites
  README.md
```

---

## 2. Source Research & Permissions Summary

- **Source**: `https://eotcmedia.com/hymns`
- **`robots.txt` (`https://eotcmedia.com/robots.txt`)**:
  - `Allow: /`
  - `Disallow: /api/` (strictly respected; the crawler never requests `/api/hymns` and only fetches public SSR HTML pages and `sitemap.xml`).
  - `Sitemap: https://eotcmedia.com/sitemap.xml`
- **Verified Source Counts**:
  - **4,175** individual hymn URLs in `sitemap.xml` (`initialTotal: 4175` across 174 pages on `/hymns`)
  - **581** singer listing URLs (`/hymns/singer/<slug>`)
  - **640** channel listing URLs (`/hymns/channels/<slug>`)
  - **33** categories and **216** subcategories across **7** languages
- **Lyrics & Copyright Compliance**:
  - Third-party full lyrics are **never** copied into `amharic_lyrics`, `transliteration_lyrics`, or `english_lyrics`.
  - When a source page contains lyrics, `lyrics_status` is set to `rights_review_required` (and logged in `missing_lyrics.csv` and `source_attribution.csv`). When absent, `lyrics_status` is set to `missing`.

---

## 3. Mandatory CSV Outputs (`mezmur-research/exports/`)

All 10 CSV files are encoded in **UTF-8 with BOM (`utf-8-sig`)** for Excel and Amharic/Ge'ez Unicode compatibility:

| # | File | Rows | Description |
|---|------|-----:|-------------|
| 1 | `mezmurs_2000.csv` | **2,128** | Verified unique individual Mezmurs (`status=draft`, `featured=false`, `id=""`) |
| 2 | `mezmur_section_links.csv` | **3,617** | Many-to-many section links (`mezmur_slug` -> `section_slug` in `mezmur_sections_final.csv`) |
| 3 | `mezmur_occasion_links.csv` | **2,227** | Primary and additional liturgical occasion links (`mezmur_slug` -> `occasion_slug`) |
| 4 | `zemaris.csv` | **364** | Verified Zemari profiles (excluding YouTube channels and choir/group tags like `በህብረት`) |
| 5 | `duplicates.csv` | **219** | Excluded exact/re-upload duplicates (62) and kept distinct performances by different Zemaris (157) |
| 6 | `review_required.csv` | **1,243** | Records flagged for human editorial review with explicit `review_reasons` |
| 7 | `missing_lyrics.csv` | **2,128** | Tracks `missing` vs. `rights_review_required` lyrics status |
| 8 | `source_attribution.csv` | **2,128** | Full provenance (`source_url`, `source_hymn_id`, `youtube_video_id`, channel, upload date) |
| 9 | `import_readiness.csv` | **2,128** | Per-row validation for draft import readiness vs. publication readiness |
| 10 | `crawl_errors.csv` | **0** | Crawl error log (0 errors encountered) |

---

## 4. Windows PowerShell Commands (Run, Resume, Classify, Test)

### Run or Resume the Crawler
The crawler automatically resumes from `mezmur-research/checkpoints/mezmur_crawl.sqlite` and saves checkpoints after every 50 detail pages:

```powershell
$env:PYTHONIOENCODING="utf-8"
python -u "C:\Users\eskew\github\TewahedoDaily\mezmur-research\crawler\runner.py" --target 2050 --batch-size 50 --workers 4 --delay 0.06
```

### Re-export CSVs Only (Without Network Requests)
```powershell
$env:PYTHONIOENCODING="utf-8"
python -u "C:\Users\eskew\github\TewahedoDaily\mezmur-research\crawler\runner.py" --export-only
```

### Run Checkpointed Gemini Batch Classification & Refresh Exports
```powershell
$env:PYTHONIOENCODING="utf-8"
python "C:\Users\eskew\github\TewahedoDaily\mezmur-research\classifier\gemini_batches.py"
```

### Run the Deterministic Python Test Suite
```powershell
python -m pytest "C:\Users\eskew\github\TewahedoDaily\mezmur-research\tests\test_pipeline.py" -v
```

### Run the Admin CSV Import Preview E2E Test (Playwright)
```powershell
Set-Location "C:\Users\eskew\github\TewahedoDaily"
node scripts/test-mezmur-csv-import-preview.mjs
```

---

## 5. Admin Bulk CSV Import Preview (`/admin/hymns/import`)

- **Route**: `/admin/hymns/import` (also accessible via the **CSV Import** tab in `/admin/hymns` and the **Bulk CSV Import Preview** button in `/admin/hymns/mezmur`).
- **Source Files**:
  - Service: `src/lib/cms/mezmurCsvImport.ts`
  - UI Component: `src/pages/admin/MezmurCsvImportPreview.tsx`
- **Capabilities**:
  - Upload `mezmurs_2000.csv` (or any compatible UTF-8 / UTF-8-BOM CSV)
  - Search and filter by Amharic title, transliteration, slug, category, primary occasion, lyrics status, duplicate status, review status, and Zemari profile match
  - Inline edit Amharic titles, transliteration titles, slugs, categories, primary occasions, additional occasions, multiple hymn sections, and Zemari profile links
  - Dedicated review tabs for **Duplicates**, **Missing / Rights Lyrics**, **Source Attribution**, and **Review Required**
  - Export edited staging rows back to a UTF-8 with BOM CSV file
  - Explicitly import selected import-ready rows as **unpublished drafts** (`status = 'draft'`, `featured = false`) using the existing authenticated CMS session
