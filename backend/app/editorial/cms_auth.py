"""CMS authentication for private editorial preview.

Authorization model (matches TewahedoDaily):
- Supabase Auth JWT proves identity (``sub``).
- JWT claim ``role`` is Supabase's ``authenticated`` / ``anon`` — NOT the CMS role.
- CMS staff roles live in ``public.profiles.role`` and are checked by
  ``public.is_staff()`` as ``editor`` | ``admin`` | ``super_admin``.
- Editorial preview allows the same staff roles as ``RequireCmsRole`` for
  ``/admin/editorial-books`` (editor+), not plain ``contributor`` / ``user``.
"""

from __future__ import annotations

import base64
import hashlib
import hmac
import json
import os
import secrets
import time
from dataclasses import dataclass
from typing import Any, Callable, Literal, Optional, Sequence
from urllib.parse import urljoin

import httpx
from fastapi import Header, HTTPException

# Matches frontend staffRoles / public.is_staff() — not contributor.
EDITORIAL_CMS_ROLES: frozenset[str] = frozenset({"editor", "admin", "super_admin"})
AuthMethod = Literal["cms_jwt", "legacy_token"]


@dataclass(frozen=True)
class EditorialPrincipal:
    user_id: str
    cms_role: str
    auth_method: AuthMethod
    email: Optional[str] = None


def _env_bool(name: str, default: bool) -> bool:
    raw = os.getenv(name)
    if raw is None:
        return default
    return raw.strip().lower() in {"1", "true", "yes", "on"}


def legacy_token_allowed() -> bool:
    """Emergency shared-secret path. Disabled by default (fail closed to CMS JWT)."""
    return _env_bool("EDITORIAL_ALLOW_LEGACY_TOKEN", False)


def _b64url_decode(segment: str) -> bytes:
    pad = "=" * (-len(segment) % 4)
    return base64.urlsafe_b64decode(segment + pad)


def _decode_jwt_parts(token: str) -> tuple[dict[str, Any], dict[str, Any], bytes, bytes]:
    try:
        header_b64, payload_b64, sig_b64 = token.split(".")
    except ValueError as exc:
        raise HTTPException(status_code=401, detail="Malformed bearer token.") from exc
    try:
        header = json.loads(_b64url_decode(header_b64))
        payload = json.loads(_b64url_decode(payload_b64))
        signature = _b64url_decode(sig_b64)
    except (ValueError, json.JSONDecodeError) as exc:
        raise HTTPException(status_code=401, detail="Malformed bearer token.") from exc
    signing_input = f"{header_b64}.{payload_b64}".encode("ascii")
    return header, payload, signature, signing_input


def _require_iss_aud_exp(
    payload: dict[str, Any],
    *,
    supabase_url: str,
    leeway_seconds: int,
) -> None:
    now = int(time.time())
    exp = payload.get("exp")
    if not isinstance(exp, (int, float)):
        raise HTTPException(status_code=401, detail="Token missing expiry.")
    if now > int(exp) + leeway_seconds:
        raise HTTPException(status_code=401, detail="Token expired.")
    nbf = payload.get("nbf")
    if isinstance(nbf, (int, float)) and now + leeway_seconds < int(nbf):
        raise HTTPException(status_code=401, detail="Token not yet valid.")

    # Supabase user access tokens use aud="authenticated".
    aud = payload.get("aud")
    allowed_aud = {
        a.strip()
        for a in (os.getenv("SUPABASE_JWT_AUD") or "authenticated").split(",")
        if a.strip()
    }
    aud_values = {aud} if isinstance(aud, str) else set(aud or [])
    if not aud_values:
        raise HTTPException(status_code=401, detail="Token missing audience.")
    if not (aud_values & allowed_aud):
        raise HTTPException(status_code=401, detail="Invalid token audience.")

    # JWT claim "role" is Supabase Auth role, not profiles.role.
    auth_role = payload.get("role")
    if auth_role in {"anon", "service_role"}:
        raise HTTPException(
            status_code=401,
            detail="Token is not an authenticated user session.",
        )
    if auth_role not in {None, "authenticated"}:
        raise HTTPException(status_code=401, detail="Unexpected auth role claim.")

    iss = payload.get("iss")
    if not iss:
        raise HTTPException(status_code=401, detail="Token missing issuer.")
    expected_iss = os.getenv("SUPABASE_JWT_ISS") or urljoin(
        supabase_url.rstrip("/") + "/", "auth/v1"
    )
    if iss.rstrip("/") != expected_iss.rstrip("/"):
        raise HTTPException(status_code=401, detail="Invalid token issuer.")

    sub = payload.get("sub")
    if not isinstance(sub, str) or not sub.strip():
        raise HTTPException(status_code=401, detail="Token missing subject.")


