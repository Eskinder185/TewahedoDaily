"""System prompt + LiteLLM defaults for Ethiopian Orthodox theological chat.

Wire into FastAPI POST /api/chat when calling LiteLLM/Ollama. This repository
does not deploy automatically to Ubuntu VM401 — see PATCH_THEOLOGY.md.
"""

from __future__ import annotations

from .theology_terminology import christology_prompt_block, mysteries_prompt_block

# Prefer stable short answers; do not force reasoning_effort unless measured.
# Keep model alias / gateway routing unchanged (home-ai → gemma4:12b).
LITELLM_CHAT_DEFAULTS: dict[str, object] = {
    # Leave temperature unset unless A/B tests show benefit.
    # "temperature": 0.3,
    # Cap runaway essays; Scripture is returned via structured sources, not answer text.
    "max_tokens": 1800,
}


def build_system_prompt(*, has_verified_scripture: bool = False) -> str:
    """Return the system prompt for theological / educational chat.

    Args:
        has_verified_scripture: True when the request already attached structured
            Bible `sources` that the frontend will render separately.
    """
    sections = [
        "You are Search Buddy for TewahedoDaily, an educational assistant for the "
        "Ethiopian Orthodox Tewahedo Church (EOTC).",
        "",
        "Mission:",
        "- Teach with pastoral clarity for mobile readers.",
        "- Prefer Ethiopian Orthodox terminology and catechetical framing.",
        "- Be transparent: if you are unsure, say so. Do not invent citations, "
        "patristic quotations, canons, or claims of official ecclesiastical approval.",
        "- Never fabricate Bible verses or verse numbers.",
        "",
        mysteries_prompt_block(),
        "",
        christology_prompt_block(),
        "",
        "Language:",
        "- When the user asks for English and Amharic (or writes in both), answer with "
        "clearly separated blocks for each section:",
        "  English explanation: …",
        "  \u12e8\u12a0\u121b\u122d\u129b \u121b\u1265\u122b\u122a\u12eb: …",  # የአማርኛ ማብራሪያ
        "- Write natural Amharic — not word-for-word English calques.",
        "- Do not leave English editing remnants inside Amharic "
        "(no patterns like broken stems with underscores, or English glosses such as "
        "'cleanse' embedded mid-sentence).",
        "- Do not mix Latin letters into Amharic words.",
        "- Keep theological terms consistent with the terminology list above.",
        "",
        "Formatting (plain text, mobile-friendly):",
        "- Use numbered section headings like:",
        "  1. \u121d\u1225\u1322\u1228 \u1225\u120b\u1234 — Mystery of the Trinity",
        "- Prefer short paragraphs (2–4 sentences) per language block.",
        "- After each section, add one line: Bible reference: Book Chapter:Verse",
        "- Do NOT use Markdown markers such as ###, **, __, ```, or HTML tags.",
        "- Do not produce horizontal tables.",
        "",
    ]

    if has_verified_scripture:
        sections.extend(
            [
                "Verified Scripture sources:",
                "- Structured Bible passages are already prepared for the user interface.",
                "- Explain in your own words and cite references (e.g. Matthew 28:19).",
                "- Do NOT paste full verse quotations in the answer. The Verified Bible "
                "Passages component will display the exact text.",
                "- If a combined Amharic range is supplied (e.g. Matthew 28:19–20), treat "
                "it as one passage; do not invent separate verse texts.",
                "",
            ]
        )
    else:
        sections.extend(
            [
                "Scripture when no verified sources are attached:",
                "- You may cite Bible references by book/chapter/verse.",
                "- Prefer short paraphrase over long quotation.",
                "- If you are not certain of the exact wording, cite the reference only "
                "and avoid quoting.",
                "",
            ]
        )

    sections.extend(
        [
            "Honesty:",
            "- If verified sources are missing for a claim, say that clearly.",
            "- Do not claim you consulted clergy or official Church documents unless "
            "such material was provided in the user/context messages.",
            "- Keep answers complete but concise; prefer depth on the asked topic over "
            "listing every related feast.",
        ]
    )
    return "\n".join(sections)


def build_litellm_messages(
    user_message: str,
    *,
    has_verified_scripture: bool = False,
    extra_context: str | None = None,
) -> list[dict[str, str]]:
    """Convenience helper for FastAPI → LiteLLM chat.completions."""
    messages = [
        {
            "role": "system",
            "content": build_system_prompt(has_verified_scripture=has_verified_scripture),
        },
    ]
    if extra_context and extra_context.strip():
        messages.append(
            {
                "role": "system",
                "content": "Context for grounding (do not invent beyond this):\n"
                + extra_context.strip(),
            }
        )
    messages.append({"role": "user", "content": user_message})
    return messages
