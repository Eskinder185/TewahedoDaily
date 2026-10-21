from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Literal, Optional

ContentKind = Literal[
    "original_source",
    "english_reading",
    "reference_supplement",
    "added_explanation",
    "other",
]


@dataclass(frozen=True)
class ContentSegment:
    kind: str
    text: str
    reference_unit_ids: tuple[str, ...] = ()


@dataclass(frozen=True)
class SourceAttribution:
    unit_id: str
    source_language: Optional[str]
    original_text: str
    has_ethiopic: bool
    raw: dict[str, Any] = field(default_factory=dict, repr=False)


@dataclass(frozen=True)
class ParagraphRecord:
    id: str
    document_id: str
    section_id: str
    order: int
    role: str
    text_en: str
    language: str
    content_origin: str
    content_kind: ContentKind
    approved_for_ingestion: bool
    approval_status: str
    source_unit_ids: tuple[str, ...]
    reference_unit_ids: tuple[str, ...]
    unresolved_issue_ids: tuple[str, ...]
    revision_ids: tuple[str, ...]
    review_issue_ids: tuple[str, ...]
    content_segments: tuple[ContentSegment, ...]
    source_attributions: tuple[SourceAttribution, ...]
    heading_level: Optional[int] = None
    reference_evidence: tuple[dict[str, Any], ...] = ()
    raw: dict[str, Any] = field(default_factory=dict, repr=False)

    @property
    def has_amharic_source(self) -> bool:
        return any(s.has_ethiopic for s in self.source_attributions)

    @property
    def amharic_source_text(self) -> Optional[str]:
        parts = [s.original_text for s in self.source_attributions if s.has_ethiopic]
        if not parts:
            return None
        return "\n".join(parts)


@dataclass(frozen=True)
class SectionRecord:
    section_id: str
    document_id: str
    title_en: str
    unit_ids: tuple[str, ...]
    heading_level: int
    human_review: str
    raw: dict[str, Any] = field(default_factory=dict, repr=False)


@dataclass(frozen=True)
class BookRecord:
    document_id: str
    title: str
    package_approved_for_ingestion: bool
    sections: tuple[SectionRecord, ...]
    paragraphs: tuple[ParagraphRecord, ...]
    metadata: dict[str, Any] = field(default_factory=dict, repr=False)

    @property
    def languages_available(self) -> tuple[str, ...]:
        langs: list[str] = []
        if any(p.text_en.strip() for p in self.paragraphs):
            langs.append("en")
        if any(p.has_amharic_source for p in self.paragraphs):
            langs.append("am-source")
        return tuple(langs)
