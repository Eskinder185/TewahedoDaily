"""Structural, losslessness, and metadata QA for the offline Mezmur proposal."""
import csv
import json
import sys
from pathlib import Path

source_path = Path(sys.argv[1])
out_dir = Path(sys.argv[2])


def read(name):
    with name.open(encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream)
        return reader.fieldnames, list(reader)


columns, source = read(source_path)
clean_columns, kept = read(out_dir / "mezmur_cleaned_classified.csv")
excluded_columns, excluded = read(out_dir / "mezmur_excluded_no_lyrics.csv")
_, audit = read(out_dir / "mezmur_classification_audit.csv")
_, changes = read(out_dir / "mezmur_lyric_changes.csv")
_, review = read(out_dir / "mezmur_manual_review.csv")
assert columns == clean_columns == excluded_columns
assert len(source) == len(kept) + len(excluded)
original_lyrics = ("lyrics_amharic", "lyrics_geez", "lyrics_english", "lyrics_oromo")
all_lyrics = (*original_lyrics, "lyrics_transliteration")
source_by_id = {row["import_id"]: row for row in source}
assert len(source_by_id) == len(source)
assert len({row["import_id"] for row in kept + excluded}) == len(source)
assert {row["import_id"] for row in kept + excluded} == set(source_by_id)
assert len(audit) == len(kept)
assert {row["import_id"] for row in audit} == {row["import_id"] for row in kept}


def sung_lines(text):
    return [line.strip() for line in text.replace("\r\n", "\n").replace("\r", "\n").split("\n")
            if line.strip() and not (len(line.strip()) >= 5 and set(line.strip()) <= set("-_="))]


allowed_updates = {"category", "additional_categories", "primary_occasion", "additional_occasions", "review_required", *all_lyrics}
for row in kept:
    before = source_by_id[row["import_id"]]
    assert any(before[field].strip() for field in original_lyrics)
    for field in columns:
        if field not in allowed_updates:
            assert row[field] == before[field], (row["import_id"], field)
    for field in all_lyrics:
        assert sung_lines(row[field]) == sung_lines(before[field]), (row["import_id"], field)
        assert row[field] == row[field].strip(), (row["import_id"], field)
        assert "\n\n\n" not in row[field], (row["import_id"], field)

for row in excluded:
    assert row == source_by_id[row["import_id"]]
    assert not any(row[field].strip() for field in original_lyrics)

changed_ids = {(row["import_id"], row["field"]) for row in changes}
for row in kept:
    before = source_by_id[row["import_id"]]
    for field in all_lyrics:
        assert (row[field] != before[field]) == ((row["import_id"], field) in changed_ids)
assert len(changed_ids) == len(changes)
assert {row["import_id"] for row in excluded} <= {row["import_id"] for row in review}

aliases = json.loads((out_dir / "mezmur_category_aliases.json").read_text(encoding="utf-8"))
hierarchy = json.loads((out_dir / "mezmur_category_hierarchy.json").read_text(encoding="utf-8"))
categories = {item["canonical"] for item in hierarchy["categories"]}
occasions = {item["canonical"] for item in hierarchy["occasions"]}
assert all(alias["canonical"] in (categories if alias["kind"] == "category" else occasions)
           for alias in aliases["aliases"])
assert all(not row["category"] or row["category"] in categories for row in kept)
assert all(not row["primary_occasion"] or row["primary_occasion"] in occasions for row in kept)
assert all(row["category"] == source_by_id[row["import_id"]]["category"] and
           row["primary_occasion"] == source_by_id[row["import_id"]]["primary_occasion"]
           for row in kept if row["review_status"] == "approved")
print(f"PASS: {len(source)} source = {len(kept)} retained + {len(excluded)} excluded; "
      f"{len(changes)} logged lyric edits; {len(audit)} audit rows; {len(review)} review rows")
