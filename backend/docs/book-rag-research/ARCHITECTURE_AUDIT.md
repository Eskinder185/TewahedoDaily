# Search Buddy architecture audit

2026-10-19. Local source inspection; no VM401 deployment or production service inspection.

The public `/api/chat` handler does not currently retrieve book vectors. There is
no active Qdrant collection, chunker or embedding model on that request path in
this checkout. `app/test_embeddings.py` and `app/test_retrieval.py` experiment with
`intfloat/multilingual-e5-small`; `app/test_bge_m3.py` experiments with BGE-M3.
Those scripts use a handful of invented sample passages, not the five books.
The later `scripts/eval_bilingual_retrieval_local.py` is likewise synthetic.
Their successes cannot establish real-book retrieval performance.

The current flow is:

1. FastAPI validates input and applies existing request-body/rate/concurrency controls.
2. Structured Bible, hymn and other recognized intents can bypass free-form generation.
3. The AI path detects response language/question focus and looks up embedded
   Scripture references or a small curated topic map, including Five Mysteries.
4. `bible_reference` resolves the public Supabase edition/book/chapter/verses.
   Missing rows produce no invented verse text. Grouped Amharic Matthew 28:19–20
   has special handling. Missing-source fallback is prompt-based.
5. A static Ethiopian Orthodox prompt, optional verified Scripture context,
   per-turn instructions and the user question are sent to the LiteLLM gateway.
6. The model alias is `home-ai` at `https://gateway.eskinder.dev/v1/chat/completions`.
   Three server-side secret files supply gateway/Cloudflare Access authentication.
   The source alone does not prove which physical model the production alias maps to.
7. Generated prose is returned with separately supplied verified Scripture rows.
   The public path does not enforce paragraph-bound book citations or validate
   every free-form model reference after generation.

The static prompt already asks for question-first answers, appropriate language,
traditional terminology, source integrity and uncertainty. The central weakness
is missing evidence delivery: a prompt cannot retrieve a relevant Andemta passage
that was never supplied. Keyword topic maps also cannot answer arbitrary book
questions, compare source disagreements, or reliably retrieve Amharic passages.

Other weaknesses include unmeasured cross-language embeddings, no real-corpus
chunking/evidence-budget policy, no book citation contract on the chat path, and
no human-reviewed answer/retrieval benchmark. Language selection is implemented,
but following that instruction and using fluent Amharic remain model behaviors.

Existing `app/editorial` helpers implement private review and approved-only
retrieval. Their closed gate is correct for public use. This task adds a separate
`app/book_rag_research` package under the user's explicit authorization for unapproved,
private research. It does not weaken or bypass those gates for any public request.

The new research flow uses actual source-aligned variants, bounded contextual
chunks, E5 query/passage prefixes and attention-masked mean pooling, persistent
Qdrant local collections, BM25/dense/hybrid retrieval, and exact paragraph links
to bridge English and Amharic. A source-section overview route assembles all five
F01 foundational Mystery sections for broad Five Mysteries questions; it retrieves
actual text rather than generating a canned answer. Identity/greeting questions
skip theological retrieval.

The local machine had neither the gateway secret files nor configured Supabase
environment variables. Those services were not called. Actual model testing used
the already-installed local `gemma4:12b` through a temporary loopback Ollama process,
not a production gateway replay. Its reported identity is 11.9B, Q4_K_M, with
digest `6114515d63c17436a7c0417d82820ac65ad643e2806c5a3c89cb62846436ed0b`.

The six-question baseline uses the current static Search Buddy prompt and turn
instructions with no book evidence and no available verified Bible database.
Before/after results therefore isolate a local evidence/prompt experiment, not
all production routing, database and gateway behavior. No production model,
credentials, collections, security settings or frontend code were changed.

During this run a separate local `app/rag_eval` experiment and its tests appeared
in the repository. They are preserved. The measured CPU ONNX/persistent-Qdrant/
local-Gemma implementation from this report is installed as `app/book_rag_research`
and uses `python -m book_rag_research.run`. Results from the other experiment are
not substituted for the measurements reported here.