def verify_supabase_jwt(
    token: str,
    *,
    jwt_secret: str,
    supabase_url: str,
    leeway_seconds: int = 30,
) -> dict[str, Any]:
    """Verify HS256 Supabase access token with mandatory iss/aud/exp/signature checks.

    Current Supabase projects that still use the legacy JWT secret sign with HS256.
    Asymmetric / rotating signing keys (ES256/RS256) are rejected unless a future
    JWKS verifier is explicitly configured — fail closed rather than skip signature.
    """
    if not jwt_secret.strip():
        raise HTTPException(
            status_code=503,
            detail="SUPABASE_JWT_SECRET is required for signature verification.",
        )
    header, payload, signature, signing_input = _decode_jwt_parts(token)
    alg = header.get("alg")
    if alg != "HS256":
        raise HTTPException(
            status_code=401,
            detail=(
                f"Unsupported token algorithm {alg!r}. "
                "Configure HS256 JWT secret verification or an approved JWKS path."
            ),
        )

    expected = hmac.new(
        jwt_secret.encode("utf-8"),
        signing_input,
        hashlib.sha256,
    ).digest()
    if not hmac.compare_digest(signature, expected):
        raise HTTPException(status_code=401, detail="Invalid token signature.")

    _require_iss_aud_exp(
        payload, supabase_url=supabase_url, leeway_seconds=leeway_seconds
    )
    return payload


def fetch_profile_role(
    user_id: str,
    *,
    supabase_url: str,
    service_key: str,
    client: Optional[httpx.Client] = None,
) -> tuple[Optional[str], Optional[str]]:
    """Load CMS role from profiles via service key (same source as is_staff())."""
    url = urljoin(supabase_url.rstrip("/") + "/", "rest/v1/profiles")
    headers = {
        "apikey": service_key,
        "Authorization": f"Bearer {service_key}",
        "Accept": "application/json",
    }
    params = {"id": f"eq.{user_id}", "select": "id,role,email"}
    owns = client is None
    http = client or httpx.Client(timeout=10.0)
    try:
        response = http.get(url, headers=headers, params=params)
    finally:
        if owns:
            http.close()
    if response.status_code != 200:
        raise HTTPException(
            status_code=503,
            detail="Could not verify CMS profile with Supabase.",
        )
    rows = response.json()
    if not isinstance(rows, list) or not rows:
        return None, None
    row = rows[0]
    return row.get("role"), row.get("email")


def confirm_user_with_auth_api(
    token: str,
    *,
    supabase_url: str,
    api_key: str,
    client: Optional[httpx.Client] = None,
) -> dict[str, Any]:
    """Ask Supabase Auth to validate the access token (network confirmation)."""
    url = urljoin(supabase_url.rstrip("/") + "/", "auth/v1/user")
    headers = {
        "apikey": api_key,
        "Authorization": f"Bearer {token}",
        "Accept": "application/json",
    }
    owns = client is None
    http = client or httpx.Client(timeout=10.0)
    try:
        response = http.get(url, headers=headers)
    finally:
        if owns:
            http.close()
    if response.status_code == 401:
        raise HTTPException(status_code=401, detail="Invalid or expired session.")
    if response.status_code != 200:
        raise HTTPException(
            status_code=503,
            detail="Supabase Auth user lookup failed.",
        )
    data = response.json()
    if not isinstance(data, dict) or not data.get("id"):
        raise HTTPException(status_code=401, detail="Invalid session user.")
    return data


ProfileLookup = Callable[[str], tuple[Optional[str], Optional[str]]]
AuthConfirm = Callable[[str], dict[str, Any]]


