"""Bounded reading responses; application pages are not original printed pages."""
from __future__ import annotations

from copy import deepcopy

from .catalog import BookCatalog


def paragraph_payload(catalog: BookCatalog, paragraph_id: str) -> dict:
    p = catalog.get_paragraph(paragraph_id)
    return {
        **deepcopy(p.raw),
        "text_en": p.text_en,
        "amharic_source_text": p.amharic_source_text,
        "source_records": [deepcopy(s.raw) for s in p.source_attributions],
        "reference_evidence": deepcopy(list(p.reference_evidence)),
        "visibility": "private_editorial_preview",
    }


def table_of_contents(catalog: BookCatalog, document_id: str) -> dict:
    b = catalog.get_book(document_id)
    return {
        "document_id": b.document_id, "title": b.title,
        "metadata": deepcopy(b.metadata), "languages_available": list(b.languages_available),
        "sections": [dict(section_id=s.section_id, title_en=s.title_en,
                          heading_level=s.heading_level, paragraph_count=len(s.unit_ids),
                          first_paragraph_id=s.unit_ids[0], last_paragraph_id=s.unit_ids[-1],
                          numbering_status=s.raw.get("numbering_status"),
                          title_source=s.raw.get("title_source")) for s in b.sections],
        "headings": [dict(paragraph_id=p.id, section_id=p.section_id, title_en=p.text_en,
                          level=p.heading_level) for p in b.paragraphs if p.role == "heading"],
        "pagination_kind": "application_paragraphs", "source_page_mapping": None,
        "published": False, "visibility": "private_editorial_preview",
    }


def reading_page(catalog: BookCatalog, document_id: str, *, section_id: str | None = None,
                 after: str | None = None, limit: int = 20) -> dict:
    if type(limit) is not int or not 1 <= limit <= 100:
        raise ValueError("limit must be between 1 and 100")
    book = catalog.get_book(document_id)
    paragraphs = (catalog.section_paragraphs(document_id, section_id) if section_id
                  else list(book.paragraphs))
    ids = [p.id for p in paragraphs]
    if after is not None and after not in ids:
        raise ValueError("Cursor does not belong to this book/section")
    start = ids.index(after) + 1 if after else 0
    selected = paragraphs[start:start + limit]
    end = start + len(selected)
    section_ids = [s.section_id for s in book.sections]
    section_index = section_ids.index(section_id) if section_id else None
    return {
        "document_id": document_id, "title": book.title, "section_id": section_id,
        "items": [paragraph_payload(catalog, p.id) for p in selected],
        "page": {"limit": limit, "total_paragraphs": len(ids),
                 "next_after": ids[end - 1] if selected and end < len(ids) else None,
                 "previous_after": ids[start - limit - 1] if start > limit else None,
                 "has_previous": start > 0, "has_next": end < len(ids)},
        "navigation": {
            "previous_paragraph_id": ids[start - 1] if start else None,
            "next_paragraph_id": ids[end] if end < len(ids) else None,
            "previous_section_id": section_ids[section_index - 1] if section_index else None,
            "next_section_id": section_ids[section_index + 1]
            if section_index is not None and section_index + 1 < len(section_ids) else None,
        },
        "pagination_kind": "application_paragraphs", "source_page_mapping": None,
        "visibility": "private_editorial_preview", "published": False,
    }
