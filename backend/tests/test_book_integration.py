"""Package tests and synthetic release tests. Never approve actual book records."""
from __future__ import annotations

from collections import Counter
from copy import deepcopy
from dataclasses import replace
import json
from pathlib import Path
import uuid

import httpx
import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient

from editorial.catalog import BookCatalog, load_catalog
from editorial.models import BookRecord, SectionRecord, ParagraphRecord, ContentSegment, SourceAttribution
from editorial.ingestion import QdrantIngestionPipeline, build_ingest_candidates, filter_approved
from editorial.library import ApprovedBookLibrary
from editorial.qdrant_local import LocalQdrantSink
from editorial.release import ReleaseManifest
from editorial.reader import reading_page
from editorial.paths import content_review_root
from editorial.approval_store import ApprovalStore
from editorial.validation import PackageError, package_path, strict_flag, validate_book, read_json, read_jsonl
from editorial.retrieval import retrieve_for_search_buddy


@pytest.fixture(scope="module")
def actual():
    root = content_review_root()
    if not (root / "Catalog.json").is_file():
        pytest.skip("content-review package not present (set CONTENT_REVIEW_ROOT for private eval)")
    return load_catalog(str(root))


@pytest.mark.parametrize("doc,count,sections", [("F01",482,17),("S01",589,9),("E01",669,11),
                                               ("M01",740,8),("W01",523,10)])
def test_each_book_exact_order_alignment_and_locators(actual, doc, count, sections):
    b = actual.get_book(doc)
    assert len(b.paragraphs) == count and len(b.sections) == sections
    assert [p.order for p in b.paragraphs] == list(range(1, count + 1))
    assert [i for s in b.sections for i in s.unit_ids] == [p.id for p in b.paragraphs]
    archive = {s["id"]:s for s in read_jsonl(actual.root / "provenance/Source_Aligned_Paragraphs.jsonl")}
    for p in b.paragraphs:
        assert [s.unit_id for s in p.source_attributions] == list(p.source_unit_ids)
        assert [s.original_text for s in p.source_attributions] == [archive[i]["original_text"] for i in p.source_unit_ids]
        assert p.approved_for_ingestion is False


def test_reading_pagination_has_no_gaps_or_duplicates(actual):
    for b in actual.books:
        ids, cursor = [], None
        while True:
            page = reading_page(actual, b.document_id, after=cursor, limit=37)
            ids.extend(p["id"] for p in page["items"])
            cursor = page["page"]["next_after"]
            assert page["source_page_mapping"] is None
            if cursor is None:
                break
        assert ids == [p.id for p in b.paragraphs]
        second = reading_page(actual, b.document_id, after=b.paragraphs[36].id, limit=37)
        assert second["page"]["has_previous"] and second["page"]["previous_after"] is None
        with pytest.raises(ValueError):
            reading_page(actual, b.document_id, after="WRONG-CURSOR")


def test_current_package_has_zero_public_variants(actual):
    library = ApprovedBookLibrary(actual)
    assert library.catalog_payload()["books"] == []
    assert library.reading_page("S01")["items"] == []
    assert library.search("Trinity") == []
    assert library.search("ምሥጢር", language="am") == []
    assert retrieve_for_search_buddy(actual, "ምሥጢር", language="am") == []
    assert QdrantIngestionPipeline(actual).plan()["approved_count"] == 0


def test_variant_ids_languages_and_mixed_explanations(actual):
    variants = build_ingest_candidates(actual)
    assert len({c.point_id for c in variants}) == len(variants)
    assert all(uuid.UUID(c.point_id).version == 5 for c in variants)
    assert Counter(c.language for c in variants)["am"] > 2500
    assert sum(c.content_kind == "supplemental_explanation" for c in variants) == 36
    original = next(c for c in variants if c.language == "am")
    assert original.text == actual.get_paragraph(original.paragraph_id).source_attributions[0].original_text
    assert json.loads(json.dumps(original.payload, ensure_ascii=False))["text"] == original.text
    for pid in ("S01-P0060", "S01-P0386", "S01-P0416"):
        parts = [c for c in variants if c.paragraph_id == pid and c.content_kind != "original_source"]
        assert len(parts) == 2
        assert {c.content_kind for c in parts} == {"translation", "supplemental_explanation"}


