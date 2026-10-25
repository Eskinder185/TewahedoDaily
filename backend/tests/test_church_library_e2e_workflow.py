"""End-to-end verification of Church Library upload, processing, and retrieval contracts."""
from __future__ import annotations

import io
from fastapi.testclient import TestClient
from pypdf import PdfWriter

import main
from editorial.church_library_store import ChurchLibraryStore
from editorial.cms_auth import EditorialPrincipal, require_editorial_principal

TARGET_BOOK_ID = "bd177171-ee34-4ec0-a762-9687b87153e3"
TARGET_VERSION_ID = "c0000000-0000-4000-8000-000000000001"


def _sample_pdf() -> bytes:
    writer = PdfWriter()
    writer.add_blank_page(width=72, height=72)
    stream = io.BytesIO()
    writer.write(stream)
    return stream.getvalue()


class MockE2EChurchLibraryStore(ChurchLibraryStore):
    """Simulates Supabase database and storage state for TARGET_BOOK_ID."""

    def __init__(self, client=None):
        self._client = client
        self.url = "http://localhost:54321"
        self.key = "test-key"
        self.calls = []
        self._book = {
            "id": TARGET_BOOK_ID,
            "title": "Haymanote Abaw (Faith of the Fathers)",
            "author": "Church Fathers",
            "language": "gez",
            "current_version_id": TARGET_VERSION_ID,
            "processing_status": "ready",
            "extraction_quality": "good",
            "extraction_notes": "Machine readable text extracted cleanly.",
            "public_retrieval_enabled": False,
            "approved_for_ingestion": True,
            "allow_search_quotes": True,
            "rights_status": "public_domain",
            "access_level": "public_search",
        }
        self._version = {
            "id": TARGET_VERSION_ID,
            "book_id": TARGET_BOOK_ID,
            "version_number": 1,
            "original_file_name": "haymanote-abaw.pdf",
            "source_storage_path": f"{TARGET_BOOK_ID}/{TARGET_VERSION_ID}/haymanote-abaw.pdf",
            "mime_type": "application/pdf",
            "byte_size": 2048,
            "processing_status": "ready",
            "extraction_quality": "good",
            "extraction_notes": None,
            "page_count": 1,
            "section_count": 1,
            "passage_count": 2,
            "error_code": None,
            "error_message": None,
        }
        self._passages = [
            {
                "id": "p0000000-0000-4000-8000-000000000001",
                "book_id": TARGET_BOOK_ID,
                "version_id": TARGET_VERSION_ID,
                "section_id": "s0000000-0000-4000-8000-000000000001",
                "passage_order": 0,
                "language": "gez",
                "content": "በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ።",
                "page_start": 1,
                "page_end": 1,
                "chapter_reference": "መቅድም",
                "locator_label": "ገጽ ፩",
                "review_status": "reviewed",
                "extraction_confidence": 0.98,
            },
            {
                "id": "p0000000-0000-4000-8000-000000000002",
                "book_id": TARGET_BOOK_ID,
                "version_id": TARGET_VERSION_ID,
                "section_id": "s0000000-0000-4000-8000-000000000001",
                "passage_order": 1,
                "language": "gez",
                "content": "ንወጥን በረድኤተ እግዚአብሔር ጽሒፈ ሃይማኖተ አበው።",
                "page_start": 1,
                "page_end": 1,
                "chapter_reference": "መቅድም",
                "locator_label": "ገጽ ፩",
                "review_status": "pending",
                "extraction_confidence": 0.95,
            },
        ]
        self._sections = [
            {
                "id": "s0000000-0000-4000-8000-000000000001",
                "book_id": TARGET_BOOK_ID,
                "version_id": TARGET_VERSION_ID,
                "section_order": 0,
                "title": "መቅድመ መጽሐፍ",
                "chapter_reference": "መቅድም",
                "page_start": 1,
                "page_end": 1,
            }
        ]

    def capabilities(self) -> dict:
        return {
            "configured": True,
            "database_ready": True,
            "private_bucket_ready": True,
            "originals_bucket": "church-library-originals",
            "document_processing": "ready",
            "supported_types": ["pdf", "docx", "txt", "epub"],
            "embedding_model": None,
            "multilingual_embeddings_approved": False,
        }

    def retry(self, book_id: str) -> dict:
        assert book_id == TARGET_BOOK_ID
        return {"book_id": book_id, "status": "ready", "passage_count": len(self._passages)}

    def _rows(self, table: str, params: dict[str, str]) -> list[dict]:
        self.calls.append((table, params))
        if table == "church_library_books":
            return [self._book]
        if table in ("church_library_book_versions", "church_library_versions"):
            return [self._version]
        if table == "church_library_sections":
            return self._sections
        if table == "church_library_passages":
            return self._passages
        return []

    def _download(self, storage_path: str) -> bytes:
        assert storage_path.startswith(f"{TARGET_BOOK_ID}/{TARGET_VERSION_ID}/")
        return _sample_pdf()


