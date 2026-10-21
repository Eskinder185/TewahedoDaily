"""Request safety, client identity, and concurrency helpers for Tewahedo AI.

Designed for a single Uvicorn worker behind Cloudflare Tunnel with
Docker publishing only 127.0.0.1:8000. In-memory rate limits reset on restart
and are not shared across processes.
"""

from __future__ import annotations

import asyncio
import os
import time
from collections import deque
from ipaddress import ip_address, ip_network
from typing import Deque, Dict, Optional

from fastapi.responses import JSONResponse


def _env_bool(name: str, default: bool) -> bool:
    raw = os.getenv(name)
    if raw is None:
        return default
    return raw.strip().lower() in {"1", "true", "yes", "on"}


# --- Tunables (override via environment) ---
CHAT_RATE_LIMIT_PER_MINUTE = int(os.getenv("CHAT_RATE_LIMIT_PER_MINUTE", "20"))
GLOBAL_CHAT_RATE_LIMIT_PER_MINUTE = int(
    os.getenv("GLOBAL_CHAT_RATE_LIMIT_PER_MINUTE", "60")
)
TRANSCRIBE_RATE_LIMIT_PER_MINUTE = int(
    os.getenv("TRANSCRIBE_RATE_LIMIT_PER_MINUTE", "10")
)
GLOBAL_TRANSCRIBE_RATE_LIMIT_PER_MINUTE = int(
    os.getenv("GLOBAL_TRANSCRIBE_RATE_LIMIT_PER_MINUTE", "30")
)
MAX_REQUEST_BODY_BYTES = int(os.getenv("MAX_CHAT_BODY_BYTES", str(32 * 1024)))
MAX_TRACKED_CLIENTS = int(os.getenv("MAX_TRACKED_CLIENTS", "2000"))
RATE_LIMIT_WINDOW_SECONDS = int(os.getenv("RATE_LIMIT_WINDOW_SECONDS", "60"))
MAX_CONCURRENT_AI_REQUESTS = int(os.getenv("MAX_CONCURRENT_AI_REQUESTS", "2"))
MAX_CONCURRENT_TRANSCRIBE_REQUESTS = int(
    os.getenv("MAX_CONCURRENT_TRANSCRIBE_REQUESTS", "1")
)
AI_SEMAPHORE_WAIT_SECONDS = float(os.getenv("AI_SEMAPHORE_WAIT_SECONDS", "0.1"))
TRANSCRIBE_SEMAPHORE_WAIT_SECONDS = float(
    os.getenv("TRANSCRIBE_SEMAPHORE_WAIT_SECONDS", "0.1")
)
TRUST_CLOUDFLARE_HEADERS = _env_bool("TRUST_CLOUDFLARE_HEADERS", True)
ENABLE_DEBUG_ROUTES = _env_bool("ENABLE_DEBUG_ROUTES", False)

_TRUSTED_PROXY_NETWORKS = [
    ip_network("127.0.0.0/8"),
    ip_network("::1/128"),
]
for _cidr in (os.getenv("TRUSTED_PROXY_CIDRS") or "").split(","):
    _cidr = _cidr.strip()
    if _cidr:
        _TRUSTED_PROXY_NETWORKS.append(ip_network(_cidr, strict=False))


class RateLimiter:
    """Bounded sliding-window limiter with per-client + global caps."""

    def __init__(
        self,
        *,
        per_client: int,
        global_limit: int,
        window_seconds: int = RATE_LIMIT_WINDOW_SECONDS,
        max_tracked: int = MAX_TRACKED_CLIENTS,
    ) -> None:
        self.per_client = per_client
        self.global_limit = global_limit
        self.window_seconds = window_seconds
        self.max_tracked = max_tracked
        self._clients: Dict[str, Deque[float]] = {}
        self._global: Deque[float] = deque()

    def _prune_global(self, cutoff: float) -> None:
        while self._global and self._global[0] <= cutoff:
            self._global.popleft()

    def _prune_client(self, client_ip: str, cutoff: float) -> Optional[Deque[float]]:
        history = self._clients.get(client_ip)
        if history is None:
            return None
        while history and history[0] <= cutoff:
            history.popleft()
        if not history:
            del self._clients[client_ip]
            return None
        return history

    def _sweep_expired(self, cutoff: float) -> None:
        for ip, existing in list(self._clients.items()):
            while existing and existing[0] <= cutoff:
                existing.popleft()
            if not existing:
                del self._clients[ip]

    def allow(self, client_ip: str) -> bool:
        now = time.monotonic()
        cutoff = now - self.window_seconds

        self._prune_global(cutoff)

        # Reject globally limited requests before creating client state.
        if len(self._global) >= self.global_limit:
            return False

        history = self._prune_client(client_ip, cutoff)

        if history is None:
            if len(self._clients) >= self.max_tracked:
                self._sweep_expired(cutoff)
            if len(self._clients) >= self.max_tracked:
                return False
            history = deque()
            self._clients[client_ip] = history

        if len(history) >= self.per_client:
            return False
        if len(self._global) >= self.global_limit:
            return False

        history.append(now)
        self._global.append(now)
        return True

    def reset(self) -> None:
        self._clients.clear()
        self._global.clear()

    @property
    def tracked_clients(self) -> int:
        return len(self._clients)