def authenticate_cms_jwt(
    token: str,
    *,
    jwt_secret: Optional[str] = None,
    supabase_url: Optional[str] = None,
    service_key: Optional[str] = None,
    profile_lookup: Optional[ProfileLookup] = None,
    auth_confirm: Optional[AuthConfirm] = None,
    allowed_roles: Sequence[str] = tuple(EDITORIAL_CMS_ROLES),
) -> EditorialPrincipal:
    """Authenticate an editorial caller from a Supabase user access token."""
    supabase_url = (supabase_url or os.getenv("SUPABASE_URL") or "").strip()
    service_key = (service_key or os.getenv("SUPABASE_KEY") or "").strip()
    jwt_secret = (jwt_secret or os.getenv("SUPABASE_JWT_SECRET") or "").strip()

    if not supabase_url or not service_key:
        raise HTTPException(
            status_code=503,
            detail="SUPABASE_URL and SUPABASE_KEY are required for CMS JWT auth.",
        )

    # Fail closed: signature verification requires the project JWT secret.
    # Auth API alone is not sufficient (does not prove local iss/aud/signature policy).
    if not jwt_secret:
        raise HTTPException(
            status_code=503,
            detail=(
                "SUPABASE_JWT_SECRET is not configured; "
                "CMS JWT verification cannot be established."
            ),
        )

    payload = verify_supabase_jwt(
        token, jwt_secret=jwt_secret, supabase_url=supabase_url
    )
    user_id = str(payload["sub"])
    if auth_confirm is not None or _env_bool("EDITORIAL_CONFIRM_AUTH_API", False):
        confirm = auth_confirm or (
            lambda t: confirm_user_with_auth_api(
                t, supabase_url=supabase_url, api_key=service_key
            )
        )
        user = confirm(token)
        if user.get("id") != user_id:
            raise HTTPException(status_code=401, detail="Token subject mismatch.")

    lookup = profile_lookup or (
        lambda uid: fetch_profile_role(
            uid, supabase_url=supabase_url, service_key=service_key
        )
    )
    cms_role, email = lookup(user_id)
    if cms_role not in set(allowed_roles):
        raise HTTPException(
            status_code=403,
            detail="CMS staff role required (editor, admin, or super_admin).",
        )
    return EditorialPrincipal(
        user_id=user_id,
        cms_role=str(cms_role),
        auth_method="cms_jwt",
        email=email,
    )


def authenticate_legacy_token(provided: Optional[str]) -> EditorialPrincipal:
    expected = os.getenv("EDITORIAL_PREVIEW_TOKEN", "").strip()
    if not expected:
        raise HTTPException(
            status_code=503,
            detail="Legacy editorial token is not configured.",
        )
    if not provided or not secrets.compare_digest(provided, expected):
        raise HTTPException(status_code=401, detail="Invalid editorial token.")
    return EditorialPrincipal(
        user_id="legacy-token",
        cms_role="legacy_ops",
        auth_method="legacy_token",
    )


def resolve_editorial_principal(
    *,
    authorization: Optional[str],
    x_editorial_token: Optional[str],
    authenticate_jwt: Optional[Callable[[str], EditorialPrincipal]] = None,
) -> EditorialPrincipal:
    """Prefer CMS JWT; optionally fall back to legacy shared secret."""
    bearer = None
    if authorization and authorization.lower().startswith("bearer "):
        bearer = authorization[7:].strip()

    if bearer:
        auth_fn = authenticate_jwt or (lambda t: authenticate_cms_jwt(t))
        return auth_fn(bearer)

    if legacy_token_allowed() and x_editorial_token is not None:
        return authenticate_legacy_token(x_editorial_token)

    if not legacy_token_allowed() and x_editorial_token:
        raise HTTPException(
            status_code=401,
            detail="Legacy editorial token disabled; sign in with a CMS session.",
        )

    raise HTTPException(
        status_code=401,
        detail="Authorization Bearer CMS session required.",
    )


async def require_editorial_principal(
    authorization: Optional[str] = Header(default=None),
    x_editorial_token: Optional[str] = Header(default=None),
) -> EditorialPrincipal:
    return resolve_editorial_principal(
        authorization=authorization,
        x_editorial_token=x_editorial_token,
    )
