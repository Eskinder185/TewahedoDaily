"""Answer-quality helpers for private RAG eval (optional live Gemma).

Does not publish content or alter Search Buddy. Unapproved drafts used only as
research context and must be labeled as such in prompts.
"""

from __future__ import annotations

import json
import os
import re
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any, Optional, Sequence

from .gold_questions import GoldQuestion
from .index import SearchHit


DISCLAIMER = (
    "RESEARCH CONTEXT ONLY: The following passages are unapproved editorial "
    "drafts for offline evaluation. They are NOT officially approved Church "
    "teaching. Do not invent citations. Prefer saying when evidence is missing."
)


def build_prompt(
    question: GoldQuestion,
    hits: Sequence[SearchHit],
    *,
    with_context: bool,
) -> list[dict[str, str]]:
    system = (
        "You are evaluating Ethiopian Orthodox Tewahedo educational Q&A. "
        "Answer the user's question directly in the question's language. "
        "Distinguish Scripture, Church teaching, and uncertainty. "
        "Never invent verse quotations or claim official approval for draft texts."
    )
    if with_context:
        blocks = [DISCLAIMER]
        for h in hits[:4]:
            p = h.passage
            blocks.append(
                f"[{p.document_id}/{p.paragraph_id} lang={p.language} "
                f"approved_for_ingestion={p.approved_for_ingestion} "
                f"kind={p.content_kind}]\n{p.text}"
            )
        system += "\n\n" + "\n\n".join(blocks)
    return [
        {"role": "system", "content": system},
        {"role": "user", "content": question.question},
    ]


@dataclass
class AnswerJudgement:
    qid: str
    with_context: bool
    answered: bool
    used_retrieved_ids: list[str]
    invents_clock_time: bool
    invents_citation_pattern: bool
    mixes_languages_unexpectedly: bool
    contains_disclaimer_leak: bool
    keyword_grounding: float
    notes: str = ""

    def as_dict(self) -> dict[str, Any]:
        return asdict(self)


_CLOCK = re.compile(
    r"\b(\d{1,2}:\d{2}\s*(am|pm)?|at\s+\d{1,2}\s*(am|pm))\b", re.I
)
_CITE = re.compile(
    r"\b(Genesis|Exodus|Matthew|Mark|Luke|John|Romans|Acts)\s+\d+:\d+",
    re.I,
)


def judge_answer(
    question: GoldQuestion,
    answer: str,
    hits: Sequence[SearchHit],
    *,
    with_context: bool,
) -> AnswerJudgement:
    text = answer or ""
    used = []
    for h in hits[:5]:
        if h.passage.paragraph_id in text or h.passage.document_id in text:
            used.append(h.passage.paragraph_id)
    keys = question.expected_keywords_any
    grounded = 0
    if keys:
        grounded = sum(1 for k in keys if k.lower() in text.lower() or k in text) / len(
            keys
        )
    eth = bool(re.search(r"[\u1200-\u137F]", text))
    latin = bool(re.search(r"[A-Za-z]{3,}", text))
    mix = False
    if question.language == "am" and latin and not eth:
        mix = True
    if question.language == "en" and eth and not latin:
        mix = True
    return AnswerJudgement(
        qid=question.qid,
        with_context=with_context,
        answered=bool(text.strip()),
        used_retrieved_ids=used,
        invents_clock_time=bool(_CLOCK.search(text)),
        invents_citation_pattern=bool(_CITE.search(text)) and not with_context,
        mixes_languages_unexpectedly=mix,
        contains_disclaimer_leak="RESEARCH CONTEXT ONLY" in text,
        keyword_grounding=grounded,
        notes="heuristic_offline_judge",
    )


def try_live_completion(
    messages: list[dict[str, str]],
    *,
    timeout: float = 60.0,
) -> dict[str, Any]:
    """Optional call to LiteLLM gateway using local secrets if present.

    Never required for retrieval metrics. Fail closed with attempted=False.
    """
    secrets_dir = Path(os.getenv("TEWAHEDO_SECRETS_DIR") or "/run/secrets/tewahedo-ai")
    key_path = secrets_dir / "litellm.key"
    if not key_path.is_file():
        # Also allow env for local research machines
        api_key = os.getenv("LITELLM_API_KEY", "").strip()
        if not api_key:
            return {
                "attempted": False,
                "reason": "no_litellm_credentials",
                "model": None,
                "answer": None,
            }
        headers = {"Authorization": f"Bearer {api_key}"}
    else:
        headers = {
            "Authorization": "Bearer " + key_path.read_text(encoding="utf-8").strip()
        }
        cf_id = secrets_dir / "cf-client-id"
        cf_secret = secrets_dir / "cf-client-secret"
        if cf_id.is_file() and cf_secret.is_file():
            headers["CF-Access-Client-Id"] = cf_id.read_text(encoding="utf-8").strip()
            headers["CF-Access-Client-Secret"] = cf_secret.read_text(
                encoding="utf-8"
            ).strip()

    import httpx

    url = os.getenv(
        "LITELLM_URL", "https://gateway.eskinder.dev/v1/chat/completions"
    )
    model = os.getenv("RAG_EVAL_MODEL", "home-ai")
    try:
        with httpx.Client(timeout=timeout) as client:
            response = client.post(
                url,
                headers=headers,
                json={
                    "model": model,
                    "messages": messages,
                    "temperature": 0.2,
                    "max_tokens": 800,
                },
            )
            response.raise_for_status()
            data = response.json()
            answer = data["choices"][0]["message"]["content"]
            return {
                "attempted": True,
                "ok": True,
                "model": model,
                "answer": answer,
                "raw_finish": data["choices"][0].get("finish_reason"),
            }
    except Exception as exc:  # noqa: BLE001
        return {
            "attempted": True,
            "ok": False,
            "model": model,
            "answer": None,
            "error": str(exc),
        }


def simulate_grounded_answer(
    question: GoldQuestion, hits: Sequence[SearchHit]
) -> str:
    """Deterministic stand-in when Gemma is unreachable — for wiring tests only."""
    if not hits:
        return (
            "I do not have verified approved sources for this question in the "
            "evaluation index."
        )
    top = hits[0].passage
    lead = {
        "when": "The available draft passages do not establish an exact clock time. ",
        "why": "According to the retrieved draft context, the reason centers on: ",
        "what": "Based on retrieved draft passages: ",
        "who": "Based on retrieved draft passages, the persons involved are discussed as: ",
        "how": "Based on retrieved draft passages, the process is described as: ",
    }.get(question.intent, "Based on retrieved draft passages: ")
    snippet = top.text.strip().replace("\n", " ")
    if len(snippet) > 280:
        snippet = snippet[:277] + "..."
    return (
        f"{lead}{snippet} "
        f"(research draft ref {top.document_id}/{top.paragraph_id}; "
        f"approved_for_ingestion={top.approved_for_ingestion})."
    )
