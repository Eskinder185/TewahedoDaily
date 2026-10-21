# Search Buddy — Root Cause Analysis

**Workspace:** `C:\Users\eskew\github\tewahedo-ai`  
**Scope:** Local repository audit of `/api/chat` (not a live production overwrite)  
**Date:** 2026-10-18

## Executive finding

Search Buddy failures were not primarily encoding bugs or LiteLLM transport failures. They came from **missing question intelligence in the chat pipeline**: no response-language routing, no question-type focus, weak Scripture grounding for topic questions, and a system prompt that encouraged long bilingual explanations. Embeddings/Qdrant are **not** on the `/api/chat` path today.

## Problem A — Incorrect question interpretation

**Observed:** “At what time was Jesus Christ baptized?” produced a long baptism explanation without answering time-of-day / evidence limits.

**Root causes:**

1. **No question-focus classifier.** The model received a large doctrinal system prompt and optional Scripture context, but no instruction that this turn was a **WHEN** question.
2. **No question-first answering contract.** The system prompt emphasized doctrine and bilingual quality more than opening with a direct answer.
3. **Insufficient grounding for baptism chronology.** Scripture was attached for embedded refs and Five Mysteries, not for baptism “when/why” topics. Without Luke 3:21–23 / Matthew 3:13–17 in context, the model freelanced narrative theology.

**Not the cause:** Unicode corruption, gateway auth, or rate limiting.

## Problem B — Excessively generic explanations

**Observed:** “Why did Jesus choose to be baptized in the Jordan River?” yielded repetitive bilingual essays without strong citation structure.

**Root causes:**

1. Same missing **WHY** focus + question-first rules.
2. **No curated Matthew 3:13–17 grounding** for Jordan/baptism topic questions (until this repair).
3. Prompt pressure toward thorough EOTC exposition without a “lead with the reason, then evidence” rule.
4. Temperature and `max_tokens` allow long answers; without turn-level brevity instructions, Gemma fills the space.

## Problem C — Amharic questions fail

**Investigated:** Ethiopic input (`ሰላም፣ ስምህ ማን ነው?`, baptism/mysteries Amharic).

**Findings:**

1. **JSON / FastAPI Unicode round-trip is intact** (deterministic test: Ethiopic survives `json.dumps(..., ensure_ascii=False)` and request parsing). Encoding is not the primary failure mode in this codebase.
2. **Language was not selected for Amharic-only turns.** Prior prompt text still allowed / encouraged bilingual patterns; Amharic questions were not given an **Amharic-only** output instruction.
3. **No vector retrieval for Amharic** on `/api/chat`. Standalone scripts (`app/test_embeddings.py`, `app/test_bge_m3.py`, `app/test_retrieval.py`) exist for experiments; they are **not** wired into chat.
4. **Live Gemma Amharic quality cannot be proven by mocks.** Pipeline language routing can be tested; model fluency cannot without a real `home-ai` call.

## Problem D — Unnecessary bilingual output

**Root causes:**

1. System / theology guidance historically favored bilingual educational answers.
2. No hard **OUTPUT LANGUAGE** gate derived from the user message (`en` | `am` | `bilingual`).
3. Scripture fetch sometimes pulled both `en` and `am` when bilingual was assumed, reinforcing dual-language answers.

## Pipeline audit summary

| Stage | Status before fix | Notes |
|-------|-------------------|--------|
| FastAPI `/api/chat` validation | OK | Body limits, auth, concurrency preserved |
| Message normalization | Partial | Structured routes (bible/hymn/etc.) OK; AI path weak |
| Intent / question focus | Missing | Added in `chat_intelligence.py` |
| Conversation history | Limited | Single user turn sent to LiteLLM (no multi-turn history in gateway payload) |
| Language identification | Missing | Added `detect_response_language` |
| Bible retrieval | Partial | Embedded refs + Five Mysteries only |
| Embeddings / Qdrant | Not in chat path | Experimental scripts only |
| Prompt construction | Weak precedence | Static system prompt dominated; no per-turn language/focus |
| LiteLLM gateway | OK | Same `home-ai` contract; security headers unchanged |
| Citation extraction | Partial | Sources JSON when passages fetched |
| Error/timeout handling | OK | Semaphore, timeouts, malformed JSON → 503 |

## What was *not* broken

- Cloudflare Access / LiteLLM secret reading pattern
- Rate limiting, body-size limits, AI semaphore
- Disabled debug routes (`ENABLE_DEBUG_ROUTES`)
- Structured Scripture `sources` contract for the frontend
- Localhost Docker bind expectations (not changed here)
