"""Research isolation plus optional real-content Qdrant integration tests."""
from __future__ import annotations

from copy import deepcopy
import json
import os
from pathlib import Path

import numpy as np
import pytest
from fastapi.testclient import TestClient

from book_rag_research.answers import automated_answer_checks,messages,validate_grounded,LocalGemma,grounded_generate
from book_rag_research.benchmark import provisional_questions
from book_rag_research.grounding import (
    abstain_from_evidence,claim_is_supported,classify_failure,extractive_partial_answer,
    grounded_metrics,human_review_checkpoint,recover_supported_claims,
    sanitize_structured_claims,strip_verse_refs,
)
from book_rag_research.index import ResearchIndex
from book_rag_research.retrieval import metrics,expand_query


def test_research_has_no_public_route():
    import main
    client=TestClient(main.app)
    assert client.get("/api/rag-eval/search?q=baptism").status_code==404
    assert all("book_rag_research" not in getattr(r.endpoint,"__module__","") for r in main.app.routes)


def test_benchmark_does_not_fabricate_human_review():
    cases=provisional_questions()
    assert len(cases)==43
    assert all(q["human_reviewed"] is False and q["reviewer"] is None for q in cases)
    assert {q["query_language"]+q["target_language"] for q in cases}>={"enen","amam","amen","enam"}


def test_prompt_language_and_draft_status_are_explicit():
    from book_rag_research.corpus import RESEARCH
    # This uses actual corpus below for live integration; no synthetic quality assertion.
    result,evidence=messages("ሰላም፣ ስምህ ማን ነው?","base",[])
    assert any("Amharic" in m["content"] for m in result)
    assert evidence==[]
    checks=automated_answer_checks("Unsupported [B99]",[],"Who are you?")
    assert checks["citation_ids_valid"] is False
    assert checks["human_hallucination_rate"] is None


def test_expansion_keeps_the_question_text():
    query="Why is ማይሮን used?"
    assert expand_query(query).startswith(query)
    assert "myron" in expand_query(query)


@pytest.fixture
def real_data():
    folder=os.getenv("RAG_EVAL_ARTIFACTS")
    if not folder:pytest.skip("Set RAG_EVAL_ARTIFACTS for actual corpus/vector integration tests")
    folder=Path(folder)
    rows=[json.loads(x) for x in (folder/"corpus.jsonl").read_text(encoding="utf-8").splitlines()]
    vectors=np.load(folder/"e5_small_q8.npy")
    chosen=[0,1]+[i for i,c in enumerate(rows) if c["language"]=="am"][:2]
    return [rows[i] for i in chosen],vectors[chosen]


def test_real_qdrant_persistence_dedup_and_complete_cleanup(tmp_path,real_data):
    pytest.importorskip("qdrant_client")
    chunks,vectors=real_data
    index=ResearchIndex(tmp_path/"private-index")
    name="tewahedo_research_unapproved_test"
    try:
        first=index.build(name,chunks,vectors,corpus_sha256="test",model={"real_model":"e5-small-q8","load_seconds":.1})
        second=index.build(name,chunks,vectors,corpus_sha256="test",model={"real_model":"e5-small-q8","load_seconds":.5})
        assert first["after_count"]==second["after_count"]==len(chunks)
    finally:index.close()
    reopened=ResearchIndex(tmp_path/"private-index")
    try:
        assert reopened.validate(name,chunks,vectors)["verified_points"]==len(chunks)
        hit=reopened.search(name,vectors[2],language="am",limit=1)[0]
        assert hit["payload"]["language"]=="am"
        assert hit["payload"]["approved_for_ingestion"] is False
        assert reopened.cleanup(name)["removed"]
        assert reopened.cleanup(name)["removed"]
    finally:reopened.close()


def test_research_index_rejects_production_names_and_corrupt_approval(tmp_path,real_data):
    pytest.importorskip("qdrant_client")
    chunks,vectors=real_data
    index=ResearchIndex(tmp_path/"private-index")
    try:
        with pytest.raises(ValueError):index.build("production",chunks,vectors,corpus_sha256="x",model={})
        changed=deepcopy(chunks);changed[0]["approved_for_ingestion"]=True
        with pytest.raises(ValueError,match="Unsafe"):index.build("tewahedo_research_unapproved_test",changed,vectors,corpus_sha256="x",model={})
        with pytest.raises(ValueError):index.cleanup("production")
        corrupted=vectors.copy();corrupted[0,0]=float('nan')
        with pytest.raises(ValueError):index.build("tewahedo_research_unapproved_test",chunks,corrupted,corpus_sha256="x",model={})
    finally:index.close()


def test_index_refuses_unknown_storage_and_urls(tmp_path):
    pytest.importorskip("qdrant_client")
    with pytest.raises(ValueError):ResearchIndex(Path("http://production:6333"))
    folder=tmp_path/"existing";folder.mkdir();(folder/"important.txt").write_text("preserve")
    with pytest.raises(ValueError):ResearchIndex(folder)
    assert (folder/"important.txt").read_text()=="preserve"


