"""Question-first answering helpers for Search Buddy /api/chat.

Pure functions: language selection, question focus, and curated Scripture
lookups for grounding. Does not invent verse text — callers fetch from Supabase.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Literal, Optional, Sequence

ResponseLanguage = Literal["en", "am", "bilingual"]
QuestionFocus = Literal[
    "when",
    "why",
    "where",
    "who",
    "how",
    "what",
    "greeting",
    "identity",
    "other",
]


@dataclass(frozen=True)
class ScriptureLookup:
    book: str
    chapter: int
    verse_start: int
    verse_end: int
    topic: str


_ETHIOPIC_RE = re.compile(r"[\u1200-\u137F]")
_LATIN_WORD_RE = re.compile(r"[A-Za-z]{3,}")

_BILINGUAL_RE = re.compile(
    r"(?:english\s+(?:and|&)\s+amharic|"
    r"amharic\s+(?:and|&)\s+english|"
    r"both\s+languages|"
    r"in\s+english\s+and\s+amharic|"
    r"በእንግሊዝ(?:ኛ)?\s*(?:እና|&)\s*በ?አማርኛ|"
    r"በአማርኛ\s*(?:እና|&)\s*በ?እንግሊዝ)",
    re.IGNORECASE,
)

# Curated topic → passages. Extend carefully; never invent verse text here.
_TOPIC_PASSAGES: Sequence[tuple[re.Pattern[str], Sequence[ScriptureLookup]]] = (
    (
        re.compile(
            r"baptis|baptiz|jordan|timket|ጥምቀት|ዮርዳኖስ|ተጠመቀ|ይጠመቅ|"
            r"\bjesus.*(baptis|baptiz|jordan)|(baptis|baptiz|jordan).*jesus",
            re.IGNORECASE,
        ),
        (
            ScriptureLookup("Matthew", 3, 13, 17, "baptism_of_jesus"),
            ScriptureLookup("Luke", 3, 21, 23, "baptism_of_jesus"),
        ),
    ),
    (
        re.compile(
            r"\btrinity\b|holy\s+trinity|ሥላሴ|ስላሴ|ምሥጢረ\s*ሥላሴ",
            re.IGNORECASE,
        ),
        (ScriptureLookup("Matthew", 28, 19, 19, "trinity"),),
    ),
    (
        re.compile(
            r"incarnation|ሥጋዌ|ስጋዌ|ምሥጢረ\s*ሥጋዌ|word\s+became\s+flesh",
            re.IGNORECASE,
        ),
        (ScriptureLookup("John", 1, 1, 14, "incarnation"),),
    ),
    (
        re.compile(
            r"eucharist|communion|ቁርባን|ቅዱስ\s*ቁርባን|last\s+supper",
            re.IGNORECASE,
        ),
        (ScriptureLookup("Matthew", 26, 26, 28, "eucharist"),),
    ),
    (
        re.compile(
            r"resurrection\s+of\s+the\s+dead|ትንሣኤ\s*ሙታን|"
            r"dead\s+will\s+rise|ምሥጢረ\s*ትንሣኤ",
            re.IGNORECASE,
        ),
        (ScriptureLookup("John", 5, 28, 29, "resurrection_of_the_dead"),),
    ),
)


def contains_ethiopic(text: str) -> bool:
    return bool(_ETHIOPIC_RE.search(text or ""))


def contains_latin_words(text: str) -> bool:
    return bool(_LATIN_WORD_RE.search(text or ""))


def detect_response_language(message: str) -> ResponseLanguage:
    """Choose output language from the user message (not from model output)."""
    text = (message or "").strip()
    if not text:
        return "en"
    if _BILINGUAL_RE.search(text):
        return "bilingual"

    has_am = contains_ethiopic(text)
    has_en = contains_latin_words(text)

    if has_am and not has_en:
        return "am"
    if has_en and not has_am:
        return "en"
    if has_am and has_en:
        # Mixed: prefer Amharic if Ethiopic content dominates word-like spans.
        ethiopic_chars = len(_ETHIOPIC_RE.findall(text))
        latin_chars = len(re.findall(r"[A-Za-z]", text))
        return "am" if ethiopic_chars >= latin_chars else "en"
    return "en"


def classify_question_focus(message: str) -> QuestionFocus:
    text = (message or "").strip()
    lower = text.lower()

    if re.search(
        r"^(hi|hello|hey|good\s+(morning|afternoon|evening)|ሰላም|ታዲያስ)\b",
        lower,
    ) or re.match(r"^ሰላም", text):
        if re.search(r"name|ስም|who\s+are\s+you|ማን\s+ነህ|ማን\s+ነው", text, re.I):
            return "identity"
        return "greeting"

    if re.search(r"who\s+are\s+you|your\s+name|ስምህ|ስምሽ|ማን\s+ነህ", text, re.I):
        return "identity"

    # Time-of-day / chronological "when" (not "when" as relative clause only).
    if re.search(
        r"\b(at\s+what\s+time|what\s+time|what\s+hour|when\s+(?:was|were|did|is|are)|"
        r"how\s+old|age\s+when|በስንት\s*ሰዓት|መቼ|ስንት\s*ዓመት)\b",
        lower,
    ) or re.search(r"(መቼ|በስንት\s*ሰዓት|ስንት\s*ዓመት)", text):
        return "when"

    if re.search(r"\b(why|wherefore|ለምን|ምክንያት)\b", lower) or "ለምን" in text:
        return "why"

    if re.search(r"\b(where|የት|ወዴት)\b", lower) or re.search(r"(የት|ወዴት)", text):
        return "where"

    if re.search(r"\b(who|ማን)\b", lower) or "ማን" in text:
        return "who"

    if re.search(r"\b(how|እንዴት)\b", lower) or "እንዴት" in text:
        return "how"

    if re.search(r"\b(what|which|ምን|ምንድን|ማንኛው)\b", lower) or re.search(
        r"(ምንድን|ምን\s)", text
    ):
        return "what"

    return "other"


def is_five_mysteries_question(message: str) -> bool:
    """Delegates to doctrinal_categories (Five Mysteries ≠ Seven Sacraments)."""
    from doctrinal_categories import is_five_mysteries_question as _is_five

    return _is_five(message)


def is_seven_sacraments_question(message: str) -> bool:
    from doctrinal_categories import is_seven_sacraments_question as _is_seven

    return _is_seven(message)


def classify_doctrinal_category(message: str):
    from doctrinal_categories import classify_doctrinal_category as _classify

    return _classify(message)


def suggest_scripture_lookups(message: str) -> list[ScriptureLookup]:
    """Return curated passage lookups for grounding (no verse text invented)."""
    text = message or ""
    if is_five_mysteries_question(text):
        # Five Mysteries has its own curated list in main.py.
        return []

    found: list[ScriptureLookup] = []
    seen: set[tuple] = set()
    for pattern, passages in _TOPIC_PASSAGES:
        if not pattern.search(text):
            continue
        for item in passages:
            key = (item.book, item.chapter, item.verse_start, item.verse_end)
            if key in seen:
                continue
            seen.add(key)
            found.append(item)
    return found


def build_answering_instructions(
    *,
    language: ResponseLanguage,
    focus: QuestionFocus,
    has_verified_scripture: bool,
) -> str:
    """Dynamic instructions appended for the current user turn."""
    lines: list[str] = [
        "ANSWER FORMAT FOR THIS TURN:",
        "- Answer the user's actual question in the opening sentence.",
        "- Prefer concise, direct answers for factual questions; add brief "
        "supporting context only when it clarifies the answer.",
        "- Do not answer a different question type (e.g. do not answer WHY when "
        "asked WHEN, or WHERE when asked HOW OLD).",
        "- Distinguish historical facts, liturgical commemorations, and "
        "theological interpretation. Label uncertainty when evidence is thin.",
        "- Never invent an exact clock time, calendar date, or verse quotation.",
        "- Ask a clarification question only if ambiguity materially changes "
        "the correct answer.",
    ]

    if language == "en":
        lines.append(
            "- OUTPUT LANGUAGE: English only. Do not add an Amharic translation "
            "unless the user explicitly asked for both languages."
        )
    elif language == "am":
        lines.append(
            "- OUTPUT LANGUAGE: Amharic only (አማርኛ). Do not add an English "
            "translation unless the user explicitly asked for both languages. "
            "Use natural Amharic and standard Ethiopian Orthodox terms."
        )
    else:
        lines.append(
            "- OUTPUT LANGUAGE: Provide clearly labeled English and Amharic "
            "sections (English explanation / የአማርኛ ማብራሪያ). Do not mix "
            "languages inside a single sentence."
        )

    if focus == "greeting":
        lines.append(
            "- This is a greeting. Respond briefly and warmly; offer help with "
            "Ethiopian Orthodox questions."
        )
    elif focus == "identity":
        lines.append(
            "- Identify yourself as the TewahedoDaily Search Buddy educational "
            "assistant. Do not claim to be a priest or to speak with ecclesial authority."
        )
    elif focus == "when":
        lines.extend(
            [
                "- Focus on WHEN / time / age / chronology.",
                "- If the Bible does not specify a clock time of day, say so plainly "
                "in the first sentence.",
                "- If age or ministry timing is attested (e.g. about thirty years old), "
                "cite that distinctly from feast commemorations such as Timket.",
                "- Do not invent a baptism hour or civil date.",
                "- If VERIFIED ETHIOPIAN ORTHODOX CALENDAR FACTS are supplied, open "
                "with those exact Ethiopian and Gregorian dates. Never replace them "
                "with Western feast dates. Do not add the Five Mysteries or unrelated "
                "theology. If the facts say found is false, say so and do not guess.",
            ]
        )
    elif focus == "why":
        lines.extend(
            [
                "- Focus on WHY. State the reason first, then cite supporting Scripture "
                "references (book chapter:verse) without pasting full verse text when "
                "verified sources are shown separately.",
            ]
        )
    elif focus == "where":
        lines.append("- Focus on WHERE (place). Lead with the location.")
    elif focus == "who":
        lines.append("- Focus on WHO. Lead with the person or Persons asked about.")
    elif focus == "how":
        lines.append("- Focus on HOW. Lead with the manner or process asked about.")
    elif focus == "what":
        lines.append("- Focus on WHAT. Define or list what was asked, then briefly explain.")

    if has_verified_scripture:
        lines.append(
            "- Verified Scripture JSON is supplied separately. Cite those references; "
            "do not paste full verse bodies in the answer."
        )
    else:
        lines.append(
            "- No verified Scripture rows were attached for this turn. You may cite "
            "well-known references by book/chapter/verse when confident, but do not "
            "fabricate quotations or claim database verification."
        )

    return "\n".join(lines)


def languages_for_scripture_fetch(language: ResponseLanguage) -> tuple[str, ...]:
    if language == "bilingual":
        return ("en", "am")
    if language == "am":
        return ("am",)
    return ("en",)
