"""Supabase-backed Church Library processing and retrieval service."""
from __future__ import annotations

import os
import threading
from collections import OrderedDict
from datetime import datetime, timezone
from urllib.parse import quote

import httpx
from fastapi import HTTPException

from .document_processing import ExtractionError, detect_language, extract_document, split_passages
from .embeddings import configured_model, encode, multilingual_approved


class ChurchLibraryStore:
    _processing_locks_guard = threading.Lock()
    _processing_locks: dict[str, threading.Lock] = {}

    def __init__(self, client: httpx.Client | None = None):
        self.url = (os.getenv("SUPABASE_URL") or "").rstrip("/")
        self.key = (os.getenv("SUPABASE_KEY") or "").strip()
        if not self.url or not self.key:
            raise HTTPException(status_code=503, detail="Church Library storage is not configured.")
        self._client = client

    @property
    def originals_bucket(self) -> str:
        return (os.getenv("CHURCH_LIBRARY_BUCKET") or "church-library-originals").strip()

    @property
    def versions_table(self) -> str:
        return (os.getenv("CHURCH_LIBRARY_VERSIONS_TABLE") or "church_library_book_versions").strip()

    @property
    def headers(self) -> dict[str, str]:
        return {
            "apikey": self.key,
            "Authorization": f"Bearer {self.key}",
            "Content-Type": "application/json",
        }

    def _request(self, method: str, path: str, **kwargs) -> httpx.Response:
        owns = self._client is None
        client = self._client or httpx.Client(timeout=60.0)
        headers = kwargs.pop("headers", self.headers)
        try:
            response = client.request(method, f"{self.url}{path}", headers=headers, **kwargs)
        finally:
            if owns:
                client.close()
        return response

    def _rows(self, table: str, params: dict[str, str]) -> list[dict]:
        response = self._request("GET", f"/rest/v1/{table}", params=params)
        if response.status_code != 200:
            raise HTTPException(status_code=502, detail=f"Could not read {table} from Supabase.")
        rows = response.json()
        return rows if isinstance(rows, list) else []

    def _patch(self, table: str, row_id: str, payload: dict) -> None:
        response = self._request(
            "PATCH",
            f"/rest/v1/{table}",
            params={"id": f"eq.{row_id}"},
            json=payload,
            headers={**self.headers, "Prefer": "return=minimal"},
        )
        if response.status_code not in {200, 204}:
            raise HTTPException(status_code=502, detail=f"Could not update {table} in Supabase.")

    def _delete(self, table: str, *, version_id: str) -> None:
        response = self._request(
            "DELETE", f"/rest/v1/{table}", params={"version_id": f"eq.{version_id}"}
        )
        if response.status_code not in {200, 204}:
            raise HTTPException(status_code=502, detail=f"Could not clear stale {table} rows.")

    def _insert(self, table: str, rows: list[dict], *, return_rows: bool = False) -> list[dict]:
        if not rows:
            return []
        headers = {**self.headers, "Prefer": "return=representation" if return_rows else "return=minimal"}
        response = self._request("POST", f"/rest/v1/{table}", json=rows, headers=headers)
        if response.status_code not in {200, 201, 204}:
            raise HTTPException(status_code=502, detail=f"Could not write {table} to Supabase.")
        return response.json() if return_rows and response.content else []

    def _version_rows(self, params: dict[str, str]) -> list[dict]:
        try:
            rows = self._rows(self.versions_table, params)
            if rows:
                return rows
        except HTTPException:
            pass
        alt = "church_library_versions" if self.versions_table == "church_library_book_versions" else "church_library_book_versions"
        try:
            return self._rows(alt, params)
        except HTTPException:
            return []

    def _version_patch(self, row_id: str, payload: dict) -> None:
        try:
            self._patch(self.versions_table, row_id, payload)
        except HTTPException:
            alt = "church_library_versions" if self.versions_table == "church_library_book_versions" else "church_library_book_versions"
            self._patch(alt, row_id, payload)

    def _download(self, storage_path: str) -> bytes:
        path = quote(storage_path.strip("/"), safe="/")
        primary_bucket = quote(self.originals_bucket, safe="")
        response = self._request("GET", f"/storage/v1/object/authenticated/{primary_bucket}/{path}")
        if response.status_code == 404:
            fallback_bucket = "church-library" if self.originals_bucket == "church-library-originals" else "church-library-originals"
            fallback_resp = self._request("GET", f"/storage/v1/object/authenticated/{quote(fallback_bucket, safe='')}/{path}")
            if fallback_resp.status_code == 200:
                return fallback_resp.content
            raise HTTPException(status_code=404, detail="The original Church Library file was not found.")
        if response.status_code != 200:
            raise HTTPException(status_code=502, detail="The original document could not be downloaded from private storage.")
        return response.content

    @classmethod
    def _book_lock(cls, book_id: str) -> threading.Lock:
        with cls._processing_locks_guard:
            return cls._processing_locks.setdefault(book_id, threading.Lock())

    def capabilities(self) -> dict:
        """Probe the actual database schema and private originals bucket."""
        database = self._request(
            "GET",
            "/rest/v1/church_library_books",
            params={"select": "id", "limit": "0"},
        )
        bucket = self._request(
            "GET",
            f"/storage/v1/bucket/{quote(self.originals_bucket, safe='')}",
        )
        if bucket.status_code != 200 and self.originals_bucket == "church-library-originals":
            fallback_b = self._request("GET", "/storage/v1/bucket/church-library")
            if fallback_b.status_code == 200:
                bucket = fallback_b
        database_ready = database.status_code == 200
        bucket_ready = bucket.status_code == 200
        return {
            "configured": database_ready and bucket_ready,
            "database_ready": database_ready,
            "private_bucket_ready": bucket_ready,
            "originals_bucket": self.originals_bucket,
            "document_processing": "ready" if database_ready and bucket_ready else "dependency_unavailable",
            "embedding_model": configured_model(),
            "multilingual_embeddings_approved": multilingual_approved(),
        }

    def processing_status(self, book_id: str) -> dict:
        books = self._rows(
            "church_library_books",
            {
                "id": f"eq.{book_id}",
                "select": (
                    "id,title,current_version_id,processing_status,extraction_quality,"
                    "extraction_notes,public_retrieval_enabled"
                ),
            },
        )
        if not books:
            raise HTTPException(status_code=404, detail="Church Library book not found.")
        book = books[0]
        version = None
        if book.get("current_version_id"):
            versions = self._version_rows(
                {
                    "id": f"eq.{book['current_version_id']}",
                    "book_id": f"eq.{book_id}",
                    "select": (
                        "id,version_number,processing_status,extraction_quality,extraction_notes,"
                        "page_count,section_count,passage_count,processed_at,error_code,error_message"
                    ),
                },
            )
            version = versions[0] if versions else None
        return {"book": book, "version": version}

    def extraction_results(self, book_id: str, *, limit: int, offset: int) -> dict:
        status = self.processing_status(book_id)
        version = status["version"]
        if version is None:
            raise HTTPException(status_code=404, detail="This book has no active file version.")
        if version.get("processing_status") != "ready":
            raise HTTPException(status_code=409, detail="Extraction results are not ready yet.")
        version_id = str(version["id"])
        sections = self._rows(
            "church_library_sections",
            {
                "book_id": f"eq.{book_id}",
                "version_id": f"eq.{version_id}",
                "select": "id,section_order,title,chapter_reference,page_start,page_end",
                "order": "section_order.asc",
            },
        )
        passages = self._rows(
            "church_library_passages",
            {
                "book_id": f"eq.{book_id}",
                "version_id": f"eq.{version_id}",
                "select": (
                    "id,book_id,version_id,section_id,passage_order,language,content,"
                    "page_start,page_end,chapter_reference,locator_label,extraction_confidence"
                ),
                "order": "passage_order.asc",
                "limit": str(limit),
                "offset": str(offset),
            },
        )
        return {
            "book_id": book_id,
            "version_id": version_id,
            "processing_status": "ready",
            "sections": sections,
            "passages": passages,
            "limit": limit,
            "offset": offset,
            "has_more": len(passages) == limit,
        }

    def process(self, book_id: str) -> dict:
        lock = self._book_lock(book_id)
        if not lock.acquire(blocking=False):
            raise HTTPException(status_code=409, detail="This book is already being processed.")
        try:
            return self._process_locked(book_id)
        finally:
            lock.release()

    def retry(self, book_id: str) -> dict:
        status = self.processing_status(book_id)
        version = status["version"]
        if version is None:
            raise HTTPException(status_code=404, detail="This book has no active file version.")
        if version.get("processing_status") == "processing":
            raise HTTPException(status_code=409, detail="This book is already being processed.")
        return self.process(book_id)

    def _process_locked(self, book_id: str) -> dict:
        books = self._rows(
            "church_library_books",
            {"id": f"eq.{book_id}", "select": "id,language,current_version_id"},
        )
        if not books or not books[0].get("current_version_id"):
            raise HTTPException(status_code=404, detail="Book or active file version not found.")
        book = books[0]
        version_id = str(book["current_version_id"])
        versions = self._version_rows(
            {"id": f"eq.{version_id}", "book_id": f"eq.{book_id}", "select": "*"},
        )
        if not versions:
            raise HTTPException(status_code=404, detail="Active file version not found.")
        version = versions[0]
        self._version_patch(version_id, {"processing_status": "processing", "error_code": None, "error_message": None})
        self._patch(
            "church_library_books",
            book_id,
            {"processing_status": "processing", "public_retrieval_enabled": False},
        )
        try:
            data = self._download(str(version["source_storage_path"]))
            result = extract_document(data, str(version["mime_type"]))
            if result.quality == "unreadable":
                status = "needs_ocr" if version["mime_type"] == "application/pdf" else "failed"
                self._version_patch(version_id, {
                    "processing_status": status, "extraction_quality": result.quality,
                    "extraction_notes": result.notes, "sha256": result.sha256,
                    "page_count": result.page_count, "error_code": "no_machine_readable_text",
                    "error_message": result.notes,
                })
                self._patch("church_library_books", book_id, {
                    "processing_status": status, "extraction_quality": result.quality,
                    "extraction_notes": result.notes, "public_retrieval_enabled": False,
                })
                return {"book_id": book_id, "version_id": version_id, "status": status, "passage_count": 0, "notes": result.notes}

            passages = split_passages(result.units)
            section_map: OrderedDict[str, dict] = OrderedDict()
            for unit in result.units:
                key = unit.section_title or unit.chapter_reference or "Document"
                if key not in section_map:
                    section_map[key] = {
                        "book_id": book_id, "version_id": version_id,
                        "section_order": len(section_map), "title": unit.section_title,
                        "chapter_reference": unit.chapter_reference,
                        "page_start": unit.page_start, "page_end": unit.page_end,
                    }
                elif unit.page_end:
                    section_map[key]["page_end"] = unit.page_end

            # A reprocess atomically removes visibility first; public retrieval is
            # already gated by processing_status=ready and current_version_id.
            self._delete("church_library_passages", version_id=version_id)
            self._delete("church_library_sections", version_id=version_id)
            inserted_sections = self._insert("church_library_sections", list(section_map.values()), return_rows=True)
            section_ids = {
                (row.get("title") or row.get("chapter_reference") or "Document"): row["id"]
                for row in inserted_sections
            }
            passage_rows = []
            for order, passage in enumerate(passages):
                section_key = passage.section_title or passage.chapter_reference or "Document"
                passage_rows.append({
                    "book_id": book_id, "version_id": version_id,
                    "section_id": section_ids.get(section_key), "passage_order": order,
                    "language": detect_language(passage.text, str(book.get("language") or "other")),
                    "content": passage.text, "page_start": passage.page_start,
                    "page_end": passage.page_end, "chapter_reference": passage.chapter_reference,
                    "locator_label": passage.chapter_reference or (f"Page {passage.page_start}" if passage.page_start else None),
                    "extraction_confidence": passage.confidence,
                })
            has_ethiopic = any(row["language"] in {"am", "gez", "mixed"} for row in passage_rows)
            vectors = encode(
                [str(row["content"]) for row in passage_rows],
                contains_ethiopic=has_ethiopic,
            )
            if vectors:
                for row, vector in zip(passage_rows, vectors, strict=True):
                    row["embedding"] = vector
                    row["embedding_model"] = configured_model()
            for start in range(0, len(passage_rows), 250):
                self._insert("church_library_passages", passage_rows[start:start + 250])
            self._version_patch(version_id, {
                "processing_status": "ready", "extraction_quality": result.quality,
                "extraction_notes": result.notes, "sha256": result.sha256,
                "page_count": result.page_count, "section_count": len(inserted_sections),
                "passage_count": len(passage_rows),
                "processed_at": datetime.now(timezone.utc).isoformat(),
                "error_code": None, "error_message": None,
            })
            self._patch("church_library_books", book_id, {
                "processing_status": "ready", "extraction_quality": result.quality,
                "extraction_notes": result.notes,
            })
            return {
                "book_id": book_id, "version_id": version_id, "status": "ready",
                "quality": result.quality, "notes": result.notes,
                "page_count": result.page_count, "section_count": len(inserted_sections),
                "passage_count": len(passage_rows),
                "embeddings": "generated" if vectors else (
                    "multilingual_model_not_approved" if has_ethiopic and configured_model() and not multilingual_approved()
                    else "not_configured"
                ),
            }
        except ExtractionError as exc:
            self._mark_failed(book_id, version_id, exc.code, str(exc))
            raise HTTPException(status_code=422, detail={"code": exc.code, "message": str(exc)}) from exc
        except HTTPException as exc:
            detail = exc.detail if isinstance(exc.detail, str) else "A storage or database dependency failed."
            try:
                self._mark_failed(book_id, version_id, "dependency_failed", detail)
            except Exception:
                # Preserve the original, more useful dependency error if even
                # the failure-status write is unavailable.
                pass
            raise
        except Exception as exc:
            self._mark_failed(book_id, version_id, "processing_failed", "Document processing failed; see backend logs.")
            raise HTTPException(status_code=500, detail="Document processing failed safely.") from exc

    def _mark_failed(self, book_id: str, version_id: str, code: str, message: str) -> None:
        self._version_patch(version_id, {
            "processing_status": "failed", "extraction_quality": "unreadable",
            "error_code": code, "error_message": message,
        })
        self._patch("church_library_books", book_id, {
            "processing_status": "failed", "extraction_quality": "unreadable",
            "extraction_notes": message, "public_retrieval_enabled": False,
        })

    def search(self, query: str, language: str | None, limit: int) -> dict:
        has_ethiopic = any("\u1200" <= char <= "\u137f" for char in query)
        vectors = encode([query], contains_ethiopic=has_ethiopic)
        response = self._request(
            "POST", "/rest/v1/rpc/search_church_library",
            json={
                "search_query": query,
                "result_limit": limit,
                "search_language": language,
                "query_embedding": vectors[0] if vectors else None,
            },
        )
        if response.status_code != 200:
            raise HTTPException(status_code=502, detail="Church Library retrieval is temporarily unavailable.")
        rows = response.json()
        return {
            "results": rows if isinstance(rows, list) else [],
            "semantic_used": bool(vectors),
            "embedding_model": configured_model() if vectors else None,
        }
