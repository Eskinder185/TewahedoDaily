"""Render measured private research reports; never invent missing human ratings."""
from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path
import shutil
import statistics


def load(p):return json.loads(p.read_text(encoding="utf-8"))
def save(p,value):p.write_text(json.dumps(value,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
def table(headers,rows):
    return "| "+" | ".join(headers)+" |\n| "+" | ".join("---" for _ in headers)+" |\n"+"\n".join("| "+" | ".join(str(x) for x in row)+" |" for row in rows)+"\n"


def build(run,docs,outputs,test_count):
    docs.mkdir(parents=True,exist_ok=True);outputs.mkdir(parents=True,exist_ok=True)
    stats=load(run/"corpus_stats.json")
    reports={m:load(run/(m+".retrieval.json")) for m in ("e5_small_q8","e5_base_q8")}
    raw=load(run/"gemma_answers.json");final=load(run/"gemma_constrained_answers.json")
    prior=load(run/"gemma_constrained_answers.v1.json")
    versions=load(run/"runtime_versions.json")
    questions=load(run/"questions.json")
    chunks=[json.loads(x) for x in (run/"corpus.jsonl").read_text(encoding="utf-8").splitlines()]
    summary=[]
    for model,report in reports.items():
        for row in report["summary"]:summary.append({"model":model,**row})
    with (outputs/"RETRIEVAL_METRICS.csv").open("w",encoding="utf-8",newline="") as f:
        writer=csv.DictWriter(f,fieldnames=list(summary[0]));writer.writeheader();writer.writerows(summary)
    overall=[]
    for model,r in reports.items():
        for method in ("bm25","dense","hybrid","aligned_hybrid"):
            rows=[q for q in r["questions"] if q["method"]==method]
            overall.append([model,method,f"{statistics.mean(q['recall_at_5'] for q in rows):.1%}",
                f"{statistics.mean(q['mrr_at_10'] for q in rows):.3f}",
                f"{1000*statistics.median(q['retrieval_seconds'] for q in rows):.1f}"])
    model_rows=[]
    for model,r in reports.items():
        meta=r["model"]
        model_rows.append([model,meta["dimension"],f"{meta['file_bytes']/1e6:.1f}",f"{meta['embed_seconds']:.1f}",
            f"{meta['peak_process_rss_bytes']/2**20:.1f}",f"{r['query_peak_process_rss_bytes']/2**20:.1f}",
            f"{r['query_embedding_median_ms']:.1f}"])
    direction=[]
    for d in ("en_to_en","am_to_am","am_to_en","en_to_am","mixed_to_en"):
        rows=[]
        for model in reports:
            r=next(x for x in reports[model]["summary"] if x["method"]=="aligned_hybrid" and x["direction"]==d)
            rows.extend([f"{r['recall_at_5']:.1%}",f"{r['mrr_at_10']:.3f}"])
        n=next(x["n"] for x in reports["e5_small_q8"]["summary"] if x["direction"]==d)
        direction.append([d,n,*rows])
    accepted=sum(r["contract_passed"] for r in final["records"])
    baseline=[r for r in raw["records"] if r["mode"]=="before_no_book_evidence"]
    after=[r for r in raw["records"] if r["mode"]=="after_research_rag"]
    evidence_rows=[r for r in after if r.get("evidence")]
    cited=sum(r["checks"]["has_citations_when_evidence"] for r in evidence_rows)
    calls_v1=sum(1+len(r.get("attempts",[])) if r["contract_passed"] else len(r["attempts"]) for r in prior["records"])
    calls_v2=sum(1+len(r.get("attempts",[])) if r["contract_passed"] else len(r["attempts"]) for r in final["records"] if r.get("iteration")=="definition_routing_v2")
    comparisons=[
        ["Baptism clock time","Baseline and raw RAG both declined to invent a clock time.","Structured answer retained abstention and cited the age/type discussion; no verified Bible database was available."],
        ["Why the Jordan?","Raw RAG added actual Andemta humility/prophecy/typology material and book citations.","Contract blocked two attempts containing numeric verse references without verified Bible records. Source relevance and generation policy are separate issues."],
        ["Five Mysteries (English)","Raw RAG omitted all requested book citations and called the collection foundational sacraments.","Definition-bearing F01 routing plus structured claims produced all five source IDs and the one-God/three-Persons wording. This remains an unapproved draft-based answer."],
        ["Amharic greeting/identity","Both modes responded mainly in Amharic; retrieval correctly remained empty.","Identity does not need theological retrieval. Naturalness still requires fluent review."],
        ["Amharic baptism why","Baseline emitted the unsupplied reference መጽሐፈ መሳፍንት 19:18; raw RAG became source-specific but used ሦስትነት.","Both constrained attempts retained the unwanted term and were blocked. A validator success must not be fabricated."],
        ["Five Mysteries (Amharic)","Raw RAG emitted English glosses despite language instructions.","Final structured output removed glosses and bound five IDs, but introduced wording about those in heaven that its cited resurrection passage does not support. Mechanical pass, semantic quality failure requiring expert review."],
    ]
    report=f"""# TewahedoDaily — private real-book RAG evaluation

2026-10-19. **UNAPPROVED RESEARCH MATERIAL. No public Search Buddy connection or theological certification.**

Implemented and tested a real-content private RAG environment. The public approval
gate remains closed. Retrieval improves substantially over lexical matching on a
provisional development set; generation still fails important Amharic and source
entailment checks. This is an evaluated research prototype, not a production-ready
or officially approved theological system.

## 1. Original architecture and weaknesses

The checked-out public FastAPI chat path has no book embeddings/Qdrant retrieval.
It uses structured routes, Supabase Scripture lookups, a small topic map and a
static theology/language prompt, then calls LiteLLM model alias `home-ai`.
Existing E5/BGE scripts use tiny synthetic passages. Prompt instructions alone
cannot supply missing book evidence. Free-form citation/terminology compliance
is not enforced by the current generation path. See `ARCHITECTURE_AUDIT.md`.

The production alias-to-model mapping was not inspected remotely. This local
checkout had no gateway secret files or configured Supabase environment variables.
Neither production service was contacted. Existing body/rate/concurrency/error,
debug-route and authentication protections remain unchanged.

## 2. Actual book data processed

{table(['Book','Contextual chunks'],stats['by_book'].items())}

Total: **{stats['chunks']:,} chunks**, covering **{stats['reading_paragraphs']:,} reading
records** and **{stats['indexed_variants']:,} real selected variants**. There are
{stats['by_language']['en']} English and {stats['by_language']['am']} Amharic-source
chunks. Exact original/translation/supplement distinctions, IDs, book/section
relations, confidence definitions, uncertain spans and review/revision metadata
are attached to text spans. All selected variant text reconstructs exactly;
there is no overlap or identical chunk-body duplication within language/kind.

The 501 F01 original-English variants are retained as provenance rather than
indexed a second time alongside the edited reading. All 3,398 source records,
blank-layout evidence and reference materials remain in the unchanged package.
Matthew covers only the supplied introduction/chapters 1–5. No missing theology,
chapters, translation repairs or source approvals were invented.

The tokenizer packs 256-token bodies within book/section/language/kind boundaries.
It splits long text by exact character offsets and adds labeled context only to
embedding input. Inference caps at 384 tokens and rejects excess instead of
silently truncating. Corpus fingerprint: `{stats['corpus_sha256']}`.

## 3. Real embedding comparisons

{table(['Quantized CPU model','Dimension','ONNX MB','Corpus embedding seconds','Embedding peak process RSS MiB','Query-run peak RSS MiB','Median query embedding ms'],model_rows)}

These are real local CPU runs over all chunks, with four threads and masked mean
pooling/L2 normalization. Prefixes follow the [E5 model instructions](https://huggingface.co/intfloat/multilingual-e5-small).
The exact [small](https://huggingface.co/Xenova/multilingual-e5-small) and
[base](https://huggingface.co/Xenova/multilingual-e5-base) ONNX conversion revisions,
weight hashes and runtime versions are in the JSON artifacts. They do not measure
the original float PyTorch models or a production embedding service. BGE-M3 was
inspected as a repository experiment but not downloaded/evaluated in this run.

RSS is sampled every 100 ms; these are sampled maxima, not operating-system
absolute peaks. It includes corpus/runtime/index allocations, not just model weights. Desktop
workload and initial model warm-up affected timings; the first generation request
was a 97-second outlier. Embedding times are observed runs, not controlled capacity
benchmarks. The final retrieval evaluation was repeated after local generation
was unloaded. No production model was replaced.

## 4. Real Qdrant index validation

Two separate persistent [Qdrant local-mode](https://github.com/qdrant/qdrant-client#local-mode)
collections each contain 1,627 points (3,254 model-specific points total):

- `tewahedo_research_unapproved_e5_small_q8_{stats['corpus_sha256'][:12]}` — 384 dimensions.
- `tewahedo_research_unapproved_e5_base_q8_{stats['corpus_sha256'][:12]}` — 768 dimensions.

Every stored payload, source text/Unicode, ID, vector dimension and unapproved flag
matches the prepared corpus. Every indexed vector is finite and matches the
measured embedding array. Re-upsert leaves counts unchanged. Each model's two-point
cleanup rehearsal passed; regression tests reopen persisted real-content data and
remove the owned collection. These are actual local collections, not mock vectors.
They do not validate a remote/distributed Qdrant server.

Only path-based local storage is accepted; there is no production URL, API key,
public endpoint or startup ingestion. Every point is labeled research-only,
unapproved and ineligible for public retrieval. Complete owned-index cleanup is
implemented and documented in `RUNBOOK.md`. The two research collections remain
available locally for developer evaluation; temporary probe collections are gone.

## 5. Retrieval measurements

There are **43 cases across 25 unique question texts**, including English→English,
Amharic→Amharic, both cross-language directions, mixed terminology, transliterations
and a Matthew reference. All five books are represented. Faith and Order is the
user-designated comparison reference. **Zero relevance judgments were falsely
marked human-reviewed.** The source-linked labels are provisional agent judgments.

Recall@5 is the fraction of listed relevant paragraph IDs found in the first five
chunks, averaged across cases. MRR@10 is reciprocal rank of the first chunk with
a listed relevant ID. These are narrow anchor-coverage measurements, not complete
judgments of all relevant passages or source truth. Multi-paragraph chunks and
correlated language variants make the development set easier than independent
held-out evaluation. Missing alternative relevant IDs can also under-score a hit.

{table(['Model','Method','Macro Recall@5','MRR@10','Median retrieval ms'],overall)}

BM25 is the real-corpus lexical baseline. Hybrid fuses dense and lexical ranks with
an explicit bilingual terminology glossary. Alignment follows exact paragraph
links into the requested language and does not generate translations. Alignment
is applied only across languages; same-language ranking retains ordinary hybrid.

{table(['Direction','Cases','E5-small aligned R@5','E5-small MRR@10','E5-base aligned R@5','E5-base MRR@10'],direction)}

On this set, E5-small aligned hybrid is the better private prototype choice:
79.4% macro anchor Recall@5 versus 67.8% for E5-base. English→Amharic improves from
63.5% small dense to 96.8% with exact alignment. Amharic→English remains only 53.6%
anchor recall; F01 lacks an Amharic edition, so source alignment alone cannot bridge
every question into the reference text. This is not a claim of universal model
superiority or 79.4% answer accuracy. Human-reviewed held-out evaluation is required
before any production model/index decision.

## 6. Before/after actual answer comparisons

{table(['Requested case','Observed raw before/after result','Final research finding'],comparisons)}

All 12 raw comparisons completed using the real local model. Language-script checks
passed 6/6 before and 6/6 after, but script matching is not fluency. Raw RAG answers
included {sum(r['checks']['book_citation_count'] for r in after)} valid book-ID
occurrences; {cited}/{len(evidence_rows)} evidence-bearing answers cited a source.
The other evidence-bearing answer omitted citations. An ID existing in evidence
does not establish that the cited passage entails the claim.

The final structured contract accepted **{accepted}/6 logical examples** and blocked
**{6-accepted}/6** after retry. It constrains supplied source IDs, unwanted English
glosses and observed invalid terminology/unsupplied verse patterns; it never
rewrites source text. English Five Mysteries source selection was improved from
generic section openings to definition-bearing passages and retested on the model.
Both those final English/Amharic retests passed the mechanical contract, yet the
Amharic result still added unsupported heaven wording. Thus contract acceptance
must not be presented as semantic approval or fluency certification.

Full texts, evidence maps, rejected attempts and the prior iteration are preserved
in `ANSWER_COMPARISONS.md` and the private JSON artifacts. Human answer relevance,
citation entailment, Amharic quality and hallucination-rate fields are **null**,
not zero or fabricated scores. The package's 828 unresolved issues and five book
sign-offs remain open. Source faithfulness and theological correctness are distinct.

## 7. Actual Gemma 4 results and runtime

Model: `{raw['model_info']['name']}`, reported **{raw['model_info']['details']['parameter_size']}**,
**{raw['model_info']['details']['quantization_level']}**, local Ollama 0.40.5 on an
RTX 4070 SUPER (12 GiB VRAM), host RAM approximately 15.7 GiB. Digest:
`{raw['model_info']['digest']}`.

Generation used temperature 0, seed 42, thinking disabled, context 6,144 and up to
640 output tokens. Median raw response latency was
{statistics.median(r['seconds'] for r in baseline):.2f}s before and
{statistics.median(r['seconds'] for r in after):.2f}s after. The cold/contention
outlier prevents interpreting the mean as a RAG speedup. The initial 12 comparisons,
{calls_v1} constrained-v1 calls including retries, and {calls_v2} targeted final
definition-routing calls are all recorded. A single warm-up call is not a quality
sample. Prompt revisions and new evidence are combined interventions; this is not
a controlled attribution of every answer change solely to the embedding model.

The temporary loopback Ollama processes were unloaded/stopped. No model was
downloaded for generation and no production LiteLLM credentials were read/changed.
No production Gemma/LiteLLM result is claimed. Runtime versions: `{versions}`.

## 8. Tests, remaining blockers and recommended work

The full backend/security/research suite passes **{test_count} tests**, including actual
persisted Qdrant data, finite-vector checks, Unicode, unchanged approval gates,
public-route isolation, safe cleanup, source-bound citation rendering and rejection
of invalid references/terminology. All seven read-only package audit groups pass;
the original DOCX/source/reference hashes and package ZIP still match. Unit tests
do not prove live model quality; the separate model results above expose failures.

The staged snapshot passed 134 tests; the full current repository passed 153,
including separately preserved local RAG/CMS work. This task adds 18 research
test cases and does not overwrite the other `app/rag_eval` experiment.

Remaining blockers: qualified human gold/answer review; native Amharic grammar and
terminology quality; hallucinated or unsupported source paraphrases; weak Amharic
cross-language ranking; actual Bible database and staging gateway/server integration;
broader adversarial/out-of-domain and independent held-out testing. A larger model
or a valid citation ID does not by itself solve these problems. Next work should
adjudicate the supplied review queue, improve answer entailment/abstention checks,
evaluate multilingual reranking/query translation with measured cost, and expand
domain terminology coverage. Keep E5-small as the provisional local baseline;
do not automatically replace a production embedding or Gemma model.

## 9. Safe promotion of actually approved content

Obtain real linguistic/theological sign-offs and passage/variant decisions, produce
a versioned approved package, and use the existing strict `app/editorial` approval
chain plus protected content-bound grants. Rebuild only approved chunks; never mix
held passages into an approved chunk or copy a research collection wholesale.
Evaluate pinned embeddings and human-reviewed answers in isolated staging, verify
Bible editions and gateway routing, rehearse rollback, and seek separate deployment
authorization. Public book retrieval must revalidate current approvals and citations
on every request. Preserve current request/rate/concurrency/error protections.

No frontend work, book publication, public unapproved RAG connection, production
Qdrant change, GitHub push, VM401 deployment, production model replacement or
editorial approval change occurred. Detailed commands and rollback are in `RUNBOOK.md`.

Private completed-run directory: `{run.resolve()}`.
Index directory: `{(run/'research_index').resolve()}`.
The prepared corpus, models and index live outside the backend's public/static assets.
"""
    (docs/"EVALUATION_REPORT.md").write_text(report,encoding="utf-8")
    answer_text="# Actual Gemma answer comparisons\n\nUNAPPROVED PRIVATE RESEARCH — not verified theology. Human fluency/entailment review pending.\n\n"
    for i,q in enumerate([x["question"] for x in baseline],1):
        answer_text+=f"## {i}. {q}\n\n"
        entries=[("Before, no book evidence",baseline[i-1]),("Raw research RAG",after[i-1]),("Final source-bound research contract",final["records"][i-1])]
        for label,r in entries:
            answer_text+=f"### {label}\n\n"
            if r.get("answer"):answer_text+=r["answer"]+"\n\n"
            else:answer_text+="REJECTED — no answer released by the contract.\n\n"
            if r.get("contract_passed") is not None:answer_text+=f"Mechanical contract passed: {r['contract_passed']}. This is not a theological/fluency score.\n\n"
            for attempt in r.get("attempts",[]):answer_text+=f"Rejected attempt: {attempt['rejection']}\n\n"
            if r.get("evidence"):
                answer_text+=table(["Citation","Book / section","Paragraph IDs"],[(e["citation"],e["document_id"]+" / "+e["section_id"],", ".join(e["paragraph_ids"])) for e in r["evidence"]])+"\n"
    (outputs/"ANSWER_COMPARISONS.md").write_text(answer_text,encoding="utf-8")
    queue=[]
    for q in questions:
        passages=[];seen=set()
        for c in chunks:
            if c["language"]!=q["target_language"]:continue
            for s in c["spans"]:
                p=s["citation"]
                if p["paragraph_id"] not in q["relevant_paragraph_ids"]:continue
                key=(p["paragraph_id"],p["text"])
                if key in seen:continue
                seen.add(key);passages.append({"paragraph_id":p["paragraph_id"],"language":p["language"],
                    "text":p["text"],"section_id":p["section_id"],"content_kind":p["content_kind"],
                    "source_unit_ids":p["source_unit_ids"]})
        queue.append({**q,"expected_answer":None,"source_passages_for_review":passages})
    save(outputs/"HUMAN_REVIEW_QUEUE.json",{"research_only":True,"relevance_questions":queue,
         "answer_review":[{"id":r["id"],"question":r["question"],"answer":r.get("answer"),
            "reviewer":None,"answer_relevance_0_to_4":None,"citation_entailment":None,
            "amharic_quality_0_to_4":None,"unsupported_claim_count":None,"reviewed_claim_count":None}
            for r in raw["records"]+final["records"]],"human_scores_available":False})
    for name in ["EVALUATION_REPORT.md","ARCHITECTURE_AUDIT.md","RUNBOOK.md"]:
        shutil.copy2(docs/name,outputs/name)
    for name in ["corpus_stats.json","runtime_versions.json","package_audit.json","questions.json",
                 "gemma_answers.json","gemma_constrained_answers.json","gemma_constrained_answers.v1.json",
                 "e5_small_q8.model.json","e5_base_q8.model.json","e5_small_q8.retrieval.json","e5_base_q8.retrieval.json"]:
        shutil.copy2(run/name,outputs/name)
    print(json.dumps({"report":str(docs/"EVALUATION_REPORT.md"),"output_directory":str(outputs),
                      "chunks":len(chunks),"questions":len(questions),"contract_accepted":accepted},indent=2))


def main():
    p=argparse.ArgumentParser();p.add_argument("--run",type=Path,required=True)
    p.add_argument("--docs",type=Path,required=True);p.add_argument("--outputs",type=Path,required=True)
    p.add_argument("--tests",type=int)
    a=p.parse_args()
    count=a.tests
    if count is None:
        import xml.etree.ElementTree as ET
        root=ET.parse(a.run/'repository_regression.xml').getroot()
        suites=list(root.iter('testsuite'))
        if any(int(s.get('failures','0')) or int(s.get('errors','0')) or int(s.get('skipped','0')) for s in suites):
            raise ValueError('Report requires a regression result without failures, errors or skips')
        count=sum(int(s.get('tests','0')) for s in suites)
    build(a.run,a.docs,a.outputs,count)


if __name__=="__main__":main()