def test_recall_and_mrr_have_exact_denominators(real_data):
    chunks,_=real_data
    gold=chunks[0]["paragraph_ids"][0]
    result=metrics([{"payload":chunks[0]}],[gold])
    assert result["recall_at_5"]==result["mrr_at_10"]==1
    assert metrics([], [gold])["recall_at_5"]==0


@pytest.mark.parametrize("text,source,question",[
    ("A claim", "B99", "Why?"),
    ("See Judges 19:18", "B1", "Why?"),
    ("See Matthew 3፥13", "B1", "Why?"),
    ("እምነት (faith)", "B1", "ምንድን ነው?"),
    ("ሦስትነት", "B1", "ሥላሴ ምንድን ነው?"),
])
def test_grounded_answer_rejects_unbound_claims(text,source,question):
    data={"claims":[{"text":text,"source_id":source}],"insufficient_evidence":False}
    evidence=[{"citation":"B1","paragraph_ids":["P1"],"text":"Jordan baptism humility example debt"}]
    with pytest.raises(ValueError):validate_grounded(data,evidence,question)


def test_source_bound_rendering_uses_the_validated_id():
    data={"claims":[{"text":"The supplied draft does not establish an exact clock time.","source_id":"B1"}],
          "insufficient_evidence":True}
    evidence=[{"citation":"B1","paragraph_ids":["P1"],"text":"No clock time is given for the baptism."}]
    answer,_=validate_grounded(data,evidence,"At what time?")
    assert answer.endswith("[B1]")


def test_local_generator_refuses_production_gateway():
    with pytest.raises(ValueError):LocalGemma("https://gateway.eskinder.dev")


def test_real_corpus_has_no_duplicate_text_or_false_approval(real_data):
    folder=Path(os.environ["RAG_EVAL_ARTIFACTS"])
    rows=[json.loads(x) for x in (folder/"corpus.jsonl").read_text(encoding="utf-8").splitlines()]
    stats=json.loads((folder/"corpus_stats.json").read_text())
    assert len(rows)==stats["chunks"]==1627
    assert len({(r["language"],r["content_kind"],r["text_sha256"]) for r in rows})==len(rows)
    assert len({p for r in rows for p in r["paragraph_ids"]})==3003
    seen={}
    for r in rows:
        assert r["approved_for_ingestion"] is False and r["research_only"] is True
        for span in r["spans"]:
            assert r["text"][span["chunk_start"]:span["chunk_end"]]==span["text"]
            seen.setdefault(span["variant_id"],[]).append((span["start"],span["end"]))
    for parts in seen.values():
        parts.sort()
        assert parts[0][0]==0
        assert all(a[1]==b[0] for a,b in zip(parts,parts[1:]))


def test_mysteries_overview_retrieves_all_five_real_reference_sections(real_data):
    from book_rag_research.retrieval import select_evidence
    folder=Path(os.environ["RAG_EVAL_ARTIFACTS"])
    rows=[json.loads(x) for x in (folder/"corpus.jsonl").read_text(encoding="utf-8").splitlines()]
    hits=select_evidence("What are the Five Mysteries?",[],rows)
    assert len(hits)==5
    assert {h["payload"]["section_id"] for h in hits}=={f"F01W-S{i:02}" for i in range(2,7)}
    assert all(h["payload"] in rows and h["payload"]["approved_for_ingestion"] is False for h in hits)
    assert "three" in hits[0]["payload"]["text"].lower()


def test_sanitize_repairs_trinity_term_but_keeps_verse_refs_for_rejection():
    data={"claims":[{"text":"He fulfilled Psalm 113:3 and revealed የሦስትነት mystery","source_id":"B1"}],
          "insufficient_evidence":False}
    cleaned,notes=sanitize_structured_claims(data)
    assert "113:3" in cleaned["claims"][0]["text"] or "113" in cleaned["claims"][0]["text"]
    assert "ሥላሴ" in cleaned["claims"][0]["text"]
    assert "contains_numeric_bible_refs" in notes


def test_claim_support_rejects_heaven_wording_absent_from_source():
    ok,_=claim_is_supported(
        "በትንሣኤ ቀን በሰማይ ያሉትን ወደ ሕይወት ይነሳሉ።",
        "all who are in the tombs will hear His voice and come forth to the resurrection of life or judgment",
    )
    assert ok is False
    ok2,_=claim_is_supported(
        "Those in the tombs will hear His voice and come forth.",
        "all who are in the tombs will hear His voice and come forth to the resurrection of life or judgment",
    )
    assert ok2 is True
    ok3,_=claim_is_supported(
        "invisible heavenly blessings and eternal life",
        "partaking of the visible bread and wine",
    )
    assert ok3 is False


