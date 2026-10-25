import json
from pathlib import Path

from fastapi.testclient import TestClient

import main
from editorial.cms_auth import EditorialPrincipal, require_editorial_principal
from editorial.mezmur_bulk import MezmurBulkStore, lyrics_text, normalize_name, publication_block


def store_without_environment() -> MezmurBulkStore:
    return object.__new__(MezmurBulkStore)


def test_name_normalization_handles_unicode_honorifics_and_punctuation():
    assert normalize_name("  ዘማሪ፣ ሳሙኤል  ") == "ሳሙኤል"
    assert normalize_name("ZEMARI — Samuel") == "samuel"


def test_exact_unique_zemari_match_and_ambiguity():
    store = store_without_environment()
    unique = [{"id": "one", "slug": "samuel", "name": "Samuel", "name_amharic": "ሳሙኤል", "deleted_at": None}]
    assert store.match_zemari({"singer_name": "Zemari Samuel"}, unique)[0] == "one"
    duplicate = unique + [{"id": "two", "slug": "samuel-two", "name": "Samuel", "name_amharic": None, "deleted_at": None}]
    match = store.match_zemari({"singer_name": "Samuel"}, duplicate)
    assert match[0] is None
    assert match[1] == "ambiguous"


def test_exact_slug_transliteration_is_deterministic_and_fuzzy_names_are_not_selected():
    store = store_without_environment()
    rows = [
        {"id": "one", "slug": "kidus-michael", "name": "Kidus Michael", "name_amharic": "ቅዱስ ሚካኤል", "deleted_at": None},
        {"id": "two", "slug": "kidus-mikael-live", "name": "Kidus Mikael", "name_amharic": None, "deleted_at": None},
    ]
    assert store.match_zemari({"singer_slug": "kidus-michael"}, rows)[1] == "normalized_transliteration"
    match = store.match_zemari({"singer_name": "Kidus Mikael"}, rows)
    assert match[0] == "two", "an exact normalized name must win before fuzzy matching"
    close = [
        {"id": "one", "slug": "samuel-one", "name": "Samuel Tesfaye", "name_amharic": None, "deleted_at": None},
        {"id": "two", "slug": "samuel-two", "name": "Samuel Tesfay", "name_amharic": None, "deleted_at": None},
    ]
    assert store.match_zemari({"singer_name": "Samuel Tesfai"}, close)[0] is None


def test_verified_alias_is_exact_unique_and_name_text_is_not_mutated():
    store = store_without_environment()
    rows = [{"id": "one", "slug": "abeba", "name": "Abeba Tesfaye", "name_amharic": "አበባ ተስፋዬ", "deleted_at": None}]
    aliases = [{"zemari_id": "one", "alias": "Abeba T.", "is_verified": True}]
    original = {"singer_name": "Abeba T."}
    assert store.match_zemari(original, rows, aliases)[1] == "verified_alias"
    assert original == {"singer_name": "Abeba T."}


def test_honorific_normalization_only_removes_prefixes():
    assert normalize_name("Deacon Samuel") == "samuel"
    assert normalize_name("ዲ/ን ሳሙኤል") == "ሳሙኤል"
    assert normalize_name("Samuel Zemari Choir") == "samuel zemari choir"


def test_existing_valid_link_is_preserved_and_deleted_link_is_rejected():
    store = store_without_environment()
    rows = [
        {"id": "kept", "slug": "kept", "name": "Kept", "name_amharic": None, "deleted_at": None},
        {"id": "trashed", "slug": "trashed", "name": "Trashed", "name_amharic": None, "deleted_at": "2026-01-01"},
    ]
    assert store.match_zemari({"zemari_id": "kept"}, rows)[1] == "existing_uuid"
    assert store.match_zemari({"zemari_id": "trashed"}, rows)[0] is None


def test_lyrics_are_original_language_first_and_missing_lyrics_block_publication():
    row = {"lyrics_amharic": "አማርኛ", "lyrics_english": "English", "lyrics_geez": "ግእዝ"}
    assert lyrics_text(row).split("\n\n") == ["አማርኛ", "ግእዝ", "English"]
    assert publication_block({"title": "Title", "slug": "slug"}) == "Amharic lyrics are required."


def test_publication_eligibility_is_independent_from_ai_confidence():
    base = {"title": "Title", "slug": "slug", "lyrics_amharic": "ግጥም"}
    assert publication_block({**base, "rights_status": "unknown", "youtube_url": ""}) is not None
    assert publication_block({**base, "rights_status": "unknown", "youtube_url": "https://youtu.be/example"}) is None
    assert publication_block({
        **base, "rights_status": "licensed", "publication_approved_at": "now", "publication_approved_by": "user"
    }) is None


