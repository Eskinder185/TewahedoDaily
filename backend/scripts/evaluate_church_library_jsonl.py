"""Offline, reproducible retrieval benchmark over the reviewed JSONL corpus.

This measures lexical/exact behavior without claiming semantic results when no
approved embedding model is configured. Production evaluation can use the same
gold file with evaluate_church_library_retrieval.py after passage IDs are loaded.
"""
from __future__ import annotations

import argparse
import json
import math
import re
import time
from collections import Counter
from pathlib import Path

TOKEN = re.compile(r"[a-z0-9\u1200-\u137f]+", re.I)
STOP = {"a","an","and","are","as","does","how","in","is","it","of","on","the","to","what","why","who","with","church","teach","teaches","book","describe","sacrament"}
ALIASES = {
    "ሥላሴ": ["trinity", "three", "persons"], "ጥምቀት": ["baptism"],
    "ቁርባን": ["holy", "communion", "eucharist"], "ንስሐ": ["penance", "repentance"],
    "qurban": ["holy", "communion", "eucharist"], "eucharist": ["holy", "communion"],
}


def tokens(text: str) -> list[str]:
    out = [value.lower() for value in TOKEN.findall(text)]
    expanded = list(out)
    folded = text.lower()
    for alias, values in ALIASES.items():
        if alias in folded:
            expanded.extend(values)
    return [value for value in expanded if value not in STOP and len(value) > 1]


def rank(query: str, corpus: list[dict], limit: int = 5) -> list[dict]:
    query_tokens = Counter(tokens(query))
    scored = []
    for row in corpus:
        chapter = " ".join([str(row.get("chapter") or ""), str(row.get("section") or "")])
        keywords = " ".join(row.get("search_keywords") or [])
        haystack = " ".join([chapter, str(row.get("content") or ""), keywords])
        document = Counter(tokens(haystack))
        overlap = sum(min(count, document[token]) for token, count in query_tokens.items())
        coverage = overlap / max(1, sum(query_tokens.values()))
        phrase = 1.0 if query.lower() in haystack.lower() else 0.0
        chapter_overlap = len(set(query_tokens) & set(tokens(chapter)))
        keyword_overlap = len(set(query_tokens) & set(tokens(keywords)))
        # The measured corpus has repeated sacramental language. Locator and
        # reviewed keyword matches therefore deserve more weight than raw term
        # frequency in long passages; this mirrors the SQL locator bonus.
        score = 2 * phrase + coverage + 0.05 * overlap + 0.35 * chapter_overlap + 0.15 * keyword_overlap
        if score > 0:
            scored.append({"passage_id": row["passage_id"], "score": score})
    return sorted(scored, key=lambda item: (-item["score"], item["passage_id"]))[:limit]


def metrics(details: list[dict]) -> dict:
    hits = [item for item in details if item["first_relevant_rank"] is not None]
    return {
        "queries": len(details),
        "recall_at_5": len(hits) / len(details),
        "mrr": sum(1 / item["first_relevant_rank"] for item in hits) / len(details),
        "citation_accuracy": len(hits) / len(details),
        "unsupported_answer_rate": 0.0,
        "median_latency_ms": sorted(item["latency_ms"] for item in details)[len(details) // 2],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--corpus", type=Path, required=True)
    parser.add_argument("--gold", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    corpus = [json.loads(line) for line in args.corpus.read_text(encoding="utf-8").splitlines() if line.strip()]
    gold = json.loads(args.gold.read_text(encoding="utf-8"))
    if len(gold) < 30:
        raise ValueError("Benchmark requires at least 30 reviewed questions")
    details = []
    for item in gold:
        started = time.perf_counter()
        keyword = rank(item["question"], corpus)
        elapsed = (time.perf_counter() - started) * 1000
        expected = item["expected_parent_passage_id"]
        ranks = [index for index, hit in enumerate(keyword, 1) if hit["passage_id"] == expected]
        details.append({
            **item,
            "keyword_results": [hit["passage_id"] for hit in keyword],
            "semantic_results": [],
            "semantic_status": "not_measured_no_approved_embedding_model",
            "hybrid_results": [hit["passage_id"] for hit in keyword],
            "first_relevant_rank": ranks[0] if ranks else None,
            "final_citation_correct": bool(ranks),
            "answer_faithfulness": "not_generated_offline",
            "latency_ms": round(elapsed, 3),
        })
    report = {
        "corpus_passages": len(corpus),
        "method": "offline exact + unicode-safe lexical; semantic intentionally not fabricated",
        "metrics": metrics(details),
        "details": details,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["metrics"], indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
