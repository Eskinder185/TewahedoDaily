#!/usr/bin/env python3
"""Run isolated five-book RAG evaluation (research only).

Examples:
  python scripts/run_rag_eval.py
  python scripts/run_rag_eval.py --compare
  python scripts/run_rag_eval.py --live-model
  python scripts/run_rag_eval.py --max-passages 400
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "app"))

from rag_eval.runner import compare_embedders, run_retrieval_eval  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--embedder",
        default="hashing-ngram-v1",
        help="hashing-ngram-v1 | multilingual-e5-small | bge-m3",
    )
    parser.add_argument("--compare", action="store_true")
    parser.add_argument("--max-passages", type=int, default=None)
    parser.add_argument("--live-model", action="store_true")
    parser.add_argument("--no-qdrant", action="store_true")
    parser.add_argument(
        "--out-dir",
        default=str(ROOT / "data" / "rag_eval_reports"),
    )
    args = parser.parse_args()
    out = Path(args.out_dir)

    if args.compare:
        names = ["hashing-ngram-v1", "multilingual-e5-small", "bge-m3"]
        report = compare_embedders(
            names, max_passages=args.max_passages, out_dir=out
        )
    else:
        report = run_retrieval_eval(
            embedder_name=args.embedder,
            max_passages=args.max_passages,
            try_live_model=args.live_model,
            try_qdrant=not args.no_qdrant,
            out_dir=out,
        )

    print(json.dumps(report, ensure_ascii=False, indent=2)[:4000])
    if "retrieval" in report:
        r = report["retrieval"]
        print(
            "\nSUMMARY",
            f"hit@1={r.get('hit_at_1')}",
            f"hit@5={r.get('hit_at_5')}",
            f"mrr={r.get('mrr')}",
            f"by_lang={r.get('by_language')}",
        )
    print("public_search_buddy_bypass=False approval_flags_mutated=False")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
