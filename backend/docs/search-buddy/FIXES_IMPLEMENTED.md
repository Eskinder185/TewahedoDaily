# Search Buddy — Fixes Implemented

**Workspace:** `C:\Users\eskew\github\tewahedo-ai`  
**Deployment:** Local code only — **not** pushed to GitHub and **not** copied to VM401.

## New module: `app/chat_intelligence.py`

Pure helpers used by `/api/chat`:

| Function | Purpose |
|----------|---------|
| `detect_response_language` | `en` / `am` / `bilingual` from user message (Ethiopic vs Latin + explicit bilingual phrases) |
| `classify_question_focus` | `when` / `why` / `where` / `who` / `how` / `what` / `greeting` / `identity` / `other` |
| `suggest_scripture_lookups` | Curated topic → book/chapter/verse ranges (no invented verse text) |
| `build_answering_instructions` | Per-turn system message: question-first, language lock, focus rules |
| `languages_for_scripture_fetch` | Fetch `en`, `am`, or both to match response language |
| `is_five_mysteries_question` | Shared Five Mysteries detector (EN + Amharic) |

**Baptism topic map** (generalizable pattern, not hardcoded Q&A):

- Matthew 3:13–17  
- Luke 3:21–23  

Pattern matches `baptis|baptiz|jordan|timket` and Amharic baptism/Jordan terms (`ተጠመቀ`, `ጥምቀት`, `ዮርዳኖስ`, …).  
Note: English past tense is *baptized* (with **z**); the map includes `baptiz` so “baptized” matches.

Also curated (limited): Trinity, Incarnation, Eucharist, Resurrection of the Dead topic lookups.

## Changes in `app/main.py`

1. Import `chat_intelligence as intel`.
2. Before AI fallback:
   - Detect response language and question focus.
   - Fetch verified passages for curated topics (same `_append_verified_passage` / Supabase path as before).
   - Scripture language set follows response language (not always bilingual).
3. System prompt updated with **QUESTION-FIRST ANSWERING** and explicit “no unsolicited second-language translation.”
4. Third system message: `turn_instructions` from `build_answering_instructions`.
5. Gateway payload messages order:

```text
system: doctrinal + question-first base prompt
system: verified Scripture context (or none message)
system: per-turn language + focus instructions
user:   request.message
```

6. Preserved: rate limits, body size, AI semaphore, CF Access secrets, `home-ai` model, `sources` response shape, Five Mysteries path.

## What was intentionally *not* done

- No Qdrant / embedding index wired into chat (would need approved model/index migration).
- No biblical text DB edits.
- No production deploy, container restart, or credential commits.
- No brittle per-question canned answers for the baptism examples.

## Tests added

`tests/test_chat_intelligence.py` — language, focus, topic lookups, Unicode JSON round-trip, mocked `/api/chat` asserting turn instructions and Scripture grounding for baptism / Jordan / Amharic greeting / Five Mysteries.

Security suites left intact and re-run (see `AMHARIC_QA_RESULTS.md` / final summary for counts).