def test_all_rows_paginates_beyond_one_thousand():
    store = store_without_environment()
    calls = []

    def rows(_table, params):
        calls.append(int(params["offset"]))
        offset = int(params["offset"])
        return [{"id": i} for i in range(offset, min(offset + 500, 1001))]

    store.rows = rows
    result = store.all_rows("example", {"select": "id"}, 500)
    assert len(result) == 1001
    assert calls == [0, 500, 1000]


def test_atomic_job_claim_allows_only_one_worker(monkeypatch):
    store = store_without_environment()
    store.key = "service-key"
    responses = [
        [{"id": "job-one", "status": "running"}],
        [],
    ]

    class Response:
        status_code = 200

        def __init__(self, payload):
            self._payload = payload
            self.content = json.dumps(payload).encode()

        def json(self):
            return self._payload

    def request(method, path, **kwargs):
        assert method == "PATCH"
        assert path == "/rest/v1/mezmur_enrichment_jobs"
        assert kwargs["params"]["status"] == "eq.queued"
        return Response(responses.pop(0))

    monkeypatch.setattr(store, "request", request)
    assert store.claim_job("job-one")["status"] == "running"
    assert store.claim_job("job-one") is None


def test_classifier_uses_actual_amharic_and_geez_lyrics_and_rejects_unknown_taxonomy(monkeypatch):
    store = store_without_environment()
    store._ai_headers = lambda: {"Authorization": "Bearer test"}
    captured = {}

    class Response:
        status_code = 200

        def json(self):
            return {"choices": [{"message": {"content": json.dumps({
                "primary_category": "praise", "additional_categories": ["invented"],
                "primary_occasion": "sunday", "additional_occasions": [],
                "hymn_sections": [], "evidence": ["ክብር ለእግዚአብሔር"],
                "classification_confidence": .88, "requires_review": False, "reason": "Lyric evidence",
            })}}]}

    def post(_url, **kwargs):
        captured.update(kwargs["json"])
        return Response()

    monkeypatch.setattr("editorial.mezmur_bulk.httpx.post", post)
    catalog = {
        "categories": [{"slug": "praise"}], "occasions": [{"slug": "sunday"}], "sections": [],
    }
    result = store.analyze({"lyrics_amharic": "ክብር ለእግዚአብሔር", "lyrics_geez": "ስብሐት ለእግዚአብሔር"}, catalog)
    prompt = captured["messages"][1]["content"]
    assert "ክብር ለእግዚአብሔር" in prompt and "ስብሐት ለእግዚአብሔር" in prompt
    assert result["primary_category"] == "praise"
    assert "invented" not in result["additional_categories"]
    assert result["requires_review"] is True


def _principal(role="super_admin"):
    return EditorialPrincipal(
        user_id="00000000-0000-4000-8000-000000000001", cms_role=role, auth_method="cms_jwt"
    )


def test_production_entrypoint_registers_bulk_and_church_library_routes():
    paths = TestClient(main.app).get("/openapi.json").json()["paths"]
    expected = {
        "/api/mezmur-bulk/dashboard", "/api/mezmur-bulk/jobs", "/api/mezmur-bulk/jobs/{job_id}",
        "/api/mezmur-bulk/jobs/{job_id}/suggestions", "/api/mezmur-bulk/jobs/{job_id}/resume",
        "/api/mezmur-bulk/jobs/{job_id}/cancel", "/api/mezmur-bulk/jobs/{job_id}/suggestions/apply",
        "/api/mezmur-bulk/publish", "/api/church-library/status", "/api/church-library/search",
    }
    assert expected <= set(paths)
    assert TestClient(main.app).get("/api/mezmur-bulk/dashboard").status_code == 401


def test_authenticated_dashboard_jobs_and_idempotent_create_contract(monkeypatch):
    started = []

    class FakeStore:
        def dashboard(self):
            return {"drafts": 1001, "with_lyrics": 900, "missing_lyrics": 101}

        def jobs(self, limit):
            assert limit == 20
            return []

        def create_job_as_user(self, *, mode, import_ids, access_token):
            assert mode == "all" and import_ids == [] and access_token == "session-token"
            return ({"id": "00000000-0000-4000-8000-000000000010", "status": "queued"}, True)

        def run(self, job_id):
            started.append(job_id)

    monkeypatch.setattr("editorial.mezmur_bulk_router.MezmurBulkStore", FakeStore)
    main.app.dependency_overrides[require_editorial_principal] = _principal
    try:
        client = TestClient(main.app)
        assert client.get("/api/mezmur-bulk/dashboard", headers={"Authorization": "Bearer session-token"}).json()["drafts"] == 1001
        assert client.get("/api/mezmur-bulk/jobs", headers={"Authorization": "Bearer session-token"}).json() == []
        created = client.post("/api/mezmur-bulk/jobs", headers={"Authorization": "Bearer session-token"}, json={"mode": "all", "import_ids": []})
        assert created.status_code == 200
        assert started == ["00000000-0000-4000-8000-000000000010"]
    finally:
        main.app.dependency_overrides.clear()


