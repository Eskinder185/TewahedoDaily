#!/usr/bin/env python3
"""Isolated bilingual retrieval evaluation — no production Qdrant, no Search Buddy.

Uses only a tiny synthetic corpus (permitted test data). Optionally confirms
that the real editorial package still yields zero Search Buddy retrieval hits.

Run from repo root:
  python scripts/eval_bilingual_retrieval_local.py
"""

from __future__ import annotations

import math
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "app"))

# Synthetic only — not from unapproved book package body for vector upsert.
SYNTHETIC = [
    {
        "id": "syn-en-1",
        "lang": "en",
        "kind": "english_reading",
        "text": "The mystery of the Holy Trinity is one God in three Persons.",
    },
    {
        "id": "syn-am-1",
        "lang": "am",
        "kind": "original_source",
        "text": "ምሥጢረ ሥላሴ አንድ አምላክ በሦስት አካላት ነው።",
    },
    {
        "id": "syn-en-2",
        "lang": "en",
        "kind": "english_reading",
        "text": "Baptism in the Jordan fulfills righteousness according to the Gospel.",
    },
    {
        "id": "syn-am-2",
        "lang": "am",
        "kind": "original_source",
        "text": "ጥምቀት በዮርዳኖስ ጸድቅን ይፈጽማል።",
    },
    {
        "id": "syn-sup-1",
        "lang": "en",
        "kind": "reference_supplement",
        "text": "Editorial note: this sentence is an added explanation, not source text.",
    },
]

_TOKEN = re.compile(r"[\w\u1200-\u137F]+", re.UNICODE)


def tokens(text: str) -> Counter[str]:
    return Counter(t.lower() for t in _TOKEN.findall(text or ""))


def cosine(a: Counter[str], b: Counter[str]) -> float:
    if not a or not b:
        return 0.0
    keys = set(a) | set(b)
    dot = sum(a[k] * b[k] for k in keys)
    na = math.sqrt(sum(v * v for v in a.values()))
    nb = math.sqrt(sum(v * v for v in b.values()))
    if na == 0 or nb == 0:
        return 0.0
    return dot / (na * nb)


def char_ngrams(text: str, n: int = 3) -> Counter[str]:
    t = re.sub(r"\s+", " ", (text or "").lower())
    if len(t) < n:
        return Counter([t] if t else [])
    return Counter(t[i : i + n] for i in range(len(t) - n + 1))


def rank(query: str, *, kind: str | None = None, limit: int = 3):
    q_tok = tokens(query)
    q_ng = char_ngrams(query)
    scored = []
    for row in SYNTHETIC:
        if kind and row["kind"] != kind:
            continue
        score = 0.6 * cosine(q_tok, tokens(row["text"])) + 0.4 * cosine(
            q_ng, char_ngrams(row["text"])
        )
        if score > 0:
            scored.append((score, row))
    scored.sort(key=lambda x: (-x[0], x[1]["id"]))
    return scored[:limit]


def main() -> int:
    if hasattr(sys.stdout, "reconfigure"):
        try:
            sys.stdout.reconfigure(encoding="utf-8")
        except Exception:
            pass
    print("=== Isolated bilingual retrieval eval (synthetic only) ===")
    cases = [
        ("Trinity Persons", None, "syn-en-1"),
        ("ሥላሴ", None, "syn-am-1"),
        ("Jordan baptism", None, "syn-en-2"),
        ("ዮርዳኖስ", None, "syn-am-2"),
        ("added explanation", "reference_supplement", "syn-sup-1"),
    ]
    failures = []
    for query, kind, expect in cases:
        hits = rank(query, kind=kind)
        top = hits[0][1]["id"] if hits else None
        ok = top == expect
        print(f"  q={query!r} kind={kind} -> {top} (expect {expect}) {'OK' if ok else 'FAIL'}")
        if not ok:
            failures.append(query)

    # Cross-language: Ethiopic query should prefer Amharic source row, not English.
    am_hits = rank("ጥምቀት")
    if not am_hits or am_hits[0][1]["lang"] != "am":
        failures.append("cross-lang-am")
        print("  cross-lang Amharic preference FAIL")
    else:
        print("  cross-lang Amharic preference OK")

    # Real package: Search Buddy retrieval must stay empty (no public leak).
    package = ROOT / "content-review" / "Catalog.json"
    if package.is_file():
        from editorial.catalog import load_catalog
        from editorial.retrieval import retrieve_for_search_buddy
        from editorial.retrieval_diagnostics import diagnose_package_retrieval

        catalog = load_catalog(str(package.parent))
        leaked = retrieve_for_search_buddy(catalog, "Trinity baptism sacrament", limit=10)
        if leaked:
            failures.append("search-buddy-leak")
            print(f"  Search Buddy leak FAIL ({len(leaked)} hits)")
        else:
            print("  Search Buddy retrieval empty on real package OK")
        diag = diagnose_package_retrieval(catalog)
        print(
            "  diagnosis:",
            diag["empty_public_retrieval_cause"],
            "approved_true=",
            diag["approved_for_ingestion_true"],
            "private_en=",
            diag["private_lexical_english_hits"],
            "private_am=",
            diag["private_lexical_amharic_hits"],
        )
        if diag["empty_public_retrieval_cause"] != "approval_filter":
            failures.append("unexpected-empty-cause")
        if diag["private_lexical_english_hits"] < 1 or diag["private_lexical_amharic_hits"] < 1:
            failures.append("private-lexical-index")
    else:
        print("  (content-review absent — skip package leak check)")

    print("production_qdrant_touched=False")
    print("upsert_performed=False")
    if failures:
        print("FAILED:", failures)
        return 1
    print("PASSED")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
