from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Any, Iterable, Optional

from .models import (
    BookRecord,
    ContentKind,
    ContentSegment,
    ParagraphRecord,
    SectionRecord,
    SourceAttribution,
)
from .paths import content_review_root
from .validation import validate_catalog

_ETHIOPIC_RE = re.compile(r"[\u1200-\u137F]")


def _has_ethiopic(text: str) -> bool:
    return bool(_ETHIOPIC_RE.search(text or ""))


def _load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def _load_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for line in path.read_text(encoding="utf-8-sig").splitlines():
        if line.strip():
            rows.append(json.loads(line))
    return rows


def _classify_content_kind(para: dict[str, Any]) -> ContentKind:
    role = para.get("role") or ""
    origin = para.get("content_origin") or ""
    if role == "reference_supplement":
        return "reference_supplement"
    segments = para.get("content_segments") or []
    kinds = {s.get("kind") for s in segments if isinstance(s, dict)}
    if "new_F01_reference_explanation" in kinds:
        return "added_explanation"
    if "reference_original_English" in kinds or origin == "reference_original_English":
        return "english_reading"
    if origin.startswith("translation") or "translation" in origin:
        return "english_reading"
    if para.get("source_unit_ids"):
        return "english_reading"
    return "other"


def _segments(para: dict[str, Any]) -> tuple[ContentSegment, ...]:
    out: list[ContentSegment] = []
    for seg in para.get("content_segments") or []:
        if not isinstance(seg, dict):
            continue
        out.append(
            ContentSegment(
                kind=str(seg.get("kind") or "unknown"),
                text=str(seg.get("text") or ""),
                reference_unit_ids=tuple(seg.get("reference_unit_ids") or ()),
            )
        )
    return tuple(out)


def _source_attributions(
    para: dict[str, Any],
    bilingual_by_id: dict[str, dict[str, Any]],
) -> tuple[SourceAttribution, ...]:
    bi = bilingual_by_id.get(para["id"])
    records = (bi or {}).get("source_records") or []
    out: list[SourceAttribution] = []
    for sr in records:
        if not isinstance(sr, dict):
            continue
        original = str(sr.get("original_text") or "")
        out.append(
            SourceAttribution(
                unit_id=str(sr.get("id") or ""),
                source_language=sr.get("source_language") or sr.get("language"),
                original_text=original,
                has_ethiopic=_has_ethiopic(original),
                raw=sr,
            )
        )
    return tuple(out)


def _paragraph_from_row(
    para: dict[str, Any],
    bilingual_by_id: dict[str, dict[str, Any]],
) -> ParagraphRecord:
    return ParagraphRecord(
        id=para["id"],
        document_id=para["document_id"],
        section_id=para["section_id"],
        order=int(para["order"]),
        role=str(para.get("role") or ""),
        text_en=str(para.get("text") or ""),
        language=str(para.get("language") or "en"),
        content_origin=str(para.get("content_origin") or ""),
        content_kind=_classify_content_kind(para),
        approved_for_ingestion=para.get("approved_for_ingestion") is True,
        approval_status=str(para.get("approval_status") or ""),
        source_unit_ids=tuple(para.get("source_unit_ids") or ()),
        reference_unit_ids=tuple(para.get("reference_unit_ids") or ()),
        unresolved_issue_ids=tuple(para.get("unresolved_issue_ids") or ()),
        revision_ids=tuple(para.get("revision_ids") or ()),
        review_issue_ids=tuple(para.get("review_issue_ids") or ()),
        content_segments=_segments(para),
        source_attributions=_source_attributions(para, bilingual_by_id),
        heading_level=para.get("heading_level"),
        reference_evidence=tuple(bilingual_by_id[para["id"]].get("reference_evidence", [])),
        raw=para,
    )


