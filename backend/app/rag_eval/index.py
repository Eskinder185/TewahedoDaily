from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Optional, Sequence

import numpy as np

from .corpus import EvalPassage
from .embedders import Embedder, cosine_topk


@dataclass
class SearchHit:
    passage: EvalPassage
    score: float
    rank: int


class InMemoryVectorIndex:
    """Isolated in-process index (default when local Qdrant is unavailable)."""

    def __init__(self, passages: Sequence[EvalPassage], vectors: np.ndarray, *, name: str):
        if len(passages) != vectors.shape[0]:
            raise ValueError("passage/vector length mismatch")
        self.passages = list(passages)
        self.vectors = vectors
        self.name = name
        self.backend = "in_memory"

    def search(self, query_vecs: np.ndarray, k: int = 5) -> list[list[SearchHit]]:
        scores, indices = cosine_topk(query_vecs, self.vectors, k)
        results: list[list[SearchHit]] = []
        for qi in range(query_vecs.shape[0]):
            row: list[SearchHit] = []
            for rank, (score, idx) in enumerate(
                zip(scores[qi].tolist(), indices[qi].tolist()), start=1
            ):
                row.append(
                    SearchHit(
                        passage=self.passages[int(idx)],
                        score=float(score),
                        rank=rank,
                    )
                )
            results.append(row)
        return results


def build_in_memory_index(
    passages: Sequence[EvalPassage],
    embedder: Embedder,
    *,
    batch_size: int = 64,
) -> InMemoryVectorIndex:
    texts = [p.text for p in passages]
    chunks: list[np.ndarray] = []
    for start in range(0, len(texts), batch_size):
        chunks.append(embedder.embed_documents(texts[start : start + batch_size]))
    vectors = np.concatenate(chunks, axis=0) if chunks else np.zeros((0, embedder.dim))
    return InMemoryVectorIndex(passages, vectors, name=embedder.name)


def try_qdrant_upsert_sample(
    passages: Sequence[EvalPassage],
    vectors: np.ndarray,
    *,
    collection: str = "tewahedo_editorial_books_local_rag_eval",
    url: str = "http://127.0.0.1:6333",
    limit: int = 32,
) -> dict[str, Any]:
    """Best-effort local Qdrant smoke upsert of a small sample. Never production."""
    from editorial.qdrant_local import LocalQdrantSink, validate_collection

    validate_collection(collection)
    sample_n = min(limit, len(passages), vectors.shape[0])
    if sample_n == 0:
        return {"attempted": False, "reason": "empty corpus"}
    try:
        sink = LocalQdrantSink(url)
    except Exception as exc:  # noqa: BLE001
        return {"attempted": False, "reason": f"sink_init: {exc}"}
    points = []
    for i in range(sample_n):
        p = passages[i]
        # Qdrant point ids must be uuid or unsigned int for some versions;
        # use stable hash int.
        pid = abs(hash(p.point_id)) % (2**63)
        points.append(
            {
                "id": pid,
                "vector": vectors[i].astype(float).tolist(),
                "payload": {
                    **p.payload(),
                    "eval_point_id": p.point_id,
                    "batch_id": "rag_eval_sample",
                },
            }
        )
    try:
        # Ensure collection exists via REST
        import httpx

        dim = int(vectors.shape[1])
        with httpx.Client(base_url=url.rstrip("/"), timeout=10.0, trust_env=False) as http:
            # recreate lightweight
            http.put(
                f"/collections/{collection}",
                json={"vectors": {"size": dim, "distance": "Cosine"}},
            )
        sink.upsert(collection_name=collection, points=points)
        sink.close()
        return {
            "attempted": True,
            "upserted": sample_n,
            "collection": collection,
            "url": url,
            "production": False,
        }
    except Exception as exc:  # noqa: BLE001
        sink.close()
        return {"attempted": True, "upserted": 0, "error": str(exc), "production": False}
