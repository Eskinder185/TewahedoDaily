# -*- coding: utf-8 -*-
"""Generate Amharic Search Buddy modules with Unicode escapes only."""
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

AMHARIC_TEXT_TS = r'''/** Ethiopic Unicode block (includes Amharic). */
const ETHIOPIC_RE = /[\u1200-\u137F\u1380-\u139F\u2D80-\u2DDF\uAB00-\uAB2F]/

/** Terminal / decorative punctuation commonly returned by ASR. */
const AMHARIC_PUNCT_RE = /[\u1362\u1363\u1364\u1365\u1366\u1367\u061F?!.,;:\u2026]+/g

export function containsEthiopic(text: string): boolean {
  return ETHIOPIC_RE.test(text)
}

/**
 * Normalize Amharic search text for structured retrieval.
 * Trims whitespace and strips terminal punctuation; does not transliterate.
 */
export function normalizeAmharicSearchText(text: string): string {
  return text
    .replace(AMHARIC_PUNCT_RE, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}
'''

AMHARIC_STRUCTURED_TS = r'''import { AI_TIMEOUTS_MS } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import type {
  BibleSearchHit,
  HymnRow,
  PrayerRow,
  SearchBuddyApiResponse,
  SynaxariumRow,
} from './apiTypes.ts'
import { containsEthiopic, normalizeAmharicSearchText } from './amharicText.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from './parseSearchBuddyResponse.ts'

type IntentAlias = {
  patterns: string[]
  englishChat?: string
  direct?: 'calendar_today' | 'fasting_today' | 'synaxarium_today'
}

const AMHARIC_INTENT_ALIASES: IntentAlias[] = [
  {
    patterns: [
      '\u12DB\u122C \u133E\u121D \u1290\u12CD',
      '\u12DB\u122C \u133E\u121D',
    ],
    englishChat: 'fasting today',
    direct: 'fasting_today',
  },
  {
    patterns: [
      '\u12E8\u12DB\u122C \u1240\u1295',
      '\u12DB\u122C \u121D\u1295 \u1240\u1295 \u1290\u12CD',
      '\u12DB\u122C \u121D\u1295 \u1240\u1295',
    ],
    englishChat: 'calendar today',
    direct: 'calendar_today',
  },
  {
    patterns: [
      '\u12E8\u12DB\u122C \u1245\u12F1\u1233\u1295',
      '\u12DB\u122C \u12E8\u121A\u1273\u1230\u1261 \u1245\u12F1\u1233\u1295',
      '\u12DB\u122C \u1245\u12F1\u1233\u1295',
    ],
    direct: 'synaxarium_today',
  },
]

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function matchAmharicIntent(normalized: string): IntentAlias | null {
  const compact = normalized.replace(/\s+/g, ' ').trim()
  if (!compact) return null
  for (const alias of AMHARIC_INTENT_ALIASES) {
    for (const pattern of alias.patterns) {
      if (compact === pattern || compact.includes(pattern)) {
        return alias
      }
    }
  }
  return null
}

async function getJson(path: string, signal?: AbortSignal): Promise<unknown> {
  return aiFetch<unknown>({
    path,
    method: 'GET',
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })
}

async function postEnglishChat(message: string, signal?: AbortSignal): Promise<SearchBuddyApiResponse> {
  const raw = await aiFetch<unknown>({
    path: '/api/chat',
    method: 'POST',
    json: {
      message,
      timezone:
        typeof Intl !== 'undefined'
          ? Intl.DateTimeFormat().resolvedOptions().timeZone
          : 'UTC',
    },
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })
  return parseSearchBuddyResponse(raw)
}

function asHymnSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as HymnRow[]) : []
  if (!results.length) return null
  return {
    type: 'hymn_search',
    query,
    results,
    message: typeof payload.message === 'string' ? payload.message : undefined,
  }
}

function asPrayerSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as PrayerRow[]) : []
  if (!results.length) return null
  return { type: 'prayer_search', query, results }
}

function asBibleSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as BibleSearchHit[]) : []
  if (!results.length) return null
  return { type: 'bible_search', query, results }
}

function asSynaxariumSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as SynaxariumRow[]) : []
  if (!results.length) return null
  return { type: 'synaxarium_search', query, results }
}

function calendarTodayAsTyped(
  payload: unknown,
  type: 'calendar_today' | 'fasting_today' | 'synaxarium_today',
): SearchBuddyApiResponse {
  const base = isRecord(payload) ? payload : {}
  if (type === 'fasting_today') {
    return parseSearchBuddyResponse({ ...base, type: 'fasting_today' })
  }
  if (type === 'synaxarium_today') {
    const commemorations =
      (Array.isArray(base.synaxarium) && base.synaxarium) ||
      (Array.isArray(base.commemorations) && base.commemorations) ||
      (isRecord(base.synaxarium_day) && Array.isArray(base.synaxarium_day.commemorations)
        ? base.synaxarium_day.commemorations
        : [])
    return parseSearchBuddyResponse({
      ...base,
      type: 'synaxarium_today',
      commemorations,
      title:
        (isRecord(base.synaxarium_day) &&
          (base.synaxarium_day.title || base.synaxarium_day.display_date_english)) ||
        base.ethiopian_label ||
        base.title,
      display_date_english: base.ethiopian_label || base.display_date_english,
    })
  }
  return parseSearchBuddyResponse({ ...base, type: 'calendar_today' })
}

async function searchHymnsAmharic(
  normalized: string,
  signal?: AbortSignal,
): Promise<SearchBuddyApiResponse | null> {
  const full = await getJson(
    `/api/hymns/search?q=${encodeURIComponent(normalized)}&limit=12`,
    signal,
  )
  const hit = asHymnSearch(normalized, full)
  if (hit) return hit

  const tokens = normalized.split(/\s+/).filter((t) => t.length >= 2)
  const merged: HymnRow[] = []
  const seen = new Set<string>()
  for (const token of tokens) {
    const part = await getJson(
      `/api/hymns/search?q=${encodeURIComponent(token)}&limit=8`,
      signal,
    )
    if (!isRecord(part) || !Array.isArray(part.results)) continue
    for (const row of part.results) {
      if (!isRecord(row)) continue
      const key = String(row.slug || row.id || row.title_amharic || row.title || '')
      if (!key || seen.has(key)) continue
      seen.add(key)
      merged.push(row as HymnRow)
    }
  }
  if (!merged.length) return null
  return { type: 'hymn_search', query: normalized, results: merged }
}

const UNKNOWN_AMHARIC: SearchBuddyApiResponse = {
  type: 'unknown',
  message: "I couldn't find a matching result yet.",
}

/**
 * Amharic / Ethiopic structured-first Search Buddy path.
 * Never sends Ethiopic text to the LLM chat fallback.
 */
export async function resolveAmharicStructuredSearch(
  rawMessage: string,
  signal?: AbortSignal,
): Promise<SearchBuddyApiResponse | null> {
  if (!containsEthiopic(rawMessage)) return null

  const normalized = normalizeAmharicSearchText(rawMessage)
  if (!normalized) {
    return UNKNOWN_AMHARIC
  }

  const intent = matchAmharicIntent(normalized)
  if (intent) {
    if (intent.englishChat) {
      try {
        const viaChat = await postEnglishChat(intent.englishChat, signal)
        if (viaChat.type !== 'ai' && !isEmptySearchBuddyResponse(viaChat)) {
          return viaChat
        }
      } catch {
        /* fall through to direct GET */
      }
    }
    if (intent.direct) {
      const today = await getJson('/api/calendar/today', signal)
      return calendarTodayAsTyped(today, intent.direct)
    }
  }

  const hymn = await searchHymnsAmharic(normalized, signal)
  if (hymn) return hymn

  const prayerPayload = await getJson(
    `/api/prayers/search?q=${encodeURIComponent(normalized)}&limit=12`,
    signal,
  )
  const prayer = asPrayerSearch(normalized, prayerPayload)
  if (prayer) return prayer

  const biblePayload = await getJson(
    `/api/bible/search?q=${encodeURIComponent(normalized)}&language=am&limit=12`,
    signal,
  )
  const bible = asBibleSearch(normalized, biblePayload)
  if (bible) return bible

  const synPayload = await getJson(
    `/api/synaxarium/search?q=${encodeURIComponent(normalized)}&limit=12`,
    signal,
  )
  const syn = asSynaxariumSearch(normalized, synPayload)
  if (syn) return syn

  return UNKNOWN_AMHARIC
}

export function shouldUseAmharicStructuredPath(message: string): boolean {
  return containsEthiopic(message)
}
'''

