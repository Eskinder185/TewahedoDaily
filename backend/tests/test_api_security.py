"""API-level security tests using FastAPI TestClient (mocked upstream)."""

from __future__ import annotations

import asyncio
import json

import httpx
import pytest
from fastapi.testclient import TestClient

import main
import security as sec


@pytest.fixture
def client(monkeypatch):
    async def fake_supabase_get(path, params=None):
        return []

    monkeypatch.setattr(main, "supabase_get", fake_supabase_get)

    # Patch LiteLLM calls by stubbing httpx.AsyncClient
    class FakeResponse:
        status_code = 200

        def raise_for_status(self):
            return None

        def json(self):
            return {
                "choices": [
                    {
                        "finish_reason": "stop",
                        "message": {"content": "Test answer about the Church."},
                    }
                ],
                "usage": {"completion_tokens": 12},
            }

    class FakeAsyncClient:
        def __init__(self, *args, **kwargs):
            pass

        async def __aenter__(self):
            return self

        async def __aexit__(self, *args):
            return False

        async def post(self, *args, **kwargs):
            return FakeResponse()

    monkeypatch.setattr(httpx, "AsyncClient", FakeAsyncClient)

    # Secrets are read via pathlib.Path inside chat — patch Path used there.
    import pathlib

    real_path = pathlib.Path

    class SecretPath(type(real_path())):
        def read_text(self, *args, **kwargs):
            return "test-secret"

    def path_factory(*args, **kwargs):
        if args and str(args[0]).startswith("/run/secrets"):
            p = real_path(*args, **kwargs)
            p.read_text = lambda *a, **k: "test-secret"  # type: ignore
            return p
        return real_path(*args, **kwargs)

    # Simpler: monkeypatch the read inside by replacing Path in the chat closure.
    # chat does `from pathlib import Path` locally — patch pathlib.Path.read_text via instance.

    original_read = pathlib.Path.read_text

    def safe_read(self, *args, **kwargs):
        if "tewahedo-ai" in str(self) or "secrets" in str(self):
            return "test-secret"
        return original_read(self, *args, **kwargs)

    monkeypatch.setattr(pathlib.Path, "read_text", safe_read)

    with TestClient(main.app) as test_client:
        yield test_client


def test_health(client):
    res = client.get("/health")
    assert res.status_code == 200
    assert res.json()["status"] == "healthy"


def test_debug_routes_disabled_by_default(client):
    assert client.get("/debug/supabase").status_code == 404
    assert client.get("/api/bible/test").status_code == 404


def test_debug_routes_enabled(monkeypatch, client):
    sec.ENABLE_DEBUG_ROUTES = True
    res = client.get("/debug/supabase")
    assert res.status_code == 200
    body = res.json()
    assert "url_configured" in body
    assert "key_configured" in body
    assert "SUPABASE_KEY" not in json.dumps(body)


def test_chat_body_too_large(client):
    huge = {"message": "x" * (sec.MAX_REQUEST_BODY_BYTES + 100)}
    res = client.post("/api/chat", json=huge)
    assert res.status_code == 413
    assert "too large" in res.json()["detail"].lower()


def test_chat_invalid_json_does_not_consume_rate_limit(client):
    for _ in range(5):
        res = client.post(
            "/api/chat",
            content=b"{not-json",
            headers={"content-type": "application/json"},
        )
        assert res.status_code == 422
    # Valid requests should still be allowed (quota unused by 422s).
    ok = client.post("/api/chat", json={"message": "Hello theology test"})
    assert ok.status_code in {200, 503}


def test_chat_rate_limit_per_client(client):
    # Lower limits for a fast test.
    sec.chat_rate_limiter.per_client = 3
    sec.chat_rate_limiter.global_limit = 1000
    statuses = []
    for _ in range(4):
        res = client.post(
            "/api/chat",
            json={"message": "Explain the Holy Trinity briefly"},
            headers={"cf-connecting-ip": "198.51.100.20"},
        )
        statuses.append(res.status_code)
    assert statuses[:3].count(429) == 0
    assert statuses[3] == 429
    assert statuses[3] == 429
    assert client.post(
        "/api/chat",
        json={"message": "Explain the Holy Trinity briefly"},
        headers={"cf-connecting-ip": "198.51.100.20"},
    ).headers.get("retry-after") == "60"


def test_chat_success_shape(client):
    res = client.post(
        "/api/chat",
        json={"message": "Explain Ethiopian Orthodox fasting briefly"},
    )
    assert res.status_code == 200
    data = res.json()
    assert data["type"] == "ai"
    assert isinstance(data.get("answer"), str) and data["answer"]
    assert isinstance(data.get("sources"), list)


