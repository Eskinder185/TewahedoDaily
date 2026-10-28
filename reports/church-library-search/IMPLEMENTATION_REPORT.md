# Church Library JSONL retrieval repair

## Finding

The reviewed Faith and Order JSONL corpus exists locally with 47 source passages. The importer validated and inserted text, sections, pages, and review flags, but it discarded the JSONL `passage_id` and did not ingest embeddings. The deployed RPC represented keyword and semantic scores as one sum, but semantic-only candidates could never enter the result set because candidate selection first required a keyword match. Browser fallback also converted database failures into an indistinguishable empty result.

Production import/publication state was not queried in this local task. The migration and importer are prepared but were not executed against Supabase.

## Implemented locally

- Natural-boundary refinement produces 70 passages from the 47 source passages while preserving the complete normalized text and source locators.
- `source_passage_id` is retained and unique within a version.
- Optional companion embeddings use the same configured 384-dimensional model as query embedding. No semantic score is claimed when that model is absent.
- Search combines exact phrase, Unicode-safe full-text/alias retrieval, and independent pgvector candidates using reciprocal-rank fusion.
- Existing current-version, public-retrieval, ingestion, quote, rights, processing, and version gates are preserved.
- Adjacent passages can be fetched through a separately gated context RPC.
- Search distinguishes no public books, no indexed passages, no relevant passage, permissions, missing RPC/schema cache, timeout, and database failure.
- Citations continue to open `/library/:bookId?passage=:passageId`; the reader switches to passage mode, scrolls to, and highlights that exact row.
- Search Buddy displays a clearly labelled exact source excerpt as its grounded answer and does not manufacture a synthesis when evidence is absent.

## Benchmark

The reviewed benchmark contains 33 questions drawn from the actual JSONL chapters, including English and Amharic queries. Offline Unicode-safe exact/keyword retrieval measured:

- Recall@5: **0.9091**
- MRR: **0.6197**
- Citation accuracy: **0.9091**
- Unsupported-answer rate: **0.0** (the offline evaluator does not generate answers)
- Median lexical latency: **6.685 ms**

Semantic results are recorded as `not_measured_no_approved_embedding_model`; they were not fabricated. Rerun the production evaluator after configuring and approving a multilingual model and importing vectors.

## Production activation blockers

1. Review and apply `20261028130000_church_library_jsonl_hybrid_search.sql` manually.
2. Refresh PostgREST schema cache (included in the migration).
3. Generate companion embeddings with the approved multilingual model, then run the administrator importer with `--embeddings`.
4. Confirm the target book/current version and review the 51 source-quality flags before enabling public retrieval.
5. Run the live 33-question benchmark against the installed RPC and record semantic Recall@5/MRR before choosing final RRF weights.

No production SQL, imports, publication changes, deployment, commit, or push occurred.
