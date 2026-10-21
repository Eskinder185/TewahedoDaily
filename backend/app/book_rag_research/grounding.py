"""Evidence-first claim support, citation checks, and abstention for private RAG eval.

Mechanical proxies only — never certify theological correctness or Amharic fluency.
"""
from __future__ import annotations

import re

from chat_intelligence import detect_response_language

TOKEN = re.compile(r"[^\W_]+", re.UNICODE)
VERSE_REF = re.compile(
    r"(?:\b(?:Psalm|Psalms|Ps|Matthew|Matt|Mark|Luke|John|Acts|Romans|Rom|"
    r"Genesis|Exodus|Isaiah|Ezekiel|Jeremiah|Judges|Mk|Lk|Jn|Mt)\.?\s*)?"
    r"\d{1,3}\s*[:፥]\s*\d{1,3}(?:\s*[-–—]\s*\d{1,3})?",
    re.I,
)
# High-risk glosses that often appear without source support in prior Gemma runs.
RISKY_MARKERS = {
    "ሰማይ": ("heaven", "heavens", "heavenly", "ሰማይ", "ሰማያዊ"),
    "ሰማያዊ": ("heaven", "heavens", "heavenly", "ሰማይ", "ሰማያዊ"),
    "heaven": ("heaven", "heavens", "heavenly", "ሰማይ", "ሰማያዊ"),
    "heavens": ("heaven", "heavens", "heavenly", "ሰማይ", "ሰማያዊ"),
    "heavenly": ("heaven", "heavens", "heavenly", "ሰማይ", "ሰማያዊ"),
}
# Known Amharic terminology repairs for observed Gemma substitutions (not theology edits).
TERM_REPAIRS = (
    ("ሦስትነት", "ሥላሴ"),
    ("የሦስትነት", "የሥላሴ"),
)
STOP = {
    "the", "a", "an", "and", "or", "of", "to", "in", "on", "for", "is", "are", "was", "were",
    "be", "by", "with", "as", "that", "this", "it", "from", "at", "his", "her", "their",
    "he", "she", "they", "not", "no", "yes", "who", "what", "why", "when", "where", "how",
    "ነው", "ናቸው", "የ", "ለ", "በ", "ከ", "ወደ", "ስለ", "እና", "ወይም", "ይህ", "እነዚህ", "ምን", "ለምን",
}


def tokens(text: str) -> list[str]:
    return [t.lower() for t in TOKEN.findall(text or "")]


def content_tokens(text: str) -> list[str]:
    return [t for t in tokens(text) if t not in STOP and len(t) > 1]


def evidence_map(evidence) -> dict:
    return {e["citation"]: e for e in evidence}


def apply_term_repairs(text: str) -> tuple[str, list[str]]:
    repairs = []
    out = text
    for bad, good in TERM_REPAIRS:
        if bad in out:
            out = out.replace(bad, good)
            repairs.append(f"{bad}->{good}")
    return out, repairs


def strip_verse_refs(text: str) -> str:
    cleaned = VERSE_REF.sub("", text)
    cleaned = re.sub(r"\(\s*\)", "", cleaned)
    cleaned = re.sub(r"\s{2,}", " ", cleaned)
    cleaned = re.sub(r"\s+([,.;:])", r"\1", cleaned)
    return cleaned.strip(" ,;:-")


def verse_refs_in(text: str) -> list[str]:
    return VERSE_REF.findall(text or "")


def citation_paragraphs_valid(evidence) -> bool:
    for e in evidence:
        pids = e.get("paragraph_ids")
        if not isinstance(pids, list) or not pids:
            return False
        if not all(isinstance(p, str) and p.strip() for p in pids):
            return False
    return True


def bible_refs_supported(claim_text: str, passage_text: str) -> bool:
    """Numeric chapter:verse forms must appear in the cited passage if present at all."""
    refs = verse_refs_in(claim_text)
    if not refs:
        return True
    passage = passage_text or ""
    for ref in refs:
        # Normalize separators for a loose containment check.
        compact = re.sub(r"\s+", "", ref.lower().replace("፥", ":"))
        hay = re.sub(r"\s+", "", passage.lower().replace("፥", ":"))
        if compact not in hay and ref not in passage:
            return False
    return True


