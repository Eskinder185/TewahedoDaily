# Private real-book RAG evaluation runbook

2026-10-19. This supersedes frontend book display as the immediate development
priority. Do not connect this research environment to public Search Buddy.

## Isolation and source rules

`app/book_rag_research` is CLI-only and is never imported by `app/main.py`. The Qdrant
adapter accepts only a filesystem path and constructs `QdrantClient(path=...)`.
It has no URL/API-key/remote-client option. This is Qdrant's real persistent local
engine, not a fake vector store or a Docker/production server. Server/distributed
Qdrant behavior remains a separate integration test.

The storage directory must be new or carry the exact research ownership marker.
Collection names must begin `tewahedo_research_unapproved_`. Every point has
`research_only=true`, `approved_for_ingestion=false`,
`public_retrieval_eligible=false`, an unapproved editorial-status label and the
research namespace. No approval writer is present. Package files stay read-only.

The 1,627 chunks cover all 3,003 reading records and 5,553 selected real variants.
They preserve exact text spans, stable source/paragraph IDs, sections, original
records, confidence definitions, uncertain spans, review/revision metadata and
reference evidence. Original Amharic with Geʽez, English readings/translations and
supplemental explanations remain distinct. F01's 501 substantially duplicated
original-English variants are retained as provenance rather than indexed a second
time alongside its edited reading. Blank layout is not fabricated into content.

Chunks pack adjacent text only within a book/section/language/content-kind stream,
targeting 256 body tokens. Oversize passages are partitioned at tokenizer character
offsets with zero overlap. All selected variants reconstruct byte-for-byte as
Unicode text; the corpus has zero identical text-body duplicates within language
and kind. Embedding input adds labeled book/section context, caps at 384 tokens
and raises on excess rather than silently truncating. No absent Matthew chapters,
source repairs, translation fixes or new theological text are invented.

## Environment

The optional dependencies are in `requirements-rag-eval.txt`. They are not added
to the production Dockerfile or backend dependency list. Create a dedicated venv,
install those dependencies, and download the pinned public CPU models:

```powershell
python -m venv .rag-eval-venv
.\.rag-eval-venv\Scripts\python -m pip install -r requirements-rag-eval.txt
.\.rag-eval-venv\Scripts\python scripts/download_book_rag_research_models.py --cache C:\private-rag\models
$env:PYTHONPATH = 'app'
$evalPython = '.\.rag-eval-venv\Scripts\python.exe'
```

Use a private writable location outside frontend assets. Commands below use
`C:\private-rag\run` illustratively; the completed run's exact paths are recorded
in `EVALUATION_REPORT.md`. No model weights, book corpus, index or answers belong
in public Git/static hosting.

```powershell
& $evalPython -m book_rag_research.run prepare --package content-review --work C:\private-rag\run --cache C:\private-rag\models
& $evalPython -m book_rag_research.run embed --model e5_small_q8 --work C:\private-rag\run --cache C:\private-rag\models
& $evalPython -m book_rag_research.run embed --model e5_base_q8 --work C:\private-rag\run --cache C:\private-rag\models
& $evalPython -m book_rag_research.run evaluate --model e5_small_q8 --work C:\private-rag\run --cache C:\private-rag\models
& $evalPython -m book_rag_research.run evaluate --model e5_base_q8 --work C:\private-rag\run --cache C:\private-rag\models
& $evalPython -m book_rag_research.run query --model e5_small_q8 --work C:\private-rag\run --cache C:\private-rag\models --question 'Why was Christ baptized in the Jordan?' --target-language am
```

Model downloads use pinned revisions, no remote code and no hosted inference.
ONNX inference is CPU-only with four threads, normalized attention-masked mean
pooling and E5's `query:`/`passage:` prefixes. Test results apply specifically to
the quantized conversions, not unquantized PyTorch checkpoints. BM25 is a lexical
baseline. Hybrid uses reciprocal-rank fusion and a small explicit terminology
glossary. Cross-language alignment follows exact reading paragraph links; it does
not invent a translation. Same-language queries retain ordinary hybrid ranking.

## Local generation

Only `http://127.0.0.1:11439` and `gemma4:12b` are accepted by the optional generator.
No gateway credential or remote inference URL is accepted. An operator must start
a temporary local Ollama process on that port using the installed model. Keep
cloud access disabled and limit concurrency to one. The temporary process used
for this run was unloaded and stopped after testing; no background monitor remains.

