"""Fail-closed validation of package structure and exact source alignment."""
from __future__ import annotations

import json
from pathlib import Path


class PackageError(ValueError):
    pass


def require(condition: bool, message: str) -> None:
    if not condition:
        raise PackageError(message)


def package_path(root: Path, relative: str) -> Path:
    require(isinstance(relative, str), "Package path must be a string")
    path = (root / relative).resolve()
    require(not Path(relative).is_absolute() and path.is_relative_to(root.resolve()),
            "Package path escapes its root")
    return path


def read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def read_jsonl(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text(encoding="utf-8-sig").splitlines()
            if line.strip()]


def strict_flag(row: dict, key: str) -> bool:
    require(key in row and type(row[key]) is bool, f"{key} must be a JSON boolean")
    return row[key]


def validate_book(root: Path, entry: dict, source: dict[str, dict]) -> tuple[dict, list[dict]]:
    doc = entry["document_id"]
    strict_flag(entry, "approved_for_ingestion")
    book = read_json(package_path(root, entry["json"]))
    meta = book["metadata"]
    require(meta["document_id"] == doc, "Book/document identity mismatch")
    strict_flag(meta, "approved_for_ingestion")
    strict_flag(meta, "final_human_approval")
    paragraphs = book["paragraphs"]
    require(len(paragraphs) == entry["reading_records"], "Reading count mismatch")
    ids = [p["id"] for p in paragraphs]
    require(len(ids) == len(set(ids)), "Duplicate paragraph IDs")
    require([p["order"] for p in paragraphs] == list(range(1, len(ids) + 1)),
            "Paragraph order changed")
    require(paragraphs == read_jsonl(package_path(root, entry["jsonl"])), "JSON/JSONL drift")
    bilingual = read_jsonl(package_path(root, entry["bilingual_jsonl"]))
    require([p["id"] for p in bilingual] == ids, "Bilingual order/identity changed")
    sections = book["sections"]
    section_ids = [s["section_id"] for s in sections]
    require(len(section_ids) == len(set(section_ids)), "Duplicate section IDs")
    require([i for s in sections for i in s["unit_ids"]] == ids,
            "Section membership/order changed")
    section_by_id = {s["section_id"]: s for s in sections}
    for p, bi in zip(paragraphs, bilingual):
        strict_flag(p, "approved_for_ingestion")
        require(p["document_id"] == doc and p["section_id"] in section_by_id,
                "Invalid paragraph document/section")
        require(p["id"] in section_by_id[p["section_id"]]["unit_ids"], "Wrong section membership")
        require(p["language"] == "en" and bool(p["text"].strip()), "Invalid English reading")
        require(all(bi.get(k) == v for k, v in p.items()), "Bilingual English drift")
        for field in ("source_unit_ids", "reference_unit_ids", "context_unit_ids"):
            units = p.get(field, [])
            require(len(units) == len(set(units)) and all(i in source for i in units),
                    f"Invalid {field} in {p['id']}")
        require(all(source[i]["document_id"] == doc for i in p["source_unit_ids"]),
                "Cross-book source attribution")
        require(bi["source_records"] == [source[i] for i in p["source_unit_ids"]],
                "Original source bytes/fields changed")
        require(bi["reference_evidence"] == [dict(unit_id=i, text=source[i]["original_text"])
                                            for i in p["reference_unit_ids"]],
                "Reference evidence changed")
        require([loc["unit_id"] for loc in p["source_locations"]] == p["source_unit_ids"],
                "Source locator IDs changed")
        require(bool(p["content_segments"]), "Missing labeled content segments")
        require(all(s["kind"] in {"source_translation", "source_translation_or_source_layout_note",
                                   "original_English_reference", "new_F01_reference_explanation"}
                    and isinstance(s["text"], str) for s in p["content_segments"]),
                "Unknown or invalid content segment")
    return book, bilingual


def validate_catalog(root: Path, catalog: dict) -> list[tuple[dict, dict, list[dict]]]:
    strict_flag(catalog, "approved_for_ingestion")
    entries = catalog["books"]
    require({b["document_id"] for b in entries} == {"F01", "S01", "E01", "M01", "W01"}
            and len(entries) == 5, "Exactly five unique books required")
    rows = read_jsonl(root / "provenance/Source_Aligned_Paragraphs.jsonl")
    sources = {s["id"]: s for s in rows}
    require(len(sources) == len(rows), "Duplicate source IDs")
    require(all(s.get("source_language") == ("en" if s["document_id"] == "F01" else "am-with-Geʽez")
                for s in rows), "Unexpected source language")
    loaded = [(e, *validate_book(root, e, sources)) for e in entries]
    paragraphs = [p for _, b, _ in loaded for p in b["paragraphs"]]
    require(len({p["id"] for p in paragraphs}) == len(paragraphs), "Cross-book duplicate IDs")
    used = [i for p in paragraphs for i in p["source_unit_ids"]]
    require(len(used) == len(set(used)), "Source ID appears in multiple readings")
    require(set(used) == {s["id"] for s in rows if s["original_text"].strip()},
            "Nonblank source coverage differs")
    require(paragraphs == read_jsonl(root / "All_English_Paragraphs.jsonl"), "Aggregate English drift")
    require([p for _, _, bi in loaded for p in bi] == read_jsonl(root / "All_Bilingual_Paragraphs.jsonl"),
            "Aggregate bilingual drift")
    queue = read_json(root / "review/Human_Approval_Queue.json")
    issues = queue["unresolved_issues"]
    require(len(issues) == queue["unresolved_issue_count"], "Unresolved queue count drift")
    require(len({i["issue_id"] for i in issues}) == len(issues), "Duplicate unresolved issue")
    mapping = {p["id"]: set() for p in paragraphs}
    for issue in issues:
        strict_flag(issue, "approved_for_ingestion")
        for rid in issue["final_reading_ids"]:
            require(rid in mapping, "Queue links an unknown reading")
            mapping[rid].add(issue["issue_id"])
    require(all(set(p["unresolved_issue_ids"]) == mapping[p["id"]] for p in paragraphs),
            "Reading issue flags disagree with the human review queue")
    signoffs = queue["whole_book_final_signoffs"]
    require(len(signoffs) == 5 and {s["document_id"] for s in signoffs} == {e["document_id"] for e in entries},
            "Whole-book approval queue coverage differs")
    for signoff in signoffs:
        strict_flag(signoff, "approved")
    return loaded