def support_score(claim_text: str, passage_text: str) -> dict:
    """Lexical overlap proxy — not entailment or theological approval."""
    claim = content_tokens(claim_text)
    passage = set(content_tokens(passage_text))
    if not claim:
        return {"score": 0.0, "supported": 0, "total": 0, "unsupported_tokens": []}
    supported = [t for t in claim if t in passage]
    missing = [t for t in claim if t not in passage]
    # Risky markers: substring match so prefixed Amharic forms like በሰማይ are caught.
    risky_hits = []
    claim_l = (claim_text or "").lower()
    passage_l = (passage_text or "").lower()
    for marker, aliases in RISKY_MARKERS.items():
        if marker.lower() in claim_l or any(marker.lower() in t for t in claim):
            if not any(a.lower() in passage_l or a.lower() in passage for a in aliases):
                risky_hits.append(marker)
                break
    score = len(supported) / len(claim)
    return {
        "score": score,
        "supported": len(supported),
        "total": len(claim),
        "unsupported_tokens": missing[:12],
        "risky_unsupported": risky_hits,
    }


def claim_is_supported(claim_text: str, passage_text: str, *, min_score: float = 0.34) -> tuple[bool, dict]:
    detail = support_score(claim_text, passage_text)
    if detail["risky_unsupported"]:
        detail["reason"] = "risky_marker_absent_from_source"
        return False, detail
    if not bible_refs_supported(claim_text, passage_text):
        detail["reason"] = "bible_ref_not_in_cited_passage"
        return False, detail
    claim_eth = bool(re.search(r"[\u1200-\u137f]", claim_text or ""))
    pass_eth = bool(re.search(r"[\u1200-\u137f]", passage_text or ""))
    # Cross-script pairs (e.g. Amharic answer over English F01) cannot use Latin-token
    # overlap as entailment; risky markers + verse checks still apply. Human review remains required.
    if claim_eth != pass_eth:
        detail["cross_script"] = True
        detail["reason"] = None
        return True, detail
    ok = detail["score"] >= min_score or detail["supported"] >= 3
    if not ok:
        detail["reason"] = "low_lexical_overlap_with_cited_passage"
    return ok, detail


def rank_passages_for_question(question: str, hits, *, limit: int = 5):
    """Re-rank retrieved hits so generation sees the strongest supporting passages first."""
    when = bool(re.search(r"\bwhen\b|at what time|መቼ|ሰዓት", question or "", re.I))
    scored = []
    for h in hits:
        payload = h.get("payload", h) if isinstance(h, dict) else h
        text = payload.get("text", "") if isinstance(payload, dict) else ""
        score = score_passage_for_question(question, text)
        if when and any(w in text.lower() for w in ("time", "hour", "o'clock", "thirty", "age", "ሰዓት", "ዘመን")):
            score += 2
        scored.append((score, h.get("score", 0) if isinstance(h, dict) else 0, h))
    scored.sort(key=lambda x: (-x[0], -x[1]))
    return [h for _, _, h in scored[:limit]]


def classify_failure(rejection: str, raw_answer: str = "") -> str:
    text = f"{rejection}\n{raw_answer}"
    if "Bible database" in rejection or VERSE_REF.search(text):
        return "unsupported_generation_invented_bible_refs"
    if "ሥላሴ" in rejection or "ሦስትነት" in text:
        return "model_terminology_amharic"
    if "English in Amharic" in rejection:
        return "prompt_language_mismatch"
    if "low_lexical" in rejection or "risky_marker" in rejection:
        return "unsupported_generation_not_in_evidence"
    if "bible_ref_not_in" in rejection:
        return "unsupported_generation_invented_bible_refs"
    if "source ID" in rejection or "B99" in text:
        return "citation_id_invalid"
    if "Five Mysteries" in rejection:
        return "incomplete_context_or_routing"
    return "model_or_prompt_contract_failure"


