# EOTC Calendar Research Report

**Project:** Tewahedo Daily — master Ethiopian Orthodox Tewahedo calendar research dataset  
**Output folder:** `research/eotc-calendar/`  
**Build script:** `scripts/build-eotc-calendar-research.mjs`  
**Scope:** Full Ethiopian year (13 months, including Pagumen 6)

This report documents methodology, sources, limits, and review needs. It does **not** claim that every Synaxarium narrative is complete or clergy-certified.

---

## 1. Sources used

| ID | Source | Role |
|---|---|---|
| ethiopian-synaxarium-pdf | *The Ethiopian Synaxarium* PDF extract → `src/data/synaxariumEntries.json` | Day-by-day commemorations (366 days) |
| eotc-calendar-json | `src/data/eotc_calendar_json/*` | Fixed feasts, Mary/angels/saints, fasts, seasons, paschal entries, monthly JSON |
| stmaryeotctoronto-services | St. Mary EOTC Cathedral, Toronto — Services | Monthly feast list (Trinity 7, Michael 12, Kidane Mihret 16, Gabriel 19, Mary 21, Uriel 22, …) |
| stmaryeotctoronto-liturgical-calendar | Same parish — Liturgical Calendar & Feasts | Full 1–30 monthly table + Marian notes |
| wikipedia-tewahedo-calendar | Wikipedia “Calendar of saints (Orthodox Tewahedo)” | Secondary cross-check of monthly table |
| eotcmk-gabriel | Mahibere Kidusan article on Archangel Gabriel | Confirms monthly Gabriel on the 19th |
| bahre-hasab-wiki | Wikipedia — Bahre Hasab | Movable offsets from Nineveh |
| eotc-ma-bahire-hasab | EOTC-MA Bahire Hasab explainer | Tewsak / Nineveh-based calculation notes |
| geezapps-holidays | GeezApps holidays article | Fast lengths / movable windows (secondary) |
| pascha-gregorian-table | `src/data/paschaGregorianTable.ts` | Curated Fasika civil dates for app years |

---

## 2. Source hierarchy (applied)

1. Ethiopian Orthodox Synaxarium / Senkessar extracts (daily commemorations)  
2. Ethiopian Orthodox parish / diocesan listings (monthly & annual feast tables)  
3. Project curated EOTC calendar JSON (already used by the product)  
4. Church education / Sunday-school articles (e.g. Mahibere Kidusan)  
5. Bahire Hasab references for **movable** calculation structure  
6. Secondary encyclopedic pages (Wikipedia, summary articles) — **never sole proof for doctrine**

Avoided as primary authorities: unsourced social posts, generic Byzantine calendars without Ethiopian verification, decorative calendar images.

---

## 3. Date conversion methodology

- Fixed commemorations store **Ethiopian month number + day** only.
- Gregorian display must use runtime conversion (`ethiopianGregorianBridge` / app calendar logic) for the selected Ethiopian year.
- Leap years: Pagumen has **6** days; the dataset includes Pagumen 1–6 so leap years are covered. Non-leap years simply omit day 6 in UI.
- Do **not** treat a single Gregorian “approx” from the Synaxarium PDF as permanent.

---

## 4. Fixed feast methodology

- Loaded from `fixed-feasts.json`, `mary.json`, `angels.json`.
- Where `date.kind === fixed`, feast rows carry `ethiopian_month_number` + `ethiopian_day`.
- Major feasts also stamp `major_feast` on the matching day row when present.
- User-facing `short_card_summary` / `full_explanation` come from existing curated summaries — still flagged `needs_review` for clergy polish.

---

## 5. Movable feast methodology

Movable observances are modeled as **rules**, not permanent civil dates.

Standard Bahire Hasab pattern used in this dataset:

| Event | Days after Fast of Nineveh (Monday) |
|---|---|
| Nineveh | 0 |
| Abiy Tsom (Great Lent) | +14 |
| Debre Zeit | +41 |
| Hosanna | +62 |
| Siklet (Good Friday) | +67 |
| Fasika | +69 |
| Erget (Ascension) | Fasika + 39 (recorded via combined offset from Nineveh) |
| Pentecost | Fasika + 49 |

**Runtime:** compute Nineveh for the Ethiopian year (Bahire Hasab / Metke), then apply offsets. For civil Fasika in known Gregorian years, the app may also use `PASCHA_GREGORIAN_ISO` as a curated check table — not a replacement for full computus.

Apostles’ Fast length varies with Pentecost date; Filseta is treated as a **fixed-range** fast in project JSON (verify yearly practice with clergy).

---

## 6. Fast calculation

Captured in `eotc-fasts.csv`:

