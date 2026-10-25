"""Church Library administration and public excerpt retrieval routes."""
from __future__ import annotations

import re

from fastapi import APIRouter, Depends, HTTPException, Query
from pydantic import BaseModel, Field
from starlette.concurrency import run_in_threadpool

from .church_library_store import ChurchLibraryStore
from .cms_auth import EditorialPrincipal, require_editorial_principal


router = APIRouter(prefix="/api/church-library", tags=["church-library"])


def _book_id(value: str) -> str:
    if not re.fullmatch(r"[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", value):
        raise HTTPException(status_code=400, detail="Invalid book identifier.")
    return value


class LibrarySearchRequest(BaseModel):
    query: str = Field(min_length=1, max_length=500)
    language: str | None = Field(default=None, pattern="^(en|am|gez|mixed|other)$")
    limit: int = Field(default=8, ge=1, le=20)


@router.get("/status")
def library_status(principal: EditorialPrincipal = Depends(require_editorial_principal)):
    """Authenticated deployment diagnostic; avoids the former opaque 404."""
    capabilities = ChurchLibraryStore().capabilities()
    return {
        **capabilities,
        "cms_role": principal.cms_role,
        "user_id": principal.user_id,
        "max_upload_bytes": 100 * 1024 * 1024,
        "supported_types": ["PDF", "DOCX", "UTF-8 TXT", "EPUB"],
    }


@router.post("/books/{book_id}/process")
async def process_book(
    book_id: str,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _book_id(book_id)
    _ = principal
    return await run_in_threadpool(ChurchLibraryStore().process, book_id)


@router.get("/books/{book_id}/status")
async def processing_status(
    book_id: str,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _book_id(book_id)
    _ = principal
    return await run_in_threadpool(ChurchLibraryStore().processing_status, book_id)


@router.get("/books/{book_id}/results")
async def extraction_results(
    book_id: str,
    limit: int = Query(default=100, ge=1, le=250),
    offset: int = Query(default=0, ge=0),
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _book_id(book_id)
    _ = principal
    return await run_in_threadpool(
        ChurchLibraryStore().extraction_results,
        book_id,
        limit=limit,
        offset=offset,
    )


@router.post("/books/{book_id}/retry")
async def retry_processing(
    book_id: str,
    principal: EditorialPrincipal = Depends(require_editorial_principal),
):
    _book_id(book_id)
    _ = principal
    return await run_in_threadpool(ChurchLibraryStore().retry, book_id)


@router.post("/search")
async def public_library_search(body: LibrarySearchRequest):
    """Public, retrieval-gated excerpts only; never returns private file paths."""
    query = body.query.strip()
    if not query:
        raise HTTPException(status_code=422, detail="Enter a search query.")
    language = body.language
    if language is None and re.search(r"[\u1200-\u137f]", query):
        language = "am"
    search_result = await run_in_threadpool(
        ChurchLibraryStore().search, query, language, body.limit
    )
    hits = search_result["results"]
    return {
        "type": "church_library_search",
        "query": query,
        "language": language,
        "count": len(hits),
        "results": hits,
        "retrieval": "hybrid" if search_result["semantic_used"] else "keyword",
        "semantic_status": (
            f"enabled:{search_result['embedding_model']}"
            if search_result["semantic_used"]
            else "disabled_or_not_approved_for_this_language"
        ),
    }
