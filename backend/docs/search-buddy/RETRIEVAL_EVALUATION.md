# Search Buddy — Retrieval Evaluation

**Date:** 2026-10-18

## Current architecture (chat path)

`/api/chat` does **not** use Qdrant, dense embeddings, or hybrid RAG at request time.

Grounding mechanisms that *are* used:

1. **Embedded Scripture references** in the user message (regex parse → `bible_reference`).
2. **Five Mysteries curated list** (fixed mystery → verse mapping).
3. **Topic passage map** (`chat_intelligence.suggest_scripture_lookups`) — new curated EN/Amharic keyword patterns → verified Supabase fetches.
4. **Structured non-AI routes** (bible search, hymns, synaxarium, etc.) when classifiers match.

Standalone experiments (not production chat):

- `app/test_embeddings.py`
- `app/test_bge_m3.py`
- `app/test_retrieval.py`

These demonstrate multilingual embedding ideas but are **not** imported by `main.py` chat.

## Baptism regression grounding (curated)

| Question type | Expected lookups | Notes |
|---------------|------------------|--------|
| When / time of baptism | Matthew 3:13–17, Luke 3:21–23 | Supports “no clock time”; age ~30 from Luke |
| Why Jordan | Same pair | Matthew 3:15 especially for “fulfill all righteousness” |
| Amharic baptism why | Same topic map if keywords match | Verse *text* language follows `languages_for_scripture_fetch` |

Lookups never invent verse bodies; missing DB rows → passage omitted (HTTP 404 swallowed per `_append_verified_passage`).

## Ranking / selection policy

- First matching topic pattern(s) accumulate unique (book, chapter, start, end) keys.
- Five Mysteries questions **skip** the topic map to avoid duplicate/conflicting sets.
- Embedded explicit refs take precedence for range validation (max five verses).
- No semantic re-ranker: relevance depends on curated pattern quality.

## Embedding quality for Ethiopic

**Not evaluated on the live chat path** because embeddings are unused there.

If future RAG is approved:

- Prefer a multilingual model known to handle Ethiopic (evaluate BGE-M3 / similar on a labeled Amharic/EN theological set).
- Build a separate index migration plan; do not ingest unapproved theological materials.
- Keep citation integrity: only return passages present in the verified Bible DB (or labeled non-Scripture docs).

## Failure modes remaining

| Mode | Behavior |
|------|----------|
| Topic not in map | No verified sources; model may cite from memory — instructed not to invent quotations |
| Amharic edition missing in DB | English-only sources or none; prompt says not to fabricate Amharic Bible text |
| Keyword false positive | Wrong topic passages attached — mitigate by keeping patterns tight and topic tags |
| Over-long model answer | Instructions ask for concise question-first answers; model may still over-generate |

## Conclusion

Retrieval for Search Buddy chat is **curated verification**, not vector RAG. Quality gains for Problems A/B come from attaching the right Matthew/Luke ranges plus question-focus instructions. A full Amharic RAG upgrade is a **separate, approved migration**, not part of this repair.
