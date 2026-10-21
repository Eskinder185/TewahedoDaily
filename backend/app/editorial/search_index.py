from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Iterable, Optional

from .catalog import BookCatalog
from .models import ParagraphRecord

_TOKEN_RE = re.compile(r"[\w\u1200-\u137F]+", re.UNICODE)


def _tokens(text: str) -> set[str]:
    return {t.lower() for t in _TOKEN_RE.findall(text or "")}


@dataclass(frozen=True)
class SearchHit:
    paragraph_id: str
    document_id: str
    section_id: str
    score: float
    snippet_en: str
    has_amharic_source: bool
    content_kind: str
    approved_for_ingestion: bool


class BookSearchIndex:
    """Local lexical search over English readings + Ethiopic source text when present."""

    def __init__(self, catalog: BookCatalog):
        self.catalog = catalog
        self._docs: list[tuple[ParagraphRecord, set[str], str]] = []
        for para in catalog.iter_paragraphs():
            blob_parts = [para.text_en]
            if para.amharic_source_text:
                blob_parts.append(para.amharic_source_text)
            blob = "\n".join(blob_parts)
            self._docs.append((para, _tokens(blob), blob))

    def search(
        self,
        query: str,
        *,
        document_id: Optional[str] = None,
        content_kind: Optional[str] = None,
        has_amharic_source: Optional[bool] = None,
        limit: int = 20,
    ) -> list[SearchHit]:
        q_tokens = _tokens(query)
        if not q_tokens:
            return []
        hits: list[SearchHit] = []
        for para, tokens, blob in self._docs:
            if document_id and para.document_id != document_id:
                continue
            if content_kind and para.content_kind != content_kind:
                continue
            if has_amharic_source is not None and para.has_amharic_source is not has_amharic_source:
                continue
            overlap = q_tokens & tokens
            if not overlap:
                continue
            score = len(overlap) / len(q_tokens)
            snippet = para.text_en.strip()
            if len(snippet) > 220:
                snippet = snippet[:217] + "..."
            hits.append(
                SearchHit(
                    paragraph_id=para.id,
                    document_id=para.document_id,
                    section_id=para.section_id,
                    score=score,
                    snippet_en=snippet,
                    has_amharic_source=para.has_amharic_source,
                    content_kind=para.content_kind,
                    approved_for_ingestion=para.approved_for_ingestion,
                )
            )
        hits.sort(key=lambda h: (-h.score, h.document_id, h.paragraph_id))
        return hits[: max(0, limit)]

    def search_dicts(self, query: str, **kwargs) -> list[dict]:
        return [
            {
                "paragraph_id": h.paragraph_id,
                "document_id": h.document_id,
                "section_id": h.section_id,
                "score": h.score,
                "snippet_en": h.snippet_en,
                "has_amharic_source": h.has_amharic_source,
                "content_kind": h.content_kind,
                "approved_for_ingestion": h.approved_for_ingestion,
                "public_retrieval_eligible": False,
            }
            for h in self.search(query, **kwargs)
        ]
