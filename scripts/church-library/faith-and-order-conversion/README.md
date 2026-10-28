# Faith and Order conversion pipeline

Deterministic: the same DOCX always produces the same passages and IDs. Requires `python-docx`.

```bash
SRC="path/to/The Faith And Order Of The Church (2)(4).docx"
OUT=data/church-library/faith-and-order
D=scripts/church-library/faith-and-order-conversion
python3 -I $D/build_kb.py "$SRC" $OUT            # JSONL, CSV, sections, aliases (+ _build_stats.json)
python3 -I $D/make_manifest.py $OUT
python3 -I $D/make_alias_seed.py supabase/church-library/PROPOSED_20261028_church_library_search_aliases_seed.sql
python3 -I $D/validate.py "$SRC" $OUT            # writes church_faith_and_order_validation.md; exits 1 on any failure
# after scripts/church-library/local-search-test/run.sh:
python3 -I $D/make_test_report.py scripts/church-library/local-search-test/report.json $OUT/church_faith_and_order_search_tests.md
```

`aliases.py` holds the reviewed multilingual vocabulary. `build_kb.py` holds the reviewed sub-heading indexes, page-break
re-joins and typo flags for this specific source file.
