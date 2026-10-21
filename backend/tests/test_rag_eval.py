"""Isolated RAG evaluation harness tests (no production Qdrant / Search Buddy)."""

from __future__ import annotations

from pathlib import Path

import pytest

from editorial.paths import content_review_root
from rag_eval.corpus import corpus_stats, load_eval_corpus
from rag_eval.embedders import HashingNgramEmbedder, available_embedders, build_embedder
from rag_eval.gold_questions import GOLD_QUESTIONS
from rag_eval.index import build_in_memory_index
from rag_eval.metrics import score_retrieval
from rag_eval.runner import compare_embedders, run_retrieval_eval

PACKAGE = content_review_root()

pytestmark = pytest.mark.skipif(
    not (PACKAGE / "Catalog.json").is_file(),
    reason="content-review package not present",
)


def test_corpus_preserves_ids_and_unapproved_status():
    passages = load_eval_corpus()
    assert len(passages) > 1000
    stats = corpus_stats(passages)
    assert stats["approved_for_ingestion_true"] == 0
    assert stats["research_only"] is True
    assert stats["official_church_teaching_claims"] == 0
    sample = passages[0]
    assert sample.paragraph_id
    assert sample.document_id in {"F01", "S01", "E01", "M01", "W01"}
    assert sample.source_unit_ids is not None
    assert "am-source" in stats["languages"] or "en" in stats["languages"]


def test_hashing_embedder_handles_amharic_and_english():
    emb = HashingNgramEmbedder(dim=128)
    docs = emb.embed_documents(
        [
            "The Holy Trinity is one God in three Persons.",
            "ምሥጢረ ሥላሴ አንድ አምላክ ነው።",
        ]
    )
    queries = emb.embed_queries(
        ["Explain the Holy Trinity", "ምሥጢረ ሥላሴ ምንድን ነው?"]
    )
    assert docs.shape == (2, 128)
    assert queries.shape == (2, 128)
    # Cross-lingual soft signal: Amharic query closer to Amharic doc than English doc
    scores = queries @ docs.T
    assert float(scores[1, 1]) >= float(scores[1, 0]) - 1e-6


def test_retrieval_eval_runs_and_reports_metrics(tmp_path):
    # Use a capped corpus for speed while still exercising real package data.
    report = run_retrieval_eval(
        embedder_name="hashing-ngram-v1",
        max_passages=800,
        include_answer_eval=True,
        try_live_model=False,
        try_qdrant=False,
        out_dir=tmp_path,
    )
    assert report["public_search_buddy_bypass"] is False
    assert report["approval_flags_mutated"] is False
    assert report["corpus"]["approved_for_ingestion_true"] == 0
    ret = report["retrieval"]
    assert ret["substantive_count"] >= 10
    # Expect some usable signal on the real package with hashing embedder.
    assert ret["hit_at_5"] >= 0.2
    assert Path(report["report_path"]).is_file()
    # Answer eval present with research grounding fields
    assert report["answers"]
    assert "with_context" in report["answers"][0]


def test_gold_question_intents_cover_core_types():
    intents = {q.intent for q in GOLD_QUESTIONS}
    assert {"what", "why", "when", "who", "how"} <= intents
    assert any(q.language == "am" for q in GOLD_QUESTIONS)
    assert any(q.language == "en" for q in GOLD_QUESTIONS)


def test_compare_embedders_degrades_gracefully_without_torch(tmp_path):
    comparison = compare_embedders(
        ["hashing-ngram-v1", "multilingual-e5-small", "bge-m3"],
        max_passages=200,
        out_dir=tmp_path,
    )
    assert comparison["models"]["hashing-ngram-v1"]["available"] is True
    # Without torch, transformer models should be marked unavailable (not crash).
    avail = {row["name"]: row["available"] for row in available_embedders()}
    if not avail.get("bge-m3"):
        assert comparison["models"]["bge-m3"]["available"] is False


def test_build_embedder_unknown():
    with pytest.raises(ValueError):
        build_embedder("no-such-model")


def test_score_negative_control():
    passages = load_eval_corpus()
    emb = build_embedder("hashing-ngram-v1")
    index = build_in_memory_index(passages[:400], emb)
    gold = next(q for q in GOLD_QUESTIONS if q.qid == "en-distractor-dns")
    hits = index.search(emb.embed_queries([gold.question]), k=5)[0]
    metric = score_retrieval(gold, hits)
    assert metric.notes == "negative_control"
