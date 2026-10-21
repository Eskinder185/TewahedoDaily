"""Approval-gated Qdrant preparation; writes require a local-only sink."""
from __future__ import annotations

import json
import math
import sqlite3
import uuid
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable

from .approval_store import ApprovalStore
from .catalog import BookCatalog, load_catalog
from .models import ParagraphRecord
from .release import ReleaseManifest, digest, paragraph_allowed

NAMESPACE = uuid.UUID("3632d0ae-7478-4449-8a3d-42572bb77152")


@dataclass(frozen=True)
class IngestCandidate:
    point_id: str
    document_id: str
    section_id: str
    paragraph_id: str
    text: str
    language: str
    content_kind: str
    source_unit_ids: tuple[str, ...]
    reference_unit_ids: tuple[str, ...]
    content_origin: str
    package_approved_for_ingestion: bool
    payload: dict[str, Any]


def _candidates_from_paragraph(catalog: BookCatalog, p: ParagraphRecord) -> list[IngestCandidate]:
    book = catalog.get_book(p.document_id)
    section = next(s for s in book.sections if s.section_id == p.section_id)
    variants = []
    for source in p.source_attributions:
        if source.original_text.strip():
            variants.append((f"source:{source.unit_id}", source.original_text,
                             "am" if source.source_language != "en" else "en",
                             "original_source", (source.unit_id,), source.source_language))
    for i, segment in enumerate(p.content_segments):
        if not segment.text.strip():
            continue
        kind = ("supplemental_explanation" if segment.kind == "new_F01_reference_explanation"
                else "english_reading" if segment.kind == "original_English_reference"
                else "translation")
        variants.append((f"segment:{i}", segment.text, "en", kind, p.source_unit_ids, "en"))
    result = []
    evidence = digest({"paragraph": p.raw, "book": book.metadata, "section": section.raw,
                       "reference_evidence": p.reference_evidence,
                       "sources": [s.__dict__ for s in p.source_attributions]})
    for variant, text, lang, kind, sources, source_language in variants:
        point_id = str(uuid.uuid5(NAMESPACE, f"{p.document_id}:{p.id}:{variant}"))
        payload = {
            "document_id": p.document_id, "book_title": book.title,
            "section_id": p.section_id, "section_title": section.title_en,
            "paragraph_id": p.id, "paragraph_order": p.order, "variant": variant,
            "text": text, "language": lang, "source_language": source_language,
            "role": p.role, "content_kind": kind, "content_origin": p.content_origin,
            "source_unit_ids": list(sources), "reference_unit_ids": list(p.reference_unit_ids),
            "context_unit_ids": p.raw.get("context_unit_ids", []),
            "source_locations": p.raw.get("source_locations", []),
            "revision_ids": list(p.revision_ids), "review_issue_ids": list(p.review_issue_ids),
            "unresolved_issue_ids": list(p.unresolved_issue_ids),
            "source_filename": book.metadata.get("source_filename"),
            "source_sha256": book.metadata.get("source_sha256"),
            "package_version": catalog.catalog_meta.get("version"),
            "evidence_sha256": evidence, "approved_for_ingestion": p.approved_for_ingestion,
            "visibility": "approved_public_retrieval_only",
        }
        payload["content_sha256"] = digest(payload)
        result.append(IngestCandidate(point_id, p.document_id, p.section_id, p.id,
                                      text, lang, kind, tuple(sources), p.reference_unit_ids,
                                      p.content_origin, p.approved_for_ingestion, payload))
    return result


def build_ingest_candidates(catalog: BookCatalog, *, document_id: str | None = None) -> list[IngestCandidate]:
    return [c for p in catalog.iter_paragraphs(document_id) for c in _candidates_from_paragraph(catalog, p)]


def is_approved_for_qdrant(paragraph: ParagraphRecord, store: ApprovalStore | None = None,
                          catalog: BookCatalog | None = None) -> bool:
    """Hierarchy check; individual language/kind variants also require a release grant."""
    return paragraph_allowed(paragraph, catalog, store)


