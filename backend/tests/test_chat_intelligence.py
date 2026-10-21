"""Deterministic tests for Search Buddy question intelligence (no live LLM)."""

from __future__ import annotations

import json
from unittest.mock import AsyncMock

import httpx
import pytest
from fastapi.testclient import TestClient

import chat_intelligence as intel
import main
import security as sec


def test_detect_language_english_only():
    assert intel.detect_response_language(
        "At what time was Jesus Christ baptized?"
    ) == "en"


def test_detect_language_amharic_only():
    assert intel.detect_response_language("ኢየሱስ ክርስቶስ ለምን ተጠመቀ?") == "am"
    assert intel.detect_response_language("ሰላም፣ ስምህ ማን ነው?") == "am"
    assert intel.detect_response_language("አምስቱ ምሥጢራት ምንድን ናቸው?") == "am"


def test_detect_language_explicit_bilingual():
    assert (
        intel.detect_response_language(
            "Explain the Trinity in English and Amharic"
        )
        == "bilingual"
    )


def test_classify_when_vs_why():
    assert (
        intel.classify_question_focus(
            "At what time was Jesus Christ baptized?"
        )
        == "when"
    )
    assert (
        intel.classify_question_focus(
            "Why did Jesus choose to be baptized in the Jordan River?"
        )
        == "why"
    )
    assert intel.classify_question_focus("ሰላም፣ ስምህ ማን ነው?") == "identity"


def test_baptism_topic_lookups_include_matthew_and_luke():
    lookups = intel.suggest_scripture_lookups(
        "Why did Jesus choose to be baptized in the Jordan River?"
    )
    keys = {(x.book, x.chapter, x.verse_start, x.verse_end) for x in lookups}
    assert ("Matthew", 3, 13, 17) in keys
    assert ("Luke", 3, 21, 23) in keys


def test_when_baptism_also_grounds_scripture():
    lookups = intel.suggest_scripture_lookups(
        "At what time was Jesus Christ baptized?"
    )
    assert any(x.book == "Luke" and x.chapter == 3 for x in lookups)


def test_five_mysteries_skips_topic_map():
    assert intel.suggest_scripture_lookups("What are the Five Mysteries?") == []
    assert intel.is_five_mysteries_question("አምስቱ ምሥጢራት ምንድን ናቸው?")


def test_unicode_round_trip_amharic():
    original = "ሰላም፣ ስምህ ማን ነው؟ ኢየሱስ ክርስቶስ ለምን ተጠመቀ?"
    # Force a "?" that might appear; keep Ethiopic intact through JSON.
    payload = {"message": "ሰላም፣ ስምህ ማን ነው? ኢየሱስ ክርስቶስ ለምን ተጠመቀ?"}
    encoded = json.dumps(payload, ensure_ascii=False)
    decoded = json.loads(encoded)
    assert "ሰላም" in decoded["message"]
    assert "ኢየሱስ" in decoded["message"]
    assert intel.contains_ethiopic(decoded["message"])


def test_answering_instructions_language_and_when():
    text = intel.build_answering_instructions(
        language="en",
        focus="when",
        has_verified_scripture=True,
    )
    assert "English only" in text
    assert "WHEN" in text or "when" in text.lower()
    assert "Amharic translation" in text or "Amharic" in text

    am = intel.build_answering_instructions(
        language="am",
        focus="why",
        has_verified_scripture=False,
    )
    assert "Amharic only" in am or "አማርኛ" in am
    assert "English translation" in am or "English" in am


