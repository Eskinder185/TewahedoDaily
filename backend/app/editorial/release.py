"""Separately reviewed, content-bound release grants. No approval writer exists here."""
from __future__ import annotations

import hashlib
import json
from datetime import datetime
from pathlib import Path

from .approval_store import ApprovalStore
from .catalog import BookCatalog
from .models import ParagraphRecord


def digest(value) -> str:
    return hashlib.sha256(json.dumps(value, ensure_ascii=False, sort_keys=True,
                                     separators=(",", ":")).encode("utf-8")).hexdigest()


def paragraph_allowed(p: ParagraphRecord, catalog: BookCatalog | None,
                      store: ApprovalStore | None = None) -> bool:
    if catalog is None or p.approved_for_ingestion is not True or p.unresolved_issue_ids:
        return False
    book = catalog.get_book(p.document_id)
    section = next((s for s in book.sections if s.section_id == p.section_id), None)
    if not (catalog.package_approved_for_ingestion is True
            and book.package_approved_for_ingestion is True
            and book.metadata.get("approved_for_ingestion") is True
            and book.metadata.get("final_human_approval") is True
            and any(s.get("document_id") == p.document_id and s.get("approved") is True
                    for s in catalog.approval_queue.get("whole_book_final_signoffs", []))
            and section is not None and section.raw.get("final_approval") == "Approved"):
        return False
    if store is not None and store.has_explicit_denial(p):
        return False
    return True


class ReleaseManifest:
    """Trusted local operator input, stored outside the immutable package.

    The file must be access-controlled by the operator. This is an allowlist,
    not a cryptographic identity provider or an automated theological review.
    Re-read on every use so revoked or changed grants fail closed.
    """

    def __init__(self, path: Path):
        self.path = Path(path)

    def read_grants(self) -> dict:
        if not self.path.is_file():
            return {}
        data = json.loads(self.path.read_text(encoding="utf-8"))
        if data.get("schema_version") != 1 or not isinstance(data.get("grants"), list):
            raise ValueError("Invalid release manifest")
        grants = {}
        for grant in data["grants"]:
            key = grant["point_id"]
            if key in grants:
                raise ValueError("Duplicate release grant")
            if type(grant.get("approved_for_ingestion")) is not bool:
                raise ValueError("Release approval must be a JSON boolean")
            grants[key] = grant
        return grants

    def allows(self, candidate, grants: dict | None = None) -> bool:
        grants = self.read_grants() if grants is None else grants
        grant = grants.get(candidate.point_id)
        if grant is None:
            return False
        stamp = datetime.fromisoformat(grant["decided_at"])
        return (grant["approved_for_ingestion"] is True
                       and grant.get("document_id") == candidate.document_id
                       and grant.get("paragraph_id") == candidate.paragraph_id
                       and grant.get("content_sha256") == candidate.payload["content_sha256"]
                       and bool(str(grant.get("reviewer", "")).strip())
                       and stamp.tzinfo is not None)