def _short_source_sentences(text: str, *, limit: int = 2, max_chars: int = 280) -> list[str]:
    """Split passage into short extractive sentences; strip numeric verse refs."""
    cleaned = strip_verse_refs(re.sub(r"\s+", " ", text or "").strip())
    parts = re.split(r"(?<=[.!?።፧])\s+", cleaned)
    out = []
    for part in parts:
        part = part.strip(" «»\"'")
        if len(part) < 24:
            continue
        # Skip leftover book/chapter headings that are mostly digits after strip.
        if re.fullmatch(r"[\d\s\-–—/:፥.]+", part):
            continue
        if len(part) > max_chars:
            part = part[:max_chars].rsplit(" ", 1)[0].strip()
        out.append(part)
        if len(out) >= limit:
            break
    return out


def score_passage_for_question(question: str, passage_text: str) -> float:
    q = set(content_tokens(question))
    p = set(content_tokens(passage_text))
    overlap = len(q & p)
    lower = (passage_text or "").lower()
    bonus = 0.0
    if re.search(r"\bwhy\b|ለምን", question or "", re.I):
        if any(w in lower for w in ("why", "because", "reason", "to bless", "humility", "ለምን", "ስለ")):
            bonus += 2
        if re.search(r"\b[a-d]\.\s|^\d+\.", passage_text or "", re.M | re.I):
            bonus += 2
    if "jordan" in (question or "").lower() or "ዮርዳኖስ" in (question or ""):
        if "jordan" in lower or "ዮርዳኖስ" in (passage_text or ""):
            bonus += 3
    return overlap + bonus


def recover_supported_claims(data: dict, evidence, question: str) -> dict | None:
    """Keep only source-supported claims; drop verse invention and unsupported extras.

    Does not invent new theology. Returns None when nothing usable remains.
    """
    if not isinstance(data, dict) or not isinstance(data.get("claims"), list):
        return None
    cleaned, notes = sanitize_structured_claims(data)
    by_id = evidence_map(evidence)
    kept = []
    dropped = []
    lang = detect_response_language(question)
    for claim in cleaned.get("claims") or []:
        text = (claim.get("text") or "").strip()
        sid = claim.get("source_id")
        passage = (by_id.get(sid) or {}).get("text", "")
        if not text or sid not in by_id:
            dropped.append({"reason": "missing_fields", "text": text})
            continue
        # Never salvage model prose that included numeric Bible refs: lexical overlap
        # after stripping still lets unsupported "prophecy" leftovers through.
        if verse_refs_in(text):
            dropped.append({"reason": "numeric_bible_ref_in_claim", "source_id": sid})
            notes.append("dropped_claim_with_numeric_bible_refs")
            continue
        if lang == "am" and re.search(r"[A-Za-z]{3,}", text):
            dropped.append({"reason": "english_in_amharic", "source_id": sid})
            continue
        if lang == "am" and "ሦስትነት" in text:
            text, _ = apply_term_repairs(text)
        ok, detail = claim_is_supported(text, passage)
        if not ok:
            dropped.append({"reason": detail.get("reason"), "source_id": sid, "text": text[:120]})
            continue
        kept.append({"text": text, "source_id": sid})
    if not kept:
        return None
    return {
        "claims": kept[:5],
        "insufficient_evidence": True if dropped or cleaned.get("insufficient_evidence") else bool(data.get("insufficient_evidence")),
        "partial": bool(dropped),
        "dropped_claims": dropped,
        "repair_notes": notes,
        "abstention": False,
    }


