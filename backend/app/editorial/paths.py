from __future__ import annotations

import os
from pathlib import Path

# app/editorial/paths.py -> backend package root is parents[2]
# (TewahedoDaily/backend when running from the monorepo).
# The unapproved five-book package must stay private — prefer CONTENT_REVIEW_*
# env vars, then a local backend/content-review tree, then a sibling
# ../tewahedo-ai/content-review checkout used only for private evaluation.
_REPO_ROOT = Path(__file__).resolve().parents[2]


def repo_root() -> Path:
    return _REPO_ROOT


def _sibling_tewahedo_ai_package() -> Path | None:
    """Discover a private package kept outside the monorepo publish tree."""
    candidate = (_REPO_ROOT.parent.parent / "tewahedo-ai" / "content-review").resolve()
    if (candidate / "Catalog.json").is_file():
        return candidate
    return None


def content_review_root() -> Path:
    override = os.getenv("CONTENT_REVIEW_ROOT")
    if override:
        return Path(override).expanduser().resolve()
    local = (_REPO_ROOT / "content-review").resolve()
    if (local / "Catalog.json").is_file():
        return local
    sibling = _sibling_tewahedo_ai_package()
    if sibling is not None:
        return sibling
    return local


def companion_zip_path() -> Path:
    override = os.getenv("CONTENT_REVIEW_ZIP")
    if override:
        return Path(override).expanduser().resolve()
    local = (_REPO_ROOT / "content-review.zip").resolve()
    if local.is_file():
        return local
    sibling_pkg = _sibling_tewahedo_ai_package()
    if sibling_pkg is not None:
        sibling_zip = (sibling_pkg.parent / "content-review.zip").resolve()
        if sibling_zip.is_file():
            return sibling_zip
    return local


def approval_store_path() -> Path:
    override = os.getenv("EDITORIAL_APPROVAL_STORE")
    if override:
        return Path(override).expanduser().resolve()
    return (_REPO_ROOT / "data" / "editorial_approvals.json").resolve()
