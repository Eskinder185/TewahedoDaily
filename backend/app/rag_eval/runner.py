"""Orchestrate isolated RAG evaluation runs."""

from __future__ import annotations

import json
import time
from dataclasses import asdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Optional, Sequence

from .answer_eval import (
    build_prompt,
    judge_answer,
    simulate_grounded_answer,
    try_live_completion,
)
from .corpus import corpus_stats, load_eval_corpus
from .embedders import available_embedders, build_embedder
from .gold_questions import GOLD_QUESTIONS, GoldQuestion
from .index import build_in_memory_index, try_qdrant_upsert_sample
from .metrics import aggregate, score_retrieval


def run_retrieval_eval(
    *,
    embedder_name: str = "hashing-ngram-v1",
    top_k: int = 5,
    max_passages: Optional[int] = None,
    questions: Optional[Sequence[GoldQuestion]] = None,
    include_answer_eval: bool = True,
    try_live_model: bool = False,
    try_qdrant: bool = True,
    out_dir: Optional[Path] = None,
) -> dict[str, Any]:
    started = time.monotonic()
    passages = load_eval_corpus()
    if max_passages is not None:
        passages = passages[: max(0, max_passages)]
    stats = corpus_stats(passages)

    embedder = build_embedder(embedder_name)
    index = build_in_memory_index(passages, embedder)
    gold = list(questions or GOLD_QUESTIONS)

    queries = [q.question for q in gold]
    q_vecs = embedder.embed_queries(queries)
    all_hits = index.search(q_vecs, k=top_k)

    metrics = []
    answer_rows = []
    for q, hits in zip(gold, all_hits):
        metrics.append(score_retrieval(q, hits))
        if include_answer_eval:
            # Baseline without context
            bare = simulate_grounded_answer(q, [])
            # With retrieval (simulated grounded answer using top hits)
            grounded = simulate_grounded_answer(q, hits)
            bare_j = judge_answer(q, bare, hits, with_context=False)
            with_j = judge_answer(q, grounded, hits, with_context=True)
            live_before = live_after = None
            if try_live_model:
                live_before = try_live_completion(
                    build_prompt(q, hits, with_context=False)
                )
                live_after = try_live_completion(
                    build_prompt(q, hits, with_context=True)
                )
                if live_before.get("answer"):
                    bare_j = judge_answer(
                        q, live_before["answer"], hits, with_context=False
                    )
                if live_after.get("answer"):
                    with_j = judge_answer(
                        q, live_after["answer"], hits, with_context=True
                    )
            answer_rows.append(
                {
                    "qid": q.qid,
                    "intent": q.intent,
                    "language": q.language,
                    "without_context": bare_j.as_dict(),
                    "with_context": with_j.as_dict(),
                    "live_without_context": live_before,
                    "live_with_context": live_after,
                    "top_refs": [
                        {
                            "document_id": h.passage.document_id,
                            "paragraph_id": h.passage.paragraph_id,
                            "language": h.passage.language,
                            "approved_for_ingestion": h.passage.approved_for_ingestion,
                            "score": h.score,
                        }
                        for h in hits[:3]
                    ],
                }
            )

    qdrant_info = {"attempted": False}
    if try_qdrant and passages:
        qdrant_info = try_qdrant_upsert_sample(
            passages, index.vectors, limit=min(32, len(passages))
        )

    summary = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "research_disclaimer": (
            "Unapproved editorial drafts used only in isolated evaluation. "
            "Not official Church teaching. Not wired to public Search Buddy."
        ),
        "embedder": embedder.name,
        "index_backend": index.backend,
        "elapsed_seconds": round(time.monotonic() - started, 3),
        "corpus": stats,
        "embedders_available": available_embedders(),
        "retrieval": aggregate(metrics),
        "answers": answer_rows,
        "qdrant_local_sample": qdrant_info,
        "public_search_buddy_bypass": False,
        "approval_flags_mutated": False,
    }

    if out_dir is not None:
        out_dir = Path(out_dir)
        out_dir.mkdir(parents=True, exist_ok=True)
        path = out_dir / f"rag_eval_{embedder.name.replace('/', '_')}.json"
        path.write_text(
            json.dumps(summary, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        summary["report_path"] = str(path)
    return summary


def compare_embedders(
    names: Sequence[str],
    *,
    max_passages: Optional[int] = None,
    out_dir: Optional[Path] = None,
) -> dict[str, Any]:
    results = {}
    for name in names:
        try:
            results[name] = run_retrieval_eval(
                embedder_name=name,
                max_passages=max_passages,
                include_answer_eval=True,
                try_live_model=False,
                try_qdrant=False,
                out_dir=out_dir,
            )
        except ImportError as exc:
            results[name] = {
                "embedder": name,
                "available": False,
                "error": str(exc),
            }
    comparison = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "models": {
            name: {
                "available": "retrieval" in payload,
                "hit_at_5": (payload.get("retrieval") or {}).get("hit_at_5"),
                "mrr": (payload.get("retrieval") or {}).get("mrr"),
                "by_language": (payload.get("retrieval") or {}).get("by_language"),
                "error": payload.get("error"),
            }
            for name, payload in results.items()
        },
        "notes": (
            "hashing-ngram-v1 is the always-on multilingual baseline. "
            "multilingual-e5-small is the existing project approach. "
            "bge-m3 is the practical alternative when torch is installed."
        ),
    }
    if out_dir is not None:
        out_dir = Path(out_dir)
        out_dir.mkdir(parents=True, exist_ok=True)
        path = out_dir / "embedder_comparison.json"
        path.write_text(
            json.dumps(comparison, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        comparison["report_path"] = str(path)
    return comparison