@pytest.mark.parametrize("value", ["false", "true", 0, 1, None, [], {}])
def test_approval_coercion_rejected(value):
    with pytest.raises(PackageError):
        strict_flag({"approved_for_ingestion": value}, "approved_for_ingestion")


@pytest.mark.parametrize("relative", ["../outside.json", "C:/outside.json"])
def test_catalog_path_cannot_escape(tmp_path, relative):
    with pytest.raises(PackageError):
        package_path(tmp_path, relative)


@pytest.mark.parametrize("mutation", ["duplicate", "order", "boolean", "source", "bilingual", "section"])
def test_corrupt_book_fails_closed(actual, tmp_path, mutation):
    entry = deepcopy(actual.catalog_meta["books"][0])
    book = read_json(actual.root / entry["json"])
    bi = read_jsonl(actual.root / entry["bilingual_jsonl"])
    sources = {s["id"]:s for s in read_jsonl(actual.root / "provenance/Source_Aligned_Paragraphs.jsonl")}
    if mutation == "duplicate": book["paragraphs"][1]["id"] = book["paragraphs"][0]["id"]
    if mutation == "order": book["paragraphs"].reverse()
    if mutation == "boolean": book["paragraphs"][0]["approved_for_ingestion"] = "false"
    if mutation == "source": book["paragraphs"][0]["source_unit_ids"] = ["LOST-ID"]
    if mutation == "bilingual": bi[0]["source_records"][0]["original_text"] = "forged"
    if mutation == "section": book["sections"][0]["unit_ids"].reverse()
    for key, data in (("json", book), ("jsonl", book["paragraphs"]), ("bilingual_jsonl", bi)):
        path = tmp_path / entry[key]
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(data) if key == "json" else "\n".join(json.dumps(r) for r in data), encoding="utf-8")
    with pytest.raises(PackageError):
        validate_book(tmp_path, entry, sources)


@pytest.fixture
def approved(tmp_path, monkeypatch):
    # Entirely synthetic content; no real package approval flags are touched.
    p = ParagraphRecord(id="SYN-P1", document_id="SYN", section_id="SYN-S1", order=1,
                        role="paragraph", text_en="Synthetic baptism passage", language="en",
                        content_origin="source_translation", content_kind="english_reading",
                        approved_for_ingestion=True, approval_status="Approved",
                        source_unit_ids=("SYN-SOURCE1",), reference_unit_ids=(), unresolved_issue_ids=(),
                        revision_ids=(), review_issue_ids=(),
                        content_segments=(ContentSegment("source_translation", "Synthetic baptism passage"),),
                        source_attributions=(SourceAttribution("SYN-SOURCE1", "am-with-Geʽez", "ምሥጢር ጥምቀት", True),),
                        raw={"id":"SYN-P1","text":"Synthetic baptism passage","approved_for_ingestion":True})
    s = SectionRecord("SYN-S1", "SYN", "Synthetic section", (p.id,), 2, "Approved", {"final_approval":"Approved"})
    b = BookRecord("SYN", "Synthetic book", True, (s,), (p,),
                   {"approved_for_ingestion":True,"final_human_approval":True})
    catalog = BookCatalog(tmp_path, (b,), {"approved_for_ingestion":True,"version":"synthetic"},
                          {"whole_book_final_signoffs":[{"document_id":"SYN","approved":True}]})
    candidates = build_ingest_candidates(catalog)
    path = tmp_path / "release.json"
    path.write_text(json.dumps({"schema_version":1,"grants":[
        dict(point_id=c.point_id, document_id=c.document_id, paragraph_id=c.paragraph_id,
             content_sha256=c.payload["content_sha256"], approved_for_ingestion=True,
             reviewer="Synthetic test reviewer", decided_at="2026-10-18T12:00:00-04:00") for c in candidates]}), encoding="utf-8")
    release = ReleaseManifest(path)
    monkeypatch.setattr("editorial.ingestion.load_catalog", lambda _: catalog)
    return catalog, release, candidates


