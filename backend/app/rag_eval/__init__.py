"""Isolated RAG evaluation for editorial five-book drafts.

Private research only. Unapproved drafts must never be treated as official
Church teaching or wired into public Search Buddy.
"""

from .corpus import EvalPassage, load_eval_corpus
from .metrics import RetrievalMetrics, score_retrieval

__all__ = [
    "EvalPassage",
    "load_eval_corpus",
    "RetrievalMetrics",
    "score_retrieval",
]
