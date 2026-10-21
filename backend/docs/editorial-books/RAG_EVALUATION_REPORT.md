# Isolated RAG & AI accuracy evaluation report

**Date:** 2026-10-19  
**Environment:** Local `tewahedo-ai` research harness only  
**Public Search Buddy:** unchanged — unapproved books still excluded  
**Production Qdrant / VM401 / Git push:** not touched

## 1. JWT hardening (fail closed)

Reviewed against Supabase’s **legacy HS256 JWT secret** model (`SUPABASE_JWT_SECRET`).

| Check | Behavior |
|-------|----------|
| Signature | Required HMAC-SHA256 with project JWT secret |
| `exp` / `nbf` | Mandatory; missing `exp` → 401 |
| `aud` | Must intersect configured audience (default `authenticated`) |
| `iss` | Must equal `{SUPABASE_URL}/auth/v1` (or `SUPABASE_JWT_ISS`) |
| Auth `role` claim | Must be `authenticated` (rejects `anon` / `service_role`) |
| CMS role | Still from `profiles.role` (`editor`/`admin`/`super_admin`) |
| Missing JWT secret | **503 fail closed** (Auth API alone is insufficient) |
| Non-HS256 (ES256/JWKS) | **401 fail closed** with clear message until JWKS support is approved |
| Legacy editorial token | **Disabled by default** (`EDITORIAL_ALLOW_LEGACY_TOKEN=false`) |

## 2. Isolated RAG evaluation system

New package: `app/rag_eval/`

| Module | Role |
|--------|------|
| `corpus.py` | Loads real five-book paragraphs; preserves IDs, sources, languages, `approved_for_ingestion` |
| `gold_questions.py` | 15 gold questions (EN/AM, what/why/when/who/how + DNS negative control) |
| `embedders.py` | `hashing-ngram-v1` (always) + optional `multilingual-e5-small` / `bge-m3` |
| `index.py` | In-memory cosine index; optional sample upsert to `tewahedo_editorial_books_local_rag_eval` only |
| `metrics.py` | hit@1, hit@5, MRR, keyword grounding |
| `answer_eval.py` | With/without-context prompts, heuristic judges, optional live Gemma |
| `runner.py` + `scripts/run_rag_eval.py` | CLI orchestration |

**Labels:** every passage is `research_only=true`, `official_church_teaching=false`.

## 3. Measured retrieval results (real package)

Corpus indexed: **5451** passages (EN readings + Amharic source rows) across F01/S01/E01/M01/W01.  
`approved_for_ingestion_true = 0`.

### Before (public Search Buddy path)

| Metric | Value |
|--------|-------|
| Book RAG in `/api/chat` | Not wired |
| `retrieve_for_search_buddy` on drafts | **0 hits** (approval filter — correct) |
| Multilingual book embeddings in production | None |

### After (isolated research index, hashing-ngram-v1)

Full corpus run (`data/rag_eval_reports/rag_eval_hashing-ngram-v1.json`):

| Metric | Overall | English | Amharic |
|--------|---------|---------|---------|
| hit@1 | **0.857** | — | — |
| hit@5 | **0.929** | **0.889** | **1.000** |
| MRR | **0.881** | **0.815** | **1.000** |
| keyword@5 | **0.786** | — | — |

Negative control (`DNS` question) tagged separately and does not inflate scores.

**Interpretation:** Empty public retrieval was **not** an Amharic/parse failure. With an isolated index over the same drafts, EN/AM questions retrieve relevant books/paragraphs at high hit@5. Public empty results remain correct while flags are false.

## 4. Embedding approach comparison

| Model | Role | Availability on this machine | Result |
|-------|------|------------------------------|--------|
| hashing-ngram-v1 | Always-on multilingual baseline | Yes | hit@5 ≈ 0.93–1.0 on eval set |
| multilingual-e5-small | Existing project approach (`test_embeddings.py`) | **No** (`torch` missing) | Deferred |
| BAAI/bge-m3 | Practical multilingual alternative (`test_bge_m3.py`) | **No** (`torch` missing) | Deferred |

Comparison artifact: `data/rag_eval_reports/embedder_comparison.json`.

**Deployment requirement to finish model bake-off:** install CPU/GPU PyTorch + transformers in the research environment, then:

```bash
python scripts/run_rag_eval.py --compare
python scripts/run_rag_eval.py --embedder multilingual-e5-small
python scripts/run_rag_eval.py --embedder bge-m3
```

Optional local Qdrant (loopback only):

```bash
# qdrant on 127.0.0.1:6333
python scripts/run_rag_eval.py   # attempts sample upsert to tewahedo_editorial_books_local_rag_eval
```

## 5. Gemma 4 12B answer evaluation

| Mode | Status |
|------|--------|
| Prompt construction with/without retrieved drafts | Implemented + heuristic judges |
| Simulated grounded answers (deterministic) | Ran with retrieval context |
| Live `home-ai` / LiteLLM | **Not executed** — no `/run/secrets/tewahedo-ai` or `LITELLM_API_KEY` in this workspace |

Heuristic answer checks covered: clock-time invention, citation patterns, language mix, keyword grounding, research disclaimer handling.

To run live when authorized:

```bash
# with secrets mounted or LITELLM_API_KEY set
python scripts/run_rag_eval.py --live-model
```

Expect before/after deltas on: intent adherence, Amharic output, citation honesty, hallucination flags — **not claimed here without live model I/O**.

## 6. Regression tests

```text
python -m pytest tests -q
136 passed
```

Includes CMS JWT fail-closed tests + RAG harness tests. Security suites included.

## 7. What must never happen (enforced)

- Public Search Buddy must not read this research index
- Approval flags must not be flipped by the eval harness (`approval_flags_mutated=false`)
- Local Qdrant collection names must match `tewahedo_editorial_books_local...` only
- Drafts must not be labeled official Church teaching

## 8. Remaining blockers

1. **Torch/transformers** not installed locally → E5 vs BGE-M3 numerical bake-off pending  
2. **Local Qdrant** not running on `127.0.0.1:6333` during this session → sample upsert skipped/failed closed  
3. **Live Gemma** credentials absent → answer quality before/after not measured on the real model  
4. **Asymmetric Supabase signing keys** (if enabled on the project) need an approved JWKS verifier before production CMS JWT deploy

## 9. Safe next deployment steps (when authorized)

1. Confirm Supabase still uses HS256 JWT secret; set `SUPABASE_JWT_SECRET` on the AI backend  
2. Keep `EDITORIAL_ALLOW_LEGACY_TOKEN=false`  
3. Stand up research-only torch env + local Qdrant; rerun `--compare` and `--live-model`  
4. Only after human approval + `approved_for_ingestion=true` export: consider production collection + Search Buddy wiring  
5. Do not deploy unapproved draft vectors to production Qdrant
