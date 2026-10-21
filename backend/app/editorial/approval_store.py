from __future__ import annotations

import json
import threading
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Literal, Optional

from .models import ParagraphRecord
from .paths import approval_store_path

TargetType = Literal["paragraph", "section", "document"]


@dataclass
class ApprovalDecision:
    target_type: TargetType
    target_id: str
    document_id: str
    approved_for_ingestion: bool
    reviewer: str
    decided_at: str
    notes: str = ""
    # Optional: approve a whole section/document without mutating package JSON.
    section_id: Optional[str] = None


class ApprovalStore:
    """Overlay approval decisions. Never writes into content-review package files."""

    def __init__(self, path: Optional[Path] = None):
        self.path = (path or approval_store_path()).resolve()
        self._lock = threading.Lock()
        self._decisions: dict[str, ApprovalDecision] = {}
        self._load()

    def _key(self, target_type: str, target_id: str) -> str:
        return f"{target_type}:{target_id}"

    def _load(self) -> None:
        if not self.path.is_file():
            self._decisions = {}
            return
        data = json.loads(self.path.read_text(encoding="utf-8"))
        decisions = {}
        for row in data.get("decisions") or []:
            d = ApprovalDecision(**row)
            if type(d.approved_for_ingestion) is not bool:
                raise ValueError("Overlay approval must be a JSON boolean")
            key = self._key(d.target_type, d.target_id)
            if key in decisions:
                raise ValueError("Duplicate overlay decision")
            decisions[key] = d
        self._decisions = decisions

    def _save(self) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        payload = {
            "version": 1,
            "note": (
                "Overlay only. Does not modify content-review package "
                "approved_for_ingestion flags."
            ),
            "decisions": [asdict(d) for d in self._decisions.values()],
        }
        tmp = self.path.with_suffix(".tmp")
        tmp.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        tmp.replace(self.path)

    def list_decisions(self) -> list[dict[str, Any]]:
        with self._lock:
            return [asdict(d) for d in sorted(self._decisions.values(), key=lambda x: x.decided_at)]

    def record_decision(
        self,
        *,
        target_type: TargetType,
        target_id: str,
        document_id: str,
        approved_for_ingestion: bool,
        reviewer: str,
        notes: str = "",
        section_id: Optional[str] = None,
    ) -> ApprovalDecision:
        if type(approved_for_ingestion) is not bool:
            raise ValueError("approval must be a literal boolean")
        if not reviewer.strip():
            raise ValueError("reviewer is required")
        decision = ApprovalDecision(
            target_type=target_type,
            target_id=target_id,
            document_id=document_id,
            approved_for_ingestion=approved_for_ingestion,
            reviewer=reviewer.strip(),
            decided_at=datetime.now(timezone.utc).isoformat(),
            notes=notes or "",
            section_id=section_id,
        )
        with self._lock:
            self._decisions[self._key(target_type, target_id)] = decision
            self._save()
        return decision

    def _matching_decisions(self, paragraph: ParagraphRecord) -> list[ApprovalDecision]:
        with self._lock:
            self._load()  # A denial written by another request must take effect immediately.
            found: list[ApprovalDecision] = []
            para = self._decisions.get(self._key("paragraph", paragraph.id))
            if para is not None and para.document_id == paragraph.document_id:
                found.append(para)
            sec = self._decisions.get(self._key("section", paragraph.section_id))
            if sec is not None and sec.document_id == paragraph.document_id:
                found.append(sec)
            doc = self._decisions.get(self._key("document", paragraph.document_id))
            if doc is not None and doc.document_id == paragraph.document_id:
                found.append(doc)
            return found

    def has_explicit_denial(self, paragraph: ParagraphRecord) -> bool:
        return any(not d.approved_for_ingestion for d in self._matching_decisions(paragraph))

    def has_explicit_approval(self, paragraph: ParagraphRecord) -> bool:
        """Overlay intent only — does not override a false package flag."""
        decisions = self._matching_decisions(paragraph)
        if not decisions:
            return False
        # Most specific wins: paragraph > section > document (order in list).
        return bool(decisions[0].approved_for_ingestion)

    def reviewer_intends_ingest(self, paragraph: ParagraphRecord) -> bool:
        """Workflow helper for the private preview UI (not a Qdrant gate)."""
        if paragraph.unresolved_issue_ids:
            return False
        return self.has_explicit_approval(paragraph)
