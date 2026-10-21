from __future__ import annotations

from dataclasses import asdict, dataclass
from typing import Iterable, Sequence

from .corpus import EvalPassage
from .gold_questions import GoldQuestion
from .index import SearchHit


@dataclass
class RetrievalMetrics:
    qid: str
    language: str
    intent: str
    hit_at_1: bool
    hit_at_5: bool
    mrr: float
    keyword_hit_at_5: bool
    top_document_ids: list[str]
    top_paragraph_ids: list[str]
    top_languages: list[str]
    notes: str = ""

    def as_dict(self) -> dict:
        return asdict(self)


def _doc_match(hit: SearchHit, gold: GoldQuestion) -> bool:
    if not gold.expected_document_ids:
        return False
    return hit.passage.document_id in gold.expected_document_ids


def _keyword_match(passage: EvalPassage, gold: GoldQuestion) -> bool:
    if not gold.expected_keywords_any:
        return False
    blob = f"{passage.text}\n{passage.text_en}\n{passage.amharic_source_text or ''}"
    return any(k in blob for k in gold.expected_keywords_any)


def score_retrieval(
    gold: GoldQuestion,
    hits: Sequence[SearchHit],
) -> RetrievalMetrics:
    # Negative control: success if no theological doc dominates unexpectedly —
    # we still report keyword/doc hits as false when expected_document_ids empty.
    if not gold.expected_document_ids and not gold.expected_keywords_any:
        # Prefer that top hit is not a strong keyword collision; always record ranks.
        return RetrievalMetrics(
            qid=gold.qid,
            language=gold.language,
            intent=gold.intent,
            hit_at_1=False,
            hit_at_5=False,
            mrr=0.0,
            keyword_hit_at_5=False,
            top_document_ids=[h.passage.document_id for h in hits[:5]],
            top_paragraph_ids=[h.passage.paragraph_id for h in hits[:5]],
            top_languages=[h.passage.language for h in hits[:5]],
            notes="negative_control",
        )

    mrr = 0.0
    hit1 = False
    hit5 = False
    key5 = False
    for h in hits:
        if _keyword_match(h.passage, gold) and h.rank <= 5:
            key5 = True
        if _doc_match(h, gold):
            if h.rank == 1:
                hit1 = True
            if h.rank <= 5:
                hit5 = True
            if mrr == 0.0:
                mrr = 1.0 / h.rank
    # If keywords match at rank 1 even without doc list, count soft hit.
    if not hit1 and hits and _keyword_match(hits[0].passage, gold):
        hit1 = True
        hit5 = True
        mrr = max(mrr, 1.0)
    elif not hit5 and key5:
        hit5 = True
        if mrr == 0.0:
            for h in hits:
                if _keyword_match(h.passage, gold):
                    mrr = 1.0 / h.rank
                    break

    return RetrievalMetrics(
        qid=gold.qid,
        language=gold.language,
        intent=gold.intent,
        hit_at_1=hit1,
        hit_at_5=hit5,
        mrr=mrr,
        keyword_hit_at_5=key5,
        top_document_ids=[h.passage.document_id for h in hits[:5]],
        top_paragraph_ids=[h.passage.paragraph_id for h in hits[:5]],
        top_languages=[h.passage.language for h in hits[:5]],
        notes=gold.notes,
    )


def aggregate(metrics: Iterable[RetrievalMetrics]) -> dict:
    rows = list(metrics)
    if not rows:
        return {"count": 0}
    substantive = [m for m in rows if m.notes != "negative_control"]
    neg = [m for m in rows if m.notes == "negative_control"]

    def avg(xs: list[float]) -> float:
        return sum(xs) / len(xs) if xs else 0.0

    return {
        "count": len(rows),
        "substantive_count": len(substantive),
        "hit_at_1": avg([float(m.hit_at_1) for m in substantive]),
        "hit_at_5": avg([float(m.hit_at_5) for m in substantive]),
        "mrr": avg([m.mrr for m in substantive]),
        "keyword_hit_at_5": avg([float(m.keyword_hit_at_5) for m in substantive]),
        "by_language": {
            lang: {
                "count": len([m for m in substantive if m.language == lang]),
                "hit_at_5": avg(
                    [float(m.hit_at_5) for m in substantive if m.language == lang]
                ),
                "mrr": avg([m.mrr for m in substantive if m.language == lang]),
            }
            for lang in sorted({m.language for m in substantive})
        },
        "negative_controls": len(neg),
        "per_question": [m.as_dict() for m in rows],
    }