def extractive_partial_answer(question: str, evidence) -> dict | None:
    """Build concise claims from source sentences that overlap the question."""
    if not evidence:
        return None
    lang = detect_response_language(question)
    ranked = sorted(
        evidence,
        key=lambda e: -score_passage_for_question(question, e.get("text") or ""),
    )
    claims = []
    for e in ranked:
        text = e.get("text") or ""
        if lang == "am" and re.search(r"[A-Za-z]{3,}", text) and not re.search(r"[\u1200-\u137f]", text):
            continue  # do not paste English extracts into Amharic answers
        if lang != "am" and re.search(r"[\u1200-\u137f]", text) and not re.search(r"[A-Za-z]{3,}", text):
            # Prefer English extracts for English questions when bilingual evidence exists.
            if any(re.search(r"[A-Za-z]{3,}", x.get("text") or "") for x in evidence):
                continue
        for sent in _short_source_sentences(text, limit=2):
            if lang == "am" and re.search(r"[A-Za-z]{3,}", sent):
                continue
            ok, _ = claim_is_supported(sent, text)
            if not ok and not (lang == "am" and bool(re.search(r"[\u1200-\u137f]", text))):
                # Extractive same-script sentences are source text; allow high containment.
                if sent not in text and strip_verse_refs(sent) not in strip_verse_refs(text):
                    continue
            # Dedup near-identical extracts
            if any(sent[:40] == c["text"][:40] for c in claims):
                continue
            claims.append({"text": sent, "source_id": e["citation"]})
            break
        if len(claims) >= 3:
            break
    if not claims:
        return None
    return {
        "claims": claims,
        "insufficient_evidence": True,
        "partial": True,
        "extractive": True,
        "abstention": False,
        "lead_in": (
            "ከምንጩ ቃላት የተወሰደ አጭር መልስ (ረቂቅ ምንጭ፤ ሙሉ ማረጋገጫ አይደለም)፦"
            if lang == "am"
            else "Partial answer from source wording (draft research material; not a complete determination):"
        ),
    }


def abstain_from_evidence(question: str, evidence) -> dict:
    """Last resort when no supported partial answer can be built."""
    # Prefer extractive partial answers over a pure abstention when possible.
    partial = extractive_partial_answer(question, evidence)
    if partial:
        return partial
    lang = detect_response_language(question)
    if not evidence:
        text = (
            "የቀረቡት የጥናት ምንጮች ለዚህ ጥያቄ በቂ ማስረጃ አላሳዩም።"
            if lang == "am"
            else "The supplied research passages do not establish an answer to this question."
        )
        return {
            "claims": [],
            "insufficient_evidence": True,
            "abstention": True,
        }
    top = evidence[0]
    if lang == "am":
        am_hits = [e for e in evidence if re.search(r"[\u1200-\u137f]", e.get("text") or "")]
        top = am_hits[0] if am_hits else evidence[0]
        snippet = re.sub(r"\s+", " ", (top.get("text") or "")).strip()
        snippet = snippet[:280].rsplit(" ", 1)[0] if len(snippet) > 280 else snippet
        snippet = strip_verse_refs(snippet)
        if re.search(r"[A-Za-z]{3,}", snippet):
            text = (
                "በቀረቡት የጥናት ምንጮች መሠረት፣ ለዚህ ጥያቄ በአማርኛ የሚያረጋግጥ በቂ ግልጽ መግለጫ አልተገኘም። "
                "የእንግሊዝኛ ረቂቅ ምንጭ አለ፤ ትርጉም ወይም ያልተደገፈ መግለጫ አልፈጠርኩም።"
            )
        else:
            text = (
                f"በቀረቡት የጥናት ምንጮች መሠረት፣ ጥያቄውን በቀጥታ የሚያረጋግጥ በቂ ግልጽ መግለጫ አልተገኘም። "
                f"ተዛማጅ ምንጭ ቅንጭብ፦ «{snippet}»"
            )
    else:
        snippet = re.sub(r"\s+", " ", (top.get("text") or "")).strip()
        snippet = snippet[:320].rsplit(" ", 1)[0] if len(snippet) > 320 else snippet
        snippet = strip_verse_refs(snippet)
        text = (
            f"The supplied research passages do not fully establish a precise answer. "
            f"Related source wording: \"{snippet}\""
        )
    return {
        "claims": [{"text": text, "source_id": top["citation"]}],
        "insufficient_evidence": True,
        "abstention": True,
    }