AMHARIC_TEXT_PY = r'''"""Amharic / Ethiopic helpers for Search Buddy /api/chat routing."""

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
'''

AMHARIC_ROUTING_PY = r'''"""Structured-first Amharic routing for POST /api/chat.

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
'''

INIT_PY = '"""Drop-in Amharic structured routing helpers for the Tewahedo AI FastAPI service."""\n'

PATCH_MD = '''# Amharic structured routing patch (Tewahedo AI)

Copy `server/tewahedo_ai/` into the FastAPI service package (or add this repo path
to `PYTHONPATH`) and call it at the top of `POST /api/chat` **before** Ollama/Qwen.

```python
from tewahedo_ai.amharic_text import contains_ethiopic
from tewahedo_ai.amharic_routing import AmharicSearchDeps, resolve_amharic_structured

deps = AmharicSearchDeps(
    search_hymns=lambda q, limit: hymns_search_impl(q, limit),
    search_prayers=lambda q, limit: prayers_search_impl(q, limit),
    search_bible=lambda q, limit: bible_search_impl(q, language="am", limit=limit),
    search_synaxarium=lambda q, limit: synaxarium_search_impl(q, limit),
    calendar_today=lambda: calendar_today_impl(),
    english_structured_chat=lambda msg: existing_english_structured_router(msg),
)

if contains_ethiopic(body.message):
    result = resolve_amharic_structured(body.message, deps)
    if result is not None:
        return result
# ... existing English structured + LLM path unchanged ...
```

Do **not** change `/api/transcribe`.
'''

