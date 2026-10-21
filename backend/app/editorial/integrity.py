from __future__ import annotations

import hashlib
import json
import zipfile
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Optional

from .paths import companion_zip_path, content_review_root
from .validation import package_path, strict_flag


@dataclass
class IntegrityReport:
    ok: bool
    package_root: str
    file_count: int
    sha256_matched: int
    sha256_mismatched: list[str] = field(default_factory=list)
    sha256_missing: list[str] = field(default_factory=list)
    catalog_books: list[dict[str, Any]] = field(default_factory=list)
    package_approved_for_ingestion: bool = False
    all_paragraphs_ingestion_false: Optional[bool] = None
    paragraphs_checked: int = 0
    zip_crc_ok: Optional[bool] = None
    zip_root_name: Optional[str] = None
    zip_notes: list[str] = field(default_factory=list)
    errors: list[str] = field(default_factory=list)


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verify_package_integrity(
    root: Optional[Path] = None,
    *,
    zip_path: Optional[Path] = None,
    require_zip: bool = False,
) -> IntegrityReport:
    """Verify SHA256SUMS + Catalog; optionally check companion ZIP CRC/bytes.

    Does not mutate package files. Does not flip approval flags.
    """
    package = (root or content_review_root()).resolve()
    report = IntegrityReport(ok=False, package_root=str(package), file_count=0, sha256_matched=0)

    if not package.is_dir():
        report.errors.append(f"Package root missing: {package}")
        return report

    sums = package / "SHA256SUMS.txt"
    catalog_path = package / "Catalog.json"
    if not sums.is_file():
        report.errors.append("SHA256SUMS.txt missing")
        return report
    if not catalog_path.is_file():
        report.errors.append("Catalog.json missing")
        return report

    catalog = json.loads(catalog_path.read_text(encoding="utf-8-sig"))
    report.package_approved_for_ingestion = strict_flag(catalog, "approved_for_ingestion")
    report.catalog_books = [
        {
            "document_id": b.get("document_id"),
            "title": b.get("title"),
            "reading_records": b.get("reading_records"),
            "approved_for_ingestion": b.get("approved_for_ingestion"),
            "json": b.get("json"),
        }
        for b in catalog.get("books", [])
    ]

    for line in sums.read_text(encoding="utf-8").splitlines():
        if not line.strip():
            continue
        digest, rel = line.split("  ", 1)
        path = package_path(package, rel)
        if not path.is_file():
            report.sha256_missing.append(rel)
            continue
        if _sha256(path) != digest:
            report.sha256_mismatched.append(rel)
        else:
            report.sha256_matched += 1

    files = {
        p.relative_to(package).as_posix()
        for p in package.rglob("*")
        if p.is_file() and p.name != "SHA256SUMS.txt"
    }
    report.file_count = len(files)
    manifest = {
        line.split("  ", 1)[1]
        for line in sums.read_text(encoding="utf-8").splitlines()
        if line.strip()
    }
    if files != manifest:
        report.errors.append(
            f"Manifest coverage mismatch: extra={sorted(files - manifest)[:5]} "
            f"absent={sorted(manifest - files)[:5]}"
        )

    # Confirm every reading paragraph still has approved_for_ingestion=false.
    readings = package / "All_English_Paragraphs.jsonl"
    if readings.is_file():
        bad = 0
        checked = 0
        for line in readings.read_text(encoding="utf-8-sig").splitlines():
            if not line.strip():
                continue
            row = json.loads(line)
            checked += 1
            if row.get("approved_for_ingestion") is not False:
                bad += 1
        report.paragraphs_checked = checked
        report.all_paragraphs_ingestion_false = bad == 0
        if bad:
            report.errors.append(
                f"{bad} paragraphs do not have approved_for_ingestion=false"
            )

    if report.package_approved_for_ingestion:
        report.errors.append("Catalog.approved_for_ingestion is unexpectedly true")

    zpath = zip_path or companion_zip_path()
    if zpath.is_file():
        try:
            with zipfile.ZipFile(zpath) as zf:
                report.zip_crc_ok = zf.testzip() is None
                names = zf.namelist()
                if names:
                    report.zip_root_name = names[0].split("/", 1)[0]
                # Compare member payloads to package files ignoring ZIP root folder name.
                member_map = {}
                for name in names:
                    if name.endswith("/"):
                        continue
                    relative = name.split("/", 1)[-1]
                    if relative in member_map:
                        report.errors.append(f"Duplicate ZIP member: {relative}")
                    member_map[relative] = name
                if set(member_map) != manifest | {"SHA256SUMS.txt"}:
                    report.errors.append("ZIP member coverage mismatch")
                for line in sums.read_text(encoding="utf-8").splitlines():
                    if not line.strip():
                        continue
                    _digest, rel = line.split("  ", 1)
                    member = member_map.get(rel)
                    if member is None:
                        report.errors.append(f"ZIP missing member for {rel}")
                        continue
                    if zf.read(member) != (package / rel).read_bytes():
                        report.errors.append(f"ZIP byte mismatch for {rel}")
                manifest_member = member_map.get("SHA256SUMS.txt")
                if manifest_member and zf.read(manifest_member) != sums.read_bytes():
                    report.errors.append("ZIP manifest bytes differ")
                if report.zip_crc_ok and not any("ZIP" in e for e in report.errors):
                    report.zip_notes.append(
                        "ZIP CRC and file bytes match package "
                        f"(ZIP root folder name is {report.zip_root_name!r}; "
                        "directory is content-review/)."
                    )
                elif not report.zip_crc_ok:
                    report.errors.append("ZIP CRC failure")
        except zipfile.BadZipFile as exc:
            report.errors.append(f"Bad ZIP: {exc}")
    elif require_zip:
        report.errors.append(f"Companion ZIP required but missing: {zpath}")
    else:
        report.zip_notes.append(
            f"Companion ZIP not present at {zpath}; file SHA256SUMS still verified."
        )

    report.ok = (
        not report.errors
        and not report.sha256_mismatched
        and not report.sha256_missing
        and report.sha256_matched == len(manifest)
        and report.all_paragraphs_ingestion_false is True
    )
    return report
