# Theology prompt patch (Tewahedo AI / Ubuntu VM401)

This frontend repository does **not** contain the live FastAPI app on VM401.
Copy these modules into the FastAPI service package (or add this repo’s
`server/` directory to `PYTHONPATH`) and wire them into `POST /api/chat`
**before** calling LiteLLM / Ollama.

## Files to deploy

| File | Role |
|------|------|
| `theology_terminology.py` | Editable EOTC terminology (Five Mysteries, distinctions) |
| `theology_prompt.py` | System prompt builder + optional LiteLLM defaults |
| `answer_quality.py` | Soft checks on AI explanation text only |

Do **not** modify Supabase Bible rows. Verified Scripture must continue to come
from structured `sources[]`.

## Recommended wire-up

```python
from tewahedo_ai.theology_prompt import (
    LITELLM_CHAT_DEFAULTS,
    build_litellm_messages,
)
from tewahedo_ai.answer_quality import check_explanation_quality

# After you retrieve structured Scripture sources for this turn:
has_verified = bool(scripture_sources)

messages = build_litellm_messages(
    user_message,
    has_verified_scripture=has_verified,
    extra_context=optional_rag_snippets,  # or None
)

# Preserve existing model alias routing (e.g. model="home-ai").
# Only merge measured defaults — do not force reasoning_effort unless tested.
payload = {
    "model": "home-ai",
    "messages": messages,
    **LITELLM_CHAT_DEFAULTS,  # currently max_tokens only
}

# ... existing LiteLLM call ...

# Optional: log/flag quality issues; do NOT rewrite sources[].verses[].text
for issue in check_explanation_quality(answer_text):
    logger.warning("theology_quality %s: %s", issue.code, issue.message)
```

## Authorization

Do not deploy to VM401 until an operator explicitly authorizes the change.
Suggested checklist after deploy:

1. Restart the FastAPI unit/service.
2. Ask: “What are the Five Mysteries? Explain in English and Amharic.”
3. Confirm headings use ምሥጢረ ሥላሴ / ምሥጢረ ሥጋዌ / … (not ቅድስያ ልዑል).
4. Confirm the answer cites references but does not paste full verses when
   `sources` include verified passages.
5. Confirm Verified Bible Passages UI still shows exact `verses[].text`.

## Gap: authoritative doctrine library

These modules provide terminology + prompt guidance only. They are **not** a
reviewed catechetical corpus. Recommended next step: maintain an editable
Markdown/JSON doctrine library under clergy review and inject short approved
snippets as `extra_context` when topics match.
