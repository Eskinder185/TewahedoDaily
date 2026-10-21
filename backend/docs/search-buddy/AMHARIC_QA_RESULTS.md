# Search Buddy — Amharic QA Results

**Date:** 2026-10-18  
**Environment:** Local `tewahedo-ai` pytest (mocked LiteLLM)  
**Live model evaluation:** **Not performed** (no production/gateway call from this workspace)

## Deterministic results (mocked pipeline)

| Case | Input | What was verified | Result |
|------|--------|-------------------|--------|
| Language ID | `ኢየሱስ ክርስቶስ ለምን ተጠመቀ?` | `detect_response_language` → `am` | Pass |
| Language ID | `ሰላም፣ ስምህ ማን ነው?` | → `am`; focus → `identity` | Pass |
| Language ID | `አምስቱ ምሥጢራት ምንድን ናቸው?` | → `am`; Five Mysteries detector | Pass |
| Unicode | Ethiopic in JSON message | Round-trip `ensure_ascii=False` preserves characters | Pass |
| Chat wiring | Amharic greeting | Mocked `/api/chat` includes Amharic-only OUTPUT LANGUAGE in turn instructions | Pass |
| Chat wiring | Amharic Five Mysteries | Still routes; language instructions Amharic-oriented | Pass |

## What mocks prove

- Ethiopic is not stripped by JSON serialization or TestClient request handling in this repo.
- The backend **selects Amharic output mode** and injects Amharic-only instructions.
- Five Mysteries / topic detectors accept Amharic script.

## What mocks do **not** prove

- That Gemma 4 (`home-ai`) produces fluent, grammatically correct Amharic.
- That Amharic theological terminology is always accurate in free-form generation.
- That Amharic Scripture rows exist in Supabase for every curated lookup (404s are skipped silently per passage).

## Recommended live checks (post-deploy, manual)

Run against staging or a controlled local gateway (not required for this code change to merge locally):

1. `ሰላም፣ ስምህ ማን ነው?` → short Amharic identity reply, no English block.
2. `ኢየሱስ ክርስቶስ ለምን ተጠመቀ?` → Amharic why-first answer; sources if DB has `am` verses.
3. `አምስቱ ምሥጢራት ምንድን ናቸው?` → Amharic list of mysteries; verified sources when available.
4. English control: `At what time was Jesus Christ baptized?` → English only.

Record live outputs separately; do not treat pytest green as live multilingual quality sign-off.