```powershell
& $evalPython -m book_rag_research.run answers --model e5_small_q8 --work C:\private-rag\run --cache C:\private-rag\models
& $evalPython -m book_rag_research.run refine --model e5_small_q8 --work C:\private-rag\run --cache C:\private-rag\models
```

`answers` records the six raw before/after comparisons. `refine` records a separate
constrained experiment. It asks for short JSON claims with a source ID from the
supplied evidence, renders citations from those IDs, and retries once if validation
fails. Unknown IDs, unsupplied numeric verse references, unwanted English in
Amharic and the observed unwanted Trinity term fail closed. Rejected raw attempts
are preserved; there is no automatic rewrite of source text and no claim of
theological approval. Identity replies skip retrieval. Passing the mechanical
contract does not prove citation entailment, correctness or Amharic fluency.

The Bible database was unavailable in this run. Verse references inside draft
books are documentary source assertions, not verified database Bible records.
Constrained synthesis cites book sources only; exact Scripture quotation requires
a separately verified edition/verse record in future work.

## Relevance and human answer review

`prepare` creates 43 provisional source-linked questions only when `questions.json`
does not exist, preserving later reviewer edits. It does not create human review.
Faith and Order is the user-designated comparison reference; that does not make
the questions' relevance labels or generated answers human-reviewed.

Reviewers should check the actual passages, add omitted relevant IDs, write expected
answer facts/abstentions, identify edition/conflict limitations, and set their name
and `human_reviewed=true` only after completing the review. Use:

```powershell
& $evalPython -m book_rag_research.run evaluate --require-human-review --model e5_small_q8 --work C:\private-rag\run --cache C:\private-rag\models
```

That mode rejects the current provisional labels. Review answer relevance (0–4),
citation entailment (supported/partial/unsupported), Amharic terminology/grammar
(0–4, by a fluent reviewer), answerable versus abstention decisions, and individual
unsupported claims. Hallucination rate requires a reviewed claim denominator;
script detection or valid citation IDs are insufficient. Do not convert unavailable
human scores to zero or infer them from unit tests.

## Index validation and complete rollback

Each model/corpus fingerprint has its own collection and durable ownership ledger.
The runner checks every point's full payload, exact source text, IDs, Unicode,
approval labels and vector dimension. Repeating UUID upserts leaves the count
unchanged. A two-point disposable collection is created and removed as a cleanup
rehearsal. Regression tests additionally close/reopen a real collection, validate
its persisted payloads, retrieve Amharic and remove it completely.

Re-running an unchanged build is idempotent. A different corpus/model identity
requires a different collection; a conflicting owned collection is rejected.
Pending builds can be re-upserted from the same corpus/vectors or removed. All
collections in an index's ownership ledger can be rolled back with:

```powershell
& $evalPython -m book_rag_research.run cleanup --work C:\private-rag\run
```

Cleanup deletes only ledger-owned research collections in that private local
store, never a production collection or unrelated directory. Prepared corpus,
vectors, model cache and reports are separate private artifacts; deleting them
is an optional operator action, not secure erasure. Keep private storage access
controlled. Do not open the same Qdrant local directory from concurrent writers.

## Promotion after actual approval

1. Obtain qualified linguistic/theological review and complete the five book
   sign-offs and passage/variant decisions. Resolve or formally disposition holds.
2. Produce a versioned approved package and regenerate the approved-only canonical
   candidates. Preserve sources, exact IDs, translations and explanation labels.
3. Use the existing `app/editorial` approval chain and protected content-bound
   release manifest; research flags, namespace and permissive private corpus
   code are never promoted as authorization.
4. Re-chunk only eligible variants. A production chunk must not mix approved and
   held paragraphs. Generate new vectors under a pinned, evaluated model/version.
   Never copy a research collection wholesale into a public collection.
5. Run human-reviewed held-out retrieval/answer tests, adversarial citation and
   language tests, actual staging Qdrant/gateway/Bible integration and rollback.
6. Separately authorize staging/public wiring with access/rate/body/concurrency
   protections, server-side approval revalidation and verified Scripture handling.
7. Publish no books or sources, switch no production model/index, push no code and
   deploy nothing until that separate authorization exists.