- Seasonal / major fasts from `fasts.json` (e.g. Tsome Nebiyat range)
- Explicit **Wednesday** and **Friday** weekly fasts as discipline rows
- Paschal-related fasts also appear under movable rules

**Critical UI rule:** weekly fasts must **not** appear as Synaxarium commemorations.

Day-level `fasting_status` is mostly left blank pending year-specific computus overlay in the app.

---

## 7. Monthly commemoration methodology

1. Built a 1–30 monthly table from **St. Mary Toronto** parish pages cross-checked with **Wikipedia Tewahedo calendar** and project `monthly-commemorations.json`.
2. Expanded each template onto every Ethiopian month day that exists (including Pagumen 1–6 where the day number exists).
3. Confidence:
   - **high** when parish + secondary + project agree (e.g. Michael 12, Gabriel 19, Mary 21, George 23, Trinity 7, Kidane Mihret 16)
   - **medium/low** when names are sparse/obscure (e.g. Hnstata on the 20th) or sources partially disagree

**Documented disagreement:** Day 22 — Uriel (parish services) vs Deqsius + Uriel (Wikipedia / liturgical table). Dataset keeps **both** and flags review.

---

## 8. Synaxarium extraction methodology

- Base: `synaxariumEntries.json` (366 entries; months 1–12 × 30 + Pagumen 6).
- Each day → one `eotc-calendar-days` row.
- Each listed main/commemoration string → a `eotc-commemorations` row with inferred type keywords.
- **Full modern copyrighted Synaxarium text is not dumped** into `body_*` fields.
- `full_explanation` uses short extract summaries only; licensed/public-domain full stories remain a CMS/import task.
- Scripture arrays from OCR extracts are retained but **quality-flagged** for verification before public display.

---

## 9. Source disagreements (examples)

| Topic | Disagreement | Handling |
|---|---|---|
| Day 22 monthly | Uriel alone vs Deqsius + Uriel | Both named; `needs_review` |
| Month spelling | Tekemt/Tikimt, Miyazya/Miazia, etc. | Normalized to project canonical English names |
| Feast rank | “major” vs local emphasis | `feast_rank` from project flags; review for diocesan lists |
| Scripture on Synaxarium days | OCR / extract noise | Flagged in quality report |

---

## 10. Confidence methodology

- **high:** multiple independent Ethiopian Orthodox–aligned sources agree (or Bahire Hasab standard offset table).
- **medium:** single strong extract / one parish + secondary, or solid project curation pending clergy review.
- **low:** obscure naming, OCR uncertainty, missing corroboration.

`needs_review=true` is default for Synaxarium-derived narrative rows until editorial/clergy sign-off.

---

## 11. Missing information (honest gaps)

- Most **Amharic/Ge'ez titles** still blank (not invented).
- Most **full Synaxarium stories** not stored as redistributable full text.
- Day-level **fasting_status** for arbitrary dates not fully computed for every year.
- **Anaphora ↔ date** links intentionally absent unless separately documented.
- **Mezmur** links not auto-assigned; use tags/occasion matching at runtime.
- Saint **biographies** beyond short project blurbs need expansion from approved sources.
- Local / monastery-specific commemorations beyond the Senkessar extract may be missing.

---

## 12. Areas requiring clergy / expert review

1. Monthly table day 20 / day 22 naming and parish variants  
2. Scripture references attached to Synaxarium extracts  
3. Full narrative accuracy of English Synaxarium summaries  
4. Feast rank (nine major feasts of the Lord, 33 Marian feasts, etc.) completeness  
5. Filseta / Apostles’ Fast boundary rules per year  
6. Liturgical season boundaries and any color symbolism (only if traditionally used)  
7. Import mapping into production Supabase with RLS-safe publishing workflow  

---

## 13. Leap year / Pagumen

- Dataset includes **Pagumen 1–6**.
- Ordinary years: UI should expose Pagumen 1–5 only.
- Synaxarium extract already contained 6 Pagumen days.

---

## 14. What this dataset is ready for

- Scaffolding **every Ethiopian day** in CMS / Synaxarium  
- Powering Calendar + Today in Church **summaries** with source tags  
- Seeding monthly commemorations and major feast/fast/movable rules  
- Quality triage via `eotc-calendar-quality-report.csv`

## What it is not yet

- A finished, clergy-signed complete Senkessar translation  
- Automatic Calendar Cards for every day  
- Guaranteed Mezmur/Liturgy pairings per date  

---

## 15. Rebuild

```bash
node scripts/build-eotc-calendar-research.mjs
```

See also: `EOTC_CALENDAR_DATA_DICTIONARY.md` and `eotc-calendar-build-summary.json`.