def filter_approved(candidates: Iterable[IngestCandidate], catalog: BookCatalog,
                    store: ApprovalStore | None = None,
                    release: ReleaseManifest | None = None) -> list[IngestCandidate]:
    allowed, seen = [], set()
    if release is None:
        return []
    grants = release.read_grants()
    canonical = {c.point_id: c for c in build_ingest_candidates(catalog)}
    for c in candidates:
        if c.point_id in seen:
            continue
        seen.add(c.point_id)
        # Reject caller-supplied text attached to an approved paragraph ID.
        if c != canonical.get(c.point_id):
            continue
        p = catalog.get_paragraph(c.paragraph_id)
        if paragraph_allowed(p, catalog, store) and release.allows(c, grants):
            allowed.append(c)
    return allowed


class QdrantIngestionPipeline:
    """Durable intent before idempotent writes; explicit batch retry and rollback.

    Does not overwrite existing points with new text/models. A different
    edition/model must be staged in a separately reviewed local collection.
    No client is constructed by the pipeline or any application route.
    """

    def __init__(self, catalog: BookCatalog, store: ApprovalStore | None = None, *,
                 collection_name: str = "tewahedo_editorial_books_local",
                 release: ReleaseManifest | None = None, journal_path: Path | None = None):
        from .qdrant_local import validate_collection
        validate_collection(collection_name)
        self.catalog, self.store, self.release = catalog, store, release
        self.collection_name = collection_name
        self.journal_path = Path(journal_path) if journal_path else None

    def _allowed(self, catalog: BookCatalog | None = None) -> list[IngestCandidate]:
        c = catalog or self.catalog
        return filter_approved(build_ingest_candidates(c), c, self.store, self.release)

    def plan(self, document_id: str | None = None) -> dict:
        candidates = build_ingest_candidates(self.catalog, document_id=document_id)
        allowed = filter_approved(candidates, self.catalog, self.store, self.release)
        return {"collection": self.collection_name, "candidate_count": len(candidates),
                "approved_count": len(allowed), "excluded_count": len(candidates) - len(allowed),
                "would_upsert": [dict(point_id=c.point_id, paragraph_id=c.paragraph_id,
                                      document_id=c.document_id, language=c.language,
                                      content_kind=c.content_kind) for c in allowed],
                "dry_run": True, "production_qdrant_touched": False}

    @contextmanager
    def _db(self):
        if self.journal_path is None:
            raise ValueError("A durable journal_path is required for writes")
        self.journal_path.parent.mkdir(parents=True, exist_ok=True)
        db = sqlite3.connect(self.journal_path, timeout=1)
        db.execute("CREATE TABLE IF NOT EXISTS batches (id TEXT PRIMARY KEY, collection TEXT, "
                   "embedding_id TEXT, status TEXT, points TEXT)")
        try:
            with db:
                yield db
        finally:
            db.close()

    def execute_upsert(self, client, *, embed_fn, embedding_id: str = "", batch_id: str | None = None) -> dict:
        allowed = self._allowed()
        if not allowed:
            return {"upserted": 0, "collection": self.collection_name, "point_ids": [], "batch_id": None}
        from .qdrant_local import LocalQdrantSink
        if not isinstance(client, LocalQdrantSink):
            raise ValueError("Writes require a LocalQdrantSink")
        if not embedding_id.strip():
            raise ValueError("An explicit versioned embedding_id is required")
        batch_id = batch_id or str(uuid.uuid4())
        uuid.UUID(batch_id)
        points, dimension = [], None
        for c in allowed:
            vector = list(embed_fn(c.text))
            if not vector or not all(type(v) in (int, float) and math.isfinite(v) for v in vector):
                raise ValueError("Embedding must be a finite nonempty numeric vector")
            dimension = dimension or len(vector)
            if len(vector) != dimension:
                raise ValueError("Inconsistent embedding dimension")
            points.append(dict(id=c.point_id, vector=vector,
                               payload={**c.payload, "embedding_id": embedding_id, "batch_id": batch_id}))
        # Content, grants and revocations are re-read after potentially slow embedding.
        fresh = load_catalog(str(self.catalog.root))
        permitted = {c.point_id: c for c in self._allowed(fresh)}
        if any(permitted.get(c.point_id) != c for c in allowed):
            raise ValueError("Approval or content changed during preparation")
        with self._db() as db:
            db.execute("BEGIN IMMEDIATE")
            previous = db.execute("SELECT collection,embedding_id,status,points FROM batches WHERE id=?",
                                  (batch_id,)).fetchone()
            if previous:
                if previous[:2] != (self.collection_name, embedding_id) or previous[2] not in {"pending", "applied"}:
                    raise ValueError("Batch cannot be reused")
                intended = json.loads(previous[3])
                current = {p["id"]: p for p in points}
                if any(current.get(p["id"]) != p for p in intended):
                    raise ValueError("Batch contents changed")
                points = intended
                if previous[2] == "applied":
                    return {"upserted": 0, "point_ids": [], "batch_id": batch_id, "duplicate": True}
            else:
                if db.execute("SELECT id FROM batches WHERE status IN ('pending','rollback_pending')").fetchone():
                    raise ValueError("Retry or roll back the pending batch first")
                existing = client.retrieve(self.collection_name, [p["id"] for p in points])
                by_id = {str(p["id"]): p for p in existing}
                new_points = []
                for p in points:
                    old = by_id.get(p["id"])
                    if old:
                        if ({k:v for k,v in old["payload"].items() if k != "batch_id"}
                                != {k:v for k,v in p["payload"].items() if k != "batch_id"}):
                            raise ValueError("Existing point differs; stage a new collection edition")
                        continue
                    new_points.append(p)
                points = new_points
                db.execute("INSERT INTO batches VALUES (?,?,?,?,?)",
                           (batch_id, self.collection_name, embedding_id, "pending",
                            json.dumps(points, ensure_ascii=False)))
            db.commit()  # Exact retry/rollback plan survives a crash or timeout.
            db.execute("BEGIN IMMEDIATE")
            state = db.execute("SELECT status FROM batches WHERE id=?", (batch_id,)).fetchone()[0]
            if state != "pending":
                raise ValueError("Batch state changed; ingestion stopped")
            if points:
                client.upsert(collection_name=self.collection_name, points=points)
            db.execute("UPDATE batches SET status='applied' WHERE id=?", (batch_id,))
        return {"upserted": len(points), "collection": self.collection_name,
                "point_ids": [p["id"] for p in points], "batch_id": batch_id}

    def rollback(self, client, batch_id: str) -> dict:
        from .qdrant_local import LocalQdrantSink
        if not isinstance(client, LocalQdrantSink):
            raise ValueError("Rollback requires a LocalQdrantSink")
        with self._db() as db:
            db.execute("BEGIN IMMEDIATE")
            row = db.execute("SELECT collection,status,points FROM batches WHERE id=?", (batch_id,)).fetchone()
            if row is None or row[0] != self.collection_name:
                raise ValueError("Unknown batch or collection mismatch")
            if row[1] == "rolled_back":
                return {"deleted": 0, "batch_id": batch_id}
            ids = [p["id"] for p in json.loads(row[2])]
            existing = client.retrieve(self.collection_name, ids) if ids else []
            if any(p["payload"].get("batch_id") != batch_id for p in existing):
                raise ValueError("Point ownership changed; rollback stopped")
            db.execute("UPDATE batches SET status='rollback_pending' WHERE id=?", (batch_id,))
            db.commit()
            db.execute("BEGIN IMMEDIATE")
            if ids:
                client.delete(collection_name=self.collection_name, point_ids=ids, batch_id=batch_id)
            db.execute("UPDATE batches SET status='rolled_back' WHERE id=?", (batch_id,))
        return {"deleted": len(ids), "batch_id": batch_id}
