"""
Import readiness and publication validator for TewahedoDaily Mezmurs.
Matches validation rules in src/pages/admin/MezmurEditor.tsx and src/lib/cms/mezmurService.ts.
"""
from __future__ import annotations
import re
from typing import Dict, List
from urllib.parse import urlparse

from classifier.taxonomy import validate_taxonomy_record
from classifier.transliterator import is_valid_slug

_VALID_YOUTUBE_HOSTS = {"youtube.com", "www.youtube.com", "m.youtube.com", "youtu.be"}


def is_valid_youtube_url(url: str) -> bool:
    if not url:
        return True  # Optional for draft
    try:
        parsed = urlparse(url)
        if parsed.scheme != "https" or parsed.hostname not in _VALID_YOUTUBE_HOSTS:
            return False
        if parsed.hostname == "youtu.be":
            vid = parsed.path.strip("/").split("/")[0]
        else:
            m = re.search(r"(?:v=|/embed/|/shorts/)([A-Za-z0-9_-]{11})", url)
            vid = m.group(1) if m else ""
        return bool(re.match(r"^[A-Za-z0-9_-]{11}$", vid))
    except Exception:
        return False


def evaluate_import_readiness(row: Dict[str, object]) -> Dict[str, str]:
    """
    Evaluate whether a staged Mezmur CSV row is ready for:
      - Draft import into mezmur_data_import (does NOT require lyrics)
      - Direct publication (requires transliteration_title, slug, and amharic_lyrics per MezmurEditor.tsx)
    """
    slug = str(row.get("slug") or "").strip()
    am_title = str(row.get("amharic_title") or "").strip()
    tr_title = str(row.get("transliteration_title") or "").strip()
    yt_url = str(row.get("youtube_url") or "").strip()
    zemari = str(row.get("zemari") or "").strip()
    am_lyrics = str(row.get("amharic_lyrics") or "").strip()
    lyrics_status = str(row.get("lyrics_status") or "missing").strip()
    review_req = str(row.get("review_required") or "false").strip()

    blocking_draft: List[str] = []
    warnings: List[str] = []

    valid_slug = is_valid_slug(slug)
    if not valid_slug:
        blocking_draft.append("invalid_or_missing_slug")

    has_title = bool(tr_title or am_title)
    if not tr_title:
        blocking_draft.append("missing_transliteration_title")
    if not am_title:
        warnings.append("missing_amharic_title")

    has_yt = bool(yt_url) and is_valid_youtube_url(yt_url)
    if yt_url and not has_yt:
        blocking_draft.append("invalid_youtube_url")
    elif not yt_url:
        warnings.append("missing_youtube_url")

    tax_errors = validate_taxonomy_record(row)
    has_valid_taxonomy = len(tax_errors) == 0
    if not has_valid_taxonomy:
        blocking_draft.extend(tax_errors)

    has_zemari = bool(zemari)
    if not has_zemari:
        warnings.append("missing_verified_zemari")

    if not am_lyrics:
        warnings.append(f"amharic_lyrics_{lyrics_status}")

    ready_for_draft = len(blocking_draft) == 0
    # Per MezmurEditor.tsx validatePublishFields: publishing requires title, valid slug, and lyrics_amharic
    ready_for_publish = bool(ready_for_draft and am_lyrics and review_req == "false")

    return {
        "slug": slug,
        "amharic_title": am_title,
        "transliteration_title": tr_title,
        "ready_for_draft_import": "true" if ready_for_draft else "false",
        "ready_for_publish": "true" if ready_for_publish else "false",
        "has_valid_slug": "true" if valid_slug else "false",
        "has_title": "true" if has_title else "false",
        "has_youtube_url": "true" if has_yt else "false",
        "has_zemari": "true" if has_zemari else "false",
        "has_valid_taxonomy": "true" if has_valid_taxonomy else "false",
        "lyrics_status": lyrics_status,
        "review_required": review_req,
        "blocking_issues": "|".join(blocking_draft),
        "warnings": "|".join(warnings),
    }
