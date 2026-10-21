"""CMS JWT auth for editorial preview — uses profiles.role, not JWT role claim."""

from __future__ import annotations

import base64
import hashlib
import hmac
import json
import time

import pytest
from fastapi import FastAPI, HTTPException
from fastapi.testclient import TestClient

from editorial.cms_auth import (
    EDITORIAL_CMS_ROLES,
    authenticate_cms_jwt,
    resolve_editorial_principal,
    verify_supabase_jwt,
)
from editorial.retrieval_diagnostics import diagnose_package_retrieval
from editorial.catalog import clear_catalog_cache, load_catalog
from editorial.paths import content_review_root


def _b64(data: bytes) -> str:
    return base64.urlsafe_b64encode(data).rstrip(b"=").decode("ascii")


def mint_hs256(payload: dict, secret: str) -> str:
    header = {"alg": "HS256", "typ": "JWT"}
    h = _b64(json.dumps(header, separators=(",", ":")).encode())
    p = _b64(json.dumps(payload, separators=(",", ":")).encode())
    sig = hmac.new(secret.encode(), f"{h}.{p}".encode(), hashlib.sha256).digest()
    return f"{h}.{p}.{_b64(sig)}"


SECRET = "test-supabase-jwt-secret"
URL = "https://example.supabase.co"


def _staff_token(**overrides) -> str:
    payload = {
        "sub": "user-staff-1",
        "role": "authenticated",
        "aud": "authenticated",
        "iss": f"{URL}/auth/v1",
        "exp": int(time.time()) + 3600,
        "email": "editor@example.com",
    }
    payload.update(overrides)
    return mint_hs256(payload, SECRET)


def test_verify_rejects_bad_signature():
    token = _staff_token()
    with pytest.raises(HTTPException) as exc:
        verify_supabase_jwt(token + "x", jwt_secret=SECRET, supabase_url=URL)
    assert exc.value.status_code == 401


def test_verify_rejects_anon_role_claim():
    token = _staff_token(role="anon")
    with pytest.raises(HTTPException) as exc:
        verify_supabase_jwt(token, jwt_secret=SECRET, supabase_url=URL)
    assert exc.value.status_code == 401


def test_verify_rejects_wrong_audience():
    token = _staff_token(aud="service_role")
    with pytest.raises(HTTPException) as exc:
        verify_supabase_jwt(token, jwt_secret=SECRET, supabase_url=URL)
    assert exc.value.status_code == 401


def test_cms_jwt_uses_profiles_role_not_jwt_role_claim():
    token = _staff_token()
    # JWT claim role is "authenticated"; CMS role comes from profiles lookup.
    principal = authenticate_cms_jwt(
        token,
        jwt_secret=SECRET,
        supabase_url=URL,
        service_key="service-key",
        profile_lookup=lambda _uid: ("editor", "editor@example.com"),
    )
    assert principal.cms_role == "editor"
    assert principal.auth_method == "cms_jwt"
    assert principal.user_id == "user-staff-1"


def test_contributor_and_user_rejected():
    token = _staff_token(sub="user-contrib")
    with pytest.raises(HTTPException) as exc:
        authenticate_cms_jwt(
            token,
            jwt_secret=SECRET,
            supabase_url=URL,
            service_key="service-key",
            profile_lookup=lambda _uid: ("contributor", "c@example.com"),
        )
    assert exc.value.status_code == 403

    with pytest.raises(HTTPException) as exc2:
        authenticate_cms_jwt(
            token,
            jwt_secret=SECRET,
            supabase_url=URL,
            service_key="service-key",
            profile_lookup=lambda _uid: ("user", "u@example.com"),
        )
    assert exc2.value.status_code == 403


def test_resolve_prefers_bearer_over_legacy(monkeypatch):
    monkeypatch.setenv("EDITORIAL_ALLOW_LEGACY_TOKEN", "1")
    monkeypatch.setenv("EDITORIAL_PREVIEW_TOKEN", "legacy-secret")
    token = _staff_token()

    principal = resolve_editorial_principal(
        authorization=f"Bearer {token}",
        x_editorial_token="legacy-secret",
        authenticate_jwt=lambda t: authenticate_cms_jwt(
            t,
            jwt_secret=SECRET,
            supabase_url=URL,
            service_key="service-key",
            profile_lookup=lambda _uid: ("admin", "a@example.com"),
        ),
    )
    assert principal.auth_method == "cms_jwt"
    assert principal.cms_role == "admin"


def test_legacy_disabled_rejects_token_header(monkeypatch):
    monkeypatch.setenv("EDITORIAL_ALLOW_LEGACY_TOKEN", "0")
    monkeypatch.setenv("EDITORIAL_PREVIEW_TOKEN", "legacy-secret")
    with pytest.raises(HTTPException) as exc:
        resolve_editorial_principal(
            authorization=None,
            x_editorial_token="legacy-secret",
        )
    assert exc.value.status_code == 401


def test_legacy_token_disabled_by_default(monkeypatch):
    monkeypatch.delenv("EDITORIAL_ALLOW_LEGACY_TOKEN", raising=False)
    monkeypatch.setenv("EDITORIAL_PREVIEW_TOKEN", "legacy-secret")
    with pytest.raises(HTTPException) as exc:
        resolve_editorial_principal(
            authorization=None,
            x_editorial_token="legacy-secret",
        )
    assert exc.value.status_code == 401