def sanitize_structured_claims(data: dict) -> tuple[dict, list[str]]:
    """Apply non-inventive terminology repairs only.

    Numeric Bible refs are not auto-stripped into accepted answers — that previously
    allowed unsupported prophecy prose to pass after removing Psalm/Ezekiel numbers.
    Verse invention must fail validation and revise or abstain.
    """
    notes = []
    claims = []
    for claim in data.get("claims") or []:
        text = claim.get("text") or ""
        text, repairs = apply_term_repairs(text)
        notes.extend(repairs)
        if verse_refs_in(text):
            notes.append("contains_numeric_bible_refs")
        claims.append({**claim, "text": text})
    return {**data, "claims": claims}, notes


def grounded_metrics(answer: str | None, evidence, question: str, *, contract_passed: bool,
                     structured: dict | None = None, latency_seconds: float | None = None) -> dict:
    """Mechanical before/after metrics; human_* fields stay null until review."""
    cited = re.findall(r"\[B(\d+)\]", answer or "")
    allowed = {str(i) for i in range(1, len(evidence) + 1)}
    citation_precision = (
        sum(1 for c in cited if c in allowed) / len(cited) if cited else (1.0 if not evidence else 0.0)
    )
    unsupported = 0
    total_claims = 0
    by_id = evidence_map(evidence)
    if structured and structured.get("claims"):
        for claim in structured["claims"]:
            total_claims += 1
            passage = (by_id.get(claim.get("source_id")) or {}).get("text", "")
            ok, _ = claim_is_supported(claim.get("text", ""), passage)
            if not ok:
                unsupported += 1
    elif answer and evidence:
        # Fallback: treat each cited sentence as a claim.
        parts = re.split(r"(?<=\])\s*", answer.strip())
        for part in parts:
            m = re.search(r"\[B(\d+)\]\s*$", part.strip())
            if not m:
                continue
            total_claims += 1
            cid = f"B{m.group(1)}"
            text = part[: m.start()].strip()
            passage = (by_id.get(cid) or {}).get("text", "")
            ok, _ = claim_is_supported(text, passage)
            if not ok:
                unsupported += 1
    rate = (unsupported / total_claims) if total_claims else (0.0 if contract_passed else 1.0)
    ethiopic = len(re.findall(r"[\u1200-\u137f]", answer or ""))
    latin = len(re.findall(r"[A-Za-z]", answer or ""))
    expected = detect_response_language(question)
    return {
        "citation_precision": citation_precision,
        "unsupported_claim_rate": rate,
        "unsupported_claims": unsupported,
        "claim_count": total_claims,
        "contract_passed": contract_passed,
        "answer_relevance_proxy": None,  # requires human review
        "amharic_quality_proxy": None,  # requires human review
        "language_script_matches": (ethiopic > latin if expected == "am" else latin > ethiopic) if answer else False,
        "latency_seconds": latency_seconds,
        "paragraph_ids_present": citation_paragraphs_valid(evidence) if evidence else True,
        "human_theological_accuracy": None,
        "human_amharic_fluency": None,
        "human_citation_entailment": None,
        "human_answer_relevance": None,
    }


def human_review_checkpoint(question: str, answer: str | None, evidence, metrics: dict, *,
                            failure_class: str | None = None) -> dict:
    return {
        "question": question,
        "has_answer": bool(answer),
        "evidence_citations": [
            {"citation": e["citation"], "paragraph_ids": e.get("paragraph_ids"), "document_id": e.get("document_id")}
            for e in evidence
        ],
        "metrics_snapshot": {
            "citation_precision": metrics.get("citation_precision"),
            "unsupported_claim_rate": metrics.get("unsupported_claim_rate"),
            "contract_passed": metrics.get("contract_passed"),
            "latency_seconds": metrics.get("latency_seconds"),
        },
        "failure_class": failure_class,
        "checkpoints": {
            "theological_accuracy": {"status": "pending_human_review", "value": None},
            "amharic_fluency": {"status": "pending_human_review", "value": None},
            "citation_entailment": {"status": "pending_human_review", "value": None},
            "answer_relevance": {"status": "pending_human_review", "value": None},
        },
        "note": "Automated tests do not certify theological correctness or Amharic fluency.",
    }