@pytest.fixture
def client(monkeypatch):
    async def fake_supabase_get(path, params=None):
        return []

    monkeypatch.setattr(main, "supabase_get", fake_supabase_get)

    captured = {"messages": None}

    class FakeResponse:
        status_code = 200

        def raise_for_status(self):
            return None

        def json(self):
            return {
                "choices": [
                    {
                        "finish_reason": "stop",
                        "message": {
                            "content": (
                                "The Bible does not specify the exact time of day "
                                "when Jesus was baptized. Luke 3:21–23 indicates He "
                                "was about thirty years old when He began His ministry."
                            )
                        },
                    }
                ],
                "usage": {"completion_tokens": 40},
            }

    class FakeAsyncClient:
        def __init__(self, *args, **kwargs):
            pass

        async def __aenter__(self):
            return self

        async def __aexit__(self, *args):
            return False

        async def post(self, url, headers=None, json=None):
            captured["messages"] = (json or {}).get("messages")
            return FakeResponse()

    monkeypatch.setattr(httpx, "AsyncClient", FakeAsyncClient)

    import pathlib

    original_read = pathlib.Path.read_text

    def safe_read(self, *args, **kwargs):
        if "tewahedo-ai" in str(self) or "secrets" in str(self):
            return "test-secret"
        return original_read(self, *args, **kwargs)

    monkeypatch.setattr(pathlib.Path, "read_text", safe_read)

    # Avoid real bible_reference network for topic grounding.
    async def fake_bible_reference(
        book, chapter, verse, end_verse=None, language="en"
    ):
        end = end_verse or verse
        verses = []
        for n in range(verse, end + 1):
            verses.append(
                {
                    "verse_number": n,
                    "text": f"Verified {book} {chapter}:{n} ({language})",
                    "covers_verse_range": None,
                }
            )
        return {
            "book": {"name_en": book, "slug": book.lower()},
            "reference": f"{book} {chapter}:{verse}"
            + (f"-{end}" if end != verse else ""),
            "edition": "am" if language == "am" else "web",
            "language": language,
            "verses": verses,
        }

    monkeypatch.setattr(main, "bible_reference", fake_bible_reference)

    with TestClient(main.app) as test_client:
        yield test_client, captured


def test_chat_when_baptism_sends_en_instructions_and_sources(client):
    test_client, captured = client
    res = test_client.post(
        "/api/chat",
        json={"message": "At what time was Jesus Christ baptized?"},
    )
    assert res.status_code == 200
    body = res.json()
    assert body["type"] == "ai"
    assert isinstance(body.get("sources"), list)
    refs = " ".join(s.get("reference", "") for s in body["sources"])
    assert "Matthew 3" in refs or "Luke 3" in refs
    # English-only instruction in system messages
    systems = "\n".join(
        m["content"] for m in captured["messages"] if m["role"] == "system"
    )
    assert "English only" in systems
    assert "WHEN" in systems or "when" in systems.lower()
    assert "do not invent" in systems.lower() or "Never invent" in systems


def test_chat_why_jordan_grounds_matthew_range(client):
    test_client, captured = client
    res = test_client.post(
        "/api/chat",
        json={
            "message": "Why did Jesus choose to be baptized in the Jordan River?"
        },
    )
    assert res.status_code == 200
    sources = res.json()["sources"]
    assert any("Matthew 3:13" in (s.get("reference") or "") for s in sources)
    systems = "\n".join(
        m["content"] for m in captured["messages"] if m["role"] == "system"
    )
    assert "WHY" in systems or "why" in systems.lower()


def test_chat_amharic_greeting_language_instruction(client):
    test_client, captured = client
    msg = "ሰላም፣ ስምህ ማን ነው?"
    res = test_client.post("/api/chat", json={"message": msg})
    assert res.status_code == 200
    # Round-trip: user message preserved in gateway payload
    user_msgs = [m for m in captured["messages"] if m["role"] == "user"]
    assert user_msgs and user_msgs[0]["content"] == msg
    systems = "\n".join(
        m["content"] for m in captured["messages"] if m["role"] == "system"
    )
    assert "Amharic only" in systems or "አማርኛ" in systems


def test_chat_amharic_five_mysteries_still_routes(client):
    test_client, captured = client
    res = test_client.post(
        "/api/chat",
        json={"message": "አምስቱ ምሥጢራት ምንድን ናቸው?"},
    )
    assert res.status_code == 200
    body = res.json()
    # Deterministic doctrine path: Five Mysteries list, not Seven Sacraments,
    # and not an LLM conflation. LLM may be skipped entirely.
    assert body.get("doctrine_verified") is True or body.get("type") == "ai"
    answer = body.get("answer") or body.get("message") or ""
    assert "ምሥጢረ ሥላሴ" in answer or "Trinity" in answer
    assert "matrimony" not in answer.lower()
    assert "holy orders" not in answer.lower()
    if body.get("doctrine_verified"):
        assert body.get("doctrine_category") == "five_mysteries"
        assert captured.get("messages") in (None, [], {}) or not captured.get("messages")


def test_security_suite_still_loads():
    # Import-time sanity: security helpers remain available.
    assert sec.MAX_REQUEST_BODY_BYTES == 32 * 1024
