"""Embedding backends for private RAG eval.

Always-available: multilingual character n-gram hashing (works for Ethiopic).
Optional: intfloat/multilingual-e5-small and BAAI/bge-m3 when torch+transformers
are installed.
"""

from __future__ import annotations

import hashlib
import math
import re
from dataclasses import dataclass
from typing import Protocol, Sequence

import numpy as np

_TOKEN = re.compile(r"[\w\u1200-\u137F]+", re.UNICODE)


class Embedder(Protocol):
    name: str
    dim: int

    def embed_documents(self, texts: Sequence[str]) -> np.ndarray: ...

    def embed_queries(self, texts: Sequence[str]) -> np.ndarray: ...


def _l2_normalize(mat: np.ndarray) -> np.ndarray:
    norms = np.linalg.norm(mat, axis=1, keepdims=True)
    norms = np.maximum(norms, 1e-12)
    return mat / norms


@dataclass
class HashingNgramEmbedder:
    """Practical multilingual baseline without GPU/torch.

    Character n-grams cover Ethiopic script; hashed into a fixed dim.
    """

    name: str = "hashing-ngram-v1"
    dim: int = 384
    ngram_min: int = 2
    ngram_max: int = 4

    def _vector(self, text: str, *, prefix: str) -> np.ndarray:
        blob = f"{prefix}{(text or '').lower()}"
        vec = np.zeros(self.dim, dtype=np.float32)
        # Word tokens
        for tok in _TOKEN.findall(blob):
            h = int(hashlib.blake2b(tok.encode("utf-8"), digest_size=8).hexdigest(), 16)
            vec[h % self.dim] += 1.0
        # Char n-grams
        compact = re.sub(r"\s+", " ", blob)
        for n in range(self.ngram_min, self.ngram_max + 1):
            for i in range(max(0, len(compact) - n + 1)):
                gram = compact[i : i + n]
                h = int(
                    hashlib.blake2b(gram.encode("utf-8"), digest_size=8).hexdigest(), 16
                )
                vec[h % self.dim] += 1.0 / n
        return vec

    def embed_documents(self, texts: Sequence[str]) -> np.ndarray:
        mat = np.stack([self._vector(t, prefix="passage:") for t in texts], axis=0)
        return _l2_normalize(mat)

    def embed_queries(self, texts: Sequence[str]) -> np.ndarray:
        mat = np.stack([self._vector(t, prefix="query:") for t in texts], axis=0)
        return _l2_normalize(mat)


@dataclass
class TorchTransformerEmbedder:
    """Optional E5 / BGE-M3 wrapper. Raises ImportError if deps missing."""

    model_id: str
    name: str
    dim: int
    query_prefix: str = ""
    doc_prefix: str = ""
    max_length: int = 512
    pooling: str = "cls"  # cls | mean

    def __post_init__(self) -> None:
        import torch
        from transformers import AutoModel, AutoTokenizer

        self._torch = torch
        self._tokenizer = AutoTokenizer.from_pretrained(self.model_id)
        self._model = AutoModel.from_pretrained(self.model_id)
        self._model.eval()

    def _pool(self, output, attention_mask):
        torch = self._torch
        if self.pooling == "cls":
            return output.last_hidden_state[:, 0]
        mask = attention_mask.unsqueeze(-1)
        summed = (output.last_hidden_state * mask).sum(dim=1)
        counts = mask.sum(dim=1).clamp(min=1)
        return summed / counts

    def _embed(self, texts: Sequence[str], prefix: str) -> np.ndarray:
        torch = self._torch
        prepared = [f"{prefix}{t}" if prefix else t for t in texts]
        inputs = self._tokenizer(
            prepared,
            padding=True,
            truncation=True,
            max_length=self.max_length,
            return_tensors="pt",
        )
        with torch.inference_mode():
            output = self._model(**inputs)
            vectors = self._pool(output, inputs["attention_mask"])
            vectors = torch.nn.functional.normalize(vectors, p=2, dim=1)
        return vectors.cpu().numpy().astype(np.float32)

    def embed_documents(self, texts: Sequence[str]) -> np.ndarray:
        return self._embed(texts, self.doc_prefix)

    def embed_queries(self, texts: Sequence[str]) -> np.ndarray:
        return self._embed(texts, self.query_prefix)


def available_embedders() -> list[dict]:
    """Describe embedders and whether heavy models can load."""
    rows = [
        {
            "name": "hashing-ngram-v1",
            "kind": "baseline_multilingual",
            "available": True,
            "notes": "Always-on Ethiopic-capable hashing n-grams",
        },
        {
            "name": "multilingual-e5-small",
            "kind": "transformer",
            "model_id": "intfloat/multilingual-e5-small",
            "available": False,
            "notes": "Existing project approach (test_embeddings.py)",
        },
        {
            "name": "bge-m3",
            "kind": "transformer",
            "model_id": "BAAI/bge-m3",
            "available": False,
            "notes": "Practical multilingual alternative (test_bge_m3.py)",
        },
    ]
    try:
        import torch  # noqa: F401
        import transformers  # noqa: F401

        for row in rows:
            if row["kind"] == "transformer":
                row["available"] = True
    except ImportError:
        pass
    return rows


def build_embedder(name: str) -> Embedder:
    if name in {"hashing-ngram-v1", "hashing", "baseline"}:
        return HashingNgramEmbedder()
    if name in {"multilingual-e5-small", "e5-small", "e5"}:
        return TorchTransformerEmbedder(
            model_id="intfloat/multilingual-e5-small",
            name="multilingual-e5-small",
            dim=384,
            query_prefix="query: ",
            doc_prefix="passage: ",
            pooling="mean",
        )
    if name in {"bge-m3", "bge"}:
        return TorchTransformerEmbedder(
            model_id="BAAI/bge-m3",
            name="bge-m3",
            dim=1024,
            query_prefix="",
            doc_prefix="",
            pooling="cls",
        )
    raise ValueError(f"Unknown embedder: {name}")


def cosine_topk(
    query_vecs: np.ndarray, doc_vecs: np.ndarray, k: int
) -> tuple[np.ndarray, np.ndarray]:
    """Return (scores[q,k], indices[q,k]) for L2-normalized matrices."""
    scores = query_vecs @ doc_vecs.T
    k = max(1, min(k, doc_vecs.shape[0]))
    idx = np.argpartition(-scores, kth=k - 1, axis=1)[:, :k]
    # sort each row
    row_scores = np.take_along_axis(scores, idx, axis=1)
    order = np.argsort(-row_scores, axis=1)
    sorted_idx = np.take_along_axis(idx, order, axis=1)
    sorted_scores = np.take_along_axis(row_scores, order, axis=1)
    return sorted_scores, sorted_idx