chat_rate_limiter = RateLimiter(
    per_client=CHAT_RATE_LIMIT_PER_MINUTE,
    global_limit=GLOBAL_CHAT_RATE_LIMIT_PER_MINUTE,
)
transcribe_rate_limiter = RateLimiter(
    per_client=TRANSCRIBE_RATE_LIMIT_PER_MINUTE,
    global_limit=GLOBAL_TRANSCRIBE_RATE_LIMIT_PER_MINUTE,
)

ai_generation_semaphore = asyncio.Semaphore(MAX_CONCURRENT_AI_REQUESTS)
transcribe_semaphore = asyncio.Semaphore(MAX_CONCURRENT_TRANSCRIBE_REQUESTS)


def client_host_is_trusted_proxy(host: Optional[str]) -> bool:
    if not host:
        return False
    try:
        addr = ip_address(host.strip())
    except ValueError:
        return False
    return any(addr in network for network in _TRUSTED_PROXY_NETWORKS)


def get_client_ip(request) -> str:
    """Return a rate-limit identity.

    CF-Connecting-IP is used only when:
    - TRUST_CLOUDFLARE_HEADERS is enabled, and
    - the immediate TCP peer is a trusted proxy (localhost / configured CIDR).

    X-Forwarded-For and X-Real-IP are never used for rate-limit identity.
    """
    peer = request.client.host if request.client else None

    if TRUST_CLOUDFLARE_HEADERS and client_host_is_trusted_proxy(peer):
        cf_ip = request.headers.get("cf-connecting-ip")
        if cf_ip:
            try:
                return str(ip_address(cf_ip.strip()))
            except ValueError:
                return "invalid-client-ip"

    if peer:
        try:
            return str(ip_address(peer.strip()))
        except ValueError:
            pass

    return "unknown"


def rate_limit_response(retry_after: int = 60) -> JSONResponse:
    return JSONResponse(
        status_code=429,
        content={"detail": "Too many requests. Please try again shortly."},
        headers={"Retry-After": str(retry_after)},
    )


def body_too_large_response() -> JSONResponse:
    return JSONResponse(
        status_code=413,
        content={"detail": "Request body is too large."},
    )


async def read_body_with_limit(request, max_bytes: int = MAX_REQUEST_BODY_BYTES) -> bytes:
    """Read the request body with a hard cap; raise BodyTooLarge if exceeded.

    When the stream exceeds ``max_bytes``, remaining chunks are discarded (not
    buffered) so the connection can complete before returning HTTP 413.
    """
    content_length = request.headers.get("content-length")
    if content_length:
        try:
            if int(content_length) > max_bytes:
                raise BodyTooLarge()
        except ValueError:
            # Invalid Content-Length: still enforce by streaming.
            pass

    chunks: list[bytes] = []
    total = 0
    oversized = False
    async for chunk in request.stream():
        if not chunk:
            continue
        if oversized:
            # Drain without retaining payload.
            continue
        total += len(chunk)
        if total > max_bytes:
            oversized = True
            chunks.clear()
            continue
        chunks.append(chunk)
    if oversized:
        raise BodyTooLarge()
    return b"".join(chunks)


class BodyTooLarge(Exception):
    pass


def cache_request_body(request, body: bytes) -> None:
    """Make the buffered body available to FastAPI/Starlette parsers.

    Starlette caches on ``request._body`` and reads via ``request._receive``.
    Setting both keeps behavior stable across Starlette versions used with
    FastAPI 0.143. Covered by automated tests.
    """

    async def receive():
        return {"type": "http.request", "body": body, "more_body": False}

    request._body = body
    request._receive = receive


async def acquire_semaphore(
    semaphore: asyncio.Semaphore,
    *,
    wait_seconds: float,
    busy_detail: str,
    retry_after: str = "5",
) -> None:
    """Acquire or raise HTTP 503. Caller must release in ``finally``."""
    from fastapi import HTTPException

    try:
        await asyncio.wait_for(semaphore.acquire(), timeout=wait_seconds)
    except asyncio.TimeoutError as exc:
        raise HTTPException(
            status_code=503,
            detail=busy_detail,
            headers={"Retry-After": retry_after},
        ) from exc


def reset_security_state_for_tests() -> None:
    """Test helper — clear in-memory limiters (semaphores left as-is)."""
    chat_rate_limiter.reset()
    transcribe_rate_limiter.reset()