def test_missing_jwt_secret_fails_closed(monkeypatch):
    monkeypatch.delenv("SUPABASE_JWT_SECRET", raising=False)
    token = _staff_token()
    with pytest.raises(HTTPException) as exc:
        authenticate_cms_jwt(
            token,
            jwt_secret="",
            supabase_url=URL,
            service_key="service-key",
            profile_lookup=lambda _uid: ("editor", "editor@example.com"),
        )
    assert exc.value.status_code == 503


def test_missing_exp_fails_closed():
    token = mint_hs256(
        {
            "sub": "user-staff-1",
            "role": "authenticated",
            "aud": "authenticated",
            "iss": f"{URL}/auth/v1",
        },
        SECRET,
    )
    with pytest.raises(HTTPException) as exc:
        verify_supabase_jwt(token, jwt_secret=SECRET, supabase_url=URL)
    assert exc.value.status_code == 401


def test_router_accepts_cms_jwt(monkeypatch, tmp_path):
    package = content_review_root()
    if not (package / "Catalog.json").is_file():
        pytest.skip("content-review package absent")

    monkeypatch.setenv("ENABLE_EDITORIAL_PREVIEW", "1")
    monkeypatch.setenv("EDITORIAL_ALLOW_LEGACY_TOKEN", "0")
    monkeypatch.setenv("CONTENT_REVIEW_ROOT", str(package))
    monkeypatch.setenv("EDITORIAL_APPROVAL_STORE", str(tmp_path / "a.json"))
    monkeypatch.setenv("SUPABASE_URL", URL)
    monkeypatch.setenv("SUPABASE_KEY", "service-key")
    monkeypatch.setenv("SUPABASE_JWT_SECRET", SECRET)

    from fastapi import Header
    from editorial import router as router_mod
    from editorial.cms_auth import EditorialPrincipal

    def fake_auth(token: str):
        return authenticate_cms_jwt(
            token,
            jwt_secret=SECRET,
            supabase_url=URL,
            service_key="service-key",
            profile_lookup=lambda _uid: ("editor", "editor@example.com"),
        )

    async def override_principal(
        authorization: str | None = Header(default=None),
        x_editorial_token: str | None = Header(default=None),
    ):
        return resolve_editorial_principal(
            authorization=authorization,
            x_editorial_token=x_editorial_token,
            authenticate_jwt=fake_auth,
        )

    app = FastAPI()
    app.include_router(router_mod.router)
    app.dependency_overrides[router_mod.require_editorial_principal] = override_principal

    client = TestClient(app)
    denied = client.get("/api/editorial/books")
    assert denied.status_code == 401

    forbidden_legacy = client.get(
        "/api/editorial/books",
        headers={"X-Editorial-Token": "nope"},
    )
    assert forbidden_legacy.status_code == 401

    ok = client.get(
        "/api/editorial/books",
        headers={"Authorization": f"Bearer {_staff_token()}"},
    )
    assert ok.status_code == 200
    assert ok.json()["published"] is False

    # Contributor identity must not be injectable via JWT claim alone.
    async def contributor_override(
        authorization: str | None = Header(default=None),
        x_editorial_token: str | None = Header(default=None),
    ):
        _ = authorization, x_editorial_token
        raise HTTPException(
            status_code=403,
            detail="CMS staff role required (editor, admin, or super_admin).",
        )

    app.dependency_overrides[router_mod.require_editorial_principal] = contributor_override
    blocked = client.get(
        "/api/editorial/books",
        headers={"Authorization": f"Bearer {_staff_token()}"},
    )
    assert blocked.status_code == 403

    app.dependency_overrides[router_mod.require_editorial_principal] = override_principal
    diag = client.get(
        "/api/editorial/diagnostics/retrieval",
        headers={"Authorization": f"Bearer {_staff_token()}"},
    )
    assert diag.status_code == 200
    body = diag.json()
    assert body["empty_public_retrieval_cause"] == "approval_filter"
    assert body["search_buddy_hit_count"] == 0
    assert body["private_lexical_english_hits"] >= 1
    assert body["flags_mutated"] is False
    assert isinstance(
        EditorialPrincipal("u", "editor", "cms_jwt"), EditorialPrincipal
    )


@pytest.mark.skipif(
    not (content_review_root() / "Catalog.json").is_file(),
    reason="content-review package not present",
)
def test_diagnose_empty_is_approval_not_parse():
    clear_catalog_cache()
    catalog = load_catalog(str(content_review_root()))
    report = diagnose_package_retrieval(catalog)
    assert report["parsing_ok"] is True
    assert report["approved_for_ingestion_true"] == 0
    assert report["search_buddy_hit_count"] == 0
    assert report["empty_public_retrieval_cause"] == "approval_filter"
    assert report["private_lexical_english_hits"] >= 1
    # Amharic source lexical path should find something on S01/E01/etc.
    assert report["private_lexical_amharic_hits"] >= 1
    assert set(EDITORIAL_CMS_ROLES) == {"editor", "admin", "super_admin"}
