"""Amharic / Ethiopic helpers for Search Buddy /api/chat routing."""

from __future__ import annotations

import re
import unicodedata

_ETHIOPIC_RE = re.compile(r"[\u1200-\u137F\u1380-\u139F\u2D80-\u2DDF\uAB00-\uAB2F]")
_AMHARIC_PUNCT_RE = re.compile(r"[\u1362\u1363\u1364\u1365\u1366\u1367\u061F?!.,;:\u2026]+")


def contains_ethiopic(text: str) -> bool:
    return bool(text and _ETHIOPIC_RE.search(text))


def normalize_amharic_search_text(text: str) -> str:
    """Trim whitespace and strip terminal punctuation; do not transliterate.

    Example: "\u12a0\u1265\u1230\u122b \u1308\u1265\u122c\u120d\u1362"
    becomes "\u12a0\u1265\u1230\u122b \u1308\u1265\u122c\u120d"
    """
    if not text:
        return ""
    cleaned = _AMHARIC_PUNCT_RE.sub(" ", text)
    cleaned = unicodedata.normalize("NFC", cleaned)
    return re.sub(r"\s+", " ", cleaned).strip()
