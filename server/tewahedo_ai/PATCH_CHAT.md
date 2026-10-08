# Amharic structured routing patch (Tewahedo AI)

Copy `server/tewahedo_ai/` into the FastAPI service package (or add this repo path
to `PYTHONPATH`) and call it at the top of `POST /api/chat` **before** Ollama/Qwen.

```python
from tewahedo_ai.amharic_text import contains_ethiopic
from tewahedo_ai.amharic_routing import AmharicSearchDeps, resolve_amharic_structured

deps = AmharicSearchDeps(
    search_hymns=lambda q, limit: hymns_search_impl(q, limit),
    search_prayers=lambda q, limit: prayers_search_impl(q, limit),
    search_bible=lambda q, limit: bible_search_impl(q, language="am", limit=limit),
    search_synaxarium=lambda q, limit: synaxarium_search_impl(q, limit),
    calendar_today=lambda: calendar_today_impl(),
    english_structured_chat=lambda msg: existing_english_structured_router(msg),
)

if contains_ethiopic(body.message):
    result = resolve_amharic_structured(body.message, deps)
    if result is not None:
        return result
# ... existing English structured + LLM path unchanged ...
```

Do **not** change `/api/transcribe`.
