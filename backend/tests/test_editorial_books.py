"""Editorial five-book package: integrity, catalog, approval gates, no public leak."""

from __future__ import annotations

import json
from dataclasses import replace
from pathlib import Path

import pytest
from fastapi.testclient import TestClient

from editorial.approval_store import ApprovalStore
from editorial.catalog import clear_catalog_cache, load_catalog
from editorial.ingestion import (
    QdrantIngestionPipeline,
    build_ingest_candidates,
    filter_approved,
    is_approved_for_qdrant,
)
from editorial.integrity import verify_package_integrity
from editorial.paths import content_review_root
from editorial.retrieval import retrieve_for_search_buddy
from editorial.search_index import BookSearchIndex
import main
import security as sec

PACKAGE = content_review_root()


pytestmark = pytest.mark.skipif(
    not (PACKAGE / "Catalog.json").is_file(),
    reason="content-review package not present locally",
)


@pytest.fixture(autouse=True)
def _clear_catalog():
    clear_catalog_cache()
    yield
    clear_catalog_cache()


def test_package_sha256_and_ingestion_flags_false():
    report = verify_package_integrity(PACKAGE, require_zip=False)
    assert report.sha256_mismatched == []
    assert report.sha256_missing == []
    assert report.sha256_matched >= 70
    assert report.package_approved_for_ingestion is False
    assert report.all_paragraphs_ingestion_false is True
    assert report.ok is True or (
        # ZIP root-name mismatch alone is notes, not errors, when require_zip=False
        report.ok is False and not report.errors
    )
    # Prefer ok True; if zip notes somehow error, still require SHA path.
    assert report.paragraphs_checked == 3003


def test_catalog_preserves_order_ids_and_language_honesty():
    catalog = load_catalog(str(PACKAGE))
    assert len(catalog.books) == 5
    assert catalog.package_approved_for_ingestion is False

    s01 = catalog.get_book("S01")
    assert "am-source" in s01.languages_available
    assert "en" in s01.languages_available

    f01 = catalog.get_book("F01")
    assert "en" in f01.languages_available
    # F01 is English reference — must not claim Amharic translation completeness.
    assert "am-source" not in f01.languages_available
    am_paras = [p for p in f01.paragraphs if p.has_amharic_source]
    assert am_paras == []

    # Paragraph order preserved
    orders = [p.order for p in s01.paragraphs]
    assert orders == list(range(1, len(orders) + 1))

    # Source IDs / review fields preserved on a sample
    sample = s01.paragraphs[0]
    assert sample.source_unit_ids
    assert sample.approved_for_ingestion is False
    assert isinstance(sample.unresolved_issue_ids, tuple)

    preview = catalog.preview_payload("F01")
    assert preview["published"] is False
    assert preview["visibility"] == "private_editorial_preview"
    first = preview["sections"][0]["paragraphs"][0]
    assert first["has_amharic_source"] is False
    assert "Amharic translation" in (first.get("note") or "")


def test_content_kind_distinguishes_supplements():
    catalog = load_catalog(str(PACKAGE))
    supplements = [
        p
        for p in catalog.iter_paragraphs()
        if p.content_kind == "reference_supplement" or p.role == "reference_supplement"
    ]
    assert len(supplements) == 33
    for s in supplements[:3]:
        assert s.content_kind == "reference_supplement"
        assert not s.source_unit_ids


def test_local_search_finds_english_and_amharic_source():
    catalog = load_catalog(str(PACKAGE))
    index = BookSearchIndex(catalog)
    en_hits = index.search("Trinity", document_id="F01", limit=5)
    assert en_hits
    assert all(h.approved_for_ingestion is False for h in en_hits)

    am_hits = index.search("ምሥጢር", document_id="S01", limit=5)
    # Ethiopic query should match source text when present
    assert am_hits
    assert any(h.has_amharic_source for h in am_hits)


def test_search_filters_content_kind_and_amharic_flag():
    catalog = load_catalog(str(PACKAGE))
    index = BookSearchIndex(catalog)
    reading = index.search(
        "Trinity",
        document_id="F01",
        content_kind="english_reading",
        limit=10,
    )
    assert reading
    assert all(h.content_kind == "english_reading" for h in reading)

    am_only = index.search("ምሥጢር", has_amharic_source=True, limit=10)
    assert am_only
    assert all(h.has_amharic_source for h in am_only)

    no_am = index.search("Trinity", document_id="F01", has_amharic_source=False, limit=10)
    assert no_am
    assert all(h.has_amharic_source is False for h in no_am)


def test_overlay_approval_does_not_mutate_package_or_open_ingest(tmp_path):
    catalog = load_catalog(str(PACKAGE))
    store = ApprovalStore(tmp_path / "approvals.json")
    para = next(catalog.iter_paragraphs("F01"))
    assert para.approved_for_ingestion is False

    store.record_decision(
        target_type="paragraph",
        target_id=para.id,
        document_id=para.document_id,
        approved_for_ingestion=True,
        reviewer="test-reviewer",
        notes="intent only",
    )
    assert store.has_explicit_approval(para) is True
    # Hard Qdrant gate still closed while package flag is false.
    assert is_approved_for_qdrant(para, store) is False

    # Package file on disk unchanged
    book_path = PACKAGE / "books" / "F01" / "F01.en.json"
    disk = json.loads(book_path.read_text(encoding="utf-8-sig"))
    disk_para = next(p for p in disk["paragraphs"] if p["id"] == para.id)
    assert disk_para["approved_for_ingestion"] is False


