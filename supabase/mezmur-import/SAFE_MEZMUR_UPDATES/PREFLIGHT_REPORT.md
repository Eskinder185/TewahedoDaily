# TEWAHEDODAILY — PREFLIGHT RECONCILIATION & SAFETY REPORT
**Generated:** 2026-10-26T00:11:46.411Z  
**Repository:** `C:\Users\eskew\github\TewahedoDaily`  
**Target Table:** `public.mezmur_data_import`  
**Target Directory:** `supabase/mezmur-import/SAFE_MEZMUR_UPDATES/`

---

## 1. Executive Summary

A previous batch script emitted 1,121 `UPDATE public.mezmur_data_import ... WHERE slug = '...'` statements.
A read-only Supabase query confirmed that **28 slugs are duplicated in `public.mezmur_data_import`**, affecting **56 distinct records**.
Because the database contains two rows for each of these 28 slugs (one published and one draft), any slug-based `WHERE slug = '...'` statement executes against both rows, overwriting the draft record with the published hymn's lyrics.

This release resolves the corruption risk completely:
1. **100% Primary-Key Targeting**: Every single update statement has been migrated to `WHERE import_id = '<UUID>'::uuid`.
2. **Deterministic Duplicate Resolution**: All 28 duplicate slugs were matched unambiguously using original backup identifiers, publication statuses, titles, and lyrics. The published records were updated; the draft records were preserved untouched.
3. **Concurrency Protection**: Every update statement includes `IS NOT DISTINCT FROM` concurrency guards for both the target lyrics field and `lyrics_transliteration`. If a record was modified concurrently, the update statement affects 0 rows rather than overwriting.
4. **Transaction Safety (Step 2 Compliant)**:
   - Wrapped in PL/pgSQL blocks using `GET DIAGNOSTICS v_rows = ROW_COUNT;`.
   - Any 0-row update raises a concurrency conflict exception (`ERRCODE '40001'`).
   - Atomic rollback: zero partial changes if any conflict is detected.
   - Idempotent retry: `IF EXISTS` check safely skips already-formatted records.
5. **Human Review Isolation**: The 33 linguistic review records flagged in `HUMAN_REVIEW_REQUIRED.csv` have been excluded from automatic update batches.
6. **Unique Approved UUIDs**: Exactly 1,086 unique approved records partitioned into **32 discrete batches of 33-34 records each** in `SAFE_UPDATE_BATCHES/`.

---

## 2. Complete Corpus Reconciliation Math

| Metric | Count | Notes |
| :--- | :--- | :--- |
| **Total database records in `mezmur_data_import`** | **1,152** | Exact total from classification export & database inventory |
| **Records with lyrics** | **1,121** | 1,070 Ethiopic (Amharic/Ge'ez/Tigrinya) + 51 English/Oromo |
| **Records without lyrics** | **31** | 5 published (external media only) + 26 draft records |
| **Total proposed updates in report** | **1,121** | Matches all records with lyrics |
| **- Unique safe automatic updates** | **1,086** | 100% unique primary-key UUIDs, structurally aligned Chorus/Verse + transliterations |
| **- Excluded human review records** | **33** | Flagged in `HUMAN_REVIEW_REQUIRED.csv`; isolated from automatic runs |
| **- Deduplicated legacy import aliases** | **2** | `nana-amanuel` & `share` deduplicated to avoid duplicate update executions |
| **Reconciliation sum** | **1,121** | 1,086 + 33 + 2 = 1,121 (100.0% reconciled) |
| **Safe update batches** | **32** | 33-34 records per batch in `SAFE_UPDATE_BATCHES/` |

---

## 3. Duplicate Slug Analysis (28 Slugs / 56 Rows)

In every one of the 28 duplicate slug groups:
- Exactly **one** record is `status = 'published'`.
- Exactly **one** record is `status = 'draft'`.

For example, `aman-beaman`:
- Published UUID: `546bc23f-39f8-427d-9939-862dd881a25b` — Easter hymn (*"Aman Beaman / Tenes'a emnemutan"*)
- Draft UUID: `23f8f202-aba6-4d90-8e5f-e462e0568691` — Christmas hymn (*"Aman beAman / Menkir sibhate lidetu"*)

By switching from `WHERE slug = 'aman-beaman'` to `WHERE import_id = '546bc23f-39f8-427d-9939-862dd881a25b'::uuid`, the Easter hymn update targets only its intended record. The Christmas hymn draft remains untouched and uncorrupted.

All 28 duplicate slug pairs are documented in `DUPLICATE_SLUG_REVIEW.csv`.

---

## 4. Deliverables Index

All files are located in `supabase/mezmur-import/SAFE_MEZMUR_UPDATES/`:

1. `UUID_MAPPING.csv` — Complete mapping of all 1,121 updates to verified UUIDs with pre/post checksums.
2. `DUPLICATE_SLUG_REVIEW.csv` — Audit of all 28 duplicate slug pairs (56 records) with titles, statuses, and resolutions.
3. `CONCURRENCY_CONFLICTS.csv` — Concurrency baseline verification.
4. `ROLLBACK_INSTRUCTIONS.md` — Step-by-step procedures and inverse SQL for zero-downtime rollback.
5. `FINAL_VERIFICATION.sql` — Read-only verification query for Supabase SQL Editor.
6. `SAFE_UPDATE_BATCHES/` — 32 batched SQL files (`batch_01.sql` through `batch_32.sql`), 33-34 updates per batch with PL/pgSQL transaction guards.