def test_existing_book_processing_status_and_results(monkeypatch):
    """Verifies that book bd177171-ee34-4ec0-a762-9687b87153e3 responds to status & results."""
    principal = EditorialPrincipal(
        user_id="u0000000-0000-4000-8000-000000000001",
        cms_role="admin",
        auth_method="cms_jwt",
    )
    main.app.dependency_overrides[require_editorial_principal] = lambda: principal
    monkeypatch.setattr("editorial.church_library_router.ChurchLibraryStore", MockE2EChurchLibraryStore)

    try:
        client = TestClient(main.app)

        # 1. GET /api/church-library/status responds 200 with 100 MiB limit
        status_resp = client.get("/api/church-library/status")
        assert status_resp.status_code == 200
        status_data = status_resp.json()
        assert status_data["cms_role"] == "admin"
        assert status_data["max_upload_bytes"] == 100 * 1024 * 1024
        assert "PDF" in status_data["supported_types"]

        # 2. GET /api/church-library/books/{book_id}/status responds 200
        book_status_resp = client.get(f"/api/church-library/books/{TARGET_BOOK_ID}/status")
        assert book_status_resp.status_code == 200
        book_data = book_status_resp.json()
        assert book_data["book"]["id"] == TARGET_BOOK_ID
        assert book_data["version"]["id"] == TARGET_VERSION_ID
        assert book_data["version"]["processing_status"] == "ready"

        # 3. GET /api/church-library/books/{book_id}/results responds 200 with documented contract
        results_resp = client.get(f"/api/church-library/books/{TARGET_BOOK_ID}/results?limit=100&offset=0")
        assert results_resp.status_code == 200
        results_data = results_resp.json()
        assert results_data["book_id"] == TARGET_BOOK_ID
        assert results_data["version_id"] == TARGET_VERSION_ID
        assert results_data["processing_status"] == "ready"
        assert len(results_data["passages"]) == 2
        assert len(results_data["sections"]) == 1
        assert results_data["passages"][0]["chapter_reference"] == "መቅድም"
        assert results_data["passages"][0]["locator_label"] == "ገጽ ፩"

        # 4. POST /api/church-library/books/{book_id}/retry responds 200
        retry_resp = client.post(f"/api/church-library/books/{TARGET_BOOK_ID}/retry")
        assert retry_resp.status_code == 200

    finally:
        main.app.dependency_overrides.clear()


def test_anonymous_requests_are_strictly_denied():
    """Confirms that anonymous requests to Church Library endpoints receive HTTP 401."""
    client = TestClient(main.app)
    for endpoint in [
        f"/api/church-library/status",
        f"/api/church-library/books/{TARGET_BOOK_ID}/status",
        f"/api/church-library/books/{TARGET_BOOK_ID}/results",
        f"/api/church-library/books/{TARGET_BOOK_ID}/process",
        f"/api/church-library/books/{TARGET_BOOK_ID}/retry",
    ]:
        resp = client.get(endpoint) if "process" not in endpoint and "retry" not in endpoint else client.post(endpoint)
        assert resp.status_code == 401, f"{endpoint} must deny anonymous access"