def test_unapproved_cannot_enter_qdrant_plan_or_upsert(tmp_path):
    catalog = load_catalog(str(PACKAGE))
    store = ApprovalStore(tmp_path / "approvals.json")
    # Even with document-level overlay approve:
    store.record_decision(
        target_type="document",
        target_id="F01",
        document_id="F01",
        approved_for_ingestion=True,
        reviewer="test-reviewer",
    )
    pipeline = QdrantIngestionPipeline(catalog, store)
    plan = pipeline.plan(document_id="F01")
    assert plan["candidate_count"] > 0
    assert plan["approved_count"] == 0
    assert plan["would_upsert"] == []
    assert plan["production_qdrant_touched"] is False

    class FakeClient:
        def __init__(self):
            self.calls = []

        def upsert(self, **kwargs):
            self.calls.append(kwargs)

    client = FakeClient()
    result = pipeline.execute_upsert(client, embed_fn=lambda t: [0.0, 0.0])
    assert result["upserted"] == 0
    assert client.calls == []


def test_paragraph_flag_alone_cannot_ingest_and_deny_via_overlay(tmp_path):
    catalog = load_catalog(str(PACKAGE))
    base = next(p for p in catalog.iter_paragraphs("F01") if p.role != "heading")
    approved = replace(
        base,
        approved_for_ingestion=True,
        unresolved_issue_ids=(),
        id="SYN-APPROVED-001",
    )
    # Patch catalog paragraph map for filter path
    catalog._paragraphs[approved.id] = approved  # noqa: SLF001
    candidates = build_ingest_candidates(catalog, document_id="F01")
    # Inject synthetic candidate
    from editorial.ingestion import _candidates_from_paragraph

    synthetic = _candidates_from_paragraph(catalog, approved)[0]
    store = ApprovalStore(tmp_path / "approvals.json")
    allowed = filter_approved([synthetic], catalog, store)
    assert allowed == []  # Whole-book/section approval and release grants are also required.

    # Overlay denial blocks package-true
    store.record_decision(
        target_type="paragraph",
        target_id=approved.id,
        document_id=approved.document_id,
        approved_for_ingestion=False,
        reviewer="test-reviewer",
        notes="revoke",
    )
    assert filter_approved([synthetic], catalog, store) == []


def test_unresolved_issues_block_even_if_package_true(tmp_path):
    catalog = load_catalog(str(PACKAGE))
    base = next(catalog.iter_paragraphs("F01"))
    blocked = replace(
        base,
        approved_for_ingestion=True,
        unresolved_issue_ids=("ISSUE-1",),
        id="SYN-BLOCKED-001",
    )
    catalog._paragraphs[blocked.id] = blocked  # noqa: SLF001
    from editorial.ingestion import _candidates_from_paragraph

    store = ApprovalStore(tmp_path / "approvals.json")
    assert is_approved_for_qdrant(blocked, store) is False
    assert filter_approved(_candidates_from_paragraph(catalog, blocked), catalog, store) == []


def test_search_buddy_retrieval_excludes_unapproved():
    catalog = load_catalog(str(PACKAGE))
    results = retrieve_for_search_buddy(catalog, "baptism sacrament trinity", limit=10)
    assert results == []


def test_editorial_routes_disabled_by_default():
    client = TestClient(main.app)
    # The route is mounted for useful diagnostics but still fails closed.
    response = client.get("/api/editorial/books")
    assert response.status_code == 401


def test_editorial_routes_require_token(monkeypatch, tmp_path):
    monkeypatch.setenv("ENABLE_EDITORIAL_PREVIEW", "1")
    monkeypatch.setenv("EDITORIAL_ALLOW_LEGACY_TOKEN", "1")
    monkeypatch.setenv("EDITORIAL_PREVIEW_TOKEN", "secret-test-token")
    monkeypatch.setenv("CONTENT_REVIEW_ROOT", str(PACKAGE))
    monkeypatch.setenv("EDITORIAL_APPROVAL_STORE", str(tmp_path / "a.json"))

    # Re-import router mount: TestClient uses already-built app without router.
    # Exercise router functions via inclusion on a fresh app if needed.
    from fastapi import FastAPI
    from editorial.router import router

    app = FastAPI()
    app.include_router(router)
    client = TestClient(app)

    denied = client.get("/api/editorial/books")
    assert denied.status_code == 401

    ok = client.get(
        "/api/editorial/books",
        headers={"X-Editorial-Token": "secret-test-token"},
    )
    assert ok.status_code == 200
    body = ok.json()
    assert len(body["books"]) == 5
    assert body["published"] is False

    plan = client.get(
        "/api/editorial/ingestion/plan",
        headers={"X-Editorial-Token": "secret-test-token"},
    )
    assert plan.status_code == 200
    assert plan.json()["approved_count"] == 0
