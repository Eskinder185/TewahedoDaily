# Five Mysteries vs Seven Sacraments — Investigation & Local Fix

**Date:** 2026-10-19  
**Scope:** Local code only. No deploy, push, production Qdrant, or draft auto-approval.

## 1. Where the five books are

| Location | Present? |
|----------|----------|
| `tewahedo-ai/content-review/` | **Yes** (Catalog, F01, S01, E01, M01, W01, `audit/Doctrinal_Comparison.md`) |
| `TewahedoDaily/content-review/` | **No** (monorepo excluded the package) |
| `TewahedoDaily/backend/content-review/` | **No** |

## 2. Does live Search Buddy have the five books?

**No.** Public `/api/chat` does **not** call `retrieve_for_search_buddy`.

- `editorial/retrieval.py` documents: *“Not wired into /api/chat.”*
- `retrieve_for_search_buddy` returns only **individually released** approved variants; drafts yield `[]`.
- Private `book_rag_research` / `rag_eval` stay isolated evaluation harnesses.

So local RAG eval ≠ production integration.

## 3. Verified classifications (source anchors)

### Five Mysteries of Faith (ምሥጢራተ ሃይማኖት)
Traditional EOTC list (already used in Search Buddy terminology; private RAG maps to F01 sections F01W-S02…S06):

1. Mystery of the Trinity — ምሥጢረ ሥላሴ  
2. Mystery of the Incarnation — ምሥጢረ ሥጋዌ  
3. Mystery of Baptism — ምሥጢረ ጥምቀት  
4. Mystery of the Eucharist — ምሥጢረ ቁርባን  
5. Mystery of the Resurrection of the Dead — ምሥጢረ ትንሣኤ ሙታን  

### Seven Sacraments (ምሥጢራተ ቤተ ክርስቲያን)
**Faith and Order `F01W-P0165`:**  
baptism, confirmation, penance, Holy Communion, unction of the sick, matrimony, and holy orders.  

S01 book title: *The Seven Sacraments of the Church* (editorial draft — approval pending).

These are **distinct** lists. Shared names (Baptism, Eucharist/Communion) do not make them interchangeable (`Doctrinal_Comparison.md`).

## 4. Why the live model mixed them

| Stage | What happened |
|-------|----------------|
| Classification | Only `is_five_mysteries_question` (“five mysteries”); no Seven Sacraments detector; bare “mysteries” fell through |
| Retrieval | **No book RAG** on `/api/chat` — only Bible verse lookups for Five Mysteries |
| Prompt | System prompt **always** listed the Five Mysteries terminology on every turn |
| Generation | Gemma used general knowledge + overlapping Baptism/Eucharist vocabulary → blended with Western/Orthodox **seven sacraments** |
| Grounding | Live path had **no** category check or cross-list rejection |

Private RAG already warned “Do not call all Five Mysteries sacraments” and routed Five Mysteries to F01 sections — but that pipeline never reached live chat.

## 5. Local fixes implemented

| Change | Purpose |
|--------|---------|
| `doctrinal_categories.py` | Classify five / seven / ambiguous; deterministic answers; mix detector; F01W-P0165 anchors |
| `/api/chat` early return | Verified doctrine payload before LLM |
| Dynamic terminology section | Stop injecting Five Mysteries list on every unrelated turn |
| Ambiguous “What are the mysteries?” | Ask Five Mysteries vs Seven Sacraments |
| Private RAG `select_evidence` | Seven-sacraments path prefers F01W-P0165; Five Mysteries still avoids sacrament inventory |
| `validate_grounded` | Reject cross-list substitutions; require sacrament substance |

Unapproved draft **bodies** are still not published as public RAG quotations; sacraments answers cite **paragraph IDs** and state editorial status.

## 6. Test results

```
TewahedoDaily/backend: tests/test_doctrinal_categories.py + test_chat_intelligence.py
→ 23 passed, 1 skipped (optional Gemma smoke)
```

Covered: EN/AM five mysteries, seven sacraments, ambiguous clarification, cross-mix detector, `/api/chat` without LLM for doctrine.

Gemma live generation: skipped when local endpoint unavailable; deterministic doctrine path is the reliable live fix.

## 7. Integration gap (what still blocks book-grounded live answers)

1. `content-review` not in monorepo path used by production image.  
2. `retrieve_for_search_buddy` not called from `/api/chat`.  
3. Approval/release chain empty → public retrieval correctly returns nothing.  
4. Wiring books requires: human theological + linguistic approval → release variants → then connect retrieval + grounding to chat (preserving security).

## 8. Remaining human theological review

- Confirm public wording of the Five Mysteries list against received catechesis (beyond F01 section mapping).  
- Confirm Amharic sacrament names (ሜሮን, ንስሐ, ተክሊል, etc.) with linguistic review.  
- Approve F01/S01 paragraphs before any public RAG citation of full draft text.  
- Reconcile overlapping Baptism/Eucharist pedagogy without merging categories.

## 9. Safe next steps (authorization required)

1. Keep private RAG eval isolated until approval.  
2. After approval: release paragraph variants → wire `retrieve_for_search_buddy` into `/api/chat` with category filters.  
3. Re-run grounded eval + live Gemma smoke.  
4. Deploy only with explicit authorization (no silent Qdrant/prod changes).
