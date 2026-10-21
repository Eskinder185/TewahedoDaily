from __future__ import annotations

import os
from typing import Literal, Optional

from fastapi import APIRouter, Depends, Query, Response
from pydantic import BaseModel, Field, StrictBool

from .approval_store import ApprovalStore
from .catalog import clear_catalog_cache, load_catalog
from .cms_auth import EditorialPrincipal, require_editorial_principal
from .ingestion import QdrantIngestionPipeline
from .integrity import verify_package_integrity
from .paths import approval_store_path, content_review_root
from .reader import paragraph_payload, reading_page, table_of_contents
from .retrieval_diagnostics import diagnose_package_retrieval
from .search_index import BookSearchIndex

router = APIRouter(prefix="/api/editorial", tags=["editorial-private"])


def _private_cache_policy(response: Response):
    response.headers["Cache-Control"] = "no-store"
    response.headers["X-Robots-Tag"] = "noindex, nofollow"


router.dependencies.append(Depends(_private_cache_policy))


def editorial_preview_enabled() -> bool:
    raw = os.getenv("ENABLE_EDITORIAL_PREVIEW", "0").strip().lower()
    return raw in {"1", "true", "yes", "on"}


def _require_enabled() -> None:
    from fastapi import HTTPException

    if not editorial_preview_enabled():
        raise HTTPException(
            status_code=404,
            detail="Editorial preview is disabled.",
        )


class ApprovalRequest(BaseModel):
    target_type: Literal["paragraph", "section", "document"]
    target_id: str
    document_id: str
    approved_for_ingestion: StrictBool
    reviewer: str = Field(min_length=1, max_length=200)
    notes: str = Field(default="", max_length=4000)
    section_id: Optional[str] = None


@router.get("/status")
def editorial_status(
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    report = verify_package_integrity()
    return {
        "enabled": True,
        "package_root": str(content_review_root()),
        "integrity_ok": report.ok,
        "package_approved_for_ingestion": report.package_approved_for_ingestion,
        "paragraphs_checked": report.paragraphs_checked,
        "published": False,
        "public_search_buddy_book_retrieval": "gated_empty_until_package_flags_true",
        "auth": {
            "method": principal.auth_method,
            "cms_role": principal.cms_role,
            "user_id": principal.user_id,
        },
    }


@router.get("/integrity")
def editorial_integrity(
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    report = verify_package_integrity()
    return report.__dict__


@router.get("/books")
def list_books(
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    catalog = load_catalog(str(content_review_root()))
    return {"books": catalog.list_books(), "published": False}


@router.get("/books/{document_id}")
def get_book_preview(
    document_id: str,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    catalog = load_catalog(str(content_review_root()))
    from fastapi import HTTPException

    try:
        return table_of_contents(catalog, document_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail=str(exc)) from exc


@router.get("/search")
def search_books(
    q: str = Query(min_length=1, max_length=500),
    document_id: Optional[str] = None,
    content_kind: Optional[str] = Query(
        default=None,
        description="Filter by content_kind (e.g. english_reading, reference_supplement).",
    ),
    has_amharic_source: Optional[bool] = Query(
        default=None,
        description="If true/false, require presence/absence of Ethiopic source text.",
    ),
    limit: int = Query(default=20, ge=1, le=100),
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    catalog = load_catalog(str(content_review_root()))
    index = BookSearchIndex(catalog)
    return {
        "query": q,
        "filters": {
            "document_id": document_id,
            "content_kind": content_kind,
            "has_amharic_source": has_amharic_source,
        },
        "hits": index.search_dicts(
            q,
            document_id=document_id,
            content_kind=content_kind,
            has_amharic_source=has_amharic_source,
            limit=limit,
        ),
        "note": "Private editorial search; hits are not public Search Buddy results.",
    }


@router.get("/diagnostics/retrieval")
def retrieval_diagnostics(
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    """Staff-only diagnosis of empty public retrieval (does not expose to Search Buddy)."""
    _require_enabled()
    _ = principal
    catalog = load_catalog(str(content_review_root()))
    store = ApprovalStore(approval_store_path())
    return diagnose_package_retrieval(catalog, store=store)


@router.get("/approvals")
def list_approvals(
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    store = ApprovalStore(approval_store_path())
    return {"decisions": store.list_decisions(), "store": str(approval_store_path())}


@router.post("/approvals")
def record_approval(
    body: ApprovalRequest,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    """Record a human approval overlay. Does not mutate package JSON flags."""
    _require_enabled()
    from fastapi import HTTPException

    catalog = load_catalog(str(content_review_root()))
    try:
        book = catalog.get_book(body.document_id)
        valid = (
            body.target_id == book.document_id
            if body.target_type == "document"
            else any(s.section_id == body.target_id for s in book.sections)
            if body.target_type == "section"
            else any(p.id == body.target_id for p in book.paragraphs)
        )
        if not valid:
            raise KeyError(body.target_id)
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="Unknown approval target") from exc
    store = ApprovalStore(approval_store_path())
    reviewer = body.reviewer
    if principal.auth_method == "cms_jwt" and principal.email:
        # Prefer verified CMS identity when the client sends a placeholder.
        if reviewer in {"cms-reviewer", "test-reviewer"} or not reviewer.strip():
            reviewer = principal.email
    decision = store.record_decision(
        target_type=body.target_type,
        target_id=body.target_id,
        document_id=body.document_id,
        approved_for_ingestion=body.approved_for_ingestion,
        reviewer=reviewer,
        notes=body.notes,
        section_id=body.section_id,
    )
    return {
        "decision": decision.__dict__,
        "package_flags_unchanged": True,
        "qdrant_ingest_still_requires_package_approved_for_ingestion_true": True,
        "auth_method": principal.auth_method,
    }


@router.get("/ingestion/plan")
def ingestion_plan(
    document_id: Optional[str] = None,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    catalog = load_catalog(str(content_review_root()))
    store = ApprovalStore(approval_store_path())
    pipeline = QdrantIngestionPipeline(catalog, store)
    return pipeline.plan(document_id=document_id)


@router.post("/reload")
def reload_catalog(
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    clear_catalog_cache()
    catalog = load_catalog(str(content_review_root()))
    return {"reloaded": True, "books": len(catalog.books)}


@router.get("/books/{document_id}/paragraphs")
def get_reading_page(
    document_id: str,
    section_id: Optional[str] = None,
    after: Optional[str] = None,
    limit: int = Query(default=20, ge=1, le=100),
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    from fastapi import HTTPException

    catalog = load_catalog(str(content_review_root()))
    try:
        return reading_page(
            catalog, document_id, section_id=section_id, after=after, limit=limit
        )
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="Unknown book/section") from exc
    except ValueError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc


@router.get("/paragraphs/{paragraph_id}")
def get_paragraph(
    paragraph_id: str,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _require_enabled()
    _ = principal
    from fastapi import HTTPException

    try:
        return paragraph_payload(
            load_catalog(str(content_review_root())), paragraph_id
        )
    except KeyError as exc:
        raise HTTPException(status_code=404, detail="Unknown paragraph") from exc
