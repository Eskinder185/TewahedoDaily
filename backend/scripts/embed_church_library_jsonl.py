"""Generate a reviewed companion embedding JSONL for Church Library import.

The source JSONL is read-only. Output contains only stable passage IDs, model
name, and 384-dimensional vectors. Use the same CHURCH_LIBRARY_EMBEDDING_MODEL
for ingestion and query embedding.
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "app"))

from editorial.embeddings import EXPECTED_DIMENSION, configured_model, encode  # noqa: E402


def natural_chunks(row: dict, max_chars: int) -> list[dict]:
    text = str(row.get("content") or "")
    source_id = str(row.get("passage_id") or "")
    if not source_id or not text:
        raise ValueError("Every source row needs passage_id and content")
    if len(text) <= max_chars:
        return [{**row, "source_passage_id": source_id}]
    blocks = text.split("\n\n")
    chunks: list[str] = []
    current = ""
    for block in blocks:
        candidate = block if not current else current + "\n\n" + block
        if current and len(candidate) > max_chars:
            chunks.append(current)
            current = block
        else:
            current = candidate
    if current:
        chunks.append(current)
    return [
        {**row, "source_passage_id": f"{source_id}#{index:02d}", "content": chunk}
        for index, chunk in enumerate(chunks, start=1)
    ]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--max-chars", type=int, default=2400)
    args = parser.parse_args()
    model = configured_model()
    if not model:
        raise SystemExit("CHURCH_LIBRARY_EMBEDDING_MODEL is required")
    source = [json.loads(line) for line in args.input.read_text(encoding="utf-8").splitlines() if line.strip()]
    rows = [chunk for row in source for chunk in natural_chunks(row, args.max_chars)]
    vectors = encode([str(row["content"]) for row in rows], contains_ethiopic=any(
        any("\u1200" <= char <= "\u137f" for char in str(row["content"])) for row in rows
    ))
    if not vectors or len(vectors) != len(rows):
        raise SystemExit("Embedding generation is unavailable for the configured model/language")
    with args.output.open("w", encoding="utf-8", newline="\n") as handle:
        for row, vector in zip(rows, vectors, strict=True):
            if len(vector) != EXPECTED_DIMENSION:
                raise RuntimeError("Unexpected embedding dimension")
            handle.write(json.dumps({
                "passage_id": row["source_passage_id"],
                "embedding_model": model,
                "embedding": vector,
            }, ensure_ascii=False) + "\n")
    print(f"Wrote {len(rows)} embeddings using {model} to {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
