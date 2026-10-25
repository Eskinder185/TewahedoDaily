"""Evaluate configured Church Library retrieval by language against reviewed gold queries.

Gold JSON format:
[{"query":"...", "language":"en|am|gez", "relevant_book_ids":["uuid"],
  "relevant_passage_ids":["uuid"]}]
No scores are fabricated: an empty or incomplete gold set is rejected.
"""
from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path

from editorial.church_library_store import ChurchLibraryStore


def evaluate(rows: list[dict], limit: int) -> dict:
    if not rows:
        raise ValueError("Gold query file is empty.")
    store = ChurchLibraryStore()
    by_language: dict[str, list[dict]] = defaultdict(list)
    details = []
    for item in rows:
        query = str(item.get("query") or "").strip()
        language = str(item.get("language") or "").strip()
        relevant_books = {str(value) for value in item.get("relevant_book_ids") or []}
        relevant_passages = {str(value) for value in item.get("relevant_passage_ids") or []}
        if not query or language not in {"en", "am", "gez"} or not (relevant_books or relevant_passages):
            raise ValueError("Every gold query needs query, supported language, and reviewed relevant IDs.")
        response = store.search(query, language, limit)
        hits = response["results"]
        ranks = [
            index for index, hit in enumerate(hits, start=1)
            if str(hit.get("book_id")) in relevant_books or str(hit.get("passage_id")) in relevant_passages
        ]
        metric = {"recall_at_k": 1.0 if ranks else 0.0, "reciprocal_rank": 1 / ranks[0] if ranks else 0.0}
        by_language[language].append(metric)
        details.append({"query": query, "language": language, "semantic_used": response["semantic_used"], "first_relevant_rank": ranks[0] if ranks else None})
    summary = {
        language: {
            "queries": len(metrics),
            "recall_at_k": sum(row["recall_at_k"] for row in metrics) / len(metrics),
            "mrr": sum(row["reciprocal_rank"] for row in metrics) / len(metrics),
        }
        for language, metrics in by_language.items()
    }
    return {"limit": limit, "by_language": summary, "details": details}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("gold", type=Path)
    parser.add_argument("--limit", type=int, default=10)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    report = evaluate(json.loads(args.gold.read_text(encoding="utf-8")), args.limit)
    rendered = json.dumps(report, ensure_ascii=False, indent=2)
    if args.output:
        args.output.write_text(rendered + "\n", encoding="utf-8")
    print(rendered)


if __name__ == "__main__":
    main()