class MemoryQdrant:
    def __init__(self):
        self.points, self.calls = {}, []
        self.fail_upsert = False
        self.fail_delete = False
        self.sink = LocalQdrantSink("http://127.0.0.1:6333", transport=httpx.MockTransport(self.handle))

    def handle(self, request):
        body = json.loads(request.content)
        self.calls.append((request.method, str(request.url), body))
        if request.method == "PUT":
            for p in body["points"]:
                self.points[p["id"]] = deepcopy(p)
                if self.fail_upsert:
                    self.fail_upsert = False
                    raise httpx.ReadTimeout("synthetic partial write")
            result = {"status":"completed"}
        elif request.url.path.endswith("/delete"):
            if self.fail_delete:
                self.fail_delete = False
                raise httpx.ReadTimeout("synthetic delete timeout")
            filters = body["filter"]["must"]
            for pid in filters[0]["has_id"]:
                if self.points.get(pid, {}).get("payload", {}).get("batch_id") == filters[1]["match"]["value"]:
                    self.points.pop(pid, None)
            result = {"status":"completed"}
        else:
            result = [self.points[i] for i in body["ids"] if i in self.points]
        return httpx.Response(200, json={"status":"ok","result":result})


def pipeline(approved, tmp_path, **kwargs):
    c, release, _ = approved
    return QdrantIngestionPipeline(c, release=release, journal_path=tmp_path / "journal.sqlite3", **kwargs)


def test_approved_en_am_retrieval_and_variant_grants(approved):
    c, release, candidates = approved
    assert len(filter_approved(candidates, c, release=release)) == 2
    assert len(filter_approved(candidates + candidates, c, release=release)) == 2
    assert filter_approved(candidates, c) == []
    assert retrieve_for_search_buddy(c, "baptism", release=release)[0]["book_title"] == "Synthetic book"
    assert retrieve_for_search_buddy(c, "ጥምቀት", release=release, language="am")[0]["text"] == "ምሥጢር ጥምቀት"
    release.path.unlink()
    assert retrieve_for_search_buddy(c, "baptism", release=release) == []


def test_forged_candidate_and_stale_vector_payload_rejected(approved):
    c, release, candidates = approved
    forged = replace(candidates[0], text="UNAPPROVED")
    assert filter_approved([forged], c, release=release) == []
    lib = ApprovedBookLibrary(c, release=release)
    assert lib.verify_vector_hits([{"id":candidates[0].point_id,"payload":{"content_sha256":"stale"}}]) == []
    verified = lib.verify_vector_hits([{"id":candidates[0].point_id,"payload":{
        "text":"UNAPPROVED", "content_sha256":candidates[0].payload["content_sha256"]}}])
    assert verified[0]["text"] == candidates[0].text


@pytest.mark.parametrize("layer", ["catalog","book","metadata","human","signoff","section","paragraph","issue"])
def test_every_approval_layer_is_required(approved, layer):
    c, release, candidates = approved
    b, p = c.books[0], c.books[0].paragraphs[0]
    if layer == "catalog": c.catalog_meta["approved_for_ingestion"] = False
    if layer == "metadata": b.metadata["approved_for_ingestion"] = False
    if layer == "human": b.metadata["final_human_approval"] = False
    if layer == "signoff": c.approval_queue["whole_book_final_signoffs"][0]["approved"] = False
    if layer == "section": b.sections[0].raw["final_approval"] = "Pending"
    if layer == "book": c._by_doc["SYN"] = replace(b, package_approved_for_ingestion=False)
    if layer == "paragraph": c._paragraphs[p.id] = replace(p, approved_for_ingestion=False)
    if layer == "issue": c._paragraphs[p.id] = replace(p, unresolved_issue_ids=("UNRESOLVED",))
    assert filter_approved(candidates, c, release=release) == []


def test_overlay_denial_and_release_revocation_are_immediate(approved, tmp_path):
    c, release, candidates = approved
    store = ApprovalStore(tmp_path / "overlay.json")
    ApprovalStore(store.path).record_decision(target_type="document",target_id="SYN",document_id="SYN",
                                            approved_for_ingestion=False,reviewer="Synthetic reviewer")
    assert filter_approved(candidates, c, store, release) == []
    data = json.loads(release.path.read_text())
    data["grants"][0]["approved_for_ingestion"] = False
    release.path.write_text(json.dumps(data))
    assert len(filter_approved(candidates, c, release=release)) == 1