class BookCatalog:
    """In-memory catalog of the five editorial books (English readings + source attribution)."""

    def __init__(self, root: Path, books: tuple[BookRecord, ...], catalog_meta: dict[str, Any],
                 approval_queue: Optional[dict[str, Any]] = None):
        self.root = root
        self.books = books
        self.catalog_meta = catalog_meta
        self.approval_queue = approval_queue or {}
        self._by_doc = {b.document_id: b for b in books}
        self._paragraphs = {p.id: p for b in books for p in b.paragraphs}

    @property
    def package_approved_for_ingestion(self) -> bool:
        return self.catalog_meta.get("approved_for_ingestion") is True

    def list_books(self) -> list[dict[str, Any]]:
        return [
            {
                "document_id": b.document_id,
                "title": b.title,
                "section_count": len(b.sections),
                "paragraph_count": len(b.paragraphs),
                "languages_available": list(b.languages_available),
                "package_approved_for_ingestion": b.package_approved_for_ingestion,
                "content_status": b.metadata.get("content_status"),
                "final_human_approval": b.metadata.get("final_human_approval"),
            }
            for b in self.books
        ]

    def get_book(self, document_id: str) -> BookRecord:
        try:
            return self._by_doc[document_id]
        except KeyError as exc:
            raise KeyError(f"Unknown document_id: {document_id}") from exc

    def get_paragraph(self, paragraph_id: str) -> ParagraphRecord:
        try:
            return self._paragraphs[paragraph_id]
        except KeyError as exc:
            raise KeyError(f"Unknown paragraph_id: {paragraph_id}") from exc

    def iter_paragraphs(self, document_id: Optional[str] = None) -> Iterable[ParagraphRecord]:
        if document_id is None:
            for book in self.books:
                yield from book.paragraphs
            return
        yield from self.get_book(document_id).paragraphs

    def section_paragraphs(self, document_id: str, section_id: str) -> list[ParagraphRecord]:
        book = self.get_book(document_id)
        section = next((s for s in book.sections if s.section_id == section_id), None)
        if section is None:
            raise KeyError(f"Unknown section_id: {section_id}")
        by_id = {p.id: p for p in book.paragraphs}
        return [by_id[uid] for uid in section.unit_ids if uid in by_id]

    def preview_payload(
        self,
        document_id: str,
        *,
        include_amharic_source: bool = True,
    ) -> dict[str, Any]:
        book = self.get_book(document_id)
        sections_out = []
        for section in book.sections:
            paras = self.section_paragraphs(document_id, section.section_id)
            sections_out.append(
                {
                    "section_id": section.section_id,
                    "title_en": section.title_en,
                    "heading_level": section.heading_level,
                    "human_review": section.human_review,
                    "paragraphs": [
                        {
                            "id": p.id,
                            "order": p.order,
                            "role": p.role,
                            "content_kind": p.content_kind,
                            "content_origin": p.content_origin,
                            "text_en": p.text_en,
                            "language": p.language,
                            "approved_for_ingestion": p.approved_for_ingestion,
                            "approval_status": p.approval_status,
                            "source_unit_ids": list(p.source_unit_ids),
                            "reference_unit_ids": list(p.reference_unit_ids),
                            "unresolved_issue_ids": list(p.unresolved_issue_ids),
                            "revision_ids": list(p.revision_ids),
                            "content_segments": [
                                {
                                    "kind": s.kind,
                                    "text": s.text,
                                    "reference_unit_ids": list(s.reference_unit_ids),
                                }
                                for s in p.content_segments
                            ],
                            "amharic_source_text": (
                                p.amharic_source_text if include_amharic_source else None
                            ),
                            "has_amharic_source": p.has_amharic_source,
                            "note": (
                                None
                                if p.has_amharic_source
                                else (
                                    "No Ethiopic source text is attached to this reading "
                                    "record; English must not be presented as a completed "
                                    "Amharic translation."
                                )
                            ),
                        }
                        for p in paras
                    ],
                }
            )
        return {
            "document_id": book.document_id,
            "title": book.title,
            "languages_available": list(book.languages_available),
            "package_approved_for_ingestion": book.package_approved_for_ingestion,
            "metadata": {
                "content_status": book.metadata.get("content_status"),
                "final_human_approval": book.metadata.get("final_human_approval"),
                "quotation_policy": book.metadata.get("quotation_policy"),
                "added_material_policy": book.metadata.get("added_material_policy"),
            },
            "sections": sections_out,
            "visibility": "private_editorial_preview",
            "published": False,
        }


def _load_book(root: Path, entry: dict[str, Any], book_json: dict, bilingual_rows: list) -> BookRecord:
    bilingual_by_id = {r["id"]: r for r in bilingual_rows}
    paragraphs = tuple(
        _paragraph_from_row(p, bilingual_by_id) for p in book_json.get("paragraphs") or []
    )
    sections = tuple(
        SectionRecord(
            section_id=s["section_id"],
            document_id=entry["document_id"],
            title_en=str(s.get("title_en") or ""),
            unit_ids=tuple(s.get("unit_ids") or ()),
            heading_level=int(s.get("heading_level") or 2),
            human_review=str(s.get("human_review") or ""),
            raw=s,
        )
        for s in book_json.get("sections") or []
    )
    return BookRecord(
        document_id=entry["document_id"],
        title=str(entry.get("title") or book_json.get("metadata", {}).get("title_en") or ""),
        package_approved_for_ingestion=entry.get("approved_for_ingestion") is True,
        sections=sections,
        paragraphs=paragraphs,
        metadata=dict(book_json.get("metadata") or {}),
    )


def load_catalog(root_str: Optional[str] = None) -> BookCatalog:
    root = Path(root_str) if root_str else content_review_root()
    root = root.resolve()
    catalog = _load_json(root / "Catalog.json")
    books = tuple(_load_book(root, entry, book, bi)
                  for entry, book, bi in validate_catalog(root, catalog))
    return BookCatalog(root=root, books=books, catalog_meta=catalog,
                       approval_queue=_load_json(root / "review/Human_Approval_Queue.json"))


def clear_catalog_cache() -> None:
    # Approval/revocation state must be read afresh. Kept for existing callers.
    pass
