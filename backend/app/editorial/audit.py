"""Read-only package audit: python -m editorial.audit --root content-review --zip content-review.zip."""
from __future__ import annotations

import argparse
from collections import Counter
import csv
from dataclasses import asdict
import hashlib
import json
from pathlib import Path
import xml.etree.ElementTree as ET
import zipfile

from .catalog import load_catalog
from .integrity import verify_package_integrity
from .validation import read_json, read_jsonl, package_path, require


def audit(root: Path, zip_path: Path | None = None) -> dict:
    root = root.resolve()
    checks = []
    def check(name, fn):
        try:
            evidence = fn()
            checks.append(dict(check=name, passed=True, evidence=evidence))
        except Exception as exc:
            checks.append(dict(check=name, passed=False, error=f"{type(exc).__name__}: {exc}"))

    def integrity():
        report = verify_package_integrity(root, zip_path=zip_path, require_zip=zip_path is not None)
        require(report.ok, str(asdict(report)))
        return dict(manifest_files=report.sha256_matched, zip_crc_ok=report.zip_crc_ok)
    check("package_hashes_and_zip_bytes", integrity)

    def parse_every_file():
        counts = Counter()
        for p in root.rglob("*"):
            if not p.is_file(): continue
            if p.suffix == ".json": read_json(p)
            elif p.suffix == ".jsonl": read_jsonl(p)
            elif p.suffix == ".csv":
                with p.open(encoding="utf-8-sig", newline="") as f: list(csv.DictReader(f))
            else: p.read_text(encoding="utf-8-sig")
            counts[p.suffix] += 1
        return dict(counts)
    check("read_all_package_files", parse_every_file)

    def book_alignment():
        c = load_catalog(str(root))
        result = []
        for b in c.books:
            entry = next(e for e in c.catalog_meta["books"] if e["document_id"] == b.document_id)
            md = package_path(root, entry["markdown"]).read_text(encoding="utf-8")
            txt = package_path(root, entry["plain_text"]).read_text(encoding="utf-8")
            for p in b.paragraphs:
                require(p.text_en.strip() in txt, f"{p.id} missing from text edition")
                if not p.raw.get("table_coordinates"):
                    require(p.id in md, f"{p.id} missing Markdown anchor")
            result.append(dict(document_id=b.document_id, title=b.title, paragraphs=len(b.paragraphs),
                               sections=len(b.sections), languages=list(b.languages_available),
                               approved_for_ingestion=b.package_approved_for_ingestion,
                               final_human_approval=b.metadata["final_human_approval"]))
        return result
    check("all_five_books_order_source_reference_alignment_and_exports", book_alignment)

    sources = read_jsonl(root / "provenance/Source_Aligned_Paragraphs.jsonl")
    readings = read_jsonl(root / "All_English_Paragraphs.jsonl")

    def originals():
        result = []
        ns = {"w":"http://schemas.openxmlformats.org/wordprocessingml/2006/main"}
        for item in read_json(root / "Source_Inventory.json"):
            p = Path(item["source_path"])
            require(p.is_file(), f"External original unavailable: {p}")
            require(hashlib.sha256(p.read_bytes()).hexdigest() == item["sha256"], "Original DOCX hash differs")
            with zipfile.ZipFile(p) as z:
                body = ET.fromstring(z.read("word/document.xml")).find("w:body", ns)
            actual = ["".join(t.text or "" for t in para.iter("{" + ns["w"] + "}t"))
                      for para in body.iter("{" + ns["w"] + "}p")]
            archived = [s["original_text"] for s in sources if s["document_id"] == item["document_id"]]
            require(actual == archived, "Original DOCX paragraphs differ")
            result.append(dict(document_id=item["document_id"], paragraphs=len(actual), sha256=item["sha256"]))
        for rel, expected in read_json(root / "audit/Preserved_Input_Hashes.json")["immutable_files"].items():
            require(hashlib.sha256(package_path(root, rel).read_bytes()).hexdigest() == expected, "Preserved input changed")
        return result
    check("original_docx_hashes_xml_and_immutable_reference_files", originals)

    def source_layout():
        lookup = {s["id"]:s for s in sources}
        table = read_json(root / "Table_Layout.json")
        reading_lookup = {p["id"]:p for p in readings}
        for cell in table:
            original = lookup[cell["source_unit_id"]]
            require(cell["original_text"] == original["original_text"], "Table text changed")
            require(cell["table_coordinates"] == original["table_coordinates"], "Table coordinate changed")
            if cell["blank_layout"]: require(cell["reading_id"] is None, "Blank cell fabricated")
            else: require(reading_lookup[cell["reading_id"]]["table_coordinates"] == original["table_coordinates"], "Reading table position changed")
        return dict(source_records=len(sources), nonblank=sum(bool(s["original_text"].strip()) for s in sources),
                    table_positions=len(table), blank_table_positions=sum(c["blank_layout"] for c in table))
    check("source_coverage_and_matthew_table_coordinates", source_layout)

    def queues():
        q = read_json(root / "review/Human_Approval_Queue.json")
        md = (root / "UNRESOLVED_REVIEW_QUEUE.md").read_text(encoding="utf-8")
        issues = q["unresolved_issues"]
        require(len(q["whole_book_final_signoffs"]) == 5, "Five whole-book signoffs required")
        require(len(issues) == q["unresolved_issue_count"], "Queue count differs")
        require(all(i["issue_id"] in md for i in issues), "Unresolved Markdown queue missing issue")
        flags = read_jsonl(root / "review/Flag_Dispositions.jsonl")
        require(len({f["issue_id"] for f in flags}) == 940, "Inherited flag coverage differs")
        # All current content remains held, including records without individual issue IDs.
        require(all(p["approved_for_ingestion"] is False for p in readings), "Unexpected approval")
        return dict(unresolved_issue_records=len(issues), whole_book_signoffs=5,
                    human_queue_entries=len(issues) + 5, statuses=dict(Counter(i["final_status"] for i in issues)),
                    inherited_flags=len(flags), human_queue_keys=list(q), theological_approval=False)
    check("unresolved_queues_and_no_approval", queues)

    def change_lineage():
        changes = read_jsonl(root / "REFERENCE_CHANGE_LOG.jsonl")
        reading_lookup = {p["id"]:p for p in readings}
        source_lookup = {s["id"]:s for s in sources}
        for change in changes:
            require(change["applied"] is True, "Unapplied correction")
            for rid in change["affected_reading_ids"]:
                require(change["change_id"] in reading_lookup[rid]["revision_ids"], "Lost revision lineage")
            for ref in change["reference_evidence"]:
                require(ref["text"] == source_lookup[ref["unit_id"]]["original_text"], "Reference quotation drift")
        return dict(changes=len(changes), supplements=sum(p["role"] == "reference_supplement" for p in readings),
                    explanation_segments=sum(s["kind"] == "new_F01_reference_explanation" for p in readings for s in p["content_segments"]))
    check("revision_lineage_and_separate_explanation_labels", change_lineage)

    return dict(passed=all(c["passed"] for c in checks), checks=checks,
                limits=["Structural/source fidelity checks do not grant theological or linguistic approval.",
                        "Application pagination is not original PDF/printed page mapping."])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--zip", type=Path)
    args = parser.parse_args()
    report = audit(args.root, args.zip)
    print(json.dumps(report, ensure_ascii=False, indent=2))
    raise SystemExit(0 if report["passed"] else 1)


if __name__ == "__main__": main()
