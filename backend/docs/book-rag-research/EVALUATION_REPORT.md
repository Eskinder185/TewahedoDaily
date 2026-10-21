# TewahedoDaily — private real-book RAG evaluation

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

| Book | Contextual chunks |
| --- | --- |
| F01 | 140 |
| S01 | 299 |
| E01 | 433 |
| M01 | 451 |
| W01 | 304 |


Total: **1,627 chunks**, covering **3,003 reading
records** and **5,553 real selected variants**. There are
870 English and 757 Amharic-source
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
silently truncating. Corpus fingerprint: `576d289dabbaa984a30ffcbf9b72ec8924bc9b31a834f83a24a695976b36b36c`.

## 3. Real embedding comparisons

| Quantized CPU model | Dimension | ONNX MB | Corpus embedding seconds | Embedding peak process RSS MiB | Query-run peak RSS MiB | Median query embedding ms |
| --- | --- | --- | --- | --- | --- | --- |
| e5_small_q8 | 384 | 118.3 | 54.9 | 749.0 | 903.6 | 4.2 |
| e5_base_q8 | 768 | 278.6 | 230.0 | 938.3 | 1257.3 | 8.1 |


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

- `tewahedo_research_unapproved_e5_small_q8_576d289dabba` — 384 dimensions.
- `tewahedo_research_unapproved_e5_base_q8_576d289dabba` — 768 dimensions.

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

| Model | Method | Macro Recall@5 | MRR@10 | Median retrieval ms |
| --- | --- | --- | --- | --- |
| e5_small_q8 | bm25 | 37.9% | 0.341 | 1.2 |
| e5_small_q8 | dense | 65.8% | 0.488 | 48.5 |
| e5_small_q8 | hybrid | 67.4% | 0.552 | 49.8 |
| e5_small_q8 | aligned_hybrid | 79.4% | 0.592 | 73.7 |
| e5_base_q8 | bm25 | 37.9% | 0.341 | 1.3 |
| e5_base_q8 | dense | 52.5% | 0.425 | 57.2 |
| e5_base_q8 | hybrid | 65.1% | 0.481 | 58.8 |
| e5_base_q8 | aligned_hybrid | 67.8% | 0.536 | 102.3 |


BM25 is the real-corpus lexical baseline. Hybrid fuses dense and lexical ranks with
an explicit bilingual terminology glossary. Alignment follows exact paragraph
links into the requested language and does not generate translations. Alignment
is applied only across languages; same-language ranking retains ordinary hybrid.

| Direction | Cases | E5-small aligned R@5 | E5-small MRR@10 | E5-base aligned R@5 | E5-base MRR@10 |
| --- | --- | --- | --- | --- | --- |
| en_to_en | 12 | 91.7% | 0.820 | 83.3% | 0.658 |
| am_to_am | 9 | 77.8% | 0.500 | 66.7% | 0.528 |
| am_to_en | 12 | 53.6% | 0.448 | 53.6% | 0.420 |
| en_to_am | 9 | 96.8% | 0.526 | 63.5% | 0.485 |
| mixed_to_en | 1 | 100.0% | 1.000 | 100.0% | 1.000 |


On this set, E5-small aligned hybrid is the better private prototype choice:
79.4% macro anchor Recall@5 versus 67.8% for E5-base. English→Amharic improves from
63.5% small dense to 96.8% with exact alignment. Amharic→English remains only 53.6%
anchor recall; F01 lacks an Amharic edition, so source alignment alone cannot bridge
every question into the reference text. This is not a claim of universal model
superiority or 79.4% answer accuracy. Human-reviewed held-out evaluation is required
before any production model/index decision.

## 6. Before/after actual answer comparisons

| Requested case | Observed raw before/after result | Final research finding |
| --- | --- | --- |
| Baptism clock time | Baseline and raw RAG both declined to invent a clock time. | Structured answer retained abstention and cited the age/type discussion; no verified Bible database was available. |
| Why the Jordan? | Raw RAG added actual Andemta humility/prophecy/typology material and book citations. | Contract blocked two attempts containing numeric verse references without verified Bible records. Source relevance and generation policy are separate issues. |
| Five Mysteries (English) | Raw RAG omitted all requested book citations and called the collection foundational sacraments. | Definition-bearing F01 routing plus structured claims produced all five source IDs and the one-God/three-Persons wording. This remains an unapproved draft-based answer. |
| Amharic greeting/identity | Both modes responded mainly in Amharic; retrieval correctly remained empty. | Identity does not need theological retrieval. Naturalness still requires fluent review. |
| Amharic baptism why | Baseline emitted the unsupplied reference መጽሐፈ መሳፍንት 19:18; raw RAG became source-specific but used ሦስትነት. | Both constrained attempts retained the unwanted term and were blocked. A validator success must not be fabricated. |
| Five Mysteries (Amharic) | Raw RAG emitted English glosses despite language instructions. | Final structured output removed glosses and bound five IDs, but introduced wording about those in heaven that its cited resurrection passage does not support. Mechanical pass, semantic quality failure requiring expert review. |


All 12 raw comparisons completed using the real local model. Language-script checks
passed 6/6 before and 6/6 after, but script matching is not fluency. Raw RAG answers
included 16 valid book-ID
occurrences; 4/5 evidence-bearing answers cited a source.
The other evidence-bearing answer omitted citations. An ID existing in evidence
does not establish that the cited passage entails the claim.

The final structured contract accepted **4/6 logical examples** and blocked
**2/6** after retry. It constrains supplied source IDs, unwanted English
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

Model: `gemma4:12b`, reported **11.9B**,
**Q4_K_M**, local Ollama 0.40.5 on an
RTX 4070 SUPER (12 GiB VRAM), host RAM approximately 15.7 GiB. Digest:
`6114515d63c17436a7c0417d82820ac65ad643e2806c5a3c89cb62846436ed0b`.

Generation used temperature 0, seed 42, thinking disabled, context 6,144 and up to
640 output tokens. Median raw response latency was
4.85s before and
5.96s after. The cold/contention
outlier prevents interpreting the mean as a RAG speedup. The initial 12 comparisons,
10 constrained-v1 calls including retries, and 2 targeted final
definition-routing calls are all recorded. A single warm-up call is not a quality
sample. Prompt revisions and new evidence are combined interventions; this is not
a controlled attribution of every answer change solely to the embedding model.

The temporary loopback Ollama processes were unloaded/stopped. No model was
downloaded for generation and no production LiteLLM credentials were read/changed.
No production Gemma/LiteLLM result is claimed. Runtime versions: `{'qdrant-client': '1.19.1', 'onnxruntime': '1.31.0', 'tokenizers': '0.23.3', 'huggingface-hub': '1.33.0', 'numpy': '2.2.6', 'httpx': '0.28.1', 'psutil': '7.0.0', 'pytest': '8.3.5'}`.

## 8. Tests, remaining blockers and recommended work

The full backend/security/research suite passes **153 tests**, including actual
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

Private completed-run directory: `C:\Users\eskew\Documents\Codex\2026-10-18\tewahedodaily-five-book-integration-the-five\work\rag-evaluation`.
Index directory: `C:\Users\eskew\Documents\Codex\2026-10-18\tewahedodaily-five-book-integration-the-five\work\rag-evaluation\research_index`.
The prepared corpus, models and index live outside the backend's public/static assets.
