"""Offline + optional live Gemma before/after grounded-answer comparison.

Does not call production services, fine-tune, push, or deploy.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "app"))

from book_rag_research.answers import LocalGemma, current_system_prompt, grounded_generate, validate_grounded  # noqa: E402
from book_rag_research.benchmark import EXAMPLES, provisional_questions  # noqa: E402
from book_rag_research.grounding import (  # noqa: E402
    abstain_from_evidence,
    classify_failure,
    extractive_partial_answer,
    grounded_metrics,
    human_review_checkpoint,
    recover_supported_claims,
    sanitize_structured_claims,
)


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def parse_structured_from_attempts(record: dict) -> dict | None:
    for attempt in record.get("attempts") or []:
        raw = (attempt.get("raw") or {}).get("answer") or ""
        try:
            return json.loads(raw)
        except json.JSONDecodeError:
            continue
    return record.get("raw_structured_response")


def simulate_v3(record: dict) -> dict:
    """v3: validate → recover supported claims → extractive partial → abstain."""
    evidence = record.get("evidence") or []
    question = record["question"]
    if not evidence:
        answer = record.get("answer")
        metrics = grounded_metrics(answer, [], question, contract_passed=True,
                                   latency_seconds=record.get("seconds"))
        return {"answer": answer, "contract_passed": True, "contract": "identity_no_retrieval",
                "metrics": metrics, "human_review": human_review_checkpoint(question, answer, [], metrics),
                "attempts": [], "mode": "v3_identity", "abstained": False, "partial": False}

    attempts = []
    # 1) Prior accepted structured answer may still fail v3 risky-marker checks.
    if record.get("contract_passed") and record.get("raw_structured_response"):
        cleaned, notes = sanitize_structured_claims(record["raw_structured_response"])
        try:
            answer, support = validate_grounded(cleaned, evidence, question, require_support=True)
            metrics = grounded_metrics(answer, evidence, question, contract_passed=True,
                                       structured=cleaned, latency_seconds=record.get("seconds"))
            return {"answer": answer, "contract_passed": True, "contract": "source_bound_claims_v3",
                    "repair_notes": notes, "support_details": support, "metrics": metrics,
                    "human_review": human_review_checkpoint(question, answer, evidence, metrics),
                    "attempts": attempts, "mode": "v3_prior_structured_pass",
                    "abstained": False, "partial": False, "raw_structured_response": cleaned}
        except (ValueError, KeyError, TypeError) as exc:
            attempts.append({"rejection": str(exc), "failure_class": classify_failure(str(exc))})
            recovered = recover_supported_claims(record["raw_structured_response"], evidence, question)
            if recovered and recovered.get("claims"):
                try:
                    answer, support = validate_grounded(recovered, evidence, question, require_support=True)
                    metrics = grounded_metrics(answer, evidence, question, contract_passed=True,
                                               structured=recovered, latency_seconds=record.get("seconds"))
                    return {"answer": answer, "contract_passed": True, "contract": "source_bound_partial_v3",
                            "metrics": metrics, "support_details": support,
                            "dropped_claims": recovered.get("dropped_claims"),
                            "human_review": human_review_checkpoint(question, answer, evidence, metrics),
                            "attempts": attempts, "mode": "v3_recovered_prior",
                            "abstained": False, "partial": True, "raw_structured_response": recovered}
                except (ValueError, KeyError, TypeError) as exc2:
                    attempts.append({"rejection": str(exc2), "failure_class": classify_failure(str(exc2))})

    structured = parse_structured_from_attempts(record)
    if structured:
        recovered = recover_supported_claims(structured, evidence, question)
        if recovered and recovered.get("claims"):
            try:
                answer, support = validate_grounded(recovered, evidence, question, require_support=True)
                metrics = grounded_metrics(answer, evidence, question, contract_passed=True,
                                           structured=recovered, latency_seconds=record.get("seconds"))
                return {"answer": answer, "contract_passed": True, "contract": "source_bound_partial_v3",
                        "metrics": metrics, "support_details": support,
                        "dropped_claims": recovered.get("dropped_claims"),
                        "human_review": human_review_checkpoint(question, answer, evidence, metrics),
                        "attempts": attempts, "mode": "v3_recovered_attempt",
                        "abstained": False, "partial": True, "raw_structured_response": recovered}
            except (ValueError, KeyError, TypeError) as exc:
                attempts.append({"rejection": str(exc), "failure_class": classify_failure(str(exc))})

    fallback = extractive_partial_answer(question, evidence) or abstain_from_evidence(question, evidence)
    require = not fallback.get("abstention")
    answer, support = validate_grounded(fallback, evidence, question, require_support=require)
    metrics = grounded_metrics(answer, evidence, question, contract_passed=True,
                               structured=fallback, latency_seconds=record.get("seconds"))
    abstained = bool(fallback.get("abstention"))
    return {"answer": answer, "contract_passed": True,
            "contract": ("source_bound_abstention_v3" if abstained else "source_bound_extractive_v3"),
            "abstained": abstained, "partial": bool(fallback.get("partial")),
            "metrics": metrics, "support_details": support,
            "human_review": human_review_checkpoint(question, answer, evidence, metrics),
            "attempts": attempts, "mode": ("v3_abstention" if abstained else "v3_extractive"),
            "raw_structured_response": fallback}


def failure_taxonomy() -> list[dict]:
    return [
        {
            "case": "Why did Jesus choose to be baptized in the Jordan River?",
            "v2_cause": "unsupported_generation_invented_bible_refs → full abstention",
            "v3_fix": "recover/extractive partial from Jordan symbolism + baptism-reason passages; verses still rejected",
            "not_relaxed": "citation IDs, verse ban, risky-marker checks unchanged",
        },
        {
            "case": "ኢየሱስ ክርስቶስ ለምን ተጠመቀ?",
            "v2_cause": "model_terminology_amharic + low overlap after repair → abstention",
            "v3_fix": "term repair + recover supported claims or Amharic extractive quotes",
            "not_relaxed": "ሦስትነት still rejected; English still banned in Amharic answers",
        },
        {
            "case": "አምስቱ ምሥጢራት ምንድን ናቸው?",
            "v2_cause": "unsupported heaven wording → full abstention",
            "v3_fix": "drop unsupported resurrection claim; keep supported mysteries as partial",
            "not_relaxed": "risky heaven marker still blocked when absent from source",
        },
    ]


def examples_from_constrained(constrained_path: Path) -> list[dict]:
    """Rebuild hit lists from saved constrained runs when *.examples.json is absent."""
    data = load_json(constrained_path)
    out = []
    for record in data.get("records") or []:
        hits = []
        for e in record.get("evidence") or []:
            hits.append({
                "id": e.get("citation"),
                "score": 1.0,
                "payload": {
                    "book_title": e.get("book") or e.get("document_id"),
                    "document_id": e.get("document_id"),
                    "section_title": e.get("section") or e.get("section_id"),
                    "section_id": e.get("section_id"),
                    "paragraph_ids": e.get("paragraph_ids") or [],
                    "language": e.get("language") or "en",
                    "content_kind": e.get("kind") or "english_reading",
                    "text": e.get("text") or "",
                    "editorial_status": e.get("status") or "UNAPPROVED RESEARCH MATERIAL",
                },
            })
        out.append({"question": record["question"], "hits": hits})
    return out


def try_live_gemma(examples: list[dict], out_path: Path) -> dict:
    try:
        provider = LocalGemma()
        provider.info()
    except Exception as exc:
        return {"live_gemma_available": False, "error": str(exc)}
    prompt = current_system_prompt(ROOT / "app" / "main.py")
    records = []
    try:
        for example in examples:
            hits = example.get("hits") or []
            result = grounded_generate(provider, example["question"], prompt, hits)
            records.append({
                "question": example["question"],
                "answer": result.get("answer"),
                "contract": result.get("contract"),
                "contract_passed": result.get("contract_passed"),
                "partial": result.get("partial"),
                "abstained": result.get("abstained"),
                "seconds": result.get("seconds") or result.get("wall_seconds"),
                "metrics": result.get("metrics"),
            })
            out_path.write_text(json.dumps({"records": records, "live": True}, ensure_ascii=False, indent=2),
                                encoding="utf-8")
    finally:
        provider.unload()
    return {"live_gemma_available": True, "n": len(records), "path": str(out_path)}


def expanded_eval_skeleton() -> dict:
    """Provisional expanded set — human_reviewed remains false until gold review."""
    cases = provisional_questions()
    return {
        "n": len(cases),
        "human_reviewed_count": sum(1 for c in cases if c.get("human_reviewed")),
        "label_status": "provisional_agent_source_linked",
        "note": "Not a substitute for human-reviewed entailment/fluency labels.",
        "example_topics": sorted({c["topic"] for c in cases}),
        "core_examples": EXAMPLES,
    }


def main():
    artifacts = Path(
        r"C:\Users\eskew\Documents\Codex\2026-10-18\tewahedodaily-five-book-integration-the-five"
        r"\outputs\rag-evaluation"
    )
    constrained = artifacts / "gemma_constrained_answers.json"
    if not constrained.exists():
        raise SystemExit(f"Missing artifacts at {constrained}")
    before = load_json(constrained)
    docs = ROOT / "docs" / "book-rag-research"
    out_dir = docs / "grounded_v3"
    out_dir.mkdir(parents=True, exist_ok=True)

    comparisons = []
    checkpoints = []
    for record in before["records"]:
        after = simulate_v3(record)
        b_metrics = grounded_metrics(
            record.get("answer"),
            record.get("evidence") or [],
            record["question"],
            contract_passed=bool(record.get("contract_passed")),
            structured=record.get("raw_structured_response"),
            latency_seconds=record.get("seconds"),
        )
        if not record.get("contract_passed") and record.get("attempts"):
            b_metrics["unsupported_claim_rate"] = 1.0
            b_metrics["citation_precision"] = 0.0
        # v2 abstention baseline from prior report modes
        comparisons.append({
            "question": record["question"],
            "before_v1": {
                "answer": record.get("answer"),
                "contract_passed": record.get("contract_passed"),
                "metrics": b_metrics,
                "seconds": record.get("seconds"),
            },
            "after_v3": {
                "answer": after.get("answer"),
                "contract_passed": after.get("contract_passed"),
                "contract": after.get("contract"),
                "abstained": after.get("abstained", False),
                "partial": after.get("partial", False),
                "mode": after.get("mode"),
                "metrics": after["metrics"],
            },
            "evidence": [
                {"citation": e["citation"], "document_id": e.get("document_id"),
                 "paragraph_ids": e.get("paragraph_ids")}
                for e in (record.get("evidence") or [])
            ],
        })
        checkpoints.append(after["human_review"])

    summary = {
        "n": len(comparisons),
        "v1_contract_pass_rate": sum(1 for c in comparisons if c["before_v1"]["contract_passed"]) / len(comparisons),
        "v3_contract_pass_rate": sum(1 for c in comparisons if c["after_v3"]["contract_passed"]) / len(comparisons),
        "v1_mean_unsupported_claim_rate": sum(c["before_v1"]["metrics"]["unsupported_claim_rate"] for c in comparisons) / len(comparisons),
        "v3_mean_unsupported_claim_rate": sum(c["after_v3"]["metrics"]["unsupported_claim_rate"] for c in comparisons) / len(comparisons),
        "v1_mean_citation_precision": sum(c["before_v1"]["metrics"]["citation_precision"] for c in comparisons) / len(comparisons),
        "v3_mean_citation_precision": sum(c["after_v3"]["metrics"]["citation_precision"] for c in comparisons) / len(comparisons),
        "v3_abstention_count": sum(1 for c in comparisons if c["after_v3"].get("abstained")),
        "v3_partial_count": sum(1 for c in comparisons if c["after_v3"].get("partial")),
        "expanded_eval": expanded_eval_skeleton(),
        "failure_taxonomy": failure_taxonomy(),
        "official_theology_verified": False,
    }

    examples_path = artifacts / "e5_small_q8.examples.json"
    if examples_path.exists():
        examples = load_json(examples_path)
    else:
        examples = examples_from_constrained(constrained)
    live = try_live_gemma(examples, out_dir / "live_gemma_v3.json")
    summary["live_gemma"] = live
    summary["live_examples_source"] = str(examples_path) if examples_path.exists() else "rebuilt_from_constrained_evidence"

    payload = {"summary": summary, "comparisons": comparisons, "human_review_checkpoints": checkpoints,
               "research_only": True,
               "model_settings": {"temperature": 0, "seed": 42, "num_predict": 640, "num_ctx": 6144}}
    (out_dir / "before_after.json").write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    (docs / "HUMAN_REVIEW_CHECKPOINTS.json").write_text(
        json.dumps({"checkpoints": checkpoints, "expanded": summary["expanded_eval"],
                    "note": "All theological/fluency fields pending human review."},
                   ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    lines = [
        "# Grounded answer v3 — partial answers over unnecessary abstention",
        "",
        "UNAPPROVED PRIVATE RESEARCH — not verified theology.",
        "Citation validation was not relaxed to raise pass rates.",
        "",
        "## Abstention root causes (v2) and v3 response",
        "",
    ]
    for row in failure_taxonomy():
        lines += [f"### {row['case']}", f"- v2: {row['v2_cause']}", f"- v3: {row['v3_fix']}",
                  f"- Guardrails: {row['not_relaxed']}", ""]
    lines += [
        "## Mechanical metrics (same six questions / evidence / recorded settings)",
        "",
        "| Metric | v1 contract | v3 |",
        "| --- | --- | --- |",
        f"| Contract pass rate | {summary['v1_contract_pass_rate']:.2f} | {summary['v3_contract_pass_rate']:.2f} |",
        f"| Mean unsupported-claim rate | {summary['v1_mean_unsupported_claim_rate']:.2f} | {summary['v3_mean_unsupported_claim_rate']:.2f} |",
        f"| Mean citation precision | {summary['v1_mean_citation_precision']:.2f} | {summary['v3_mean_citation_precision']:.2f} |",
        f"| Full abstentions | (v2 had 3) | {summary['v3_abstention_count']} |",
        f"| Partial answers | — | {summary['v3_partial_count']} |",
        "",
        f"Live Gemma: `{summary['live_gemma']}`",
        "",
        f"Expanded provisional questions: {summary['expanded_eval']['n']} "
        f"(human_reviewed={summary['expanded_eval']['human_reviewed_count']}).",
        "",
        "## Before / after answers",
        "",
    ]
    for i, c in enumerate(comparisons, 1):
        lines += [f"## {i}. {c['question']}", "", "### Before (v1)", ""]
        if c["before_v1"]["answer"]:
            lines += [c["before_v1"]["answer"], ""]
        else:
            lines += ["REJECTED — no answer released by the contract.", ""]
        lines += [
            f"Mechanical contract passed: {c['before_v1']['contract_passed']}.",
            "",
            "### After (v3)",
            "",
            c["after_v3"]["answer"] or "REJECTED",
            "",
            f"Contract: `{c['after_v3']['contract']}` mode={c['after_v3'].get('mode')} "
            f"partial={c['after_v3'].get('partial')} abstained={c['after_v3'].get('abstained')}.",
            f"Unsupported-claim rate: {c['after_v3']['metrics']['unsupported_claim_rate']:.2f}. "
            f"Citation precision: {c['after_v3']['metrics']['citation_precision']:.2f}.",
            "",
        ]
    lines += [
        "## Remaining blockers",
        "",
        "- Human review still required for theological accuracy, Amharic fluency, and entailment.",
        "- Expanded set is provisional (`human_reviewed=false`); not gold labels.",
        "- F01 has no Amharic edition — Amharic Five Mysteries remain cross-script / partial.",
        "- Live Gemma may still invent verse refs; v3 recovers partials rather than releasing them.",
        "- No production Qdrant, publish, push, or approval-flag changes.",
        "",
    ]
    (docs / "GROUNDED_ANSWER_V3_REPORT.md").write_text("\n".join(lines), encoding="utf-8")
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    print("Wrote", docs / "GROUNDED_ANSWER_V3_REPORT.md")


if __name__ == "__main__":
    main()
