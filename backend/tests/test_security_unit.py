"""Unit tests for security helpers (no network, no Torch)."""

from types import SimpleNamespace

import pytest
from starlette.requests import Request

import security as sec


def _request(headers=None, client_host="127.0.0.1"):
    headers = headers or {}
    scope = {
        "type": "http",
        "asgi": {"version": "3.0"},
        "http_version": "1.1",
        "method": "GET",
        "scheme": "http",
        "path": "/",
        "raw_path": b"/",
        "query_string": b"",
        "headers": [
            (k.lower().encode(), v.encode()) for k, v in headers.items()
        ],
        "client": (client_host, 12345) if client_host else None,
        "server": ("127.0.0.1", 8000),
    }

    async def receive():
        return {"type": "http.request", "body": b"", "more_body": False}

    return Request(scope, receive)


def test_rate_limiter_per_client_threshold():
    limiter = sec.RateLimiter(per_client=3, global_limit=100, max_tracked=100)
    assert limiter.allow("1.1.1.1")
    assert limiter.allow("1.1.1.1")
    assert limiter.allow("1.1.1.1")
    assert limiter.allow("1.1.1.1") is False


def test_rate_limiter_global_threshold_does_not_create_client():
    limiter = sec.RateLimiter(per_client=100, global_limit=2, max_tracked=100)
    assert limiter.allow("1.1.1.1")
    assert limiter.allow("2.2.2.2")
    assert limiter.allow("3.3.3.3") is False
    assert "3.3.3.3" not in limiter._clients


def test_rate_limiter_max_tracked():
    limiter = sec.RateLimiter(per_client=5, global_limit=1000, max_tracked=2)
    assert limiter.allow("1.1.1.1")
    assert limiter.allow("2.2.2.2")
    assert limiter.allow("3.3.3.3") is False


def test_rate_limiter_expiration(monkeypatch):
    limiter = sec.RateLimiter(
        per_client=1, global_limit=10, window_seconds=60, max_tracked=10
    )
    clock = {"t": 1000.0}
    monkeypatch.setattr(sec.time, "monotonic", lambda: clock["t"])
    assert limiter.allow("1.1.1.1")
    assert limiter.allow("1.1.1.1") is False
    clock["t"] += 61
    assert limiter.allow("1.1.1.1")


def test_get_client_ip_trusts_cf_from_localhost():
    req = _request({"cf-connecting-ip": "203.0.113.9"}, client_host="127.0.0.1")
    assert sec.get_client_ip(req) == "203.0.113.9"


def test_get_client_ip_valid_ipv6():
    req = _request(
        {"cf-connecting-ip": "2001:db8::1"},
        client_host="127.0.0.1",
    )
    assert sec.get_client_ip(req) == "2001:db8::1"


def test_get_client_ip_invalid_cf_header():
    req = _request({"cf-connecting-ip": "not-an-ip"}, client_host="127.0.0.1")
    assert sec.get_client_ip(req) == "invalid-client-ip"


def test_get_client_ip_ignores_x_forwarded_for():
    req = _request(
        {"x-forwarded-for": "198.51.100.1", "x-real-ip": "198.51.100.2"},
        client_host="127.0.0.1",
    )
    # No CF header → peer host
    assert sec.get_client_ip(req) == "127.0.0.1"


def test_get_client_ip_untrusted_peer_ignores_cf():
    sec.TRUST_CLOUDFLARE_HEADERS = True
    req = _request({"cf-connecting-ip": "203.0.113.9"}, client_host="198.51.100.10")
    assert sec.get_client_ip(req) == "198.51.100.10"


def test_get_client_ip_trust_disabled():
    sec.TRUST_CLOUDFLARE_HEADERS = False
    req = _request({"cf-connecting-ip": "203.0.113.9"}, client_host="127.0.0.1")
    assert sec.get_client_ip(req) == "127.0.0.1"


def test_get_client_ip_missing_client():
    req = _request(client_host=None)
    assert sec.get_client_ip(req) == "unknown"


@pytest.mark.asyncio
async def test_read_body_with_limit_and_cache():
    body = b'{"message":"hi"}'

    async def receive():
        return {"type": "http.request", "body": body, "more_body": False}

    scope = {
        "type": "http",
        "asgi": {"version": "3.0"},
        "http_version": "1.1",
        "method": "POST",
        "scheme": "http",
        "path": "/api/chat",
        "raw_path": b"/api/chat",
        "query_string": b"",
        "headers": [(b"content-length", str(len(body)).encode())],
        "client": ("127.0.0.1", 1),
        "server": ("127.0.0.1", 8000),
    }
    request = Request(scope, receive)
    got = await sec.read_body_with_limit(request, max_bytes=1024)
    assert got == body
    sec.cache_request_body(request, got)
    assert await request.body() == body


@pytest.mark.asyncio
async def test_read_body_rejects_oversize_stream():
    async def receive():
        return {"type": "http.request", "body": b"x" * 100, "more_body": False}

    scope = {
        "type": "http",
        "asgi": {"version": "3.0"},
        "http_version": "1.1",
        "method": "POST",
        "scheme": "http",
        "path": "/api/chat",
        "raw_path": b"/api/chat",
        "query_string": b"",
        "headers": [],
        "client": ("127.0.0.1", 1),
        "server": ("127.0.0.1", 8000),
    }
    request = Request(scope, receive)
    with pytest.raises(sec.BodyTooLarge):
        await sec.read_body_with_limit(request, max_bytes=10)
