"""Five Mysteries of Faith vs Seven Sacraments — classification and live guards."""
from __future__ import annotations

from unittest.mock import AsyncMock

import httpx
import pytest
from fastapi.testclient import TestClient

import doctrinal_categories as doctrine
import main
import security as sec


def test_five_mysteries_english_and_amharic():
    assert doctrine.classify_doctrinal_category("What are the Five Mysteries?") == "five_mysteries"
    assert (
        doctrine.classify_doctrinal_category("አምስቱ ምሥጢራት ምንድን ናቸው?")
        == "five_mysteries"
    )
    assert doctrine.is_five_mysteries_question("What are the mysteries of the faith?")


def test_seven_sacraments_english_and_amharic():
    assert (
        doctrine.classify_doctrinal_category("What are the Seven Sacraments?")
        == "seven_sacraments"
    )
    assert (
        doctrine.classify_doctrinal_category("What are the sacraments of the Church?")
        == "seven_sacraments"
    )
    assert doctrine.is_seven_sacraments_question("Name the seven sacraments")


def test_ambiguous_mysteries_needs_clarification():
    assert doctrine.classify_doctrinal_category("What are the mysteries?") == "ambiguous_mysteries"
    assert doctrine.classify_doctrinal_category("What are the mysteries of the Church?") == (
        "ambiguous_mysteries"
    )
    out = doctrine.try_verified_doctrine_response("What are the mysteries?")
    assert out is not None
    assert out["needs_clarification"] is True
    assert "Five Mysteries" in out["answer"] or "ምሥጢራተ ሃይማኖት" in out["answer"]
    assert "Seven Sacraments" in out["answer"] or "ሳክራመንት" in out["answer"] or "ቅዱሳት" in out["answer"]


def test_five_mysteries_answer_has_exactly_five_and_not_seven():
    out = doctrine.try_verified_doctrine_response("What are the Five Mysteries of the Church?")
    assert out is not None
    assert out["doctrine_category"] == "five_mysteries"
    answer = out["answer"]
    assert "Trinity" in answer or "ሥላሴ" in answer
    assert "Incarnation" in answer or "ሥጋዌ" in answer
    assert "Resurrection of the Dead" in answer or "ትንሣኤ ሙታን" in answer
    # Contrastive mention of "seven sacraments" is OK; listing them as the five is not.
    assert "matrimony" not in answer.lower()
    assert "holy orders" not in answer.lower()
    assert "confirmation" not in answer.lower()
    assert not doctrine.claims_cross_category_mix(answer, "five_mysteries")
    assert len(out["verified_doctrine"]["items"]) == 5


def test_seven_sacraments_answer_has_seven_and_anchors_f01():
    out = doctrine.try_verified_doctrine_response("What are the Seven Sacraments?")
    assert out is not None
    assert out["doctrine_category"] == "seven_sacraments"
    answer = out["answer"]
    assert "F01W-P0165" in answer or out["verified_doctrine"]["list_source_paragraph_id"] == "F01W-P0165"
    for name in ("Baptism", "Confirmation", "Penance", "Holy Communion", "Unction", "Matrimony", "Holy Orders"):
        assert name.lower() in answer.lower() or name in answer
    assert "Five Mysteries of Faith" in answer or "distinct" in answer.lower()
    assert len(out["verified_doctrine"]["items"]) == 7
    assert all(item["source_paragraph_ids"] for item in out["verified_doctrine"]["items"])


def test_amharic_five_mysteries_uses_traditional_terms():
    out = doctrine.try_verified_doctrine_response("አምስቱ ምሥጢራት ምንድን ናቸው?")
    assert out is not None
    assert "ምሥጢረ ሥላሴ" in out["answer"]
    assert "ምሥጢረ ሥጋዌ" in out["answer"]
    assert "ምሥጢረ ትንሣኤ ሙታን" in out["answer"]


def test_cross_category_mix_detector():
    five_bad = "The five mysteries are baptism, confirmation, penance, communion, matrimony, and holy orders — the seven sacraments."
    assert doctrine.claims_cross_category_mix(five_bad, "five_mysteries")
    seven_bad = "The seven sacraments are the Mystery of the Trinity and the Mystery of the Incarnation and five mysteries."
    assert doctrine.claims_cross_category_mix(seven_bad, "seven_sacraments")
    five_ok = doctrine.five_mysteries_answer(prefer_amharic=False)
    assert not doctrine.claims_cross_category_mix(five_ok, "five_mysteries")


@pytest.fixture
def doctrine_client(monkeypatch):
    monkeypatch.setattr(main, "check_chat_rate_limit", lambda _ip: True)
    # Match existing chat_intelligence tests: disable auth gate if present.
    if hasattr(sec, "REQUIRE_AUTH"):
        monkeypatch.setattr(sec, "REQUIRE_AUTH", False)
    for attr in ("require_auth", "enforce_auth", "AUTH_REQUIRED"):
        if hasattr(sec, attr):
            try:
                monkeypatch.setattr(sec, attr, False)
            except Exception:
                pass

    class Boom:
        def __init__(self, *a, **k):
            raise AssertionError("LLM must not be called for verified doctrine")

        async def __aenter__(self):
            return self

        async def __aexit__(self, *a):
            return False

        async def post(self, *a, **k):
            raise AssertionError("LLM must not be called")

    monkeypatch.setattr(httpx, "AsyncClient", Boom)
    monkeypatch.setattr(main, "search_bible_text", AsyncMock(return_value=[]))
    with TestClient(main.app) as client:
        yield client


def test_chat_returns_doctrine_without_calling_llm(doctrine_client):
    res = doctrine_client.post("/api/chat", json={"message": "What are the Five Mysteries?"})
    assert res.status_code == 200
    body = res.json()
    assert body.get("doctrine_verified") is True
    assert body.get("doctrine_category") == "five_mysteries"
    assert "matrimony" not in body["answer"].lower()

    res2 = doctrine_client.post("/api/chat", json={"message": "What are the Seven Sacraments?"})
    assert res2.status_code == 200
    body2 = res2.json()
    assert body2.get("doctrine_category") == "seven_sacraments"
    assert "F01W-P0165" in str(body2.get("verified_doctrine"))


def test_chat_ambiguous_mysteries_clarifies(doctrine_client):
    res = doctrine_client.post("/api/chat", json={"message": "What are the mysteries?"})
    assert res.status_code == 200
    body = res.json()
    assert body.get("needs_clarification") is True


@pytest.mark.asyncio
async def test_gemma_optional_live_smoke():
    """If local Gemma is unreachable, skip — do not fail the suite."""
    try:
        async with httpx.AsyncClient(timeout=3.0) as client:
            # Common local ports from prior research; skip on connection errors.
            for base in ("http://127.0.0.1:11439", "http://127.0.0.1:11434"):
                try:
                    r = await client.get(base)
                    if r.status_code < 500:
                        break
                except Exception:
                    continue
            else:
                pytest.skip("Local Gemma not available")
    except Exception:
        pytest.skip("Local Gemma not available")

    # Deterministic doctrine path is the production fix; live Gemma is optional.
    five = doctrine.five_mysteries_answer(prefer_amharic=False)
    seven = doctrine.seven_sacraments_answer(prefer_amharic=False)
    assert not doctrine.claims_cross_category_mix(five, "five_mysteries")
    assert not doctrine.claims_cross_category_mix(seven, "seven_sacraments")