def test_chat_upstream_malformed_json(client, monkeypatch):
    class BadResponse:
        status_code = 200

        def raise_for_status(self):
            return None

        def json(self):
            raise ValueError("no json")

    class FakeAsyncClient:
        def __init__(self, *a, **k):
            pass

        async def __aenter__(self):
            return self

        async def __aexit__(self, *a):
            return False

        async def post(self, *a, **k):
            return BadResponse()

    monkeypatch.setattr(httpx, "AsyncClient", FakeAsyncClient)
    res = client.post("/api/chat", json={"message": "What is Theotokos?"})
    assert res.status_code == 503
    assert "invalid" in res.json()["detail"].lower() or "unavailable" in res.json()[
        "detail"
    ].lower()


def test_chat_upstream_empty_choices(client, monkeypatch):
    class EmptyResponse:
        status_code = 200

        def raise_for_status(self):
            return None

        def json(self):
            return {"choices": []}

    class FakeAsyncClient:
        def __init__(self, *a, **k):
            pass

        async def __aenter__(self):
            return self

        async def __aexit__(self, *a):
            return False

        async def post(self, *a, **k):
            return EmptyResponse()

    monkeypatch.setattr(httpx, "AsyncClient", FakeAsyncClient)
    res = client.post("/api/chat", json={"message": "What is baptism?"})
    assert res.status_code == 503


@pytest.mark.asyncio
async def test_ai_semaphore_rejects_when_saturated():
    sem = asyncio.Semaphore(2)
    await sem.acquire()
    await sem.acquire()
    with pytest.raises(Exception) as excinfo:
        await sec.acquire_semaphore(
            sem,
            wait_seconds=0.05,
            busy_detail="AI is busy. Please try again shortly.",
            retry_after="5",
        )
    from fastapi import HTTPException

    assert isinstance(excinfo.value, HTTPException)
    assert excinfo.value.status_code == 503
    assert excinfo.value.headers.get("Retry-After") == "5"
    sem.release()
    sem.release()


def test_cors_preflight(client):
    res = client.options(
        "/api/chat",
        headers={
            "origin": "https://tewahedodaily.pages.dev",
            "access-control-request-method": "POST",
        },
    )
    assert res.status_code in {200, 204}


def test_transcribe_unsupported_mime(client):
    res = client.post(
        "/api/transcribe",
        files={"file": ("x.exe", b"not-audio", "application/octet-stream")},
    )
    assert res.status_code == 415


def test_transcribe_empty_file(client):
    res = client.post(
        "/api/transcribe",
        files={"file": ("x.webm", b"", "audio/webm")},
    )
    assert res.status_code == 400


def test_transcribe_too_large(client):
    payload = b"a" * (main.MAX_TRANSCRIBE_BYTES + 10)
    res = client.post(
        "/api/transcribe",
        files={"file": ("x.webm", payload, "audio/webm")},
    )
    assert res.status_code == 413


def test_transcribe_rate_limit(client, monkeypatch):
    async def fake_pool(fn, path):
        return {
            "text": "ሰላም",
            "language": "am",
            "detected_language": "am",
            "duration": 1.0,
            "model": "badrex/Ethio-ASR-amharic",
        }

    monkeypatch.setattr(main, "run_in_threadpool", fake_pool)
    sec.transcribe_rate_limiter.per_client = 2
    sec.transcribe_rate_limiter.global_limit = 100
    headers = {"cf-connecting-ip": "203.0.113.50"}
    for _ in range(2):
        res = client.post(
            "/api/transcribe",
            files={"file": ("a.webm", b"abcd", "audio/webm")},
            headers=headers,
        )
        assert res.status_code == 200
    res = client.post(
        "/api/transcribe",
        files={"file": ("a.webm", b"abcd", "audio/webm")},
        headers=headers,
    )
    assert res.status_code == 429


def test_transcribe_duration_limit(client, monkeypatch):
    async def fake_pool(fn, path):
        raise main.AudioTooLongError()

    monkeypatch.setattr(main, "run_in_threadpool", fake_pool)
    res = client.post(
        "/api/transcribe",
        files={"file": ("a.webm", b"abcd", "audio/webm")},
    )
    assert res.status_code == 413
    assert "60" in res.json()["detail"]


def test_transcribe_tempfile_cleanup(client, monkeypatch, tmp_path):
    created = {}

    real_named = main.tempfile.NamedTemporaryFile

    def tracking_named(*args, **kwargs):
        kwargs = dict(kwargs)
        kwargs["delete"] = False
        tmp = real_named(*args, **kwargs)
        created["path"] = tmp.name
        return tmp

    async def fake_pool(fn, path):
        created["exists_during"] = main.os.path.exists(path)
        return {
            "text": "እግዚአብሔር",
            "language": "am",
            "detected_language": "am",
            "duration": 0.5,
            "model": "badrex/Ethio-ASR-amharic",
        }

    monkeypatch.setattr(main.tempfile, "NamedTemporaryFile", tracking_named)
    monkeypatch.setattr(main, "run_in_threadpool", fake_pool)
    res = client.post(
        "/api/transcribe",
        files={"file": ("a.webm", b"abcd", "audio/webm")},
    )
    assert res.status_code == 200
    assert created.get("exists_during") is True
    assert created.get("path")
    assert not main.os.path.exists(created["path"])
