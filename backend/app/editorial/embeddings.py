"""Optional multilingual embeddings for Church Library hybrid retrieval.

Embedding generation is opt-in. Ethiopic text remains lexical-only until an
administrator explicitly records that the configured model passed the local
English/Amharic evaluation suite.
"""
from __future__ import annotations

import os
from functools import lru_cache


EXPECTED_DIMENSION = 384


def configured_model() -> str | None:
    value = (os.getenv("CHURCH_LIBRARY_EMBEDDING_MODEL") or "").strip()
    return value or None


def multilingual_approved() -> bool:
    return (os.getenv("CHURCH_LIBRARY_EMBEDDING_MULTILINGUAL_APPROVED") or "").strip().lower() in {"1", "true", "yes"}


@lru_cache(maxsize=1)
def _load_model():
    model_name = configured_model()
    if not model_name:
        return None
    try:
        import torch
        from transformers import AutoModel, AutoTokenizer
    except ImportError as exc:
        raise RuntimeError("Configured embeddings require torch and transformers.") from exc
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModel.from_pretrained(model_name)
    model.eval()
    return tokenizer, model, torch


def encode(texts: list[str], *, contains_ethiopic: bool = False) -> list[list[float]] | None:
    if not texts or not configured_model():
        return None
    if contains_ethiopic and not multilingual_approved():
        return None
    loaded = _load_model()
    if loaded is None:
        return None
    tokenizer, model, torch = loaded
    vectors: list[list[float]] = []
    with torch.no_grad():
        for start in range(0, len(texts), 16):
            batch = texts[start:start + 16]
            encoded = tokenizer(batch, padding=True, truncation=True, max_length=256, return_tensors="pt")
            output = model(**encoded).last_hidden_state
            mask = encoded["attention_mask"].unsqueeze(-1).expand(output.size()).float()
            pooled = (output * mask).sum(1) / mask.sum(1).clamp(min=1e-9)
            pooled = torch.nn.functional.normalize(pooled, p=2, dim=1)
            if pooled.shape[1] != EXPECTED_DIMENSION:
                raise RuntimeError(f"Embedding model dimension {pooled.shape[1]} does not match database dimension {EXPECTED_DIMENSION}.")
            vectors.extend(pooled.cpu().tolist())
    return vectors