def test_duplicate_create_does_not_start_a_second_worker(monkeypatch):
    started = []

    class FakeStore:
        def create_job_as_user(self, *, mode, import_ids, access_token):
            return ({"id": "00000000-0000-4000-8000-000000000010", "status": "running"}, False)

        def run(self, job_id):
            started.append(job_id)

    monkeypatch.setattr("editorial.mezmur_bulk_router.MezmurBulkStore", FakeStore)
    main.app.dependency_overrides[require_editorial_principal] = _principal
    try:
        response = TestClient(main.app).post(
            "/api/mezmur-bulk/jobs",
            headers={"Authorization": "Bearer session-token"},
            json={"mode": "all", "import_ids": []},
        )
        assert response.status_code == 200
        assert response.json()["status"] == "running"
        assert started == []
    finally:
        main.app.dependency_overrides.clear()


def test_resume_and_cancel_use_guarded_state_transitions(monkeypatch):
    transitions = []
    ran = []

    class FakeStore:
        def transition_job(self, job_id, allowed_statuses, payload):
            transitions.append((job_id, allowed_statuses, payload))
            if allowed_statuses == ["queued"]:
                return {"id": job_id, "status": "cancelled"}
            if allowed_statuses == ["cancelled", "failed"]:
                return {"id": job_id, "status": "queued"}
            return None

        def run(self, job_id):
            ran.append(job_id)

    monkeypatch.setattr("editorial.mezmur_bulk_router.MezmurBulkStore", FakeStore)
    main.app.dependency_overrides[require_editorial_principal] = _principal
    job_id = "00000000-0000-4000-8000-000000000010"
    try:
        client = TestClient(main.app)
        cancelled = client.post(f"/api/mezmur-bulk/jobs/{job_id}/cancel")
        assert cancelled.status_code == 200 and cancelled.json()["status"] == "cancelled"
        resumed = client.post(f"/api/mezmur-bulk/jobs/{job_id}/resume")
        assert resumed.status_code == 200 and resumed.json()["status"] == "resume_requested"
        assert ran == [job_id]
        assert transitions[0][1] == ["queued"]
        assert transitions[1][1] == ["cancelled", "failed"]
    finally:
        main.app.dependency_overrides.clear()


def test_apply_and_publish_routes_preserve_database_authorization(monkeypatch):
    suggestion = "00000000-0000-4000-8000-000000000020"
    mezmur = "00000000-0000-4000-8000-000000000030"

    class FakeStore:
        def rows(self, table, params):
            assert table == "mezmur_enrichment_suggestions"
            return [{"id": suggestion}]

        def user_rpc(self, name, payload, access_token):
            assert access_token == "session-token"
            if name == "apply_mezmur_enrichment_suggestion":
                return {"status": "applied"}
            assert name == "bulk_publish_mezmur_imports"
            return {"published": 1, "skipped": 0, "failed": 0, "results": [{"import_id": mezmur, "outcome": "published"}]}

    monkeypatch.setattr("editorial.mezmur_bulk_router.MezmurBulkStore", FakeStore)
    main.app.dependency_overrides[require_editorial_principal] = _principal
    headers = {"Authorization": "Bearer session-token"}
    try:
        client = TestClient(main.app)
        applied = client.post(
            "/api/mezmur-bulk/jobs/00000000-0000-4000-8000-000000000010/suggestions/apply",
            headers=headers, json={"suggestion_ids": [suggestion]},
        )
        assert applied.status_code == 200 and applied.json()[0]["ok"] is True
        published = client.post("/api/mezmur-bulk/publish", headers=headers, json={"import_ids": [mezmur]})
        assert published.status_code == 200 and published.json()["published"] == 1
        main.app.dependency_overrides[require_editorial_principal] = lambda: _principal("editor")
        assert client.post("/api/mezmur-bulk/publish", headers=headers, json={"import_ids": [mezmur]}).status_code == 403
    finally:
        main.app.dependency_overrides.clear()


def test_migrations_preserve_manual_links_and_protected_publish_rpc():
    root = Path(__file__).resolve().parents[2]
    base = (root / "supabase/migrations/20261024230000_mezmur_bulk_management.sql").read_text(encoding="utf-8")
    idempotency = (root / "supabase/migrations/20261024250000_mezmur_bulk_job_idempotency.sql").read_text(encoding="utf-8")
    assert "where not exists" in base.lower()
    assert "publish_mezmur_import(v_m.slug,v_m.updated_at)" in base
    assert "pg_advisory_xact_lock" in idempotency
    assert "created_by = v_actor" in idempotency