SEND_TS = r'''import { AI_TIMEOUTS_MS, getAiApiBaseUrl, isAiApiConfigured } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import { AiClientError } from '../ai/aiTypes.ts'
import {
  resolveAmharicStructuredSearch,
  shouldUseAmharicStructuredPath,
} from './amharicStructuredSearch.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from './parseSearchBuddyResponse.ts'
import type { SearchBuddyApiResponse } from './apiTypes.ts'

export type SendSearchBuddyResult = {
  response: SearchBuddyApiResponse
  empty: boolean
}

/**
 * Single Search Buddy API entry point.
 * Amharic / Ethiopic: structured retrieval first (never LLM).
 * English / other: POST /api/chat  body: { message }
 */
export async function sendSearchBuddyMessage(
  message: string,
  signal?: AbortSignal,
): Promise<SendSearchBuddyResult> {
  const trimmed = message.trim()
  if (!trimmed) {
    throw new AiClientError('bad_request', 'Enter a search question first.')
  }

  const base = getAiApiBaseUrl()
  if (!base) {
    const hint =
      import.meta.env.DEV
        ? 'Set VITE_TEWAHEDO_AI_API_URL in .env.local (e.g. http://10.0.0.86:8000) and restart Vite.'
        : 'Extended Search Buddy answers are temporarily unavailable.'
    throw new AiClientError('not_configured', hint)
  }

  if (shouldUseAmharicStructuredPath(trimmed)) {
    const response = await resolveAmharicStructuredSearch(trimmed, signal)
    if (response) {
      return { response, empty: isEmptySearchBuddyResponse(response) }
    }
  }

  const raw = await aiFetch<unknown>({
    path: '/api/chat',
    method: 'POST',
    json: {
      message: trimmed,
      timezone:
        typeof Intl !== 'undefined'
          ? Intl.DateTimeFormat().resolvedOptions().timeZone
          : 'UTC',
    },
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })

  const response = parseSearchBuddyResponse(raw)
  return { response, empty: isEmptySearchBuddyResponse(response) }
}

export function searchBuddyApiReady(): boolean {
  return isAiApiConfigured()
}

export function missingApiUrlDevMessage(): string | null {
  if (!import.meta.env.DEV) return null
  if (isAiApiConfigured()) return null
  return 'Developer: VITE_TEWAHEDO_AI_API_URL is not set. Add it to .env.local and restart Vite to use the FastAPI Search Buddy backend.'
}
'''


def main() -> None:
    files = {
        ROOT / "src/lib/searchBuddy/amharicText.ts": AMHARIC_TEXT_TS,
        ROOT / "src/lib/searchBuddy/amharicStructuredSearch.ts": AMHARIC_STRUCTURED_TS,
        ROOT / "src/lib/searchBuddy/sendSearchBuddyMessage.ts": SEND_TS,
        ROOT / "server/tewahedo_ai/__init__.py": INIT_PY,
        ROOT / "server/tewahedo_ai/amharic_text.py": AMHARIC_TEXT_PY,
        ROOT / "server/tewahedo_ai/amharic_routing.py": AMHARIC_ROUTING_PY,
        ROOT / "server/tewahedo_ai/PATCH_CHAT.md": PATCH_MD,
    }
    for path, text in files.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8", newline="\n")
        print(f"wrote {path.relative_to(ROOT)} ({path.stat().st_size} bytes)")


if __name__ == "__main__":
    main()
