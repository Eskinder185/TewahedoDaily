"""Structured-first Amharic routing for POST /api/chat.

Wire into the existing chat handler *before* Ollama/Qwen:

    from tewahedo_ai.amharic_text import contains_ethiopic
    from tewahedo_ai.amharic_routing import resolve_amharic_structured, AmharicSearchDeps

    if contains_ethiopic(message):
        result = resolve_amharic_structured(message, deps)
        if result is not None:
            return result
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Callable, Optional

from .amharic_text import contains_ethiopic, normalize_amharic_search_text

SearchFn = Callable[[str, int], Any]
TodayFn = Callable[[], Any]
EnglishChatFn = Callable[[str], Any]

UNKNOWN: dict[str, Any] = {
    "type": "unknown",
    "message": "I couldn't find a matching result yet.",
}


@dataclass
class AmharicSearchDeps:
    """Callables that reuse existing FastAPI search / calendar implementations."""

    search_hymns: SearchFn
    search_prayers: SearchFn
    search_bible: SearchFn
    search_synaxarium: SearchFn
    calendar_today: TodayFn
    english_structured_chat: Optional[EnglishChatFn] = None


# patterns use unicode escapes so this file stays ASCII-safe in transit
_AMHARIC_INTENT_ALIASES: list[tuple[list[str], str, Optional[str]]] = [
    (
        [
            "\u12db\u122c \u133e\u121d \u1290\u12cd",  # fasting today phrase
            "\u12db\u122c \u133e\u121d",
        ],
        "fasting today",
        "fasting_today",
    ),
    (
        [
            "\u12e8\u12db\u122c \u1240\u1295",
            "\u12db\u122c \u121d\u1295 \u1240\u1295 \u1290\u12cd",
            "\u12db\u122c \u121d\u1295 \u1240\u1295",
        ],
        "calendar today",
        "calendar_today",
    ),
    (
        [
            "\u12e8\u12db\u122c \u1245\u12f1\u1233\u1295",
            "\u12db\u122c \u12e8\u121a\u1273\u1230\u1261 \u1245\u12f1\u1233\u1295",
            "\u12db\u122c \u1245\u12f1\u1233\u1295",
        ],
        "",
        "synaxarium_today",
    ),
]


def _match_intent(normalized: str) -> Optional[tuple[str, Optional[str]]]:
    compact = " ".join(normalized.split())
    if not compact:
        return None
    for patterns, english, direct in _AMHARIC_INTENT_ALIASES:
        for pattern in patterns:
            if compact == pattern or pattern in compact:
                return english, direct
    return None


def _nonempty_results(payload: Any) -> bool:
    if not isinstance(payload, dict):
        return False
    results = payload.get("results")
    return isinstance(results, list) and len(results) > 0


def _as_typed_search(type_name: str, query: str, payload: Any) -> Optional[dict[str, Any]]:
    if not _nonempty_results(payload):
        return None
    out = dict(payload)
    out["type"] = type_name
    out["query"] = query
    return out


def _calendar_as(type_name: str, payload: Any) -> dict[str, Any]:
    base = dict(payload) if isinstance(payload, dict) else {}
    if type_name == "fasting_today":
        base["type"] = "fasting_today"
        return base
    if type_name == "synaxarium_today":
        commemorations = (
            base.get("synaxarium")
            if isinstance(base.get("synaxarium"), list)
            else base.get("commemorations")
            if isinstance(base.get("commemorations"), list)
            else (
                base.get("synaxarium_day", {}).get("commemorations")
                if isinstance(base.get("synaxarium_day"), dict)
                else []
            )
        )
        syn_day = base.get("synaxarium_day") if isinstance(base.get("synaxarium_day"), dict) else {}
        return {
            **base,
            "type": "synaxarium_today",
            "commemorations": commemorations or [],
            "title": syn_day.get("title")
            or syn_day.get("display_date_english")
            or base.get("ethiopian_label")
            or base.get("title"),
            "display_date_english": base.get("ethiopian_label") or base.get("display_date_english"),
        }
    base["type"] = "calendar_today"
    return base


def _search_hymns_amharic(normalized: str, deps: AmharicSearchDeps) -> Optional[dict[str, Any]]:
    full = deps.search_hymns(normalized, 12)
    hit = _as_typed_search("hymn_search", normalized, full)
    if hit:
        return hit

    tokens = [t for t in normalized.split() if len(t) >= 2]
    merged: list[Any] = []
    seen: set[str] = set()
    for token in tokens:
        part = deps.search_hymns(token, 8)
        if not isinstance(part, dict):
            continue
        rows = part.get("results") or []
        if not isinstance(rows, list):
            continue
        for row in rows:
            if not isinstance(row, dict):
                continue
            key = str(
                row.get("slug")
                or row.get("id")
                or row.get("title_amharic")
                or row.get("title")
                or ""
            )
            if not key or key in seen:
                continue
            seen.add(key)
            merged.append(row)
    if not merged:
        return None
    return {"type": "hymn_search", "query": normalized, "results": merged}


def resolve_amharic_structured(
    message: str,
    deps: AmharicSearchDeps,
) -> Optional[dict[str, Any]]:
    """Return structured payload or UNKNOWN. None only when not Ethiopic."""
    if not contains_ethiopic(message):
        return None

    normalized = normalize_amharic_search_text(message)
    if not normalized:
        return dict(UNKNOWN)

    intent = _match_intent(normalized)
    if intent:
        english, direct = intent
        if english and deps.english_structured_chat is not None:
            try:
                via = deps.english_structured_chat(english)
                if isinstance(via, dict) and via.get("type") not in (None, "ai", "unknown"):
                    return via
            except Exception:
                pass
        if direct:
            return _calendar_as(direct, deps.calendar_today())

    hymn = _search_hymns_amharic(normalized, deps)
    if hymn:
        return hymn

    prayer = _as_typed_search("prayer_search", normalized, deps.search_prayers(normalized, 12))
    if prayer:
        return prayer

    bible = _as_typed_search("bible_search", normalized, deps.search_bible(normalized, 12))
    if bible:
        return bible

    syn = _as_typed_search(
        "synaxarium_search",
        normalized,
        deps.search_synaxarium(normalized, 12),
    )
    if syn:
        return syn

    return dict(UNKNOWN)
