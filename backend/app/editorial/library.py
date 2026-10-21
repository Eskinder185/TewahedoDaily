"""Frontend-ready approved variants, with no public router mounted."""
from __future__ import annotations

from .catalog import BookCatalog
from .ingestion import build_ingest_candidates, filter_approved
from .release import ReleaseManifest
from .search_index import _tokens


def released_candidates(catalog, store=None, release=None):
    return filter_approved(build_ingest_candidates(catalog), catalog, store, release)


def citation(candidate) -> dict:
    p = candidate.payload
    return {k: p[k] for k in ("document_id", "book_title", "section_id", "section_title",
                              "paragraph_id", "paragraph_order", "language", "source_language",
                              "content_kind", "source_unit_ids", "reference_unit_ids",
                              "context_unit_ids", "source_locations", "content_sha256")}


class ApprovedBookLibrary:
    def __init__(self, catalog: BookCatalog, *, release: ReleaseManifest | None = None, store=None):
        self.catalog, self.release, self.store = catalog, release, store

    def _candidates(self, *, language=None, content_kind=None):
        if language not in {None, "en", "am"}:
            raise ValueError("language must be en or am")
        return [c for c in released_candidates(self.catalog, self.store, self.release)
                if (language is None or c.language == language)
                and (content_kind is None or c.content_kind == content_kind)]

    def catalog_payload(self) -> dict:
        allowed = self._candidates()
        books = []
        for book in self.catalog.books:
            items = [c for c in allowed if c.document_id == book.document_id]
            if items:
                books.append(dict(document_id=book.document_id, title=book.title,
                                  languages=sorted({c.language for c in items}),
                                  paragraph_count=len({c.paragraph_id for c in items}),
                                  sections=[dict(section_id=s.section_id, title=s.title_en)
                                            for s in book.sections if any(c.section_id == s.section_id for c in items)]))
        return {"books": books, "visibility": "approved_only"}

    def reading_page(self, document_id, *, section_id=None, language="en",
                     content_kind="translation", after=None, limit=20):
        if type(limit) is not int or not 1 <= limit <= 100:
            raise ValueError("limit must be between 1 and 100")
        items = [c for c in self._candidates(language=language, content_kind=content_kind)
                 if c.document_id == document_id and (section_id is None or c.section_id == section_id)]
        ids = [c.point_id for c in items]
        if after is not None and after not in ids:
            raise ValueError("Unknown approved cursor")
        start = ids.index(after) + 1 if after else 0
        selected = items[start:start + limit]
        end = start + len(selected)
        return {"items": [dict(point_id=c.point_id, text=c.text, citation=citation(c)) for c in selected],
                "next_after": ids[end - 1] if selected and end < len(ids) else None,
                "previous_after": ids[start - limit - 1] if start > limit else None,
                "has_previous": start > 0, "has_next": end < len(ids),
                "pagination_kind": "application_variants", "source_page_mapping": None,
                "visibility": "approved_only"}

    def search(self, query, *, language=None, document_id=None, limit=5):
        if type(limit) is not int or not 1 <= limit <= 100 or len(query) > 500:
            raise ValueError("Invalid search bounds")
        tokens = _tokens(query)
        if not tokens:
            return []
        hits = []
        for c in self._candidates(language=language):
            if document_id is not None and c.document_id != document_id:
                continue
            score = len(tokens & _tokens(c.text)) / len(tokens)
            if score:
                hits.append(dict(point_id=c.point_id, text=c.text, score=score, **citation(c)))
        hits.sort(key=lambda h: (-h["score"], h["document_id"], h["paragraph_order"], h["point_id"]))
        return hits[:limit]

    def verify_vector_hits(self, hits):
        """Hydrate current allowlisted text; never trust stale vector payload text."""
        allowed = {c.point_id: c for c in self._candidates()}
        result, seen = [], set()
        for hit in hits:
            c = allowed.get(str(hit["id"]))
            if c is None or c.point_id in seen:
                continue
            if hit.get("payload", {}).get("content_sha256") != c.payload["content_sha256"]:
                continue
            seen.add(c.point_id)
            result.append(dict(point_id=c.point_id, text=c.text, **citation(c)))
        return result
