"""Church Library extraction, route, retrieval, and security regression tests."""
from __future__ import annotations

import io
import zipfile
from pathlib import Path

from fastapi.testclient import TestClient
from pypdf import PdfWriter

import main
from editorial.church_library_store import ChurchLibraryStore
from editorial.cms_auth import EditorialPrincipal, require_editorial_principal
from editorial.document_processing import (
    ExtractionError,
    detect_language,
    extract_document,
    split_passages,
)


def _docx(paragraphs: list[tuple[str | None, str]]) -> bytes:
    body = []
    for style, text in paragraphs:
        style_xml = f'<w:pPr><w:pStyle w:val="{style}"/></w:pPr>' if style else ""
        body.append(f"<w:p>{style_xml}<w:r><w:t>{text}</w:t></w:r></w:p>")
    xml = (
        '<?xml version="1.0" encoding="UTF-8"?>'
        '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
        f"<w:body>{''.join(body)}</w:body></w:document>"
    )
    target = io.BytesIO()
    with zipfile.ZipFile(target, "w") as archive:
        archive.writestr("[Content_Types].xml", '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"/>')
        archive.writestr("word/document.xml", xml)
    return target.getvalue()


def _epub() -> bytes:
    target = io.BytesIO()
    with zipfile.ZipFile(target, "w") as archive:
        archive.writestr("mimetype", "application/epub+zip")
        archive.writestr(
            "META-INF/container.xml",
            '<?xml version="1.0"?><container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container"><rootfiles><rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/></rootfiles></container>',
        )
        archive.writestr(
            "OEBPS/content.opf",
            '<?xml version="1.0"?><package version="3.0" xmlns="http://www.idpf.org/2007/opf"><metadata/><manifest><item id="c1" href="01.xhtml" media-type="application/xhtml+xml"/></manifest><spine><itemref idref="c1"/></spine></package>',
        )
        archive.writestr("OEBPS/01.xhtml", "<html><head><title>ምዕራፍ አንድ</title></head><body><h1>ምዕራፍ አንድ</h1><p>የሙከራ ጽሑፍ ነው።</p></body></html>")
    return target.getvalue()


def test_utf8_txt_preserves_ethiopic_and_page_locators():
    result = extract_document("መጽሐፍ አንድ።\fSecond page text.".encode(), "text/plain")
    assert result.page_count == 2
    assert result.units[0].page_start == 1
    assert "መጽሐፍ" in result.units[0].text
    assert detect_language(result.units[0].text, "am") == "am"


def test_txt_rejects_unknown_encoding_instead_of_corrupting_text():
    try:
        extract_document(b"\xff\xfe\xfa", "text/plain")
    except ExtractionError as exc:
        assert exc.code == "text_encoding_unknown"
    else:  # pragma: no cover
        raise AssertionError("invalid encoding was accepted")


def test_scanned_or_blank_pdf_is_flagged_instead_of_inventing_text():
    target = io.BytesIO()
    writer = PdfWriter()
    writer.add_blank_page(width=612, height=792)
    writer.write(target)

    result = extract_document(target.getvalue(), "application/pdf")
    assert result.quality == "unreadable"
    assert "OCR" in (result.notes or "")
    assert result.units == []


