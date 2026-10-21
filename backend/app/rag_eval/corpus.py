from __future__ import annotations

from dataclasses import asdict, dataclass
from typing import Any, Iterable, Optional

from editorial.catalog import BookCatalog, load_catalog
from editorial.paths import content_review_root


@dataclass(frozen=True)
class EvalPassage:
    """Indexed unit for private RAG eval — preserves package identifiers."""

    point_id: str
    paragraph_id: str
    document_id: str
    book_title: str
    section_id: str
    section_title: str
    paragraph_order: int
    role: str
    content_kind: str
    content_origin: str
    language: str
    text: str
    text_en: str
    amharic_source_text: Optional[str]
    has_amharic_source: bool
    source_unit_ids: tuple[str, ...]
    reference_unit_ids: tuple[str, ...]
    approved_for_ingestion: bool
    unresolved_issue_ids: tuple[str, ...]
    research_only: bool = True
    official_church_teaching: bool = False

    def payload(self) -> dict[str, Any]:
        data = asdict(self)
        data["source_unit_ids"] = list(self.source_unit_ids)
        data["reference_unit_ids"] = list(self.reference_unit_ids)
        data["unresolved_issue_ids"] = list(self.unresolved_issue_ids)
        return data


def load_eval_corpus(
    root: Optional[str] = None,
    *,
    include_amharic_source_as_separate: bool = True,
) -> list[EvalPassage]:
    """Load real five-book readings into eval passages (unapproved drafts allowed)."""
    catalog = load_catalog(root or str(content_review_root()))
    return passages_from_catalog(
        catalog, include_amharic_source_as_separate=include_amharic_source_as_separate
    )


def passages_from_catalog(
    catalog: BookCatalog,
    *,
    include_amharic_source_as_separate: bool = True,
) -> list[EvalPassage]:
    out: list[EvalPassage] = []
    for book in catalog.books:
        section_titles = {s.section_id: s.title_en for s in book.sections}
        for para in book.paragraphs:
            if not (para.text_en or "").strip():
                continue
            out.append(
                EvalPassage(
                    point_id=f"en:{para.document_id}:{para.id}",
                    paragraph_id=para.id,
                    document_id=para.document_id,
                    book_title=book.title,
                    section_id=para.section_id,
                    section_title=section_titles.get(para.section_id, ""),
                    paragraph_order=para.order,
                    role=para.role,
                    content_kind=para.content_kind,
                    content_origin=para.content_origin,
                    language="en",
                    text=para.text_en,
                    text_en=para.text_en,
                    amharic_source_text=para.amharic_source_text,
                    has_amharic_source=para.has_amharic_source,
                    source_unit_ids=para.source_unit_ids,
                    reference_unit_ids=para.reference_unit_ids,
                    approved_for_ingestion=para.approved_for_ingestion,
                    unresolved_issue_ids=para.unresolved_issue_ids,
                )
            )
            if (
                include_amharic_source_as_separate
                and para.amharic_source_text
                and para.amharic_source_text.strip()
            ):
                out.append(
                    EvalPassage(
                        point_id=f"am-source:{para.document_id}:{para.id}",
                        paragraph_id=para.id,
                        document_id=para.document_id,
                        book_title=book.title,
                        section_id=para.section_id,
                        section_title=section_titles.get(para.section_id, ""),
                        paragraph_order=para.order,
                        role=para.role,
                        content_kind="original_source",
                        content_origin=para.content_origin,
                        language="am-source",
                        text=para.amharic_source_text,
                        text_en=para.text_en,
                        amharic_source_text=para.amharic_source_text,
                        has_amharic_source=True,
                        source_unit_ids=para.source_unit_ids,
                        reference_unit_ids=para.reference_unit_ids,
                        approved_for_ingestion=para.approved_for_ingestion,
                        unresolved_issue_ids=para.unresolved_issue_ids,
                    )
                )
    return out


def corpus_stats(passages: Iterable[EvalPassage]) -> dict[str, Any]:
    rows = list(passages)
    return {
        "passage_count": len(rows),
        "documents": sorted({p.document_id for p in rows}),
        "languages": sorted({p.language for p in rows}),
        "approved_for_ingestion_true": sum(1 for p in rows if p.approved_for_ingestion),
        "with_amharic_source": sum(1 for p in rows if p.has_amharic_source),
        "research_only": all(p.research_only for p in rows),
        "official_church_teaching_claims": sum(
            1 for p in rows if p.official_church_teaching
        ),
    }