def test_classify_failure_maps_known_gemma_patterns():
    assert classify_failure("No verified Bible database verses were supplied") == "unsupported_generation_invented_bible_refs"
    assert classify_failure("Use the established Trinity term ሥላሴ") == "model_terminology_amharic"


def test_abstention_prefers_extractive_partial_without_inventing_verses():
    evidence=[{"citation":"B1","paragraph_ids":["S01-P0145"],
               "text":"The Jordan has one source above, but farther down it divides around an island. They meet again where Christ was baptized."}]
    data=abstain_from_evidence("Why did Jesus choose to be baptized in the Jordan River?",evidence)
    assert data["insufficient_evidence"] is True
    assert data.get("abstention") is not True  # extractive partial preferred
    assert "Psalm" not in data["claims"][0]["text"]
    assert "Jordan" in data["claims"][0]["text"]
    answer,_=validate_grounded(data,evidence,"Why did Jesus choose to be baptized in the Jordan River?",require_support=True)
    assert "[B1]" in answer


def test_recover_keeps_supported_claims_and_drops_heaven_and_verses():
    evidence=[
        {"citation":"B1","paragraph_ids":["P1"],"text":"The Mystery of the Trinity is the eternal unity of Father, Son, and Holy Spirit."},
        {"citation":"B5","paragraph_ids":["P5"],"text":"all who are in the tombs will hear His voice and come forth to life or judgment"},
    ]
    data={"claims":[
        {"text":"The Mystery of the Trinity is the eternal unity of Father, Son, and Holy Spirit.","source_id":"B1"},
        {"text":"በሰማይ ያሉትን ሁሉ ያነሳል።","source_id":"B5"},
        {"text":"He fulfilled Psalm 113:3 in the Jordan.","source_id":"B1"},
    ],"insufficient_evidence":False}
    recovered=recover_supported_claims(data,evidence,"What are the Five Mysteries?")
    assert recovered is not None
    assert len(recovered["claims"])==1
    assert recovered["claims"][0]["source_id"]=="B1"
    assert recovered["partial"] is True
    assert all(d["reason"]!="stripped_claim_still_unsupported" for d in recovered["dropped_claims"])
    assert any(d["reason"]=="numeric_bible_ref_in_claim" for d in recovered["dropped_claims"])
    assert any(d["reason"]=="risky_marker_absent_from_source" for d in recovered["dropped_claims"])


def test_grounded_generate_returns_extractive_partial_after_verse_invention():
    class Fake:
        model="gemma4:12b"
        def generate(self,msgs,schema=None):
            return {"answer":json.dumps({
                "claims":[{"text":"He fulfilled Psalm 113:3 in the Jordan.","source_id":"B1"}],
                "insufficient_evidence":False}),
                "seconds":0.01,"model":self.model}
    hits=[{"id":"1","score":1,"payload":{
        "book_title":"S","document_id":"S01","section_title":"s","section_id":"S01-S02",
        "paragraph_ids":["S01-P0145"],"language":"en","content_kind":"english_reading",
        "text":"The Jordan has one source above and reunites below where Christ was baptized to unite Israel and the Gentiles.",
        "editorial_status":"draft"}}]
    result=grounded_generate(Fake(),"Why Jordan?", "You are a research assistant.", hits)
    assert result["contract_passed"] is True
    assert result.get("abstained") is not True
    assert result.get("partial") is True
    assert "Psalm" not in (result["answer"] or "")
    assert "113" not in (result["answer"] or "")
    assert "Jordan" in (result["answer"] or "")
    assert result["metrics"]["human_theological_accuracy"] is None
    assert result["human_review"]["checkpoints"]["theological_accuracy"]["status"]=="pending_human_review"


def test_extractive_partial_skips_english_for_amharic_questions():
    evidence=[{"citation":"B1","paragraph_ids":["P1"],
               "text":"The Mystery of Baptism involves being born of water and the Spirit."}]
    assert extractive_partial_answer("አምስቱ ምሥጢራት ምንድን ናቸው?", evidence) is None



def test_human_review_checkpoint_fields_remain_null():
    metrics=grounded_metrics("Answer [B1]",[{"citation":"B1","paragraph_ids":["P1"],"text":"Answer text here"}],
                             "Why?",contract_passed=True,latency_seconds=1.2)
    review=human_review_checkpoint("Why?","Answer [B1]",[{"citation":"B1","paragraph_ids":["P1"]}],metrics)
    assert metrics["human_theological_accuracy"] is None
    assert metrics["amharic_quality_proxy"] is None
    assert review["checkpoints"]["amharic_fluency"]["value"] is None


def test_strip_verse_refs_preserves_prose():
    assert "Jordan" in strip_verse_refs("baptized in the Jordan (Psalm 113:3) for humility")
    assert "113" not in strip_verse_refs("baptized in the Jordan (Psalm 113:3) for humility")