def test_ingestion_idempotence_and_rollback(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    result = p.execute_upsert(q.sink, embed_fn=lambda _: [1.0, 0.5], embedding_id="synthetic-v1")
    assert result["upserted"] == 2 and len(q.points) == 2
    batch = result["batch_id"]
    assert p.execute_upsert(q.sink, embed_fn=lambda _: [1.0,0.5], embedding_id="synthetic-v1", batch_id=batch)["upserted"] == 0
    duplicate = p.execute_upsert(q.sink, embed_fn=lambda _: [1.0,0.5], embedding_id="synthetic-v1")
    assert duplicate["upserted"] == 0
    assert p.rollback(q.sink, duplicate["batch_id"])["deleted"] == 0
    assert len(q.points) == 2
    assert p.rollback(q.sink, batch)["deleted"] == 2 and not q.points
    assert p.rollback(q.sink, batch)["deleted"] == 0
    assert all("127.0.0.1:6333/collections/tewahedo_editorial_books_local/" in url for _,url,_ in q.calls)


def test_partial_write_can_retry_then_rollback(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    batch = str(uuid.uuid4())
    q.fail_upsert = True
    with pytest.raises(httpx.ReadTimeout):
        p.execute_upsert(q.sink, embed_fn=lambda _: [1.0], embedding_id="synthetic-v1", batch_id=batch)
    assert len(q.points) == 1
    with pytest.raises(ValueError, match="pending batch"):
        p.execute_upsert(q.sink, embed_fn=lambda _: [1.0], embedding_id="synthetic-v1")
    assert p.execute_upsert(q.sink, embed_fn=lambda _: [1.0], embedding_id="synthetic-v1", batch_id=batch)["upserted"] == 2
    q.fail_delete = True
    with pytest.raises(httpx.ReadTimeout): p.rollback(q.sink, batch)
    p.rollback(q.sink, batch)
    assert q.points == {}


def test_rollback_works_after_approval_revocation(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    result = p.execute_upsert(q.sink, embed_fn=lambda _: [1.0], embedding_id="synthetic-v1")
    approved[1].path.unlink()
    p.rollback(q.sink, result["batch_id"])
    assert not q.points


def test_different_model_cannot_overwrite_existing_points(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    p.execute_upsert(q.sink, embed_fn=lambda _: [1.0], embedding_id="synthetic-v1")
    with pytest.raises(ValueError, match="Existing point differs"):
        p.execute_upsert(q.sink, embed_fn=lambda _: [2.0], embedding_id="synthetic-v2")


def test_approval_revoked_during_embedding_prevents_writes(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    def embed(_):
        approved[1].path.unlink(missing_ok=True)
        return [1.0]
    with pytest.raises(ValueError, match="Approval or content changed"):
        p.execute_upsert(q.sink, embed_fn=embed, embedding_id="synthetic-v1")
    assert q.calls == []


@pytest.mark.parametrize("url", ["https://qdrant.example:6333", "http://10.0.0.4:6333",
                                 "http://localhost:6333", "http://127.0.0.1:8000", "http://127.0.0.1:6333/path"])
def test_production_sink_targets_rejected(url):
    with pytest.raises(ValueError): LocalQdrantSink(url)


@pytest.mark.parametrize("vector", [[], [float("nan")], [float("inf")], ["1"], [True]])
def test_bad_embedding_never_writes(approved, tmp_path, vector):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    with pytest.raises(ValueError):
        p.execute_upsert(q.sink, embed_fn=lambda _:vector, embedding_id="synthetic-v1")
    assert q.calls == []


def test_private_reader_auth_bounds_and_cache_policy(monkeypatch, actual):
    from editorial.router import router
    monkeypatch.setenv("ENABLE_EDITORIAL_PREVIEW", "1")
    monkeypatch.setenv("EDITORIAL_ALLOW_LEGACY_TOKEN", "1")
    monkeypatch.setenv("EDITORIAL_PREVIEW_TOKEN", "synthetic-token")
    app = FastAPI(); app.include_router(router)
    client = TestClient(app)
    path = "/api/editorial/books/S01/paragraphs"
    assert client.get(path).status_code == 401
    assert client.get(path, headers={"X-Editorial-Token":"wrong"}).status_code == 401
    headers = {"X-Editorial-Token":"synthetic-token"}
    ok = client.get(path, headers=headers)
    assert ok.status_code == 200 and len(ok.json()["items"]) == 20
    assert ok.headers["cache-control"] == "no-store"
    assert client.get(path + "?limit=101", headers=headers).status_code == 422
    assert client.get(path + "?after=WRONG", headers=headers).status_code == 400
    assert client.get("/api/editorial/books/UNKNOWN/paragraphs", headers=headers).status_code == 404
    monkeypatch.setenv("ENABLE_EDITORIAL_PREVIEW", "0")
    assert client.get(path, headers=headers).status_code == 404


@pytest.mark.parametrize("mutation", ["string", "duplicate", "hash", "reviewer", "timestamp"])
def test_invalid_or_stale_release_grants_fail_closed(approved, mutation):
    c, release, candidates = approved
    data = json.loads(release.path.read_text())
    if mutation == "string": data["grants"][0]["approved_for_ingestion"] = "true"
    if mutation == "duplicate": data["grants"].append(data["grants"][0])
    if mutation == "hash": data["grants"][0]["content_sha256"] = "old"
    if mutation == "reviewer": data["grants"][0]["reviewer"] = " "
    if mutation == "timestamp": data["grants"][0]["decided_at"] = "2026-10-18T12:00:00"
    release.path.write_text(json.dumps(data))
    if mutation in {"string", "duplicate"}:
        with pytest.raises(ValueError): filter_approved(candidates, c, release=release)
    else:
        assert len(filter_approved(candidates, c, release=release)) == 1


def test_partial_write_can_rollback_without_retry(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    batch = str(uuid.uuid4())
    q.fail_upsert = True
    with pytest.raises(httpx.ReadTimeout):
        p.execute_upsert(q.sink, embed_fn=lambda _:[1.0], embedding_id="synthetic-v1", batch_id=batch)
    p.rollback(q.sink, batch)
    assert not q.points


def test_rollback_rejects_changed_point_ownership(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    result = p.execute_upsert(q.sink, embed_fn=lambda _:[1.0], embedding_id="synthetic-v1")
    first = next(iter(q.points.values()))
    first["payload"]["batch_id"] = "someone-else"
    with pytest.raises(ValueError, match="ownership changed"):
        p.rollback(q.sink, result["batch_id"])
    assert len(q.points) == 2


def test_ingestion_requires_sink_journal_and_model(approved, tmp_path):
    p, q = pipeline(approved, tmp_path), MemoryQdrant()
    with pytest.raises(ValueError, match="LocalQdrantSink"):
        p.execute_upsert(object(), embed_fn=lambda _:[1.0], embedding_id="synthetic-v1")
    with pytest.raises(ValueError, match="embedding_id"):
        p.execute_upsert(q.sink, embed_fn=lambda _:[1.0])
    with pytest.raises(ValueError, match="journal_path"):
        QdrantIngestionPipeline(approved[0], release=approved[1]).execute_upsert(
            q.sink, embed_fn=lambda _:[1.0], embedding_id="synthetic-v1")
    assert q.calls == []


def test_real_unapproved_package_never_calls_embedding_or_sink(actual):
    def forbidden(_): raise AssertionError("Unapproved text reached embedding")
    assert QdrantIngestionPipeline(actual).execute_upsert(object(), embed_fn=forbidden)["upserted"] == 0


def test_private_approval_api_rejects_nonboolean_and_cross_book_targets(monkeypatch):
    from editorial.router import router
    monkeypatch.setenv("ENABLE_EDITORIAL_PREVIEW", "1")
    monkeypatch.setenv("EDITORIAL_ALLOW_LEGACY_TOKEN", "1")
    monkeypatch.setenv("EDITORIAL_PREVIEW_TOKEN", "synthetic-token")
    app = FastAPI(); app.include_router(router)
    client = TestClient(app)
    body = dict(target_type="paragraph", target_id="S01-P0001", document_id="F01",
                reviewer="Synthetic reviewer", approved_for_ingestion="false")
    headers = {"X-Editorial-Token":"synthetic-token"}
    assert client.post("/api/editorial/approvals", json=body, headers=headers).status_code == 422
    body["approved_for_ingestion"] = False
    assert client.post("/api/editorial/approvals", json=body, headers=headers).status_code == 404