def test_docx_preserves_real_heading_as_chapter_reference():
    result = extract_document(_docx([("Heading1", "Chapter One"), (None, "A paragraph with source text.")]), "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
    assert result.quality == "good"
    assert result.units[0].section_title == "Chapter One"
    assert "source text" in result.units[0].text


def test_epub_preserves_ethiopic_text_and_chapter():
    result = extract_document(_epub(), "application/epub+zip")
    assert result.units
    assert result.units[0].chapter_reference == "ምዕራፍ አንድ"
    assert "የሙከራ" in result.units[0].text
    assert result.page_count is None, "EPUB extraction must not invent page numbers"


def test_file_signature_mismatch_is_rejected():
    for mime_type in ("application/pdf", "application/epub+zip"):
        try:
            extract_document(b"not the declared document type", mime_type)
        except ExtractionError as exc:
            assert "signature" in exc.code
        else:  # pragma: no cover
            raise AssertionError(f"{mime_type} signature mismatch was accepted")


def test_passage_split_never_crosses_source_locator():
    result = extract_document(("A" * 2600 + "\f" + "B" * 100).encode(), "text/plain")
    passages = split_passages(result.units, target_chars=500)
    assert len(passages) > 2
    assert all(not ({"A", "B"} <= set(p.text)) for p in passages)
    assert passages[-1].page_start == 2


def test_reprocess_disables_public_retrieval_before_replacing_indexes():
    class FakeStore(ChurchLibraryStore):
        def __init__(self):
            self.patches: list[tuple[str, str, dict]] = []

        def _rows(self, table, params):
            if table == "church_library_books":
                return [{"id": "book", "language": "am", "current_version_id": "version"}]
            return [{
                "id": "version", "book_id": "book", "mime_type": "text/plain",
                "source_storage_path": "books/book/version/source.txt",
            }]

        def _patch(self, table, row_id, payload):
            self.patches.append((table, row_id, payload))

        def _download(self, storage_path):
            return "የሙከራ መጽሐፍ ጽሑፍ።".encode()

        def _delete(self, table, *, version_id):
            return None

        def _insert(self, table, rows, *, return_rows=False):
            if table == "church_library_sections" and return_rows:
                return [{**rows[0], "id": "section"}]
            return []

    store = FakeStore()
    result = store.process("book")
    book_patches = [payload for table, _, payload in store.patches if table == "church_library_books"]
    assert book_patches[0] == {
        "processing_status": "processing",
        "public_retrieval_enabled": False,
    }
    assert result["status"] == "ready"


def test_public_search_route_returns_only_store_results(monkeypatch):
    class FakeStore:
        def search(self, query, language, limit):
            assert query == "ትምህርት"
            assert language == "am"
            assert limit == 6
            return {"results": [{"passage_id": "safe", "title": "Allowed", "excerpt": "Grounded"}], "semantic_used": False, "embedding_model": None}

    monkeypatch.setattr("editorial.church_library_router.ChurchLibraryStore", FakeStore)
    response = TestClient(main.app).post(
        "/api/church-library/search", json={"query": "ትምህርት", "limit": 6}
    )
    assert response.status_code == 200
    body = response.json()
    assert body["count"] == 1
    assert body["results"][0]["passage_id"] == "safe"


def test_admin_status_rejects_anonymous():
    response = TestClient(main.app).get("/api/church-library/status")
    assert response.status_code == 401


def test_registered_openapi_contains_complete_church_library_api():
    paths = TestClient(main.app).get("/openapi.json").json()["paths"]
    assert "/api/church-library/status" in paths
    assert "/api/church-library/books/{book_id}/process" in paths
    assert "/api/church-library/books/{book_id}/status" in paths
    assert "/api/church-library/books/{book_id}/results" in paths
    assert "/api/church-library/books/{book_id}/retry" in paths
    assert "/api/church-library/search" in paths


def test_authenticated_status_and_processing_routes(monkeypatch):
    class FakeStore:
        def __init__(self):
            pass

        def capabilities(self):
            return {
                "configured": True,
                "database_ready": True,
                "private_bucket_ready": True,
                "originals_bucket": "church-library",
                "document_processing": "ready",
                "embedding_model": None,
                "multilingual_embeddings_approved": False,
            }

        def process(self, book_id):
            return {"book_id": book_id, "status": "ready", "passage_count": 4}

        def retry(self, book_id):
            return {"book_id": book_id, "status": "ready", "passage_count": 4}

        def processing_status(self, book_id):
            return {
                "book": {"id": book_id, "processing_status": "ready"},
                "version": {"id": "00000000-0000-0000-0000-000000000003", "processing_status": "ready"},
            }

        def extraction_results(self, book_id, *, limit, offset):
            assert limit == 25
            assert offset == 0
            return {
                "book_id": book_id,
                "version_id": "00000000-0000-0000-0000-000000000003",
                "processing_status": "ready",
                "sections": [],
                "passages": [{"id": "passage", "content": "Grounded source text"}],
                "limit": limit,
                "offset": offset,
                "has_more": False,
            }

    principal = EditorialPrincipal(
        user_id="00000000-0000-0000-0000-000000000001",
        cms_role="super_admin",
        auth_method="cms_jwt",
    )
    main.app.dependency_overrides[require_editorial_principal] = lambda: principal
    monkeypatch.setattr("editorial.church_library_router.ChurchLibraryStore", FakeStore)
    try:
        client = TestClient(main.app)
        status = client.get("/api/church-library/status")
        assert status.status_code == 200
        assert status.json()["cms_role"] == "super_admin"
        processed = client.post(
            "/api/church-library/books/00000000-0000-0000-0000-000000000002/process"
        )
        assert processed.status_code == 200
        assert processed.json()["passage_count"] == 4
        progress = client.get(
            "/api/church-library/books/00000000-0000-0000-0000-000000000002/status"
        )
        assert progress.status_code == 200
        assert progress.json()["version"]["processing_status"] == "ready"
        results = client.get(
            "/api/church-library/books/00000000-0000-0000-0000-000000000002/results?limit=25"
        )
        assert results.status_code == 200
        assert results.json()["passages"][0]["content"] == "Grounded source text"
        retried = client.post(
            "/api/church-library/books/00000000-0000-0000-0000-000000000002/retry"
        )
        assert retried.status_code == 200
        assert retried.json()["passage_count"] == 4
    finally:
        main.app.dependency_overrides.clear()


def test_all_private_processing_routes_reject_anonymous():
    book_id = "00000000-0000-0000-0000-000000000002"
    client = TestClient(main.app)
    for method, path in (
        ("post", f"/api/church-library/books/{book_id}/process"),
        ("get", f"/api/church-library/books/{book_id}/status"),
        ("get", f"/api/church-library/books/{book_id}/results"),
        ("post", f"/api/church-library/books/{book_id}/retry"),
    ):
        response = getattr(client, method)(path)
        assert response.status_code == 401


def test_store_status_and_results_are_scoped_to_active_book_version():
    class FakeStore(ChurchLibraryStore):
        def __init__(self):
            self.calls = []

        def _rows(self, table, params):
            self.calls.append((table, params))
            if table == "church_library_books":
                return [{
                    "id": "book", "title": "Book", "current_version_id": "version",
                    "processing_status": "ready", "extraction_quality": "good",
                    "extraction_notes": None, "public_retrieval_enabled": False,
                }]
            if table == "church_library_versions":
                return [{"id": "version", "processing_status": "ready", "passage_count": 1}]
            if table == "church_library_sections":
                return [{"id": "section", "title": "Chapter One"}]
            if table == "church_library_passages":
                return [{"id": "passage", "content": "Text", "version_id": "version"}]
            return []

    store = FakeStore()
    result = store.extraction_results("book", limit=100, offset=0)
    assert result["version_id"] == "version"
    assert result["passages"][0]["content"] == "Text"
    passage_call = next(params for table, params in store.calls if table == "church_library_passages")
    assert passage_call["book_id"] == "eq.book"
    assert passage_call["version_id"] == "eq.version"


def test_migration_keeps_private_tables_private_and_separates_gates():
    migration = Path(__file__).resolve().parents[2] / "supabase" / "migrations" / "20261024190000_church_library.sql"
    sql = migration.read_text(encoding="utf-8")
    assert "public_retrieval_enabled" in sql
    assert "approved_for_ingestion" in sql
    assert "access_level = 'public_search'" in sql
    assert "rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')" in sql
    assert "revoke all on public.church_library_books" in sql
    assert "public.church_library_passages to anon" not in sql.lower()
    assert "bucket_id = 'church-library' and public.is_staff()" in sql
